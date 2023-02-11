package com.atguigu.srb.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @aurhor LongJinHua
 * @data 2022-12-16 19:41:21
 **/
@AllArgsConstructor
@Getter
public enum LendItemEnum {


    Default(0, "默认"),
    HAVE_PAID(1, "已支付"),
    PAID_OFF(2, "已还款");


    private Integer status;
    private String message;
}
