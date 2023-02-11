<template>
  <div>
    <!-- 公共头部 -->
    <app-header />
    <!-- 占位符 -->
    <Nuxt />
    <!-- 公共底部 -->
    <AppFooter />
  </div>
</template>
<script>
import '~/assets/css/common.css'
import AppHeader from '~/components/AppHeader'
import AppFooter from '~/components/AppFooter'

export default {
  components: {
    AppHeader,
    AppFooter,
  },
}
</script>
