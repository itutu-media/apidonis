/*
 Navicat Premium Data Transfer

 Source Server         : Lokal
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : uhb.dapo

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 03/03/2021 11:53:04
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adonis_schema
-- ----------------------------
INSERT INTO `adonis_schema` VALUES (1, '1503250034279_user', 1, '2021-03-03 09:13:29');
INSERT INTO `adonis_schema` VALUES (2, '1503250034280_token', 1, '2021-03-03 09:13:32');
INSERT INTO `adonis_schema` VALUES (3, '1614738526298_services_schema', 2, '2021-03-03 09:33:27');

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT current_timestamp(0),
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `services_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (1, 'dapo', 'Data pokok', '1', '2021-03-03 09:45:19', NULL);
INSERT INTO `services` VALUES (2, 'siakad', 'Siakad', '1', '2021-03-03 09:45:19', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tokens
-- ----------------------------
INSERT INTO `tokens` VALUES (3, 1, '2156cca5-2718-4944-8917-d70ac7303bf9', 'jwt_refresh_token', 0, '2021-03-03 11:46:15', '2021-03-03 11:46:15');
INSERT INTO `tokens` VALUES (4, 1, '6b7a408a-ab24-40e9-8de7-c011a1e6b3b3', 'jwt_refresh_token', 0, '2021-03-03 11:48:18', '2021-03-03 11:48:18');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT current_timestamp(0),
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'demouser', 'demo@mail.com', '$argon2i$v=19$m=4096,t=3,p=1$dP5Wsdb51vw68dlDPdbXEA$1RZ4PU+OXTUOyjl6tHUM/vDY/SsyMNMzqHHNT5ff5w8', '2021-03-03 11:45:02', NULL);
INSERT INTO `users` VALUES (2, 'demouser2', 'demo2@mail.com', '$argon2i$v=19$m=4096,t=3,p=1$cmvO7S8OU6DtmoJsmInVrg$PKhqj/DYaZuRHVh2sa0c584OS4pPGLano7s9JlQjBhQ', '2021-03-03 11:45:02', NULL);

SET FOREIGN_KEY_CHECKS = 1;
