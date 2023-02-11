<template>
    <div class="app-container">
        <!-- 输入表单 -->
        <el-form label-width="120px">
            <el-form-item label="借款额度">
                <el-input-number v-model="integralGrade.borrowAmount" :min="0" />
            </el-form-item>
            <el-form-item label="积分区间开始">
                <el-input-number v-model="integralGrade.integralStart" :min="0" />
            </el-form-item>
            <el-form-item label="积分区间结束">
                <el-input-number v-model="integralGrade.integralEnd" :min="0" />
            </el-form-item>
            <el-form-item>
                <el-button :disabled="saveBtnDisabled" type="primary" @click="saveOrUpdate()">
                    保存
                </el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
import integralGradeApi from '@/api/core/integral-grade'
export default {
    data() {
        return {
            saveBtnDisabled: false,//禁用提交按钮，防止用户重复提交。
            integralGrade: {} //积分等级对象
        }
    },
    methods: {
        //保存或者更新
        saveOrUpdate() {
            this.saveBtnDisabled = true
            //当积分对象不存在id的时候就调用新增接口，反之则调用更新接口
            if (!this.integralGrade.id) {
                //调用新增
                this.saveData()
            } else {
                //调用更新
                this.updateData()
            }

        },
        //根据id查询数据
        fetchDataById(id) {
            integralGradeApi.getById(id).then(response => {
                this.integralGrade = response.data.record;
            })
        },
        //新增
        saveData() {
            integralGradeApi.save(this.integralGrade).then(response => {
                this.$message.success(response.message)
                this.$router.push('/core/integral-grade/list')
            })
        },
        //修改
        updateData() {
            integralGradeApi.updateById(this.integralGrade).then(response => {
                this.$message.success(response.message)
                this.$router.push('/core/integral-grade/list')
            })
        }
    },
    created() {
        //当局部路由对象中存在id属性的时候，就是回显表单，需要调用回显数据的接口
        if (this.$route.params.id) {
            this.fetchDataById(this.$route.params.id);
        }
    },
}
</script>

<style scoped>

</style>