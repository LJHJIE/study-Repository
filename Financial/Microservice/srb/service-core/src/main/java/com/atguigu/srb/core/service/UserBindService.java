package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.UserBind;
import com.atguigu.srb.core.pojo.vo.UserBindVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 用户绑定表 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface UserBindService extends IService<UserBind> {

    /**
     * 账户绑定提交到托管平台的数据
     */
    String commitBindUser(UserBindVO userBindVO, Long userId);


    /**
     * 账号绑定完成后回调
     * @param paramMap
     */
    void notify(Map<String, Object> paramMap);

    /**
     * 根据用户id查询绑定协议号
     * @param userId 用户id
     * @return {@link String}
     */
    String getBindCodeByUserId(Long userId);
}
