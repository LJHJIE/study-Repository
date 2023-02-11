package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.LendItem;
import com.atguigu.srb.core.pojo.vo.InvestVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 标的出借记录表 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface LendItemService extends IService<LendItem> {

    /**
     * 提交投资信息
     * @param investVO
     * @return {@link String}
     */
    String commitInvest(InvestVO investVO);

    /**
     * 投资成功异步通知
     * @param paramMap 参数映射
     */
    void notify(Map<String, Object> paramMap);

    /**
     * 根据标的id和标的状态查询投资列表
     * @param lendId     lendId
     * @param status 状态
     * @return {@link List}<{@link LendItem}>
     */
    List<LendItem> selectByLendId(Long lendId, int status);


    /**
     * 根据标的id查询标的投资列表
     * @param lendId 提供身份证
     * @return {@link List}<{@link LendItem}>
     */
    List<LendItem> selectByLendId(Long lendId);

    /**
     * 根据用户id查询标的投资列表
     * @param userId 用户id
     * @return {@link List}<{@link LendItem}>
     */
    List<LendItem> selectLendItemListByInvestUserId(Long userId);
}
