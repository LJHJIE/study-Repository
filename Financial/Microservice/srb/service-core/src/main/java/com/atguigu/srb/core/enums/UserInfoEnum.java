package com.atguigu.srb.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @aurhor LongJinHua
 * @data 2022-12-16 17:43:01
 **/
@Getter
@AllArgsConstructor
public enum UserInfoEnum {

    USER_INFO_ROLE(0, "无角色，用户未注册"),
    USER_INFO_INVESTOR(1, "投资人"),
    USER_INFO_BORROWER(2, "借款人");

    private Integer status;
    private String message;
}
