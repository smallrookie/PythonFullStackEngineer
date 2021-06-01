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

 Date: 01/06/2021 10:18:45
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user
-- ----------------------------
INSERT INTO `accounts_user` VALUES (1, '张三', '张三', '123123', '/assets/home/qa/user_head.jpg', 1, 0, '2021-05-24 21:09:17', '2021-05-24 21:09:19');
INSERT INTO `accounts_user` VALUES (7, '小米', 'xiaomi', '123123', NULL, 1, 0, '2021-05-26 21:45:07', '2021-05-26 21:45:07');
INSERT INTO `accounts_user` VALUES (8, '小明', 'nick', '7410', NULL, 1, 0, '2021-05-26 21:46:59', '2021-05-26 21:46:59');
INSERT INTO `accounts_user` VALUES (9, '10000000002', 'admin', '7410', NULL, 1, 0, '2021-05-27 22:04:17', '2021-05-27 22:04:17');
INSERT INTO `accounts_user` VALUES (10, '10000000001', 'nick', 'd4758ff40ebce1b5d0980f165c14d660f4723e50cd8c59d25403cde2ad87edc6', NULL, 1, 0, '2021-05-27 22:14:36', '2021-05-27 22:14:36');

-- ----------------------------
-- Table structure for accounts_user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user_login_history`;
CREATE TABLE `accounts_user_login_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ua` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `accounts_user_login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user_login_history
-- ----------------------------
INSERT INTO `accounts_user_login_history` VALUES (1, '10000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-05-28 22:34:10', 9);
INSERT INTO `accounts_user_login_history` VALUES (2, '10000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-05-28 22:45:02', 9);
INSERT INTO `accounts_user_login_history` VALUES (3, '10000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-05-28 22:51:59', 9);
INSERT INTO `accounts_user_login_history` VALUES (4, '10000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-05-31 11:17:56', 9);
INSERT INTO `accounts_user_login_history` VALUES (5, '10000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-05-31 11:21:00', 9);
INSERT INTO `accounts_user_login_history` VALUES (6, '10000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-05-31 11:50:22', 9);
INSERT INTO `accounts_user_login_history` VALUES (7, '10000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-05-31 11:50:39', 9);
INSERT INTO `accounts_user_login_history` VALUES (8, '10000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-05-31 21:20:10', 9);
INSERT INTO `accounts_user_login_history` VALUES (9, '10000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-05-31 21:57:20', 9);

-- ----------------------------
-- Table structure for accounts_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user_profile`;
CREATE TABLE `accounts_user_profile`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user_profile
-- ----------------------------
INSERT INTO `accounts_user_profile` VALUES (1, '张三', '张三', '真tm难', NULL, NULL, NULL, NULL, 1);
INSERT INTO `accounts_user_profile` VALUES (2, '小米', NULL, NULL, NULL, NULL, '2021-05-26 21:45:07', '2021-05-26 21:45:07', 7);
INSERT INTO `accounts_user_profile` VALUES (3, '小明', NULL, NULL, NULL, NULL, '2021-05-26 21:46:59', '2021-05-26 21:46:59', 8);
INSERT INTO `accounts_user_profile` VALUES (4, '10000000002', NULL, NULL, NULL, NULL, '2021-05-27 22:04:17', '2021-05-27 22:04:17', 9);
INSERT INTO `accounts_user_profile` VALUES (5, '10000000001', NULL, NULL, NULL, NULL, '2021-05-27 22:14:36', '2021-05-27 22:14:36', 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer
-- ----------------------------
INSERT INTO `qa_answer` VALUES (1, '                            <p>不会，因为这次疫情和当年非典时候很不一样。</p>\r\n                            <p>2003年非典过后，不说别的行业，但当年的餐饮业、娱乐业、旅游业确实是有较大的反弹的。</p>\r\n                            <p>\r\n                                根据餐饮行业协会数据，2003年全国餐饮市场规模相比于2002年，增长了11.3%。考虑到2003年前半年非典对餐饮市场的打击（当时北京70%餐厅关门），这个数字证明在非典结束后一段时间里，在吃吃吃这件事情上，大家还是疯狂了一把的。\r\n                            </p>\r\n                            <p>\r\n                                我家有亲戚就是当时在浙江宁波开大型娱乐城，包含餐饮、ktv、洗脚按摩和棋牌等等的项目。反正当时的情况就是，在非典快结束的时候（差不多五月份），预定电话已经被打爆，一直排到了三个月后。。。\r\n                            </p>\r\n                            <p>中国人民在聚众吃饭、聚众娱乐、聚众玩耍这些事情上，还是很热情很疯狂的。</p>\r\n                            <p>不过，今年和2003年又有很大不同。</p>\r\n                            <p>其一、2003年，中国经济处于亚洲金融风暴后又一轮上升区间里。1998年至2007年连续十年高速增长且增速几乎一直升高。</p>\r\n                            <p>而且，2001年，中国刚刚加入世贸组织，创造了大量的就业机会，普通人的消费能力在当时极大提升。</p>\r\n                            <p>2003，虽然非典造成了数以千亿的损失，但由于中国经济正处在黄金发展期，当年GDP增长仍高达10%，比2002年还高出0.9%。</p>\r\n                            <p>而现在，中国经济正正在进入所谓“新常态”，换句话说也就是经济增长没那么快了，2020年gdp增长很有可能跌破6%。</p>\r\n                            <p>而且，中国加入世贸组织的红利已经接近枯竭，2003年那时候，欧美大国们还愿意与中国一起发大财，但现如今，大部分发达国家都在逐渐收回资本----</p>\r\n                            <p>一切都导致人们的工作机会越来越少，收入预期也越来越低，反应在消费上，就是消费信心越来越低，大家的危机感越来越重强。</p>\r\n                            <p class=\"ztext-empty-paragraph\"><br></p>\r\n                            <p>就算我们有钱，宁可存着，也不太会出现报复性消费了，万一下次又有大危机呢？在危机面前，现金才是王道。</p>\r\n                            <p>其二、当前的疫情防控级别是远高于2003年“非典”期间，人们对疫情的恐慌程度也远高于2003年。</p>\r\n                            <p>昨天晚饭时候，我爸妈说起，他们活了50多年，也是第一次遇到这种全国街道上空无一人的情况。</p>\r\n                            <p>在2003年，除了北京和广州几个重点区域，全国并没有所谓的封城、封路、封村等等动作。</p>\r\n                            <p>而今天，全国的疫情的防控等级都极高。</p>\r\n                            <p>无限期的延迟复工，其实对互联网行业影响有限，遭受更大打击的还是吸收了最大量就业人口的传统行业：从农业牲畜养殖到高端新品制造，都受到了毁灭性的破坏。</p>\r\n                            <p>再者，今年的互联网技术和2003年相比，已经不可同日而语。</p>\r\n                            <p>互联网技术爆炸，让资讯流通爆炸，也让今年人们的恐慌程度远高于2003年。</p>\r\n                            <p>在2003年，绝大部分人其实对sars感觉不明显，毕竟全国也就这么几千例。</p>\r\n                            <p>再加上当时的主要媒体天天播送的都是正能量新闻，人们都没有觉得事情有多么严重，依然希望出去吃喝玩乐。</p>\r\n                            <p>而今年，恐慌似乎伴随着每一个中国人，人们对于“”线下集聚”这件事情，在心理上产生了巨大阴影。</p>\r\n                            <p>这种心理的恐惧，不会随着疫情解除而立马消失，而会有一个较长的惯性期。</p>\r\n                            <p>这种惯性，或许会让人们的消费信心，在很长一段时间里，都无法复苏。</p>', 1, '2021-05-25 21:38:46', '2021-05-25 21:38:49', 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer_comment
-- ----------------------------
INSERT INTO `qa_answer_comment` VALUES (5, '不能这么说，是他们的眼界让他们不能接受。现在中国做到的事是让他们世界观崩塌的事[飙泪笑][飙泪笑]', 7410, 1, 1, '2021-05-25 22:42:51', '2021-05-25 22:42:53', NULL, 1, 1, 1);
INSERT INTO `qa_answer_comment` VALUES (6, '不能这么说，是他们的眼界让他们不能接受。现在中国做到的事是让他们世界观崩塌的事[飙泪笑][飙泪笑]', 852, 1, 1, '2021-05-25 22:43:39', '2021-05-25 22:43:41', 5, 1, 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_question
-- ----------------------------
INSERT INTO `qa_question` VALUES (1, '钟南山团队从尿液中分离出新冠病毒，这对疫情防治有什么影响？', 'Vigorous Cooler： 尿液出现病毒并不罕见，但第一步是病毒要进入循环系统（血液、淋巴）。 比如寨卡病毒通过蚊子吸血进入循环系统，再进入泌尿系统。对于新型冠状病毒来说，第一步是通过呼吸系统进入下...', NULL, '27日，广州市政府新闻办在广州医科大学举办疫情防控专场新闻通气会，国家卫健委高级别专家组组长、国家呼吸系统疾病临床医学研究中心主任钟南山谈到疫情的预测时表示，疫情开始时，国外有流行病学家用权威的试验模型，预测2月初，中国感染新冠肺炎人数将达16万人。钟南山说：“这是没有考虑到国家的强力干预，也没有考虑春节后的延迟复工，我们也做了预测模型，2月中旬或下旬达到疫情高峰，确诊病例约六、七万人，投到国外权威期刊，被退了回来，感觉和上面的预测水平差太多，还有人给我微信‘你的话几天之内就会被碾个粉碎’。但事实上，我们预测更接近权威。”', 123456, 1, 1, '2021-05-24 21:19:53', '2021-05-24 21:19:58', 1);
INSERT INTO `qa_question` VALUES (2, '测试', '测试', NULL, '测试测试测试测试测试测试测试测试测试', 0, 1, 0, '2021-05-31 21:53:13', '2021-05-31 21:53:13', 9);
INSERT INTO `qa_question` VALUES (3, '测试', '测试', NULL, '测试测试测试测试测试测试测试测试测试', 0, 1, 0, '2021-05-31 21:53:16', '2021-05-31 21:53:16', 9);
INSERT INTO `qa_question` VALUES (4, '测试', '测试', NULL, '测试测试测试测试测试', 0, 1, 0, '2021-05-31 21:54:03', '2021-05-31 21:54:03', 9);
INSERT INTO `qa_question` VALUES (5, '测试', '测试', NULL, '测试测试测试测试测试', 0, 1, 0, '2021-05-31 21:55:30', '2021-05-31 21:55:30', 9);
INSERT INTO `qa_question` VALUES (6, '测试测试', '测试测试', NULL, '测试测试测试测试测试', 0, 1, 0, '2021-05-31 21:55:45', '2021-05-31 21:55:45', 9);
INSERT INTO `qa_question` VALUES (7, '反馈测试', '测试', NULL, '反馈测试反馈测试', 0, 1, 0, '2021-05-31 21:57:40', '2021-05-31 21:57:40', 9);
INSERT INTO `qa_question` VALUES (8, '反馈测试', '测试', NULL, '反馈测试反馈测试', 0, 1, 0, '2021-05-31 21:57:52', '2021-05-31 21:57:52', 9);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_question_tags
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
