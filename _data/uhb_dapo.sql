/*
 Navicat Premium Data Transfer

 Source Server         : Lokal
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : uhb_dapo

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 05/03/2021 15:46:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adonis_schema
-- ----------------------------
DROP TABLE IF EXISTS `adonis_schema`;
CREATE TABLE `adonis_schema`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batch` int(11) NULL DEFAULT NULL,
  `migration_time` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adonis_schema
-- ----------------------------
INSERT INTO `adonis_schema` VALUES (1, '1503250034279_user', 1, '2021-03-05 14:45:10');
INSERT INTO `adonis_schema` VALUES (2, '1503250034280_token', 1, '2021-03-05 14:45:13');
INSERT INTO `adonis_schema` VALUES (3, '1614738526298_services_schema', 1, '2021-03-05 14:45:14');
INSERT INTO `adonis_schema` VALUES (4, '1614926118619_auth_group_schema', 1, '2021-03-05 14:45:15');
INSERT INTO `adonis_schema` VALUES (5, '1614926442450_auth_groups_user_schema', 1, '2021-03-05 14:45:15');

-- ----------------------------
-- Table structure for auth_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups`;
CREATE TABLE `auth_groups`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_groups_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_groups
-- ----------------------------
INSERT INTO `auth_groups` VALUES (1, 'dosen', 'Dosen', '2021-03-05 14:45:21', NULL, NULL);
INSERT INTO `auth_groups` VALUES (2, 'karyawan', 'Karyawan', '2021-03-05 14:45:21', NULL, NULL);
INSERT INTO `auth_groups` VALUES (3, 'mahasiswa', 'Mahasiswa', '2021-03-05 14:45:21', NULL, NULL);
INSERT INTO `auth_groups` VALUES (4, 'alumni', 'Alumni', '2021-03-05 14:45:21', NULL, NULL);

-- ----------------------------
-- Table structure for auth_groups_users
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups_users`;
CREATE TABLE `auth_groups_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_groups_users
-- ----------------------------
INSERT INTO `auth_groups_users` VALUES (1, 1, 1);
INSERT INTO `auth_groups_users` VALUES (2, 2, 2);
INSERT INTO `auth_groups_users` VALUES (3, 3, 3);
INSERT INTO `auth_groups_users` VALUES (4, 4, 4);

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `services_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (1, 'dapo', 'Data pokok', '1', '2021-03-05 14:45:21', NULL, NULL);
INSERT INTO `services` VALUES (2, 'siakad', 'Siakad', '1', '2021-03-05 14:45:21', NULL, NULL);

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_revoked` tinyint(1) NULL DEFAULT 0,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tokens_token_unique`(`token`) USING BTREE,
  INDEX `tokens_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `tokens_token_index`(`token`) USING BTREE,
  CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tokens
-- ----------------------------
INSERT INTO `tokens` VALUES (1, 1, '846c966e-9485-4f21-9eaa-ac237a8e0253', 'jwt_refresh_token', 0, '2021-03-05 14:55:20', '2021-03-05 14:55:20');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'demodosen', 'demodosen@mail.com', '$2a$10$2sCpYg33sTJhD/fiwUPLfOApzwlOxlQnYv0UpWKjE2rhXicVcTuke', '2021-03-05 14:45:22', NULL, NULL);
INSERT INTO `users` VALUES (2, 'demostaf', 'demostaf@mail.com', '$2a$10$yRpVvSeVy5QgU1jWZwgZ4ufP2ydFSTCU6pRP483YF.TkLKAZDqT86', '2021-03-05 14:45:22', NULL, NULL);
INSERT INTO `users` VALUES (3, 'demomhs', 'demomhs@mail.com', '$2a$10$It314JVV79gjXk96jb7QAuEbB8eDEUmjhami5Vb9UJY7OdOTtQ2kG', '2021-03-05 14:45:22', NULL, NULL);
INSERT INTO `users` VALUES (4, 'demoalumni', 'demoalumni@mail.com', '$2a$10$4RbznbZ0av1dIL49Bm9CqOxXflYzpY/nprkgqRDzKNWwMaQZ9iSPq', '2021-03-05 14:45:22', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
