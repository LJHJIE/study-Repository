package com.atguigu.srb.oss.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.CannedAccessControlList;
import com.atguigu.srb.oss.service.FileService;
import com.atguigu.srb.oss.util.OssProperties;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.UUID;

/**
 * @aurhor LongJinHua
 * @data 2022-11-29 22:12:04
 **/
@Service
@Slf4j
public class FileServiceImpl implements FileService {

    @Override
    public String upload(InputStream inputStream, String module, String fileName) {

        // 创建OSSClient【客户端】实例。
        OSS ossClient = new OSSClientBuilder()
                .build(OssProperties.ENDPOINT, OssProperties.KEY_ID, OssProperties.KEY_SECRET);

        //首先先判断存储空间是否存在，如果不存在则创建并设置权限【这里设置的是：公共读的权限】
        if (!ossClient.doesBucketExist(OssProperties.BUCKET_NAME)) {
            //创建存储空间【bucket】
            ossClient.createBucket(OssProperties.BUCKET_NAME);
            //设置存储空间的访问权限
            ossClient.setBucketAcl(OssProperties.BUCKET_NAME, CannedAccessControlList.PublicRead);
        }

        //构建局部文件路径：示例：‘xxx/2022/11/29/文件名’
        String folder = new DateTime().toString("yyyy-MM-dd");
        //文件名 【组成：生成的uuid+截取到的文件后缀名】 【这边是从 "." 开始截取,保留后面所有的字符串，不包括"."】
        fileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));

        //拼接文件根路径
        String key = module + "/" + folder + '/' + fileName;

        //文件上传至阿里云
        ossClient.putObject(OssProperties.BUCKET_NAME, key, inputStream);

        //关闭OSSClient客户端
        ossClient.shutdown();

        //https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/avatar/back2.jpg
        //返回文件的完整路径
        return "https://" + OssProperties.BUCKET_NAME + "." + OssProperties.ENDPOINT + "/" + key;
    }

    @Override
    public void removeFile(String url) {

        // 创建OSSClient【客户端】实例。
        OSS ossClient = new OSSClientBuilder()
                .build(OssProperties.ENDPOINT, OssProperties.KEY_ID, OssProperties.KEY_SECRET);


        //文件名
        String host = "https://" + OssProperties.BUCKET_NAME + "." + OssProperties.ENDPOINT + "/";
        //进行截取字符串
        //https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/avatar/back2.jpg == avatar/back2.jpg
        String objectName = url.substring(host.length());

        //删除文件或目录。如果要删除目录，目录必须为空。
        //objectName：【文件完整路径参数中不能包含存储空间名称】
        ossClient.deleteObject(OssProperties.BUCKET_NAME, objectName);

        //关闭OSSClient客户端
        ossClient.shutdown();
    }
}

