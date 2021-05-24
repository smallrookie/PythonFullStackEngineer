/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : flask_qa

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 24/05/2021 21:56:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts_user
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user`;
CREATE TABLE `accounts_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` smallint NULL DEFAULT NULL COMMENT '用户状态',
  `is_super` smallint NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user
-- ----------------------------
INSERT INTO `accounts_user` VALUES (1, '张三', '张三', '123123', NULL, 1, 0, '2021-05-24 21:09:17', '2021-05-24 21:09:19');

-- ----------------------------
-- Table structure for accounts_user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user_login_history`;
CREATE TABLE `accounts_user_login_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ua` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `accounts_user_login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user_login_history
-- ----------------------------

-- ----------------------------
-- Table structure for accounts_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user_profile`;
CREATE TABLE `accounts_user_profile`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `maxim` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `real_name`(`real_name`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `accounts_user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user_profile
-- ----------------------------
INSERT INTO `accounts_user_profile` VALUES (1, '张三', '张三', '真tm难', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for qa_answer
-- ----------------------------
DROP TABLE IF EXISTS `qa_answer`;
CREATE TABLE `qa_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_valid` tinyint(1) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `q_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  CONSTRAINT `qa_answer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer
-- ----------------------------

-- ----------------------------
-- Table structure for qa_answer_collect
-- ----------------------------
DROP TABLE IF EXISTS `qa_answer_collect`;
CREATE TABLE `qa_answer_collect`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `is_valid` tinyint(1) NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `q_id` int NULL DEFAULT NULL,
  `answer_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  INDEX `answer_id`(`answer_id`) USING BTREE,
  CONSTRAINT `qa_answer_collect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_collect_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_collect_ibfk_3` FOREIGN KEY (`answer_id`) REFERENCES `qa_answer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer_collect
-- ----------------------------

-- ----------------------------
-- Table structure for qa_answer_comment
-- ----------------------------
DROP TABLE IF EXISTS `qa_answer_comment`;
CREATE TABLE `qa_answer_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `love_count` int NULL DEFAULT NULL,
  `is_public` tinyint(1) NULL DEFAULT NULL,
  `is_valid` tinyint(1) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `reply_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `answer_id` int NULL DEFAULT NULL,
  `q_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reply_id`(`reply_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `answer_id`(`answer_id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  CONSTRAINT `qa_answer_comment_ibfk_1` FOREIGN KEY (`reply_id`) REFERENCES `qa_answer_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_comment_ibfk_3` FOREIGN KEY (`answer_id`) REFERENCES `qa_answer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_comment_ibfk_4` FOREIGN KEY (`q_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer_comment
-- ----------------------------

-- ----------------------------
-- Table structure for qa_answer_love
-- ----------------------------
DROP TABLE IF EXISTS `qa_answer_love`;
CREATE TABLE `qa_answer_love`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `answer_id` int NULL DEFAULT NULL,
  `q_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `answer_id`(`answer_id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  CONSTRAINT `qa_answer_love_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_love_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `qa_answer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_love_ibfk_3` FOREIGN KEY (`q_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer_love
-- ----------------------------

-- ----------------------------
-- Table structure for qa_question
-- ----------------------------
DROP TABLE IF EXISTS `qa_question`;
CREATE TABLE `qa_question`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view_count` int NULL DEFAULT NULL,
  `is_valid` tinyint(1) NULL DEFAULT NULL,
  `reorder` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `qa_question_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_question
-- ----------------------------
INSERT INTO `qa_question` VALUES (1, '钟南山团队从尿液中分离出新冠病毒，这对疫情防治有什么影响？', 'Vigorous Cooler： 尿液出现病毒并不罕见，但第一步是病毒要进入循环系统（血液、淋巴）。 比如寨卡病毒通过蚊子吸血进入循环系统，再进入泌尿系统。对于新型冠状病毒来说，第一步是通过呼吸系统进入下...', NULL, '27日，广州市政府新闻办在广州医科大学举办疫情防控专场新闻通气会，国家卫健委高级别专家组组长、国家呼吸系统疾病临床医学研究中心主任钟南山谈到疫情的预测时表示，疫情开始时，国外有流行病学家用权威的试验模型，预测2月初，中国感染新冠肺炎人数将达16万人。钟南山说：“这是没有考虑到国家的强力干预，也没有考虑春节后的延迟复工，我们也做了预测模型，2月中旬或下旬达到疫情高峰，确诊病例约六、七万人，投到国外权威期刊，被退了回来，感觉和上面的预测水平差太多，还有人给我微信‘你的话几天之内就会被碾个粉碎’。但事实上，我们预测更接近权威。”', NULL, 1, 1, '2021-05-24 21:19:53', '2021-05-24 21:19:58', 1);

-- ----------------------------
-- Table structure for qa_question_follow
-- ----------------------------
DROP TABLE IF EXISTS `qa_question_follow`;
CREATE TABLE `qa_question_follow`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `is_valid` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除',
  `user_id` int NULL DEFAULT NULL,
  `q_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  CONSTRAINT `qa_question_follow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_question_follow_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_question_follow
-- ----------------------------

-- ----------------------------
-- Table structure for qa_question_tags
-- ----------------------------
DROP TABLE IF EXISTS `qa_question_tags`;
CREATE TABLE `qa_question_tags`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_valid` tinyint(1) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `q_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  CONSTRAINT `qa_question_tags_ibfk_1` FOREIGN KEY (`q_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_question_tags
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
