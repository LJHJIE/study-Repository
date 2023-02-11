<template>
    <div>
        <NuxtLink to="/about">
            关于我们
        </NuxtLink>
        <NuxtLink to="/lend">
            我要投资
        </NuxtLink>
        <NuxtLink to="/user">
            用户中心
        </NuxtLink>
        <a href="http://atguigu.com" target="_blank">尚硅谷</a>

        <h1>Home page</h1>
        <span>您的ip地址是：{{ message }}</span>
    </div>
</template>

<script>
export default {
    //服务器端渲染
    async asyncData({ $axios }) {
        console.log('asyncData')
        let response = await $axios.$get('/')
        return {
            message: response,
        }
    },
    data() {
        return {
            ip: null,
        }
    },
    //客户端渲染
    created() {
        //这种直接get的方法会携带http请求对象
        // this.$axios.get('http://icanhazip.com').then(res=>{
        //     console.log(res)
        //     this.ip = res.data
        // })

        //而 $get会直接返回http请求对象中的数据【data】，可以简化开发，提高开发的效率。
        this.$axios.$get('http://icanhazip.com').then(res => {
            console.log(res)
            this.ip = res
        })

    },
}
</script>