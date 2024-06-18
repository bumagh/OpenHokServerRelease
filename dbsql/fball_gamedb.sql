/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : fball_gamedb_1

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-12-19 16:01:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gameuser`
-- ----------------------------
DROP TABLE IF EXISTS `gameuser`;
CREATE TABLE `gameuser` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `obj_id` bigint(20) unsigned NOT NULL,
  `sdk_id` int(8) DEFAULT '0',
  `obj_cdkey` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `obj_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `obj_sex` int(4) NOT NULL DEFAULT '0',
  `obj_lv` int(8) NOT NULL DEFAULT '0',
  `obj_score` bigint(20) NOT NULL DEFAULT '0',
  `obj_headid` int(8) NOT NULL DEFAULT '0',
  `obj_diamond` bigint(16) NOT NULL DEFAULT '0',
  `obj_gold` bigint(20) NOT NULL DEFAULT '0',
  `obj_register_time` bigint(20) NOT NULL DEFAULT '0',
  `obj_last_login_time` bigint(20) NOT NULL DEFAULT '0',
  `obj_game_inns` int(16) NOT NULL DEFAULT '0',
  `obj_game_winns` int(16) NOT NULL DEFAULT '0',
  `obj_kill_hero_num` int(16) NOT NULL DEFAULT '0',
  `obj_ass_kill_num` int(16) NOT NULL DEFAULT '0',
  `obj_dest_building_num` int(16) NOT NULL DEFAULT '0',
  `obj_dead_num` int(16) NOT NULL DEFAULT '0',
  `obj_first_win_time` bigint(20) NOT NULL DEFAULT '0',
  `obj_cur_lv_exp` int(11) NOT NULL DEFAULT '0',
  `obj_cldays` int(8) NOT NULL DEFAULT '0',
  `obj_friends` text COLLATE utf8_unicode_ci,
  `obj_last_loginreward_time` int(16) unsigned zerofill DEFAULT NULL,
  `obj_vip_lv` int(8) NOT NULL DEFAULT '0',
  `obj_vip_score` int(16) NOT NULL DEFAULT '0',
  `obj_task_data` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`obj_id`),
  KEY `eUserPlatform` (`sdk_id`),
  KEY `szUserName` (`obj_cdkey`),
  KEY `szNickName` (`obj_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1576 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gameuser
-- ----------------------------

-- ----------------------------
-- Table structure for `gameuser_guide`
-- ----------------------------
DROP TABLE IF EXISTS `gameuser_guide`;
CREATE TABLE `gameuser_guide` (
  `obj_id` bigint(20) NOT NULL,
  `obj_cs_guide_com_steps` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `obj_ss_battle_steps` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gameuser_guide
-- ----------------------------

-- ----------------------------
-- Table structure for `gameuser_hero`
-- ----------------------------
DROP TABLE IF EXISTS `gameuser_hero`;
CREATE TABLE `gameuser_hero` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `hero_id` int(12) NOT NULL,
  `hero_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'hero_end_time',
  `hero_buy_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'hero_buy_time',
  `del_state` bit(1) NOT NULL DEFAULT b'0' COMMENT 'del_state',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gameuser_hero
-- ----------------------------

-- ----------------------------
-- Table structure for `gameuser_item`
-- ----------------------------
DROP TABLE IF EXISTS `gameuser_item`;
CREATE TABLE `gameuser_item` (
  `user_id` int(12) NOT NULL,
  `item_id` bigint(20) NOT NULL DEFAULT '0',
  `item_num` int(8) NOT NULL DEFAULT '0',
  `buy_time` int(12) NOT NULL,
  `end_time` int(12) NOT NULL,
  PRIMARY KEY (`user_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gameuser_item
-- ----------------------------

-- ----------------------------
-- Table structure for `gameuser_mail`
-- ----------------------------
DROP TABLE IF EXISTS `gameuser_mail`;
CREATE TABLE `gameuser_mail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `mail_id` int(20) NOT NULL COMMENT 'mailid',
  `user_id` int(20) NOT NULL,
  `mail_state` int(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gameuser_mail
-- ----------------------------

-- ----------------------------
-- Table structure for `gameuser_money`
-- ----------------------------
DROP TABLE IF EXISTS `gameuser_money`;
CREATE TABLE `gameuser_money` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obj_id` bigint(20) NOT NULL,
  `obj_diamond` int(12) NOT NULL DEFAULT '0',
  `obj_gold` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gameuser_money
-- ----------------------------

-- ----------------------------
-- Table structure for `gameuser_runne`
-- ----------------------------
DROP TABLE IF EXISTS `gameuser_runne`;
CREATE TABLE `gameuser_runne` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `runnebag_json` text,
  `runeslot_json` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gameuser_runne
-- ----------------------------

-- ----------------------------
-- Table structure for `gameuser_sns`
-- ----------------------------
DROP TABLE IF EXISTS `gameuser_sns`;
CREATE TABLE `gameuser_sns` (
  `user_id` int(12) NOT NULL,
  `related_id` int(12) NOT NULL,
  `relation` int(8) NOT NULL,
  PRIMARY KEY (`user_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gameuser_sns
-- ----------------------------

-- ----------------------------
-- Table structure for `game_mail`
-- ----------------------------
DROP TABLE IF EXISTS `game_mail`;
CREATE TABLE `game_mail` (
  `mail_id` int(20) NOT NULL,
  `mail_sdk` int(8) NOT NULL DEFAULT '0',
  `mail_type` int(12) NOT NULL DEFAULT '0' COMMENT 'mail_type',
  `mail_user_id` int(20) DEFAULT NULL COMMENT 'mail_user_id',
  `mail_title` varchar(128) NOT NULL COMMENT 'mail title',
  `mail_content` text NOT NULL COMMENT 'content',
  `mail_gift` text COMMENT 'mail_gift',
  `mail_send` varchar(64) DEFAULT NULL,
  `mail_create_time` varchar(32) NOT NULL COMMENT 'mail_create_time',
  `mail_over_time` varchar(32) NOT NULL,
  `mail_del_state` int(8) NOT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_mail
-- ----------------------------

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `platform_id` int(12) NOT NULL,
  `title` varchar(20) NOT NULL,
  `eflag` int(8) NOT NULL DEFAULT '0',
  `estate` int(8) NOT NULL DEFAULT '0',
  `priority` int(8) NOT NULL DEFAULT '0',
  `notice` varchar(200) NOT NULL,
  `star_time` int(16) NOT NULL DEFAULT '0',
  `end_time` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
