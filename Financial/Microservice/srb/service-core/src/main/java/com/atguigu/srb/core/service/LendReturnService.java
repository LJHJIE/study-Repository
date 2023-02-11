package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.LendReturn;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 还款记录表 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface LendReturnService extends IService<LendReturn> {

    /**
     * 根据标的id查询还款列表
     *
     * @param lendId 标的id
     * @return {@link List}<{@link LendReturn}>
     */
    List<LendReturn> selectByLendId(Long lendId);

    /**
     * 提交还款请求
     * @param lendReturnId 标的还款id
     * @param userId       用户id
     * @return {@link String}
     */
    String commitReturn(Long lendReturnId, Long userId);

    /**
     * 还款成功异步通知
     * @param paramMap
     */
    void notify(Map<String, Object> paramMap);


    /**
     * 根据用户id查询还款列表
     * @param userId 用户id
     * @return {@link List}<{@link LendReturn}>
     */
    List<LendReturn> selectLendReturnListByUserId(Long userId);
}
