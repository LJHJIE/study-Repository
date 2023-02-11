package com.atguigu.srb.sms.client;

import com.atguigu.srb.sms.client.fallback.CoreUserInfoClientFallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @aurhor LongJinHua
 * @data 2022-12-05 19:46:05
 **/
@FeignClient(value = "service-core", fallback = CoreUserInfoClientFallback.class) //指定需要消费【调用】的服务
public interface CoreUserInfoClient {


    //指定服务的方法
    @GetMapping("/api/core/userInfo/checkMobile/{mobile}")
    boolean checkMobile(@PathVariable String mobile);


}
