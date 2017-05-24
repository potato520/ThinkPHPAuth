/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : huanhuan

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-05-24 20:58:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `think_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_group
-- ----------------------------
INSERT INTO `think_auth_group` VALUES ('1', '无情狗管理', '1', '1,3,4');

-- ----------------------------
-- Table structure for `think_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_group_access
-- ----------------------------
INSERT INTO `think_auth_group_access` VALUES ('90', '1');

-- ----------------------------
-- Table structure for `think_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_rule
-- ----------------------------
INSERT INTO `think_auth_rule` VALUES ('1', 'Admin/Index/index', '首页', '1', '1', '', '0');
INSERT INTO `think_auth_rule` VALUES ('3', 'Admin/Index/index2', '用户管理', '1', '1', '', '0');
INSERT INTO `think_auth_rule` VALUES ('4', '123123', '首页-子', '1', '1', '', '1');
INSERT INTO `think_auth_rule` VALUES ('5', 'admin/index/index3', '用户管理-子', '1', '1', '', '3');

-- ----------------------------
-- Table structure for `think_users`
-- ----------------------------
DROP TABLE IF EXISTS `think_users`;
CREATE TABLE `think_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；mb_password加密',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像，相对于upload/avatar目录',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `email_code` varchar(60) DEFAULT NULL COMMENT '激活码',
  `phone` bigint(11) unsigned DEFAULT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `register_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(10) unsigned NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_users
-- ----------------------------
INSERT INTO `think_users` VALUES ('90', '123', '123', '', '123', null, '123', '2', '0', '', '0');
