package com.atguigu.srb.sms.controller.api;

import com.atguigu.common.exception.Assert;
import com.atguigu.common.result.R;
import com.atguigu.common.result.ResponseEnum;
import com.atguigu.common.util.RandomUtils;
import com.atguigu.common.util.RegexValidateUtils;
import com.atguigu.srb.sms.client.CoreUserInfoClient;
import com.atguigu.srb.sms.service.SmsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @aurhor LongJinHua
 * @data 2022-11-28 22:52:27
 **/
@RestController
@RequestMapping("/api/sms")
@Api(tags = "短信管理")
//@CrossOrigin //跨域
@Slf4j
public class ApiSmsController {

    @Resource
    private CoreUserInfoClient coreUserInfoClient;

    @Resource
    private SmsService smsService;

    @Resource
    private RedisTemplate redisTemplate;

    @ApiOperation("获取验证码")
    @GetMapping("/send/{mobilePhoneNumber}")
    public R send(@ApiParam(value = "手机号码", required = true)
                  @PathVariable String mobilePhoneNumber) {
        //首先校验手机号码是否为空
        Assert.notEmpty(mobilePhoneNumber, ResponseEnum.MOBILE_NULL_ERROR);
        //然后校验手机号码是否合法
        Assert.isTrue(RegexValidateUtils.checkCellphone(mobilePhoneNumber), ResponseEnum.MOBILE_ERROR);

        //校验手机号是否已被注册
        boolean result = coreUserInfoClient.checkMobile(mobilePhoneNumber);
        log.info("result = " + result);
        Assert.isTrue(result == false, ResponseEnum.MOBILE_EXIST_ERROR);
        //生成六位数字的验证码
        String code = RandomUtils.getSixBitRandom();
        //组装短信模板参数
        Map<String, Object> map = new HashMap<>();
        map.put("code", code);
        //发送短信
//        smsService.send(mobilePhoneNumber, SmsProperties.TEMPLATE_CODE, map);
        //将验证码存入redis中，并设置超过时间【单位为：分钟】
        redisTemplate.opsForValue().set("srb:sms:code:" + mobilePhoneNumber, code, 5, TimeUnit.MINUTES);
        return R.ok().message("短信验证码发送成功");
    }
}
