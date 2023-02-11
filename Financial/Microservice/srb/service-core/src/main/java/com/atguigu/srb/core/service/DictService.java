package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.dto.ExcelDictDTO;
import com.atguigu.srb.core.pojo.entity.Dict;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.InputStream;
import java.util.List;

/**
 * <p>
 * 数据字典 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface DictService extends IService<Dict> {

    /**
     * 导入数据字典数据
     * @param inputStream 输入流
     */
    void importData(InputStream inputStream);


    /**
     * 导出数据字典数据
     * 获得dict列表数据
     * @return {@link List}<{@link ExcelDictDTO}>
     */
    List<ExcelDictDTO> getListDictData();


    /**
     * 由父id进行查询数据字典列表
     *
     * @param parentId 父id
     * @return {@link List}<{@link Dict}>
     */
    List<Dict> listByParentId(Long parentId);

    /**
     * 通过dict类型代码查询数据字典列表
     * @param dictCode dict类型代码
     * @return {@link List}<{@link Dict}>
     */
    List<Dict> findByDictCode(String dictCode);


    /**
     * 根据父节点的字典代码和value获取类别名称值
     * @param dictCode dict类型代码
     * @param value    价值
     * @return {@link String}
     */
    String getNameByParentDictCodeAndValue(String dictCode, Integer value);
}
