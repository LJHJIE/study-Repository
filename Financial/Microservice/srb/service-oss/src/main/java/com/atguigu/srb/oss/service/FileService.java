package com.atguigu.srb.oss.service;

import java.io.InputStream;

/**
 * @aurhor LongJinHua
 * @data 2022-11-29 22:10:41
 **/
public interface FileService {

    /**
     * 文件上传至阿里云
     */
    String upload(InputStream inputStream, String module, String fileName);

    /**
     * 根据路径删除文件
     * @param url
     */
    void removeFile(String url);
}
