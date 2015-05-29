# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.24)
# Database: talent
# Generation Time: 2015-05-27 06:02:46 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table category_info
# ------------------------------------------------------------

DROP VIEW IF EXISTS `category_info`;

CREATE TABLE `category_info` (
   `project_id` INT(255) NOT NULL DEFAULT '0',
   `project_category_id` INT(255) NOT NULL,
   `project_category_name` VARCHAR(50) NOT NULL,
   `project_category_description` TEXT NOT NULL
) ENGINE=MyISAM;



# Dump of table comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;

INSERT INTO `comment` (`id`, `project_id`, `user_id`, `content`, `create_time`)
VALUES
	(1,11,1,'很喜欢','2015-04-20 19:32:42'),
	(2,12,1,'不是很喜欢','2015-04-20 19:33:02'),
	(3,11,7,'怎么可以这么有创意','2015-04-20 19:33:15'),
	(4,11,8,'加我一个加我一个','2015-04-20 19:33:27'),
	(5,1,1,'细化喜欢小','2015-04-20 21:49:41'),
	(6,11,10,'这么做不科学吧','2015-04-21 21:44:45'),
	(7,1,10,'很好','2015-04-18 22:53:39'),
	(8,1,1,'一般吧','2015-04-25 15:51:18'),
	(9,1,1,'一般吧','2015-04-25 16:11:18'),
	(10,1,1,'一般吧','2015-04-25 17:05:02'),
	(11,11,1,'一般吧','2015-04-25 17:41:16'),
	(12,11,1,'lalalalala','2015-04-25 21:22:23'),
	(13,1,1,'不好玩','2015-04-26 14:34:13'),
	(14,1,1,'mmmm','2015-04-26 14:36:09'),
	(15,3,1,'kkkk','2015-04-26 14:36:51'),
	(16,17,1,'123','2015-04-28 10:52:24'),
	(17,17,1,'sfsd','2015-05-10 13:27:03');

/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comment_info
# ------------------------------------------------------------

DROP VIEW IF EXISTS `comment_info`;

CREATE TABLE `comment_info` (
   `userName` VARCHAR(255) NOT NULL,
   `content` TEXT NOT NULL,
   `userId` INT(11) NOT NULL,
   `createTime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `project_id` INT(11) NOT NULL
) ENGINE=MyISAM;



# Dump of table competition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `competition`;

CREATE TABLE `competition` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `creator_id` int(15) NOT NULL,
  `competition_category_id` int(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `competition_name` varchar(255) NOT NULL DEFAULT '',
  `max_people` int(11) NOT NULL DEFAULT '0',
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='竞赛通知';

LOCK TABLES `competition` WRITE;
/*!40000 ALTER TABLE `competition` DISABLE KEYS */;

INSERT INTO `competition` (`id`, `creator_id`, `competition_category_id`, `createtime`, `content`, `competition_name`, `max_people`, `endTime`)
VALUES
	(1,1,0,'2015-04-03 10:48:20','全国大学生信息安全竞赛，旨在促进大学生对信息安全的兴趣。主办方为教育部，希望大家可以积极参赛','第七届全国大学生信息安全竞赛',5,'2015-04-08 11:00:30'),
	(2,7,0,'2015-04-03 10:49:42','ACM挑战赛，现场编程喜欢的快来吧~~证明自己的时候到了','第八届ACM挑战赛',4,'2015-07-09 11:00:40');

/*!40000 ALTER TABLE `competition` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table competition_enroll
# ------------------------------------------------------------

DROP TABLE IF EXISTS `competition_enroll`;

CREATE TABLE `competition_enroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `competition_id` int(11) NOT NULL,
  `competition_enroll_foo_id` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='竞赛报名表';

LOCK TABLES `competition_enroll` WRITE;
/*!40000 ALTER TABLE `competition_enroll` DISABLE KEYS */;

INSERT INTO `competition_enroll` (`id`, `competition_id`, `competition_enroll_foo_id`, `createtime`)
VALUES
	(11,1,10,'2015-04-09 20:40:27'),
	(12,2,7,'2015-04-24 21:47:57'),
	(21,2,10,'2015-04-24 21:52:10'),
	(22,1,1,'2015-04-27 23:00:14'),
	(23,1,2,'2015-04-27 23:02:34'),
	(24,1,11,'2015-04-28 10:49:46');

/*!40000 ALTER TABLE `competition_enroll` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table competition_info
# ------------------------------------------------------------

DROP VIEW IF EXISTS `competition_info`;

CREATE TABLE `competition_info` (
   `id` INT(255) NOT NULL DEFAULT '0',
   `createTime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `content` TEXT NOT NULL,
   `name` VARCHAR(255) NOT NULL DEFAULT '',
   `people` INT(11) NOT NULL DEFAULT '0',
   `creator` VARCHAR(20) NOT NULL,
   `endTime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table competition_to_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `competition_to_project`;

CREATE TABLE `competition_to_project` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `competition_enroll_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table competition_user_info
# ------------------------------------------------------------

DROP VIEW IF EXISTS `competition_user_info`;

CREATE TABLE `competition_user_info` (
   `id` INT(255) NOT NULL DEFAULT '0',
   `userId` INT(11) NOT NULL,
   `competitionName` VARCHAR(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM;



# Dump of table course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_credit` int(255) NOT NULL,
  `course_availability` varchar(255) NOT NULL COMMENT '0=软件工程；1=软件工程嵌入式。大于小于号默认带有等于，但是省略',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;

INSERT INTO `course` (`course_id`, `course_name`, `course_credit`, `course_availability`)
VALUES
	('SOFT0031121000','线性代数',3,'<2011'),
	('SOFT0031121001','概率论与数理统计（一）',2,'<2011'),
	('SOFT0031121002','高等数学（一）',5,'<2011'),
	('SOFT0031131001','操作系统实践',1,'>2011'),
	('SOFT0031131004','软件开发实践（一）',1,'>2014;<2013|0'),
	('SOFT0031131005','软件需求',2,'>2011|0'),
	('SOFT0031131007','软件测试和质量保证',2,'<2012|0'),
	('SOFT0031131010','C++语言程序设计',4,'>2011'),
	('SOFT0031131011','数字逻辑',2,'>2014;<2013|0'),
	('SOFT0031131014','软件工程数学',4,'>2011'),
	('SOFT0031131015','计算机组成',2,'>2011'),
	('SOFT0031131017','软件工程',3,'<2013|1'),
	('SOFT0031131018','面向对象分析和设计实践',1,'>2011|0'),
	('SOFT0031131022','计算机网络',3,'>2011'),
	('SOFT0031131028','嵌入式微处理器（一）',2,'<2012|1'),
	('SOFT0031131029','软件工程导论',2,'>2014;<2013|0'),
	('SOFT0031131030','嵌入式软件测试',2,'<2012|1'),
	('SOFT0031131034','嵌入式系统开发规范与建模',2,'>2011|1'),
	('SOFT0031131035','嵌入式系统开发规范与建模实践',1,'>2011|1'),
	('SOFT0031131038','数据结构与算法实践',1,'>2011'),
	('SOFT0031131049','C++语言程序设计实践',1,'<2013'),
	('SOFT0031131051','软件开发实践（二）',4,'>2011|0'),
	('SOFT0031131054','数据结构与算法',4,'>2011'),
	('SOFT0031131057','计算机网络实践',1,'>2011'),
	('SOFT0031131059','数字逻辑实践',1,'<2013|0'),
	('SOFT0031131060','计算机组成实践',1,'<2013'),
	('SOFT0031131064','嵌入式系统开发实践（一）',2,'<2012|1'),
	('SOFT0031131069','硬件描述语言与设计',2,'<2013|1'),
	('SOFT0031131070','硬件描述语言与设计实践',1,'<2013|1'),
	('SOFT0031131071','数据库系统及应用实践',1,'<2011|0'),
	('SOFT0031131072','数据库系统及应用',2,'<2011|0'),
	('SOFT0031131073','面向对象分析和设计',2,'>2011|0'),
	('SOFT0031131075','论文与技术报告写作',1,'<2011'),
	('SOFT0031131085','操作系统',3,'>2011'),
	('SOFT0031131089','数字电子技术',3,'<2013|1'),
	('SOFT0031131090','数字电子技术实践',1,'<2013|1'),
	('SOFT0031131092','编译原理',3,'>2011|1'),
	('SOFT0031131093','编译原理实践',1,'>2011|1'),
	('SOFT0031131104','专业英语（一）',2,'<2013'),
	('SOFT0031131105','数据库系统及其应用',3,'>2013;=2012|0'),
	('SOFT0031131106','软件过程和项目管理',2,'>2011|0'),
	('SOFT0031131108','嵌入式系统概论',2,'<2012|1'),
	('SOFT0031131110','统一建模语言',2,'<2013|0'),
	('SOFT0031131111','嵌入式系统设计实践',1,'>2013|1'),
	('SOFT0031131112','嵌入式微处理器及汇编实践',1,'=2013|1'),
	('SOFT0031131113','嵌入式微处理器及汇编',2,'=2013|1'),
	('SOFT0031131119','嵌入式系统测试与验证',2,'>2014|1'),
	('SOFT0031131120','嵌入式微处理器原理与设计',2,'>2014|1'),
	('SOFT0031131121','UML及形式化建模',2,'>2013'),
	('SOFT0031131801','硬件描述语言与FPGA设计实践',1,'>2014|1'),
	('SOFT0031131802','软件开发实践（二）',4,'>2014|1'),
	('SOFT0031131803','开源代码分析实践',1,'>2014|1'),
	('SOFT0031131804','数字逻辑实践',1,'>2014'),
	('SOFT0031131805','计算机组成实践',1,'>2014'),
	('SOFT0031131806','C++语言程序设计实践',2,'>2014'),
	('SOFT0031131900','论文与技术报告写作',1,'>2012'),
	('SOFT0031131901','毕业实习',6,'>2013'),
	('SOFT0031131903','毕业论文',8,'>2011'),
	('SOFT0031131904','毕业实习',8,'<2012'),
	('SOFT0031132011','嵌入式系统开发实践（二）',4,'<2012|1'),
	('SOFT0031132067','嵌入式系统设计',2,'>2013|1'),
	('SOFT0031132118','数据库系统及其应用实践',1,'>2013;=2012|0'),
	('SOFT0031132179','开源代码分析',2,'>2014|1'),
	('SOFT0031132228','软件测试和验证',2,'>2013|0'),
	('SOFT0031132599','专业英语',2,'>2014');

/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `department_id` int(255) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='院系或者所在单位';

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;

INSERT INTO `department` (`department_id`, `department_name`)
VALUES
	(1,'软件学院'),
	(2,'设计学院');

/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feature
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feature`;

CREATE TABLE `feature` (
  `feature_id` int(255) NOT NULL AUTO_INCREMENT,
  `feature_controller_id` int(11) NOT NULL,
  `feature_name` varchar(255) NOT NULL COMMENT '控制器类中的一个函数的名称',
  `feature_friendlyname` varchar(255) NOT NULL,
  `feature_status` int(11) NOT NULL COMMENT '启用0或停用1',
  PRIMARY KEY (`feature_id`),
  KEY `feature_controller_id` (`feature_controller_id`),
  CONSTRAINT `feature_ibfk_2` FOREIGN KEY (`feature_controller_id`) REFERENCES `feature_controller` (`feature_controller_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;

INSERT INTO `feature` (`feature_id`, `feature_controller_id`, `feature_name`, `feature_friendlyname`, `feature_status`)
VALUES
	(1,11,'create','创建方法',0),
	(2,1,'back_index','管理员首页',0),
	(3,3,'back_index','帐户首页',0),
	(4,4,'back_index','管理员首页',0),
	(5,5,'back_index','管理员首页',0),
	(6,8,'back_index','管理员首页',0),
	(7,9,'back_index','管理员首页',0),
	(8,10,'back_index','管理员首页',0),
	(9,11,'back_index','管理员首页',0),
	(10,8,'index','浏览页',0),
	(11,9,'index','浏览页',0),
	(12,10,'index','浏览页',0),
	(13,2,'index','浏览页',0),
	(14,5,'index','浏览页',0),
	(15,9,'audit','审核',0),
	(16,11,'edit','修改方法',0),
	(17,11,'delete','删除方法',0),
	(18,11,'edit_controller','修改控制器',0),
	(19,11,'edit_directory','修改目录',0);

/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feature_controller
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feature_controller`;

CREATE TABLE `feature_controller` (
  `feature_controller_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_directory_id` int(255) NOT NULL,
  `feature_controller_name` varchar(255) NOT NULL,
  `feature_controller_friendlyname` varchar(255) NOT NULL,
  `feature_controller_status` int(11) NOT NULL COMMENT '启用或停用',
  PRIMARY KEY (`feature_controller_id`),
  KEY `feature_directory_id` (`feature_directory_id`),
  CONSTRAINT `feature_controller_ibfk_1` FOREIGN KEY (`feature_directory_id`) REFERENCES `feature_directory` (`feature_directory_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能的控制器类';

LOCK TABLES `feature_controller` WRITE;
/*!40000 ALTER TABLE `feature_controller` DISABLE KEYS */;

INSERT INTO `feature_controller` (`feature_controller_id`, `feature_directory_id`, `feature_controller_name`, `feature_controller_friendlyname`, `feature_controller_status`)
VALUES
	(1,1,'user','用户',0),
	(2,1,'show','展示',0),
	(3,1,'account','个人',0),
	(4,1,'role','角色',0),
	(5,1,'notice','通知',0),
	(8,1,'news','新闻',0),
	(9,1,'project','项目',0),
	(10,1,'competition','竞赛',0),
	(11,1,'feature','特性',0);

/*!40000 ALTER TABLE `feature_controller` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feature_directory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feature_directory`;

CREATE TABLE `feature_directory` (
  `feature_directory_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_directory_name` varchar(255) NOT NULL,
  `feature_directory_friendlyname` varchar(255) NOT NULL,
  `feature_directory_status` int(11) NOT NULL COMMENT '启用或停用',
  PRIMARY KEY (`feature_directory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='一个完整模块存放的文件夹';

LOCK TABLES `feature_directory` WRITE;
/*!40000 ALTER TABLE `feature_directory` DISABLE KEYS */;

INSERT INTO `feature_directory` (`feature_directory_id`, `feature_directory_name`, `feature_directory_friendlyname`, `feature_directory_status`)
VALUES
	(1,'','根目录',0);

/*!40000 ALTER TABLE `feature_directory` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table funding
# ------------------------------------------------------------

DROP TABLE IF EXISTS `funding`;

CREATE TABLE `funding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text,
  `money` int(11) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `funding` WRITE;
/*!40000 ALTER TABLE `funding` DISABLE KEYS */;

INSERT INTO `funding` (`id`, `project_id`, `user_id`, `content`, `money`, `createTime`)
VALUES
	(1,11,1,'很喜欢，捐一点',5,'2015-04-21 23:27:49'),
	(2,11,7,'有创意，支持',10,'2015-04-10 23:27:53'),
	(3,11,8,'怎么可以这么棒',3,'2015-03-30 23:27:57'),
	(4,12,10,'很喜欢这个项目',100,'2015-04-25 23:28:00'),
	(5,11,10,'喜欢就捐了',100,'2015-04-21 23:37:40'),
	(6,11,1,'一般吧',1000,'2015-04-25 17:41:50'),
	(7,17,1,' ',100,'2015-04-28 10:52:13');

/*!40000 ALTER TABLE `funding` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table funding_info
# ------------------------------------------------------------

DROP VIEW IF EXISTS `funding_info`;

CREATE TABLE `funding_info` (
   `userId` INT(11) NOT NULL,
   `content` TEXT NULL DEFAULT NULL,
   `money` INT(11) NOT NULL,
   `projectId` INT(11) NOT NULL,
   `userName` VARCHAR(255) NOT NULL
) ENGINE=MyISAM;



# Dump of table major
# ------------------------------------------------------------

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `major_id` int(255) NOT NULL,
  `major_name` varchar(255) NOT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专业';

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;

INSERT INTO `major` (`major_id`, `major_name`)
VALUES
	(1,'软件工程'),
	(2,'嵌入式开发');

/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table member_info
# ------------------------------------------------------------

DROP VIEW IF EXISTS `member_info`;

CREATE TABLE `member_info` (
   `userId` INT(255) NOT NULL,
   `role` INT(255) NOT NULL DEFAULT '0',
   `userName` VARCHAR(255) NOT NULL,
   `projectId` INT(255) NOT NULL
) ENGINE=MyISAM;



# Dump of table message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) NOT NULL COMMENT '接收者为-1代表所有用户',
  `message_id` int(11) NOT NULL,
  `message_status` int(1) NOT NULL DEFAULT '0' COMMENT '站内信的状态（0未读，1已读，2删除）',
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`),
  KEY `message_ibfk_2` (`receiver_id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`message_id`) REFERENCES `message_text` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;

INSERT INTO `message` (`id`, `receiver_id`, `message_id`, `message_status`)
VALUES
	(1,8,1,0),
	(2,7,2,0),
	(4,0,3,0),
	(5,7,3,0),
	(6,1,3,0);

/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table message_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message_status`;

CREATE TABLE `message_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table message_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message_text`;

CREATE TABLE `message_text` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_text` text COMMENT '站内信内容',
  `message_createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sender_id` int(11) DEFAULT NULL,
  `sender_status` int(1) NOT NULL DEFAULT '0' COMMENT '（1代表发送方删除信息）',
  PRIMARY KEY (`message_id`),
  KEY `message_id` (`message_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `message_text_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `message_text` WRITE;
/*!40000 ALTER TABLE `message_text` DISABLE KEYS */;

INSERT INTO `message_text` (`message_id`, `message_text`, `message_createtime`, `sender_id`, `sender_status`)
VALUES
	(1,'test2','2015-03-09 21:24:35',1,0),
	(2,'test3','2015-03-09 21:24:36',1,0),
	(3,'test1','2015-03-09 21:24:39',1,0);

/*!40000 ALTER TABLE `message_text` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mobile_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mobile_message`;

CREATE TABLE `mobile_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `isPush` int(11) NOT NULL,
  `isCheck` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `mobile_message` WRITE;
/*!40000 ALTER TABLE `mobile_message` DISABLE KEYS */;

INSERT INTO `mobile_message` (`id`, `receiver_id`, `sender_id`, `createTime`, `content`, `status`, `category`, `isPush`, `isCheck`, `project_id`, `project_status`)
VALUES
	(1,11,2,'2015-05-10 23:03:17','小明申请创建[消息通信APP]的项目。',1,21,2,2,24,1),
	(2,1,2,'2015-05-27 13:43:59','王老师同意了你的请求',1,21,1,1,24,1);

/*!40000 ALTER TABLE `mobile_message` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_id` int(255) NOT NULL AUTO_INCREMENT,
  `news_category_id` int(11) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_content` text NOT NULL,
  `news_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `news_readtimes` int(255) NOT NULL COMMENT '阅读次数',
  `news_status` int(11) NOT NULL,
  `news_show_picture` varchar(100) NOT NULL DEFAULT '' COMMENT '用于主页显示的图片',
  PRIMARY KEY (`news_id`),
  KEY `news_category_id` (`news_category_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`news_category_id`) REFERENCES `news_category` (`news_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;

INSERT INTO `news` (`news_id`, `news_category_id`, `news_title`, `news_content`, `news_createtime`, `news_readtimes`, `news_status`, `news_show_picture`)
VALUES
	(1,1,'测试新闻1','测试测试测试测试测试测试测试测试测试','2015-05-01 17:06:25',5,0,'https://dn-publics.qbox.me/aroni-738302_640.jpg'),
	(2,1,'测试新闻2','测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2测试新闻2','2015-05-01 17:07:09',256,0,'https://dn-publics.qbox.me/animals-731213_640.jpg'),
	(3,1,'测试新闻3',' 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3 测试新闻3','2015-05-01 17:07:39',222,0,'https://dn-publics.qbox.me/flower-729513_640.jpg'),
	(4,1,'测试新闻4','测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4测试新闻4','2015-05-01 17:08:02',244,0,'https://dn-publics.qbox.me/nature-73536_640.jpg'),
	(5,1,'测试新闻5','测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5测试新闻5','2015-05-01 17:08:21',22,0,'https://dn-publics.qbox.me/brimstone-721514_640.jpg'),
	(6,1,'测试新闻6','测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6测试新闻6\n','2015-05-10 13:35:23',1,0,''),
	(7,1,'测试新闻7','测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容','2015-05-10 13:36:03',0,0,''),
	(8,1,'测试新闻8','测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容','2015-05-10 13:37:37',0,0,''),
	(9,1,'测试新闻9','测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容测试新闻内容','2015-05-10 13:37:53',0,0,'');

/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table news_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news_category`;

CREATE TABLE `news_category` (
  `news_category_id` int(255) NOT NULL AUTO_INCREMENT,
  `news_category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`news_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;

INSERT INTO `news_category` (`news_category_id`, `news_category_name`)
VALUES
	(1,'团学联'),
	(2,'新闻类型2');

/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table news_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news_status`;

CREATE TABLE `news_status` (
  `news_status_id` int(11) NOT NULL,
  `news_status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `news_status` WRITE;
/*!40000 ALTER TABLE `news_status` DISABLE KEYS */;

INSERT INTO `news_status` (`news_status_id`, `news_status_name`)
VALUES
	(0,'已发布'),
	(1,'草稿'),
	(2,'垃圾箱');

/*!40000 ALTER TABLE `news_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `notice_id` int(255) NOT NULL AUTO_INCREMENT,
  `notice_creator_id` int(255) DEFAULT NULL,
  `notice_category_id` int(255) NOT NULL,
  `notice_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notice_title` varchar(255) NOT NULL,
  `notice_content` text NOT NULL,
  `notice_status` int(11) NOT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `notice_creator_id` (`notice_creator_id`),
  KEY `notice_category_id` (`notice_category_id`),
  KEY `notice_status` (`notice_status`),
  CONSTRAINT `notice_ibfk_3` FOREIGN KEY (`notice_category_id`) REFERENCES `notice_category` (`notice_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;

INSERT INTO `notice` (`notice_id`, `notice_creator_id`, `notice_category_id`, `notice_createtime`, `notice_title`, `notice_content`, `notice_status`)
VALUES
	(1,8,1,'2014-12-11 18:44:10','教学楼停水通知','教学楼将于2014年12月12日停水一天，请同学们做好准备',0),
	(2,7,1,'2015-02-02 22:07:14','教学楼停电通知','教学楼将于2015年2月5日停电一天，望广大师生做好准备，当天不要去教学楼自习',0),
	(3,8,1,'2015-02-02 22:16:15','放暑假通知','学校将于2015年5月30日至2015年7月30日放暑假，忘所有同学注意安全',0);

/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notice_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notice_category`;

CREATE TABLE `notice_category` (
  `notice_category_id` int(255) NOT NULL AUTO_INCREMENT,
  `notice_category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`notice_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `notice_category` WRITE;
/*!40000 ALTER TABLE `notice_category` DISABLE KEYS */;

INSERT INTO `notice_category` (`notice_category_id`, `notice_category_name`)
VALUES
	(1,'学术讲座'),
	(2,'学生活动'),
	(3,'项目竞赛');

/*!40000 ALTER TABLE `notice_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notice_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notice_status`;

CREATE TABLE `notice_status` (
  `notice_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`notice_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `notice_status` WRITE;
/*!40000 ALTER TABLE `notice_status` DISABLE KEYS */;

INSERT INTO `notice_status` (`notice_status_id`, `notice_status_name`)
VALUES
	(1,'草稿'),
	(2,'已删除'),
	(3,'已发布');

/*!40000 ALTER TABLE `notice_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `project_id` int(255) NOT NULL AUTO_INCREMENT,
  `project_category_id` int(255) NOT NULL,
  `project_status` int(11) NOT NULL,
  `project_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `project_creator_id` int(255) NOT NULL,
  `project_name` varchar(50) DEFAULT '',
  `project_start` timestamp NULL DEFAULT NULL,
  `project_end` timestamp NULL DEFAULT NULL,
  `project_researchobject` int(11) DEFAULT NULL COMMENT '项目性质',
  `project_source` int(255) DEFAULT NULL COMMENT '选题来源',
  `project_subject` varchar(255) DEFAULT '' COMMENT '学科类别',
  `project_aid` varchar(255) DEFAULT '' COMMENT '受资助情况',
  `project_background` text COMMENT '立项背景和依据',
  `project_describe` text COMMENT '研究内容、拟解决的关键问题、研究方法',
  `project_innovation` text COMMENT '项目特色与创新点',
  `project_plan` text COMMENT '研究进度与计划',
  `project_prospect` text COMMENT '预期成果',
  `project_budget` text COMMENT '经费预算',
  `project_resourcerequired` text COMMENT '所需资源',
  `project_teacheropinion` text COMMENT '教师意见',
  `project_departmentopinion` text COMMENT '院系专家评审组意见',
  `project_institutionopinion` text COMMENT '学校专家评审组意见',
  `project_summary` varchar(255) DEFAULT '' COMMENT '项目概述，用于对外展示',
  `project_signup_max` int(255) DEFAULT '0' COMMENT '项目报名人数上限',
  `project_grouptype` varchar(255) DEFAULT '' COMMENT '项目组类型',
  `project_funding` int(11) DEFAULT '0' COMMENT '表名该项目是众筹项目还是非众筹，只有自创项目才有，1表示众筹，2表示非众筹，学校项目为空值',
  `project_funding_planmoney` int(11) DEFAULT '0',
  PRIMARY KEY (`project_id`),
  KEY `project_creator_id` (`project_creator_id`),
  KEY `project_category_id` (`project_category_id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;

INSERT INTO `project` (`project_id`, `project_category_id`, `project_status`, `project_createtime`, `project_creator_id`, `project_name`, `project_start`, `project_end`, `project_researchobject`, `project_source`, `project_subject`, `project_aid`, `project_background`, `project_describe`, `project_innovation`, `project_plan`, `project_prospect`, `project_budget`, `project_resourcerequired`, `project_teacheropinion`, `project_departmentopinion`, `project_institutionopinion`, `project_summary`, `project_signup_max`, `project_grouptype`, `project_funding`, `project_funding_planmoney`)
VALUES
	(1,2,3,'2015-04-23 12:30:46',1,'智能机器人','2014-12-12 00:00:00','2015-02-16 00:00:00',1,2,'软件工程','未受资助','很多事情可以通过机器人来做，解放人工。','会说话的机器人','会说话','需求文档v0.1','软件开发','8000','机器人所需材料','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','致力于智能机器人的研发',2,'本科生',0,0),
	(2,2,3,'2015-04-23 12:30:47',2,'在线多人聊天系统','2015-02-09 00:00:00','2015-02-23 00:00:00',2,2,'嵌入式','腾讯资助','为视频会议，电话会议提供方便。','多人语音视频聊天','多人聊天','设计文档v0.1','专利','8500','实验室','测试','测试','测试','致力于多人聊天',4,'研究生',0,0),
	(3,2,4,'2015-04-23 12:30:48',3,'音乐识别系统','2015-02-16 00:00:00','2015-02-27 00:00:00',2,2,'网络工程','网易资助','基于生活中听到一首歌，想不起名字的痛苦。','听歌识曲','帮你想歌名','需求文档v0.2','产品研制','10000','笔记本电脑&手机','同意','同意','同意','致力于识别歌名',5,'本科生',0,0),
	(4,2,6,'2015-04-23 12:30:49',4,'科创app','2015-01-01 01:48:54','2015-05-08 01:49:10',1,1,'软件工程','学校资助','基于软院人才生态链的构建。','软院生态链构建','独一无二','代码v0.2','软件开发&论文','20000','电脑&手机','','','','致力于构建软院人才生态链',6,'本科生&研究生',0,0),
	(5,1,3,'2015-04-23 12:30:50',5,'在线支付系统','2015-04-20 01:49:19','2015-04-20 01:49:23',2,1,'通信工程','阿里巴巴资助','出门忘记带钱包，手机一键支付。','一键网上支付，轻松+愉快~','扫一扫支付','代码v1.0','产品研制','9000','手机',NULL,NULL,NULL,'summary一键支付',5,'本科生',0,0),
	(6,1,3,'2015-04-23 12:30:51',6,'多功能邮箱APP','2015-02-23 01:49:27','2015-05-09 01:49:32',1,2,'软件工程','腾讯资助','好多邮箱，一个一个查看太麻烦了。','在这里，你可以看你的QQ邮箱，gmail邮箱，foxmail都集中到这里来~','N个邮箱一起看','前端界面v0.2','专利','6000','mac pro',NULL,NULL,NULL,'多个邮箱一起看',9,'本科生',0,0),
	(7,1,3,'2015-04-24 00:41:41',7,'网上购物系统','2015-04-07 00:41:30','2015-05-28 00:41:35',2,2,'嵌入式','阿里巴巴资助','去超市搬回一堆东西太累了，直接网购。','还说什么！买买买啊~','网购新时代','需求文档v1.0','产品研制','8500','海量所实验室',NULL,NULL,NULL,'致力于买买买',2,'本科生',0,0),
	(8,3,5,'2015-04-24 00:41:52',8,'网站动态验证码实现','2015-04-01 00:41:43','2015-05-06 00:41:48',1,2,'软件工程','百度资助','防止验证码被恶意系统识别。','动态验证码！晃的你看不清~','可以动的验证码','后端代码v1.0','专利','9000','嵌入式实验室',NULL,NULL,NULL,'可以动的验证码',3,'本科生',0,0),
	(9,3,1,'2015-04-24 00:42:02',9,'智能订餐系统','2015-03-30 00:41:53','2015-05-07 00:41:58',2,2,'嵌入式','饿了么资助','天气太热，不想出门，网上订餐来解决。','饿了么？就用智能订餐系统~一键选出你想要的！','网上订餐','需求文档v2.0','软件开发','8000','高可信实验室',NULL,NULL,NULL,'足不出户吃大餐',4,'本科生',0,0),
	(10,3,4,'2015-04-24 00:42:14',10,'智能电影分析系统','2015-04-01 00:42:03','2015-04-28 00:42:09',1,1,'通信工程','美团资助','想知道最近什么电影好看。','最近想去看电影？看什么呢？智能电影分析系统帮你分析！','网上订电影票','测试计划v0.1','产品研制','9000','电脑',NULL,NULL,NULL,'网上预定电影票',8,'研究生',0,0),
	(11,4,7,'2015-04-24 00:42:24',1,'美食点评数据分析系统','2015-03-30 00:42:15','2015-05-09 00:42:20',2,1,'网络工程','大众点评资助','想知道附近有什么美食评价高。','哪家餐厅好吃呢~来看大家的点评把~','智能美食推荐','测试计划v2.0','软件开发','10000','电脑&手机',NULL,NULL,NULL,'提前预定座位',7,'研究生',1,200000),
	(12,4,8,'2015-04-24 00:42:43',8,'股票分析系统','2015-03-31 00:42:25','2015-05-09 00:42:31',1,2,'软件工程','银联资助','初入股市的股民需要一个聪明的分析系统。','哪只股票最近会涨？其实我也不知道。。。但是它知道！','股市操盘手','测试报告v1.0','论文','9000','ipad',NULL,NULL,NULL,'分析股市大盘趋势',6,'研究生',1,5000),
	(13,4,9,'2015-04-24 00:42:54',10,'随心之旅自由行定制系统','2015-03-31 00:42:43','2015-05-09 00:42:50',2,1,'软件工程','携程资助','出去玩需要制定旅行计划。','想去哪儿~基于谷歌地图为您绘制最佳自由行路线~','去哪儿？去啊！','系统发布','专利','10000','电脑',NULL,NULL,NULL,'智能定制计划',5,'研究生',2,0),
	(17,4,7,'2015-04-28 10:40:43',1,'test','2015-04-28 02:29:46','2015-04-28 02:29:46',NULL,NULL,'','',NULL,'test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',5,'',1,100),
	(18,1,0,'2015-04-28 10:56:43',2,'滑雪项目','2014-06-18 02:33:24','2014-06-18 02:33:24',NULL,1,'','爱丽自助','背景','undefined','创新','进度','计划','10000','实验室',NULL,NULL,NULL,'',0,'',0,0),
	(19,1,1,'2015-04-28 10:57:24',2,'滑雪项目','2014-06-18 02:33:24','2014-06-18 02:33:24',NULL,1,'','爱丽自助','背景','undefined','创新','进度','计划','10000','实验室',NULL,NULL,NULL,'',0,'',0,0),
	(24,2,1,'2015-05-10 19:29:50',1,'dfasd','2015-05-06 08:00:00','2015-05-07 08:00:00',NULL,2,'','dfafdas','dfasf','sadfds','fdsadfs','blank','blank','blank','blank',NULL,NULL,NULL,'',0,'',0,0);

/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_category`;

CREATE TABLE `project_category` (
  `project_category_id` int(255) NOT NULL AUTO_INCREMENT,
  `project_category_name` varchar(50) NOT NULL,
  `project_category_description` text NOT NULL,
  PRIMARY KEY (`project_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `project_category` WRITE;
/*!40000 ALTER TABLE `project_category` DISABLE KEYS */;

INSERT INTO `project_category` (`project_category_id`, `project_category_name`, `project_category_description`)
VALUES
	(1,'学校正式项目',''),
	(2,'学校正式项目',''),
	(3,'学校正式项目',''),
	(4,'自由创新项目','');

/*!40000 ALTER TABLE `project_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_info
# ------------------------------------------------------------

DROP VIEW IF EXISTS `project_info`;

CREATE TABLE `project_info` (
   `projectId` INT(255) NOT NULL DEFAULT '0',
   `categoryId` INT(255) NOT NULL,
   `projectStatus` INT(11) NOT NULL,
   `categoryName` VARCHAR(50) NOT NULL,
   `categoryDescription` TEXT NOT NULL,
   `projectStatusName` VARCHAR(50) NOT NULL,
   `creatorId` INT(255) NOT NULL,
   `creatorName` VARCHAR(255) NOT NULL,
   `projectName` VARCHAR(50) NULL DEFAULT '',
   `startTime` TIMESTAMP NULL DEFAULT NULL,
   `endTime` TIMESTAMP NULL DEFAULT NULL,
   `people` INT(255) NULL DEFAULT '0',
   `content` TEXT NULL DEFAULT NULL,
   `funding` INT(11) NULL DEFAULT '0',
   `researchobject` INT(11) NULL DEFAULT NULL,
   `source` INT(255) NULL DEFAULT NULL,
   `subject` VARCHAR(255) NULL DEFAULT '',
   `aid` VARCHAR(255) NULL DEFAULT '',
   `background` TEXT NULL DEFAULT NULL,
   `innovation` TEXT NULL DEFAULT NULL,
   `plan` TEXT NULL DEFAULT NULL,
   `prospect` TEXT NULL DEFAULT NULL,
   `budget` TEXT NULL DEFAULT NULL,
   `resourcerequired` TEXT NULL DEFAULT NULL,
   `grouptype` VARCHAR(255) NULL DEFAULT '',
   `summary` VARCHAR(255) NULL DEFAULT '',
   `institutionopinion` TEXT NULL DEFAULT NULL,
   `departmentopinion` TEXT NULL DEFAULT NULL,
   `teacheropinion` TEXT NULL DEFAULT NULL,
   `planmoney` INT(11) NULL DEFAULT '0',
   `createTime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table project_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_member`;

CREATE TABLE `project_member` (
  `project_member_id` int(255) NOT NULL AUTO_INCREMENT,
  `project_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `project_member_role` int(255) NOT NULL DEFAULT '0' COMMENT '学生和老师保存在同一张表中，1队长，2老师，3普通队员',
  `project_member_task` varchar(255) NOT NULL DEFAULT '' COMMENT '保存每个人在项目中的任务',
  `project_member_opinion` text COMMENT '学生或老师的意见',
  `project_member_status` int(255) DEFAULT '0' COMMENT '1待审核2已审核通过3已拒绝',
  `project_application_reason` text,
  PRIMARY KEY (`project_member_id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_member_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_member_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `project_member` WRITE;
/*!40000 ALTER TABLE `project_member` DISABLE KEYS */;

INSERT INTO `project_member` (`project_member_id`, `project_id`, `user_id`, `project_member_role`, `project_member_task`, `project_member_opinion`, `project_member_status`, `project_application_reason`)
VALUES
	(1,1,1,1,'队长',NULL,NULL,NULL),
	(2,1,11,2,'指导老师',NULL,NULL,NULL),
	(3,1,2,3,'队员',NULL,0,NULL),
	(4,2,3,1,'队长',NULL,0,NULL),
	(5,2,12,2,'指导老师',NULL,0,NULL),
	(6,2,4,3,'队员',NULL,0,NULL),
	(7,3,5,1,'队长',NULL,0,NULL),
	(8,3,13,2,'指导老师',NULL,0,NULL),
	(9,3,6,3,'队员',NULL,0,NULL),
	(10,4,7,1,'队长',NULL,0,NULL),
	(11,4,11,2,'指导老师',NULL,0,NULL),
	(12,4,8,3,'队员',NULL,0,NULL),
	(13,5,9,1,'队长',NULL,0,NULL),
	(14,5,12,2,'指导老师',NULL,0,NULL),
	(15,5,10,3,'队员',NULL,0,NULL),
	(16,6,1,1,'队长',NULL,0,NULL),
	(17,6,13,2,'指导老师',NULL,0,NULL),
	(18,6,10,3,'队员',NULL,0,NULL),
	(19,7,2,1,'队长',NULL,0,NULL),
	(20,7,11,2,'指导老师',NULL,0,NULL),
	(21,7,9,3,'队员',NULL,0,NULL),
	(22,8,3,1,'队长',NULL,0,NULL),
	(23,8,12,2,'指导老师',NULL,0,NULL),
	(24,8,8,3,'队员',NULL,0,NULL),
	(25,9,4,1,'队长',NULL,0,NULL),
	(26,9,13,2,'指导老师',NULL,0,NULL),
	(27,9,7,3,'队员',NULL,0,NULL),
	(28,10,5,1,'队长',NULL,0,NULL),
	(29,10,11,2,'指导老师',NULL,0,NULL),
	(30,10,6,3,'队员',NULL,0,NULL),
	(32,11,2,0,'',NULL,1,'我对这个项目很感兴趣，希望可以加入'),
	(33,12,3,0,'',NULL,2,'我会spring希望可以加入'),
	(34,13,4,0,'',NULL,1,'我是全栈工程师，求加入。'),
	(35,11,1,0,'',NULL,1,'lalalalala'),
	(36,18,11,2,'指导老师',NULL,0,NULL),
	(37,18,1,1,'队长',NULL,0,NULL),
	(38,18,1,3,'队员',NULL,0,NULL),
	(39,18,2,3,'队员',NULL,0,NULL),
	(40,19,11,2,'指导老师',NULL,0,NULL),
	(41,19,1,1,'队长',NULL,0,NULL),
	(42,19,1,3,'队员',NULL,0,NULL),
	(43,19,2,3,'队员',NULL,0,NULL),
	(50,24,11,2,'指导老师',NULL,0,NULL),
	(51,24,2,1,'队长',NULL,0,NULL),
	(52,24,4,3,'队员',NULL,0,NULL);

/*!40000 ALTER TABLE `project_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_period
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_period`;

CREATE TABLE `project_period` (
  `project_period_id` int(255) NOT NULL AUTO_INCREMENT,
  `project_category_id` int(255) NOT NULL,
  `project_period_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `project_period_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `project_period_description` text NOT NULL,
  PRIMARY KEY (`project_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table project_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_status`;

CREATE TABLE `project_status` (
  `project_status_id` int(1) NOT NULL,
  `project_status_name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `project_status` WRITE;
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;

INSERT INTO `project_status` (`project_status_id`, `project_status_name`)
VALUES
	(1,'草稿'),
	(2,'正式稿'),
	(3,'已立项'),
	(4,'进行中'),
	(5,'终止'),
	(6,'已结项'),
	(7,'报名中'),
	(8,'进行中'),
	(9,'已结束');

/*!40000 ALTER TABLE `project_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_user_info
# ------------------------------------------------------------

DROP VIEW IF EXISTS `project_user_info`;

CREATE TABLE `project_user_info` (
   `memberStatus` INT(255) NULL DEFAULT '0',
   `userToken` VARCHAR(255) NOT NULL DEFAULT '',
   `projectId` INT(255) NOT NULL DEFAULT '0',
   `userId` INT(255) NOT NULL,
   `categoryName` VARCHAR(50) NOT NULL,
   `projectStatusName` VARCHAR(50) NOT NULL,
   `creatorName` VARCHAR(255) NOT NULL,
   `projectName` VARCHAR(50) NULL DEFAULT '',
   `startTime` TIMESTAMP NULL DEFAULT NULL,
   `endTime` TIMESTAMP NULL DEFAULT NULL,
   `categoryDescription` TEXT NOT NULL,
   `projectStatus` INT(11) NOT NULL,
   `people` INT(255) NULL DEFAULT '0',
   `content` TEXT NULL DEFAULT NULL,
   `categoryId` INT(255) NOT NULL
) ENGINE=MyISAM;



# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(255) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `role_status` int(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`role_id`, `role_name`, `role_status`)
VALUES
	(1,'学生',0),
	(2,'系统管理员',0),
	(3,'任课教师',0),
	(4,'辅导员',0),
	(5,'通知管理员',0),
	(6,'新闻管理员',0),
	(7,'基地管理员',0);

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_to_feature
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_to_feature`;

CREATE TABLE `role_to_feature` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `role_id` int(255) NOT NULL COMMENT '角色id',
  `feature_id` int(255) NOT NULL COMMENT '指向某一控制器的函数的id',
  PRIMARY KEY (`id`),
  KEY `role_to_feature_role_id` (`role_id`),
  KEY `role_to_feature_feature_id` (`feature_id`),
  CONSTRAINT `role_to_feature_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE,
  CONSTRAINT `role_to_feature_ibfk_2` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role_to_feature` WRITE;
/*!40000 ALTER TABLE `role_to_feature` DISABLE KEYS */;

INSERT INTO `role_to_feature` (`id`, `role_id`, `feature_id`)
VALUES
	(3,1,3),
	(4,1,10),
	(5,1,11),
	(6,1,12),
	(7,1,13),
	(8,1,14),
	(16,7,15),
	(17,7,6),
	(19,2,3),
	(20,2,8),
	(21,2,12),
	(22,2,9),
	(23,2,1),
	(24,2,6),
	(25,2,10),
	(26,2,5),
	(27,2,14),
	(28,2,2),
	(29,2,13),
	(30,2,4),
	(31,2,11),
	(32,2,7),
	(33,2,15),
	(34,4,6),
	(35,4,3),
	(36,4,12),
	(37,4,10),
	(38,4,5),
	(39,4,14),
	(40,4,11),
	(41,4,13),
	(42,4,8),
	(43,4,7),
	(44,4,15),
	(45,5,12),
	(46,5,10),
	(47,5,3),
	(48,5,13),
	(49,2,17),
	(50,2,16),
	(51,2,18),
	(52,2,19);

/*!40000 ALTER TABLE `role_to_feature` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table signup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `signup`;

CREATE TABLE `signup` (
  `signup_user_id` int(15) NOT NULL,
  `signup_project_id` int(255) NOT NULL,
  PRIMARY KEY (`signup_user_id`,`signup_project_id`),
  KEY `signup_project_id` (`signup_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table test
# ------------------------------------------------------------

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;

INSERT INTO `test` (`id`, `name`)
VALUES
	(1,'dyg'),
	(2,'xiaowang\n'),
	(3,'asd'),
	(4,'asd');

/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_grade_id` int(255) DEFAULT NULL COMMENT '学生的年级、教师的职称等',
  `user_gender_id` int(255) DEFAULT NULL,
  `department_id` int(255) DEFAULT NULL COMMENT '院系或者所在单位的id',
  `major_id` int(255) DEFAULT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_fullname` varchar(255) NOT NULL,
  `user_studentnumber` varchar(255) DEFAULT NULL,
  `user_admissionyear` year(4) DEFAULT NULL COMMENT '入学年份',
  `user_idcardnumber` varchar(20) DEFAULT NULL,
  `user_job` varchar(255) DEFAULT NULL COMMENT '可用于教师职务等',
  `user_researchinterests` varchar(255) DEFAULT NULL COMMENT '可用于研究方向、兴趣等',
  `user_address` varchar(255) DEFAULT NULL COMMENT '常住地址，当然不是寝室地址',
  `user_dormitory` varchar(100) DEFAULT NULL COMMENT '寝室地址',
  `user_email1` varchar(255) DEFAULT NULL,
  `user_email2` varchar(255) DEFAULT NULL,
  `user_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `user_phone1` varchar(20) DEFAULT NULL,
  `user_phone2` varchar(20) DEFAULT NULL,
  `user_token` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) DEFAULT NULL,
  `user_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_gender_id` (`user_gender_id`),
  KEY `user_grade_id` (`user_grade_id`),
  KEY `department_id` (`department_id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_grade_id`) REFERENCES `user_grade` (`user_grade_id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_gender_id`) REFERENCES `user_gender` (`user_gender_id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`user_id`, `user_grade_id`, `user_gender_id`, `department_id`, `major_id`, `user_password`, `user_name`, `user_fullname`, `user_studentnumber`, `user_admissionyear`, `user_idcardnumber`, `user_job`, `user_researchinterests`, `user_address`, `user_dormitory`, `user_email1`, `user_email2`, `user_qq`, `user_phone1`, `user_phone2`, `user_token`, `user_status`, `user_photo`)
VALUES
	(1,1,1,1,1,'1','axt','焦伟民','20117610111','2011','218','xxx','xxx','xxx','xxx','218@zzu.edu.cn','xxx','xxx','18888888218','xxx','0c1c6f14eb677de54d0cf101cd875d1efaff713e',0,NULL),
	(2,1,1,1,1,'zy','zy','zhouyue','20117610119','2011','220','','','','','220@zzu.edu.cn','','','18888888220','','4cbf3502eab947f94ee4d14a2c884a6f109dea43',0,NULL),
	(3,1,1,1,1,'yf','yf','yufang','20117610124','2011','228','','','','','280@zzu.edu.cn','','','18888888228','','',0,NULL),
	(4,1,1,1,1,'yhp','yhp','yuhaiping','20117610545','2011','201','','','','','201@zzu.edu.cn','','','18888888201','','',0,NULL),
	(5,1,1,1,1,'syy','syy','songyuyi','20117610147','2011','202','','','','','202@zzu.edu.cn','','','18888888202','','',0,NULL),
	(6,1,1,1,1,'lsy','lsy','liushiyang','20117610154','2011','203','','','','','203@zzu.edu.cn','','','18888888203','','',0,NULL),
	(7,1,1,1,1,'df399330d331a0c6a2f8e1056a9eeb66ea904027','shy','shyfull','','2013','222','','','','','333','','','444','555','7',0,NULL),
	(8,1,1,1,1,'40bd001563085fc35165329ea1ff5c5ecbdbbeef','burgess','burgessfull','20117610119','2013','123','','','','','123','','','123','123','8',0,NULL),
	(9,1,1,1,1,'ljy','ljy','lijianying','20117610123','2011','204','','','','','204@zzu.edu.cn','','','18888888204','','',0,NULL),
	(10,1,1,1,1,'40bd001563085fc35165329ea1ff5c5ecbdbbeef','ymy','yemengying','20117610118','2011','219','','','','','219@zzu.edu.cn','','','18888888219','xxx','10',0,NULL),
	(11,3,1,1,1,'teacher1','teacher1','teacher1','','2000','','教授','','','','teacher1@zzu.edu.cn','','','','','86eed40a38e60c9ad6a8970f7b7872491ea071ef',0,NULL),
	(12,3,1,1,1,'teacher2','teacher2','teacher2','','2000','','副教授','','','','teacher2@zzu.edu.cn','','','','','',0,NULL),
	(13,3,1,1,1,'teacher3','teacher3','teacher3','','2000','','副教授','','','','teacher3@zzu.edu.cn','','','','','',0,NULL),
	(21,3,1,1,1,'admin1','admin1','admin1','','1952','','科创中心管理员','','','','','','','','','0ea8807d05078a9197f0c27d734a316efe99e566',0,NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_gender
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_gender`;

CREATE TABLE `user_gender` (
  `user_gender_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_gender_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_gender` WRITE;
/*!40000 ALTER TABLE `user_gender` DISABLE KEYS */;

INSERT INTO `user_gender` (`user_gender_id`, `user_gender_name`)
VALUES
	(1,'男'),
	(2,'女'),
	(3,'其他');

/*!40000 ALTER TABLE `user_gender` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_grade
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_grade`;

CREATE TABLE `user_grade` (
  `user_grade_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_grade_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生的年级、教师的职称等';

LOCK TABLES `user_grade` WRITE;
/*!40000 ALTER TABLE `user_grade` DISABLE KEYS */;

INSERT INTO `user_grade` (`user_grade_id`, `user_grade_name`)
VALUES
	(1,'本科生'),
	(2,'研究生'),
	(3,'其他');

/*!40000 ALTER TABLE `user_grade` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_info
# ------------------------------------------------------------

DROP VIEW IF EXISTS `user_info`;

CREATE TABLE `user_info` (
   `id` INT(255) NOT NULL DEFAULT '0',
   `name` VARCHAR(255) NOT NULL,
   `number` VARCHAR(255) NULL DEFAULT NULL,
   `token` VARCHAR(255) NOT NULL DEFAULT '',
   `photo` VARCHAR(255) NULL DEFAULT NULL,
   `role` INT(255) NOT NULL
) ENGINE=MyISAM;



# Dump of table user_to_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_to_course`;

CREATE TABLE `user_to_course` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_score` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `course_id_2` (`course_id`),
  KEY `id` (`id`),
  CONSTRAINT `user_to_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_to_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_to_course` WRITE;
/*!40000 ALTER TABLE `user_to_course` DISABLE KEYS */;

INSERT INTO `user_to_course` (`id`, `user_id`, `course_id`, `course_score`)
VALUES
	(1,7,'SOFT0031121000',95),
	(2,7,'SOFT0031131001',95),
	(3,8,'SOFT0031121000',100),
	(4,8,'SOFT0031121001',100);

/*!40000 ALTER TABLE `user_to_course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_to_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_to_role`;

CREATE TABLE `user_to_role` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `role_id` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_to_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_to_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_to_role` WRITE;
/*!40000 ALTER TABLE `user_to_role` DISABLE KEYS */;

INSERT INTO `user_to_role` (`id`, `user_id`, `role_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,3,1),
	(4,4,1),
	(5,5,1),
	(6,6,1),
	(7,7,1),
	(8,8,1),
	(9,9,1),
	(10,10,1),
	(11,11,3),
	(12,12,3),
	(13,13,3),
	(21,21,7);

/*!40000 ALTER TABLE `user_to_role` ENABLE KEYS */;
UNLOCK TABLES;




# Replace placeholder table for competition_user_info with correct view syntax
# ------------------------------------------------------------

DROP TABLE `competition_user_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `competition_user_info`
AS SELECT
   `competition`.`id` AS `id`,
   `competition_enroll`.`competition_enroll_foo_id` AS `userId`,
   `competition`.`competition_name` AS `competitionName`
FROM (`competition` join `competition_enroll`) where (`competition`.`id` = `competition_enroll`.`competition_id`);


# Replace placeholder table for comment_info with correct view syntax
# ------------------------------------------------------------

DROP TABLE `comment_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comment_info`
AS SELECT
   `user`.`user_fullname` AS `userName`,
   `comment`.`content` AS `content`,
   `comment`.`user_id` AS `userId`,
   `comment`.`create_time` AS `createTime`,
   `comment`.`project_id` AS `project_id`
FROM (`comment` join `user`) where (`comment`.`user_id` = `user`.`user_id`);


# Replace placeholder table for member_info with correct view syntax
# ------------------------------------------------------------

DROP TABLE `member_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member_info`
AS SELECT
   `project_member`.`user_id` AS `userId`,
   `project_member`.`project_member_role` AS `role`,
   `user`.`user_fullname` AS `userName`,
   `project_member`.`project_id` AS `projectId`
FROM (`project_member` join `user`) where (`project_member`.`user_id` = `user`.`user_id`);


# Replace placeholder table for project_info with correct view syntax
# ------------------------------------------------------------

DROP TABLE `project_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_info`
AS SELECT
   `project`.`project_id` AS `projectId`,
   `project`.`project_category_id` AS `categoryId`,
   `project`.`project_status` AS `projectStatus`,
   `project_category`.`project_category_name` AS `categoryName`,
   `project_category`.`project_category_description` AS `categoryDescription`,
   `project_status`.`project_status_name` AS `projectStatusName`,
   `project`.`project_creator_id` AS `creatorId`,
   `user`.`user_fullname` AS `creatorName`,
   `project`.`project_name` AS `projectName`,
   `project`.`project_start` AS `startTime`,
   `project`.`project_end` AS `endTime`,
   `project`.`project_signup_max` AS `people`,
   `project`.`project_describe` AS `content`,
   `project`.`project_funding` AS `funding`,
   `project`.`project_researchobject` AS `researchobject`,
   `project`.`project_source` AS `source`,
   `project`.`project_subject` AS `subject`,
   `project`.`project_aid` AS `aid`,
   `project`.`project_background` AS `background`,
   `project`.`project_innovation` AS `innovation`,
   `project`.`project_plan` AS `plan`,
   `project`.`project_prospect` AS `prospect`,
   `project`.`project_budget` AS `budget`,
   `project`.`project_resourcerequired` AS `resourcerequired`,
   `project`.`project_grouptype` AS `grouptype`,
   `project`.`project_summary` AS `summary`,
   `project`.`project_institutionopinion` AS `institutionopinion`,
   `project`.`project_departmentopinion` AS `departmentopinion`,
   `project`.`project_teacheropinion` AS `teacheropinion`,
   `project`.`project_funding_planmoney` AS `planmoney`,
   `project`.`project_createtime` AS `createTime`
FROM (((`project` join `project_category`) join `project_status`) join `user`) where ((`project`.`project_category_id` = `project_category`.`project_category_id`) and (`project`.`project_status` = `project_status`.`project_status_id`) and (`project`.`project_creator_id` = `user`.`user_id`));


# Replace placeholder table for competition_info with correct view syntax
# ------------------------------------------------------------

DROP TABLE `competition_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `competition_info`
AS SELECT
   `competition`.`id` AS `id`,
   `competition`.`createtime` AS `createTime`,
   `competition`.`content` AS `content`,
   `competition`.`competition_name` AS `name`,
   `competition`.`max_people` AS `people`,
   `user`.`user_name` AS `creator`,
   `competition`.`endTime` AS `endTime`
FROM (`competition` join `user`) where (`competition`.`creator_id` = `user`.`user_id`);


# Replace placeholder table for project_user_info with correct view syntax
# ------------------------------------------------------------

DROP TABLE `project_user_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_user_info`
AS SELECT
   `project_member`.`project_member_status` AS `memberStatus`,
   `user`.`user_token` AS `userToken`,
   `project_info`.`projectId` AS `projectId`,
   `project_member`.`user_id` AS `userId`,
   `project_info`.`categoryName` AS `categoryName`,
   `project_info`.`projectStatusName` AS `projectStatusName`,
   `project_info`.`creatorName` AS `creatorName`,
   `project_info`.`projectName` AS `projectName`,
   `project_info`.`startTime` AS `startTime`,
   `project_info`.`endTime` AS `endTime`,
   `project_info`.`categoryDescription` AS `categoryDescription`,
   `project_info`.`projectStatus` AS `projectStatus`,
   `project_info`.`people` AS `people`,
   `project_info`.`content` AS `content`,
   `project_info`.`categoryId` AS `categoryId`
FROM ((`project_info` join `project_member`) join `user`) where ((`project_info`.`projectId` = `project_member`.`project_id`) and (`project_member`.`user_id` = `user`.`user_id`));


# Replace placeholder table for category_info with correct view syntax
# ------------------------------------------------------------

DROP TABLE `category_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `category_info`
AS SELECT
   `project`.`project_id` AS `project_id`,
   `project`.`project_category_id` AS `project_category_id`,
   `project_category`.`project_category_name` AS `project_category_name`,
   `project_category`.`project_category_description` AS `project_category_description`
FROM (`project` join `project_category`) where (`project`.`project_category_id` = `project_category`.`project_category_id`);


# Replace placeholder table for funding_info with correct view syntax
# ------------------------------------------------------------

DROP TABLE `funding_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `funding_info`
AS SELECT
   `funding`.`user_id` AS `userId`,
   `funding`.`content` AS `content`,
   `funding`.`money` AS `money`,
   `funding`.`project_id` AS `projectId`,
   `user`.`user_fullname` AS `userName`
FROM (`funding` join `user`) where (`funding`.`user_id` = `user`.`user_id`);


# Replace placeholder table for user_info with correct view syntax
# ------------------------------------------------------------

DROP TABLE `user_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_info`
AS SELECT
   `user`.`user_id` AS `id`,
   `user`.`user_fullname` AS `name`,
   `user`.`user_studentnumber` AS `number`,
   `user`.`user_token` AS `token`,
   `user`.`user_photo` AS `photo`,
   `user_to_role`.`role_id` AS `role`
FROM (`user` join `user_to_role`) where (`user`.`user_id` = `user_to_role`.`user_id`);

--
-- Dumping routines (PROCEDURE) for database 'talent'
--
DELIMITER ;;

# Dump of PROCEDURE new_procedure
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `new_procedure`()
BEGIN

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
