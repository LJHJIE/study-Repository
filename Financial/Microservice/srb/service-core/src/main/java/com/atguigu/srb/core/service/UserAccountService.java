package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.UserAccount;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;
import java.util.Map;

/**
 * <p>
 * 用户账户 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface UserAccountService extends IService<UserAccount> {


    /**
     * 提交用户充值金额
     * @param chargeAmt 充值金额
     * @param userId    用户id
     * @return {@link String}
     */
    String commitChargeAmt(BigDecimal chargeAmt, Long userId);


    /**
     * 充值成功异步通知
     * @param paramMap 参数映射
     * @return {@link String}
     */
    String notify(Map<String, Object> paramMap);


    /**
     * 获得账户余额
     * @param userId 用户id
     * @return {@link BigDecimal}
     */
    BigDecimal getAccount(Long userId);

    /**
     * 用户提现
     * @param fetchAmt 提现金额
     * @param userId   用户id
     * @return {@link String}
     */
    String commitWithdraw(BigDecimal fetchAmt, Long userId);

    /**
     * 提现成功通知取消重试
     * @param paramMap 参数映射
     */
    void notifyWithdraw(Map<String, Object> paramMap);
}

