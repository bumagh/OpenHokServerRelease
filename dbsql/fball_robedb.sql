/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : fball_robedb

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-11-07 14:32:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `game_robe`
-- ----------------------------
DROP TABLE IF EXISTS `game_robe`;
CREATE TABLE `game_robe` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `robe_batch_id` int(20) NOT NULL COMMENT 'robe_batch_id',
  `robe_channel` varchar(32) NOT NULL COMMENT 'robe_channel',
  `part_cs` varchar(32) NOT NULL COMMENT 'part_cs',
  `robe_type` int(16) NOT NULL COMMENT 'robe_type',
  `robe_number` varchar(64) NOT NULL COMMENT 'robe_number',
  `robe_use_state` bit(1) NOT NULL DEFAULT b'0' COMMENT 'robe_use_state',
  `robe_start_time` datetime NOT NULL COMMENT 'robe_start_time',
  `robe_end_time` datetime NOT NULL COMMENT 'robe_end_time',
  `robe_del_state` bit(1) NOT NULL DEFAULT b'0' COMMENT 'robe_del_state',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_robe
-- ----------------------------
INSERT INTO `game_robe` VALUES ('7', '1', '100', '1', '1', '1e1bddf0-5e98-11e4-a0e4-74d4353947f8', '', '2014-10-28 19:46:57', '2014-11-04 19:46:57', '');
INSERT INTO `game_robe` VALUES ('8', '1', '100', '1', '1', '378f6b16-5e98-11e4-a0e4-74d4353947f8', '', '2014-10-28 19:47:39', '2014-11-04 19:47:39', '');
INSERT INTO `game_robe` VALUES ('9', '1', '100', '1', '1', '379758be-5e98-11e4-a0e4-74d4353947f8', '', '2014-10-28 19:47:39', '2014-11-04 19:47:39', '');
INSERT INTO `game_robe` VALUES ('10', '1', '100', '1', '1', '379fafa2-5e98-11e4-a0e4-74d4353947f8', '', '2014-10-28 19:47:39', '2014-11-04 19:47:39', '');
INSERT INTO `game_robe` VALUES ('11', '1', '100', '1', '1', '37a8fea9-5e98-11e4-a0e4-74d4353947f8', '', '2014-10-28 19:47:40', '2014-11-04 19:47:40', '');
