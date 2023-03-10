package com.atguigu.srb.oss;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @aurhor LongJinHua
 * @data 2022-11-29 22:07:48
 **/
@SpringBootApplication
@ComponentScan({"com.atguigu.srb", "com.atguigu.common"})
public class ServiceOssApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceOssApplication.class, args);
    }

}