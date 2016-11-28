/*
Navicat MySQL Data Transfer

Source Server         : loclahost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : myace

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-11-28 18:12:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_no` varchar(64) DEFAULT NULL COMMENT '公司编号',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `contact_number` varchar(32) DEFAULT NULL COMMENT '公司联系电话',
  `company_url` varchar(255) DEFAULT NULL COMMENT '公司主页',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for group_company
-- ----------------------------
DROP TABLE IF EXISTS `group_company`;
CREATE TABLE `group_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `group_id` FOREIGN KEY (`group_id`) REFERENCES `group_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_company
-- ----------------------------

-- ----------------------------
-- Table structure for group_type
-- ----------------------------
DROP TABLE IF EXISTS `group_type`;
CREATE TABLE `group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL COMMENT '组别名称',
  `group_code` varchar(255) DEFAULT NULL COMMENT '组别编码',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_type
-- ----------------------------

-- ----------------------------
-- Table structure for group_users
-- ----------------------------
DROP TABLE IF EXISTS `group_users`;
CREATE TABLE `group_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groupuser_uid` (`user_id`),
  KEY `groupuser_gid` (`group_id`),
  CONSTRAINT `groupuser_gid` FOREIGN KEY (`group_id`) REFERENCES `group_type` (`id`),
  CONSTRAINT `groupuser_uid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_users
-- ----------------------------

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `logout_time` datetime DEFAULT NULL COMMENT '退出时间',
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `area` varchar(255) DEFAULT NULL COMMENT '地区(东西南北)',
  `region` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `area_id` varchar(255) DEFAULT NULL,
  `country_id` varchar(255) DEFAULT NULL,
  `region_id` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_log
-- ----------------------------

-- ----------------------------
-- Table structure for menu_authority
-- ----------------------------
DROP TABLE IF EXISTS `menu_authority`;
CREATE TABLE `menu_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL COMMENT '资源id',
  `auth_name` varchar(255) DEFAULT NULL,
  `auth_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_auth_resourceid` (`resource_id`),
  CONSTRAINT `menu_auth_resourceid` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_authority
-- ----------------------------

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_url` longtext,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `level_pid` int(11) DEFAULT NULL COMMENT '父Id',
  `leve_sort` varchar(255) DEFAULT NULL COMMENT '菜单排序',
  `menu_msg` varchar(255) DEFAULT NULL COMMENT '菜单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for role_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_auth`;
CREATE TABLE `role_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `auth_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_auth_roleid` (`role_id`),
  KEY `role_auth_authid` (`auth_id`),
  CONSTRAINT `role_auth_authid` FOREIGN KEY (`auth_id`) REFERENCES `menu_authority` (`id`),
  CONSTRAINT `role_auth_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_auth
-- ----------------------------

-- ----------------------------
-- Table structure for role_group
-- ----------------------------
DROP TABLE IF EXISTS `role_group`;
CREATE TABLE `role_group` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roelgroup_roleid` (`role_id`),
  KEY `rolegroup_groupid` (`group_id`),
  CONSTRAINT `roelgroup_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `rolegroup_groupid` FOREIGN KEY (`group_id`) REFERENCES `group_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_group
-- ----------------------------

-- ----------------------------
-- Table structure for role_users
-- ----------------------------
DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_users_userid` (`user_id`),
  KEY `role_user_roleid` (`role_id`),
  CONSTRAINT `role_user_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `role_users_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_users
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL COMMENT '1男 ，2女，3均可以',
  `nike_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(15) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图像地址',
  `birthday` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `tx_qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `wy_wb` varchar(255) DEFAULT NULL COMMENT '微博',
  `tx_wx` varchar(255) DEFAULT NULL COMMENT '微信',
  `maxim` varchar(255) DEFAULT NULL COMMENT '座右铭',
  `joined` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
