<template>
    <div class="personal-main">
        <div class="personal-money">
            <h3 v-if="userType == 1"><i>投资记录</i></h3>
            <h3 v-if="userType == 2"><i>借款记录</i></h3>

            <div class="personal-moneylist" style="margin-top: 40px;">
                <div class="pmain-contitle">
                    <div v-if="userType == 1">
                        <!-- 投资列表表头 -->
                        <span class="pmain-title1 fb" style="width: 150px;">
                            投资时间
                        </span>
                        <span class="pmain-title2 fb" style="width: 70px;">
                            投资金额
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            年化利率
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            预期收益
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            实际收益
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            开始日期
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            结束日期
                        </span>
                    </div>
                    <!-- 还款列表表头 -->
                    <div v-if="userType == 2">
                        <span class="pmain-title1 fb" style="width: 150px;">
                            标题
                        </span>
                        <span class="pmain-title2 fb" style="width: 100px;">
                            借款金额(元)
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            年化利率
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            已借到（元）
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            投资人数
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            借款留言
                        </span>
                    </div>
                </div>

                <ul>
                    <!-- 遍历投资列表 -->
                    <li v-for="lendItem in lendItemList" :key="lendItem.id" style="width:100%" v-if="userType == 1">
                        <span class="pmain-title1 pmain-height" style="width: 150px;">
                            {{ lendItem.investTime }}
                        </span>
                        <span class="pmain-title2 pmain-height" style="width: 70px;">
                            {{ lendItem.investAmount }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ lendItem.lendYearRate * 100 }} %
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ lendItem.expectAmount }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ lendItem.realAmount }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ lendItem.lendStartDate }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ lendItem.lendEndDate }}
                        </span>
                        
                    </li>

                    <!-- 遍历借款列表 -->
                    <li v-for="lend in lendList" :key="lend.id" style="width:100%" v-if="userType == 2">
                        <span class="pmain-title1 pmain-height" style="width: 150px;">
                            {{ lend.title }}
                        </span>

                        <span class="pmain-title3 pmain-height" style="width: 70px;">
                            {{ lend.amount }}
                        </span>

                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ lend.lendYearRate * 100 }} %
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ lend.investAmount }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 110px;">
                            {{ lend.investNum }}人
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 200px;">
                            {{ lend.lendInfo }}
                        </span>
                    </li>
                </ul>

            </div>


        </div>
    </div>
</template>
  
<script>
import cookie from 'js-cookie'

export default {
    data() {
        return {
            lendItemList: [],//投资列表
            lendList: [],//借款列表
            userType: 0, //用户类型
        }
    },
    mounted() {
        this.fetchLendItemList()
        this.fetchLendList()
        this.fetchUserType()
    },
    methods: {
        //投资记录
        fetchLendItemList() {

            this.$axios.$get('/api/core/lendItem/itemList').then((response) => {
                this.lendItemList = response.data.itemList
            })
        },
        //借款记录
        fetchLendList() {
            this.$axios.$get('/api/core/lend/lendList').then((response) => {
                this.lendList = response.data.lendList
            })
        },
        //获取登录人的用户类型
        fetchUserType() {
            let userInfo = cookie.get('userInfo');
            if (userInfo) {
                userInfo = JSON.parse(userInfo);
                // console.log('cookie中的用户信息', userInfo)
                this.userType = userInfo.userType
            }
        },
    },
}
</script>
  