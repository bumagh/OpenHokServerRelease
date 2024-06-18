-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2024-06-17 23:36:17
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `fball_accountdb`
--
CREATE DATABASE IF NOT EXISTS `fball_accountdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fball_accountdb`;

-- --------------------------------------------------------

--
-- 表的结构 `account_user`
--

CREATE TABLE `account_user` (
  `id` int(11) NOT NULL,
  `cs_id` int(10) UNSIGNED NOT NULL,
  `sdk_id` int(10) UNSIGNED NOT NULL,
  `cdkey` varchar(32) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `account_user`
--

INSERT INTO `account_user` (`id`, `cs_id`, `sdk_id`, `cdkey`, `user_name`) VALUES
(1001, 1, 0, '123', '恒渊护法');

-- --------------------------------------------------------

--
-- 表的结构 `cdkey_events`
--

CREATE TABLE `cdkey_events` (
  `event_id` int(20) NOT NULL,
  `event_title` varchar(32) DEFAULT NULL,
  `event_platform` int(8) NOT NULL,
  `event_end_time` int(20) NOT NULL,
  `event_content` varchar(150) DEFAULT NULL,
  `event_type` int(8) NOT NULL,
  `event_item` varchar(32) DEFAULT NULL,
  `event_code_num` int(8) NOT NULL,
  `event_code_len` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cdkey_info`
--

CREATE TABLE `cdkey_info` (
  `cdkey` varchar(32) NOT NULL,
  `event_id` int(20) NOT NULL,
  `use_state` int(8) NOT NULL,
  `use_time` int(20) NOT NULL,
  `server_id` int(16) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `account_user`
--
ALTER TABLE `account_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name_check` (`user_name`) USING BTREE;

--
-- 表的索引 `cdkey_events`
--
ALTER TABLE `cdkey_events`
  ADD PRIMARY KEY (`event_id`);

--
-- 表的索引 `cdkey_info`
--
ALTER TABLE `cdkey_info`
  ADD PRIMARY KEY (`cdkey`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `account_user`
--
ALTER TABLE `account_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;
--
-- 数据库： `fball_chargedb`
--
CREATE DATABASE IF NOT EXISTS `fball_chargedb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fball_chargedb`;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_charge`
--

CREATE TABLE `gameuser_charge` (
  `id` bigint(20) NOT NULL,
  `charge_cs_id` bigint(20) DEFAULT NULL COMMENT '充值区服',
  `charge_account` varchar(32) NOT NULL COMMENT '充值账号',
  `charge_channel` varchar(32) NOT NULL COMMENT '充值平台',
  `charge_amount` int(12) NOT NULL COMMENT '充值金额',
  `charge_uuid` varchar(32) NOT NULL COMMENT '充值订单',
  `charge_state` bit(1) NOT NULL DEFAULT b'0' COMMENT '充值成功:0失败,1成功',
  `charge_start_time` datetime NOT NULL COMMENT '充值时间',
  `charge_end_time` datetime DEFAULT NULL COMMENT '充值成功时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_money`
--

CREATE TABLE `gameuser_money` (
  `id` bigint(20) NOT NULL,
  `obj_id` bigint(20) NOT NULL,
  `obj_diamond` int(12) NOT NULL DEFAULT '0',
  `obj_gold` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `gameuser_charge`
--
ALTER TABLE `gameuser_charge`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_money`
--
ALTER TABLE `gameuser_money`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `gameuser_charge`
--
ALTER TABLE `gameuser_charge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gameuser_money`
--
ALTER TABLE `gameuser_money`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `fball_gamedb_1`
--
CREATE DATABASE IF NOT EXISTS `fball_gamedb_1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fball_gamedb_1`;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser`
--

CREATE TABLE `gameuser` (
  `id` int(20) NOT NULL,
  `obj_id` bigint(20) UNSIGNED NOT NULL,
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
  `obj_last_loginreward_time` int(16) UNSIGNED ZEROFILL DEFAULT NULL,
  `obj_vip_lv` int(8) NOT NULL DEFAULT '0',
  `obj_vip_score` int(16) NOT NULL DEFAULT '0',
  `obj_task_data` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `gameuser`
--

INSERT INTO `gameuser` (`id`, `obj_id`, `sdk_id`, `obj_cdkey`, `obj_name`, `obj_sex`, `obj_lv`, `obj_score`, `obj_headid`, `obj_diamond`, `obj_gold`, `obj_register_time`, `obj_last_login_time`, `obj_game_inns`, `obj_game_winns`, `obj_kill_hero_num`, `obj_ass_kill_num`, `obj_dest_building_num`, `obj_dead_num`, `obj_first_win_time`, `obj_cur_lv_exp`, `obj_cldays`, `obj_friends`, `obj_last_loginreward_time`, `obj_vip_lv`, `obj_vip_score`, `obj_task_data`) VALUES
(1576, 1001, 0, '123', '恒渊护法', 1, 1, 0, 12, 0, 0, 1718632891, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0000000000000000, 1, 0, '2460479,10001:0,10002:0,');

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_guide`
--

CREATE TABLE `gameuser_guide` (
  `obj_id` bigint(20) NOT NULL,
  `obj_cs_guide_com_steps` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `obj_ss_battle_steps` varchar(128) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `gameuser_guide`
--

INSERT INTO `gameuser_guide` (`obj_id`, `obj_cs_guide_com_steps`, `obj_ss_battle_steps`) VALUES
(1001, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_hero`
--

CREATE TABLE `gameuser_hero` (
  `id` int(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `hero_id` int(12) NOT NULL,
  `hero_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'hero_end_time',
  `hero_buy_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'hero_buy_time',
  `del_state` bit(1) NOT NULL DEFAULT b'0' COMMENT 'del_state'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_item`
--

CREATE TABLE `gameuser_item` (
  `user_id` int(12) NOT NULL,
  `item_id` bigint(20) NOT NULL DEFAULT '0',
  `item_num` int(8) NOT NULL DEFAULT '0',
  `buy_time` int(12) NOT NULL,
  `end_time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_mail`
--

CREATE TABLE `gameuser_mail` (
  `id` int(20) NOT NULL,
  `mail_id` int(20) NOT NULL COMMENT 'mailid',
  `user_id` int(20) NOT NULL,
  `mail_state` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_money`
--

CREATE TABLE `gameuser_money` (
  `id` bigint(20) NOT NULL,
  `obj_id` bigint(20) NOT NULL,
  `obj_diamond` int(12) NOT NULL DEFAULT '0',
  `obj_gold` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_runne`
--

CREATE TABLE `gameuser_runne` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `runnebag_json` text,
  `runeslot_json` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gameuser_runne`
--

INSERT INTO `gameuser_runne` (`id`, `user_id`, `runnebag_json`, `runeslot_json`) VALUES
(1618, 1001, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_sns`
--

CREATE TABLE `gameuser_sns` (
  `user_id` int(12) NOT NULL,
  `related_id` int(12) NOT NULL,
  `relation` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `game_mail`
--

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
  `mail_del_state` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `notice`
--

CREATE TABLE `notice` (
  `id` int(20) NOT NULL,
  `platform_id` int(12) NOT NULL,
  `title` varchar(20) NOT NULL,
  `eflag` int(8) NOT NULL DEFAULT '0',
  `estate` int(8) NOT NULL DEFAULT '0',
  `priority` int(8) NOT NULL DEFAULT '0',
  `notice` varchar(200) NOT NULL,
  `star_time` int(16) NOT NULL DEFAULT '0',
  `end_time` int(16) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `gameuser`
--
ALTER TABLE `gameuser`
  ADD PRIMARY KEY (`id`,`obj_id`),
  ADD KEY `eUserPlatform` (`sdk_id`),
  ADD KEY `szUserName` (`obj_cdkey`),
  ADD KEY `szNickName` (`obj_name`);

--
-- 表的索引 `gameuser_guide`
--
ALTER TABLE `gameuser_guide`
  ADD PRIMARY KEY (`obj_id`);

--
-- 表的索引 `gameuser_hero`
--
ALTER TABLE `gameuser_hero`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_item`
--
ALTER TABLE `gameuser_item`
  ADD PRIMARY KEY (`user_id`,`item_id`);

--
-- 表的索引 `gameuser_mail`
--
ALTER TABLE `gameuser_mail`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_money`
--
ALTER TABLE `gameuser_money`
  ADD PRIMARY KEY (`id`,`obj_id`);

--
-- 表的索引 `gameuser_runne`
--
ALTER TABLE `gameuser_runne`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_sns`
--
ALTER TABLE `gameuser_sns`
  ADD PRIMARY KEY (`user_id`,`related_id`);

--
-- 表的索引 `game_mail`
--
ALTER TABLE `game_mail`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `mail_id` (`mail_id`);

--
-- 表的索引 `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `gameuser`
--
ALTER TABLE `gameuser`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1577;

--
-- 使用表AUTO_INCREMENT `gameuser_hero`
--
ALTER TABLE `gameuser_hero`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gameuser_mail`
--
ALTER TABLE `gameuser_mail`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `gameuser_money`
--
ALTER TABLE `gameuser_money`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gameuser_runne`
--
ALTER TABLE `gameuser_runne`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1619;

--
-- 使用表AUTO_INCREMENT `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `fball_gamedb_2`
--
CREATE DATABASE IF NOT EXISTS `fball_gamedb_2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fball_gamedb_2`;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser`
--

CREATE TABLE `gameuser` (
  `id` int(20) NOT NULL,
  `obj_id` bigint(20) UNSIGNED NOT NULL,
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
  `obj_last_loginreward_time` int(16) UNSIGNED ZEROFILL DEFAULT NULL,
  `obj_vip_lv` int(8) NOT NULL DEFAULT '0',
  `obj_vip_score` int(16) NOT NULL DEFAULT '0',
  `obj_task_data` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_guide`
--

CREATE TABLE `gameuser_guide` (
  `obj_id` bigint(20) NOT NULL,
  `obj_cs_guide_com_steps` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `obj_ss_battle_steps` varchar(128) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_hero`
--

CREATE TABLE `gameuser_hero` (
  `id` int(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `hero_id` int(12) NOT NULL,
  `hero_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'hero_end_time',
  `hero_buy_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'hero_buy_time',
  `del_state` bit(1) NOT NULL DEFAULT b'0' COMMENT 'del_state'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_item`
--

CREATE TABLE `gameuser_item` (
  `user_id` int(12) NOT NULL,
  `item_id` bigint(20) NOT NULL DEFAULT '0',
  `item_num` int(8) NOT NULL DEFAULT '0',
  `buy_time` int(12) NOT NULL,
  `end_time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_mail`
--

CREATE TABLE `gameuser_mail` (
  `id` int(20) NOT NULL,
  `mail_id` int(20) NOT NULL COMMENT 'mailid',
  `user_id` int(20) NOT NULL,
  `mail_state` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_money`
--

CREATE TABLE `gameuser_money` (
  `id` bigint(20) NOT NULL,
  `obj_id` bigint(20) NOT NULL,
  `obj_diamond` int(12) NOT NULL DEFAULT '0',
  `obj_gold` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_runne`
--

CREATE TABLE `gameuser_runne` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `runnebag_json` text,
  `runeslot_json` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_sns`
--

CREATE TABLE `gameuser_sns` (
  `user_id` int(12) NOT NULL,
  `related_id` int(12) NOT NULL,
  `relation` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `game_mail`
--

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
  `mail_del_state` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `notice`
--

CREATE TABLE `notice` (
  `id` int(20) NOT NULL,
  `platform_id` int(12) NOT NULL,
  `title` varchar(20) NOT NULL,
  `eflag` int(8) NOT NULL DEFAULT '0',
  `estate` int(8) NOT NULL DEFAULT '0',
  `priority` int(8) NOT NULL DEFAULT '0',
  `notice` varchar(200) NOT NULL,
  `star_time` int(16) NOT NULL DEFAULT '0',
  `end_time` int(16) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `gameuser`
--
ALTER TABLE `gameuser`
  ADD PRIMARY KEY (`id`,`obj_id`),
  ADD KEY `eUserPlatform` (`sdk_id`),
  ADD KEY `szUserName` (`obj_cdkey`),
  ADD KEY `szNickName` (`obj_name`);

--
-- 表的索引 `gameuser_guide`
--
ALTER TABLE `gameuser_guide`
  ADD PRIMARY KEY (`obj_id`);

--
-- 表的索引 `gameuser_hero`
--
ALTER TABLE `gameuser_hero`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_item`
--
ALTER TABLE `gameuser_item`
  ADD PRIMARY KEY (`user_id`,`item_id`);

--
-- 表的索引 `gameuser_mail`
--
ALTER TABLE `gameuser_mail`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_money`
--
ALTER TABLE `gameuser_money`
  ADD PRIMARY KEY (`id`,`obj_id`);

--
-- 表的索引 `gameuser_runne`
--
ALTER TABLE `gameuser_runne`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_sns`
--
ALTER TABLE `gameuser_sns`
  ADD PRIMARY KEY (`user_id`,`related_id`);

--
-- 表的索引 `game_mail`
--
ALTER TABLE `game_mail`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `mail_id` (`mail_id`);

--
-- 表的索引 `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `gameuser`
--
ALTER TABLE `gameuser`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1576;

--
-- 使用表AUTO_INCREMENT `gameuser_hero`
--
ALTER TABLE `gameuser_hero`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gameuser_mail`
--
ALTER TABLE `gameuser_mail`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `gameuser_money`
--
ALTER TABLE `gameuser_money`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gameuser_runne`
--
ALTER TABLE `gameuser_runne`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1618;

--
-- 使用表AUTO_INCREMENT `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `fball_gamedb_3`
--
CREATE DATABASE IF NOT EXISTS `fball_gamedb_3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fball_gamedb_3`;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser`
--

CREATE TABLE `gameuser` (
  `id` int(20) NOT NULL,
  `obj_id` bigint(20) UNSIGNED NOT NULL,
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
  `obj_last_loginreward_time` int(16) UNSIGNED ZEROFILL DEFAULT NULL,
  `obj_vip_lv` int(8) NOT NULL DEFAULT '0',
  `obj_vip_score` int(16) NOT NULL DEFAULT '0',
  `obj_task_data` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_guide`
--

CREATE TABLE `gameuser_guide` (
  `obj_id` bigint(20) NOT NULL,
  `obj_cs_guide_com_steps` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `obj_ss_battle_steps` varchar(128) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_hero`
--

CREATE TABLE `gameuser_hero` (
  `id` int(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `hero_id` int(12) NOT NULL,
  `hero_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'hero_end_time',
  `hero_buy_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'hero_buy_time',
  `del_state` bit(1) NOT NULL DEFAULT b'0' COMMENT 'del_state'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_item`
--

CREATE TABLE `gameuser_item` (
  `user_id` int(12) NOT NULL,
  `item_id` bigint(20) NOT NULL DEFAULT '0',
  `item_num` int(8) NOT NULL DEFAULT '0',
  `buy_time` int(12) NOT NULL,
  `end_time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_mail`
--

CREATE TABLE `gameuser_mail` (
  `id` int(20) NOT NULL,
  `mail_id` int(20) NOT NULL COMMENT 'mailid',
  `user_id` int(20) NOT NULL,
  `mail_state` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_money`
--

CREATE TABLE `gameuser_money` (
  `id` bigint(20) NOT NULL,
  `obj_id` bigint(20) NOT NULL,
  `obj_diamond` int(12) NOT NULL DEFAULT '0',
  `obj_gold` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_runne`
--

CREATE TABLE `gameuser_runne` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `runnebag_json` text,
  `runeslot_json` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gameuser_sns`
--

CREATE TABLE `gameuser_sns` (
  `user_id` int(12) NOT NULL,
  `related_id` int(12) NOT NULL,
  `relation` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `game_mail`
--

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
  `mail_del_state` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `notice`
--

CREATE TABLE `notice` (
  `id` int(20) NOT NULL,
  `platform_id` int(12) NOT NULL,
  `title` varchar(20) NOT NULL,
  `eflag` int(8) NOT NULL DEFAULT '0',
  `estate` int(8) NOT NULL DEFAULT '0',
  `priority` int(8) NOT NULL DEFAULT '0',
  `notice` varchar(200) NOT NULL,
  `star_time` int(16) NOT NULL DEFAULT '0',
  `end_time` int(16) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `gameuser`
--
ALTER TABLE `gameuser`
  ADD PRIMARY KEY (`id`,`obj_id`),
  ADD KEY `eUserPlatform` (`sdk_id`),
  ADD KEY `szUserName` (`obj_cdkey`),
  ADD KEY `szNickName` (`obj_name`);

--
-- 表的索引 `gameuser_guide`
--
ALTER TABLE `gameuser_guide`
  ADD PRIMARY KEY (`obj_id`);

--
-- 表的索引 `gameuser_hero`
--
ALTER TABLE `gameuser_hero`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_item`
--
ALTER TABLE `gameuser_item`
  ADD PRIMARY KEY (`user_id`,`item_id`);

--
-- 表的索引 `gameuser_mail`
--
ALTER TABLE `gameuser_mail`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_money`
--
ALTER TABLE `gameuser_money`
  ADD PRIMARY KEY (`id`,`obj_id`);

--
-- 表的索引 `gameuser_runne`
--
ALTER TABLE `gameuser_runne`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gameuser_sns`
--
ALTER TABLE `gameuser_sns`
  ADD PRIMARY KEY (`user_id`,`related_id`);

--
-- 表的索引 `game_mail`
--
ALTER TABLE `game_mail`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `mail_id` (`mail_id`);

--
-- 表的索引 `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `gameuser`
--
ALTER TABLE `gameuser`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1576;

--
-- 使用表AUTO_INCREMENT `gameuser_hero`
--
ALTER TABLE `gameuser_hero`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gameuser_mail`
--
ALTER TABLE `gameuser_mail`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `gameuser_money`
--
ALTER TABLE `gameuser_money`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gameuser_runne`
--
ALTER TABLE `gameuser_runne`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1618;

--
-- 使用表AUTO_INCREMENT `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `fball_logdb_1`
--
CREATE DATABASE IF NOT EXISTS `fball_logdb_1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fball_logdb_1`;

-- --------------------------------------------------------

--
-- 表的结构 `game_log`
--

CREATE TABLE `game_log` (
  `id` bigint(20) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` int(8) NOT NULL,
  `log_str` text CHARACTER SET utf8 NOT NULL,
  `log_ip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 转储表的索引
--

--
-- 表的索引 `game_log`
--
ALTER TABLE `game_log`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `game_log`
--
ALTER TABLE `game_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `fball_logdb_2`
--
CREATE DATABASE IF NOT EXISTS `fball_logdb_2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fball_logdb_2`;

-- --------------------------------------------------------

--
-- 表的结构 `game_log`
--

CREATE TABLE `game_log` (
  `id` bigint(20) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` int(8) NOT NULL,
  `log_str` text CHARACTER SET utf8 NOT NULL,
  `log_ip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 转储表的索引
--

--
-- 表的索引 `game_log`
--
ALTER TABLE `game_log`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `game_log`
--
ALTER TABLE `game_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `fball_logdb_3`
--
CREATE DATABASE IF NOT EXISTS `fball_logdb_3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fball_logdb_3`;

-- --------------------------------------------------------

--
-- 表的结构 `game_log`
--

CREATE TABLE `game_log` (
  `id` bigint(20) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` int(8) NOT NULL,
  `log_str` text CHARACTER SET utf8 NOT NULL,
  `log_ip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 转储表的索引
--

--
-- 表的索引 `game_log`
--
ALTER TABLE `game_log`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `game_log`
--
ALTER TABLE `game_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 数据库： `fball_robedb`
--
CREATE DATABASE IF NOT EXISTS `fball_robedb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fball_robedb`;

-- --------------------------------------------------------

--
-- 表的结构 `game_robe`
--

CREATE TABLE `game_robe` (
  `id` int(20) NOT NULL,
  `robe_batch_id` int(20) NOT NULL COMMENT 'robe_batch_id',
  `robe_channel` varchar(32) NOT NULL COMMENT 'robe_channel',
  `part_cs` varchar(32) NOT NULL COMMENT 'part_cs',
  `robe_type` int(16) NOT NULL COMMENT 'robe_type',
  `robe_number` varchar(64) NOT NULL COMMENT 'robe_number',
  `robe_use_state` bit(1) NOT NULL DEFAULT b'0' COMMENT 'robe_use_state',
  `robe_start_time` datetime NOT NULL COMMENT 'robe_start_time',
  `robe_end_time` datetime NOT NULL COMMENT 'robe_end_time',
  `robe_del_state` bit(1) NOT NULL DEFAULT b'0' COMMENT 'robe_del_state'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `game_robe`
--

INSERT INTO `game_robe` (`id`, `robe_batch_id`, `robe_channel`, `part_cs`, `robe_type`, `robe_number`, `robe_use_state`, `robe_start_time`, `robe_end_time`, `robe_del_state`) VALUES
(7, 1, '100', '1', 1, '1e1bddf0-5e98-11e4-a0e4-74d4353947f8', b'0', '2014-10-28 19:46:57', '2014-11-04 19:46:57', b'0'),
(8, 1, '100', '1', 1, '378f6b16-5e98-11e4-a0e4-74d4353947f8', b'0', '2014-10-28 19:47:39', '2014-11-04 19:47:39', b'0'),
(9, 1, '100', '1', 1, '379758be-5e98-11e4-a0e4-74d4353947f8', b'0', '2014-10-28 19:47:39', '2014-11-04 19:47:39', b'0'),
(10, 1, '100', '1', 1, '379fafa2-5e98-11e4-a0e4-74d4353947f8', b'0', '2014-10-28 19:47:39', '2014-11-04 19:47:39', b'0'),
(11, 1, '100', '1', 1, '37a8fea9-5e98-11e4-a0e4-74d4353947f8', b'0', '2014-10-28 19:47:40', '2014-11-04 19:47:40', b'0');

--
-- 转储表的索引
--

--
-- 表的索引 `game_robe`
--
ALTER TABLE `game_robe`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `game_robe`
--
ALTER TABLE `game_robe`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
