package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.LendItemReturn;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 标的出借回款记录表 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface LendItemReturnService extends IService<LendItemReturn> {

    /**
     * 根据标的id和用户id查询回款计划
     * @param lendId 标的id
     * @param userId 用户id
     * @return {@link List}<{@link LendItemReturn}>
     */
    List<LendItemReturn> selectByLendId(Long lendId, Long userId);

    /**
     * 添加回款明显
     * @param lendReturnId 标的还款id
     * @return {@link List}<{@link Map}<{@link String}, {@link Object}>>
     */
    List<Map<String, Object>> addReturnDetail(Long lendReturnId);


    /**
     * 根据还款id获取对应的回款计划列表
     * @param lendReturnId 标的还款id
     * @return {@link List}<{@link LendItemReturn}>
     */
    List<LendItemReturn> selectLendItemReturnList(Long lendReturnId);

    /**
     * 根据用户id获取对应的回款计划列表
     * @param userId 用户id
     * @return {@link List}<{@link LendItemReturn}>
     */
    List<LendItemReturn> selectLendItemReturnListByInvestUserId(Long userId);
}
