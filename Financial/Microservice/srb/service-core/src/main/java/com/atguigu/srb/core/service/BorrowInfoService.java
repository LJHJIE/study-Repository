package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.BorrowInfo;
import com.atguigu.srb.core.pojo.vo.BorrowInfoApprovalVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 借款信息表 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface BorrowInfoService extends IService<BorrowInfo> {

    /**
     * 得到借款额度
     * @param userId 用户id
     * @return {@link BigDecimal}
     */
    BigDecimal getBorrowAmount(Long userId);

    /**
     * 保存借款申请信息
     * @param borrowInfo 借信息
     * @param userId     用户id
     */
    void saveBorrowInfo(BorrowInfo borrowInfo, Long userId);

    /**
     * 根据用户id获取用户借款状态
     * @param userId 用户id
     * @return {@link Integer}
     */
    Integer getStatusByUserId(Long userId);

    /**
     * 查询借款信息列表
     * @return {@link List}<{@link BorrowInfo}>
     */
    List<BorrowInfo> selectList();

    /**
     * 获取借款信息
     * @param id id
     * @return {@link Map}<{@link String}, {@link Object}>
     */
    Map<String, Object> getBorrowInfoDetail(Long id);


    /**
     * 借款信息审批
     * @param borrowInfoApprovalVO 借信息批准签证官
     */
    void approval(BorrowInfoApprovalVO borrowInfoApprovalVO);
}

