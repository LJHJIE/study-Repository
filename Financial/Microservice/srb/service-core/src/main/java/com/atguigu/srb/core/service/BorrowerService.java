package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.Borrower;
import com.atguigu.srb.core.pojo.vo.BorrowerApprovalVO;
import com.atguigu.srb.core.pojo.vo.BorrowerDetailVO;
import com.atguigu.srb.core.pojo.vo.BorrowerVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 借款人 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface BorrowerService extends IService<Borrower> {

    /**
     * 保存借款人信息
     * @param borrowerVO 借款人签证官
     * @param userId     用户id
     */
    void saveBorrowerVOByUserId(BorrowerVO borrowerVO, Long userId);

    /**
     * 根据用户id查询状态
     * @param userId 用户id
     * @return {@link Integer}
     */
    Integer getStatusByUserId(Long userId);

    /**
     * 借款人信息列表页面
     * @param pageParam 页面参数
     * @param keyword   关键字
     * @return {@link IPage}<{@link Borrower}>
     */
    IPage<Borrower> listPage(Page<Borrower> pageParam, String keyword);

    /**
     * 根据id获取借款人信息
     * @param id
     * @return
     */
    BorrowerDetailVO getBorrowerDetailVOById(Long id);

    /**
     * 审批借款人信息
     * @param borrowerApprovalVO 借款人同意签证官
     */
    void approval(BorrowerApprovalVO borrowerApprovalVO);
}

