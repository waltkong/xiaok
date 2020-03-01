/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xiaok

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-03-01 20:40:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'Admin', '075eaec83636846f51c152f29b98a2fd', 's4f3', '/assets/img/avatar.png', 'admin@fastadmin.net', '0', '1583058938', '127.0.0.1', '1492186163', '1583058938', '3fc8c0e8-5d83-4e57-9458-44b97a60661e', 'normal');

-- ----------------------------
-- Table structure for `admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES ('1', '0', 'Unknown', '/admin.php/index/login?url=%2Fadmin.php', '', '{\"url\":\"\\/admin.php\",\"__token__\":\"6ce78f86b7c95675637ffc80fe4c7165\",\"username\":\"admin\",\"captcha\":\"fxzp\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583039156');
INSERT INTO `admin_log` VALUES ('2', '1', 'admin', '/admin.php/index/login?url=%2Fadmin.php', '登录', '{\"url\":\"\\/admin.php\",\"__token__\":\"9aefc1756ebe6026f325035a832c6b0e\",\"username\":\"admin\",\"captcha\":\"7beq\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583039177');
INSERT INTO `admin_log` VALUES ('3', '1', 'admin', '/admin.php/addon/install', '插件管理', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"15128\",\"token\":\"0ce7cf0e-e1f0-4a67-907d-fade53323a0e\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20191212_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583039799');
INSERT INTO `admin_log` VALUES ('4', '1', 'admin', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583039801');
INSERT INTO `admin_log` VALUES ('5', '1', 'admin', '/admin.php/addon/install', '插件管理', '{\"name\":\"cropper\",\"force\":\"0\",\"uid\":\"15128\",\"token\":\"0ce7cf0e-e1f0-4a67-907d-fade53323a0e\",\"version\":\"1.0.1\",\"faversion\":\"1.0.0.20191212_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583039815');
INSERT INTO `admin_log` VALUES ('6', '1', 'admin', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583039816');
INSERT INTO `admin_log` VALUES ('7', '1', 'admin', '/admin.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"9e6535ca51f00685b3e459575d190089\",\"row\":{\"name\":\"XiaoK\\u7ba1\\u7406\\u7cfb\\u7edf\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583048679');
INSERT INTO `admin_log` VALUES ('8', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"dog1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057142');
INSERT INTO `admin_log` VALUES ('9', '1', 'admin', '/admin.php/music/tag/add?dialog=1', 'music 音乐app标签分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"0\",\"name\":\"\\u5730\\u533a\",\"image\":\"\\/uploads\\/20200301\\/b0ebabd0b6093132da11f8e924161e6a.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057149');
INSERT INTO `admin_log` VALUES ('10', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"dog5.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057203');
INSERT INTO `admin_log` VALUES ('11', '1', 'admin', '/admin.php/music/tag/add?dialog=1', 'music 音乐app标签分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"2\",\"name\":\"\\u5927\\u9646\",\"image\":\"\\/uploads\\/20200301\\/5c5792fd491941f2f2cee4d7651ba220.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057222');
INSERT INTO `admin_log` VALUES ('12', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"dog3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057243');
INSERT INTO `admin_log` VALUES ('13', '1', 'admin', '/admin.php/music/tag/add?dialog=1', 'music 音乐app标签分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"2\",\"name\":\"\\u53f0\\u6e7e\",\"image\":\"\\/uploads\\/20200301\\/d24704353b609f131f0881fa7b7a25c4.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057245');
INSERT INTO `admin_log` VALUES ('14', '1', 'admin', '/admin.php/music/tag/add?dialog=1', 'music 音乐app标签分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"2\",\"name\":\"\\u9999\\u6e2f\",\"image\":\"\\/uploads\\/20200301\\/5c5792fd491941f2f2cee4d7651ba220.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057264');
INSERT INTO `admin_log` VALUES ('15', '1', 'admin', '/admin.php/music/tag/add?dialog=1', 'music 音乐app标签分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"0\",\"name\":\"\\u98ce\\u683c\",\"image\":\"\\/uploads\\/20200301\\/5c5792fd491941f2f2cee4d7651ba220.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057315');
INSERT INTO `admin_log` VALUES ('16', '1', 'admin', '/admin.php/music/tag/add?dialog=1', 'music 音乐app标签分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"6\",\"name\":\"\\u6d41\\u884c\",\"image\":\"\\/uploads\\/20200301\\/b0ebabd0b6093132da11f8e924161e6a.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057331');
INSERT INTO `admin_log` VALUES ('17', '1', 'admin', '/admin.php/music/tag/add?dialog=1', 'music 音乐app标签分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"6\",\"name\":\"\\u7ecf\\u5178\",\"image\":\"\\/uploads\\/20200301\\/5c5792fd491941f2f2cee4d7651ba220.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057348');
INSERT INTO `admin_log` VALUES ('18', '1', 'admin', '/admin.php/music/tag/add?dialog=1', 'music 音乐app标签分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"6\",\"name\":\"\\u6e29\\u548c\",\"image\":\"\\/uploads\\/20200301\\/5c5792fd491941f2f2cee4d7651ba220.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057367');
INSERT INTO `admin_log` VALUES ('19', '1', 'admin', '/admin.php/music/tag/add?dialog=1', 'music 音乐app标签分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"6\",\"name\":\"\\u91cd\\u91d1\\u5c5e\",\"image\":\"\\/uploads\\/20200301\\/5c5792fd491941f2f2cee4d7651ba220.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583057381');
INSERT INTO `admin_log` VALUES ('20', '1', 'admin', '/admin.php/addon/state', '插件管理 禁用启用', '{\"name\":\"summernote\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583058718');
INSERT INTO `admin_log` VALUES ('21', '1', 'admin', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583058719');
INSERT INTO `admin_log` VALUES ('22', '1', 'admin', '/admin.php/addon/uninstall', '插件管理', '{\"name\":\"summernote\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583058726');
INSERT INTO `admin_log` VALUES ('23', '1', 'admin', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583058727');
INSERT INTO `admin_log` VALUES ('24', '1', 'admin', '/admin.php/addon/install', '插件管理', '{\"name\":\"simditor\",\"force\":\"0\",\"uid\":\"15128\",\"token\":\"0ce7cf0e-e1f0-4a67-907d-fade53323a0e\",\"version\":\"1.0.5\",\"faversion\":\"1.0.0.20191212_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583058738');
INSERT INTO `admin_log` VALUES ('25', '1', 'admin', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583058739');
INSERT INTO `admin_log` VALUES ('26', '1', 'admin', '/admin.php/index/login', '登录', '{\"__token__\":\"8bfa807098fb58196c4b80774ab3e3a0\",\"username\":\"admin\",\"captcha\":\"adbt\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583058938');
INSERT INTO `admin_log` VALUES ('27', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"deng1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059247');
INSERT INTO `admin_log` VALUES ('28', '1', 'admin', '/admin.php/music/ad/add?dialog=1', 'music 音乐app广告管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u9093\\u7d2b\\u68cb\\u65b0\\u6b4c\\u53d1\\u5e03\\u4e86\",\"description\":\"\\u7c89\\u4e1d\\u6709\\u798f\\u4e86-\\u9093\\u7d2b\\u68cb\\u65b0\\u6b4c\\u91cd\\u78c5\\u6765\\u88ad\",\"content\":\"\",\"image\":\"\\/uploads\\/20200301\\/d121c1da236fd3514ec292568bd82f18.jpg\",\"route_type\":\"0\",\"route_url\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059266');
INSERT INTO `admin_log` VALUES ('29', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059331');
INSERT INTO `admin_log` VALUES ('30', '1', 'admin', '/admin.php/music/ad/add?dialog=1', 'music 音乐app广告管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u674e\\u5b97\\u76db\\u6709\\u6b4c\\u4e4b\\u5e74\",\"description\":\"\\u674e\\u5b97\\u76db\\u6709\\u6b4c\\u4e4b\\u5e74\",\"content\":\"\",\"image\":\"\\/uploads\\/20200301\\/0025d6ac7574004ad9c92184fb0d6935.jpg\",\"route_type\":\"0\",\"route_url\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059336');
INSERT INTO `admin_log` VALUES ('31', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"jay2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059355');
INSERT INTO `admin_log` VALUES ('32', '1', 'admin', '/admin.php/music/ad/add?dialog=1', 'music 音乐app广告管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5468\\u6770\\u4f26\\u65b0\\u6b4c\",\"description\":\"\\u5468\\u6770\\u4f26\\u65b0\\u6b4c\",\"content\":\"\",\"image\":\"\\/uploads\\/20200301\\/46e876fd3ea1c49b98975a47fed1251e.jpg\",\"route_type\":\"0\",\"route_url\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059359');
INSERT INTO `admin_log` VALUES ('33', '1', 'admin', '/admin.php/music/ad/edit/ids/4?dialog=1', 'music 音乐app广告管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5468\\u6770\\u4f26\\u65b0\\u6b4c\",\"description\":\"\\u5468\\u6770\\u4f26\\u65b0\\u6b4c\\u7cbe\\u54c1\\u53d1\\u5e03\",\"content\":\"\",\"image\":\"\\/uploads\\/20200301\\/46e876fd3ea1c49b98975a47fed1251e.jpg\",\"route_type\":\"0\",\"route_url\":\"\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059408');
INSERT INTO `admin_log` VALUES ('34', '1', 'admin', '/admin.php/music/ad/edit/ids/3?dialog=1', 'music 音乐app广告管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u674e\\u5b97\\u76db\\u6709\\u6b4c\\u4e4b\\u5e74\",\"description\":\"\\u674e\\u5b97\\u76db\\u6709\\u6b4c\\u4e4b\\u5e74\\u706b\\u7206\\u4e13\\u533a\",\"content\":\"\",\"image\":\"\\/uploads\\/20200301\\/0025d6ac7574004ad9c92184fb0d6935.jpg\",\"route_type\":\"0\",\"route_url\":\"\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059421');
INSERT INTO `admin_log` VALUES ('35', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"deng2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059445');
INSERT INTO `admin_log` VALUES ('36', '1', 'admin', '/admin.php/music/banner/add?dialog=1', 'music 音乐app导航 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5bfc\\u822a\\u4e00\",\"image\":\"\\/uploads\\/20200301\\/637d41b99e46883e3eac6980b1b53dcf.jpg\",\"route_type\":\"0\",\"route_url\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059449');
INSERT INTO `admin_log` VALUES ('37', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee5.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059466');
INSERT INTO `admin_log` VALUES ('38', '1', 'admin', '/admin.php/music/banner/add?dialog=1', 'music 音乐app导航 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5bfc\\u822a2\",\"image\":\"\\/uploads\\/20200301\\/051039999d9824c4de7d559c6612102a.jpg\",\"route_type\":\"0\",\"route_url\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059469');
INSERT INTO `admin_log` VALUES ('39', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"deng1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059483');
INSERT INTO `admin_log` VALUES ('40', '1', 'admin', '/admin.php/music/banner/add?dialog=1', 'music 音乐app导航 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5bfc\\u822a2\",\"image\":\"\\/uploads\\/20200301\\/d121c1da236fd3514ec292568bd82f18.jpg\",\"route_type\":\"0\",\"route_url\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059486');
INSERT INTO `admin_log` VALUES ('41', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059503');
INSERT INTO `admin_log` VALUES ('42', '1', 'admin', '/admin.php/music/banner/add?dialog=1', 'music 音乐app导航 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5bfc\\u822a4\",\"image\":\"\\/uploads\\/20200301\\/ff1cbaf39a142b007d03a919b861fe8b.jpg\",\"route_type\":\"0\",\"route_url\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059506');
INSERT INTO `admin_log` VALUES ('43', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"jay3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059553');
INSERT INTO `admin_log` VALUES ('44', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"jay2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059741');
INSERT INTO `admin_log` VALUES ('45', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"jay1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059752');
INSERT INTO `admin_log` VALUES ('46', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"jay2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059757');
INSERT INTO `admin_log` VALUES ('47', '1', 'admin', '/admin.php/music/singer/add?dialog=1', 'music 音乐app歌手管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5468\\u6770\\u4f26\",\"description\":\"\\u5468\\u6770\\u4f26\\uff08Jay Chou\\uff09\\uff0c1979\\u5e741\\u670818\\u65e5\\u51fa\\u751f\\u4e8e\\u53f0\\u6e7e\\u7701\\u65b0\\u5317\\u5e02\\uff0c\\u7956\\u7c4d\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u6c38\\u6625\\u53bf\\uff0c\\u4e2d\\u56fd\\u53f0\\u6e7e\\u6d41\\u884c\\u4e50\\u7537\\u6b4c\\u624b\\u3001\\u539f\\u521b\\u97f3\\u4e50\\u4eba\\u3001\\u6f14\\u5458\\u3001\\u5bfc\\u6f14\\u7b49\\uff0c\\u6bd5\\u4e1a\\u4e8e\\u6de1\\u6c5f\\u4e2d\\u5b66\\u3002\",\"one_image\":\"\\/uploads\\/20200301\\/46e876fd3ea1c49b98975a47fed1251e.jpg\",\"many_images\":\"\\/uploads\\/20200301\\/46e876fd3ea1c49b98975a47fed1251e.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059764');
INSERT INTO `admin_log` VALUES ('48', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"jay1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059868');
INSERT INTO `admin_log` VALUES ('49', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"jay3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059872');
INSERT INTO `admin_log` VALUES ('50', '1', 'admin', '/admin.php/music/singer/edit/ids/2?dialog=1', 'music 音乐app歌手管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5468\\u6770\\u4f26\",\"description\":\"\\u5468\\u6770\\u4f26\\uff08Jay Chou\\uff09\\uff0c1979\\u5e741\\u670818\\u65e5\\u51fa\\u751f\\u4e8e\\u53f0\\u6e7e\\u7701\\u65b0\\u5317\\u5e02\\uff0c\\u7956\\u7c4d\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u6c38\\u6625\\u53bf\\uff0c\\u4e2d\\u56fd\\u53f0\\u6e7e\\u6d41\\u884c\\u4e50\\u7537\\u6b4c\\u624b\\u3001\\u539f\\u521b\\u97f3\\u4e50\\u4eba\\u3001\\u6f14\\u5458\\u3001\\u5bfc\\u6f14\\u7b49\\uff0c\\u6bd5\\u4e1a\\u4e8e\\u6de1\\u6c5f\\u4e2d\\u5b66\\u3002\",\"one_image\":\"\\/uploads\\/20200301\\/46e876fd3ea1c49b98975a47fed1251e.jpg\",\"many_images\":\"\\/uploads\\/20200301\\/46e876fd3ea1c49b98975a47fed1251e.jpg,\\/uploads\\/20200301\\/a616d0beee6babe9e55bbddeb2a2f993.jpg,\\/uploads\\/20200301\\/bba9b9636ab60fc0019fdf13d6db5a7e.jpg\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059880');
INSERT INTO `admin_log` VALUES ('51', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"deng1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059970');
INSERT INTO `admin_log` VALUES ('52', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"deng2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059975');
INSERT INTO `admin_log` VALUES ('53', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"deng1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059980');
INSERT INTO `admin_log` VALUES ('54', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"deng3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059987');
INSERT INTO `admin_log` VALUES ('55', '1', 'admin', '/admin.php/music/singer/add?dialog=1', 'music 音乐app歌手管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u9093\\u7d2b\\u68cb\",\"description\":\"\\u9093\\u7d2b\\u68cb\\uff08Gloria Tang Tsz-Kei\\uff09\\uff0c\\u53c8\\u540dG.E.M.\\uff08\\u201cGet Everybody Moving\\u201d\\u7684\\u7b80\\u79f0\\uff09\\uff0c\\u672c\\u540d\\u9093\\u8bd7\\u9896\\uff0c1991\\u5e748\\u670816\\u65e5\\u751f\\u4e8e\\u4e2d\\u56fd\\u4e0a\\u6d77\\uff0c4\\u5c81\\u79fb\\u5c45\\u9999\\u6e2f\\uff0c\\u4e2d\\u56fd\\u9999\\u6e2f\\u5973\\u6b4c\\u624b\\u3001\\u8bcd\\u66f2\\u521b\\u4f5c\\u4eba\\u30022008\\u5e747\\u670810\\u65e5\\uff0c\\u4ee516\\u5c81\\u4e4b\\u9f84\\u51fa\\u9053\\u3002\",\"one_image\":\"\\/uploads\\/20200301\\/d121c1da236fd3514ec292568bd82f18.jpg\",\"many_images\":\"\\/uploads\\/20200301\\/637d41b99e46883e3eac6980b1b53dcf.jpg,\\/uploads\\/20200301\\/d121c1da236fd3514ec292568bd82f18.jpg,\\/uploads\\/20200301\\/5be2ad68de5b9a7f40db261537f5d401.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583059990');
INSERT INTO `admin_log` VALUES ('56', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583060031');
INSERT INTO `admin_log` VALUES ('57', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee4.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583060041');
INSERT INTO `admin_log` VALUES ('58', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583060046');
INSERT INTO `admin_log` VALUES ('59', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583060056');
INSERT INTO `admin_log` VALUES ('60', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee5.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583060065');
INSERT INTO `admin_log` VALUES ('61', '1', 'admin', '/admin.php/music/singer/add?dialog=1', 'music 音乐app歌手管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u674e\\u5b97\\u76db\",\"description\":\"\\u674e\\u5b97\\u76db\\uff08Jonathan Lee\\uff09\\uff0c1958\\u5e747\\u670819\\u65e5\\u51fa\\u751f\\u4e8e\\u4e2d\\u56fd\\u53f0\\u6e7e\\u7701\\u53f0\\u5317\\u5e02\\uff0c\\u4e2d\\u56fd\\u53f0\\u6e7e\\u7537\\u6b4c\\u624b\\u3001\\u8bcd\\u66f2\\u521b\\u4f5c\\u4eba\\u3001\\u97f3\\u4e50\\u5236\\u4f5c\\u4eba\\u3001\\u5236\\u7434\\u5e08\\u3002\",\"one_image\":\"\\/uploads\\/20200301\\/ff1cbaf39a142b007d03a919b861fe8b.jpg\",\"many_images\":\"\\/uploads\\/20200301\\/4c9f95180d4aff87ea284b018cff18a5.jpg,\\/uploads\\/20200301\\/0025d6ac7574004ad9c92184fb0d6935.jpg,\\/uploads\\/20200301\\/051039999d9824c4de7d559c6612102a.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583060068');
INSERT INTO `admin_log` VALUES ('62', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583060162');
INSERT INTO `admin_log` VALUES ('63', '1', 'admin', '/admin.php/auth/group/roletree', '权限管理 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583063142');
INSERT INTO `admin_log` VALUES ('64', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065108');
INSERT INTO `admin_log` VALUES ('65', '1', 'admin', '/admin.php/music/cd/add?dialog=1', 'music 音乐app专辑管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u65e2\\u7136\\u9752\\u6625\\u7559\\u4e0d\\u4f4f\",\"image\":\"\\/uploads\\/20200301\\/0025d6ac7574004ad9c92184fb0d6935.jpg\",\"publishtime\":\"2020-03-01\",\"description\":\"\\u9614\\u522b6\\u5e74\\u591a\\u4e4b\\u540e\\uff0c\\u674e\\u5b97\\u76db\\u7ec8\\u4e8e\\u51b3\\u5b9a\\u518d\\u5ea6\\u4e3e\\u529e\\u5927\\u578b\\u4e2a\\u4eba\\u6f14\\u5531\\u4f1a\\uff0c\\u5e76\\u5ba3\\u5e03\\u300a\\u65e2\\u7136\\u9752\\u6625\\u7559\\u4e0d\\u4f4f\\u300b\\u4e16\\u754c\\u5de1\\u56de\\u6f14\\u5531\\u4f1a9\\u670828\\u65e5\\u5c06\\u5728\\u53f0\\u5317\\u5c0f\\u5de8\\u86cb\\u534e\\u4e3d\\u8d77\\u822a\\u3002\\u8be5\\u573a\\u6f14\\u5531\\u4f1a\\u524d\\u671f\\u672a \\u505a\\u4efb\\u4f55\\u5ba3\\u4f20\\u9020\\u52bf\\uff0c\\u5374\\u5728\\u5f00\\u7968\\u4e09\\u65e5\\u4e4b\\u5185\\u95e8\\u7968\\u5168\\u90e8\\u552e\\u7f44\\uff0c\\u4e00\\u7968\\u96be\\u6c42\\u3002\\u636e\\u4e86\\u89e3\\uff0c\\u65e0\\u6570\\u5708\\u5185\\u5927\\u724c\\u6b4c\\u661f\\u3001\\u6f14\\u5458\\u4ee5\\u53ca\\u4f17\\u591a\\u6587\\u5316\\u754c\\u3001\\u4f20\\u5a92\\u5708\\u5927\\u4f6c\\u7eb7\\u7eb7\\u81ea\\u638f\\u8170\\u5305\\u4e70\\u7968\\uff0c\\u5171\\u540c\\u524d\\u53bb\\u5c0f\\u5de8\\u86cb \\u201c\\u671d\\u5723\\u201d\",\"is_recommend\":\"1\",\"tag_ids\":[\"3\",\"4\",\"7\"],\"singer_id\":\"4\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065163');
INSERT INTO `admin_log` VALUES ('66', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065619');
INSERT INTO `admin_log` VALUES ('67', '1', 'admin', '/admin.php/music/cd/add?dialog=1', 'music 音乐app专辑管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u6709\\u6b4c\\u4e4b\\u5e74\",\"image\":\"\\/uploads\\/20200301\\/ff1cbaf39a142b007d03a919b861fe8b.jpg\",\"publishtime\":\"2020-03-01\",\"description\":\"\\u201c\\u5e74\\u5c11\\u4e0d\\u61c2\\u674e\\u5b97\\u76db\\uff0c\\u542c\\u61c2\\u5df2\\u662f\\u4e0d\\u60d1\\u5e74\\u201d\\uff0c\\u8fd8\\u4e0d\\u5230\\u4e0d\\u60d1\\u5e74\\u7684\\u6211\\uff0c\\u5374\\u88ab\\u4ed6\\u5531\\u51fa\\u4e86\\u8bf8\\u591a\\u60c6\\u6005\\u3002\\r\\n&quot;\\u6bcf\\u4e2a\\u4eba\\u5fc3\\u4e2d\\u90fd\\u6709\\u4e00\\u9996\\u674e\\u5b97\\u76db&quot;\\uff0c\\u674e\\u5b97\\u76db\\u7528\\u6b4c\\u5531\\u51fa\\u4e86\\u81ea\\u5df1\\u4e00\\u751f\\u7684\\u8fc7\\u5f80\\uff0c\\u4ed6\\u5531\\u4e86\\u4eba\\u751f\\u7684\\u653e\\u4e0d\\u4e0b\\uff0c\\u4e5f\\u5531\\u4e86\\u653e\\u4e0b\\uff1b\\u5531\\u4e86\\u4eba\\u751f\\u7684\\u4e0d\\u820d\\u5f97\\uff0c\\u4e5f\\u5531\\u4e86\\u820d\\u5f03\\uff1b\\u5531\\u4e86\\u76f8\\u9047\\uff0c\\u4e5f\\u5531\\u4e86\\u79bb\\u522b\\uff1b\\u5531\\u4e86\\u7f8e\\u597d\\uff0c\\u4e5f\\u5531\\u4e86\\u6b8b\\u7f3a\\u3002\\r\\n\\u542c\\u5b8c\\u90a3\\u9996\\u300a\\u5c71\\u4e18\\u300b\\uff0c\\u6211\\u53c8\\u627e\\u6765\\u6b4c\\u8bcd\\u7ec6\\u7ec6\\u54c1\\u5473\\u3002\\u8d8a\\u8fc7\\u5c71\\u4e18\\uff0c\\u867d\\u7136\\u65e0\\u4eba\\u7b49\\u5019\\uff0c\\u4f46\\u4ed6\\u4e00\\u76f4\\u662f\\u5728\\u6d3b\\u51fa\\u81ea\\u5df1\\uff0c\\u5c31\\u662f\\u6700\\u5927\\u7684\\u5e78\\u798f\\u5427\\u3002\",\"is_recommend\":\"1\",\"tag_ids\":[\"4\",\"5\",\"7\"],\"singer_id\":\"4\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065709');
INSERT INTO `admin_log` VALUES ('68', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"jay1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065765');
INSERT INTO `admin_log` VALUES ('69', '1', 'admin', '/admin.php/music/cd/add?dialog=1', 'music 音乐app专辑管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"12\\u65b0\\u4f5c\",\"image\":\"\\/uploads\\/20200301\\/a616d0beee6babe9e55bbddeb2a2f993.jpg\",\"publishtime\":\"2020-03-01\",\"description\":\"\\u4e3b\\u8981\\u7531\\u5468\\u6770\\u4f26\\u3001\\u65b9\\u6587\\u5c71\\u521b\\u4f5c\\uff0c\\u5468\\u6770\\u4f26\\u8d1f\\u8d23\\u5168\\u90e8\\u66f2\\u76ee\\u7684\\u8c31\\u66f2\\u53ca\\u90e8\\u5206\\u6b4c\\u66f2\\u586b\\u8bcd\\uff0c\\u65b9\\u6587\\u5c71\\u5b8c\\u6210\\u534a\\u4e2a\\u4e13\\u8f91\\u7684\\u586b\\u8bcd\\uff0c\\u540c\\u65f6\\u4f9d\\u7136\\u7559\\u4e86\\u4e24\\u9996\\u6b4c\\u66f2\\u7ed9\\u65b0\\u751f\\u4ee3\\u7684\\u586b\\u8bcd\\u4eba\\u3002\\u949f\\u5174\\u6c11\\u3001\\u6d2a\\u656c\\u5c27\\u3001\\u6797\\u8fc8\\u53ef\\u8fd9\\u4e9b\\u8001\\u642d\\u6863\\u5206\\u5de5\\u660e\\u786e\\u6765\\u4e3a\\u5468\\u6770\\u4f26\\u505a\\u7f16\\u66f2\\u5de5\\u4f5c\\u3002\",\"is_recommend\":\"1\",\"tag_ids\":[\"4\",\"7\",\"8\"],\"singer_id\":\"2\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065791');
INSERT INTO `admin_log` VALUES ('70', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"jay3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065867');
INSERT INTO `admin_log` VALUES ('71', '1', 'admin', '/admin.php/music/cd/add?dialog=1', 'music 音乐app专辑管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u60ca\\u53f9\\u53f7\",\"image\":\"\\/uploads\\/20200301\\/bba9b9636ab60fc0019fdf13d6db5a7e.jpg\",\"publishtime\":\"2020-03-01\",\"description\":\"\\u300a\\u60ca\\u53f9\\u53f7\\uff01\\u300b\\u662f\\u5468\\u6770\\u4f26\\u63a8\\u51fa\\u7684\\u7b2c11\\u5f20\\u4e13\\u8f91\\uff0c\\u7531\\u5468\\u6770\\u4f26\\u4f5c\\u66f2\\uff0c\\u65b9\\u6587\\u5c71\\u3001\\u9ec4\\u4fca\\u90ce\\u3001\\u5510\\u4ece\\u5723\\u7b49\\u4f5c\\u8bcd\\uff0c\\u5171\\u6536\\u5f5511\\u9996\\u6b4c\\u66f2\\u3002\\u8be5\\u4e13\\u8f91\\u878d\\u5408\\u591a\\u79cd\\u66f2\\u98ce\\uff0c\\u4ee5\\u53ca\\u4e0d\\u540c\\u5531\\u8154\",\"is_recommend\":\"1\",\"tag_ids\":[\"4\",\"5\",\"7\",\"8\"],\"singer_id\":\"2\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065877');
INSERT INTO `admin_log` VALUES ('72', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"deng1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065932');
INSERT INTO `admin_log` VALUES ('73', '1', 'admin', '/admin.php/music/cd/add?dialog=1', 'music 音乐app专辑管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u53e5\\u53f7\",\"image\":\"\\/uploads\\/20200301\\/d121c1da236fd3514ec292568bd82f18.jpg\",\"publishtime\":\"2020-03-01\",\"description\":\"\\u300a\\u53e5\\u53f7\\u300b\\u662f\\u7531\\u9093\\u7d2b\\u68cb\\u4f5c\\u8bcd\\u3001\\u4f5c\\u66f2\\u5e76\\u6f14\\u5531\\u7684\\u4e00\\u9996\\u6b4c\\u66f2\\uff0c\\u53d1\\u884c\\u4e8e2019\\u5e7411\\u670822\\u65e5\\uff0c\\u540e\\u6536\\u5f55\\u4e8e\\u9093\\u7d2b\\u68cb2019\\u5e7412\\u670827\\u65e5\\u53d1\\u884c\\u7684\\u4e13\\u8f91\\u300a\\u6469\\u5929\\u52a8\\u7269\\u56ed\\u300b\\u4e2d\\u3002\",\"is_recommend\":\"1\",\"tag_ids\":[\"3\",\"5\",\"8\"],\"singer_id\":\"3\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065940');
INSERT INTO `admin_log` VALUES ('74', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"deng2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583065999');
INSERT INTO `admin_log` VALUES ('75', '1', 'admin', '/admin.php/music/cd/add?dialog=1', 'music 音乐app专辑管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u6ce1\\u6cab\",\"image\":\"\\/uploads\\/20200301\\/637d41b99e46883e3eac6980b1b53dcf.jpg\",\"publishtime\":\"2020-03-01\",\"description\":\"\\u300a\\u6ce1\\u6cab\\u300b\\u662f\\u9093\\u7d2b\\u68cb\\u6f14\\u5531\\u7684\\u6b4c\\u66f2\\uff0c\\u6b4c\\u66f2\\u7531\\u9093\\u7d2b\\u68cb\\u4f5c\\u8bcd\\u4f5c\\u66f2\\uff0c\\u6b4c\\u66f2MV\\u7531TAN CHANG\\u6267\\u5bfc\\uff0c\\u6536\\u5f55\\u5728\\u4e13\\u8f91\\u300aXposed\\u300b\\u4e2d\\uff0c\\u4e13\\u8f91\\u4e8e2012\\u5e747\\u67085\\u65e5\\u53d1\\u884c\\u3002\",\"is_recommend\":\"1\",\"tag_ids\":[\"3\",\"5\",\"7\",\"9\"],\"singer_id\":\"3\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583066009');
INSERT INTO `admin_log` VALUES ('76', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583066130');
INSERT INTO `admin_log` VALUES ('77', '1', 'admin', '/admin.php/music/song/add?dialog=1', 'music 音乐app歌曲管理 添加', '{\"dialog\":\"1\",\"row\":{\"cd_id\":\"2\",\"singer_id\":\"4\",\"name\":\"\\u9b3c\\u8ff7\\u5fc3\\u7a8d\",\"description\":\"\\u300a\\u9b3c\\u8ff7\\u5fc3\\u7a8d\\u300b\\u662f1992\\u5e74\\u9ec4\\u65e5\\u534e\\u3001\\u5468\\u6d77\\u5a9a\\u4e3b\\u6f14\\u53f0\\u6e7e\\u7535\\u89c6\\u5267\\u300a\\u672b\\u4ee3\\u7687\\u5b59\\u300b\\u7684\\u4e3b\\u9898\\u66f2\\uff0c\\u662f\\u7531\\u674e\\u5b97\\u76db\\u4f5c\\u8bcd\\u3001\\u4f5c\\u66f2\\u3001\\u6f14\\u5531\\uff0c\\u6536\\u5f55\\u4e8e1992\\u5e74\\u5f71\\u89c6\\u5267\\u97f3\\u4e50\\u5408\\u8f91\\u300a\\u6eda\\u77f3\\u4e5d\\u5927\\u5929\\u738b\\u4e4b\\u5341\\u4e8c\\u51fa\\u597d\\u620f\\u300b\\u5f53\\u4e2d\\u3002\",\"voice_url\":\"\",\"vedio_url\":\"\",\"image\":\"\\/uploads\\/20200301\\/ff1cbaf39a142b007d03a919b861fe8b.jpg\",\"lyric\":\"\",\"is_recommend\":\"1\",\"tag_ids\":[\"3\",\"4\",\"5\",\"7\",\"8\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583066141');
INSERT INTO `admin_log` VALUES ('78', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583066247');
INSERT INTO `admin_log` VALUES ('79', '1', 'admin', '/admin.php/music/song/add?dialog=1', 'music 音乐app歌曲管理 添加', '{\"dialog\":\"1\",\"row\":{\"cd_id\":\"2\",\"singer_id\":\"4\",\"name\":\"\\u4e3a\\u4f60\\u6211\\u53d7\\u51b7\\u98ce\\u5439\",\"description\":\"\\u300a\\u4e3a\\u4f60\\u53d7\\u5c3d\\u51b7\\u98ce\\u5439\\u300b\\uff0c\\u8fd9\\u9996\\u6b4c\\u662f\\u674e\\u5b97\\u76db\\u5199\\u7ed9\\u6797\\u5fc6\\u83b2\\u7684\\u6b4c\\uff0c\\u6b4c\\u66f2\\u7684\\u80cc\\u540e\\u5176\\u5b9e\\u8fd8\\u9690\\u85cf\\u7740\\u4e00\\u4e2a\\u53ef\\u6b4c\\u53ef\\u6ce3\\u7684\\u7231\\u60c5\\u6545\\u4e8b\\uff01\\u8bdd\\u8bf4\\u5f53\\u5e74\\u674e\\u5b97\\u76db\\u4e0e\\u6797\\u5fc6\\u83b2\\u7ed3\\u7f18\\u4e8e\\u5f55\\u97f3\\u68da\\uff0c\\u4ece\\u6b64\\u4e8c\\u4eba\\u4e92\\u751f\\u7231\\u6155\\uff0c\\u60f3\\u8981\\u53ae\\u5b88\\u7ec8\\u8eab\\uff01\",\"voice_url\":\"\",\"vedio_url\":\"\",\"image\":\"\\/uploads\\/20200301\\/54c0ada9fb6b151792b519980519b68a.jpg\",\"lyric\":\"\",\"is_recommend\":\"1\",\"tag_ids\":[\"4\",\"5\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583066253');
INSERT INTO `admin_log` VALUES ('80', '1', 'admin', '/admin.php/ajax/upload', '', '{\"name\":\"lee1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583066348');
INSERT INTO `admin_log` VALUES ('81', '1', 'admin', '/admin.php/music/song/add?dialog=1', 'music 音乐app歌曲管理 添加', '{\"dialog\":\"1\",\"row\":{\"cd_id\":\"3\",\"singer_id\":\"4\",\"name\":\"\\u591a\\u597d\",\"description\":\"\\u8bcd\\uff1a\\u674e\\u5b97\\u76db\\u66f2\\uff1a\\u9ece\\u6cb8\\u6325\\u771f\\u8ba9\\u4eba\\u60f3\\u4e0d\\u5230\\u5c16\\u6c99\\u5634\\u5f25\\u6566\\u9053\\u8bf4\\u591a\\u5de7\\u5c31\\u6709\\u591a\\u5de7\\u8fd9\\u4e48\\u591a\\u5e74\\u4ee5\\u540e\\u4f1a\\u5728\\u8fd9\\u9047\\u5230\\u4f60\\u4f55\\u5fc5\\u591a\\u4ecb\\u7ecd\\u6211\\u60f3\\u6211\\u731c\\u5f97\\u5230\\u4ed6\\u662f\\u8c01\\u6211\\u7ba1\\u4e0d\\u7740\\u6211\\u53ea\\u60f3\\u77e5\\u9053\\u4f60\\u597d\\u4e0d\\u597d\",\"voice_url\":\"\",\"vedio_url\":\"\",\"image\":\"\\/uploads\\/20200301\\/ff1cbaf39a142b007d03a919b861fe8b.jpg\",\"lyric\":\"\",\"is_recommend\":\"1\",\"tag_ids\":[\"4\",\"5\",\"7\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '1583066352');

-- ----------------------------
-- Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `attachment` VALUES ('2', '1', '0', '/uploads/20200301/b0ebabd0b6093132da11f8e924161e6a.jpg', '500', '333', 'jpg', '0', '23216', 'image/jpeg', '{\"name\":\"dog1.jpg\"}', '1583057142', '1583057142', '1583057142', 'local', '4386b51364e40c752a9a60c493aaef0739fc2f41');
INSERT INTO `attachment` VALUES ('3', '1', '0', '/uploads/20200301/5c5792fd491941f2f2cee4d7651ba220.jpg', '500', '375', 'jpg', '0', '16604', 'image/jpeg', '{\"name\":\"dog5.jpg\"}', '1583057203', '1583057203', '1583057203', 'local', '1084174a0d915bb205f601d4b92f5ea8328dbd35');
INSERT INTO `attachment` VALUES ('4', '1', '0', '/uploads/20200301/d24704353b609f131f0881fa7b7a25c4.jpg', '500', '300', 'jpg', '0', '34185', 'image/jpeg', '{\"name\":\"dog3.jpg\"}', '1583057243', '1583057243', '1583057243', 'local', '8de4251f9fd89365af86c0d06227183f7d1161cc');
INSERT INTO `attachment` VALUES ('5', '1', '0', '/uploads/20200301/d121c1da236fd3514ec292568bd82f18.jpg', '500', '406', 'jpg', '0', '24309', 'image/jpeg', '{\"name\":\"deng1.jpg\"}', '1583059247', '1583059247', '1583059247', 'local', '160c676c112888842acee93324c6f5fc931517f9');
INSERT INTO `attachment` VALUES ('6', '1', '0', '/uploads/20200301/0025d6ac7574004ad9c92184fb0d6935.jpg', '600', '259', 'jpg', '0', '39894', 'image/jpeg', '{\"name\":\"lee3.jpg\"}', '1583059331', '1583059331', '1583059331', 'local', 'ad27aa825e33e8c05ae937b270062bfa3e672999');
INSERT INTO `attachment` VALUES ('7', '1', '0', '/uploads/20200301/46e876fd3ea1c49b98975a47fed1251e.jpg', '500', '320', 'jpg', '0', '12264', 'image/jpeg', '{\"name\":\"jay2.jpg\"}', '1583059355', '1583059355', '1583059355', 'local', '0191e4f7f50c2e83ffdd7b7576746e9e7394b110');
INSERT INTO `attachment` VALUES ('8', '1', '0', '/uploads/20200301/637d41b99e46883e3eac6980b1b53dcf.jpg', '500', '333', 'jpg', '0', '20153', 'image/jpeg', '{\"name\":\"deng2.jpg\"}', '1583059445', '1583059445', '1583059445', 'local', 'e21fcbeb98759c6c1aec7b1633ac7e5f2e53746a');
INSERT INTO `attachment` VALUES ('9', '1', '0', '/uploads/20200301/051039999d9824c4de7d559c6612102a.jpg', '500', '334', 'jpg', '0', '18741', 'image/jpeg', '{\"name\":\"lee5.jpg\"}', '1583059466', '1583059466', '1583059466', 'local', 'cc143cfa0eb181782cc0c54805d5f8c666a0334f');
INSERT INTO `attachment` VALUES ('10', '1', '0', '/uploads/20200301/ff1cbaf39a142b007d03a919b861fe8b.jpg', '501', '300', 'jpg', '0', '19235', 'image/jpeg', '{\"name\":\"lee1.jpg\"}', '1583059503', '1583059503', '1583059503', 'local', 'd640993d79cfa07e8f444c5508fd3e4c2b28e1e7');
INSERT INTO `attachment` VALUES ('11', '1', '0', '/uploads/20200301/bba9b9636ab60fc0019fdf13d6db5a7e.jpg', '500', '573', 'jpg', '0', '24411', 'image/jpeg', '{\"name\":\"jay3.jpg\"}', '1583059553', '1583059553', '1583059553', 'local', '6b125cb1d0c91665095c521628318e4e41ed9b82');
INSERT INTO `attachment` VALUES ('12', '1', '0', '/uploads/20200301/a616d0beee6babe9e55bbddeb2a2f993.jpg', '453', '486', 'jpg', '0', '19097', 'image/jpeg', '{\"name\":\"jay1.jpg\"}', '1583059752', '1583059752', '1583059752', 'local', 'b0cb0b0f61e1953cc175d7f90dad56b2ae148b88');
INSERT INTO `attachment` VALUES ('13', '1', '0', '/uploads/20200301/5be2ad68de5b9a7f40db261537f5d401.jpg', '500', '643', 'jpg', '0', '51391', 'image/jpeg', '{\"name\":\"deng3.jpg\"}', '1583059987', '1583059987', '1583059987', 'local', '4146bbd4119f9313b72450ec8c97559d5a0ed113');
INSERT INTO `attachment` VALUES ('14', '1', '0', '/uploads/20200301/4c9f95180d4aff87ea284b018cff18a5.jpg', '500', '353', 'jpg', '0', '12738', 'image/jpeg', '{\"name\":\"lee4.jpg\"}', '1583060041', '1583060041', '1583060041', 'local', '304c84b9b62cb34ea390ea2842e22763c991c67a');
INSERT INTO `attachment` VALUES ('15', '1', '0', '/uploads/20200301/54c0ada9fb6b151792b519980519b68a.jpg', '500', '698', 'jpg', '0', '42463', 'image/jpeg', '{\"name\":\"lee2.jpg\"}', '1583066247', '1583066247', '1583066247', 'local', '59734bbc7ce692faf090ef9b9f68b11f4effe498');

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1490883540', '1505465692', 'normal');
INSERT INTO `auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1490883540', '1502205322', 'normal');
INSERT INTO `auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1490883540', '1502205350', 'normal');
INSERT INTO `auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1490883540', '1502205344', 'normal');

-- ----------------------------
-- Table structure for `auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', 'file', '0', 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', '1', '1497429920', '1497429920', '143', 'normal');
INSERT INTO `auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '137', 'normal');
INSERT INTO `auth_rule` VALUES ('3', 'file', '0', 'category', 'Category', 'fa fa-leaf', '', 'Category tips', '1', '1497429920', '1497429920', '119', 'normal');
INSERT INTO `auth_rule` VALUES ('4', 'file', '0', 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '1', '1497429920', '1497430092', '99', 'normal');
INSERT INTO `auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '53', 'normal');
INSERT INTO `auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '34', 'normal');
INSERT INTO `auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '118', 'normal');
INSERT INTO `auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '113', 'normal');
INSERT INTO `auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '109', 'normal');
INSERT INTO `auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1497430581', '104', 'normal');
INSERT INTO `auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '136', 'normal');
INSERT INTO `auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '135', 'normal');
INSERT INTO `auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '133', 'normal');
INSERT INTO `auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '134', 'normal');
INSERT INTO `auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '132', 'normal');
INSERT INTO `auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '59', 'normal');
INSERT INTO `auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '58', 'normal');
INSERT INTO `auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '57', 'normal');
INSERT INTO `auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '56', 'normal');
INSERT INTO `auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '55', 'normal');
INSERT INTO `auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '28', 'normal');
INSERT INTO `auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', '0', '1497429920', '1497429920', '142', 'normal');
INSERT INTO `auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '141', 'normal');
INSERT INTO `auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '140', 'normal');
INSERT INTO `auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '139', 'normal');
INSERT INTO `auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '138', 'normal');
INSERT INTO `auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '117', 'normal');
INSERT INTO `auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '116', 'normal');
INSERT INTO `auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '115', 'normal');
INSERT INTO `auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '114', 'normal');
INSERT INTO `auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '112', 'normal');
INSERT INTO `auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '111', 'normal');
INSERT INTO `auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '110', 'normal');
INSERT INTO `auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '108', 'normal');
INSERT INTO `auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '107', 'normal');
INSERT INTO `auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '106', 'normal');
INSERT INTO `auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '105', 'normal');
INSERT INTO `auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '103', 'normal');
INSERT INTO `auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '102', 'normal');
INSERT INTO `auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '101', 'normal');
INSERT INTO `auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '100', 'normal');
INSERT INTO `auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('59', 'file', '4', 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('66', 'file', '0', 'user', 'User', 'fa fa-list', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('67', 'file', '66', 'user/user', 'User', 'fa fa-user', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('68', 'file', '67', 'user/user/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('69', 'file', '67', 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('70', 'file', '67', 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('71', 'file', '67', 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('72', 'file', '67', 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('73', 'file', '66', 'user/group', 'User group', 'fa fa-users', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('74', 'file', '73', 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('75', 'file', '73', 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('76', 'file', '73', 'user/group/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('77', 'file', '73', 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('78', 'file', '73', 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('79', 'file', '66', 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('80', 'file', '79', 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('81', 'file', '79', 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('82', 'file', '79', 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('83', 'file', '79', 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('84', 'file', '79', 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('85', 'file', '0', 'music', 'music', 'fa fa-list', '', '', '1', '1583048442', '1583048442', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('86', 'file', '85', 'music/ad', '音乐app广告管理', 'fa fa-circle-o\r', '', '', '1', '1583048442', '1583048442', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('87', 'file', '86', 'music/ad/index', '查看', 'fa fa-circle-o', '', '', '0', '1583048442', '1583048442', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('88', 'file', '86', 'music/ad/add', '添加', 'fa fa-circle-o', '', '', '0', '1583048443', '1583048443', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('89', 'file', '86', 'music/ad/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1583048443', '1583048443', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('90', 'file', '86', 'music/ad/del', '删除', 'fa fa-circle-o', '', '', '0', '1583048443', '1583048443', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('91', 'file', '86', 'music/ad/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1583048443', '1583048443', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('92', 'file', '85', 'music/banner', '音乐app导航', 'fa fa-circle-o\r', '', '', '1', '1583048448', '1583048448', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('93', 'file', '92', 'music/banner/index', '查看', 'fa fa-circle-o', '', '', '0', '1583048448', '1583048448', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('94', 'file', '92', 'music/banner/add', '添加', 'fa fa-circle-o', '', '', '0', '1583048448', '1583048448', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('95', 'file', '92', 'music/banner/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1583048448', '1583048448', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('96', 'file', '92', 'music/banner/del', '删除', 'fa fa-circle-o', '', '', '0', '1583048448', '1583048448', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('97', 'file', '92', 'music/banner/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1583048448', '1583048448', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('98', 'file', '85', 'music/cd', '音乐app专辑管理', 'fa fa-circle-o\r', '', '', '1', '1583048453', '1583048453', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('99', 'file', '98', 'music/cd/index', '查看', 'fa fa-circle-o', '', '', '0', '1583048453', '1583048453', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('100', 'file', '98', 'music/cd/add', '添加', 'fa fa-circle-o', '', '', '0', '1583048453', '1583048453', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('101', 'file', '98', 'music/cd/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1583048453', '1583048453', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('102', 'file', '98', 'music/cd/del', '删除', 'fa fa-circle-o', '', '', '0', '1583048453', '1583048453', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('103', 'file', '98', 'music/cd/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1583048453', '1583048453', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('104', 'file', '85', 'music/singer', '音乐app歌手管理', 'fa fa-circle-o\r', '', '', '1', '1583048458', '1583048458', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('105', 'file', '104', 'music/singer/index', '查看', 'fa fa-circle-o', '', '', '0', '1583048458', '1583048458', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('106', 'file', '104', 'music/singer/add', '添加', 'fa fa-circle-o', '', '', '0', '1583048458', '1583048458', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('107', 'file', '104', 'music/singer/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1583048458', '1583048458', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('108', 'file', '104', 'music/singer/del', '删除', 'fa fa-circle-o', '', '', '0', '1583048458', '1583048458', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('109', 'file', '104', 'music/singer/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1583048458', '1583048458', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('110', 'file', '85', 'music/song', '音乐app歌曲管理', 'fa fa-circle-o\r', '', '', '1', '1583048464', '1583048464', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('111', 'file', '110', 'music/song/index', '查看', 'fa fa-circle-o', '', '', '0', '1583048464', '1583048464', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('112', 'file', '110', 'music/song/add', '添加', 'fa fa-circle-o', '', '', '0', '1583048464', '1583048464', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('113', 'file', '110', 'music/song/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1583048464', '1583048464', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('114', 'file', '110', 'music/song/del', '删除', 'fa fa-circle-o', '', '', '0', '1583048465', '1583048465', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('115', 'file', '110', 'music/song/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1583048465', '1583048465', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('116', 'file', '85', 'music/tag', '音乐app标签分类管理', 'fa fa-circle-o\r', '', '', '1', '1583048470', '1583048470', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('117', 'file', '116', 'music/tag/index', '查看', 'fa fa-circle-o', '', '', '0', '1583048470', '1583048470', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('118', 'file', '116', 'music/tag/add', '添加', 'fa fa-circle-o', '', '', '0', '1583048470', '1583048470', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('119', 'file', '116', 'music/tag/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1583048470', '1583048470', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('120', 'file', '116', 'music/tag/del', '删除', 'fa fa-circle-o', '', '', '0', '1583048470', '1583048470', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('121', 'file', '116', 'music/tag/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1583048470', '1583048470', '0', 'normal');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', '1495262190', '1495262190', '1', 'normal');
INSERT INTO `category` VALUES ('2', '0', 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', '1495262244', '1495262244', '2', 'normal');
INSERT INTO `category` VALUES ('3', '2', 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', '1495262288', '1495262288', '3', 'normal');
INSERT INTO `category` VALUES ('4', '2', 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', '1495262317', '1495262317', '4', 'normal');
INSERT INTO `category` VALUES ('5', '0', 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', '1495262336', '1499681850', '5', 'normal');
INSERT INTO `category` VALUES ('6', '5', 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', '1495262357', '1495262357', '6', 'normal');
INSERT INTO `category` VALUES ('7', '5', 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', '1495262391', '1495262391', '7', 'normal');
INSERT INTO `category` VALUES ('8', '6', 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', '1495262424', '1495262424', '8', 'normal');
INSERT INTO `category` VALUES ('9', '6', 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', '1495262456', '1495262456', '9', 'normal');
INSERT INTO `category` VALUES ('10', '7', 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', '1495262487', '1495262487', '10', 'normal');
INSERT INTO `category` VALUES ('11', '7', 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', '1495262515', '1495262515', '11', 'normal');
INSERT INTO `category` VALUES ('12', '0', 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', '1497015727', '1497015727', '12', 'normal');
INSERT INTO `category` VALUES ('13', '0', 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', '1497015738', '1497015738', '13', 'normal');

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'XiaoK管理系统', '', 'required', '');
INSERT INTO `config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for `ems`
-- ----------------------------
DROP TABLE IF EXISTS `ems`;
CREATE TABLE `ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of ems
-- ----------------------------

-- ----------------------------
-- Table structure for `music_ad`
-- ----------------------------
DROP TABLE IF EXISTS `music_ad`;
CREATE TABLE `music_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `content` mediumtext,
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `route_type` tinyint(3) DEFAULT '0' COMMENT '路由类型 0不跳转 1webview 2前端路由',
  `route_url` varchar(255) DEFAULT NULL COMMENT '路由地址',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='音乐app广告表';

-- ----------------------------
-- Records of music_ad
-- ----------------------------
INSERT INTO `music_ad` VALUES ('2', '邓紫棋新歌发布了', '粉丝有福了-邓紫棋新歌重磅来袭', '', '/uploads/20200301/d121c1da236fd3514ec292568bd82f18.jpg', '0', '', '1583059266', '1583059266', null);
INSERT INTO `music_ad` VALUES ('3', '李宗盛有歌之年', '李宗盛有歌之年火爆专区', '', '/uploads/20200301/0025d6ac7574004ad9c92184fb0d6935.jpg', '0', '', '1583059336', '1583059421', null);
INSERT INTO `music_ad` VALUES ('4', '周杰伦新歌', '周杰伦新歌精品发布', '', '/uploads/20200301/46e876fd3ea1c49b98975a47fed1251e.jpg', '0', '', '1583059359', '1583059408', null);

-- ----------------------------
-- Table structure for `music_banner`
-- ----------------------------
DROP TABLE IF EXISTS `music_banner`;
CREATE TABLE `music_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `route_type` tinyint(3) DEFAULT '0' COMMENT '路由类型 0不跳转 1webview 2前端路由',
  `route_url` varchar(255) DEFAULT NULL COMMENT '路由地址',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='音乐app导航';

-- ----------------------------
-- Records of music_banner
-- ----------------------------
INSERT INTO `music_banner` VALUES ('2', '导航一', '/uploads/20200301/637d41b99e46883e3eac6980b1b53dcf.jpg', '0', '', '1583059449', '1583059449', null);
INSERT INTO `music_banner` VALUES ('3', '导航2', '/uploads/20200301/051039999d9824c4de7d559c6612102a.jpg', '0', '', '1583059469', '1583059469', null);
INSERT INTO `music_banner` VALUES ('4', '导航2', '/uploads/20200301/d121c1da236fd3514ec292568bd82f18.jpg', '0', '', '1583059486', '1583059486', null);
INSERT INTO `music_banner` VALUES ('5', '导航4', '/uploads/20200301/ff1cbaf39a142b007d03a919b861fe8b.jpg', '0', '', '1583059506', '1583059506', null);

-- ----------------------------
-- Table structure for `music_cd`
-- ----------------------------
DROP TABLE IF EXISTS `music_cd`;
CREATE TABLE `music_cd` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT '' COMMENT '专辑名称',
  `image` varchar(255) DEFAULT NULL COMMENT '专辑图片',
  `publishtime` int(10) DEFAULT NULL COMMENT '发行时间',
  `description` varchar(255) DEFAULT NULL COMMENT '专辑描述',
  `is_recommend` tinyint(3) DEFAULT '1' COMMENT '是否推荐 1是0否',
  `tag_ids` varchar(255) DEFAULT NULL COMMENT '专辑标签',
  `singer_id` int(10) DEFAULT NULL COMMENT '歌手id',
  `createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='音乐app专辑表';

-- ----------------------------
-- Records of music_cd
-- ----------------------------
INSERT INTO `music_cd` VALUES ('2', '既然青春留不住', '/uploads/20200301/0025d6ac7574004ad9c92184fb0d6935.jpg', '1582992000', '阔别6年多之后，李宗盛终于决定再度举办大型个人演唱会，并宣布《既然青春留不住》世界巡回演唱会9月28日将在台北小巨蛋华丽起航。该场演唱会前期未 做任何宣传造势，却在开票三日之内门票全部售罄，一票难求。据了解，无数圈内大牌歌星、演员以及众多文化界、传媒圈大佬纷纷自掏腰包买票，共同前去小巨蛋 “朝圣”', '1', ',3,4,7,', '4', '1583065163', '1583065163', null);
INSERT INTO `music_cd` VALUES ('3', '有歌之年', '/uploads/20200301/ff1cbaf39a142b007d03a919b861fe8b.jpg', '1582992000', '“年少不懂李宗盛，听懂已是不惑年”，还不到不惑年的我，却被他唱出了诸多惆怅。\r\n\"每个人心中都有一首李宗盛\"，李宗盛用歌唱出了自己一生的过往，他唱了人生的放不下，也唱了放下；唱了人生的不舍得，也唱了舍弃；唱了相遇，也唱了离别；唱了美好，也唱了残缺。\r\n听完那首《山丘》，我又找来歌词细细品味。越过山丘，虽然无人等候，但他一直是在活出自己，就是最大的幸福吧。', '1', ',4,5,7,', '4', '1583065709', '1583065709', null);
INSERT INTO `music_cd` VALUES ('4', '12新作', '/uploads/20200301/a616d0beee6babe9e55bbddeb2a2f993.jpg', '1582992000', '主要由周杰伦、方文山创作，周杰伦负责全部曲目的谱曲及部分歌曲填词，方文山完成半个专辑的填词，同时依然留了两首歌曲给新生代的填词人。钟兴民、洪敬尧、林迈可这些老搭档分工明确来为周杰伦做编曲工作。', '1', ',4,7,8,', '2', '1583065791', '1583065791', null);
INSERT INTO `music_cd` VALUES ('5', '惊叹号', '/uploads/20200301/bba9b9636ab60fc0019fdf13d6db5a7e.jpg', '1582992000', '《惊叹号！》是周杰伦推出的第11张专辑，由周杰伦作曲，方文山、黄俊郎、唐从圣等作词，共收录11首歌曲。该专辑融合多种曲风，以及不同唱腔', '1', ',4,5,7,8,', '2', '1583065877', '1583065877', null);
INSERT INTO `music_cd` VALUES ('6', '句号', '/uploads/20200301/d121c1da236fd3514ec292568bd82f18.jpg', '1582992000', '《句号》是由邓紫棋作词、作曲并演唱的一首歌曲，发行于2019年11月22日，后收录于邓紫棋2019年12月27日发行的专辑《摩天动物园》中。', '1', ',3,5,8,', '3', '1583065940', '1583065940', null);
INSERT INTO `music_cd` VALUES ('7', '泡沫', '/uploads/20200301/637d41b99e46883e3eac6980b1b53dcf.jpg', '1582992000', '《泡沫》是邓紫棋演唱的歌曲，歌曲由邓紫棋作词作曲，歌曲MV由TAN CHANG执导，收录在专辑《Xposed》中，专辑于2012年7月5日发行。', '1', ',3,5,7,9,', '3', '1583066009', '1583066009', null);

-- ----------------------------
-- Table structure for `music_singer`
-- ----------------------------
DROP TABLE IF EXISTS `music_singer`;
CREATE TABLE `music_singer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `one_image` varchar(255) DEFAULT NULL COMMENT '单图',
  `many_images` text COMMENT '多图',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='音乐app歌手表';

-- ----------------------------
-- Records of music_singer
-- ----------------------------
INSERT INTO `music_singer` VALUES ('2', '周杰伦', '周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，祖籍福建省泉州市永春县，中国台湾流行乐男歌手、原创音乐人、演员、导演等，毕业于淡江中学。', '/uploads/20200301/46e876fd3ea1c49b98975a47fed1251e.jpg', '/uploads/20200301/46e876fd3ea1c49b98975a47fed1251e.jpg,/uploads/20200301/a616d0beee6babe9e55bbddeb2a2f993.jpg,/uploads/20200301/bba9b9636ab60fc0019fdf13d6db5a7e.jpg', '1583059764', '1583059880', null);
INSERT INTO `music_singer` VALUES ('3', '邓紫棋', '邓紫棋（Gloria Tang Tsz-Kei），又名G.E.M.（“Get Everybody Moving”的简称），本名邓诗颖，1991年8月16日生于中国上海，4岁移居香港，中国香港女歌手、词曲创作人。2008年7月10日，以16岁之龄出道。', '/uploads/20200301/d121c1da236fd3514ec292568bd82f18.jpg', '/uploads/20200301/637d41b99e46883e3eac6980b1b53dcf.jpg,/uploads/20200301/d121c1da236fd3514ec292568bd82f18.jpg,/uploads/20200301/5be2ad68de5b9a7f40db261537f5d401.jpg', '1583059990', '1583059990', null);
INSERT INTO `music_singer` VALUES ('4', '李宗盛', '李宗盛（Jonathan Lee），1958年7月19日出生于中国台湾省台北市，中国台湾男歌手、词曲创作人、音乐制作人、制琴师。', '/uploads/20200301/ff1cbaf39a142b007d03a919b861fe8b.jpg', '/uploads/20200301/4c9f95180d4aff87ea284b018cff18a5.jpg,/uploads/20200301/0025d6ac7574004ad9c92184fb0d6935.jpg,/uploads/20200301/051039999d9824c4de7d559c6612102a.jpg', '1583060068', '1583060068', null);

-- ----------------------------
-- Table structure for `music_song`
-- ----------------------------
DROP TABLE IF EXISTS `music_song`;
CREATE TABLE `music_song` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cd_id` int(10) DEFAULT NULL COMMENT '专辑id，0表示不属于任何专辑',
  `singer_id` int(10) DEFAULT NULL COMMENT '歌手id',
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `voice_url` varchar(255) DEFAULT NULL COMMENT '音乐地址',
  `vedio_url` varchar(255) DEFAULT NULL COMMENT '视频url',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `lyric` text COMMENT '歌词',
  `is_recommend` tinyint(3) DEFAULT NULL COMMENT '是否推荐 1是0否',
  `tag_ids` varchar(255) DEFAULT NULL COMMENT '所属标签',
  `createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='音乐app歌曲表';

-- ----------------------------
-- Records of music_song
-- ----------------------------
INSERT INTO `music_song` VALUES ('2', '2', '4', '鬼迷心窍', '《鬼迷心窍》是1992年黄日华、周海媚主演台湾电视剧《末代皇孙》的主题曲，是由李宗盛作词、作曲、演唱，收录于1992年影视剧音乐合辑《滚石九大天王之十二出好戏》当中。', '', '', '/uploads/20200301/ff1cbaf39a142b007d03a919b861fe8b.jpg', '', '1', ',3,4,5,7,8,', '1583066141', '1583066141', null);
INSERT INTO `music_song` VALUES ('3', '2', '4', '为你我受冷风吹', '《为你受尽冷风吹》，这首歌是李宗盛写给林忆莲的歌，歌曲的背后其实还隐藏着一个可歌可泣的爱情故事！话说当年李宗盛与林忆莲结缘于录音棚，从此二人互生爱慕，想要厮守终身！', '', '', '/uploads/20200301/54c0ada9fb6b151792b519980519b68a.jpg', '', '1', ',4,5,', '1583066253', '1583066253', null);
INSERT INTO `music_song` VALUES ('4', '3', '4', '多好', '词：李宗盛曲：黎沸挥真让人想不到尖沙嘴弥敦道说多巧就有多巧这么多年以后会在这遇到你何必多介绍我想我猜得到他是谁我管不着我只想知道你好不好', '', '', '/uploads/20200301/ff1cbaf39a142b007d03a919b861fe8b.jpg', '', '1', ',4,5,7,', '1583066352', '1583066352', null);

-- ----------------------------
-- Table structure for `music_tag`
-- ----------------------------
DROP TABLE IF EXISTS `music_tag`;
CREATE TABLE `music_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `parent_id` int(10) DEFAULT '0' COMMENT '父id',
  `createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='音乐app标签分类表';

-- ----------------------------
-- Records of music_tag
-- ----------------------------
INSERT INTO `music_tag` VALUES ('2', '地区', '/uploads/20200301/b0ebabd0b6093132da11f8e924161e6a.jpg', '0', '1583057149', '1583057149', null);
INSERT INTO `music_tag` VALUES ('3', '大陆', '/uploads/20200301/5c5792fd491941f2f2cee4d7651ba220.jpg', '2', '1583057222', '1583057222', null);
INSERT INTO `music_tag` VALUES ('4', '台湾', '/uploads/20200301/d24704353b609f131f0881fa7b7a25c4.jpg', '2', '1583057245', '1583057245', null);
INSERT INTO `music_tag` VALUES ('5', '香港', '/uploads/20200301/5c5792fd491941f2f2cee4d7651ba220.jpg', '2', '1583057264', '1583057264', null);
INSERT INTO `music_tag` VALUES ('6', '风格', '/uploads/20200301/5c5792fd491941f2f2cee4d7651ba220.jpg', '0', '1583057315', '1583057315', null);
INSERT INTO `music_tag` VALUES ('7', '流行', '/uploads/20200301/b0ebabd0b6093132da11f8e924161e6a.jpg', '6', '1583057331', '1583057331', null);
INSERT INTO `music_tag` VALUES ('8', '经典', '/uploads/20200301/5c5792fd491941f2f2cee4d7651ba220.jpg', '6', '1583057348', '1583057348', null);
INSERT INTO `music_tag` VALUES ('9', '温和', '/uploads/20200301/5c5792fd491941f2f2cee4d7651ba220.jpg', '6', '1583057366', '1583057366', null);
INSERT INTO `music_tag` VALUES ('10', '重金属', '/uploads/20200301/5c5792fd491941f2f2cee4d7651ba220.jpg', '6', '1583057381', '1583057381', null);

-- ----------------------------
-- Table structure for `sms`
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

-- ----------------------------
-- Records of sms
-- ----------------------------

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '0', '12', '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', '0.00', '0', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', '1499682285', '1499682526', '1499682526', null, '0', '1', 'normal', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '', '0', '0', '2017-04-15', '', '0.00', '0', '1', '1', '1516170492', '1516171614', '127.0.0.1', '0', '127.0.0.1', '1491461418', '0', '1516171614', '', 'normal', '');

-- ----------------------------
-- Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员组表';

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', '1515386468', '1516168298', 'normal');

-- ----------------------------
-- Table structure for `user_money_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_money_log`;
CREATE TABLE `user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员余额变动表';

-- ----------------------------
-- Records of user_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for `user_rule`
-- ----------------------------
DROP TABLE IF EXISTS `user_rule`;
CREATE TABLE `user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员规则表';

-- ----------------------------
-- Records of user_rule
-- ----------------------------
INSERT INTO `user_rule` VALUES ('1', '0', 'index', '前台', '', '1', '1516168079', '1516168079', '1', 'normal');
INSERT INTO `user_rule` VALUES ('2', '0', 'api', 'API接口', '', '1', '1516168062', '1516168062', '2', 'normal');
INSERT INTO `user_rule` VALUES ('3', '1', 'user', '会员模块', '', '1', '1515386221', '1516168103', '12', 'normal');
INSERT INTO `user_rule` VALUES ('4', '2', 'user', '会员模块', '', '1', '1515386221', '1516168092', '11', 'normal');
INSERT INTO `user_rule` VALUES ('5', '3', 'index/user/login', '登录', '', '0', '1515386247', '1515386247', '5', 'normal');
INSERT INTO `user_rule` VALUES ('6', '3', 'index/user/register', '注册', '', '0', '1515386262', '1516015236', '7', 'normal');
INSERT INTO `user_rule` VALUES ('7', '3', 'index/user/index', '会员中心', '', '0', '1516015012', '1516015012', '9', 'normal');
INSERT INTO `user_rule` VALUES ('8', '3', 'index/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '4', 'normal');
INSERT INTO `user_rule` VALUES ('9', '4', 'api/user/login', '登录', '', '0', '1515386247', '1515386247', '6', 'normal');
INSERT INTO `user_rule` VALUES ('10', '4', 'api/user/register', '注册', '', '0', '1515386262', '1516015236', '8', 'normal');
INSERT INTO `user_rule` VALUES ('11', '4', 'api/user/index', '会员中心', '', '0', '1516015012', '1516015012', '10', 'normal');
INSERT INTO `user_rule` VALUES ('12', '4', 'api/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '3', 'normal');

-- ----------------------------
-- Table structure for `user_score_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_score_log`;
CREATE TABLE `user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员积分变动表';

-- ----------------------------
-- Records of user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for `user_token`
-- ----------------------------
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员Token表';

-- ----------------------------
-- Records of user_token
-- ----------------------------

-- ----------------------------
-- Table structure for `version`
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES ('1', '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', '1', '1520425318', '0', '0', 'normal');
