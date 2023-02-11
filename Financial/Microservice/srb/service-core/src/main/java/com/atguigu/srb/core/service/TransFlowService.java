package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.bo.TransFlowBO;
import com.atguigu.srb.core.pojo.entity.TransFlow;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 交易流水表 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface TransFlowService extends IService<TransFlow> {

    /**
     * 保存交易流水信息
     * @param transFlowBO
     */
    void saveTransFlow(TransFlowBO transFlowBO);

    /**
     * 判断交易流水信息是否存在
     * @param agentBillNo
     * @return boolean
     */
    boolean isSaveTransFlow(String agentBillNo);

    /**
     * 根据用户id查询交易流水
     * @param userId 用户id
     * @return {@link List}<{@link TransFlow}>
     */
    List<TransFlow> selectByUserId(Long userId);
}
