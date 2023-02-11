package com.atguigu.srb.core.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.atguigu.srb.core.mapper.DictMapper;
import com.atguigu.srb.core.pojo.dto.ExcelDictDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;

/**
 * @aurhor LongJinHua
 * @data 2022-11-26 12:22:27
 **/
@Slf4j
@AllArgsConstructor
public class ExcelDictDTOListener extends AnalysisEventListener<ExcelDictDTO> {

    private DictMapper dictMapper;

    /**
     * 每隔5条存储数据库，实际使用中可以3000条，然后清理list ，方便内存回收。
     */
    private static final int BATCH_COUNT = 5;

    List<ExcelDictDTO> list = new ArrayList<>();//创建一个数据流

    public ExcelDictDTOListener(DictMapper dictMapper) {
        this.dictMapper = dictMapper;
    }


    @Override
    public void invoke(ExcelDictDTO data, AnalysisContext analysisContext) {
        log.info("解析到一条记录: {}", data);
        list.add(data); //将解析到的记录添加到数据流中
        if (list.size() >= BATCH_COUNT) {
            //调用mapper层的保存方法
            saveData();
            // 存储完成清理 list
            list.clear();
        }
    }

    /**
     * 所有数据解析完成了 就会调用此方法
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        //这里也要保存数据，确保最后遗留的数据也存储到数据库
        saveData();
        log.info("所有数据解析完成！");
    }

    /**
     * 加上存储数据库
     */
    private void saveData() {
        log.info("存储了{}条数据到数据库", list.size());
        //这里要调用mapper层的保存方法
        dictMapper.insertBatch(list);
        log.info("数据添加完成！");
    }
}
