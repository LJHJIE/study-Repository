/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : srb_core

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 02/02/2023 16:40:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borrow_info
-- ----------------------------
DROP TABLE IF EXISTS `borrow_info`;
CREATE TABLE `borrow_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '借款用户id',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '借款金额',
  `period` int(11) NULL DEFAULT NULL COMMENT '借款期限',
  `borrow_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式 1-等额本息 2-等额本金 3-每月还息一次还本 4-一次还本',
  `money_use` tinyint(3) NULL DEFAULT NULL COMMENT '资金用途',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态（0：未提交，1：审核中， 2：审核通过， -1：审核不通过）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借款信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrow_info
-- ----------------------------
INSERT INTO `borrow_info` VALUES (1, 3, 100000.00, 3, 0.12, 4, 1, 2, '2022-12-12 15:50:06', '2022-12-13 22:29:18', 0);
INSERT INTO `borrow_info` VALUES (2, 4, 100000.00, 3, 0.12, 3, 1, 2, '2022-12-18 20:24:05', '2022-12-18 20:24:05', 0);

-- ----------------------------
-- Table structure for borrower
-- ----------------------------
DROP TABLE IF EXISTS `borrower`;
CREATE TABLE `borrower`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '身份证号',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `sex` tinyint(3) NULL DEFAULT NULL COMMENT '性别（1：男 0：女）',
  `age` tinyint(3) NULL DEFAULT NULL COMMENT '年龄',
  `education` tinyint(3) NULL DEFAULT NULL COMMENT '学历',
  `is_marry` tinyint(1) NULL DEFAULT NULL COMMENT '是否结婚（1：是 0：否）',
  `industry` tinyint(3) NULL DEFAULT NULL COMMENT '行业',
  `income` tinyint(3) NULL DEFAULT NULL COMMENT '月收入',
  `return_source` tinyint(3) NULL DEFAULT NULL COMMENT '还款来源',
  `contacts_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人名称',
  `contacts_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `contacts_relation` tinyint(3) NULL DEFAULT NULL COMMENT '联系人关系',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态（0：未认证，1：认证中， 2：认证通过， -1：认证失败）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借款人' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrower
-- ----------------------------
INSERT INTO `borrower` VALUES (1, 3, '华', '4514545555554451', '13573658469', 1, 24, 3, 0, 1, 4, 2, '小龙', '17147619536', 4, 2, '2022-12-10 22:44:41', '2022-12-14 14:02:45', 0);
INSERT INTO `borrower` VALUES (2, 4, '林', '46515458544511222', '19955445454', 0, 25, 4, 0, 3, 3, 1, '冷', '17556555511', 4, 2, '2022-12-18 20:23:16', '2022-12-18 20:23:16', 0);

-- ----------------------------
-- Table structure for borrower_attach
-- ----------------------------
DROP TABLE IF EXISTS `borrower_attach`;
CREATE TABLE `borrower_attach`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `borrower_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '借款人id',
  `image_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片类型（idCard1：身份证正面，idCard2：身份证反面，house：房产证，car：车）',
  `image_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `image_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_borrower_id`(`borrower_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借款人上传资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrower_attach
-- ----------------------------
INSERT INTO `borrower_attach` VALUES (1, 1, 'idCard1', 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/idCard1/2022-12-10/a5399611-b536-49dd-94b2-aba91e376e3c.jpg', '正面1.jpg', '2022-12-10 22:44:41', '2022-12-10 22:44:41', 0);
INSERT INTO `borrower_attach` VALUES (2, 1, 'idCard2', 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/idCard2/2022-12-10/afb3219c-a3cb-4a7d-8c2f-77efafb54fa8.jpg', '反面.jpg', '2022-12-10 22:44:41', '2022-12-10 22:44:41', 0);
INSERT INTO `borrower_attach` VALUES (3, 1, 'house', 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/house/2022-12-10/a96ad9df-7020-4290-b524-6d1905b51b72.jpg', 'house.jpg', '2022-12-10 22:44:41', '2022-12-10 22:44:41', 0);
INSERT INTO `borrower_attach` VALUES (4, 1, 'car', 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/car/2022-12-10/a3c7f203-2b58-4f73-8f0e-dc0d47b36ed4.jpg', 'car.jpg', '2022-12-10 22:44:41', '2022-12-10 22:44:41', 0);
INSERT INTO `borrower_attach` VALUES (5, 2, 'idCard1', 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/idCard1/2022-12-18/81fac36a-352f-4941-986d-f3843b1ff215.jpg', '正面1.jpg', '2022-12-18 20:23:16', '2022-12-18 20:23:16', 0);
INSERT INTO `borrower_attach` VALUES (6, 2, 'idCard2', 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/idCard2/2022-12-18/4e765f7a-a379-49e0-9147-8201c4919e35.jpg', '反面.jpg', '2022-12-18 20:23:16', '2022-12-18 20:23:16', 0);
INSERT INTO `borrower_attach` VALUES (7, 2, 'house', 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/house/2022-12-18/83bb1556-4976-45ed-a515-f61ae8d7d0ed.jpg', 'house.jpg', '2022-12-18 20:23:16', '2022-12-18 20:23:16', 0);
INSERT INTO `borrower_attach` VALUES (8, 2, 'car', 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/car/2022-12-18/65a06da6-b847-42dd-a0b2-db716a1864d6.jpg', 'car.jpg', '2022-12-18 20:23:16', '2022-12-18 20:23:16', 0);

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '上级id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `value` int(11) NULL DEFAULT NULL COMMENT '值',
  `dict_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_parent_id_value`(`parent_id`, `value`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82008 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, 0, '全部分类', NULL, 'ROOT', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (20000, 1, '行业', NULL, 'industry', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (20001, 20000, 'IT', 1, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (20002, 20000, '医生', 2, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (20003, 20000, '教师', 3, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (20004, 20000, '导游', 4, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (20005, 20000, '律师', 5, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (20006, 20000, '其他', 6, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (30000, 1, '学历', NULL, 'education', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (30001, 30000, '高中', 1, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (30002, 30000, '大专', 2, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (30003, 30000, '本科', 3, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (30004, 30000, '研究生', 4, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (30005, 30000, '其他', 5, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (40000, 1, '收入', NULL, 'income', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (40001, 40000, '0-3000', 1, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (40002, 40000, '3000-5000', 2, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (40003, 40000, '5000-10000', 3, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (40004, 40000, '10000以上', 4, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (50000, 1, '收入来源', NULL, 'returnSource', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (50001, 50000, '工资', 1, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (50002, 50000, '股票', 2, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (50003, 50000, '兼职', 3, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (60000, 1, '关系', NULL, 'relation', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (60001, 60000, '夫妻', 1, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (60002, 60000, '兄妹', 2, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (60003, 60000, '父母', 3, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (60004, 60000, '其他', 4, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (70000, 1, '还款方式', NULL, 'returnMethod', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (70001, 70000, '等额本息', 1, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (70002, 70000, '等额本金', 2, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (70003, 70000, '每月还息一次还本', 3, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (70004, 70000, '一次还本还息', 4, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (80000, 1, '资金用途', NULL, 'moneyUse', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (80001, 80000, '旅游', 1, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (80002, 80000, '买房', 2, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (80003, 80000, '装修', 3, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (80004, 80000, '医疗', 4, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (80005, 80000, '美容', 5, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (80006, 80000, '其他', 6, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (81000, 1, '借款状态', NULL, 'borrowStatus', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (81001, 81000, '待审核', 0, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (81002, 81000, '审批通过', 1, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (81003, 81000, '还款中', 2, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (81004, 81000, '结束', 3, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (81005, 81000, '审批不通过', -1, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (82000, 1, '学校性质', NULL, 'SchoolStatus', '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (82001, 82000, '211/985', NULL, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (82002, 82000, '一本', NULL, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (82003, 82000, '二本', NULL, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (82004, 82000, '三本', NULL, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (82005, 82000, '高职高专', NULL, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (82006, 82000, '中职中专', NULL, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);
INSERT INTO `dict` VALUES (82007, 82000, '高中及以下', NULL, NULL, '2022-12-10 14:23:42', '2022-12-10 14:23:42', 0);

-- ----------------------------
-- Table structure for integral_grade
-- ----------------------------
DROP TABLE IF EXISTS `integral_grade`;
CREATE TABLE `integral_grade`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `integral_start` int(11) NULL DEFAULT NULL COMMENT '积分区间开始',
  `integral_end` int(11) NULL DEFAULT NULL COMMENT '积分区间结束',
  `borrow_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '借款额度',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分等级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of integral_grade
-- ----------------------------
INSERT INTO `integral_grade` VALUES (1, 10, 50, 10000.00, '2022-12-08 17:02:29', '2022-11-23 16:22:34', 0);
INSERT INTO `integral_grade` VALUES (2, 51, 100, 30000.00, '2022-12-08 17:02:42', '2022-11-23 16:22:35', 0);
INSERT INTO `integral_grade` VALUES (3, 101, 1000, 100000.00, '2022-12-08 17:02:57', '2022-12-11 21:12:16', 0);
INSERT INTO `integral_grade` VALUES (5, 1001, 10000, 1000000.00, '2022-12-11 21:12:27', '2022-12-11 21:12:38', 0);

-- ----------------------------
-- Table structure for lend
-- ----------------------------
DROP TABLE IF EXISTS `lend`;
CREATE TABLE `lend`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '借款用户id',
  `borrow_info_id` bigint(20) NULL DEFAULT NULL COMMENT '借款信息id',
  `lend_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标的编号',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '标的金额',
  `period` int(11) NULL DEFAULT NULL COMMENT '投资期数',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `service_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台服务费率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式',
  `lowest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低投资金额',
  `invest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '已投金额',
  `invest_num` int(11) NULL DEFAULT NULL COMMENT '投资人数',
  `publish_date` datetime NULL DEFAULT NULL COMMENT '发布日期',
  `lend_start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `lend_end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `lend_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `expect_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台预期收益',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际收益',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `check_admin_id` bigint(1) NULL DEFAULT NULL COMMENT '审核用户id',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '放款时间',
  `payment_admin_id` datetime NULL DEFAULT NULL COMMENT '放款人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_lend_no`(`lend_no`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_borrow_info_id`(`borrow_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的准备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lend
-- ----------------------------
INSERT INTO `lend` VALUES (1, 3, 1, 'LEND20221213215642893', '白领贷001', 100000.00, 3, 0.12, 0.05, 4, 100.00, 40000.00, 2, '2022-12-13 21:56:43', '2022-12-14', '2023-03-14', '白领贷001审批通过', 1250.00, 500.00, 3, '2022-12-13 22:23:02', 1, '2022-12-18 13:43:22', NULL, '2022-12-13 22:23:02', '2022-12-17 14:19:34', 0);
INSERT INTO `lend` VALUES (2, 4, 2, 'LEND20221218202435890', '教师贷001', 100000.00, 3, 0.12, 0.05, 3, 100.00, 50000.00, 1, '2022-12-18 20:24:35', '2022-12-19', '2023-03-19', '世界这么大，我想去看看。', 1250.00, 625.00, 2, '2022-12-18 20:24:35', 1, '2022-12-18 20:26:37', NULL, '2022-12-18 20:24:35', '2022-12-18 20:24:35', 0);

-- ----------------------------
-- Table structure for lend_item
-- ----------------------------
DROP TABLE IF EXISTS `lend_item`;
CREATE TABLE `lend_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lend_item_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资编号',
  `lend_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '标的id',
  `invest_user_id` bigint(20) NULL DEFAULT NULL COMMENT '投资用户id',
  `invest_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资人名称',
  `invest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '投资金额',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `invest_time` datetime NULL DEFAULT NULL COMMENT '投资时间',
  `lend_start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `lend_end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `expect_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '投资人预期收益',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '投资人实际收益',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（0：默认 1：已支付 2：已还款）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_lend_item_no`(`lend_item_no`) USING BTREE,
  INDEX `idx_lend_id`(`lend_id`) USING BTREE,
  INDEX `idx_invest_user_id`(`invest_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的出借记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lend_item
-- ----------------------------
INSERT INTO `lend_item` VALUES (3, 'INVEST20221218133918523', 1, 1, '龙', 10000.00, 0.12, '2022-12-18 13:39:18', '2022-12-14', '2023-03-14', 300.00, 300.00, 1, '2022-12-18 13:39:18', '2022-12-18 13:39:18', 0);
INSERT INTO `lend_item` VALUES (4, 'INVEST20221218134021787', 1, 1, '龙', 30000.00, 0.12, '2022-12-18 13:40:21', '2022-12-14', '2023-03-14', 900.00, 900.00, 1, '2022-12-18 13:40:21', '2022-12-18 13:40:21', 0);
INSERT INTO `lend_item` VALUES (5, 'INVEST20221218202601631', 2, 1, '龙', 50000.00, 0.12, '2022-12-18 20:26:02', '2022-12-19', '2023-03-19', 1500.00, 500.00, 1, '2022-12-18 20:26:01', '2022-12-18 20:26:01', 0);

-- ----------------------------
-- Table structure for lend_item_return
-- ----------------------------
DROP TABLE IF EXISTS `lend_item_return`;
CREATE TABLE `lend_item_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lend_return_id` bigint(20) NULL DEFAULT NULL COMMENT '标的还款id',
  `lend_item_id` bigint(20) NULL DEFAULT NULL COMMENT '标的项id',
  `lend_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '标的id',
  `invest_user_id` bigint(1) NULL DEFAULT NULL COMMENT '出借用户id',
  `invest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '出借金额',
  `current_period` int(11) NULL DEFAULT NULL COMMENT '当前的期数',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式 1-等额本息 2-等额本金 3-每月还息一次还本 4-一次还本',
  `principal` decimal(10, 2) NULL DEFAULT NULL COMMENT '本金',
  `interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '利息',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '本息',
  `fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '手续费',
  `return_date` date NULL DEFAULT NULL COMMENT '还款时指定的还款日期',
  `real_return_time` datetime NULL DEFAULT NULL COMMENT '实际发生的还款时间',
  `is_overdue` tinyint(1) NULL DEFAULT NULL COMMENT '是否逾期',
  `overdue_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '逾期金额',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（0-未归还 1-已归还）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lend_return_id`(`lend_return_id`) USING BTREE,
  INDEX `idx_lend_item_id`(`lend_item_id`) USING BTREE,
  INDEX `idx_lend_id`(`lend_id`) USING BTREE,
  INDEX `idx_invest_user_id`(`invest_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的出借回款记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lend_item_return
-- ----------------------------
INSERT INTO `lend_item_return` VALUES (1, 1, 3, 1, 1, 10000.00, 1, 0.12, 4, 10000.00, 300.00, 10300.00, 0.00, '2023-01-14', '2022-12-18 20:07:59', 0, NULL, 1, '2022-12-18 13:43:22', '2022-12-18 13:43:22', 0);
INSERT INTO `lend_item_return` VALUES (2, 1, 4, 1, 1, 30000.00, 1, 0.12, 4, 30000.00, 900.00, 30900.00, 0.00, '2023-01-14', '2022-12-18 20:07:59', 0, NULL, 1, '2022-12-18 13:43:22', '2022-12-18 13:43:22', 0);
INSERT INTO `lend_item_return` VALUES (5, 6, 5, 2, 1, 50000.00, 3, 0.12, 3, 50000.00, 500.00, 50500.00, 0.00, '2023-03-19', NULL, 0, NULL, 0, '2022-12-18 20:26:36', '2022-12-18 20:26:36', 0);

-- ----------------------------
-- Table structure for lend_return
-- ----------------------------
DROP TABLE IF EXISTS `lend_return`;
CREATE TABLE `lend_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lend_id` bigint(20) NULL DEFAULT NULL COMMENT '标的id',
  `borrow_info_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '借款信息id',
  `return_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款批次号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '借款人用户id',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '借款金额',
  `base_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '计息本金额',
  `current_period` int(11) NULL DEFAULT NULL COMMENT '当前的期数',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式 1-等额本息 2-等额本金 3-每月还息一次还本 4-一次还本',
  `principal` decimal(10, 2) NULL DEFAULT NULL COMMENT '本金',
  `interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '利息',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '本息',
  `fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '手续费',
  `return_date` date NULL DEFAULT NULL COMMENT '还款时指定的还款日期',
  `real_return_time` datetime NULL DEFAULT NULL COMMENT '实际发生的还款时间',
  `is_overdue` tinyint(1) NULL DEFAULT NULL COMMENT '是否逾期',
  `overdue_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '逾期金额',
  `is_last` tinyint(1) NULL DEFAULT NULL COMMENT '是否最后一次还款',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（0-未归还 1-已归还）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_return_no`(`return_no`) USING BTREE,
  INDEX `idx_lend_id`(`lend_id`) USING BTREE,
  INDEX `idx_borrow_info_id`(`borrow_info_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '还款记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lend_return
-- ----------------------------
INSERT INTO `lend_return` VALUES (1, 1, 1, 'RETURN20221218134322232', 3, 100000.00, 40000.00, 1, 0.12, 4, 40000.00, 1200.00, 41200.00, 0.00, '2023-01-14', '2022-12-18 20:07:59', 0, NULL, 0, 1, '2022-12-18 13:43:22', '2022-12-18 13:43:22', 0);
INSERT INTO `lend_return` VALUES (2, 1, 1, 'RETURN20221218134322849', 3, 100000.00, 40000.00, 2, 0.12, 4, 0.00, 0.00, 0.00, 0.00, '2023-02-14', '2022-12-18 20:09:55', 0, NULL, 0, 1, '2022-12-18 13:43:22', '2022-12-18 13:43:22', 0);
INSERT INTO `lend_return` VALUES (3, 1, 1, 'RETURN20221218134322756', 3, 100000.00, 40000.00, 3, 0.12, 4, 0.00, 0.00, 0.00, 0.00, '2023-03-14', '2022-12-18 20:10:17', 0, NULL, 1, 1, '2022-12-18 13:43:22', '2022-12-18 13:43:22', 0);
INSERT INTO `lend_return` VALUES (4, 2, 2, 'RETURN20221218202636113', 4, 100000.00, 50000.00, 1, 0.12, 3, 0.00, 500.00, 500.00, 0.00, '2023-01-19', '2022-12-18 20:28:42', 0, NULL, 0, 1, '2022-12-18 20:26:36', '2022-12-18 20:26:36', 0);
INSERT INTO `lend_return` VALUES (5, 2, 2, 'RETURN20221218202636028', 4, 100000.00, 50000.00, 2, 0.12, 3, 0.00, 500.00, 500.00, 0.00, '2023-02-19', '2022-12-18 20:29:30', 0, NULL, 0, 1, '2022-12-18 20:26:36', '2022-12-18 20:26:36', 0);
INSERT INTO `lend_return` VALUES (6, 2, 2, 'RETURN20221218202636559', 4, 100000.00, 50000.00, 3, 0.12, 3, 50000.00, 500.00, 50500.00, 0.00, '2023-03-19', NULL, 0, NULL, 1, 0, '2022-12-18 20:26:36', '2022-12-18 20:26:36', 0);

-- ----------------------------
-- Table structure for trans_flow
-- ----------------------------
DROP TABLE IF EXISTS `trans_flow`;
CREATE TABLE `trans_flow`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `trans_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '交易单号',
  `trans_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '交易类型（1：充值 2：提现 3：投标 4：投资回款 ...）',
  `trans_type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易类型名称',
  `trans_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `memo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_trans_no`(`trans_no`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易流水表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of trans_flow
-- ----------------------------
INSERT INTO `trans_flow` VALUES (2, 1, '龙', 'CHARGE20221215153155495', 1, '充值', 100.00, '投资人用户完成充值', '2022-12-15 15:32:01', '2022-12-15 15:32:01', 0);
INSERT INTO `trans_flow` VALUES (4, 1, '龙', 'CHARGE20221215155032591', 1, '充值', 100.00, '投资人用户完成充值', '2022-12-15 15:50:38', '2022-12-15 15:50:38', 0);
INSERT INTO `trans_flow` VALUES (5, 1, '龙', 'CHARGE20221217005255589', 1, '充值', 100000.00, '投资人用户完成充值', '2022-12-17 00:53:08', '2022-12-17 00:53:08', 0);
INSERT INTO `trans_flow` VALUES (7, 1, '龙', 'INVEST20221218133918523', 2, '投标锁定', 10000.00, '投资项目编号：LEND20221213215642893，项目名称：白领贷001', '2022-12-18 13:39:25', '2022-12-18 13:39:25', 0);
INSERT INTO `trans_flow` VALUES (8, 1, '龙', 'INVEST20221218134021787', 2, '投标锁定', 30000.00, '投资项目编号：LEND20221213215642893，项目名称：白领贷001', '2022-12-18 13:40:27', '2022-12-18 13:40:27', 0);
INSERT INTO `trans_flow` VALUES (9, 3, '锦', 'LOAN20221218134322817', 5, '放款到账', 39500.00, '借款放款到账，编号：LEND20221213215642893', '2022-12-18 13:43:22', '2022-12-18 13:43:22', 0);
INSERT INTO `trans_flow` VALUES (10, 1, '龙', 'TRANS20221218134322716', 3, '放款解锁', 10000.00, '冻结资金转出，出借放款，编号：LEND20221213215642893', '2022-12-18 13:43:22', '2022-12-18 13:43:22', 0);
INSERT INTO `trans_flow` VALUES (11, 1, '龙', 'TRANS20221218134322617', 3, '放款解锁', 30000.00, '冻结资金转出，出借放款，编号：LEND20221213215642893', '2022-12-18 13:43:22', '2022-12-18 13:43:22', 0);
INSERT INTO `trans_flow` VALUES (12, 1, '龙', 'WITHDRAW20221218154612484', 8, '提现', 200.00, '提现', '2022-12-18 15:46:31', '2022-12-18 15:46:31', 0);
INSERT INTO `trans_flow` VALUES (13, 1, '龙', 'WITHDRAW20221218154733397', 8, '提现', 200.00, '提现', '2022-12-18 15:47:59', '2022-12-18 15:47:59', 0);
INSERT INTO `trans_flow` VALUES (14, 3, '锦', 'RETURN20221218134322232', 6, '还款扣减', 41200.00, '借款人还款扣减，项目编号：LEND20221213215642893，项目名称：白领贷001', '2022-12-18 20:07:59', '2022-12-18 20:07:59', 0);
INSERT INTO `trans_flow` VALUES (15, 1, '龙', 'RETURNITEM20221218200759352', 7, '出借回款', 10300.00, '还款到账，项目编号：LEND20221213215642893，项目名称：白领贷001', '2022-12-18 20:07:59', '2022-12-18 20:07:59', 0);
INSERT INTO `trans_flow` VALUES (16, 1, '龙', 'RETURNITEM20221218200759960', 7, '出借回款', 30900.00, '还款到账，项目编号：LEND20221213215642893，项目名称：白领贷001', '2022-12-18 20:07:59', '2022-12-18 20:07:59', 0);
INSERT INTO `trans_flow` VALUES (17, 3, '锦', 'RETURN20221218134322849', 6, '还款扣减', 0.00, '借款人还款扣减，项目编号：LEND20221213215642893，项目名称：白领贷001', '2022-12-18 20:09:55', '2022-12-18 20:09:55', 0);
INSERT INTO `trans_flow` VALUES (18, 3, '锦', 'RETURN20221218134322756', 6, '还款扣减', 0.00, '借款人还款扣减，项目编号：LEND20221213215642893，项目名称：白领贷001', '2022-12-18 20:10:17', '2022-12-18 20:10:17', 0);
INSERT INTO `trans_flow` VALUES (19, 1, '龙', 'INVEST20221218202601631', 2, '投标锁定', 50000.00, '投资项目编号：LEND20221218202435890，项目名称：教师贷001', '2022-12-18 20:26:07', '2022-12-18 20:26:07', 0);
INSERT INTO `trans_flow` VALUES (20, 4, '林', 'LOAN20221218202636146', 5, '放款到账', 49375.00, '借款放款到账，编号：LEND20221218202435890', '2022-12-18 20:26:36', '2022-12-18 20:26:36', 0);
INSERT INTO `trans_flow` VALUES (21, 1, '龙', 'TRANS20221218202636334', 3, '放款解锁', 50000.00, '冻结资金转出，出借放款，编号：LEND20221218202435890', '2022-12-18 20:26:36', '2022-12-18 20:26:36', 0);
INSERT INTO `trans_flow` VALUES (22, 4, '林', 'RETURN20221218202636113', 6, '还款扣减', 500.00, '借款人还款扣减，项目编号：LEND20221218202435890，项目名称：教师贷001', '2022-12-18 20:28:42', '2022-12-18 20:28:42', 0);
INSERT INTO `trans_flow` VALUES (23, 1, '龙', 'RETURNITEM20221218202842236', 7, '出借回款', 500.00, '还款到账，项目编号：LEND20221218202435890，项目名称：教师贷001', '2022-12-18 20:28:42', '2022-12-18 20:28:42', 0);
INSERT INTO `trans_flow` VALUES (24, 4, '林', 'RETURN20221218202636028', 6, '还款扣减', 500.00, '借款人还款扣减，项目编号：LEND20221218202435890，项目名称：教师贷001', '2022-12-18 20:29:30', '2022-12-18 20:29:30', 0);
INSERT INTO `trans_flow` VALUES (25, 1, '龙', 'RETURNITEM20221218202930198', 7, '出借回款', 500.00, '还款到账，项目编号：LEND20221218202435890，项目名称：教师贷001', '2022-12-18 20:29:30', '2022-12-18 20:29:30', 0);
INSERT INTO `trans_flow` VALUES (26, 1, '龙', 'CHARGE20221221174259740', 1, '充值', 100.00, '投资人用户完成充值', '2022-12-21 17:43:05', '2022-12-21 17:43:05', 0);
INSERT INTO `trans_flow` VALUES (27, 1, '龙', 'CHARGE20221221175420982', 1, '充值', 200.00, '投资人用户完成充值', '2022-12-21 17:54:26', '2022-12-21 17:54:26', 0);
INSERT INTO `trans_flow` VALUES (28, 1, '龙', 'CHARGE20221221175642964', 1, '充值', 100.00, '投资人用户完成充值', '2022-12-21 17:56:47', '2022-12-21 17:56:47', 0);
INSERT INTO `trans_flow` VALUES (29, 1, '龙', 'CHARGE20221221180317148', 1, '充值', 1000.00, '投资人用户完成充值', '2022-12-21 18:03:24', '2022-12-21 18:03:24', 0);
INSERT INTO `trans_flow` VALUES (30, 1, '龙', 'CHARGE20221221180736790', 1, '充值', 200.00, '投资人用户完成充值', '2022-12-21 18:07:42', '2022-12-21 18:07:42', 0);
INSERT INTO `trans_flow` VALUES (31, 1, '龙', 'CHARGE20221221182325674', 1, '充值', 200.00, '投资人用户完成充值', '2022-12-21 18:23:30', '2022-12-21 18:23:30', 0);
INSERT INTO `trans_flow` VALUES (32, 1, '龙', 'CHARGE20221221183732457', 1, '充值', 200.00, '投资人用户完成充值', '2022-12-21 18:37:36', '2022-12-21 18:37:36', 0);
INSERT INTO `trans_flow` VALUES (33, 1, '龙', 'CHARGE20221221183954630', 1, '充值', 1000.00, '投资人用户完成充值', '2022-12-21 18:39:59', '2022-12-21 18:39:59', 0);
INSERT INTO `trans_flow` VALUES (34, 1, '龙', 'CHARGE20221221185005370', 1, '充值', 5000.00, '投资人用户完成充值', '2022-12-21 18:50:11', '2022-12-21 18:50:11', 0);
INSERT INTO `trans_flow` VALUES (35, 1, '龙', 'CHARGE20221221185708671', 1, '充值', 100.00, '投资人用户完成充值', '2022-12-21 18:57:13', '2022-12-21 18:57:13', 0);
INSERT INTO `trans_flow` VALUES (36, 1, '龙', 'CHARGE20221221185840285', 1, '充值', 100.00, '投资人用户完成充值', '2022-12-21 18:58:45', '2022-12-21 18:58:45', 0);
INSERT INTO `trans_flow` VALUES (37, 1, '龙', 'CHARGE20221221191610949', 1, '充值', 2000.00, '投资人用户完成充值', '2022-12-21 19:16:16', '2022-12-21 19:16:16', 0);
INSERT INTO `trans_flow` VALUES (38, 1, '龙', 'CHARGE20221221192421566', 1, '充值', 100.00, '投资人用户完成充值', '2022-12-21 19:24:26', '2022-12-21 19:24:26', 0);
INSERT INTO `trans_flow` VALUES (39, 1, '龙', 'CHARGE20221221193124162', 1, '充值', 200.00, '投资人用户完成充值', '2022-12-21 19:31:31', '2022-12-21 19:31:31', 0);
INSERT INTO `trans_flow` VALUES (40, 1, '龙', 'CHARGE20221221194534002', 1, '充值', 200.00, '投资人用户完成充值', '2022-12-21 19:45:40', '2022-12-21 19:45:40', 0);

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '帐户可用余额',
  `freeze_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '冻结金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (1, 1, 62700.00, 0.00, '2022-12-04 20:05:48', '2022-12-21 19:45:40', 0, 0);
INSERT INTO `user_account` VALUES (2, 2, 0.00, 0.00, '2022-12-05 11:27:46', '2022-12-05 11:27:46', 0, 0);
INSERT INTO `user_account` VALUES (3, 3, 8800.00, 0.00, '2022-12-05 11:28:46', '2022-12-18 20:07:59', 0, 0);
INSERT INTO `user_account` VALUES (4, 4, 48375.00, 0.00, '2022-12-18 20:19:14', '2022-12-18 20:29:30', 0, 0);

-- ----------------------------
-- Table structure for user_bind
-- ----------------------------
DROP TABLE IF EXISTS `user_bind`;
CREATE TABLE `user_bind`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证号',
  `bank_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行类型',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账户协议号',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户绑定表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_bind
-- ----------------------------
INSERT INTO `user_bind` VALUES (7, 1, '龙', '431021200301014145', '212122200000000000', '民生银行', '17147619536', '9efd37101a1a4ee6ac24dfbd41e18ee0', 1, '2022-12-14 14:51:45', '2022-12-14 22:28:36', 0);
INSERT INTO `user_bind` VALUES (8, 3, '锦', '431021525410230152', '210001000000000000', '工商银行', '13573658469', 'faab5b1f05b2449c9c2abe6a2c9ced2c', 1, '2022-12-14 14:54:17', '2022-12-14 22:28:45', 0);
INSERT INTO `user_bind` VALUES (11, 2, '慢慢', '465855555555555', '213420000000000', '农业银行', '19573524676', '041ad4a7bd6847e589f136aeabefa80c', 1, '2022-12-14 22:31:25', '2022-12-14 22:31:25', 0);
INSERT INTO `user_bind` VALUES (12, 4, '林', '46515458544511222', '43254000000000000', '瑞士银行', '19987874598', 'a609a500a5fd4c3ab1328c8ae59c328e', 1, '2022-12-18 20:21:44', '2022-12-18 20:21:44', 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '1：出借人 2：借款人',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `openid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信用户标识openid',
  `head_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `bind_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '绑定状态（0：未绑定，1：绑定成功 -1：绑定失败）',
  `borrow_auth_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '借款人认证状态（0：未认证 1：认证中 2：认证通过 -1：认证失败）',
  `bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账户协议号',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '状态（0：锁定 1：正常）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 1, '17147619536', 'e10adc3949ba59abbe56e057f20f883e', '17147619536', '龙', '431021200301014145', NULL, NULL, 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/avatar/2022-12-18/2c4175ef-a478-4f3b-8ea1-e49f2b2acab1.jpg', 1, 0, '9efd37101a1a4ee6ac24dfbd41e18ee0', 0, 1, '2022-12-04 20:05:48', '2022-12-18 22:18:40', 0);
INSERT INTO `user_info` VALUES (2, 1, '19573524676', 'e10adc3949ba59abbe56e057f20f883e', '19573524676', '慢慢', '465855555555555', NULL, NULL, 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/avatar/2022-12-18/2c4175ef-a478-4f3b-8ea1-e49f2b2acab1.jpg', 1, 0, '041ad4a7bd6847e589f136aeabefa80c', 0, 1, '2022-12-05 11:27:46', '2022-12-18 23:33:29', 0);
INSERT INTO `user_info` VALUES (3, 2, '13573658469', 'e10adc3949ba59abbe56e057f20f883e', '13573658469', '锦', '431021525410230152', NULL, NULL, 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/avatar/2022-12-18/2c4175ef-a478-4f3b-8ea1-e49f2b2acab1.jpg', 1, 2, 'faab5b1f05b2449c9c2abe6a2c9ced2c', 220, 1, '2022-12-05 11:28:46', '2022-12-18 23:33:27', 0);
INSERT INTO `user_info` VALUES (4, 2, '19955445454', 'e10adc3949ba59abbe56e057f20f883e', '19955445454', '林', '46515458544511222', NULL, NULL, 'https://srb-file-longjinhua.oss-cn-hangzhou.aliyuncs.com/avatar/2022-12-19/15543530-afab-4115-a6c6-9af774fb5136.png', 1, 2, 'a609a500a5fd4c3ab1328c8ae59c328e', 220, 1, '2022-12-18 20:19:14', '2022-12-19 16:47:30', 0);

-- ----------------------------
-- Table structure for user_integral
-- ----------------------------
DROP TABLE IF EXISTS `user_integral`;
CREATE TABLE `user_integral`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `integral` int(11) NULL DEFAULT NULL COMMENT '积分',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获取积分说明',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户积分记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_integral
-- ----------------------------
INSERT INTO `user_integral` VALUES (9, 3, 30, '借款人基本信息', '2022-12-11 21:07:21', '2022-12-11 21:07:21', 0);
INSERT INTO `user_integral` VALUES (10, 3, 30, '借款人身份证信息', '2022-12-11 21:07:21', '2022-12-11 21:07:21', 0);
INSERT INTO `user_integral` VALUES (11, 3, 100, '借款人房产信息', '2022-12-11 21:07:21', '2022-12-11 21:07:21', 0);
INSERT INTO `user_integral` VALUES (12, 3, 60, '借款人车辆信息', '2022-12-11 21:07:21', '2022-12-11 21:07:21', 0);
INSERT INTO `user_integral` VALUES (13, 4, 30, '借款人基本信息', '2022-12-18 20:23:30', '2022-12-18 20:23:30', 0);
INSERT INTO `user_integral` VALUES (14, 4, 30, '借款人身份证信息', '2022-12-18 20:23:30', '2022-12-18 20:23:30', 0);
INSERT INTO `user_integral` VALUES (15, 4, 100, '借款人房产信息', '2022-12-18 20:23:30', '2022-12-18 20:23:30', 0);
INSERT INTO `user_integral` VALUES (16, 4, 60, '借款人车辆信息', '2022-12-18 20:23:30', '2022-12-18 20:23:30', 0);

-- ----------------------------
-- Table structure for user_login_record
-- ----------------------------
DROP TABLE IF EXISTS `user_login_record`;
CREATE TABLE `user_login_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_login_record
-- ----------------------------
INSERT INTO `user_login_record` VALUES (1, 1, '127.0.0.1', '2022-12-04 21:50:43', '2022-12-04 21:50:43', 0);
INSERT INTO `user_login_record` VALUES (2, 1, '0:0:0:0:0:0:0:1', '2022-12-04 21:58:00', '2022-12-04 21:58:00', 0);
INSERT INTO `user_login_record` VALUES (3, 1, '0:0:0:0:0:0:0:1', '2022-12-04 21:58:50', '2022-12-04 21:58:50', 0);
INSERT INTO `user_login_record` VALUES (4, 1, '127.0.0.1', '2022-12-04 22:00:14', '2022-12-04 22:00:14', 0);
INSERT INTO `user_login_record` VALUES (5, 1, '0:0:0:0:0:0:0:1', '2022-12-04 22:19:28', '2022-12-04 22:19:28', 0);
INSERT INTO `user_login_record` VALUES (6, 1, '0:0:0:0:0:0:0:1', '2022-12-04 22:40:29', '2022-12-04 22:40:29', 0);
INSERT INTO `user_login_record` VALUES (7, 1, '0:0:0:0:0:0:0:1', '2022-12-04 22:41:34', '2022-12-04 22:41:34', 0);
INSERT INTO `user_login_record` VALUES (8, 1, '0:0:0:0:0:0:0:1', '2022-12-04 22:43:13', '2022-12-04 22:43:13', 0);
INSERT INTO `user_login_record` VALUES (9, 2, '127.0.0.1', '2022-12-05 11:46:27', '2022-12-05 11:46:27', 0);
INSERT INTO `user_login_record` VALUES (10, 1, '0:0:0:0:0:0:0:1', '2022-12-05 16:32:35', '2022-12-05 16:32:35', 0);
INSERT INTO `user_login_record` VALUES (11, 1, '192.168.0.6', '2022-12-06 19:24:03', '2022-12-06 19:24:03', 0);
INSERT INTO `user_login_record` VALUES (12, 1, '192.168.2.16', '2022-12-06 21:52:55', '2022-12-06 21:52:55', 0);
INSERT INTO `user_login_record` VALUES (13, 1, '192.168.2.16', '2022-12-07 17:00:21', '2022-12-07 17:00:21', 0);
INSERT INTO `user_login_record` VALUES (14, 1, '192.168.0.6', '2022-12-08 14:43:25', '2022-12-08 14:43:25', 0);
INSERT INTO `user_login_record` VALUES (15, 1, '192.168.0.6', '2022-12-08 15:37:20', '2022-12-08 15:37:20', 0);
INSERT INTO `user_login_record` VALUES (16, 2, '192.168.0.6', '2022-12-08 15:52:23', '2022-12-08 15:52:23', 0);
INSERT INTO `user_login_record` VALUES (17, 1, '192.168.0.6', '2022-12-09 14:59:13', '2022-12-09 14:59:13', 0);
INSERT INTO `user_login_record` VALUES (18, 1, '192.168.43.174', '2022-12-10 08:51:46', '2022-12-10 08:51:46', 0);
INSERT INTO `user_login_record` VALUES (19, 3, '0:0:0:0:0:0:0:1', '2022-12-10 23:13:36', '2022-12-10 23:13:36', 0);
INSERT INTO `user_login_record` VALUES (20, 3, '0:0:0:0:0:0:0:1', '2022-12-10 23:17:09', '2022-12-10 23:17:09', 0);
INSERT INTO `user_login_record` VALUES (21, 3, '0:0:0:0:0:0:0:1', '2022-12-10 23:19:18', '2022-12-10 23:19:18', 0);
INSERT INTO `user_login_record` VALUES (22, 3, '192.168.2.16', '2022-12-10 23:36:43', '2022-12-10 23:36:43', 0);
INSERT INTO `user_login_record` VALUES (23, 3, '192.168.2.16', '2022-12-11 16:14:17', '2022-12-11 16:14:17', 0);
INSERT INTO `user_login_record` VALUES (24, 3, '192.168.2.16', '2022-12-12 14:12:23', '2022-12-12 14:12:23', 0);
INSERT INTO `user_login_record` VALUES (25, 3, '192.168.55.174', '2022-12-14 14:01:14', '2022-12-14 14:01:14', 0);
INSERT INTO `user_login_record` VALUES (26, 1, '192.168.55.174', '2022-12-14 14:44:51', '2022-12-14 14:44:51', 0);
INSERT INTO `user_login_record` VALUES (27, 1, '192.168.55.174', '2022-12-14 14:51:05', '2022-12-14 14:51:05', 0);
INSERT INTO `user_login_record` VALUES (28, 3, '192.168.55.174', '2022-12-14 14:53:30', '2022-12-14 14:53:30', 0);
INSERT INTO `user_login_record` VALUES (29, 1, '192.168.55.174', '2022-12-14 14:55:59', '2022-12-14 14:55:59', 0);
INSERT INTO `user_login_record` VALUES (30, 3, '192.168.2.16', '2022-12-14 22:10:46', '2022-12-14 22:10:46', 0);
INSERT INTO `user_login_record` VALUES (31, 2, '192.168.2.16', '2022-12-14 22:15:28', '2022-12-14 22:15:28', 0);
INSERT INTO `user_login_record` VALUES (32, 1, '192.168.2.16', '2022-12-14 22:22:27', '2022-12-14 22:22:27', 0);
INSERT INTO `user_login_record` VALUES (33, 2, '192.168.2.16', '2022-12-14 22:25:17', '2022-12-14 22:25:17', 0);
INSERT INTO `user_login_record` VALUES (34, 1, '192.168.0.6', '2022-12-15 08:59:53', '2022-12-15 08:59:53', 0);
INSERT INTO `user_login_record` VALUES (35, 1, '192.168.80.174', '2022-12-15 14:55:11', '2022-12-15 14:55:11', 0);
INSERT INTO `user_login_record` VALUES (36, 1, '192.168.0.6', '2022-12-16 15:48:33', '2022-12-16 15:48:33', 0);
INSERT INTO `user_login_record` VALUES (37, 1, '192.168.163.1', '2022-12-16 19:50:01', '2022-12-16 19:50:01', 0);
INSERT INTO `user_login_record` VALUES (38, 1, '192.168.2.16', '2022-12-16 23:43:25', '2022-12-16 23:43:25', 0);
INSERT INTO `user_login_record` VALUES (39, 1, '192.168.2.16', '2022-12-17 23:53:52', '2022-12-17 23:53:52', 0);
INSERT INTO `user_login_record` VALUES (40, 3, '192.168.2.16', '2022-12-18 14:40:59', '2022-12-18 14:40:59', 0);
INSERT INTO `user_login_record` VALUES (41, 1, '192.168.2.16', '2022-12-18 14:43:09', '2022-12-18 14:43:09', 0);
INSERT INTO `user_login_record` VALUES (42, 3, '192.168.2.16', '2022-12-18 20:04:21', '2022-12-18 20:04:21', 0);
INSERT INTO `user_login_record` VALUES (43, 4, '192.168.2.16', '2022-12-18 20:19:45', '2022-12-18 20:19:45', 0);
INSERT INTO `user_login_record` VALUES (44, 1, '192.168.2.16', '2022-12-18 20:25:22', '2022-12-18 20:25:22', 0);
INSERT INTO `user_login_record` VALUES (45, 4, '192.168.2.16', '2022-12-18 20:28:10', '2022-12-18 20:28:10', 0);
INSERT INTO `user_login_record` VALUES (46, 1, '192.168.2.16', '2022-12-18 20:34:25', '2022-12-18 20:34:25', 0);
INSERT INTO `user_login_record` VALUES (47, 4, '192.168.2.16', '2022-12-18 23:29:39', '2022-12-18 23:29:39', 0);
INSERT INTO `user_login_record` VALUES (48, 1, '192.168.2.16', '2022-12-18 23:33:59', '2022-12-18 23:33:59', 0);
INSERT INTO `user_login_record` VALUES (49, 4, '192.168.0.6', '2022-12-19 14:47:25', '2022-12-19 14:47:25', 0);
INSERT INTO `user_login_record` VALUES (50, 1, '192.168.0.6', '2022-12-19 15:54:45', '2022-12-19 15:54:45', 0);
INSERT INTO `user_login_record` VALUES (51, 4, '192.168.0.6', '2022-12-19 15:56:07', '2022-12-19 15:56:07', 0);
INSERT INTO `user_login_record` VALUES (52, 1, '192.168.0.6', '2022-12-19 15:57:33', '2022-12-19 15:57:33', 0);
INSERT INTO `user_login_record` VALUES (53, 4, '192.168.0.6', '2022-12-19 15:59:01', '2022-12-19 15:59:01', 0);
INSERT INTO `user_login_record` VALUES (54, 1, '192.168.0.6', '2022-12-19 16:41:24', '2022-12-19 16:41:24', 0);
INSERT INTO `user_login_record` VALUES (55, 4, '192.168.0.6', '2022-12-19 16:45:10', '2022-12-19 16:45:10', 0);
INSERT INTO `user_login_record` VALUES (56, 3, '192.168.0.6', '2022-12-19 16:48:36', '2022-12-19 16:48:36', 0);
INSERT INTO `user_login_record` VALUES (57, 4, '192.168.0.6', '2022-12-19 16:50:12', '2022-12-19 16:50:12', 0);
INSERT INTO `user_login_record` VALUES (58, 1, '192.168.2.16', '2022-12-19 19:56:04', '2022-12-19 19:56:04', 0);
INSERT INTO `user_login_record` VALUES (59, 4, '192.168.2.16', '2022-12-19 20:00:17', '2022-12-19 20:00:17', 0);
INSERT INTO `user_login_record` VALUES (60, 1, '192.168.2.16', '2022-12-19 20:22:43', '2022-12-19 20:22:43', 0);
INSERT INTO `user_login_record` VALUES (61, 4, '192.168.2.16', '2022-12-19 20:23:53', '2022-12-19 20:23:53', 0);
INSERT INTO `user_login_record` VALUES (62, 1, '192.168.2.16', '2022-12-19 20:24:57', '2022-12-19 20:24:57', 0);
INSERT INTO `user_login_record` VALUES (63, 1, '192.168.2.16', '2022-12-19 20:28:24', '2022-12-19 20:28:24', 0);
INSERT INTO `user_login_record` VALUES (64, 4, '192.168.2.16', '2022-12-19 20:33:23', '2022-12-19 20:33:23', 0);
INSERT INTO `user_login_record` VALUES (65, 1, '192.168.2.16', '2022-12-21 17:42:51', '2022-12-21 17:42:51', 0);

SET FOREIGN_KEY_CHECKS = 1;
