<template>
  <ul>
    <li :class="{ 'pleft-cur': $route.fullPath === '/user' }">
      <span>
        <NuxtLink to="/user"> <i class="dot dot1"></i>账户总览</NuxtLink>
      </span>
    </li>
    <li :class="{ 'pleft-cur': $route.fullPath === '/user/fund' }">
      <span>
       
        <NuxtLink to="/user/fund">
          <i class="dot dot06"></i>资金记录
        </NuxtLink>
      </span>
    </li>
    <li :class="{ 'pleft-cur': $route.fullPath === '/user/invest' }">
      <span>
        <NuxtLink to="/user/invest">
          <i class="dot dot05"></i>借款记录
        </NuxtLink>
      </span>
    </li>
    <li :class="{ 'pleft-cur': $route.fullPath === '/user/payment' }">
      <span>
        <NuxtLink  to="/user/payment">
          <i class="dot dot08"></i>还款计划
        </NuxtLink>
      </span>
    </li>
    <li :class="{ 'pleft-cur': $route.fullPath === '/user/recharge' }">
      <span>
        <NuxtLink to="/user/recharge">
          <i class="dot dot03"></i>充值</NuxtLink>
          </span>
    </li>
    <li :class="{ 'pleft-cur': $route.fullPath === '/user/withdraw' }">
      <span>
        <NuxtLink to="/user/withdraw">
          <i class="dot dot04"></i>提现</NuxtLink>
          </span>
    </li>
  </ul>
</template>

<script>
export default {}
</script>
