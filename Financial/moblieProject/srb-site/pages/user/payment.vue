<template>
    <div class="personal-main">
        <div class="personal-money">
            <h3 v-if="userType == 1"><i>回款计划</i></h3>
            <h3 v-else><i>还款计划</i></h3>

            <div class="personal-moneylist" style="margin-top: 40px;">
                <div class="pmain-contitle">
                    <!-- 回款计划 -->
                    <div v-if="userType == 1">
                        <span class="pmain-title1 fb" style="width: 150px;">
                            回款时间
                        </span>
                        <span class="pmain-title2 fb" style="width: 80px;">
                            本金
                        </span>
                        <span class="pmain-title3 fb" style="width: 80px;">
                            年化利率
                        </span>
                        <span class="pmain-title3 fb" style="width: 80px;">
                            利息
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            本息
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            当前期数
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            是否逾期
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            手续费
                        </span>
                    </div>
                    <!-- 还款计划 -->
                    <div v-if="userType == 2">
                        <span class="pmain-title1 fb" style="width: 150px;">
                            还款日期
                        </span>
                        <span class="pmain-title2 fb" style="width: 100px;">
                            还款期数
                        </span>
                        <span class="pmain-title2 fb" style="width: 100px;">
                            应还本金(元)
                        </span>
                        <span class="pmain-title2 fb" style="width: 100px;">
                            应还利息(元)
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            状态
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            是否逾期
                        </span>
                        <span class="pmain-title3 fb" style="width: 100px;">
                            是否逾期
                        </span>
                    </div>

                </div>
                <ul>
                    <!-- 遍历回款计划 -->
                    <li v-for="itemReturn in itemReturnList" :key="itemReturn.id" style="width:100%"
                        v-if="userType == 1">
                        <span class="pmain-title1 pmain-height" style="width: 150px;">
                            {{ itemReturn.realReturnTime }}
                        </span>
                        <span class="pmain-title2 pmain-height" style="width: 80px;">
                            {{ itemReturn.principal }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 80px;">
                            {{ itemReturn.lendYearRate * 100 }} %
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 80px;">
                            {{ itemReturn.interest }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ itemReturn.realAmount }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ itemReturn.total }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            第{{ itemReturn.currentPeriod }}期
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ itemReturn.overdue ? "已逾期" : "未逾期" }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ itemReturn.fee }}
                        </span>
                    </li>

                    <!-- 遍历还款计划 -->
                    <li v-for="lendReturn in lendReturnList" :key="lendReturn.id" style="width:100%"
                        v-if="userType == 2">
                        <span class="pmain-title1 pmain-height" style="width: 150px;">
                            {{ lendReturn.realReturnTime == null ? "暂未还款日期" : lendReturn.realReturnTime }}
                        </span>
                        <span class="pmain-title2 pmain-height" style="width: 105px;">
                            {{ lendReturn.currentPeriod }}期
                        </span>
                        <span class="pmain-title2 pmain-height" style="width: 105px;">
                            {{ lendReturn.principal }}
                        </span>
                        <span class="pmain-title2 pmain-height" style="width: 100px;">
                            {{ lendReturn.interest }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ lendReturn.status ? "已还款" : "未还款" }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 100px;">
                            {{ lendReturn.overdue ? "已逾期" : "未逾期" }}
                        </span>
                        <span class="pmain-title3 pmain-height" style="width: 115px;" v-if="lendReturn.status == 0">
                            <!-- 还款按钮 -->
                            <el-button type="primary" round size="mini">
                                <Nuxt-link  :to="'/lend/'+lendReturn.lendId" target="_blank" style="color: white;text-decoration: none;">立即还款</Nuxt-link>
                            </el-button>
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
            itemReturnList: [],//回款记录列表
            lendReturnList: [],//还款记录列表
            userType: 0, //用户类型
        }
    },

    created() {
        this.fetchItemReturnList()
        this.fetchUserType();
        this.fetchLendReturnList();
    },

    methods: {
        //获取回款记录列表
        fetchItemReturnList() {
            this.$axios.$get('/api/core/lendItemReturn/auth/itemReturnList').then((response) => {
                this.itemReturnList = response.data.itemReturnList
            })
        },
        //获取还款记录列表
        fetchLendReturnList() {
            this.$axios.$get('api/core/lendReturn/returnList').then((response) => {
                this.lendReturnList = response.data.returnList
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
  