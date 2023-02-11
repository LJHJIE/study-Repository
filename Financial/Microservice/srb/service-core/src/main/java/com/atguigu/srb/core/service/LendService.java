package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.BorrowInfo;
import com.atguigu.srb.core.pojo.entity.Lend;
import com.atguigu.srb.core.pojo.vo.BorrowInfoApprovalVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 标的准备表 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface LendService extends IService<Lend> {


    /**
     * 创建标的
     * @param borrowInfoApprovalVO
     * @param borrowInfo
     */
    void createLend(BorrowInfoApprovalVO borrowInfoApprovalVO, BorrowInfo borrowInfo);

    /**
     * 标的列表
     * @return {@link List}<{@link Lend}>
     */
    List<Lend> selectList();


    /**
     * 获得标的详情
     * @param id id
     * @return {@link Map}<{@link String}, {@link Object}>
     */
    Map<String, Object> getLendDetail(Long id);



    /**
     * @param invest 投资金额
     * @param yearRate 年利率
     * @param totalMonth 期数
     * @param returnMethod 还款方式
     * @return {@link BigDecimal}
     */
    BigDecimal getInterestCount(BigDecimal invest, BigDecimal yearRate, Integer totalMonth, Integer returnMethod);


    /**
     * 满标放款
     *
     * @param lendId lendId
     */
    void makeLoan(Long lendId);

    /**
     * 根据用户id获取用户的标的列表
     * @param userId 用户id
     * @return {@link List}<{@link Lend}>
     */
    List<Lend> selectLendListByUserId(Long userId);
}
