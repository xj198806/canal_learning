/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.37 : Database - email_log_utf8
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`email_log` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `email_log`;

/*Table structure for table `email_send_log` */

DROP TABLE IF EXISTS `email_send_log`;

CREATE TABLE `email_send_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '任务id',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分组id',
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '收件邮箱地址',
  `success` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送成功数',
  `hard_back` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否硬退',
  `soft_back` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否软退',
  `open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否打开',
  `click` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否点击',
  `unsubscribe` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退订',
  `forward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否转发',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid_gid` (`uid`,`gid`) USING BTREE,
  KEY `idx_tid` (`tid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发件详细记录表';

/*Table structure for table `reportlog` */

DROP TABLE IF EXISTS `reportlog`;

CREATE TABLE `reportlog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `TaskId` int(10) NOT NULL,
  `UserId` int(10) NOT NULL,
  `GroupId` int(10) NOT NULL,
  `MailId` int(10) NOT NULL,
  `TplId` int(10) NOT NULL,
  `EMail` varchar(100) NOT NULL,
  `SendStatus` tinyint(1) NOT NULL,
  `Pv` int(10) NOT NULL DEFAULT '0',
  `Uv` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tid` (`TaskId`)
) ENGINE=InnoDB AUTO_INCREMENT=358686 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
