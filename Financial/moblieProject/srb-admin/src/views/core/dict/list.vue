<template>
  <div class="app-container">
    <div style="margin-bottom: 10px;">
      <!-- 导入Excel按钮 -->
      <el-button @click="dialogVisible = true" type="primary" size="mini" icon="el-icon-download">
        导入Excel
      </el-button>
      <!-- 导出Excel按钮 -->
      <el-button @click="exportData" type="primary" size="mini" icon="el-icon-upload2">
        导出Excel
      </el-button>
    </div>
    <!-- 上传文件弹窗 -->
    <el-dialog title="数据字典导入" :visible.sync="dialogVisible" width="30%">
      <el-form>
        <el-form-item label="请选择Excel文件">
          <el-upload :auto-upload="true" :multiple="false" :limit="1" :on-exceed="fileUploadExceed"
            :on-success="fileUploadSuccess" :on-error="fileUploadError" :action="BASE_API + '/admin/core/dict/import'"
            name="file"
            accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">
          取消
        </el-button>
      </div>
    </el-dialog>
    <!-- 数据字典列表表格 -->
    <el-table :data="list" border row-key="id" lazy :load="load">
      <el-table-column label="名称" align="left" prop="name" />
      <el-table-column label="编码" prop="dictCode" />
      <el-table-column label="值" align="left" prop="value" />
    </el-table>
  </div>
</template>

<script>
import dictApi from '@/api/core/dict'
export default {
  //定义数据
  data() {
    return {
      dialogVisible: false,  //文件上传对话框状态：是否显示
      BASE_API: process.env.VUE_APP_BASE_API,  //获取后端接口地址
      list: []//数据字典列表
    }
  },
  created() {
    this.fetchData();
  },
  methods: {
    //文件超出个数限制回调
    fileUploadExceed() {
      this.$message.warning("只能选择一个文件");
    },
    //上传成功回调：通信成功
    fileUploadSuccess(response) {
      console.log(response);
      if (response.code === 0) {
        this.$message.success("数据导入成功")
        //数据导入成功后关闭文件上传对话框
        this.dialogVisible = false
        //回调查询数据字典列表方法
        this.fetchData()
      } else {
        this.$message.error(response.message)
      }
    },
    // 上传失败回调
    fileUploadError(err) {
      this.$message.error("数据导入失败")
    },
    // Excel数据导出
    exportData() {
      window.location.href = this.BASE_API + '/admin/core/dict/export'
    },
    //查询数据字典列表
    fetchData() {
      dictApi.listByParentId(1).then(response => {
        this.list = response.data.list
      })
    },
    // 延迟加载子节点数据
    load(tree, treeNode, resolve) {
      dictApi.listByParentId(tree.id).then(response => {
        //resolve()；负责将子节点数据展示在展开的列表中  
        resolve(response.data.list)
      })
    }
  },
}
</script>

<style scoped>

</style>