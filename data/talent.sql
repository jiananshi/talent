/*
Navicat MySQL Data Transfer

Source Server         : talent
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : talent

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2015-04-20 23:02:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO comment VALUES ('1', '11', '1', '很喜欢', '2015-04-20 19:32:42');
INSERT INTO comment VALUES ('2', '12', '1', '不是很喜欢', '2015-04-20 19:33:02');
INSERT INTO comment VALUES ('3', '11', '7', '怎么可以这么有创意', '2015-04-20 19:33:15');
INSERT INTO comment VALUES ('4', '11', '8', '加我一个加我一个', '2015-04-20 19:33:27');
INSERT INTO comment VALUES ('5', '1', '1', '细化喜欢小', '2015-04-20 21:49:41');

-- ----------------------------
-- Table structure for `competition`
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `id` int(255) NOT NULL auto_increment,
  `creator_id` int(15) NOT NULL,
  `competition_category_id` int(255) NOT NULL,
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `competition_name` varchar(255) NOT NULL default '',
  `max_people` int(11) NOT NULL default '0',
  `endTime` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='竞赛通知';

-- ----------------------------
-- Records of competition
-- ----------------------------
INSERT INTO competition VALUES ('1', '1', '0', '2015-04-03 10:48:20', '上海市全国大学生信息安全竞赛，旨在促进大学生对信息安全的兴趣。主办方为教育部，希望大家可以积极参赛', '第七届全国大学生信息安全竞赛', '5', '2015-04-08 11:00:30');
INSERT INTO competition VALUES ('2', '7', '0', '2015-04-03 10:49:42', '2015年大夏杯，属于校级比赛，分为应用型和理论型', '2015年大夏杯', '4', '2015-07-09 11:00:40');

-- ----------------------------
-- Table structure for `competition_enroll`
-- ----------------------------
DROP TABLE IF EXISTS `competition_enroll`;
CREATE TABLE `competition_enroll` (
  `id` int(11) NOT NULL auto_increment,
  `competition_id` int(11) NOT NULL,
  `competition_enroll_foo_id` int(11) NOT NULL,
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='竞赛报名表';

-- ----------------------------
-- Records of competition_enroll
-- ----------------------------
INSERT INTO competition_enroll VALUES ('11', '1', '10', '2015-04-09 20:40:27');
INSERT INTO competition_enroll VALUES ('12', '1', '10', '2015-04-09 20:43:27');
INSERT INTO competition_enroll VALUES ('13', '1', '10', '2015-04-09 20:54:05');
INSERT INTO competition_enroll VALUES ('14', '1', '10', '2015-04-09 20:54:07');
INSERT INTO competition_enroll VALUES ('15', '1', '10', '2015-04-09 20:54:08');
INSERT INTO competition_enroll VALUES ('16', '1', '10', '2015-04-09 20:54:09');
INSERT INTO competition_enroll VALUES ('17', '1', '10', '2015-04-09 20:55:27');
INSERT INTO competition_enroll VALUES ('18', '1', '10', '2015-04-09 20:55:28');
INSERT INTO competition_enroll VALUES ('19', '1', '10', '2015-04-09 20:59:28');
INSERT INTO competition_enroll VALUES ('20', '1', '10', '2015-04-09 21:11:48');

-- ----------------------------
-- Table structure for `competition_to_project`
-- ----------------------------
DROP TABLE IF EXISTS `competition_to_project`;
CREATE TABLE `competition_to_project` (
  `id` int(255) NOT NULL auto_increment,
  `competition_enroll_id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_to_project
-- ----------------------------

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_credit` int(255) NOT NULL,
  `course_availability` varchar(255) NOT NULL COMMENT '0=软件工程；1=软件工程嵌入式。大于小于号默认带有等于，但是省略',
  PRIMARY KEY  (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO course VALUES ('SOFT0031121000', '线性代数', '3', '<2011');
INSERT INTO course VALUES ('SOFT0031121001', '概率论与数理统计（一）', '2', '<2011');
INSERT INTO course VALUES ('SOFT0031121002', '高等数学（一）', '5', '<2011');
INSERT INTO course VALUES ('SOFT0031131001', '操作系统实践', '1', '>2011');
INSERT INTO course VALUES ('SOFT0031131004', '软件开发实践（一）', '1', '>2014;<2013|0');
INSERT INTO course VALUES ('SOFT0031131005', '软件需求', '2', '>2011|0');
INSERT INTO course VALUES ('SOFT0031131007', '软件测试和质量保证', '2', '<2012|0');
INSERT INTO course VALUES ('SOFT0031131010', 'C++语言程序设计', '4', '>2011');
INSERT INTO course VALUES ('SOFT0031131011', '数字逻辑', '2', '>2014;<2013|0');
INSERT INTO course VALUES ('SOFT0031131014', '软件工程数学', '4', '>2011');
INSERT INTO course VALUES ('SOFT0031131015', '计算机组成', '2', '>2011');
INSERT INTO course VALUES ('SOFT0031131017', '软件工程', '3', '<2013|1');
INSERT INTO course VALUES ('SOFT0031131018', '面向对象分析和设计实践', '1', '>2011|0');
INSERT INTO course VALUES ('SOFT0031131022', '计算机网络', '3', '>2011');
INSERT INTO course VALUES ('SOFT0031131028', '嵌入式微处理器（一）', '2', '<2012|1');
INSERT INTO course VALUES ('SOFT0031131029', '软件工程导论', '2', '>2014;<2013|0');
INSERT INTO course VALUES ('SOFT0031131030', '嵌入式软件测试', '2', '<2012|1');
INSERT INTO course VALUES ('SOFT0031131034', '嵌入式系统开发规范与建模', '2', '>2011|1');
INSERT INTO course VALUES ('SOFT0031131035', '嵌入式系统开发规范与建模实践', '1', '>2011|1');
INSERT INTO course VALUES ('SOFT0031131038', '数据结构与算法实践', '1', '>2011');
INSERT INTO course VALUES ('SOFT0031131049', 'C++语言程序设计实践', '1', '<2013');
INSERT INTO course VALUES ('SOFT0031131051', '软件开发实践（二）', '4', '>2011|0');
INSERT INTO course VALUES ('SOFT0031131054', '数据结构与算法', '4', '>2011');
INSERT INTO course VALUES ('SOFT0031131057', '计算机网络实践', '1', '>2011');
INSERT INTO course VALUES ('SOFT0031131059', '数字逻辑实践', '1', '<2013|0');
INSERT INTO course VALUES ('SOFT0031131060', '计算机组成实践', '1', '<2013');
INSERT INTO course VALUES ('SOFT0031131064', '嵌入式系统开发实践（一）', '2', '<2012|1');
INSERT INTO course VALUES ('SOFT0031131069', '硬件描述语言与设计', '2', '<2013|1');
INSERT INTO course VALUES ('SOFT0031131070', '硬件描述语言与设计实践', '1', '<2013|1');
INSERT INTO course VALUES ('SOFT0031131071', '数据库系统及应用实践', '1', '<2011|0');
INSERT INTO course VALUES ('SOFT0031131072', '数据库系统及应用', '2', '<2011|0');
INSERT INTO course VALUES ('SOFT0031131073', '面向对象分析和设计', '2', '>2011|0');
INSERT INTO course VALUES ('SOFT0031131075', '论文与技术报告写作', '1', '<2011');
INSERT INTO course VALUES ('SOFT0031131085', '操作系统', '3', '>2011');
INSERT INTO course VALUES ('SOFT0031131089', '数字电子技术', '3', '<2013|1');
INSERT INTO course VALUES ('SOFT0031131090', '数字电子技术实践', '1', '<2013|1');
INSERT INTO course VALUES ('SOFT0031131092', '编译原理', '3', '>2011|1');
INSERT INTO course VALUES ('SOFT0031131093', '编译原理实践', '1', '>2011|1');
INSERT INTO course VALUES ('SOFT0031131104', '专业英语（一）', '2', '<2013');
INSERT INTO course VALUES ('SOFT0031131105', '数据库系统及其应用', '3', '>2013;=2012|0');
INSERT INTO course VALUES ('SOFT0031131106', '软件过程和项目管理', '2', '>2011|0');
INSERT INTO course VALUES ('SOFT0031131108', '嵌入式系统概论', '2', '<2012|1');
INSERT INTO course VALUES ('SOFT0031131110', '统一建模语言', '2', '<2013|0');
INSERT INTO course VALUES ('SOFT0031131111', '嵌入式系统设计实践', '1', '>2013|1');
INSERT INTO course VALUES ('SOFT0031131112', '嵌入式微处理器及汇编实践', '1', '=2013|1');
INSERT INTO course VALUES ('SOFT0031131113', '嵌入式微处理器及汇编', '2', '=2013|1');
INSERT INTO course VALUES ('SOFT0031131119', '嵌入式系统测试与验证', '2', '>2014|1');
INSERT INTO course VALUES ('SOFT0031131120', '嵌入式微处理器原理与设计', '2', '>2014|1');
INSERT INTO course VALUES ('SOFT0031131121', 'UML及形式化建模', '2', '>2013');
INSERT INTO course VALUES ('SOFT0031131801', '硬件描述语言与FPGA设计实践', '1', '>2014|1');
INSERT INTO course VALUES ('SOFT0031131802', '软件开发实践（二）', '4', '>2014|1');
INSERT INTO course VALUES ('SOFT0031131803', '开源代码分析实践', '1', '>2014|1');
INSERT INTO course VALUES ('SOFT0031131804', '数字逻辑实践', '1', '>2014');
INSERT INTO course VALUES ('SOFT0031131805', '计算机组成实践', '1', '>2014');
INSERT INTO course VALUES ('SOFT0031131806', 'C++语言程序设计实践', '2', '>2014');
INSERT INTO course VALUES ('SOFT0031131900', '论文与技术报告写作', '1', '>2012');
INSERT INTO course VALUES ('SOFT0031131901', '毕业实习', '6', '>2013');
INSERT INTO course VALUES ('SOFT0031131903', '毕业论文', '8', '>2011');
INSERT INTO course VALUES ('SOFT0031131904', '毕业实习', '8', '<2012');
INSERT INTO course VALUES ('SOFT0031132011', '嵌入式系统开发实践（二）', '4', '<2012|1');
INSERT INTO course VALUES ('SOFT0031132067', '嵌入式系统设计', '2', '>2013|1');
INSERT INTO course VALUES ('SOFT0031132118', '数据库系统及其应用实践', '1', '>2013;=2012|0');
INSERT INTO course VALUES ('SOFT0031132179', '开源代码分析', '2', '>2014|1');
INSERT INTO course VALUES ('SOFT0031132228', '软件测试和验证', '2', '>2013|0');
INSERT INTO course VALUES ('SOFT0031132599', '专业英语', '2', '>2014');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(255) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='院系或者所在单位';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO department VALUES ('1', '软件学院');
INSERT INTO department VALUES ('2', '设计学院');

-- ----------------------------
-- Table structure for `feature`
-- ----------------------------
DROP TABLE IF EXISTS `feature`;
CREATE TABLE `feature` (
  `feature_id` int(255) NOT NULL auto_increment,
  `feature_controller_id` int(11) NOT NULL,
  `feature_name` varchar(255) NOT NULL COMMENT '控制器类中的一个函数的名称',
  `feature_friendlyname` varchar(255) NOT NULL,
  `feature_status` int(11) NOT NULL COMMENT '启用0或停用1',
  PRIMARY KEY  (`feature_id`),
  KEY `feature_controller_id` (`feature_controller_id`),
  CONSTRAINT `feature_ibfk_2` FOREIGN KEY (`feature_controller_id`) REFERENCES `feature_controller` (`feature_controller_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feature
-- ----------------------------
INSERT INTO feature VALUES ('1', '11', 'create', '创建方法', '0');
INSERT INTO feature VALUES ('2', '1', 'back_index', '管理员首页', '0');
INSERT INTO feature VALUES ('3', '3', 'back_index', '帐户首页', '0');
INSERT INTO feature VALUES ('4', '4', 'back_index', '管理员首页', '0');
INSERT INTO feature VALUES ('5', '5', 'back_index', '管理员首页', '0');
INSERT INTO feature VALUES ('6', '8', 'back_index', '管理员首页', '0');
INSERT INTO feature VALUES ('7', '9', 'back_index', '管理员首页', '0');
INSERT INTO feature VALUES ('8', '10', 'back_index', '管理员首页', '0');
INSERT INTO feature VALUES ('9', '11', 'back_index', '管理员首页', '0');
INSERT INTO feature VALUES ('10', '8', 'index', '浏览页', '0');
INSERT INTO feature VALUES ('11', '9', 'index', '浏览页', '0');
INSERT INTO feature VALUES ('12', '10', 'index', '浏览页', '0');
INSERT INTO feature VALUES ('13', '2', 'index', '浏览页', '0');
INSERT INTO feature VALUES ('14', '5', 'index', '浏览页', '0');
INSERT INTO feature VALUES ('15', '9', 'audit', '审核', '0');
INSERT INTO feature VALUES ('16', '11', 'edit', '修改方法', '0');
INSERT INTO feature VALUES ('17', '11', 'delete', '删除方法', '0');
INSERT INTO feature VALUES ('18', '11', 'edit_controller', '修改控制器', '0');
INSERT INTO feature VALUES ('19', '11', 'edit_directory', '修改目录', '0');

-- ----------------------------
-- Table structure for `feature_controller`
-- ----------------------------
DROP TABLE IF EXISTS `feature_controller`;
CREATE TABLE `feature_controller` (
  `feature_controller_id` int(11) NOT NULL auto_increment,
  `feature_directory_id` int(255) NOT NULL,
  `feature_controller_name` varchar(255) NOT NULL,
  `feature_controller_friendlyname` varchar(255) NOT NULL,
  `feature_controller_status` int(11) NOT NULL COMMENT '启用或停用',
  PRIMARY KEY  (`feature_controller_id`),
  KEY `feature_directory_id` (`feature_directory_id`),
  CONSTRAINT `feature_controller_ibfk_1` FOREIGN KEY (`feature_directory_id`) REFERENCES `feature_directory` (`feature_directory_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='功能的控制器类';

-- ----------------------------
-- Records of feature_controller
-- ----------------------------
INSERT INTO feature_controller VALUES ('1', '1', 'user', '用户', '0');
INSERT INTO feature_controller VALUES ('2', '1', 'show', '展示', '0');
INSERT INTO feature_controller VALUES ('3', '1', 'account', '个人', '0');
INSERT INTO feature_controller VALUES ('4', '1', 'role', '角色', '0');
INSERT INTO feature_controller VALUES ('5', '1', 'notice', '通知', '0');
INSERT INTO feature_controller VALUES ('8', '1', 'news', '新闻', '0');
INSERT INTO feature_controller VALUES ('9', '1', 'project', '项目', '0');
INSERT INTO feature_controller VALUES ('10', '1', 'competition', '竞赛', '0');
INSERT INTO feature_controller VALUES ('11', '1', 'feature', '特性', '0');

-- ----------------------------
-- Table structure for `feature_directory`
-- ----------------------------
DROP TABLE IF EXISTS `feature_directory`;
CREATE TABLE `feature_directory` (
  `feature_directory_id` int(11) NOT NULL auto_increment,
  `feature_directory_name` varchar(255) NOT NULL,
  `feature_directory_friendlyname` varchar(255) NOT NULL,
  `feature_directory_status` int(11) NOT NULL COMMENT '启用或停用',
  PRIMARY KEY  (`feature_directory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='一个完整模块存放的文件夹';

-- ----------------------------
-- Records of feature_directory
-- ----------------------------
INSERT INTO feature_directory VALUES ('1', '', '根目录', '0');

-- ----------------------------
-- Table structure for `funding`
-- ----------------------------
DROP TABLE IF EXISTS `funding`;
CREATE TABLE `funding` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text,
  `money` int(11) NOT NULL,
  `createTime` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funding
-- ----------------------------
INSERT INTO funding VALUES ('1', '11', '1', '很喜欢，捐一点', '5', '0000-00-00 00:00:00');
INSERT INTO funding VALUES ('2', '11', '7', '有创意，支持', '10', '0000-00-00 00:00:00');
INSERT INTO funding VALUES ('3', '11', '8', '怎么可以这么棒', '3', '0000-00-00 00:00:00');
INSERT INTO funding VALUES ('4', '12', '10', '很喜欢这个项目', '100', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `major_id` int(255) NOT NULL,
  `major_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专业';

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO major VALUES ('1', '软件工程');
INSERT INTO major VALUES ('2', '嵌入式开发');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `receiver_id` int(11) NOT NULL COMMENT '接收者为-1代表所有用户',
  `message_id` int(11) NOT NULL,
  `message_status` int(1) NOT NULL default '0' COMMENT '站内信的状态（0未读，1已读，2删除）',
  PRIMARY KEY  (`id`),
  KEY `message_id` (`message_id`),
  KEY `message_ibfk_2` (`receiver_id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`message_id`) REFERENCES `message_text` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO message VALUES ('1', '8', '1', '0');
INSERT INTO message VALUES ('2', '7', '2', '0');
INSERT INTO message VALUES ('4', '0', '3', '0');
INSERT INTO message VALUES ('5', '7', '3', '0');
INSERT INTO message VALUES ('6', '1', '3', '0');

-- ----------------------------
-- Table structure for `message_status`
-- ----------------------------
DROP TABLE IF EXISTS `message_status`;
CREATE TABLE `message_status` (
  `id` int(11) NOT NULL auto_increment,
  `status` varchar(64) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_status
-- ----------------------------

-- ----------------------------
-- Table structure for `message_text`
-- ----------------------------
DROP TABLE IF EXISTS `message_text`;
CREATE TABLE `message_text` (
  `message_id` int(11) NOT NULL auto_increment,
  `message_text` text COMMENT '站内信内容',
  `message_createtime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `sender_id` int(11) default NULL,
  `sender_status` int(1) NOT NULL default '0' COMMENT '（1代表发送方删除信息）',
  PRIMARY KEY  (`message_id`),
  KEY `message_id` (`message_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `message_text_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_text
-- ----------------------------
INSERT INTO message_text VALUES ('1', 'test2', '2015-03-09 21:24:35', '1', '0');
INSERT INTO message_text VALUES ('2', 'test3', '2015-03-09 21:24:36', '1', '0');
INSERT INTO message_text VALUES ('3', 'test1', '2015-03-09 21:24:39', '1', '0');

-- ----------------------------
-- Table structure for `mobile_message`
-- ----------------------------
DROP TABLE IF EXISTS `mobile_message`;
CREATE TABLE `mobile_message` (
  `id` int(11) NOT NULL auto_increment,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `createtime` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `content` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mobile_message
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(255) NOT NULL auto_increment,
  `news_category_id` int(11) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_content` text NOT NULL,
  `news_createtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `news_readtimes` int(255) NOT NULL COMMENT '阅读次数',
  `news_status` int(11) NOT NULL,
  `news_show_picture` varchar(100) NOT NULL COMMENT '用于主页显示的图片',
  PRIMARY KEY  (`news_id`),
  KEY `news_category_id` (`news_category_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`news_category_id`) REFERENCES `news_category` (`news_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO news VALUES ('1', '1', '7课题获2015年上海学校德育研究课题立项', '2015年上海学校德育研究课题立项情况近期公布，我校3项课题获得上海市德育决策咨询课题立项，4项课题获得上海市德育实践课题立项。据悉，2015年上海学校德育研究课题共有950余项课题申报，最终立项德育理论研究课题8项、德育决策咨文课题25项、德育实践研究课题169项。3月27日，上海市高等学校思想理论教育研究会主办的“第二届上海高校网络文化建设论坛”举行，我校思政工作团队获得3项1等奖，2项2等奖、2项3等奖，综合居上海高校首位。', '2015-02-01 21:03:36', '0', '0', 'http://news.ecnu.edu.cn/_upload/article/65/32/3961c72440aca90a8fd4c6fc83cb/938c8511-3bb4-46cd-b2fe-2');
INSERT INTO news VALUES ('2', '1', '2名教师入选上海市2014年度“阳光计划”项目', '　上海市教育卫生工作委员会、上海市教育委员会、上海市教育发展基金会于近日公布了2014年度“阳光计划”项目名单。我校教师闫方洁的《自媒体时代下大学生的媒介话语机制研究》、夏建国的《新媒体时代高校新闻发言人制度在危机应对中的功能及运用》入选，获得了2014年度“阳光计划”项目资助。\n\n　　“阳光计划”是由市教育发展基金会出资，并与市教卫工作党委、市教委于2009年开始共同实施的上海高校思想政治教育优秀青年教师培养计划，旨在培养和造就一批党建工作、宣传思想文化工作和大学生思想政治教育工作骨干人才，形成一系列高质量的党建、宣传思想文化和思政工作研究成果。\n\n　　2014年，上海市教育卫生系统各有关单位共推荐了126名青年教师申报“阳光计划”。经专家评审，网上公示，市教卫工作党委、市教委、市教育发展基金会审核，共确定50人入选2014年度“阳光计划”。', '2015-02-01 21:44:23', '0', '0', 'http://news.ecnu.edu.cn/_ueditor/dialogs/showOriginalImg.html?img=/_upload/article/71/e4/21fabf6a469');
INSERT INTO news VALUES ('3', '2', '哥伦比亚共和国教育部代表团访问我校', '4月3日下午，以哥伦比亚共和国教育部长Gina Parody为团长的哥伦比亚共和国教育部代表团一行8人访问我校，陪同来访的有哥伦比亚共和国基础及中等教育副部长Carlos Garcia、高等教育副部长Natalia Ariza、规划办主任Victor Saavedra、部长私人秘书Juan Pablo，哥伦比亚共和国驻沪总领事Richardo Galindo、文化领事Camila Gomez、总领事助理宣秀丽。Gina Parody部长一行来访旨在了解我国高校的教师培训项目和教师培养经验，特别是学前教师培养、中学教师培训、国际教师教育等方面的成果。 ', '2015-02-01 21:46:38', '0', '0', 'http://news.ecnu.edu.cn/_ueditor/dialogs/showOriginalImg.html?img=/_upload/article/71/e4/21fabf6a469');
INSERT INTO news VALUES ('4', '1', '2014-2015仲利国际奖学金在校颁发', '4月8日下午，2014-2015学年仲利国际奖学金颁奖仪式在我校闵行校区行政楼403会议室举行。仲利国际租赁有限公司企划处资深总监吴昭甫，人力资源处主任蒋辰威、副主任汪智敏，我校学生管理处处长俞世恩、副处长秦虎出席颁奖仪式。\n\n　　典礼伊始，我校商学院2012级企业管理系学生杨婉俪作为获奖学生发言，总结学习及实践经验的同时对仲利国际的资助表示感谢。吴昭甫为获奖学生颁发荣誉证书，20位来自金融与统计学院、商学院、数学系等院系的同学获此奖项。\n吴昭甫向获奖学生表示祝贺，表示希望通过提供实习、企业研修等形式助力我校教育事业的发展。俞世恩对仲利国际租赁有限公司为我校学生提供的关心与帮助表示感谢，期待与仲利国际更长远的校企合作，同时希望获奖学生勤奋学习、心系社会、回馈社会，继续弘扬仲利精神、师大精神。\n\n　　为支持华东师范大学教育事业的发展，奖励在校优秀学生勤奋学习、刻苦钻研、开拓视野，仲利国际租赁有限公司2013年起在我校捐资设立“华东师范大学仲利国际奖学金”，用于奖励华东师范大学商学院、金融与统计学院、信息科学技术学院、数学系等院系的优秀学生。每年共评选20位获奖学生，获奖学生将获得每年5000元的奖学金。　', '2015-02-01 21:57:52', '0', '0', 'http://news.ecnu.edu.cn/_upload/article/00/1a/f8c16edf4d42a2de1bb49c909201/73c641ec-f38a-43cc-b33e-d');
INSERT INTO news VALUES ('5', '1', '华南农业大学校长陈晓阳一行来校调研', '3月30日，华南农业大学校长陈晓阳，党委副书记钟仰进，副校长吴鸿、刘雅红等一行前来我校调研综合改革工作，我校副校长郭为禄会见了陈晓阳一行并举行会谈。\n座谈会上，郭为禄对华南农业大学的来访表示热烈欢迎，介绍了我校近年来在教育综合改革上取得的重要进展以及未来的发展思路。双方围绕如何开展教育综合改革进行了深入交流。\n\n　　会后，陈晓阳一行参观了我校校史馆。\n\n', '2015-02-01 22:05:56', '0', '0', 'http://news.ecnu.edu.cn/_upload/article/6a/2b/9cc8ecd143afa07b353920ee4e27/44d1584f-e4ce-417a-bd2e-d');
INSERT INTO news VALUES ('6', '2', '我校与上海市委党校、上海行政学院举行教学科研合作交流座谈会', '　3月26日，上海市委党校、上海行政学院代表团一行8人莅临我校中北校区，就马克思主义理论教学科研合作等工作与我校进行了座谈。座谈会由校党委书记童世骏主持。\n\n　　会上，双方表达了进一步开展合作的意向，并就合作的领域、方式等进行了沟通和讨论，就实现资源共享、促进协同发展等达成共识。\n\n　　上海市委党校、上海行政学院常务副校（院）长王国平介绍了上海市委党校总校、分校的基本情况和功能分布，围绕“课课求精品，精品进课堂”的中心思想，提出了“聚焦·合作”的理念，表示双方可在教学、科研、管理等方面搭建长期合作的平台。副校（院）长郭庆松表示党校尤为重视马克思主义理论学科建设，目前已经形成了一定的学科优势，希望能够与我校“抱团合作”，实现教学科研咨询一体化建设。副校（院）长、马克思主义研究院院长曾峻对党校的课程教学和人才培养情况进行了详细介绍，指出马克思主义理论教育应紧密结合新形势下的新要求、新任务。教育长梅丽红，副巡视员、办公室主任李宁，教务处处长王公龙，研究生部主任罗峰，马克思主义研究院副院长官进胜参加了本次座谈会。\n我校党委常务副书记曹文泽介绍了近日在兄弟高校马克思主义学院调研的有关情况，并就加强马克思主义学科建设、改进思政课的教学质量等问题，阐述了观点。副校长汪荣明在强调思政课建设重要性的基础上，介绍了我校构建社会科学学部的设想，以及学校在学科建设上如何更好地服务国家和地方需求方面的探索。校党委宣传部部长兼马克思主义学院院长解超结合学校马克思主义理论学科建设实际，提出以合作进一步整合学科资源，扩大学科影响力，提升思想政治课质量的思路。马克思主义学院执行院长、社会科学部主任宋进介绍了我校马克思主义学院的成立背景、师资结构、建院特色、课程设置等情况。研究生院学位管理办公室副主任李海生对我校马克思主义学院及思政课建设也作了发言。\n\n　　童世骏在主持座谈会时，结合学校发展的历程，介绍了我校马克思主义理论研究的传统，以及马克思主义学科建设的进展情况，强调了我校在马克思主义经典文本研究和重大问题研究等方面的特色与优势，希望通过双方的合作，进一步加强理论与实践的结合、学理探讨与国情研究的结合，实现科研水平和教学质量的同步提高。　', '2015-02-01 22:08:33', '0', '0', 'http://news.ecnu.edu.cn/_upload/article/71/fb/765db42f4f16babe9bd6d456bd10/f357992f-a653-4f19-8edd-7');
INSERT INTO news VALUES ('7', '1', '我校第五届本科教学督导组成立', '　第五届本科教学督导组成立大会于4月3日在闵行校区办公楼403会议室召开。副校长郭为禄、第五届校本科教学督导以及教务处工作人员30余人出席会议，教务处处长雷启立主持。\n\n　　雷启立介绍了第五届本科教学督导组成立及人员组成情况。他表示，学校以基本覆盖全校各学科专业大类为依据，综合考虑候选人年龄、学科背景、教学科研成就等因素，经院系推荐，学校讨论，最终确定了31位学术威望高、教学效果好、工作责任心强、教学和教学管理经验丰富的教师作为第五届校本科教学督导组成员。他指出，与上一届相比，本届督导组呈现出成员人数增加、院系和学科覆盖面进一步扩大、人员组成结构年轻化等特点。\n郭为禄宣读了第五届校本科教学督导组成员名单并向本科教学督导组成员颁发了聘书。\n\n　　会上，教学督导郑寅达、魏葆霖、柴俊、孙辉、丁金宏和李似珍等老师代表新一届督导做了发言。他们感谢学校的信任，表示将尽全力做好督导工作，在已有教学和管理工作经验的基础上还要不断学习，加强与院系、青年教师及学生的沟通，共同为学校打造一流本科教育贡献力量。\n\n　　郭为禄在总结讲话中感谢各位老师受聘担任教学督导，他指出，督导既是一份荣誉和尊崇，也意味着更多责任。教学督导是学校本科教学质量保障体系的重要组成部分，学校、学部和院系应建立本科教学督导组组织，加强督导队伍建设。教学督导必须坚持实事求是、客观公正的原则，以专家身份检查、监督、评价和指导教学工作。教学督导根据听课或调研的情况对教学质量做出独立判断和评价，不受任何组织和个人的干涉。教学督导随堂听课和调研的评价作为教师本科教学质量同行评价的重要依据。他期待新一届教学督导组在青年教师传帮带、本科教学制度和政策建设、教师本科教学质量同行评价等方面发挥积极作用。\n本科教学督导组是学校一支重要的专家型管理队伍。一直以来，督导们直接面对学校本科的教与学过程，承担调查研究、监督检查、沟通协调、分析评价、指导激励、建议反馈和参谋咨询等与本科教学相关的重要工作。根据《华东师范大学教师本科教学质量的评定办法》的规定，督导除完成对青年教师教学指导咨询等工作内容外，督导评价也作为教师本科教学质量评定中同行评价的重要组成部分。\n\n附：华东师范大学第五届本科教学督导组成员名单\n\n组长：郑寅达\n\n副组长：魏葆霖、柴俊\n\n成员：丁金宏、王幼芳、王行恒、尹呈忠、归青、冯春萍、李似珍、达良俊、孙 辉、邵时、张丽、 吴良平、张春柏、沈烈敏、张福娟、陈爱平、周旭东、郑寅达、赵新跃、赵鸿光、宦强、徐子亮、倪伟、聂欣如、陶保平、柴俊、唐莲英、倪峻、黄余明、程依明、魏葆霖', '2015-02-01 22:10:59', '0', '0', 'http://news.ecnu.edu.cn/_upload/article/81/e7/af5c20be4b3fbfe59fb39fa444a7/01bf8dc5-415a-41f3-843c-8');
INSERT INTO news VALUES ('8', '1', '任友群｜将“惊艳”的技术“波澜不惊”地引入日常教育', '■核心提示\n\n　　最终评价技术好不好的并非是技术新不新或贵不贵，而是技术能不能够融入生态、是否实用，是否能解决教师和学生在教学过程中的实际问题。\n\n　　在研究者眼中，教育信息技术的“不用”和“滥用”同样是值得警惕的。信息技术用得好可能就是一种新的教学方式的核心，催生教育创新；用得不好就有可能是“南辕北辙”。\n\n　　教育的社会评价是教育改革的创新探索，必须以全面准确的教育基础数据为依据，必须以大样本的抽样调查和大数据的准确分析为基础，而这些都需要教育管理信息化提供有力的支撑。\n\n\n　　过去两年，“互联网教育”成为教育和投资的“跨界热点”。MOOCs、翻转课堂、云校等一波一波概念，在教育领域先后掀起不小的“波澜”，一些地方的教育主管部门和学校，应时而动；而在资本的追捧下，大量在线教育企业涌现……\n\n　　互联网将对教育产生怎样的影响，颠覆、重塑？哪些技术又算“好的教育技术”，哪种类型的技术工具将更受欢迎？信息技术运用于教育领域存在哪些误区？未来一段时期内互联网教育的发展趋势？就这一系列问题，我们采访了华东师范大学副校长任友群教授。\n\n　　任友群教授长期研究教育技术学、学习科学与技术设计等，对信息技术运用于教育领域有深入、独到的思考。在他看来，评价一项技术的关键点在于，这项技术能不能在教育领域沉淀下来，能不能在日常教与学中沉淀下来；而讨论互联网对教育产生的影响，一定是从整个教育生态系统来着眼，单谈技术可能会失之偏颇；至于未来在线教育的发展趋势，任友群教授的判断是，“在未来，谁能依托互联网和信息技术解决个性化教育的问题，谁就能执互联网教育的牛耳。”\n\n　　融入日常教学的技术才是“好技术”\n\n　　《21世纪》：有人说，互联网将解放教育；有人说，互联网将重塑教育，甚至将颠覆教育；也有人说，教育困境的突围，关键在于信息技术的运用……对此，您怎么看？\n\n　　任友群：如果用“技术爆炸”来形容我们所处的时代是不为过的；当今，新技术的层出不穷让所有人都有点“应接不暇”。在教育领域，伴随着一项新技术的诞生，一般的进程是先爆发出“这将是革命性、划时代的”感慨，随后纷纷试点、迅速铺开，一窝蜂式地大批量采购、应用，然后从老师到学生都越用越别扭，再然后就是这项技术无疾而终，人们又开始关注下一个技术，这就是Richard Mayer所说的教育技术发展怪圈。', '2015-02-01 22:14:36', '0', '0', 'http://news.ecnu.edu.cn/_upload/article/4d/b9/33148513452798fca68741867339/cb08501a-ec1c-49be-be92-e');
INSERT INTO news VALUES ('9', '1', '我院教师代表受邀访问上海农业信息有限公司开展合作交流', '4月9日，受上海农业信息有限公司邀请，我院教师代表王晓玲副院长、姜宁康副院长、赵慧教授、金澈清教授、张冠华副教授等一行十几位教师访问了该公司，并就系列学术与技术问题开展交流，探讨相关方面深层次的合作。上海农业信息有限公司朱轶峰总经理、宋轶勤副总经理、项目总监俞柏林等热情接待和组织交流活动。\n朱轶峰总经理与宋轶勤副总经理分别非常系统的将公司各项业务与流程等情况项向我院教师都做了详细的介绍与展示，并带领完整参观了各相关环节的技术与方式方法。上海农业信息有限公司致力于农业信息化和食品安全领域中的软件开发、系统集成和信息服务。公司在农业信息化和食品安全领域中，已逐步成长为国内的行业领跑者，先后承建了国家部委与上海市等几十项国家（地区）农业信息化科技攻关项目，为农综合信息服务平台、农产品安全追溯平台、农产品电子商务平台、农业电子政务平台、农业物联网等产品在全国有了很好的应用。\n交流讨论会上，我院教师分别结合自己研究方向与兴趣，特别是对智慧农业、物联网、电子商政务等方面相关的具有针对性的介绍与分析。我院教师在数据处理、计算技术、系统优化、软硬件协同等方面都具有长期的理论研究的深厚的积累，并在与企事业单位的实践工程项目成功的社会服务案例。朱轶峰总经理提出公司当前包括平台用户数量、相关数据分析建模预测、物流管理、农业云平台、农业物联网等方面存在的主要需要与困难，希望通过合作极大解决问题，并进一步推动双方合作，建立产学研政等的一体化机制，一是推动企业与行业发展，再是深化高校科技转化与服务社会的功能。\n\n2014年在上海市农业委员会、华东师范大学、上海农业信息有限公司等多方合作的基础上，已经成功建立了农业云联合实验室。副院长王晓玲教授主持会议，并就交流讨论中传达了何积丰院士对智慧农业、农业物联网等领域的相关研究建议，以及双方合作计划的推进计划，诸如以联合实验室建设为基础，围绕继续的主要问题设立开放课题的形式逐步推进和深化合作；有针对性的开展人才培养、技术培训工作等。\n\n会后双方将进一步根据交流与合作初步方案，落实和开展具体的合作。', '2015-02-01 22:16:14', '0', '2', 'http://www.sei.ecnu.edu.cn/picture/article/57/15/8e/ceaba8bb4811b304a4864ce6c09f/d543f104-fa73-4227-');
INSERT INTO news VALUES ('10', '1', '华师大软件学院博士生支部：“TEC模式”创新党员组织生活', '上海基层党建网讯    为了激发博士生党员活力，充分发挥博士生党员科研优势，以“传、帮、带”模式引领带动低年级研究生发展，华东师范大学软件学院2013级博士生支部以“T（technology技术）E（entertainment乐趣）C（culture文化）”模式创新组织生活形式，深化组织生活内涵，提升支部党员服务能级。\n发挥技术优势，推动科研发展（technology技术）\n软件学院2013级博士生支部结合自身优势资源、主动搭建多元平台，先后开展了“学长话科研”、“本研牵手第二季”、“博士生讲团沙龙”、“研究生开放日”等活动，组织实施了“1+N”专业成长计划，即通过一名博士研究生和多名本科生结对并组成“1+N”学习型小组，进行为期一年的软件项目实践与开发。在上述活动中，博士生党员介绍分享了自己的科研心得体会，畅谈了关于科研成长历程的困难应对方法，通过“传、帮、带”的形式推动低年级研究生科研发展。在支部11名党员的共同努力下，“1+N”专业成长项目取得了良好成效，共实现了2个国家级项目、6个上海市项目和10个华师大校级大夏基金项目的申报。同时，受到2013级博士生支部党员的感召，其他硕博党支部也纷纷加入到活动中。这些活动不仅浓厚学院科研氛围，推进研究生队伍科研能力协同发展，也进一步增强了党支部和党员的凝聚力。\n丰富支部生活，愉悦党员身心（entertainment乐趣）\n为了进一步激发博士生党员活力、愉悦党员身心，也为丰富支部活动内容。软件学院2013级博士生党支部注采取多种措施拓展支部生活内容，实现支部生活的原则性与灵活性相统一。组织开展“硕博羽毛球联赛”、“户外素质拓展”、“春季野外踏青’等文娱活动，让博士生党员们在紧张的科研生活中得以放松，让博士生党员在各类文娱活动中发现“别样”的自己，改变了博士“学究”的传统印象，“活化”了博士生党员的形象。同时开展上述活动，进一步融洽了支部党员关系，拉近了本硕博党员间的距离，提升学院学生党组织整体凝聚力。\n引入文化元素，提升人文素养（culture文化）\n软件学院2013级博士生支部为了推动党员全面发展，在组织开展各类科研活动提升党员科研硬实力的同时，还注重在支部生活和各类活动中引入人文元素，提升党员的软实力。一方面组织党员定期学习交流中央重大会议精神，研读党建书籍，提升党员理论素养。另一方面，组织开展博士生党员“TED”演讲活动，特点是内容多元、主题思想不限、形式开放，以此激发博士党员拓展学术视野、涉猎人文学科的动力。截至目前，已经有多位博士生主动登台演讲，取得了良好效果。\n“TEC”模式的实施创新了支部组织生活形式，也让博士生党员们在参与活动的过程中实现了“乐活、乐享、乐学”的目标。', '2015-02-01 22:17:33', '0', '0', 'http://cms.shjcdj.cn/images//2015/4/10/1428624382745.jpg');
INSERT INTO news VALUES ('11', '1', '蕴韬略，更卓越', '午后的阳光温暖了三月的尾声。2015年3月25日，50名团校成员在院团委书记李恒超、辅导员朱莺老师的带领下前往SAP公司参观交流。SAP公司大学联盟孙斌经理及两位人力资源部门同事全程参与。整个活动中同学们表现了极高的兴趣与热情，展现了软院学子的朝气与风采，使这场长达4个小时的活动充满了欢乐的气息。\n下午2点，同学们到达位于张江软件园的SAP中国研究院。首先由孙经理及两位同事分组带领大家参观SAP的工作环境。同学们通过孙经理的声情并茂的讲解，及实地参观公司发展历史展板、荣誉墙，餐厅、健身房、户外天台、咖啡休息区等各区域。通过健身房、咖啡吧等互动，亲历公司里一些员工正在进行瑜伽等身体锻炼活动，大家通过参与体验，亲身感受这全球领先的软件公司的特色文化。\n参观活动后，SAP公司的大学联盟项目经理孙斌为同学们带来了一场精彩的讲座。他以演示PPT的形式介绍了SAP公司在中国的发展，技术和核心业务拓展以及大学联盟在同学们生实习就业方面能提供的指导和帮助。讲座结束后，同学们的积极提问以及SAP公司的专业解答，为企业与学校、学生开展更广泛的交流搭建了良好的平台，给软院学生一个了解软件行业的机会，提高软院学生在未来求职道路上的竞争力。小小的会议室里洒落的阳光与学术的氛围交织，温馨的感觉久久不散。\nSAP企业参观活动是团校学习的重要一课，更是“软件筑梦·未来方舟之旅”第三届软件文化节的第二站“泰山北斗”。此次活动，丰富了同学们的校园活动，通过到软件企业的实际参观及亲身实践，感受先进企业的企业文化，提高自身素质，开拓自身的视野，普及企业管理知识和技能并学习有关企业的运作方式，为软院学生提供一个实践锻炼的平台，激起软院学生的创新思维和创新技能，共创软院辉煌明日。\n\n\n', '2015-02-01 22:19:49', '0', '0', 'http://www.sei.ecnu.edu.cn/picture/article/57/c4/75/40a5bad7442d87df0e2cbb48537d/e5deb314-5488-4f86-');
INSERT INTO news VALUES ('12', '1', '普华永道宣讲会成功举办', '在2015年的4月1日，在我校理科大楼的B224室，普华永道的HR以及相关从业人员应邀前来举办暑期实习生的宣讲活动。辅导员叶林娟老师出席，软件学院本科生与研究生同学积极参与，同时，也有不少其他的院系的同学的身影，看来普华永道确实盛名在外。\n\n整个宣讲会大致分为三个部分，公司介绍、人才培养方案，以及最后的笔试。整个宣讲会由普华永道的HR全程进行讲演，也让各位有意向实习的同学更有准备吧，毕竟也可以说是和HR面对面了。\n\n在宣讲的第一部分，主要介绍了普华永道的企业历史，公司规模及主要业务，以及最重要的企业文化。普华永道素来以薪金而闻名，然而通过这次宣讲会，让我们更多的了解到了普华永道的一些内涵。无论是遍布全球的企业规模，还是从两个小会计事务所发展合并成长至今的企业发展史，还是自由与严谨并存的企业文化，都让与会的各位同学，包括辅导员老师对普华永道有了深层次的了解。随着宣讲的进行，不难发现，有不少同学已经跃跃欲试了。\n\n第二部分，就是对于人才培养方案的介绍。普华永道对于人才培养的方针是“grow your own way”，这是大的方向。而更细致的培养方法，他们自称为“普华永道全方位人才计划”，包括“whole leadership”、“business acumen”、“technical capabilities”、“global acumen”以及“relationships”。其中有更细致的拓展，这里就不再赘言。随后，HR女士又以一位高级主管为例子，大致讲述了他从实习生开始，在普华永道的升职历程，这个过程大概经历了十几年，还是相对比较迅速的升职了。最后，告诉我们：机会，就在普华永道。', '2015-02-01 22:27:24', '0', '0', 'http://www.sei.ecnu.edu.cn/picture/article/57/fb/68/04fa12e1415c8a7cff13f6a90fb5/9593b491-d549-4091-');
INSERT INTO news VALUES ('13', '1', '软件学院首场摩根士丹利实习宣讲会拉开序幕', '2015年3月30日下午，摩根士丹利一行人员来到软件学院举办关于招聘暑期实习生的宣讲会。学院党委副书记兼副院长洪燕老师、副院长王晓玲老师、学院团委书记李恒超老师等应邀出席，软件学院本科生和研究生同学们积极参与。\n\n宣讲会伊始，摩根士丹利的人力资源部肖孜俊先生为我们介绍了出席这次宣讲会的公司领导及员工，其中有摩根士丹利亚太企业基础设施首席信息官、董事总经理Evangelos Kotsovinos，执行董事Fan Liu，算法交易副总裁Yun Ling，市场数据资深分析师Anna Liu。\n随后，执行董事Fan Liu为我们介绍了摩根士丹利公司的基本情况，说明了研发工作在为公司创造效益方面发挥的巨大作用，着重强调了公司对信息技术部门的重视和大力支持，而这些问题正是我们同学所最关心的地方。接着，亚太企业基础设施首席信息官、董事总经理Evangelos Kotsovinos为我们举办了一场主题为“移动、云计算、大数据”的讲座，云计算以安全、灵活、快速的方式驱动效率提升，大数据通过商业智能和分析帮助提升效益，一个企业中的开发者来讲大数据，使得在场的同学更能理解到大数据的实际应用，比空洞的讲座来的更有效，在场的同学认真聆听，也接触到了许多技术与商业结合领域内的新的理念。\n毕业于华东师范大学、现就职于摩根士丹利的市场数据资深分析师Anna为我们介绍了公司的多元文化，讲述了她当初在公司实习期间参与项目过程的点点滴滴和心得体会，鼓励大家加入到摩根士丹利中，积极迎接机遇与挑战。Anna以一个前辈的身份对我们的同学即将面临的实习工作提出了宝贵的意见，同学们受益匪浅。Anna亲和的演讲也获得了同学们的一致好评。\n\n为了让大家能进一步深入了解实习生工作的方方面面，HR随后详细介绍了摩根士丹利今年的实习生项目的具体情况，对技能要求做出了详细的解释。在座的同学也针对自己的困惑和疑问提出了问题，得到了摩根士丹利公司工作人员的认真解答。最后，HR表示在近几年的实习生招聘过程中，华师大学生的表现越来越优异，希望有更多的学生能参与其中。同学们也都表示出了极大的兴趣。至此，摩根士丹利的实习生招聘宣讲会成功落下帷幕。\n\n', '2015-02-01 23:06:48', '0', '0', 'http://www.sei.ecnu.edu.cn/picture/article/57/ae/02/924bbbcf4a6ba08d6225278903a4/4f03d148-4816-420b-');
INSERT INTO news VALUES ('14', '2', '软件文化节之“奔跑吧，EMC”校园日活动圆满结束', '4月1日，这个阳光灿烂的午后，华东师大软件学院软件文化节之“奔跑吧，EMC”校园日活动成功举办。EMC公司大学联盟主任项目经理刘龑先生，人力资源部吴昕女士作为应邀出席。本次活动由华师大软件学院团学联及EMC学生俱乐部联合主办。14级方一帆、向茜同学担任主持。\n\n在主持人简洁的开场白后，活动正式开始。主办方以一段小视频向同学们展示了EMC业务飞速发展、活力温馨的企业文化。对公司简单的介绍后，主任项目经理刘龑先生为大家进行关于学习软件方面的演讲。\n\n刘龑先生没有像大多数演说那样从WHAT WHY HOW这三个方面来介绍关于学习软件的方方面面，而是通过一个真实发生的小故事来讲述关于学习精神的感悟。三位初出校园的同学由于家庭的传统思维的不同走上了三条完全不同的道路。刘龑先生以这个故事告诉同学们“学习的正真作用是锻炼思维，储备知识，进而提高能力”同时他也指出“性格改变命运”这一观点，以此激励同学们珍惜时间，努力学习。\n\n接下来由EMC公司的人力资源部吴昕女士就同学们关心的实习方面的问题与同学们进行互动交流。吴女士通过几组数据向大家展示了EMC公司领先的业务水平和优秀的员工培育。\n\n室内活动环节后，EMC公司与华师的同学们在灿烂春光里留下宝贵的合影，青春与活力的笑容洋溢在每一位参与者的脸上。活动进行到真正的“奔跑”环节。撕名牌，夹气球，问题抢答，赛跑…….由主办方精心设置的赛程让每一位参与的同学都知识的体验和运动的欢乐。活动前四名的四支队伍分别为（排名不分先后）：无名队、文艺队、陪跑小分队和淘汰队。活动场地贯穿整个华师校园。灿烂的阳光，干净的空气，路边的绿树红花，还有尽情奔跑，放肆欢笑的我们，这是我们最美丽的青春！ ', '2015-02-01 23:11:26', '0', '0', 'http://www.sei.ecnu.edu.cn/picture/article/57/b6/99/d915d5354f16946d343814634b12/b78e8d1b-2fee-43c0-');
INSERT INTO news VALUES ('16', '1', '软件学院•河口海岸科学研究院第十三期联合党校开学', '软件学院•河口海岸科学研究院第十三期联合党校开学\n\n政治学系党委书记赵正桥作《党的性质、理想和宗旨》专题报告\n\n2015年3月25日周三下午，软件学院•河口海岸科学研究院第十三期联合党校开学典礼暨讲座在数学馆113室举行，学院党委书记、党校校长李恺、政治学系党委书记赵正桥、学院党委副书记副院长、党校副校长洪燕，党校秘书、研究生辅导员叶林娟应邀出席，软件学院研究生党员李佳凡支持开学典礼，来自软件学院和河口海岸科学研究院的48名入党积极分子参加了本次活动。\n\n开学典礼伴随国际歌的奏响正式开始。我们全体起立，聆听着国际歌雄浑的旋律，心中对党的敬畏之情油然而生。接着，软件学院党委书记、第十三期联合党校校长李恺老师致辞，对所有入党积极分子提出期望并预祝党校圆满成功。之后，河口海岸科学研究院的研究生代表姚俊同学和软件学院本科生代表王旭明同学分别作为研究生和本科生入党积极分子代表上台发言，代表全体学生对党表达入党的决心与忠诚。\n\n简短不失严肃的开学典礼之后，我校政治学系党委书记赵正桥老师应邀为党校学院作了《党的性质、理想和宗旨》专题报告。报告中，赵老师从政党基本知识切入，结合我国历史畅谈政党的起源以及社会主义政党的发展，让我们更为深刻地了解了中国共产党的成立背景与成长过程。赵老师分析了党的历史局势以及当今局势，让我们准确地理解与把握了党的性质、宗旨与理想，让我们从小事做起，严格要求自己，将共产党理想细化落实到我们的生活中，身先士卒，成为一个优秀的中国共产党员。此外，赵老师还强调了入党动机的重要性，希望我们能正确认识党，端正入党动机，认真参加党校学习。在聆听了赵老师的报告之后，在党校执行组成员的精心组织下，党校学员进行了分组，并积极参与了小组成员破冰游戏，相互间初步熟悉了组内的成员。\n\n据悉，此次开学典礼以及讲座的举办只是本期联合党校的一个开始，本期党校不仅安排了党的理论知识、理想信念、环球视野等专题报告，还安排了“青年大学生自觉践行社会主义核心价值观”的专项学习和主题演讲活动。此外，党校同样关心入党积极分子的综合素质养成和专业能力建设，就此专门安排了户外素质拓展、“研究生学导”见面会、学业指导规划等专项活动。', '2015-02-02 16:30:12', '0', '0', 'http://www.sei.ecnu.edu.cn/picture/article/57/39/8b/474299ba489db043f707e952195c/b93aede3-a57e-454b-');
INSERT INTO news VALUES ('17', '1', '软件学院2015年度学科建设会议顺利召开', ' 新春伊始，软件学院于2015年3月20--21日组织召开了2015年度第一次学科建设会议。本次会议得到了学校相关职能部门领导的大力支持，我校学科办陈振楼主任、科技处张文处长、教务处雷启立处长、人事处施国跃处长、人才办钱海峰主任到会为软件工程学科建设建言献策。软件学院院长何积丰院士、党委书记李恺在内的软件学院100余人教职工及12名学生代表齐聚一堂，共商软件工程学科建设规划和发展大计。会议由软件学院副院长王长波主持。\n\n    3月20日下午，软件学院各位分管领导和研究基地负责人从人事人才工作、教学工作、科研工作、学科建设以及学科基地情况等方面进行了介绍。软件学院党委书记李恺教授就学院近几年人事人才工作情况做了介绍，从学院师资队伍总体情况、青年人才培养情况、师资队伍竞争力分析及学校2015年度人事人才工作重点四部分内容对学院人事人才工作情况做了详细介绍，并对学院2015年度人事人才工作重点做了部署安排。\n    接着，分管教学工作的姜宁康副院长对学院教学工作情况进行了介绍，并对本科生教学工作提出了更高要求。分管科研工作的王晓玲副院长对学院近三年科研工作包括论文、科研项目、科研获奖情况、国际交流和重点研究基地建设等做了情况介绍和问题分析。分管学科建设工作的王长波副院长详细分析了软件工程学科评估的各级指标，并结合目前学科发展情况以及学科发展规划进行了比较分析，查找目前学科发展中存在的主要问题，提出进一步的发展思路。\n  随后是学院四个学科基地情况介绍。朱惠彪、周傲英、曹珍富和陈仪香教授分别对上海市高可信计算重点实验室、教育部软硬件协同设计与应用工程研究中心、数据科学与工程研究院、密码与安全研究中心进行了介绍。\n\n    最后，院长何积丰院士发表了讲话。何院长首先说明了召开本次全院学科建设会议主要目的有两个方面：一方面是为了向全院教职工传达学校深化综合改革的思路和相关政策制度及学校今年的工作重点；另一方面希望全院师生了解我院学科建设工作和学科发展规划，并积极参与学科建设，在学院发展中发挥更大作用。随后，何院长讲了学院在国家级人才计划申报以及学科建设方面遇到的一些困难，并介绍了学院将管理中心下移到各二级学科的改革思路。最后，何院长希望学院每位教师在分组讨论会上积极表达自己的意见，认真考虑最适合自己的岗位和方向，为学院的学科建设做出贡献。\n\n 3月21日上午分组讨论，学院师生按照可信软件理论、数据科学与工程、密码与安全、嵌入式系统四个二级学科方向分组围绕学科方向的战略定位、建设思路、资源需求以及建设规划展开了激烈的讨论，并对讨论结果做了分组汇报。\n\n可信软件理论学科方向提出在队伍建设方面希望进一步加强引进国内外优秀青年人才，加强团队凝聚力，增加合作研究，形成传帮带的合作机制；提高攻克困难课题的战斗力，勇于申请国家级重大研究课题和努力争取各方面资源；师生之间要加强沟通，培养学生积极进取的精神；课程内容方面需要与时俱进，加强基础课程的同时融合更新的内容。\n\n数据科学与工程学科方向提出要完善制度建设，特别是对新进老师的激励制度；学生培养要分类培养，年轻教师也要有相对的独立性和个性化的发展；教师需要多参与学术组织和社会服务，提高在学术领域的影响力。\n\n密码与安全学科方向提出希望通过引进海内外优秀人才，同时内部挖掘培养本团队现有的优秀人才，增强团队的整体竞争力，科学研究方面不但需要争取发好文章，还需要重视专利的申请和转化；同时提出建设网络安全系的设想，在本科教学中加入部分密码学研究的课程。\n\n    嵌入式系统学科方向提出在人才培养方面需要培养有较强动手能力的人才；将尝试通过团队里面的小组模式带动团队发展，强调软件与硬件的协同，科学研究与应用的协同；在科学研究方面，以物联网和工业4.0为契机争取更多项目；将加强专利转化的能力，通过积极参与企业项目，增加学科的社会影响力。\n\n', '2015-02-02 21:43:34', '0', '0', 'http://www.sei.ecnu.edu.cn/picture/article/57/1b/c2/ac544c3f42fc8ce248c33eab3a61/852fc0a3-6df3-447e-');
INSERT INTO news VALUES ('18', '1', '“新学期扬帆起航”', '  3月19日晚19点数学馆202室，2013级博士党支部举办了以“新学期扬帆起航”为主题的支部大会。新学期伊始，出国短期访学和外派项目的支部成员相继回归支部大家庭，交流氛围热烈浓厚。\n\n大会主要分为三个部分：支部党员信息核对统计，党务工作相关内容传达，以及创新组织生活案例新学期活动的集思广益。\n\n    因学校党委组织部在2014年底对我校党员发展相关操作细则进行了修订和调整，在上一周11日，学院特别邀请了我校专职组织员李海芬老师为我院师生开展党务工作业务能力培训，让各位支部书记和支委委员能尽快熟悉新的党务工作流程和相关操作办法。为了更高效有序地完成支部党务工作，支部书记徐冰清同志向大家传达和强调了发展新党员，党费收缴，离校组织转接，出国交流访学党籍保留等学习会上和各个党员所息息相关的相关流程操作。交流过后支部党员对党务工作流程新变化有了更为具体的认识，明确了其重要性和必要性。\n\n    创新组织生活案例“乐活，乐享，乐学”——博士生TEC演讲已经实施了一个学期，通过投影当时的活动照片和新闻，支部成员再次一同回顾了上学期在支部带动下组织并参与的学长话科研、本研牵手第二季等活动。在13级博士党支部的感召下，其他硕博党支部也纷纷加入到行列中，更有不少优秀团员也参与到引领学院学生发展的队伍中来。新学期力求新突破，支部成员非常乐意在活动多样性和支部党员自主策划这个方面抛砖引玉，做出表率。在理论学习上，预备与其它党支部联合，以十八届四中全会《决定》一书中的议题为启发由支部代表带领进行讨论；由支部成员自主策划的户外踏青交流会，欲邀请各实验室的兄弟姐妹一同享受大好春光同时一起聊一聊专业规划、全面人才素养是怎样炼成的；一年之计在于春，增强体育锻炼必不可少，开展乒乓球羽毛球活动，加强体质。支部成员正摩拳擦掌筹备多姿多彩的组织生活。 \n\n会后，支部相继收到若干支部愿意一起组织支部生活，学习创新方法的邀约，支部成员收到很大的鼓舞。', '2015-02-02 21:46:18', '0', '1', 'http://www.sei.ecnu.edu.cn/picture/article/57/52/ee/8954892149c09a5fb9cf4db8bd0d/0df0c210-e67c-4933-');
INSERT INTO news VALUES ('19', '1', '软件筑梦，未来方舟之旅', '春风化寒，雨济天晴，多方嘉宾与莘莘学子齐聚一堂。2015年3月18日下午1：30，第三届软件文化节开幕式于数学馆113室隆重开幕，国家千人计划特聘教授、华东师范大学软件学院查宏远教授为本科生们带来“大学学习方法漫谈”精彩讲座。软件学院党委副书记兼副院长洪燕，软件学院副院长姜宁康，软件学院副院长王晓玲，软件学院团委书记李恒超，软件学院辅导员朱莺、叶林娟等多位老师莅临了开幕式的现场。本届开幕式由团学联学习拓展中心策划承办，14级的曹渊同学主持了本次活动。\n\n“编程技能的提高，软件开发的能力与理论学习必要的同时，希望同学从日常生活中发现问题，从而创新学习。”副院长姜宁康首先致辞。“软件学习虽有艰难险阻然而也机遇无限，寄予同学们能够花费精力去学习，培养团队合作能力，团队是一种文化的象征，软件学习应当凝聚多方的能力，从而多元化，全面化，进而创造更多的机遇。”姜宁康副院长的致辞表达了对软件文化节在全面提升学生综合素质，发掘专业能力，促进良好学风养成方面起到引领作用。同时，学院将会更加努力地去创造更多的条件，支持更多的特色活动。\n\n一段不同学院学生和老师对软件看法和建议的视频呈现在大屏幕上，“软件改变着我们的观念与生活”，“软件无处不在”，“软件必不可少”，鲍钰、王丽萍、杜育根等教师就软件基础学习、软件专业发展、及软件行业的前景等问题与同学们共同分享看法和经验。\n\n随后，查宏远教授为师生带来了一场“大学生活漫谈”的精彩学术讲座。查教授由自身出发，娓娓道来他年轻时的求学经历，“学好离散等基础学科是很重要的”，“机遇永远留给有准备的人”，“毅力是很重要的”。查教授循循教导，鼓励大三大四的同学能够多“走出去看看”，增加自身的底蕴和内涵。同时，他劝导我们多深入社会，让自身适应社会日新月异的变化。查教授特别提醒到，随着科技进步发展，我们将有更多的同学参与国际化的合作与研究，英语技能举足轻重。英语是一种必不可少的工具，同学们要利用校园的学习环境和机会，重视英语学习，不断提高英语水平。活动中创新的微信墙为我们提供了与教授们互动交流的平台，同学们踊跃参与线上讨论，表现出极大的热情。风趣的演讲过后，全场掌声雷动，气氛一度被推向高潮。学习拓展中心部长朱柯舟同学筛选了微信互动墙上的同学们关心的“专业知识体系庞杂如何端正心态和学习方法”，“基础知识等对于大数据等前沿技术的帮助和促进”，“跟随老师进实验室做项目的方向选择和定位”三个问题与查教授互动。查教授一一解答了这些问题，为我们在座的同学提供了详尽的分析，令我们受益匪浅。\n\n伴随着一段欢乐版的团学联各部长的祝福和活动宣传视频，软件文化节开幕式走向尾声，但同学们珍惜年华奋发努力的精神，对软件专业的不懈探索与追求将一直在不断前进的路上。愿同学能以软件文化节为契机，激发学习兴趣，提升专业能力，收获更多.', '2015-02-02 21:49:48', '0', '0', 'http://www.sei.ecnu.edu.cn/picture/article/57/e8/d0/fef40b1e4472abba89cab6c8a6cf/fa2b8438-39d6-4844-');

-- ----------------------------
-- Table structure for `news_category`
-- ----------------------------
DROP TABLE IF EXISTS `news_category`;
CREATE TABLE `news_category` (
  `news_category_id` int(255) NOT NULL auto_increment,
  `news_category_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`news_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_category
-- ----------------------------
INSERT INTO news_category VALUES ('1', '团学联');
INSERT INTO news_category VALUES ('2', '新闻类型2');

-- ----------------------------
-- Table structure for `news_status`
-- ----------------------------
DROP TABLE IF EXISTS `news_status`;
CREATE TABLE `news_status` (
  `news_status_id` int(11) NOT NULL,
  `news_status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_status
-- ----------------------------
INSERT INTO news_status VALUES ('0', '已发布');
INSERT INTO news_status VALUES ('1', '草稿');
INSERT INTO news_status VALUES ('2', '垃圾箱');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int(255) NOT NULL auto_increment,
  `notice_creator_id` int(255) default NULL,
  `notice_category_id` int(255) NOT NULL,
  `notice_createtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `notice_title` varchar(255) NOT NULL,
  `notice_content` text NOT NULL,
  `notice_status` int(11) NOT NULL,
  PRIMARY KEY  (`notice_id`),
  KEY `notice_creator_id` (`notice_creator_id`),
  KEY `notice_category_id` (`notice_category_id`),
  KEY `notice_status` (`notice_status`),
  CONSTRAINT `notice_ibfk_3` FOREIGN KEY (`notice_category_id`) REFERENCES `notice_category` (`notice_category_id`),
  CONSTRAINT `notice_ibfk_4` FOREIGN KEY (`notice_status`) REFERENCES `notice_status` (`notice_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO notice VALUES ('1', '8', '1', '2014-12-11 18:44:10', '十二月份将于数学馆进行著名大学教授的学术报告', '讲座题目：Shuang YANG：Topic modeling and machine learning at Twitter主讲人：Shuang YANG 教授主持人：查宏远 教授开始时间：2014-12-29 14:30讲座地址：中北校区数学馆201室主办单位：软件学院 科技处报告摘要： We aim to provide a topic-awaremulti-channel experience on Twitter to facilitate content creation, discoveryand consumption. This requires the ability to organize in real-time acontinuous stream of sparse and noisy texts (i.e., tweets) into hundreds oftopics with measurable and stringently high precision.I will introduce Jubjub, a high-precisiontweet topic modeling system deployed inside Twitter, and the machine learninginfrastructure behind it (and many other products).报告人简介： Shuang is a Senior Research Scientist atTwitter, where he leads the machine learning infrastructure team. Prior toTwitter, he worked on machine learning and predictive analytics at MicrosoftResearch and Yahoo! Labs. He earned his Ph.D from Georgia Institute ofTechnology (advised by Professor Hongyuan Zha) in 2012. He has publishedactively at leading academic conferences and journals. He is the winner ofYahoo! Key Scientific Challenge award (2011) and Facebook Fellow (2011,finalist), and the recipient of the ACM SIGIR 2011 Best Student Paper award,the UAI 2010 Best Student Paper award (nominated) and the PAKDD 2008 BestStudent Paper award.', '1');
INSERT INTO notice VALUES ('2', '7', '1', '2015-02-02 22:07:14', '关于开展学校二级单位网络与信息安全检查的通知', '<td width=\"100%\" id=\"ext-gen23\"><p id=\"ext-gen22\">\r\n各单位：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 为进一步加强我校网络与信息安全工作，切实保障网络基础设施与信息系统（网站）的安全运行，配合上级单位进行网络与信息安全检查，推进教育行业信息系统等级保护工作，现就学校二级单位网络安全检查工作通知如下： \r\n</p>\r\n<p id=\"ext-gen25\">\r\n一、&nbsp;检查目的<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据“谁主管谁负责，谁运营谁负责，谁使用谁负责”的原则，通过开展网络与信息安全检查，摸清重要网络基础设施与信息系统（网站）的底数，系统评估安全状况，全面排查安全隐患，提升网络安全技术防护能力，健全网络安全责任制，为我校网络与信息安全全局工作提供指导依据。<br>\r\n二、&nbsp;检查对象<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 学校各职能部门、直属单位以及学院、系、所、中心、重点实验室、研究基地等二级单位。<br>\r\n三、&nbsp;检查内容<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （一）&nbsp;人员保障：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 包括单位网络与信息安全责任人、信息安全员等。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （二）&nbsp;网络基础设施：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 包括机房、网络出口、服务器、门禁、管理人员和制度等内容。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （三）&nbsp;信息系统和网站：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 包括信息系统和网站的物理位置、管理机构、使用单位和运行维护单位、正版软件、服务器设置、管理人员和制度等内容。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （四）&nbsp;新媒体：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 包括微信、微博等内容。<br>\r\n四、&nbsp;时间安排<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2015年2月6日之前，各单位将填写好的《信息安全自查表》签字盖章后和相关附件材料一并报送至信息化办公室。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 中山北路校区: 光华路第九宿舍楼下（研究生院斜对面）<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 闵行校区:&nbsp;&nbsp;&nbsp; 图文信息中心主楼207室<br>\r\n五、&nbsp;工作要求<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 各单位需重视此次安全检查工作，认真填写、上报《信息安全自查表》中的相关内容，并以此次检查为契机，切实提高自身的网络与信息安全意识，进一步规范相关工作。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 联系人： 刘莉&nbsp;&nbsp;&nbsp; 联系电话：62233081-208 \r\n</p>\r\n<p>\r\n附：<a href=\"/eapdomain/static/cmsfiles/pim/File/20150127085108.doc\">二级单位网络与信息安全自查表</a> \r\n</p>\r\n<p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 信息化办公室&nbsp;&nbsp;<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015年1月27日 \r\n</p>\r\n</td>', '2');
INSERT INTO notice VALUES ('3', '8', '1', '2015-02-02 22:16:15', '关于开展学校二级单位网络与信息安全检查的通知', '<td width=\"100%\" id=\"ext-gen23\"><p id=\"ext-gen22\">\r\n各单位：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 为进一步加强我校网络与信息安全工作，切实保障网络基础设施与信息系统（网站）的安全运行，配合上级单位进行网络与信息安全检查，推进教育行业信息系统等级保护工作，现就学校二级单位网络安全检查工作通知如下： \r\n</p>\r\n<p id=\"ext-gen25\">\r\n一、&nbsp;检查目的<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据“谁主管谁负责，谁运营谁负责，谁使用谁负责”的原则，通过开展网络与信息安全检查，摸清重要网络基础设施与信息系统（网站）的底数，系统评估安全状况，全面排查安全隐患，提升网络安全技术防护能力，健全网络安全责任制，为我校网络与信息安全全局工作提供指导依据。<br>\r\n二、&nbsp;检查对象<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 学校各职能部门、直属单位以及学院、系、所、中心、重点实验室、研究基地等二级单位。<br>\r\n三、&nbsp;检查内容<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （一）&nbsp;人员保障：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 包括单位网络与信息安全责任人、信息安全员等。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （二）&nbsp;网络基础设施：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 包括机房、网络出口、服务器、门禁、管理人员和制度等内容。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （三）&nbsp;信息系统和网站：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 包括信息系统和网站的物理位置、管理机构、使用单位和运行维护单位、正版软件、服务器设置、管理人员和制度等内容。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （四）&nbsp;新媒体：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 包括微信、微博等内容。<br>\r\n四、&nbsp;时间安排<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2015年2月6日之前，各单位将填写好的《信息安全自查表》签字盖章后和相关附件材料一并报送至信息化办公室。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 中山北路校区: 光华路第九宿舍楼下（研究生院斜对面）<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 闵行校区:&nbsp;&nbsp;&nbsp; 图文信息中心主楼207室<br>\r\n五、&nbsp;工作要求<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 各单位需重视此次安全检查工作，认真填写、上报《信息安全自查表》中的相关内容，并以此次检查为契机，切实提高自身的网络与信息安全意识，进一步规范相关工作。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 联系人： 刘莉&nbsp;&nbsp;&nbsp; 联系电话：62233081-208 \r\n</p>\r\n<p>\r\n附：<a href=\"/eapdomain/static/cmsfiles/pim/File/20150127085108.doc\">二级单位网络与信息安全自查表</a> \r\n</p>\r\n<p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 信息化办公室&nbsp;&nbsp;<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015年1月27日 \r\n</p>\r\n</td>', '0');
INSERT INTO notice VALUES ('4', '8', '1', '2015-02-02 22:18:06', '关于开展2014年度师生满意度有奖调查的通知', '<td width=\"100%\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\">各位老师、同学：<span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 28.5pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\">为进一步拓展与师生之间沟通联系的渠道，更好地了解师生的工作与学习状态，提高管理服务水平，特开展本次师生满意度有奖调查。<span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 28.5pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\" id=\"ext-gen23\">本次师生满意度调查采用在线匿名调查的形式，分为教师卷、职员卷、本科生卷、研究生卷四类问卷。每类问卷设有丰厚的奖品，凡填写完整、有效问卷的师生，均有机会获奖。（提交问卷后，可进行系统抽奖。若显示中奖，请留下联系方式，我们会与您联系领奖事宜）<span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 28.5pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\">欢迎广大师生踊跃参加！<span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 28.5pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\">联系人：王文健<span lang=\"EN-US\"><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>联系电话：<span lang=\"EN-US\">24284332</span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 28.5pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 231.3pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\">华东师范大学发展规划办公室<span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 266.3pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">2014</span><span style=\"font-size: 14pt; font-family: 仿宋\">年<span lang=\"EN-US\">5</span>月<span lang=\"EN-US\">23</span>日<span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 28.5pt\">\r\n<strong><span style=\"font-size: 14pt; font-family: 仿宋\">附：<span lang=\"EN-US\"></span></span></strong>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 28.5pt\">\r\n<strong><span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋; color: black\">1</span></strong><strong><span style=\"font-size: 14pt; font-family: 仿宋; color: black\">、问卷填写链接如下<span lang=\"EN-US\">:</span></span></strong><span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋; color: black\"></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\"><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-size: 14pt; font-family: 仿宋\">教师卷：<span lang=\"EN-US\"><a href=\"http://www.sojump.com/jq/3470644.aspx\"><font color=\"#0000ff\">http://www.sojump.com/jq/3470644.aspx</font></a></span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\"><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-size: 14pt; font-family: 仿宋\">职员卷：<span lang=\"EN-US\"><a href=\"http://www.sojump.com/jq/3470480.aspx\"><font color=\"#0000ff\">http://www.sojump.com/jq/3470480.aspx</font></a> </span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\"><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-size: 14pt; font-family: 仿宋\">本科生卷：<span lang=\"EN-US\"><a href=\"http://www.sojump.com/jq/3468092.aspx\"><font color=\"#0000ff\">http://www.sojump.com/jq/3468092.aspx</font></a></span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\"><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-size: 14pt; font-family: 仿宋\">研究生卷：<span lang=\"EN-US\"><a href=\"http://www.sojump.com/jq/3469255.aspx\"><font color=\"#0000ff\">http://www.sojump.com/jq/3469255.aspx</font></a> </span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 28.5pt\">\r\n<strong><span style=\"font-size: 14pt; font-family: 仿宋; color: red\">请点击链接填写与自己身份相对应的问卷，每人限填写一次。问卷填写系统将于<span lang=\"EN-US\">2014</span>年<span lang=\"EN-US\">6</span>月<span lang=\"EN-US\">25</span>日零点关闭。</span></strong><span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋; color: red\"></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt; text-indent: 27.55pt\">\r\n<strong><span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">2</span></strong><strong><span style=\"font-size: 14pt; font-family: 仿宋\">、问卷的奖品设置情况如下（每类问卷均设相同奖品）：<span lang=\"EN-US\"></span></span></strong>\r\n</p>\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse: collapse; width: 430.65pt; border: medium none\" width=\"574\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; width: 62.1pt; background-color: transparent; border: windowtext 1pt solid\" valign=\"top\" width=\"83\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span style=\"font-size: 14pt; font-family: 仿宋\">奖项<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: windowtext 1pt solid; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 49.65pt; background-color: transparent\" valign=\"top\" width=\"66\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span style=\"font-size: 14pt; font-family: 仿宋\">数量<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: windowtext 1pt solid; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 318.9pt; background-color: transparent\" valign=\"top\" width=\"425\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span style=\"font-size: 14pt; font-family: 仿宋\">奖品<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 62.1pt; background-color: transparent\" valign=\"top\" width=\"83\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span style=\"font-size: 14pt; font-family: 仿宋\">一等奖<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 49.65pt; background-color: transparent\" valign=\"top\" width=\"66\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">1</span><span style=\"font-size: 14pt; font-family: 仿宋\">个<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 318.9pt; background-color: transparent\" valign=\"top\" width=\"425\">\r\n			<h1 style=\"background: white; margin: 0cm 0cm 0pt; line-height: 26pt\"><span style=\"font-size: 14pt; font-family: 仿宋; font-weight: normal\">苹果（<span lang=\"EN-US\">Apple</span>）<span lang=\"EN-US\"> iPad mini MD531CH/A 7.9</span>英寸平板电脑（<span lang=\"EN-US\">16G WiFi</span>版）</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Arial\',\'sans-serif\'; font-weight: normal; color: #666666\"></span></h1></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 62.1pt; background-color: transparent\" valign=\"top\" width=\"83\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span style=\"font-size: 14pt; font-family: 仿宋\">二等奖<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 49.65pt; background-color: transparent\" valign=\"top\" width=\"66\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">10</span><span style=\"font-size: 14pt; font-family: 仿宋\">个<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 318.9pt; background-color: transparent\" valign=\"top\" width=\"425\">\r\n			<h1 style=\"background: white; margin: 0cm 0cm 0pt; line-height: 26pt\"><span lang=\"EN-US\"><a href=\"http://item.jd.com/1026137.html\" title=\"海量图书下载内容，同时护眼健康？就是kindle！开启阅读新时代！\" target=\"_blank\"><span style=\"font-size: 14pt; font-family: 仿宋; font-weight: normal; color: windowtext; text-decoration: none; text-underline: none\">KindlePaperwhite 6</span><span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋; font-weight: normal; color: windowtext; text-decoration: none; text-underline: none\"><span lang=\"EN-US\">英寸<span lang=\"EN-US\">电子书阅读器（第二代）</span></span></span></a></span><span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋; font-weight: normal\">2G</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Arial\',\'sans-serif\'; font-weight: normal; color: #666666\"></span></h1></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 62.1pt; background-color: transparent\" valign=\"top\" width=\"83\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span style=\"font-size: 14pt; font-family: 仿宋\">三等奖<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 49.65pt; background-color: transparent\" valign=\"top\" width=\"66\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">50</span><span style=\"font-size: 14pt; font-family: 仿宋\">个<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 318.9pt; background-color: transparent\" valign=\"top\" width=\"425\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n			<span style=\"font-size: 14pt; font-family: 仿宋\">闪迪（<span lang=\"EN-US\">SanDisk</span>）酷刃<span lang=\"EN-US\"> (CZ50) 16GB U</span>盘</span><span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\"></span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; line-height: 26pt\">\r\n<span lang=\"EN-US\"><font face=\"Calibri\" size=\"3\">&nbsp;</font></span>\r\n</p>\r\n</td>', '0');
INSERT INTO notice VALUES ('5', '8', '2', '2015-02-02 22:18:57', '关于印发《华东师范大学新教职工住房补贴发放调整办法》的通知', '<td width=\"100%\"><p id=\"ext-gen22\">\r\n各单位：<br>\r\n&nbsp;&nbsp;&nbsp; 《华东师范大学新教职工住房补贴发放调整办法》已经华东师范大学第七届教代会执行委员会于2012年6月19日通过，现予印发，请遵照执行。<br>\r\n&nbsp;&nbsp;&nbsp; 特此通知。<br>\r\n&nbsp;&nbsp;&nbsp; \r\n</p>\r\n<p>\r\n&nbsp;&nbsp;&nbsp; 附件：<a href=\"/eapdomain/static/cmsfiles/pim/File/20120711123334.pdf\">《华东师范大学新教职工住房补贴发放调整办法》</a>\r\n</p>\r\n<p align=\"right\">\r\n&nbsp;&nbsp;&nbsp; 华东师范大学<br>\r\n二零一二年六月二十七日\r\n</p>\r\n</td>', '0');
INSERT INTO notice VALUES ('6', '8', '2', '2015-02-02 22:19:40', '关于学校每月薪酬发放过程中税收问题的说明', '<tr>\r\n              <td width=\"100%\" id=\"ext-gen22\"><p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 150%\">\r\n<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">&nbsp;</span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">近日，学校财务处启用新的网上酬金申报系统，有老师询问有关每月薪酬发放过程中税收的情况，特就有关规定说明如下：</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%\">\r\n<span style=\"font-size: 14pt; font-family: 黑体; color: black; line-height: 150%\" id=\"ext-gen23\">一、学校薪酬发放的时间和内容</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">目前，</span><span style=\"font-size: 12pt; font-family: 宋体; line-height: 150%\">学校薪酬具体包括基本工资、津贴补贴、奖金奖励、社会保障缴费、伙食补助费、绩效工资、咨询费、劳务费、加班费、讲课费等。学校统一发放的基本工资、岗位津贴等由人事处提交数据，财务处负责发放。其他人员费实行学校人事处备案制度，即由有关单位或部门提出申报，经人事处审核备案后，财务处负责直接汇入个人银行账户，以零现金方式支付。</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"></span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">具体发放时间及相关内容如表</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">1</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">所示。</span><span style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> <span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">&nbsp;</span>\r\n</p>\r\n<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24.1pt\">\r\n<strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">表</span></strong><strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">1 </span></strong><strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">学校发放薪酬的内容、时间和制定部门</span></strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n</p>\r\n<div align=\"center\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"border-collapse: collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; width: 139.6pt; background-color: transparent; border: windowtext 1pt solid\" valign=\"top\" width=\"186\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24.1pt\">\r\n			<strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">发放内容</span></strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: windowtext 1pt solid; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 143.25pt; background-color: transparent\" valign=\"top\" width=\"191\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24.1pt\">\r\n			<strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">发放时间</span></strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: windowtext 1pt solid; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 143.25pt; background-color: transparent\" valign=\"top\" width=\"191\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24.1pt\">\r\n			<strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">制定发放的部门</span></strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 139.6pt; background-color: transparent\" valign=\"top\" width=\"186\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">工资</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 143.25pt; background-color: transparent\" valign=\"top\" width=\"191\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">每月</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">6</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">日</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 143.25pt; background-color: transparent\" valign=\"top\" width=\"191\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">人事处</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 139.6pt; background-color: transparent\" valign=\"top\" width=\"186\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">岗位津贴</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 143.25pt; background-color: transparent\" valign=\"top\" width=\"191\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">每月</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">20</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">日</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 143.25pt; background-color: transparent\" valign=\"top\" width=\"191\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">人事处</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 139.6pt; background-color: transparent\" valign=\"top\" width=\"186\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">网上申报的各院系自主发放津贴奖金、科研项目负责人发放劳务费、开放教育学院等单位发放课时费等</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 143.25pt; background-color: transparent\" valign=\"top\" width=\"191\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">人事处审核通过后</span><span lang=\"EN-US\" style=\"font-size: 12pt; color: black; line-height: 150%\"><font face=\"Calibri\">5</font></span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">个工作日内</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 143.25pt; background-color: transparent\" valign=\"top\" width=\"191\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">有关院系、科研项目负责人等</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 黑体; color: black; line-height: 150%\">&nbsp;</span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%\">\r\n<span style=\"font-size: 14pt; font-family: 黑体; color: black; line-height: 150%\">二、薪酬涉及到的税率</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">根据税法及税务部门的规定，学校教职工的工资、岗位津贴和网上申报收入三项加总为当月总收入，根据总收入情况缴纳个人所得税。目前上海规定个人所得税的免征额为</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">3500</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">元，即如果当月总收入（扣除社保等“四金”后）低于</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">3500</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">元，则不用缴纳个人所得税；如果当月总收入（扣除社保等“四金“后）超过</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">3500</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">元，则按照超过</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">3500</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">元的部分，选择规定的税率，计算出应缴纳的个人所得税，并由学校代扣代缴。目前，国家规定的个人所得税税率表中含有</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">7</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">个等级的税率，根据超过</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">3500</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">元的部分选择所在的等级税率，个人所得税税率表如表</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">2</span><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">所示。</span><span style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> <span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">&nbsp;</span>\r\n</p>\r\n<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 21.1pt\">\r\n<strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">表</span></strong><strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">2<span>&nbsp; </span></span></strong><strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">个人所得税税率表（工资、薪金所得适用）</span></strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n</p>\r\n<div align=\"center\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"border-collapse: collapse\">\r\n	<tbody>\r\n		<tr style=\"height: 20.75pt\">\r\n			<td style=\"border-top: black 2.25pt solid; height: 20.75pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: black 1pt solid; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black; letter-spacing: 4.5pt\">级数</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: black 2.25pt solid; height: 20.75pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月应纳税所得额</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: black 2.25pt solid; height: 20.75pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">税率</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: black 2.25pt solid; height: 20.75pt; border-right: black 1pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">速算扣除数<span lang=\"EN-US\">(</span>元<span lang=\"EN-US\">)</span></span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 22.8pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 22.8pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: black 1pt solid; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">1</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 22.8pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: left; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月应纳税额不超过<span lang=\"EN-US\">1500</span>元</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 22.8pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;3%</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 22.8pt; border-right: black 1pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;0</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 24.75pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 24.75pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: black 1pt solid; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">2</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 24.75pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: left; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月应纳税额超过<span lang=\"EN-US\">1500</span>元至<span lang=\"EN-US\">4500</span>元</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 24.75pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;10%</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 24.75pt; border-right: black 1pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;105</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 21.2pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 21.2pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: black 1pt solid; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">3</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 21.2pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: left; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月应纳税额超过<span lang=\"EN-US\">4500</span>元至<span lang=\"EN-US\">9000</span>元</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 21.2pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;20%</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 21.2pt; border-right: black 1pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;555</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 23.15pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 23.15pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: black 1pt solid; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">4</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 23.15pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月应纳税额超过<span lang=\"EN-US\">9000</span>元至<span lang=\"EN-US\">35000</span>元</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 23.15pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;25%</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 23.15pt; border-right: black 1pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;1005</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 22.05pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 22.05pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: black 1pt solid; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">5</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 22.05pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: left; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月应纳税额超过<span lang=\"EN-US\">35000</span>元至<span lang=\"EN-US\">55000</span>元</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 22.05pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;30%</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 22.05pt; border-right: black 1pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;2755</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 21.95pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 21.95pt; border-right: black 2.25pt solid; border-bottom: black 1pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: black 1pt solid; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">6</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 21.95pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: left; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月应纳税额超过<span lang=\"EN-US\">55000</span>元至<span lang=\"EN-US\">80000</span>元</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 21.95pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;35%</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 21.95pt; border-right: black 1pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;5505</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 10.8pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 10.8pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: black 1pt solid; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">7</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 10.8pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p class=\"MsoNormal\" style=\"vertical-align: middle; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月应纳税额超过<span lang=\"EN-US\">80000</span>元</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 10.8pt; border-right: black 2.25pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;45%</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 10.8pt; border-right: black 1pt solid; border-bottom: black 2.25pt solid; padding-bottom: 3.6pt; padding-top: 3.6pt; padding-left: 7.2pt; border-left: #f0f0f0; padding-right: 7.2pt; background-color: transparent\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"vertical-align: middle; text-align: center; margin: 0cm 0cm 0pt; punctuation-wrap: simple\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">&nbsp;13505</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">&nbsp;</span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">如：某教师<span lang=\"EN-US\">4</span>月份的总收入（扣完四金后的工资<span lang=\"EN-US\">+</span>岗位津贴<span lang=\"EN-US\">+</span>网上申报）为<span lang=\"EN-US\">8500</span>元，先扣除免征额<span lang=\"EN-US\">3500</span>元，剩下<span lang=\"EN-US\">5000</span>元在第<span lang=\"EN-US\">3</span>级“<span lang=\"EN-US\">4500</span>元至<span lang=\"EN-US\">9000</span>元”范围内，所以其适用的个人所得税率为第<span lang=\"EN-US\">3</span>级，<span lang=\"EN-US\">4</span>月应缴纳的个人所得税额<span lang=\"EN-US\">=</span>（<span lang=\"EN-US\">8500-3500</span>）<span lang=\"EN-US\">*20%-555=445</span>元。</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">再如：某教师<span lang=\"EN-US\">4</span>月份的总收入（扣完四金后的工资<span lang=\"EN-US\">+</span>岗位津贴<span lang=\"EN-US\">+</span>网上申报）为<span lang=\"EN-US\">6500</span>元，先扣除免征额<span lang=\"EN-US\">3500</span>元，剩下<span lang=\"EN-US\">3000</span>元在第<span lang=\"EN-US\">2</span>级“<span lang=\"EN-US\">1500</span>元至<span lang=\"EN-US\">4500</span>元”范围内，所以其适用的个人所得税率为第<span lang=\"EN-US\">2</span>级，<span lang=\"EN-US\">4</span>月应缴纳的个人所得税额<span lang=\"EN-US\">=</span>（<span lang=\"EN-US\">6500-3500</span>）<span lang=\"EN-US\">*10%-105=195</span>元。</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 黑体; color: black; line-height: 150%\">&nbsp;</span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%\">\r\n<span style=\"font-size: 14pt; font-family: 黑体; color: black; line-height: 150%\">三、新网上申报薪酬税率计算说明</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">根据上述表<span lang=\"EN-US\">2</span>所示，我国采用的是超额累进税制，即超额部分根据<span lang=\"EN-US\">7</span>级规定的范围定位，超额越多，所适用的税率越高。如果超额部分正处于每个等级的分界点上，则可能出现缴纳税额大幅增加的现象。如果超额<span lang=\"EN-US\">4500</span>元，适用的税率为<span lang=\"EN-US\">10%</span>，应缴个人所得税<span lang=\"EN-US\">=4500*10%-105=345</span>元；如果超额<span lang=\"EN-US\">4800</span>元，则适用的税率为<span lang=\"EN-US\">20%</span>，应缴个人所得税<span lang=\"EN-US\">=4800*20%-555=405</span>元。这种情况下，收入仅增加<span lang=\"EN-US\">300</span>元，税额却增加了<span lang=\"EN-US\">60</span>元。</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> </span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">在新酬金申报系统中，财务处将根据申报审批时间确认税收测算时间，因此，在<span lang=\"EN-US\">6</span>日到岗位津贴税收导入之前（一般为<span lang=\"EN-US\">18</span>日）确认的税收将与工资合并计税，在岗位津贴税收导入之后至月底前确认的网上申报将于工资、岗位津贴和之前确认的网上申报一起合并计税。具体分析见表<span lang=\"EN-US\">3</span>、表<span lang=\"EN-US\">4</span>和表<span lang=\"EN-US\">5</span>。<span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 24pt\">\r\n<strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">&nbsp;</span></strong>\r\n</p>\r\n<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 21.1pt\">\r\n<strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">表</span></strong><strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">3<span>&nbsp; </span></span></strong><strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">每月</span></strong><strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">酬金纳税情况的税额举例说明</span></strong><span style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\"> <span lang=\"EN-US\"></span></span>\r\n</p>\r\n<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 21.1pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black; line-height: 150%\">&nbsp;</span>\r\n</p>\r\n<div align=\"center\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"border-collapse: collapse; margin: auto auto auto 4.65pt; width: 360.3pt\" width=\"480\">\r\n	<tbody>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"height: 29.65pt; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; width: 275.45pt; background-color: transparent; border: windowtext 1pt solid\" width=\"367\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">职工</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">A</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">收入</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: windowtext 1pt solid; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">金额（元）</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"></span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(1)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">工资计税收入</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">3000 </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(2)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">岗位津贴计税收入</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">6000 </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(3)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">网上申报前合计计税收入【<span lang=\"EN-US\">(1)+(2)</span>】</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">9000</span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(4)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">网上申报前合计应纳税所得额【<span lang=\"EN-US\">(3)-3500</span>】</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">5500 </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(5)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">适用税率</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">20% </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(6)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">计算应纳税额</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">545</span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(7)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">当月网上申报收入</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">5000 </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(8)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月合计计税收入【<span lang=\"EN-US\">(3)+(7)</span>】</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">14000</span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(9)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月合计应纳税所得额【<span lang=\"EN-US\">(8)-3500</span>】</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">10500</span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(10)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">适用税率</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"> </span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">25% </span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 29.65pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 275.45pt; background-color: transparent\" width=\"367\">\r\n			<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(11)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">全月应纳税额<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 29.65pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 84.85pt; background-color: transparent\" width=\"113\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">1620</span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 21.1pt\">\r\n<strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">&nbsp;</span></strong>\r\n</p>\r\n<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 21.1pt\">\r\n<strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">&nbsp;</span></strong>\r\n</p>\r\n<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 21.1pt\">\r\n<strong><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">&nbsp;</span></strong>\r\n</p>\r\n<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 21.1pt\">\r\n<strong><span style=\"font-size: 12pt; font-family: 宋体; color: black; line-height: 150%\">表<span lang=\"EN-US\">4 </span>职工<span lang=\"EN-US\">A</span>的当月发放的三种发放模式<span lang=\"EN-US\"></span></span></strong>\r\n</p>\r\n<p align=\"right\" class=\"MsoNormal\" style=\"text-align: right; margin: 0cm 0cm 0pt; line-height: 150%; text-indent: 21.1pt\">\r\n<span style=\"font-family: 宋体; color: black; line-height: 150%\"><font size=\"3\">单位：元<span lang=\"EN-US\"></span></font></span>\r\n</p>\r\n<p>\r\n</p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" class=\"MsoNormalTable\" style=\"border-collapse: collapse; margin: auto auto auto -42.5pt; width: 501.1pt; border: medium none\" width=\"668\">\r\n	<tbody>\r\n		<tr style=\"height: 30pt\">\r\n			<td style=\"height: 30pt; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; padding-right: 5.4pt; width: 182.6pt; background-color: transparent; border: windowtext 1pt solid\" width=\"243\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">申报实际</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: windowtext 1pt solid; height: 30pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 106.3pt; background-color: transparent\" width=\"142\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">情况一</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\"></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: windowtext 1pt solid; height: 30pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 99.2pt; background-color: transparent\" width=\"132\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">情况二<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: windowtext 1pt solid; height: 30pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 113pt; background-color: transparent\" width=\"151\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span style=\"font-size: 12pt; font-family: 宋体; color: black\">情况三<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 30pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 30pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 182.6pt; background-color: transparent\" width=\"243\">\r\n			<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(1)6</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">日工资发放<span lang=\"EN-US\"></span></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 30pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 106.3pt; background-color: transparent\" width=\"142\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">3000</span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 30pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 99.2pt; background-color: transparent\" width=\"132\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">3000</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\"></span>\r\n			</p>\r\n			</td>\r\n			<td style=\"border-top: #f0f0f0; height: 30pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: #f0f0f0; padding-right: 5.4pt; width: 113pt; background-color: transparent\" width=\"151\">\r\n			<p align=\"center\" class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: \'Verdana\',\'sans-serif\'; color: black\">3000</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\"></span>\r\n			</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"height: 30pt\">\r\n			<td style=\"border-top: #f0f0f0; height: 30pt; border-right: windowtext 1pt solid; border-bottom: windowtext 1pt solid; padding-bottom: 0cm; padding-top: 0cm; padding-left: 5.4pt; border-left: windowtext 1pt solid; padding-right: 5.4pt; width: 182.6pt; background-color: transparent\" width=\"243\">\r\n			<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt\">\r\n			<span lang=\"EN-US\" style=\"font-size: 12pt; font-family: 宋体; color: black\">(2)</span><span style=\"font-size: 12pt; font-family: 宋体; color: black\">假设<span lang=\"EN-US\">10</span>日申报审批通过</span><span lang=\"EN-US\" style=\"font-size: 12pt; font-', '0');
INSERT INTO notice VALUES ('7', '8', '1', '2015-02-02 22:20:13', 'IE10、IE11浏览器兼容性设置方法', '<td width=\"100%\" id=\"ext-gen22\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n<font size=\"3\"><span style=\"font-family: 宋体\">由于近期各软件厂商推出了浏览器的升级版本，部分升级至</span><span lang=\"EN-US\"><font face=\"Calibri\">IE10、IE11</font></span><span style=\"font-family: 宋体\">浏览器和</span><span lang=\"EN-US\"><font face=\"Calibri\">360</font></span><span style=\"font-family: 宋体\">浏览器</span><span lang=\"EN-US\"><font face=\"Calibri\">6.0</font></span><span style=\"font-family: 宋体\">以上版本的用户访问公共数据库系统时，出现了页面内容显示异常的问题。</span><span lang=\"EN-US\"></span></font> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n<font size=\"3\"><span style=\"font-family: 宋体\">为了帮助广大师生更好的解决此类问题，信息办编写了关于</span><span lang=\"EN-US\"><font face=\"Calibri\">IE10</font></span><span style=\"font-family: 宋体\">和</span><span lang=\"EN-US\"><font face=\"Calibri\">IE11</font></span><span style=\"font-family: 宋体\" id=\"ext-gen23\">浏览器的兼容性设置指南手册，请有需要的师生下载附件。如仍有疑问，请致电：</span><span lang=\"EN-US\"><font face=\"Calibri\">62233080</font></span><span style=\"font-family: 宋体\">。</span></font> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n&nbsp;\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n<font size=\"3\"><span style=\"font-family: 宋体\"></span><span lang=\"EN-US\"></span></font>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n<font size=\"3\"><span lang=\"EN-US\"><font face=\"Calibri\"><span>&nbsp;<a href=\"/eapdomain/static/cmsfiles/pim/File/20131122105911.pdf\"><strong><font size=\"2\"><font face=\"arial,helvetica,sans-serif\">IE10、360浏览器兼容性设置手册<font size=\"+0\">.pdf</font></font></font></strong></a></span></font></span><font face=\"arial,helvetica,sans-serif\"> </font></font>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n<font face=\"Arial\" size=\"3\"></font>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n&nbsp;<a href=\"/eapdomain/static/cmsfiles/pim/File/20131122105935.pdf\"><strong><font face=\"arial,helvetica,sans-serif\" size=\"2\">IE11浏览器兼容性设置手册.pdf</font></strong></a> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n<span lang=\"EN-US\"><font face=\"Calibri\"><font size=\"3\"><span></span></font></font></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n<font size=\"3\"><span lang=\"EN-US\"><span><font face=\"Calibri\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span></span></font> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n<font size=\"3\"><span lang=\"EN-US\"><span><font face=\"Calibri\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>&nbsp;</span></span><span style=\"font-family: 宋体\">信息化办公室</span><span lang=\"EN-US\"></span></font> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 21pt\">\r\n<font size=\"3\"><span lang=\"EN-US\"><font face=\"Calibri\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>2013</font></span><span style=\"font-family: 宋体\">年</span><span lang=\"EN-US\"><font face=\"Calibri\">11</font></span><span style=\"font-family: 宋体\">月</span><span lang=\"EN-US\"><font face=\"Calibri\">22</font></span><span style=\"font-family: 宋体\">日</span></font><span lang=\"EN-US\"></span> \r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n</td>', '0');
INSERT INTO notice VALUES ('8', '8', '1', '2015-02-02 22:21:24', '华东师范大学学校办公室校内招聘启事', '<tr>\r\n              <td width=\"100%\" id=\"ext-gen21\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\">因工作需要，学校办公室拟招聘文秘岗位人员一名，要求如下：</span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\"><span lang=\"EN-US\"></span></span>&nbsp;\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\"><strong>一、岗位职责<span lang=\"EN-US\"></span></strong></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">1. </span><span style=\"font-size: 14pt; font-family: 仿宋\">综合行政。<span lang=\"EN-US\"></span></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">2. </span><span style=\"font-size: 14pt; font-family: 仿宋\">文稿起草。<span lang=\"EN-US\"></span></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n&nbsp;\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\"><strong>二、任职要求<span lang=\"EN-US\"></span></strong></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">1.</span><span style=\"font-size: 14pt; font-family: 仿宋\" id=\"ext-gen22\">硕士及以上学历；<span lang=\"EN-US\"></span></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">2.</span><span style=\"font-size: 14pt; font-family: 仿宋\">年龄<span lang=\"EN-US\">35</span>周岁以下；<span lang=\"EN-US\"></span></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">3.</span><span style=\"font-size: 14pt; font-family: 仿宋\">具有较高的思想政治和职业道德素质，爱岗敬业，勤奋踏实，身体健康；<span lang=\"EN-US\"></span></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">4.</span><span style=\"font-size: 14pt; font-family: 仿宋\">具有较强的责任心、事业心、团结协作精神和服务意识；<span lang=\"EN-US\"></span></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">5.</span><span style=\"font-size: 14pt; font-family: 仿宋\">具有较好的沟通协调能力、计算机应用能力、公文写作和语言表达能力。<span lang=\"EN-US\"></span></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n&nbsp;\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\"><strong>三、应聘方式<span lang=\"EN-US\"></span></strong></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">1.</span><span style=\"font-size: 14pt; font-family: 仿宋\">有意者请将简历发至邮箱<span lang=\"EN-US\">uoffice@admin.ecnu.edu.cn</span>，简历投递邮件标题请按“姓名<span lang=\"EN-US\">+</span>工号”格式；截止招聘时间为<span lang=\"EN-US\">2014</span>年<span lang=\"EN-US\">4</span>月<span lang=\"EN-US\">13</span>日。<span lang=\"EN-US\"></span></span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">2.</span><span style=\"font-size: 14pt; font-family: 仿宋\">学校办将对应聘材料进行初审，对于初审合格者另行通知面试时间，不合格者不再另行通知，应聘材料恕不退还。</span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0pt; text-indent: 28pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\"><span lang=\"EN-US\"></span></span>&nbsp;\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; text-indent: 322pt\">\r\n<span style=\"font-size: 14pt; font-family: 仿宋\">学校办公室<span lang=\"EN-US\"></span></span> \r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\" style=\"text-align: left; margin: 0cm 0cm 0pt; text-indent: 336pt\">\r\n<span lang=\"EN-US\" style=\"font-size: 14pt; font-family: 仿宋\">4</span><span style=\"font-size: 14pt; font-family: 仿宋\">月<span lang=\"EN-US\">2</span>日<span lang=\"EN-US\"></span></span> \r\n</p>\r\n</td>\r\n            </tr>', '0');
INSERT INTO notice VALUES ('9', '8', '1', '2015-02-02 22:21:49', 'iphone与ipad上校园邮箱设置手册下载', '<td width=\"100%\" id=\"ext-gen21\"><p style=\"text-indent: 24pt\">\r\n<font size=\"3\"><span><font face=\"宋体\" id=\"ext-gen22\">随着移动终端的日益发展和智能化，越来越多的师生开始使用手机、平板电脑等移动设备开展移动办公和移动学习，其中使用</font></span><span lang=\"EN-US\" style=\"font-family: Verdana\">iphone</span><span><font face=\"宋体\">手机的用户数量众多。鉴于近期多位老师来信息办咨询</font></span><span lang=\"EN-US\" style=\"font-family: Verdana\">iphone</span><span><font face=\"宋体\">手机上邮箱设置的问题，信息办编制了一个</font></span><span lang=\"EN-US\" style=\"font-family: Verdana\">iphone</span><span><font face=\"宋体\">上的（</font></span><span lang=\"EN-US\" style=\"font-family: Verdana\">IPAD</span><span><font face=\"宋体\">也可通用）邮箱配置手册，请有需要的师生下载附件；如仍有疑问，欢迎致电信息办：</font></span><span lang=\"EN-US\" style=\"font-family: Verdana\">62233081,54343081</span><font face=\"宋体\"><span>。</span></font></font> \r\n</p>\r\n<p style=\"text-indent: 24pt\">\r\n<font size=\"3\"><font face=\"宋体\"><span><font face=\"Verdana\"><a href=\"/eapdomain/static/cmsfiles/pim/File/20120518083355.doc\">iphone上校园邮箱设置手册</a></font></span><span lang=\"EN-US\" style=\"font-family: Verdana\"></span></font></font> \r\n</p>\r\n<p align=\"right\" style=\"text-indent: 24pt; text-align: right\">\r\n<font size=\"3\"><font face=\"宋体\"><span>信息化办公室</span><span lang=\"EN-US\" style=\"font-family: Verdana\"></span></font></font> \r\n</p>\r\n<p align=\"right\" style=\"text-indent: 24pt; text-align: right\">\r\n<span><font face=\"宋体\" size=\"3\">二零一二年三月五日</font></span> \r\n</p>\r\n</td>', '0');
INSERT INTO notice VALUES ('10', '8', '1', '2015-02-02 22:22:36', '1月23日 陈军：全球30米地表覆盖信息服务系统GlobeLand30的研究进展与发展方向', '<div class=\"entry\">\r\n                        <div class=\"lecture-meta\">\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座题目：</strong><span class=\"lecture-item-value\">全球30米地表覆盖信息服务系统GlobeLand30的研究进展与发展方向</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主讲人：</strong><span class=\"lecture-item-value\">陈军</span></a>\r\n                                <a class=\"lecture-item-info\"><span class=\"lecture-item-value\">国家基础地理信息中心总工程师</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>开始时间：</strong><span class=\"lecture-item-value\">2015-01-23 14:00</span></a>\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座地址：</strong><span class=\"lecture-item-value\">地球科学学部 河口海岸学国家重点实验室</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                \r\n                            </div>\r\n                        </div>\r\n			            <div class=\"read\"><p><strong>讲座简介：<a name=\"_GoBack\"></a></strong></p><p><span> &nbsp;  GlobeLand30</span>是我国科学家研制出的世界首套<span>30</span>米分辨率全球地表覆盖数据集。<span>2014</span>年<span>9</span>月<span>22</span>日，由国务院副总理张高丽亲自将我国自主研发的这一高科技成果赠送给联合国，已有近<span>80</span>个国家的上千用户共享使用。这被国际同行誉为全球对地观测和地理空间数据共享领域的一个里程碑成就，在国内外产生了很大的影响。数据成果及介绍请见网站<span>www.globeland30.org</span>。本报告拟介绍<span>GlobeLand30</span>的研究进展与发展方向。</p><p><strong>报告人介绍：</strong></p><p>　　陈军教授是国家杰出青年科学基金获得者、国家级有突出贡献的中青年专家、国家测绘地理信息局首批科技领军人才。他主要从事国家基础地理信息资源建设服务的科学研究与工程实践，主持完成了包括<span>3</span>项国家自然科学基金重点项目在内的<span>20</span>余项国家科技与测绘工程项目，在数字地表模型的多维动态构模、全国<span>1</span>：<span>5</span>万数据库建库与更新、全球地表覆盖遥感制图等方面取得了国内外有影响的研究成果。作为第一完成人，获得国家自然科学二等奖和国家科技进步奖各<span>1</span>项、省部级科技进步特等奖和一等奖<span>6</span>项；在国内外学术刊物上发表了<span>180</span>余篇学术论文；自<span>1993</span>年被国务院批准为博士生导师以来，指导了<span>60</span>余名博士研究生。</p><p>　　他现任国家基础地理信息中心总工程师，是国务院学位委员会第六届学科评议组（测绘科学与技术）共同召集人。<span>2012</span>年起担任国际摄影测量与遥感学会主席，是迄今为止在国际四大测绘学术组织（<span>ISPRS</span>、<span>ICA</span>、<span>FIG</span>、<span>IAG</span>）担任主席的首位华人专家，在国内外本领域均有较高知名度与影响。</p><p><br></p></div>\r\n			        </div>', '0');
INSERT INTO notice VALUES ('11', '8', '1', '2015-02-02 22:23:35', '1月15日 张再林：意识哲学还是身体哲学(2015年百场校级学术讲座第5场)', '<div class=\"entry\">\r\n                        <div class=\"lecture-meta\">\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座题目：</strong><span class=\"lecture-item-value\">意识哲学还是身体哲学</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主讲人：</strong><span class=\"lecture-item-value\">张再林</span></a>\r\n                                <a class=\"lecture-item-info\"><span class=\"lecture-item-value\">西安交通大学人文学院教授</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>开始时间：</strong><span class=\"lecture-item-value\">2015-01-15 13:30</span></a>\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座地址：</strong><span class=\"lecture-item-value\">闵行校区人文楼2102室</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                \r\n                            </div>\r\n                        </div>\r\n			            <div class=\"read\"><p><strong>主讲人简介：</strong></p><p> &nbsp; &nbsp;张再林，西安交通大学教授，西北大学特聘教授，博士生导师，北京大学高等人文研究院兼职研究员，“中国哲学的身体维度”倡导者和组织者，现任西安交通大学文化哲学研究所执行所长。中国社会科学院《世界哲学》杂志编委，全国现代外国哲学学会理事，中国现象学专业委员会学术委员，《德意志思想评论》杂志编委，现为美国罗耀拉大学兼职教授，台湾大学人文社科高等研究院客座研究员。主要研究方向为西方哲学、中国哲学、中西哲学比较。出版《作为“身体哲学”的中国古代哲学》、《中西哲学的歧异与会通》、《我与你和我与它——中西社会本体论比较研究》、《中西哲学比较论》等学术专著<span>9</span>部，发表学术论文百余篇。</p><p><strong>内容简介：</strong></p><p> &nbsp; &nbsp;立足于当代哲学范式的根本性转变，即是当代哲学从“思辨世界”向“生活世界”、从“意识哲学”向“身体哲学”的转变。论者从身体出发而非从意识出发，重新诠释中西哲学。这种“身体哲学”不仅是对中国哲学本来面目的真实还原，同时还使其以一种“准后现代”的气质与特性，与西方后现代主义的后意识范式的哲学殊途同归，并从中体现出一种具有前瞻性与现实批判眼光的人类新的时代精神。</p><p><br></p></div>\r\n			        </div>', '0');
INSERT INTO notice VALUES ('12', '8', '1', '2015-02-02 22:23:58', '1月14日 张再林：“我有一个身体”与“我是身体”——中西身体观之比较（思勉人文讲座236场）', '<div class=\"entry\">\r\n                        <div class=\"lecture-meta\">\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座题目：</strong><span class=\"lecture-item-value\">“我有一个身体”与“我是身体”——中西身体观之比较（“I Have a Body” and “I am the Body”: the Comparison of Chinese and Western View of Body）</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主讲人：</strong><span class=\"lecture-item-value\">张再林</span></a>\r\n                                <a class=\"lecture-item-info\"><span class=\"lecture-item-value\">西安交通大学哲学系教授，文化哲学研究所执行所长</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主持人：</strong><span class=\"lecture-item-value\">郁振华（华东师范大学思勉人文高等研究院研究员，哲学系教授兼系主任）</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>开始时间：</strong><span class=\"lecture-item-value\">2015-01-14  13:30</span></a>\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座地址：</strong><span class=\"lecture-item-value\">闵行校区人文楼5303学术报告厅</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主办单位：</strong><span class=\"lecture-item-value\">华东师范大学思勉人文高等研究院</span></a>\r\n                            </div>\r\n                        </div>\r\n			            <div class=\"read\"><p style=\"line-height:150%\"><strong><span style=\"line-height:150%;font-family:宋体\">报告人简介：</span></strong></p><p style=\"line-height:150%;text-indent:28px\"><span style=\"line-height:150%;font-family:宋体\">张再林，西安交通大学教授，西北大学特聘教授，博士生导师，北京大学高等人文研究院兼职研究员，“中国哲学的身体维度”倡导者和组织者，现任西安交通大学文化哲学研究所执行所长。中国社会科学院《世界哲学》杂志编委，全国现代外国哲学学会理事，中国现象学专业委员会学术委员，《德意志思想评论》杂志编委，现为美国罗耀拉大学兼职教授，台湾大学人文社科高等研究院客座研究员。主要研究方向为西方哲学、中国哲学、中西哲学比较。出版《作为“身体哲学”的中国古代哲学》、《中西哲学的歧异与会通》、《我与你和我与它——中西社会本体论比较研究》、《中西哲学比较论》等学术专著<span>9</span>部，发表学术论文百余篇。</span></p><p style=\"line-height:150%\"><strong><span style=\"line-height:150%;font-family:宋体\">报告内容简介：</span></strong></p><p style=\"line-height:150%;text-indent:28px\"><span style=\"line-height:150%;font-family:宋体\">立足于当代哲学范式的根本性转变，即是当代哲学从“思辨世界”向“生活世界”、从“意识哲学”向“身体哲学”的转变。论者用“我有一个身体”和“我是身体”来区分西方的身体观和中国哲学的本体论的身体观。较之西方的意识哲学，中国传统哲学自身特有的属性是中国哲学之根深蒂固的“身体性”。这种“身体性”表现为中国古人一切哲学意味的思考无不与身体有关，无不围绕着身体来进行，也正是从身体出发而非从意识出发，中国古人才为自己构建了一种自成一体，并有别于西方意识哲学的不无自觉的哲学理论系统。</span></p><p><br></p></div>\r\n			        </div>', '0');
INSERT INTO notice VALUES ('13', '8', '1', '2015-02-02 22:24:29', '1月14日 Yves Robert：Scheduling algorithms for heterogeneous and failure-prone platforms（可信计算论坛）', '<div class=\"entry\">\r\n                        <div class=\"lecture-meta\">\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座题目：</strong><span class=\"lecture-item-value\">Scheduling algorithms for heterogeneous and failure-prone platforms</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主讲人：</strong><span class=\"lecture-item-value\">Yves Robert</span></a>\r\n                                <a class=\"lecture-item-info\"><span class=\"lecture-item-value\">教授</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主持人：</strong><span class=\"lecture-item-value\">王长波 教授</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>开始时间：</strong><span class=\"lecture-item-value\">2015-01-14   14:00</span></a>\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座地址：</strong><span class=\"lecture-item-value\">中北校区数学馆201</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主办单位：</strong><span class=\"lecture-item-value\">软件学院  科技处</span></a>\r\n                            </div>\r\n                        </div>\r\n			            <div class=\"read\"><p style=\"text-align:justify\"><strong><span style=\"font-family:宋体\">报告人简介：</span></strong><strong></strong></p><p style=\"text-align:justify\"><span style=\"font-family:\'times new roman\', \'serif\'\">Yves Robert received the PhD degree from Institut National Polytechnique de Grenoble. He is currently a full professor in the Computer Science Laboratory LIP at ENS Lyon. He is the author of 7 books, 130 papers published in international journals, and 195 papers published in international conferences. He is the editor of 11 book proceedings and 13 journal special issues. He is the advisor of 26 PhD theses.</span></p><p style=\"text-align:justify\"><span style=\"font-family:\'times new roman\', \'serif\'\">His main research interests are scheduling techniques and resilient algorithms for large-scale platforms. Yves Robert served on many editorial boards, including IEEE TPDS. He was the program chair of HiPC\' 2006 in Bangalore, IPDPS\'2008 in Miami, ISPDC\'2009 in Lisbon, ICPP\'2013 in Lyon and HiPC\'2013 in Bangalore. He is a Fellow of the IEEE. He has been elected a Senior Member of Institut Universitaire de France in 2007 and renewed in 2012. He has been awarded the 2014 IEEE TCSC Award for Excellence in Scalable Computing. He holds a Visiting Scientist position at the University of Tennessee Knoxville since 2011.</span></p><p style=\"text-align:justify\"><strong><span style=\"font-family:宋体\">报告内容摘要：</span></strong><strong></strong></p><p style=\"text-align:justify\"><span style=\"font-family:\'times new roman\', \'serif\'\">This seminar will review classical results for task graph scheduling</span><span style=\"font-family:宋体\">，</span><span style=\"font-family:\'times new roman\', \'serif\'\">where the objective is to minimize execution time. Then we deal with a series of problem examples</span><span style=\"font-family:宋体\">，</span><span style=\"font-family:\'times new roman\', \'serif\'\">and use them to illustrate algorithms that aim at throughput optimization, resource selection, power management and multi-criteria optimization. There will be more examples than theorems in the lecture!</span></p><p><br></p></div>\r\n			        </div>', '0');
INSERT INTO notice VALUES ('14', '8', '1', '2015-02-02 22:25:01', '1月13日 唐本忠：创新研究三部曲（清松化学学术系列讲座）', '<div class=\"entry\">\r\n                        <div class=\"lecture-meta\">\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座题目：</strong><span class=\"lecture-item-value\">创新研究三部曲</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主讲人：</strong><span class=\"lecture-item-value\">唐本忠院士</span></a>\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主持人：</strong><span class=\"lecture-item-value\">何鸣元 院士</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>开始时间：</strong><span class=\"lecture-item-value\">2015-01-13 9:30</span></a>\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座地址：</strong><span class=\"lecture-item-value\">中北校区理科大楼A504报告厅</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主办单位：</strong><span class=\"lecture-item-value\">化学系和科技处</span></a>\r\n                            </div>\r\n                        </div>\r\n			            <div class=\"read\"><p style=\"text-align:justify\"><strong><span style=\"font-family:宋体\">报告人简介：</span></strong></p><p style=\"text-align:justify\"><span style=\"font-family:\'times new roman\', \'serif\'\">Ben Zhong Tang received BS and PhD degrees from South China University of Technology and Kyoto University, respectively. He conducted postdoctoral research at University of Toronto. He joined Department of Chemistry at the Hong Kong University of Science &amp; Technology as an assistant professor in 1994 and was promoted to chair professor in 2008. He was elected to the Chinese Academy of Sciences in 2009.</span></p><p style=\"text-align:justify\"><span style=\"font-family:\'times new roman\', \'serif\'\">He has published &gt;650 papers. His work has been cited over 20,000 times, with an h-index of 82. He is listed by Thomas Reuters as a Highly Cited Researcher in the categories of Chemistry and Materials Science. He has opened a new area of research on aggregation-induced emission, which was ranked as one of the Top 100 Research Fronts by Thomas Reuters in 2013. He received a State Natural Science Award from Chinese Government in 2007. He is serving as Editor of Advances in Polymer Science (Springer) and Associate Editor of Polymer Chemistry (RSC).</span></p><p><strong><span style=\"font-family:宋体\">报告简介：</span></strong></p><p><span style=\"font-family:\'times new roman\', \'serif\'\">He has published &gt;650 papers. His work has been cited over 20,000 times, with an h-index of 82. He is listed by Thomas Reuters as a Highly Cited Researcher in the categories of Chemistry and Materials Science. He has opened a new area of research on aggregation-induced emission, which was ranked as one of the Top 100 Research Fronts by Thomas Reuters in 2013. He received a State Natural Science Award from Chinese Government in 2007. He is serving as Editor of Advances in Polymer Science (Springer) and Associate Editor of Polymer Chemistry (RSC).</span></p><p><br></p></div>\r\n			        </div>', '0');
INSERT INTO notice VALUES ('15', '8', '1', '2015-02-02 22:25:23', '1月13日 Michael Merzenich：Brain Plasticity-Based Medicine（生命科学学术系列报告）', '<div class=\"entry\">\r\n                        <div class=\"lecture-meta\">\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座题目：</strong><span class=\"lecture-item-value\">Brain Plasticity-Based Medicine</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主讲人：</strong><span class=\"lecture-item-value\">Michael Merzenich 院士</span></a>\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>开始时间：</strong><span class=\"lecture-item-value\">2015-01-13 10:30</span></a>\r\n                                \r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>讲座地址：</strong><span class=\"lecture-item-value\">中山北路校区理科大楼A510 报告厅</span></a>\r\n                            </div>\r\n                            <div class=\"lecture-item clearfix\">\r\n                                <a class=\"lecture-item-info\"><strong>主办单位：</strong><span class=\"lecture-item-value\">脑功能基因组学教育部重点实验室/上海市脑功能基因组学重点实验室 华东师范大学-纽约大学脑与认知科学联合研究中心和科技处</span></a>\r\n                            </div>\r\n                        </div>\r\n			            <div class=\"read\"><p><strong>报告人简介：</strong><span>Dr. Michael Merzenich</span>是美国科学院院士及医学院院士；<span>Posit Science</span>创建者及现任<span>CEO</span>和<span>Brain Plasticity Institute</span>创建者及现任主任；原加州大学旧金山分校医学院<span>Francis A. Sooy</span>教授。<span>Dr. Merzenich</span>的研究领域集中在脑感觉、认知及可塑性机制。已在科学、自然、美国科学院院报等发表研究论文近<span>200</span>篇并有近<span>100</span>项的授权专利。是该领域至今仍非常活跃的著名学者。</p><p><strong>报告简介：</strong><span>Dr. Merzenich will summarize how the neuroscience of brain plasticity is changing the therapeutic landscape for professional communities addressing brain-based disorders and disease. After considering the neurological bases of training-driven neuroplasticity, he shall describe how this neuroscience-guided perspective distinguishes this new approach from (a) the more-behavioral, traditional clinical strategies of professional therapy practitioners, and (b) an even more widely applied pharmaceutical treatment model for neurological and psychiatric treatment domains. With that background, he proposes that neuroplasticity-based treatments will be an important part of future best-treatment practices in neurological and psychiatric medicine.</span></p><p><br></p></div>\r\n			        </div>', '0');
INSERT INTO notice VALUES ('16', '8', '3', '2015-02-02 22:26:35', '关于中山北路校区部分区域停电通知', '<div class=\"entry\">\r\n			            <div class=\"read\"><p class=\"wp_editor_art_paste_p\">各有关单位：\r\n</p><p class=\"p_text_indent_2 wp_editor_art_paste_p\">接市北供电公司停电通知，因线路检修，兹定于2015年2月4日(星期三)上午8:00时至2015年2月4日(星期三)下午15:00时止，中山北路校区部分区域停电。\r\n</p><p class=\"p_text_indent_2 wp_editor_art_paste_p\">停电范围：10KV(师5)线路。\r\n</p><p class=\"p_text_indent_2 wp_editor_art_paste_p\">停电楼宇(单位)：文科楼、文附楼、网络学院、出版社、小教楼(MBA)、公共管理学院、教育信息系、办公楼、保卫处、河东食堂、核磁共振实验室、逸夫楼图书馆照明、老图书馆二、三楼认知实验室、原物理楼(含纳米实验室)，计算机楼、修建中心、电镜中心、校工会、老干部活动室、光谱实验室、脑科学实验室、野生动物监测站、数学楼(现软件学院)、老年大学、校园环境中心、一村部分平房、一村部分商业用房、十七舍、十八舍、研究生食堂、自然地理馆(五、六楼)、国际交流中心、留研小区浴室、留研小区泵房、国际教育处、三馆(部分照明)、中学校长培训中心(逸夫楼)两台变压器停用一台。\r\n</p><p class=\"p_text_indent_2 wp_editor_art_paste_p\">另外，由于丽娃水泵房电路切换，会造成第十五、十六、十七、十八宿舍、国际教育中心间隙停水。\r\n</p><p class=\"p_text_indent_2 wp_editor_art_paste_p\">敬请上述楼宇、单位做好停电、停水期间的各项工作。\r\n</p><p class=\"p_text_indent_2 wp_editor_art_paste_p\">特此通知。\r\n</p><p style=\"text-align:right\" class=\"p_text_indent_2 wp_editor_art_paste_p\">后勤保障部\r\n</p><p style=\"text-align:right\" class=\"p_text_indent_2 wp_editor_art_paste_p\">2015年1月28日\r\n</p></div>\r\n			        </div>', '0');
INSERT INTO notice VALUES ('17', '8', '1', '2015-02-02 22:34:39', '超算中心停机通知', '<div class=\"entry\">\r\n			            <div class=\"read\"><p style=\"orphans:2;widows:2;margin-top:0.07in;margin-bottom:0.07in;\"><span style=\"font-family:宋体;font-size:16px;\">各位用户</span><span style=\"font-family:宋体, serif;font-size:16px;\">:</span></p><p style=\"line-height:150%;orphans:2;widows:2;margin-top:0.07in;margin-bottom:0.07in;\"><span style=\"font-family:宋体;font-size:16px;\"> &nbsp;  &nbsp; 因校超算平台存储管理软件版本升级，本平台将于</span><span style=\"font-family:宋体, serif;font-size:16px;\">2015</span><span style=\"font-family:宋体;font-size:16px;\">年</span><span style=\"font-family:宋体, serif;font-size:16px;\">2</span><span style=\"font-family:宋体;font-size:16px;\">月</span><span style=\"font-family:宋体, serif;font-size:16px;\">2</span><span style=\"font-family:宋体;font-size:16px;\">日至</span><span style=\"font-family:宋体, serif;font-size:16px;\">2015</span><span style=\"font-family:宋体;font-size:16px;\">年</span><span style=\"font-family:宋体, serif;font-size:16px;\">2</span><span style=\"font-family:宋体;font-size:16px;\">月</span><span style=\"font-family:宋体, serif;font-size:16px;\">3</span><span style=\"font-family:宋体;font-size:16px;\">日停机维护。请大家事先做好数据保全工作。因此给大家带来的不便还请谅解。</span></p><p style=\"text-align:right;line-height:150%;orphans:2;widows:2;margin-top:0.07in;margin-bottom:0.07in;\"> &nbsp;</p><p style=\"text-align:right;line-height:150%;orphans:2;widows:2;margin-top:0.07in;margin-bottom:0.07in;\"> &nbsp;</p><p style=\"text-align:right;line-height:150%;orphans:2;widows:2;margin-top:0.07in;margin-bottom:0.07in;\"><span style=\"font-family:宋体;font-size:16px;\">超算中心</span></p><p style=\"text-align:right;line-height:150%;orphans:2;widows:2;margin-top:0.07in;margin-bottom:0.07in;\"><span style=\"font-family:宋体, serif;font-size:16px;\">2015</span><span style=\"font-family:宋体;font-size:16px;\">年</span><span style=\"font-family:宋体, serif;font-size:16px;\">1</span><span style=\"font-family:宋体;font-size:16px;\">月</span><span style=\"font-family:宋体, serif;font-size:16px;\">26</span><span style=\"font-family:宋体;font-size:16px;\">日</span></p></div>\r\n			        </div>', '0');
INSERT INTO notice VALUES ('18', '8', '1', '2015-02-03 15:10:37', '2014年拟录取在职人员通知书寄发地址核对的通知', '<div id=\"mainBody\">\r\n	   <p class=\"MsoNormal emtidy-6\"><span class=\"emtidy-5\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;我校在职人员攻读硕士学位研究生拟录取名单已陆续确定，公示名单网页:<a href=\"http://zsxx.yjsy.ecnu.edu.cn/system/zzlqyx_list.asp\">http://zsxx.yjsy.ecnu.edu.cn/system/zzlqyx_list.asp</a>。</span></p>\r\n<p class=\"MsoNormal emtidy-6\"><span class=\"emtidy-5\">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 考生可以登录系统查询自己的复试拟录取情况，并在系统中的“在职人员攻读硕士学位研究生通讯地址维护（寄发录取通知书用）”栏目中维护自己的通讯信息（无论是否有变，均请点击保存）。请在1月21日（下周三）前完成。</span></p>\r\n<p class=\"MsoNormal emtidy-6\"><span class=\"emtidy-5\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 登陆系统方法如下：</span></p>\r\n<p class=\"MsoNormal emtidy-6\"><span class=\"emtidy-5\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 访问网址：</span><span class=\"emtidy-7\" lang=\"EN-US\" xml:lang=\"EN-US\"><a href=\"http://zsxx.yjsy.ecnu.edu.cn\">http://zsxx.yjsy.ecnu.edu.cn</a></span></p>\r\n<p class=\"MsoNormal emtidy-6\"><span class=\"emtidy-5\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 登录用户名：报名编号，即</span><span class=\"emtidy-7\" lang=\"EN-US\" xml:lang=\"EN-US\">14</span><span class=\"emtidy-5\">开头的</span><span class=\"emtidy-7\" lang=\"EN-US\" xml:lang=\"EN-US\">12</span><span class=\"emtidy-5\">位数字</span></p>\r\n<p class=\"MsoNormal emtidy-6\"><span class=\"emtidy-5\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码：</span><span class=\"emtidy-7\" lang=\"EN-US\" xml:lang=\"EN-US\">8</span><span class=\"emtidy-5\">位出生日期（格式</span><span class=\"emtidy-7\" lang=\"EN-US\" xml:lang=\"EN-US\">YYYYMMDD</span><span class=\"emtidy-5\">），登录后可以修改密码。</span></p>\r\n<p class=\"MsoNormal emtidy-4\"><span class=\"emtidy-5\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 调剂至我校的工程硕士、公共管理硕士也请登陆系统完成学历认证报告上传和通讯信息维护。进入复试的考生必须提交学历认证报告，请尽快登陆学信网进行学历认证，具体操作可参照</span><span class=\"emtidy-7\" lang=\"EN-US\" xml:lang=\"EN-US\"><a href=\"http://www.chsi.com.cn/xlcx/rhsq.jsp\">http://www.chsi.com.cn/xlcx/rhsq.jsp</a></span><span class=\"emtidy-5\">说明进行。</span></p>\r\n<p class=\"MsoNormal emtidy-11\"><span class=\"emtidy-3\" lang=\"EN-US\" xml:lang=\"EN-US\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class=\"emtidy-5\">录取通知书拟春节前做挂号信方式寄出，请注意查收。</span></p>\r\n<p class=\"MsoNormal emtidy-11\"><span class=\"emtidy-3\" lang=\"EN-US\" xml:lang=\"EN-US\">&nbsp;</span></p>\r\n<p class=\"MsoNormal emtidy-12\" style=\"text-align: right;\"><span class=\"emtidy-5\">研究生招生办公室</span></p>\r\n<p class=\"MsoNormal emtidy-13\" style=\"text-align: right;\"><span class=\"emtidy-3\" lang=\"EN-US\" xml:lang=\"EN-US\">2015.1.16</span></p>\r\n	</div>', '0');

-- ----------------------------
-- Table structure for `notice_category`
-- ----------------------------
DROP TABLE IF EXISTS `notice_category`;
CREATE TABLE `notice_category` (
  `notice_category_id` int(255) NOT NULL auto_increment,
  `notice_category_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`notice_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_category
-- ----------------------------
INSERT INTO notice_category VALUES ('1', '学术讲座');
INSERT INTO notice_category VALUES ('2', '学生活动');
INSERT INTO notice_category VALUES ('3', '项目竞赛');

-- ----------------------------
-- Table structure for `notice_status`
-- ----------------------------
DROP TABLE IF EXISTS `notice_status`;
CREATE TABLE `notice_status` (
  `notice_status_id` int(11) NOT NULL auto_increment,
  `notice_status_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`notice_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_status
-- ----------------------------
INSERT INTO notice_status VALUES ('1', '草稿');
INSERT INTO notice_status VALUES ('2', '已删除');
INSERT INTO notice_status VALUES ('3', '已发布');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` int(255) NOT NULL auto_increment,
  `project_category_id` int(255) NOT NULL,
  `project_status` int(11) NOT NULL,
  `project_createtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `project_creator_id` int(255) NOT NULL,
  `project_name` varchar(50) default '',
  `project_start` timestamp NULL default '0000-00-00 00:00:00',
  `project_end` timestamp NULL default '0000-00-00 00:00:00',
  `project_researchobject` int(11) default NULL COMMENT '项目性质',
  `project_source` int(255) default NULL COMMENT '选题来源',
  `project_subject` varchar(255) default '' COMMENT '学科类别',
  `project_aid` varchar(255) default '' COMMENT '受资助情况',
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
  `project_summary` varchar(255) default '' COMMENT '项目概述，用于对外展示',
  `project_signup_max` int(255) default '0' COMMENT '项目报名人数上限',
  `project_grouptype` varchar(255) default '' COMMENT '项目组类型',
  `project_funding` int(11) NOT NULL COMMENT '表名该项目是众筹项目还是非众筹，只有自创项目才有，1表示众筹，2表示非众筹，学校项目为空值',
  PRIMARY KEY  (`project_id`),
  KEY `project_creator_id` (`project_creator_id`),
  KEY `project_category_id` (`project_category_id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO project VALUES ('1', '2', '3', '2015-04-20 00:59:15', '7', '智能机器人', '2014-12-12 00:00:00', '2015-02-16 00:00:00', '1', '2', '软件工程', '未受资助', '很多事情可以通过机器人来做，解放人工。', '会说话的机器人', '会说话', '需求文档v0.1', '软件开发', '8000', '机器人所需材料', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '致力于智能机器人的研发', '2', '本科生', '0');
INSERT INTO project VALUES ('2', '2', '3', '2015-04-20 00:59:17', '8', '在线多人聊天系统', '2015-02-09 00:00:00', '2015-02-23 00:00:00', '2', '2', '嵌入式', '腾讯资助', '为视频会议，电话会议提供方便。', '多人语音视频聊天', '多人聊天', '设计文档v0.1', '专利', '8500', '实验室', '测试', '测试', '测试', '致力于多人聊天', '4', '研究生', '0');
INSERT INTO project VALUES ('3', '2', '4', '2015-04-20 00:59:23', '8', '音乐识别系统', '2015-02-16 00:00:00', '2015-02-27 00:00:00', '2', '2', '网络工程', '网易资助', '基于生活中听到一首歌，想不起名字的痛苦。', '听歌识曲', '帮你想歌名', '需求文档v0.2', '产品研制', '10000', '笔记本电脑&手机', '同意', '同意', '同意', '致力于识别歌名', '5', '本科生', '0');
INSERT INTO project VALUES ('4', '2', '6', '2015-04-20 01:49:18', '10', '科创app', '2015-01-01 01:48:54', '2015-05-08 01:49:10', '1', '1', '软件工程', '学校资助', '基于软院人才生态链的构建。', '软院生态链构建', '独一无二', '代码v0.2', '软件开发&论文', '20000', '电脑&手机', '', '', '', '致力于构建软院人才生态链', '6', '本科生&研究生', '0');
INSERT INTO project VALUES ('5', '1', '3', '2015-04-20 01:49:26', '10', '在线支付系统', '2015-04-20 01:49:19', '2015-04-20 01:49:23', '2', '1', '通信工程', '阿里巴巴资助', '出门忘记带钱包，手机一键支付。', '一键网上支付，轻松+愉快~', '扫一扫支付', '代码v1.0', '产品研制', '9000', '手机', null, null, null, 'summary一键支付', '5', '本科生', '0');
INSERT INTO project VALUES ('6', '1', '3', '2015-04-20 01:58:45', '1', '多功能邮箱APP', '2015-02-23 01:49:27', '2015-05-09 01:49:32', '1', '2', '软件工程', '腾讯资助', '好多邮箱，一个一个查看太麻烦了。', '在这里，你可以看你的QQ邮箱，gmail邮箱，foxmail都集中到这里来~', 'N个邮箱一起看', '前端界面v0.2', '专利', '6000', 'mac pro', null, null, null, '多个邮箱一起看', '9', '本科生', '0');
INSERT INTO project VALUES ('7', '1', '3', '2015-04-20 00:59:31', '7', '网上购物系统', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2', '嵌入式', '阿里巴巴资助', '去超市搬回一堆东西太累了，直接网购。', '还说什么！买买买啊~', '网购新时代', '需求文档v1.0', '产品研制', '8500', '海量所实验室', null, null, null, '致力于买买买', '2', '本科生', '0');
INSERT INTO project VALUES ('8', '3', '5', '2015-04-20 00:59:34', '8', '网站动态验证码实现', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2', '软件工程', '百度资助', '防止验证码被恶意系统识别。', '动态验证码！晃的你看不清~', '可以动的验证码', '后端代码v1.0', '专利', '9000', '嵌入式实验室', null, null, null, '可以动的验证码', '3', '本科生', '0');
INSERT INTO project VALUES ('9', '3', '1', '2015-04-20 00:59:36', '10', '智能订餐系统', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2', '嵌入式', '饿了么资助', '天气太热，不想出门，网上订餐来解决。', '饿了么？就用智能订餐系统~一键选出你想要的！', '网上订餐', '需求文档v2.0', '软件开发', '8000', '高可信实验室', null, null, null, '足不出户吃大餐', '4', '本科生', '0');
INSERT INTO project VALUES ('10', '3', '4', '2015-04-20 00:59:41', '1', '智能电影分析系统', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '1', '通信工程', '美团资助', '想知道最近什么电影好看。', '最近想去看电影？看什么呢？智能电影分析系统帮你分析！', '网上订电影票', '测试计划v0.1', '产品研制', '9000', '电脑', null, null, null, '网上预定电影票', '8', '研究生', '0');
INSERT INTO project VALUES ('11', '4', '7', '2015-04-20 01:34:35', '7', '美食点评数据分析系统', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '1', '网络工程', '大众点评资助', '想知道附近有什么美食评价高。', '哪家餐厅好吃呢~来看大家的点评把~', '智能美食推荐', '测试计划v2.0', '软件开发', '10000', '电脑&手机', null, null, null, '提前预定座位', '7', '研究生', '1');
INSERT INTO project VALUES ('12', '4', '8', '2015-04-20 01:34:33', '8', '股票分析系统', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2', '软件工程', '银联资助', '初入股市的股民需要一个聪明的分析系统。', '哪只股票最近会涨？其实我也不知道。。。但是它知道！', '股市操盘手', '测试报告v1.0', '论文', '9000', 'ipad', null, null, null, '分析股市大盘趋势', '6', '研究生', '1');
INSERT INTO project VALUES ('13', '4', '9', '2015-04-20 01:34:49', '10', '随心之旅自由行定制系统', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '1', '软件工程', '携程资助', '出去玩需要制定旅行计划。', '想去哪儿~基于谷歌地图为您绘制最佳自由行路线~', '去哪儿？去啊！', '系统发布', '专利', '10000', '电脑', null, null, null, '智能定制计划', '5', '研究生', '2');

-- ----------------------------
-- Table structure for `project_category`
-- ----------------------------
DROP TABLE IF EXISTS `project_category`;
CREATE TABLE `project_category` (
  `project_category_id` int(255) NOT NULL auto_increment,
  `project_category_name` varchar(50) NOT NULL,
  `project_category_description` text NOT NULL,
  PRIMARY KEY  (`project_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_category
-- ----------------------------
INSERT INTO project_category VALUES ('1', '大夏基金', '');
INSERT INTO project_category VALUES ('2', '上海市大学生创新创业活动计划', '');
INSERT INTO project_category VALUES ('3', '国家大学生创新创业训练计划', '');
INSERT INTO project_category VALUES ('4', '自由创新项目', '');

-- ----------------------------
-- Table structure for `project_member`
-- ----------------------------
DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member` (
  `project_member_id` int(255) NOT NULL auto_increment,
  `project_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `project_member_role` int(255) NOT NULL default '0' COMMENT '学生和老师保存在同一张表中，1表示队长，2老师，3管理者，4，普通队员',
  `project_member_task` varchar(255) NOT NULL default '' COMMENT '保存每个人在项目中的任务',
  `project_member_opinion` text COMMENT '学生或老师的意见',
  `project_member_status` int(255) default '0',
  `project_application_reason` text,
  PRIMARY KEY  (`project_member_id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_member_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_member_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_member
-- ----------------------------
INSERT INTO project_member VALUES ('1', '11', '1', '0', '', null, '1', '我对这个项目很感兴趣，希望可以加入');
INSERT INTO project_member VALUES ('2', '1', '7', '1', '队长', null, null, null);
INSERT INTO project_member VALUES ('3', '1', '8', '2', '指导老师', null, null, null);
INSERT INTO project_member VALUES ('4', '12', '7', '0', '', null, '2', '我会spring希望可以加入');
INSERT INTO project_member VALUES ('5', '1', '10', '4', '队员', null, '0', null);

-- ----------------------------
-- Table structure for `project_period`
-- ----------------------------
DROP TABLE IF EXISTS `project_period`;
CREATE TABLE `project_period` (
  `project_period_id` int(255) NOT NULL auto_increment,
  `project_category_id` int(255) NOT NULL,
  `project_period_start` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `project_period_end` timestamp NOT NULL default '0000-00-00 00:00:00',
  `project_period_description` text NOT NULL,
  PRIMARY KEY  (`project_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_period
-- ----------------------------

-- ----------------------------
-- Table structure for `project_status`
-- ----------------------------
DROP TABLE IF EXISTS `project_status`;
CREATE TABLE `project_status` (
  `project_status_id` int(1) NOT NULL,
  `project_status_name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_status
-- ----------------------------
INSERT INTO project_status VALUES ('1', '草稿');
INSERT INTO project_status VALUES ('2', '正式稿');
INSERT INTO project_status VALUES ('3', '已立项');
INSERT INTO project_status VALUES ('4', '进行中');
INSERT INTO project_status VALUES ('5', '终止');
INSERT INTO project_status VALUES ('6', '已结项');
INSERT INTO project_status VALUES ('7', '报名中');
INSERT INTO project_status VALUES ('8', '进行中');
INSERT INTO project_status VALUES ('9', '已结束');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(255) NOT NULL auto_increment,
  `role_name` varchar(255) NOT NULL,
  `role_status` int(11) NOT NULL,
  PRIMARY KEY  (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO role VALUES ('1', '学生', '0');
INSERT INTO role VALUES ('2', '系统管理员', '0');
INSERT INTO role VALUES ('3', '任课教师', '0');
INSERT INTO role VALUES ('4', '辅导员', '0');
INSERT INTO role VALUES ('5', '通知管理员', '0');
INSERT INTO role VALUES ('6', '新闻管理员', '0');
INSERT INTO role VALUES ('7', '基地管理员', '0');

-- ----------------------------
-- Table structure for `role_to_feature`
-- ----------------------------
DROP TABLE IF EXISTS `role_to_feature`;
CREATE TABLE `role_to_feature` (
  `id` int(255) NOT NULL auto_increment,
  `role_id` int(255) NOT NULL COMMENT '角色id',
  `feature_id` int(255) NOT NULL COMMENT '指向某一控制器的函数的id',
  PRIMARY KEY  (`id`),
  KEY `role_to_feature_role_id` (`role_id`),
  KEY `role_to_feature_feature_id` (`feature_id`),
  CONSTRAINT `role_to_feature_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE,
  CONSTRAINT `role_to_feature_ibfk_2` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_to_feature
-- ----------------------------
INSERT INTO role_to_feature VALUES ('3', '1', '3');
INSERT INTO role_to_feature VALUES ('4', '1', '10');
INSERT INTO role_to_feature VALUES ('5', '1', '11');
INSERT INTO role_to_feature VALUES ('6', '1', '12');
INSERT INTO role_to_feature VALUES ('7', '1', '13');
INSERT INTO role_to_feature VALUES ('8', '1', '14');
INSERT INTO role_to_feature VALUES ('16', '7', '15');
INSERT INTO role_to_feature VALUES ('17', '7', '6');
INSERT INTO role_to_feature VALUES ('19', '2', '3');
INSERT INTO role_to_feature VALUES ('20', '2', '8');
INSERT INTO role_to_feature VALUES ('21', '2', '12');
INSERT INTO role_to_feature VALUES ('22', '2', '9');
INSERT INTO role_to_feature VALUES ('23', '2', '1');
INSERT INTO role_to_feature VALUES ('24', '2', '6');
INSERT INTO role_to_feature VALUES ('25', '2', '10');
INSERT INTO role_to_feature VALUES ('26', '2', '5');
INSERT INTO role_to_feature VALUES ('27', '2', '14');
INSERT INTO role_to_feature VALUES ('28', '2', '2');
INSERT INTO role_to_feature VALUES ('29', '2', '13');
INSERT INTO role_to_feature VALUES ('30', '2', '4');
INSERT INTO role_to_feature VALUES ('31', '2', '11');
INSERT INTO role_to_feature VALUES ('32', '2', '7');
INSERT INTO role_to_feature VALUES ('33', '2', '15');
INSERT INTO role_to_feature VALUES ('34', '4', '6');
INSERT INTO role_to_feature VALUES ('35', '4', '3');
INSERT INTO role_to_feature VALUES ('36', '4', '12');
INSERT INTO role_to_feature VALUES ('37', '4', '10');
INSERT INTO role_to_feature VALUES ('38', '4', '5');
INSERT INTO role_to_feature VALUES ('39', '4', '14');
INSERT INTO role_to_feature VALUES ('40', '4', '11');
INSERT INTO role_to_feature VALUES ('41', '4', '13');
INSERT INTO role_to_feature VALUES ('42', '4', '8');
INSERT INTO role_to_feature VALUES ('43', '4', '7');
INSERT INTO role_to_feature VALUES ('44', '4', '15');
INSERT INTO role_to_feature VALUES ('45', '5', '12');
INSERT INTO role_to_feature VALUES ('46', '5', '10');
INSERT INTO role_to_feature VALUES ('47', '5', '3');
INSERT INTO role_to_feature VALUES ('48', '5', '13');
INSERT INTO role_to_feature VALUES ('49', '2', '17');
INSERT INTO role_to_feature VALUES ('50', '2', '16');
INSERT INTO role_to_feature VALUES ('51', '2', '18');
INSERT INTO role_to_feature VALUES ('52', '2', '19');

-- ----------------------------
-- Table structure for `signup`
-- ----------------------------
DROP TABLE IF EXISTS `signup`;
CREATE TABLE `signup` (
  `signup_user_id` int(15) NOT NULL,
  `signup_project_id` int(255) NOT NULL,
  PRIMARY KEY  (`signup_user_id`,`signup_project_id`),
  KEY `signup_project_id` (`signup_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of signup
-- ----------------------------

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO test VALUES ('1', 'dyg');
INSERT INTO test VALUES ('2', 'xiaowang\n');
INSERT INTO test VALUES ('3', 'asd');
INSERT INTO test VALUES ('4', 'asd');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(255) NOT NULL auto_increment,
  `user_grade_id` int(255) NOT NULL COMMENT '学生的年级、教师的职称等',
  `user_gender_id` int(255) NOT NULL,
  `department_id` int(255) NOT NULL COMMENT '院系或者所在单位的id',
  `major_id` int(255) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_fullname` varchar(255) NOT NULL,
  `user_studentnumber` varchar(255) NOT NULL,
  `user_admissionyear` year(4) NOT NULL COMMENT '入学年份',
  `user_idcardnumber` varchar(20) NOT NULL,
  `user_job` varchar(255) NOT NULL COMMENT '可用于教师职务等',
  `user_researchinterests` varchar(255) NOT NULL COMMENT '可用于研究方向、兴趣等',
  `user_address` varchar(255) NOT NULL COMMENT '常住地址，当然不是寝室地址',
  `user_dormitory` varchar(100) NOT NULL COMMENT '寝室地址',
  `user_email1` varchar(255) NOT NULL,
  `user_email2` varchar(255) NOT NULL,
  `user_qq` varchar(50) NOT NULL COMMENT 'QQ',
  `user_phone1` varchar(20) NOT NULL,
  `user_phone2` varchar(20) NOT NULL,
  `user_token` varchar(255) NOT NULL default '',
  `user_status` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`),
  KEY `user_gender_id` (`user_gender_id`),
  KEY `user_grade_id` (`user_grade_id`),
  KEY `department_id` (`department_id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_grade_id`) REFERENCES `user_grade` (`user_grade_id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_gender_id`) REFERENCES `user_gender` (`user_gender_id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', '3', '1', '1', '1', '1', 'dyg', 'axt', 'xxx', '2013', 'xxx', 'xxx', 'xxx', 'xxx', 'xxx', 'v', 'xxx', 'xxx', 'xxx', 'xxx', ' 4a79bbdb078ab6f3e317b6c93ef8ae68e4964f9d', '0');
INSERT INTO user VALUES ('7', '1', '1', '1', '1', 'df399330d331a0c6a2f8e1056a9eeb66ea904027', 'shy', 'shy', '10132510262', '2013', '222', '', '', '', '', '333', '', '', '444', '555', '7', '0');
INSERT INTO user VALUES ('8', '1', '1', '1', '1', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'burgess', 'ymy', '10132510232', '2013', '123', '', '', '', '', '123', '', '', '123', '123', '8', '0');
INSERT INTO user VALUES ('10', '1', '1', '1', '1', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'ymy', 'jwm', '10132510246', '2013', 'xxxx', '', '', '', '', 'xxx', '', '', 'xxx', 'xxx', '10', '0');

-- ----------------------------
-- Table structure for `user_gender`
-- ----------------------------
DROP TABLE IF EXISTS `user_gender`;
CREATE TABLE `user_gender` (
  `user_gender_id` int(255) NOT NULL auto_increment,
  `user_gender_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`user_gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_gender
-- ----------------------------
INSERT INTO user_gender VALUES ('1', '男');
INSERT INTO user_gender VALUES ('2', '女');
INSERT INTO user_gender VALUES ('3', '其他');

-- ----------------------------
-- Table structure for `user_grade`
-- ----------------------------
DROP TABLE IF EXISTS `user_grade`;
CREATE TABLE `user_grade` (
  `user_grade_id` int(255) NOT NULL auto_increment,
  `user_grade_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`user_grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='学生的年级、教师的职称等';

-- ----------------------------
-- Records of user_grade
-- ----------------------------
INSERT INTO user_grade VALUES ('1', '本科生');
INSERT INTO user_grade VALUES ('2', '研究生');
INSERT INTO user_grade VALUES ('3', '其他');

-- ----------------------------
-- Table structure for `user_to_course`
-- ----------------------------
DROP TABLE IF EXISTS `user_to_course`;
CREATE TABLE `user_to_course` (
  `id` int(255) NOT NULL auto_increment,
  `user_id` int(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_score` int(3) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `course_id_2` (`course_id`),
  KEY `id` (`id`),
  CONSTRAINT `user_to_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_to_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_to_course
-- ----------------------------
INSERT INTO user_to_course VALUES ('1', '7', 'SOFT0031121000', '95');
INSERT INTO user_to_course VALUES ('2', '7', 'SOFT0031131001', '95');
INSERT INTO user_to_course VALUES ('3', '8', 'SOFT0031121000', '100');
INSERT INTO user_to_course VALUES ('4', '8', 'SOFT0031121001', '100');

-- ----------------------------
-- Table structure for `user_to_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_to_role`;
CREATE TABLE `user_to_role` (
  `id` int(255) NOT NULL auto_increment,
  `user_id` int(255) NOT NULL,
  `role_id` int(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_to_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_to_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_to_role
-- ----------------------------
INSERT INTO user_to_role VALUES ('14', '7', '1');
INSERT INTO user_to_role VALUES ('15', '7', '2');
INSERT INTO user_to_role VALUES ('16', '7', '3');
INSERT INTO user_to_role VALUES ('17', '7', '4');
INSERT INTO user_to_role VALUES ('18', '7', '5');
INSERT INTO user_to_role VALUES ('19', '7', '6');
INSERT INTO user_to_role VALUES ('20', '7', '7');
INSERT INTO user_to_role VALUES ('29', '8', '1');
INSERT INTO user_to_role VALUES ('30', '8', '2');
INSERT INTO user_to_role VALUES ('31', '8', '3');
INSERT INTO user_to_role VALUES ('32', '8', '4');
INSERT INTO user_to_role VALUES ('33', '8', '5');
INSERT INTO user_to_role VALUES ('34', '8', '6');
INSERT INTO user_to_role VALUES ('35', '8', '7');

-- ----------------------------
-- View structure for `comment_info`
-- ----------------------------
DROP VIEW IF EXISTS `comment_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comment_info` AS select `user`.`user_fullname` AS `userName`,`comment`.`content` AS `content`,`comment`.`user_id` AS `userId`,`comment`.`create_time` AS `createTime`,`comment`.`project_id` AS `project_id` from (`comment` join `user`) where (`comment`.`user_id` = `user`.`user_id`);

-- ----------------------------
-- View structure for `competition_info`
-- ----------------------------
DROP VIEW IF EXISTS `competition_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `competition_info` AS select `competition`.`id` AS `id`,`competition`.`createtime` AS `createTime`,`competition`.`content` AS `content`,`competition`.`competition_name` AS `name`,`competition`.`max_people` AS `people`,`user`.`user_name` AS `creator`,`competition`.`endTime` AS `endTime` from (`competition` join `user`) where (`competition`.`creator_id` = `user`.`user_id`);

-- ----------------------------
-- View structure for `funding_info`
-- ----------------------------
DROP VIEW IF EXISTS `funding_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `funding_info` AS select `funding`.`user_id` AS `userId`,`funding`.`content` AS `content`,`funding`.`money` AS `money`,`funding`.`project_id` AS `projectId`,`user`.`user_fullname` AS `userName` from (`funding` join `user`) where (`funding`.`user_id` = `user`.`user_id`);

-- ----------------------------
-- View structure for `member_info`
-- ----------------------------
DROP VIEW IF EXISTS `member_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member_info` AS select `project_member`.`user_id` AS `userId`,`project_member`.`project_member_role` AS `role`,`user`.`user_fullname` AS `userName`,`project_member`.`project_id` AS `projectId` from (`project_member` join `user`) where (`project_member`.`user_id` = `user`.`user_id`);

-- ----------------------------
-- View structure for `project_info`
-- ----------------------------
DROP VIEW IF EXISTS `project_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_info` AS select `project`.`project_id` AS `projectId`,`project`.`project_category_id` AS `categoryId`,`project`.`project_status` AS `projectStatus`,`project_category`.`project_category_name` AS `categoryName`,`project_category`.`project_category_description` AS `categoryDescription`,`project_status`.`project_status_name` AS `projectStatusName`,`project`.`project_creator_id` AS `creatorId`,`user`.`user_fullname` AS `creatorName`,`project`.`project_name` AS `projectName`,`project`.`project_start` AS `startTime`,`project`.`project_end` AS `endTime`,`project`.`project_signup_max` AS `people`,`project`.`project_describe` AS `content`,`project`.`project_funding` AS `funding`,`project`.`project_researchobject` AS `researchobject`,`project`.`project_source` AS `source`,`project`.`project_subject` AS `subject`,`project`.`project_aid` AS `aid`,`project`.`project_background` AS `background`,`project`.`project_innovation` AS `innovation`,`project`.`project_plan` AS `plan`,`project`.`project_prospect` AS `prospect`,`project`.`project_budget` AS `budget`,`project`.`project_resourcerequired` AS `resourcerequired`,`project`.`project_grouptype` AS `grouptype`,`project`.`project_summary` AS `summary`,`project`.`project_institutionopinion` AS `institutionopinion`,`project`.`project_departmentopinion` AS `departmentopinion`,`project`.`project_teacheropinion` AS `teacheropinion` from (((`project` join `project_category`) join `project_status`) join `user`) where ((`project`.`project_category_id` = `project_category`.`project_category_id`) and (`project`.`project_status` = `project_status`.`project_status_id`) and (`project`.`project_creator_id` = `user`.`user_id`));

-- ----------------------------
-- View structure for `project_user_info`
-- ----------------------------
DROP VIEW IF EXISTS `project_user_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_user_info` AS select `project_member`.`project_member_status` AS `memberStatus`,`user`.`user_token` AS `userToken`,`project_info`.`projectId` AS `projectId`,`project_member`.`user_id` AS `userId`,`project_info`.`categoryName` AS `categoryName`,`project_info`.`projectStatusName` AS `projectStatusName`,`project_info`.`creatorName` AS `creatorName`,`project_info`.`projectName` AS `projectName`,`project_info`.`startTime` AS `startTime`,`project_info`.`endTime` AS `endTime`,`project_info`.`categoryDescription` AS `categoryDescription`,`project_info`.`projectStatus` AS `projectStatus`,`project_info`.`people` AS `people`,`project_info`.`content` AS `content` from ((`project_info` join `project_member`) join `user`) where ((`project_info`.`projectId` = `project_member`.`project_id`) and (`project_member`.`user_id` = `user`.`user_id`));
