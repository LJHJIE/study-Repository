/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : hfb

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 02/02/2023 16:40:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户code',
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '帐户可用余额',
  `freeze_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '投资中冻结金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (23, '9efd37101a1a4ee6ac24dfbd41e18ee0', 62700.00, 0.00, '2022-12-14 14:51:50', '2022-12-17 14:18:48', 0);
INSERT INTO `user_account` VALUES (24, 'faab5b1f05b2449c9c2abe6a2c9ced2c', 8800.00, 0.00, '2022-12-14 14:54:22', '2022-12-18 20:07:36', 0);
INSERT INTO `user_account` VALUES (25, '041ad4a7bd6847e589f136aeabefa80c', 0.00, 0.00, '2022-12-14 22:31:36', '2022-12-14 22:31:36', 0);
INSERT INTO `user_account` VALUES (26, 'a609a500a5fd4c3ab1328c8ae59c328e', 48375.00, 0.00, '2022-12-18 20:21:51', '2022-12-18 20:21:51', 0);

-- ----------------------------
-- Table structure for user_bind
-- ----------------------------
DROP TABLE IF EXISTS `user_bind`;
CREATE TABLE `user_bind`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `agent_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `agent_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'P2P商户的用户id',
  `personal_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户姓名',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证号',
  `bank_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行类型',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `return_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步访问地址',
  `notify_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异步回调地址',
  `timestamp` bigint(1) NULL DEFAULT NULL,
  `bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的汇付宝id',
  `pay_passwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付密码',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户绑定表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_bind
-- ----------------------------
INSERT INTO `user_bind` VALUES (23, 999888, '1', '龙', '17147619536', '431021200301014145', '212122200000000000', '民生银行', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1671000705149, '9efd37101a1a4ee6ac24dfbd41e18ee0', '123456', 0, '2022-12-14 14:51:50', '2022-12-14 22:08:00', 0);
INSERT INTO `user_bind` VALUES (24, 999888, '3', '锦', '13573658469', '431021525410230152', '210001000000000000', '工商银行', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1671000857975, 'faab5b1f05b2449c9c2abe6a2c9ced2c', '123456', 0, '2022-12-14 14:54:22', '2022-12-14 22:08:18', 0);
INSERT INTO `user_bind` VALUES (25, 999888, '2', '慢慢', '19573524676', '465855555555555555', '213420000000000000', '农业银行', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1671028285595, '041ad4a7bd6847e589f136aeabefa80c', '123456', 0, '2022-12-14 22:31:36', '2022-12-14 22:32:03', 0);
INSERT INTO `user_bind` VALUES (26, 999888, '4', '林', '19987874598', '46515458544511222', '43254000000000000', '瑞士银行', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1671366104197, 'a609a500a5fd4c3ab1328c8ae59c328e', '123456', 0, '2022-12-18 20:21:51', '2022-12-18 20:21:51', 0);

-- ----------------------------
-- Table structure for user_invest
-- ----------------------------
DROP TABLE IF EXISTS `user_invest`;
CREATE TABLE `user_invest`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `vote_bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '投资人绑定协议号',
  `benefit_bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '借款人绑定协议号',
  `agent_project_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目编号',
  `agent_project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目名称',
  `agent_bill_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商户订单号',
  `vote_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '投资金额',
  `vote_prize_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '投资奖励金额',
  `vote_fee_amt` decimal(10, 2) NULL DEFAULT 0.00 COMMENT 'P2P商户手续费',
  `project_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '项目总金额',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资备注',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态（0：默认 1：已放款 -1：已撤标）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户投资表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_invest
-- ----------------------------
INSERT INTO `user_invest` VALUES (2, '9efd37101a1a4ee6ac24dfbd41e18ee0', 'faab5b1f05b2449c9c2abe6a2c9ced2c', 'LEND20221213215642893', '白领贷001', 'INVEST20221218133918523', 10000.00, 0.00, 0.00, 100000.00, '', 1, '2022-12-18 13:39:24', '2022-12-18 13:43:22', 0);
INSERT INTO `user_invest` VALUES (3, '9efd37101a1a4ee6ac24dfbd41e18ee0', 'faab5b1f05b2449c9c2abe6a2c9ced2c', 'LEND20221213215642893', '白领贷001', 'INVEST20221218134021787', 30000.00, 0.00, 0.00, 100000.00, '', 1, '2022-12-18 13:40:26', '2022-12-18 13:43:22', 0);
INSERT INTO `user_invest` VALUES (4, '9efd37101a1a4ee6ac24dfbd41e18ee0', 'a609a500a5fd4c3ab1328c8ae59c328e', 'LEND20221218202435890', '教师贷001', 'INVEST20221218202601631', 50000.00, 0.00, 0.00, 100000.00, '', 1, '2022-12-18 20:26:06', '2022-12-18 20:26:36', 0);

-- ----------------------------
-- Table structure for user_item_return
-- ----------------------------
DROP TABLE IF EXISTS `user_item_return`;
CREATE TABLE `user_item_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_return_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '还款id',
  `agent_project_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '还款项目编号',
  `vote_bill_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '投资单号',
  `to_bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '收款人（投资人）',
  `transit_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款金额',
  `base_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款本金',
  `benifit_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款利息',
  `fee_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '商户手续费',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户还款明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_item_return
-- ----------------------------
INSERT INTO `user_item_return` VALUES (1, 1, 'LEND20221213215642893', 'INVEST20221218133918523', '9efd37101a1a4ee6ac24dfbd41e18ee0', 10300.00, 10000.00, 300.00, 0.00, NULL, 0, '2022-12-18 20:07:58', '2022-12-18 20:07:58', 0);
INSERT INTO `user_item_return` VALUES (2, 1, 'LEND20221213215642893', 'INVEST20221218134021787', '9efd37101a1a4ee6ac24dfbd41e18ee0', 30900.00, 30000.00, 900.00, 0.00, NULL, 0, '2022-12-18 20:07:58', '2022-12-18 20:07:58', 0);
INSERT INTO `user_item_return` VALUES (3, 4, 'LEND20221218202435890', 'INVEST20221218202601631', '9efd37101a1a4ee6ac24dfbd41e18ee0', 500.00, 0.00, 500.00, 0.00, NULL, 0, '2022-12-18 20:28:41', '2022-12-18 20:28:41', 0);
INSERT INTO `user_item_return` VALUES (4, 5, 'LEND20221218202435890', 'INVEST20221218202601631', '9efd37101a1a4ee6ac24dfbd41e18ee0', 500.00, 0.00, 500.00, 0.00, NULL, 0, '2022-12-18 20:29:29', '2022-12-18 20:29:29', 0);

-- ----------------------------
-- Table structure for user_return
-- ----------------------------
DROP TABLE IF EXISTS `user_return`;
CREATE TABLE `user_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `agent_goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商户商品名称',
  `agent_batch_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '批次号',
  `from_bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '还款人绑定协议号',
  `total_amt` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '还款总额',
  `vote_fee_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT 'P2P商户手续费',
  `data` json NULL COMMENT '还款明细数据',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户还款表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_return
-- ----------------------------
INSERT INTO `user_return` VALUES (1, '白领贷001', 'RETURN20221218134322232', 'faab5b1f05b2449c9c2abe6a2c9ced2c', 41200.00, 0.00, '[{\"feeAmt\": 0, \"baseAmt\": 10000, \"benifitAmt\": 300, \"toBindCode\": \"9efd37101a1a4ee6ac24dfbd41e18ee0\", \"transitAmt\": 10300, \"voteBillNo\": \"INVEST20221218133918523\", \"agentProjectCode\": \"LEND20221213215642893\"}, {\"feeAmt\": 0, \"baseAmt\": 30000, \"benifitAmt\": 900, \"toBindCode\": \"9efd37101a1a4ee6ac24dfbd41e18ee0\", \"transitAmt\": 30900, \"voteBillNo\": \"INVEST20221218134021787\", \"agentProjectCode\": \"LEND20221213215642893\"}]', '', 0, '2022-12-18 20:07:58', '2022-12-18 20:07:58', 0);
INSERT INTO `user_return` VALUES (2, '白领贷001', 'RETURN20221218134322849', 'faab5b1f05b2449c9c2abe6a2c9ced2c', 0.00, 0.00, '[]', '', 0, '2022-12-18 20:09:54', '2022-12-18 20:09:54', 0);
INSERT INTO `user_return` VALUES (3, '白领贷001', 'RETURN20221218134322756', 'faab5b1f05b2449c9c2abe6a2c9ced2c', 0.00, 0.00, '[]', '', 0, '2022-12-18 20:10:16', '2022-12-18 20:10:16', 0);
INSERT INTO `user_return` VALUES (4, '教师贷001', 'RETURN20221218202636113', 'a609a500a5fd4c3ab1328c8ae59c328e', 500.00, 0.00, '[{\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 500, \"toBindCode\": \"9efd37101a1a4ee6ac24dfbd41e18ee0\", \"transitAmt\": 500, \"voteBillNo\": \"INVEST20221218202601631\", \"agentProjectCode\": \"LEND20221218202435890\"}]', '', 0, '2022-12-18 20:28:41', '2022-12-18 20:28:41', 0);
INSERT INTO `user_return` VALUES (5, '教师贷001', 'RETURN20221218202636028', 'a609a500a5fd4c3ab1328c8ae59c328e', 500.00, 0.00, '[{\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 500, \"toBindCode\": \"9efd37101a1a4ee6ac24dfbd41e18ee0\", \"transitAmt\": 500, \"voteBillNo\": \"INVEST20221218202601631\", \"agentProjectCode\": \"LEND20221218202435890\"}]', '', 0, '2022-12-18 20:29:29', '2022-12-18 20:29:29', 0);

SET FOREIGN_KEY_CHECKS = 1;
