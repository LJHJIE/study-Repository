<template>
  <!--注册-->
  <div class="wrap">
    <div v-if="step === 1" class="tdbModule register">
      <div class="registerTitle">注册账户</div>
      <div class="registerLc1">
        <p class="p1">填写账户信息</p>
        <p class="p2">注册成功</p>
      </div>

      <div class="registerCont">
        <ul>
          <li>
            <span class="dis"></span>
            <input v-model="userInfo.userType" type="radio" value="1" />
            我要投资
            <input v-model="userInfo.userType" type="radio" value="2" />
            我要借钱
          </li>
          <li class="telNumber">
            <span class="dis">手机号码</span>
            <input class="input" v-model="userInfo.mobile" />
            <button v-if="!sending" class="button" @click="send()">
              获取验证码
            </button>
            <button v-else disabled class="button disabled">
              {{ leftSecond }}秒后重发
            </button>
          </li>

          <li>
            <span class="dis">短信验证码</span>
            <input class="input" v-model="userInfo.code" />
            <span class="info">
              请输入验证码
            </span>
          </li>

          <li>
            <span class="dis">密码</span>
            <input type="password" v-model="userInfo.password" class="input" />
            <span class="info">
              6-24个字符，英文、数字组成，区分大小写
            </span>
          </li>

          <li class="agree">
            <input type="checkbox" checked />
            我同意《<NuxtLink to="#" target="_black">尚融宝注册协议</NuxtLink>》
            <span>请查看协议</span>
          </li>
          <li class="btn">
            <button @click="register()">
              下一步
            </button>
          </li>
        </ul>
      </div>
    </div>

    <div v-if="step === 2" class="tdbModule register">
      <div class="registerTitle">注册账户</div>
      <div class="registerLc2">
        <p class="p1">填写账户信息</p>
        <p class="p2">注册成功</p>
      </div>
      <div class="registerCont">
        <ul>
          <li class="scses">
            {{ this.userInfo.mobile }} 恭喜您注册成功！
            <NuxtLink class="blue" to="/login">
              请登录
            </NuxtLink>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import '~/assets/css/register.css'
export default {
  data() {
    return {
      step: 1, //注册步骤
      userInfo: {
        userType: 1,
      },
      sending: false, // 是否发送验证码
      second: 60, // 倒计时间
      leftSecond: 0, //剩余时间
    }
  },

  methods: {
    //发短信
    send() {
      //首先判断手机号码不能为空
      if (!this.userInfo.mobile) {
        this.$message.error("请输入手机号码")
        return
      }
      //防止重复提交
      if (this.sending) return
      // this.sending = true
      
      //远程调用发送短信的接口
      this.$axios.$get('/api/sms/send/' + this.userInfo.mobile).then(response => {
        
        this.sending = true
        //进入计时器
        this.timeDown();
        this.$message.success(response.message)
      })
    },

    //倒计时
    timeDown() {
      //首先将倒计时间赋值给剩余时间
      this.leftSecond = this.second;
      let time = setInterval(() => {
        //剩余时间自减
        this.leftSecond--;
        //当剩余时间小于或者等于0秒的时候停止定时器
        if (this.leftSecond <= 0) {
          //停止计时器
          clearInterval(time)
          //还原剩余时间
          this.leftSecond = this.second
          //还原按钮状态
          this.sending = false
        }
      }, 1000)
    },

    //注册
    register() {
      //首先判断手机号码不能为空
      if (!this.userInfo.mobile) {
        this.$message.error("请输入手机号码")
        return
      }
      this.$axios.$post('/api/core/userInfo/register', this.userInfo)
        .then(response => {
          //注册成功后来到第二步【登录】
          this.step = 2
        })
    },
  },
}
</script>
