package com.atguigu.srb.core.service.impl;

import com.alibaba.excel.EasyExcel;
import com.atguigu.srb.core.listener.ExcelDictDTOListener;
import com.atguigu.srb.core.mapper.DictMapper;
import com.atguigu.srb.core.pojo.dto.ExcelDictDTO;
import com.atguigu.srb.core.pojo.entity.Dict;
import com.atguigu.srb.core.service.DictService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 数据字典 服务实现类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
@Service
@Slf4j
public class DictServiceImpl extends ServiceImpl<DictMapper, Dict> implements DictService {

    @Resource
    private RedisTemplate redisTemplate;

    //如果事务不成功，则全部回滚。
    @Transactional(rollbackFor = {Exception.class})
    @Override
    public void importData(InputStream inputStream) {
        EasyExcel.read(inputStream, ExcelDictDTO.class, new ExcelDictDTOListener(baseMapper)).sheet().doRead();
    }

    @Override
    public List<ExcelDictDTO> getListDictData() {
        //获取Dict集合
        List<Dict> dictList = baseMapper.selectList(null);
        //创建ExcelDictDTO列表，将Dict列表转换成ExcelDictDTO列表,并将ExcelDictDTO列表的长度设置为Dict列表的长度
        List<ExcelDictDTO> excelDictDTOList = new ArrayList<>(dictList.size());
        //遍历Dict列表
        dictList.forEach(dict -> {
            //创建ExcelDictDTO对象
            ExcelDictDTO excelDictDTO = new ExcelDictDTO();
            //将Dict对象中的属性值拷贝到ExcelDictDTO对象中 ；
            //第一个参数为需要拷贝的对象，第二个参数为接收拷贝的属性值对象
            BeanUtils.copyProperties(dict, excelDictDTO);
            excelDictDTOList.add(excelDictDTO);
        });
        return excelDictDTOList;
    }

    @Override
    public List<Dict> listByParentId(Long parentId) {

        //定义数据字典列表
        List<Dict> dictList = null;
        try {
            //首先从redis中获取存储的数据列表
            dictList = (List<Dict>) redisTemplate.opsForValue().get("srb:core:dictList:" + parentId);
            if (dictList != null) {
                log.info("从redis中取值....");
                //如果redis存在数据，就直接从redis中返回数据列表
                return dictList;
            }
        } catch (Exception e) {
            log.error("redis中取值异常：" + ExceptionUtils.getStackTrace(e)); //此处不抛出异常，继续执行后面的代码
        }

        log.info("从数据库中取值....");
        dictList = baseMapper.selectList(new QueryWrapper<Dict>().eq("parent_id", parentId));
        //遍历dict列表
        dictList.forEach(dict -> {
            //如果有子节点，则为true
            boolean hasChildren = this.hasChildrenData(dict.getId());
            dict.setHasChildren(hasChildren);
        });
        //将数据存入redis，并设置过期时间为5分钟。
        try {
            redisTemplate.opsForValue().set("srb:core:dictList:" + parentId, dictList, 5, TimeUnit.MINUTES);
            log.info("数据存入redis...");
        } catch (Exception e) {
            log.error("redis中存值异常：" + ExceptionUtils.getStackTrace(e)); //此处不抛出异常，继续执行后面的代码
        }
        //返回集合数据
        return dictList;
    }

    @Override
    public List<Dict> findByDictCode(String dictCode) {
        Dict dict = baseMapper.selectOne(new QueryWrapper<Dict>().eq("dict_code", dictCode));
        return this.listByParentId(dict.getId());

    }

    @Override
    public String getNameByParentDictCodeAndValue(String dictCode, Integer value) {
        QueryWrapper<Dict> dictQueryWrapper = new QueryWrapper<>();
        dictQueryWrapper.eq("dict_code", dictCode);
        Dict parentDict = baseMapper.selectOne(dictQueryWrapper);
        if (parentDict == null) {
            return "";
        }
        dictQueryWrapper = new QueryWrapper<Dict>()
                .eq("parent_id", parentDict.getId())
                .eq("value", value);
        Dict dict = baseMapper.selectOne(dictQueryWrapper);
        if (dict == null) {
            return "";
        }
        return dict.getName();
    }

    /**
     * 判断该节点是否有子节点
     */
    public boolean hasChildrenData(Long id) {
        QueryWrapper<Dict> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("parent_id", id);
        Integer count = baseMapper.selectCount(queryWrapper);
        if (count.intValue() > 0) {
            return true;
        }
        return false;
    }
}
