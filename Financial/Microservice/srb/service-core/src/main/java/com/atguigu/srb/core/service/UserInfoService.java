package com.atguigu.srb.core.service;

import com.atguigu.srb.core.pojo.entity.UserInfo;
import com.atguigu.srb.core.pojo.query.UserInfoQuery;
import com.atguigu.srb.core.pojo.vo.LoginVO;
import com.atguigu.srb.core.pojo.vo.RegisterVO;
import com.atguigu.srb.core.pojo.vo.UserIndexVO;
import com.atguigu.srb.core.pojo.vo.UserInfoVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户基本信息 服务类
 * </p>
 *
 * @author Helen
 * @since 2021-02-20
 */
public interface UserInfoService extends IService<UserInfo> {

    /**
     * 注册
     * @param registerVO
     */
    void register(RegisterVO registerVO);

    /**
     * 登录
     * @param loginVO
     * @param ip      用户登录的ip地址
     * @return {@link UserInfoVO}
     */
    UserInfoVO login(LoginVO loginVO, String ip);


    /**
     * 列表页面
     *
     * @param pageParam    页面参数
     * @param userInfoQuery 查询条件
      * @return {@link IPage}<{@link UserInfo}>
     */
    IPage<UserInfo> listPage(Page<UserInfo> pageParam, UserInfoQuery userInfoQuery);

    /**
     * 用户锁定和解锁
     * @param id     id
     * @param status 状态
     */
    void lock(Long id, Integer status);


    /**
     * 校验手机号是否已被注册
     * @param mobile 移动
     * @return boolean
     */
    boolean checkMobile(String mobile);

    /**
     * 得到用户信息
     * @param userId 用户id
     * @return {@link UserIndexVO}
     */
    UserIndexVO getIndexUserInfo(Long userId);

    /**
     * 根据唯一标识获取手机号码
     * @param bindCode
     * @return {@link String}
     */
    String getMobileByBindCode(String bindCode);
}
