/*
 Navicat Premium Data Transfer

 Source Server         : my
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : 127.0.0.1:3306
 Source Schema         : platform

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 28/04/2023 16:30:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_categories
-- ----------------------------
DROP TABLE IF EXISTS `t_categories`;
CREATE TABLE `t_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_categories
-- ----------------------------
BEGIN;
INSERT INTO `t_categories` (`id`, `name`, `parent_id`, `deleted`, `version`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, '水果', NULL, 0, 0, NULL, '2023-04-28 14:12:11', NULL, '2023-04-28 14:12:11');
INSERT INTO `t_categories` (`id`, `name`, `parent_id`, `deleted`, `version`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, '洗面奶', NULL, 0, 0, NULL, '2023-04-28 14:12:17', NULL, '2023-04-28 14:12:17');
COMMIT;

-- ----------------------------
-- Table structure for t_coupon
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon`;
CREATE TABLE `t_coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT '减价格',
  `meet_amount` decimal(10,2) NOT NULL COMMENT '满足价格',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `used_status` int NOT NULL DEFAULT '0' COMMENT '券状态',
  `number` varchar(50) DEFAULT NULL COMMENT '券码',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_coupon
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_order_items
-- ----------------------------
DROP TABLE IF EXISTS `t_order_items`;
CREATE TABLE `t_order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `product_name` varchar(50) NOT NULL COMMENT '商品名字	',
  `price` decimal(10,2) NOT NULL COMMENT '单价',
  `sum_price` decimal(10,2) NOT NULL COMMENT '总价',
  `order_status` int NOT NULL COMMENT '订单商品状态',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `count` int NOT NULL COMMENT '购买数量',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_order_items
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `count` int DEFAULT NULL COMMENT '总数量',
  `total` decimal(10,2) NOT NULL COMMENT '总金额',
  `order_status` int DEFAULT NULL COMMENT '订单状态',
  `coupon_id` bigint DEFAULT NULL COMMENT '优惠券',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '优惠金额',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1651499167692898307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
BEGIN;
INSERT INTO `t_orders` (`id`, `user_id`, `count`, `total`, `order_status`, `coupon_id`, `discount`, `deleted`, `version`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1651499167692898306, 111, NULL, 20.30, NULL, NULL, NULL, 0, 0, NULL, '2023-04-27 16:11:00', NULL, '2023-04-27 16:11:00');
COMMIT;

-- ----------------------------
-- Table structure for t_products
-- ----------------------------
DROP TABLE IF EXISTS `t_products`;
CREATE TABLE `t_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `count` int NOT NULL DEFAULT '0' COMMENT '库存',
  `category_id` int NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_products
-- ----------------------------
BEGIN;
INSERT INTO `t_products` (`id`, `name`, `description`, `image_url`, `price`, `count`, `category_id`, `category_name`, `deleted`, `version`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, '果冻橙', '果冻橙', 'https://img.alicdn.com/bao/uploaded/i3/2214658080417/O1CN01OIBplB1Ex1y0VrwBz_!!2214658080417.jpg', 21.99, 10, 1, '水果', 0, 0, NULL, '2023-04-28 14:02:13', NULL, '2023-04-28 14:03:57');
INSERT INTO `t_products` (`id`, `name`, `description`, `image_url`, `price`, `count`, `category_id`, `category_name`, `deleted`, `version`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, '柠檬', '柠檬', 'https://img.alicdn.com/bao/uploaded/O1CN01lSCMtG1tax6IT9lvb_!!6000000005919-0-yinhe.jpg', 22.18, 10, 1, '水果', 0, 0, NULL, '2023-04-28 14:03:09', NULL, '2023-04-28 14:03:09');
INSERT INTO `t_products` (`id`, `name`, `description`, `image_url`, `price`, `count`, `category_id`, `category_name`, `deleted`, `version`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, '苹果', '苹果', 'https://img.alicdn.com/bao/uploaded/O1CN01KYHF071imtf3t7xCA_!!6000000004456-0-yinhe.jpg', 10.11, 10, 1, '水果', 0, 0, NULL, '2023-04-28 14:03:52', NULL, '2023-04-28 14:03:52');
INSERT INTO `t_products` (`id`, `name`, `description`, `image_url`, `price`, `count`, `category_id`, `category_name`, `deleted`, `version`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, '小番茄', '小番茄', 'https://img.alicdn.com/bao/uploaded/O1CN01hDegja22wmYDxfNgk_!!6000000007185-0-yinhe.jpg', 20.11, 10, 1, '水果', 0, 0, NULL, '2023-04-28 14:04:48', NULL, '2023-04-28 14:04:48');
INSERT INTO `t_products` (`id`, `name`, `description`, `image_url`, `price`, `count`, `category_id`, `category_name`, `deleted`, `version`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (5, '半亩花田', '半亩花田', 'https://img.alicdn.com/bao/uploaded/O1CN019nRyPH1NQMGv9c6Wq_!!6000000001564-0-yinhe.jpg', 49.90, 200, 2, '洗面奶', 0, 0, NULL, '2023-04-28 14:09:16', NULL, '2023-04-28 14:10:25');
INSERT INTO `t_products` (`id`, `name`, `description`, `image_url`, `price`, `count`, `category_id`, `category_name`, `deleted`, `version`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (6, '雪玲妃', '雪玲妃', 'https://img.alicdn.com/bao/uploaded/O1CN01XYdHLv1Eg5KAUBGZu_!!6000000000380-0-yinhe.jpg', 34.90, 10, 2, '洗面奶', 0, 0, NULL, '2023-04-28 14:11:37', NULL, '2023-04-28 14:11:37');
COMMIT;

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_users
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
