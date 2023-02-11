package com.atguigu.srb.sms.service;

import java.util.Map;

/**
 * @aurhor LongJinHua
 * @data 2022-11-28 21:00:43
 **/
public interface SmsService {


    /**
     * 发送验证码
     * @param mobilePhoneNumber 移动手机号码
     * @param templateCode      短信模板代码
     * @param param             验证码参数
     */
    void send(String mobilePhoneNumber, String templateCode, Map<String, Object> param);

}
