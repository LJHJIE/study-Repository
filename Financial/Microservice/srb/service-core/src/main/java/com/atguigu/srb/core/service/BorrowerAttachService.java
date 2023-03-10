package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.BorrowerAttach;
import com.atguigu.srb.core.pojo.vo.BorrowerAttachVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 借款人上传资源表 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface BorrowerAttachService extends IService<BorrowerAttach> {

    /**
     * 获得借款人附件资料列表
     * @param borrowerId 借款人身份证
     * @return {@link List}<{@link BorrowerAttachVO}>
     */
    List<BorrowerAttachVO> selectBorrowerAttachVOList(Long borrowerId);
}
