/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.37 : Database - email_system_utf8
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`email_system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `email_system`;

/*Table structure for table `email_config` */

DROP TABLE IF EXISTS `email_config`;

CREATE TABLE `email_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '账户uid',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `host` varchar(50) NOT NULL DEFAULT '' COMMENT '域名',
  `port` int(10) NOT NULL DEFAULT '465' COMMENT '端口',
  `conn` tinyint(1) NOT NULL DEFAULT '0' COMMENT '连接类型',
  `ssl` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ssl规则',
  `auth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '验证方式',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='信道配置表';

/*Table structure for table `email_config_group` */

DROP TABLE IF EXISTS `email_config_group`;

CREATE TABLE `email_config_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '信道组名称',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信道组表';

/*Table structure for table `email_config_group_mapping` */

DROP TABLE IF EXISTS `email_config_group_mapping`;

CREATE TABLE `email_config_group_mapping` (
  `config_group_id` int(10) unsigned NOT NULL COMMENT '信道组id',
  `config_id` int(10) unsigned NOT NULL COMMENT '信道id',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  PRIMARY KEY (`config_group_id`,`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信道组表';

/*Table structure for table `email_group` */

DROP TABLE IF EXISTS `email_group`;

CREATE TABLE `email_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `desc` varchar(200) NOT NULL DEFAULT '',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0:正常1:禁用',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='发送邮箱分组表';

/*Table structure for table `email_import_log` */

DROP TABLE IF EXISTS `email_import_log`;

CREATE TABLE `email_import_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作用户id',
  `file` varchar(100) NOT NULL DEFAULT '' COMMENT '导入文件名称',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '导入总数',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分组id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否完成',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid_file_gid` (`uid`,`file`,`gid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='导入日志表';

/*Table structure for table `email_list` */

DROP TABLE IF EXISTS `email_list`;

CREATE TABLE `email_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '收件邮箱地址',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分组id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退订',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`gid`),
  KEY `idx_gid` (`gid`) USING BTREE,
  KEY `idx_gid_uid` (`gid`,`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='收件邮箱数据表';

/*Table structure for table `email_log` */

DROP TABLE IF EXISTS `email_log`;

CREATE TABLE `email_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '任务id',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分组id',
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  `success` int(11) NOT NULL DEFAULT '0' COMMENT '发送成功数',
  `hard_back` int(11) NOT NULL DEFAULT '0' COMMENT '硬退数',
  `soft_back` int(11) NOT NULL DEFAULT '0' COMMENT '软退数',
  `open` int(11) NOT NULL DEFAULT '0' COMMENT '打开数',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `unsubscribe` int(11) NOT NULL DEFAULT '0' COMMENT '退订数',
  `forward` int(11) NOT NULL DEFAULT '0' COMMENT '转发数',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid_gid` (`uid`,`gid`) USING BTREE,
  KEY `idx_tid` (`tid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发件记录表';

/*Table structure for table `email_task` */

DROP TABLE IF EXISTS `email_task`;

CREATE TABLE `email_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) NOT NULL DEFAULT '',
  `send_name` varchar(100) NOT NULL DEFAULT '',
  `send_email` varchar(200) NOT NULL DEFAULT '',
  `reply_email` varchar(200) NOT NULL DEFAULT '',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分组id',
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  `subject` varchar(200) NOT NULL DEFAULT '',
  `send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '发送时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0:待发送1:发送中2:已发送',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='发件任务表';

/*Table structure for table `email_template` */

DROP TABLE IF EXISTS `email_template`;

CREATE TABLE `email_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) unsigned NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL COMMENT '邮件内容',
  `original` mediumtext NOT NULL COMMENT '原始内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0:正常1:弃用',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='发件模板表';

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `parent_uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级用户id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `score` int(11) NOT NULL DEFAULT '0',
  `domain` varchar(100) NOT NULL DEFAULT '' COMMENT '发信通道域名',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0:正常1:禁用',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户类型0:客户1:客服2:管理员',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Table structure for table `user_config_group_mapping` */

DROP TABLE IF EXISTS `user_config_group_mapping`;

CREATE TABLE `user_config_group_mapping` (
  `uid` int(10) unsigned NOT NULL COMMENT '信道组id',
  `config_group_id` int(10) unsigned NOT NULL COMMENT '信道id',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  PRIMARY KEY (`uid`,`config_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信道组表';

/*Table structure for table `user_log` */

DROP TABLE IF EXISTS `user_log`;

CREATE TABLE `user_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作用户id',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作内容,类似注册登录发件等',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户行为表';

/*Table structure for table `user_score` */

DROP TABLE IF EXISTS `user_score`;

CREATE TABLE `user_score` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作用户id',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户积分值',
  `score_change` int(10) NOT NULL DEFAULT '0' COMMENT '用户积分变化值',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '变化事件如充值发件等',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`) USING BTREE,
  KEY `idx_upd` (`updated_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户积分记录表';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
