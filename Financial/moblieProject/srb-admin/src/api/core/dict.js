import request from '@/utils/request'

export default {
    //根据上级节点id查询数据字典列表  
    listByParentId(parentId) {
        return request({
            url: `/admin/core/dict/listByParentId/${parentId}`,
            method: 'get'
        })
    }
}