/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : minipro

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-08-03 16:11:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for eb_article
-- ----------------------------
DROP TABLE IF EXISTS `eb_article`;
CREATE TABLE `eb_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章管理ID',
  `cid` varchar(255) DEFAULT '1' COMMENT '分类id',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `author` varchar(255) DEFAULT NULL COMMENT '文章作者',
  `image_input` varchar(255) NOT NULL COMMENT '文章图片',
  `synopsis` varchar(255) DEFAULT NULL COMMENT '文章简介',
  `share_title` varchar(255) DEFAULT NULL COMMENT '文章分享标题',
  `share_synopsis` varchar(255) DEFAULT NULL COMMENT '文章分享简介',
  `visit` varchar(255) DEFAULT NULL COMMENT '浏览次数',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `url` varchar(255) DEFAULT NULL COMMENT '原文链接',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `add_time` varchar(255) NOT NULL COMMENT '添加时间',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `mer_id` int(10) unsigned DEFAULT '0' COMMENT '商户id',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热门(小程序)',
  `is_banner` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否轮播图(小程序)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章管理表';

-- ----------------------------
-- Records of eb_article
-- ----------------------------

-- ----------------------------
-- Table structure for eb_article_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_article_category`;
CREATE TABLE `eb_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `title` varchar(255) NOT NULL COMMENT '文章分类标题',
  `intr` varchar(255) DEFAULT NULL COMMENT '文章分类简介',
  `image` varchar(255) NOT NULL COMMENT '文章分类图片',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1删除0未删除',
  `add_time` varchar(255) NOT NULL COMMENT '添加时间',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章分类表';

-- ----------------------------
-- Records of eb_article_category
-- ----------------------------

-- ----------------------------
-- Table structure for eb_article_content
-- ----------------------------
DROP TABLE IF EXISTS `eb_article_content`;
CREATE TABLE `eb_article_content` (
  `nid` int(10) unsigned NOT NULL COMMENT '文章id',
  `content` text NOT NULL COMMENT '文章内容',
  UNIQUE KEY `nid` (`nid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章内容表';

-- ----------------------------
-- Records of eb_article_content
-- ----------------------------

-- ----------------------------
-- Table structure for eb_cache
-- ----------------------------
DROP TABLE IF EXISTS `eb_cache`;
CREATE TABLE `eb_cache` (
  `key` varchar(32) NOT NULL,
  `result` text COMMENT '缓存数据',
  `add_time` int(10) DEFAULT NULL COMMENT '缓存时间',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='微信缓存表';

-- ----------------------------
-- Records of eb_cache
-- ----------------------------

-- ----------------------------
-- Table structure for eb_express
-- ----------------------------
DROP TABLE IF EXISTS `eb_express`;
CREATE TABLE `eb_express` (
  `id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '快递公司id',
  `code` varchar(50) NOT NULL COMMENT '快递公司简称',
  `name` varchar(50) NOT NULL COMMENT '快递公司全称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_show` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='快递公司表';

-- ----------------------------
-- Records of eb_express
-- ----------------------------
INSERT INTO `eb_express` VALUES ('1', 'LIMINWL', '利民物流', '1', '0');
INSERT INTO `eb_express` VALUES ('2', 'XINTIAN', '鑫天顺物流', '1', '0');
INSERT INTO `eb_express` VALUES ('3', 'henglu', '恒路物流', '1', '0');
INSERT INTO `eb_express` VALUES ('4', 'klwl', '康力物流', '1', '0');
INSERT INTO `eb_express` VALUES ('5', 'meiguo', '美国快递', '1', '0');
INSERT INTO `eb_express` VALUES ('6', 'a2u', 'A2U速递', '1', '0');
INSERT INTO `eb_express` VALUES ('7', 'benteng', '奔腾物流', '1', '0');
INSERT INTO `eb_express` VALUES ('8', 'ahdf', '德方物流', '1', '0');
INSERT INTO `eb_express` VALUES ('9', 'timedg', '万家通', '1', '0');
INSERT INTO `eb_express` VALUES ('10', 'ztong', '智通物流', '1', '0');
INSERT INTO `eb_express` VALUES ('11', 'xindan', '新蛋物流', '1', '0');
INSERT INTO `eb_express` VALUES ('12', 'bgpyghx', '挂号信', '1', '0');
INSERT INTO `eb_express` VALUES ('13', 'XFHONG', '鑫飞鸿物流快递', '1', '0');
INSERT INTO `eb_express` VALUES ('14', 'ALP', '阿里物流', '1', '0');
INSERT INTO `eb_express` VALUES ('15', 'BFWL', '滨发物流', '1', '0');
INSERT INTO `eb_express` VALUES ('16', 'SJWL', '宋军物流', '1', '0');
INSERT INTO `eb_express` VALUES ('17', 'SHUNFAWL', '顺发物流', '1', '0');
INSERT INTO `eb_express` VALUES ('18', 'TIANHEWL', '天河物流', '1', '0');
INSERT INTO `eb_express` VALUES ('19', 'YBWL', '邮联物流', '1', '0');
INSERT INTO `eb_express` VALUES ('20', 'SWHY', '盛旺货运', '1', '0');
INSERT INTO `eb_express` VALUES ('21', 'TSWL', '汤氏物流', '1', '0');
INSERT INTO `eb_express` VALUES ('22', 'YUANYUANWL', '圆圆物流', '1', '0');
INSERT INTO `eb_express` VALUES ('23', 'BALIANGWL', '八梁物流', '1', '0');
INSERT INTO `eb_express` VALUES ('24', 'ZGWL', '振刚物流', '1', '0');
INSERT INTO `eb_express` VALUES ('25', 'JIAYU', '佳宇物流', '1', '0');
INSERT INTO `eb_express` VALUES ('26', 'SHHX', '昊昕物流', '1', '0');
INSERT INTO `eb_express` VALUES ('27', 'ande', '安得物流', '1', '0');
INSERT INTO `eb_express` VALUES ('28', 'ppbyb', '贝邮宝', '1', '0');
INSERT INTO `eb_express` VALUES ('29', 'dida', '递达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('30', 'jppost', '日本邮政', '1', '0');
INSERT INTO `eb_express` VALUES ('31', 'intmail', '中国邮政', '96', '0');
INSERT INTO `eb_express` VALUES ('32', 'HENGCHENGWL', '恒诚物流', '1', '0');
INSERT INTO `eb_express` VALUES ('33', 'HENGFENGWL', '恒丰物流', '1', '0');
INSERT INTO `eb_express` VALUES ('34', 'gdems', '广东ems快递', '1', '0');
INSERT INTO `eb_express` VALUES ('35', 'xlyt', '祥龙运通', '1', '0');
INSERT INTO `eb_express` VALUES ('36', 'gjbg', '国际包裹', '1', '0');
INSERT INTO `eb_express` VALUES ('37', 'uex', 'UEX', '1', '0');
INSERT INTO `eb_express` VALUES ('38', 'singpost', '新加坡邮政', '1', '0');
INSERT INTO `eb_express` VALUES ('39', 'guangdongyouzhengwuliu', '广东邮政', '1', '0');
INSERT INTO `eb_express` VALUES ('40', 'bht', 'BHT', '1', '0');
INSERT INTO `eb_express` VALUES ('41', 'cces', 'CCES快递', '1', '0');
INSERT INTO `eb_express` VALUES ('42', 'cloudexpress', 'CE易欧通国际速递', '1', '0');
INSERT INTO `eb_express` VALUES ('43', 'dasu', '达速物流', '1', '0');
INSERT INTO `eb_express` VALUES ('44', 'pfcexpress', '皇家物流', '1', '0');
INSERT INTO `eb_express` VALUES ('45', 'hjs', '猴急送', '1', '0');
INSERT INTO `eb_express` VALUES ('46', 'huilian', '辉联物流', '1', '0');
INSERT INTO `eb_express` VALUES ('47', 'huanqiu', '环球速运', '1', '0');
INSERT INTO `eb_express` VALUES ('48', 'huada', '华达快运', '1', '0');
INSERT INTO `eb_express` VALUES ('49', 'htwd', '华通务达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('50', 'hipito', '海派通', '1', '0');
INSERT INTO `eb_express` VALUES ('51', 'hqtd', '环球通达', '1', '0');
INSERT INTO `eb_express` VALUES ('52', 'airgtc', '航空快递', '1', '0');
INSERT INTO `eb_express` VALUES ('53', 'haoyoukuai', '好又快物流', '1', '0');
INSERT INTO `eb_express` VALUES ('54', 'hanrun', '韩润物流', '1', '0');
INSERT INTO `eb_express` VALUES ('55', 'ccd', '河南次晨达', '1', '0');
INSERT INTO `eb_express` VALUES ('56', 'hfwuxi', '和丰同城', '1', '0');
INSERT INTO `eb_express` VALUES ('57', 'Sky', '荷兰', '1', '0');
INSERT INTO `eb_express` VALUES ('58', 'hongxun', '鸿讯物流', '1', '0');
INSERT INTO `eb_express` VALUES ('59', 'hongjie', '宏捷国际物流', '1', '0');
INSERT INTO `eb_express` VALUES ('60', 'httx56', '汇通天下物流', '1', '0');
INSERT INTO `eb_express` VALUES ('61', 'lqht', '恒通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('62', 'jinguangsudikuaijian', '京广速递快件', '1', '0');
INSERT INTO `eb_express` VALUES ('63', 'junfengguoji', '骏丰国际速递', '1', '0');
INSERT INTO `eb_express` VALUES ('64', 'jiajiatong56', '佳家通', '1', '0');
INSERT INTO `eb_express` VALUES ('65', 'jrypex', '吉日优派', '1', '0');
INSERT INTO `eb_express` VALUES ('66', 'jinchengwuliu', '锦程国际物流', '1', '0');
INSERT INTO `eb_express` VALUES ('67', 'jgwl', '景光物流', '1', '0');
INSERT INTO `eb_express` VALUES ('68', 'pzhjst', '急顺通', '1', '0');
INSERT INTO `eb_express` VALUES ('69', 'ruexp', '捷网俄全通', '1', '0');
INSERT INTO `eb_express` VALUES ('70', 'jmjss', '金马甲', '1', '0');
INSERT INTO `eb_express` VALUES ('71', 'lanhu', '蓝弧快递', '1', '0');
INSERT INTO `eb_express` VALUES ('72', 'ltexp', '乐天速递', '1', '0');
INSERT INTO `eb_express` VALUES ('73', 'lutong', '鲁通快运', '1', '0');
INSERT INTO `eb_express` VALUES ('74', 'ledii', '乐递供应链', '1', '0');
INSERT INTO `eb_express` VALUES ('75', 'lundao', '论道国际物流', '1', '0');
INSERT INTO `eb_express` VALUES ('76', 'mailikuaidi', '麦力快递', '1', '0');
INSERT INTO `eb_express` VALUES ('77', 'mchy', '木春货运', '1', '0');
INSERT INTO `eb_express` VALUES ('78', 'meiquick', '美快国际物流', '1', '0');
INSERT INTO `eb_express` VALUES ('79', 'valueway', '美通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('80', 'nuoyaao', '偌亚奥国际', '1', '0');
INSERT INTO `eb_express` VALUES ('81', 'euasia', '欧亚专线', '1', '0');
INSERT INTO `eb_express` VALUES ('82', 'pca', '澳大利亚PCA快递', '1', '0');
INSERT INTO `eb_express` VALUES ('83', 'pingandatengfei', '平安达腾飞', '1', '0');
INSERT INTO `eb_express` VALUES ('84', 'pjbest', '品骏快递', '1', '0');
INSERT INTO `eb_express` VALUES ('85', 'qbexpress', '秦邦快运', '1', '0');
INSERT INTO `eb_express` VALUES ('86', 'quanxintong', '全信通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('87', 'quansutong', '全速通国际快递', '1', '0');
INSERT INTO `eb_express` VALUES ('88', 'qinyuan', '秦远物流', '1', '0');
INSERT INTO `eb_express` VALUES ('89', 'qichen', '启辰国际物流', '1', '0');
INSERT INTO `eb_express` VALUES ('90', 'quansu', '全速快运', '1', '0');
INSERT INTO `eb_express` VALUES ('91', 'qzx56', '全之鑫物流', '1', '0');
INSERT INTO `eb_express` VALUES ('92', 'qskdyxgs', '千顺快递', '1', '0');
INSERT INTO `eb_express` VALUES ('93', 'runhengfeng', '全时速运', '1', '0');
INSERT INTO `eb_express` VALUES ('94', 'rytsd', '日益通速递', '1', '0');
INSERT INTO `eb_express` VALUES ('95', 'ruidaex', '瑞达国际速递', '1', '0');
INSERT INTO `eb_express` VALUES ('96', 'shiyun', '世运快递', '1', '0');
INSERT INTO `eb_express` VALUES ('97', 'sfift', '十方通物流', '1', '0');
INSERT INTO `eb_express` VALUES ('98', 'stkd', '顺通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('99', 'bgn', '布谷鸟快递', '1', '0');
INSERT INTO `eb_express` VALUES ('100', 'jiahuier', '佳惠尔快递', '1', '0');
INSERT INTO `eb_express` VALUES ('101', 'pingyou', '小包', '1', '0');
INSERT INTO `eb_express` VALUES ('102', 'yumeijie', '誉美捷快递', '1', '0');
INSERT INTO `eb_express` VALUES ('103', 'meilong', '美龙快递', '1', '0');
INSERT INTO `eb_express` VALUES ('104', 'guangtong', '广通速递', '1', '0');
INSERT INTO `eb_express` VALUES ('105', 'STARS', '星晨急便', '1', '0');
INSERT INTO `eb_express` VALUES ('106', 'NANHANG', '中国南方航空股份有限公司', '1', '0');
INSERT INTO `eb_express` VALUES ('107', 'lanbiao', '蓝镖快递', '1', '0');
INSERT INTO `eb_express` VALUES ('109', 'baotongda', '宝通达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('110', 'dashun', '大顺物流', '1', '0');
INSERT INTO `eb_express` VALUES ('111', 'dada', '大达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('112', 'fangfangda', '方方达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('113', 'hebeijianhua', '河北建华物流', '1', '0');
INSERT INTO `eb_express` VALUES ('114', 'haolaiyun', '好来运快递', '1', '0');
INSERT INTO `eb_express` VALUES ('115', 'jinyue', '晋越快递', '1', '0');
INSERT INTO `eb_express` VALUES ('116', 'kuaitao', '快淘快递', '1', '0');
INSERT INTO `eb_express` VALUES ('117', 'peixing', '陪行物流', '1', '0');
INSERT INTO `eb_express` VALUES ('118', 'hkpost', '香港邮政', '1', '0');
INSERT INTO `eb_express` VALUES ('119', 'ytfh', '一统飞鸿快递', '1', '0');
INSERT INTO `eb_express` VALUES ('120', 'zhongxinda', '中信达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('121', 'zhongtian', '中天快运', '1', '0');
INSERT INTO `eb_express` VALUES ('122', 'zuochuan', '佐川急便', '1', '0');
INSERT INTO `eb_express` VALUES ('123', 'chengguang', '程光快递', '1', '0');
INSERT INTO `eb_express` VALUES ('124', 'cszx', '城市之星', '1', '0');
INSERT INTO `eb_express` VALUES ('125', 'chuanzhi', '传志快递', '1', '0');
INSERT INTO `eb_express` VALUES ('126', 'feibao', '飞豹快递', '1', '0');
INSERT INTO `eb_express` VALUES ('127', 'huiqiang', '汇强快递', '1', '0');
INSERT INTO `eb_express` VALUES ('128', 'lejiedi', '乐捷递', '1', '0');
INSERT INTO `eb_express` VALUES ('129', 'lijisong', '成都立即送快递', '1', '0');
INSERT INTO `eb_express` VALUES ('130', 'minbang', '民邦速递', '1', '0');
INSERT INTO `eb_express` VALUES ('131', 'ocs', 'OCS国际快递', '1', '0');
INSERT INTO `eb_express` VALUES ('132', 'santai', '三态速递', '1', '0');
INSERT INTO `eb_express` VALUES ('133', 'saiaodi', '赛澳递', '1', '0');
INSERT INTO `eb_express` VALUES ('134', 'jingdong', '京东快递', '1', '0');
INSERT INTO `eb_express` VALUES ('135', 'zengyi', '增益快递', '1', '0');
INSERT INTO `eb_express` VALUES ('136', 'fanyu', '凡宇速递', '1', '0');
INSERT INTO `eb_express` VALUES ('137', 'fengda', '丰达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('138', 'coe', '东方快递', '1', '0');
INSERT INTO `eb_express` VALUES ('139', 'ees', '百福东方快递', '1', '0');
INSERT INTO `eb_express` VALUES ('140', 'disifang', '递四方速递', '1', '0');
INSERT INTO `eb_express` VALUES ('141', 'rufeng', '如风达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('142', 'changtong', '长通物流', '1', '0');
INSERT INTO `eb_express` VALUES ('143', 'chengshi100', '城市100快递', '1', '0');
INSERT INTO `eb_express` VALUES ('144', 'feibang', '飞邦物流', '1', '0');
INSERT INTO `eb_express` VALUES ('145', 'haosheng', '昊盛物流', '1', '0');
INSERT INTO `eb_express` VALUES ('146', 'yinsu', '音速速运', '1', '0');
INSERT INTO `eb_express` VALUES ('147', 'kuanrong', '宽容物流', '1', '0');
INSERT INTO `eb_express` VALUES ('148', 'tongcheng', '通成物流', '1', '0');
INSERT INTO `eb_express` VALUES ('149', 'tonghe', '通和天下物流', '1', '0');
INSERT INTO `eb_express` VALUES ('150', 'zhima', '芝麻开门', '1', '0');
INSERT INTO `eb_express` VALUES ('151', 'ririshun', '日日顺物流', '1', '0');
INSERT INTO `eb_express` VALUES ('152', 'anxun', '安迅物流', '1', '0');
INSERT INTO `eb_express` VALUES ('153', 'baiqian', '百千诚国际物流', '1', '0');
INSERT INTO `eb_express` VALUES ('154', 'chukouyi', '出口易', '1', '0');
INSERT INTO `eb_express` VALUES ('155', 'diantong', '店通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('156', 'dajin', '大金物流', '1', '0');
INSERT INTO `eb_express` VALUES ('157', 'feite', '飞特物流', '1', '0');
INSERT INTO `eb_express` VALUES ('159', 'gnxb', '国内小包', '1', '0');
INSERT INTO `eb_express` VALUES ('160', 'huacheng', '华诚物流', '1', '0');
INSERT INTO `eb_express` VALUES ('161', 'huahan', '华翰物流', '1', '0');
INSERT INTO `eb_express` VALUES ('162', 'hengyu', '恒宇运通', '1', '0');
INSERT INTO `eb_express` VALUES ('163', 'huahang', '华航快递', '1', '0');
INSERT INTO `eb_express` VALUES ('164', 'jiuyi', '久易快递', '1', '0');
INSERT INTO `eb_express` VALUES ('165', 'jiete', '捷特快递', '1', '0');
INSERT INTO `eb_express` VALUES ('166', 'jingshi', '京世物流', '1', '0');
INSERT INTO `eb_express` VALUES ('167', 'kuayue', '跨越快递', '1', '0');
INSERT INTO `eb_express` VALUES ('168', 'mengsu', '蒙速快递', '1', '0');
INSERT INTO `eb_express` VALUES ('169', 'nanbei', '南北快递', '1', '0');
INSERT INTO `eb_express` VALUES ('171', 'pinganda', '平安达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('172', 'ruifeng', '瑞丰速递', '1', '0');
INSERT INTO `eb_express` VALUES ('173', 'rongqing', '荣庆物流', '1', '0');
INSERT INTO `eb_express` VALUES ('174', 'suijia', '穗佳物流', '1', '0');
INSERT INTO `eb_express` VALUES ('175', 'simai', '思迈快递', '1', '0');
INSERT INTO `eb_express` VALUES ('176', 'suteng', '速腾快递', '1', '0');
INSERT INTO `eb_express` VALUES ('177', 'shengbang', '晟邦物流', '1', '0');
INSERT INTO `eb_express` VALUES ('178', 'suchengzhaipei', '速呈宅配', '1', '0');
INSERT INTO `eb_express` VALUES ('179', 'wuhuan', '五环速递', '1', '0');
INSERT INTO `eb_express` VALUES ('180', 'xingchengzhaipei', '星程宅配', '1', '0');
INSERT INTO `eb_express` VALUES ('181', 'yinjie', '顺捷丰达', '1', '0');
INSERT INTO `eb_express` VALUES ('183', 'yanwen', '燕文物流', '1', '0');
INSERT INTO `eb_express` VALUES ('184', 'zongxing', '纵行物流', '1', '0');
INSERT INTO `eb_express` VALUES ('185', 'aae', 'AAE快递', '1', '0');
INSERT INTO `eb_express` VALUES ('186', 'dhl', 'DHL快递', '1', '0');
INSERT INTO `eb_express` VALUES ('187', 'feihu', '飞狐快递', '1', '0');
INSERT INTO `eb_express` VALUES ('188', 'shunfeng', '顺丰速运', '92', '1');
INSERT INTO `eb_express` VALUES ('189', 'spring', '春风物流', '1', '0');
INSERT INTO `eb_express` VALUES ('190', 'yidatong', '易达通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('191', 'PEWKEE', '彪记快递', '1', '0');
INSERT INTO `eb_express` VALUES ('192', 'PHOENIXEXP', '凤凰快递', '1', '0');
INSERT INTO `eb_express` VALUES ('193', 'CNGLS', 'GLS快递', '1', '0');
INSERT INTO `eb_express` VALUES ('194', 'BHTEXP', '华慧快递', '1', '0');
INSERT INTO `eb_express` VALUES ('195', 'B2B', '卡行天下', '1', '0');
INSERT INTO `eb_express` VALUES ('196', 'PEISI', '配思货运', '1', '0');
INSERT INTO `eb_express` VALUES ('197', 'SUNDAPOST', '上大物流', '1', '0');
INSERT INTO `eb_express` VALUES ('198', 'SUYUE', '苏粤货运', '1', '0');
INSERT INTO `eb_express` VALUES ('199', 'F5XM', '伍圆速递', '1', '0');
INSERT INTO `eb_express` VALUES ('200', 'GZWENJIE', '文捷航空速递', '1', '0');
INSERT INTO `eb_express` VALUES ('201', 'yuancheng', '远成物流', '1', '0');
INSERT INTO `eb_express` VALUES ('202', 'dpex', 'DPEX快递', '1', '0');
INSERT INTO `eb_express` VALUES ('203', 'anjie', '安捷快递', '1', '0');
INSERT INTO `eb_express` VALUES ('204', 'jldt', '嘉里大通', '1', '0');
INSERT INTO `eb_express` VALUES ('205', 'yousu', '优速快递', '1', '0');
INSERT INTO `eb_express` VALUES ('206', 'wanbo', '万博快递', '1', '0');
INSERT INTO `eb_express` VALUES ('207', 'sure', '速尔物流', '1', '0');
INSERT INTO `eb_express` VALUES ('208', 'sutong', '速通物流', '1', '0');
INSERT INTO `eb_express` VALUES ('209', 'JUNCHUANWL', '骏川物流', '1', '0');
INSERT INTO `eb_express` VALUES ('210', 'guada', '冠达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('211', 'dsu', 'D速快递', '1', '0');
INSERT INTO `eb_express` VALUES ('212', 'LONGSHENWL', '龙胜物流', '1', '0');
INSERT INTO `eb_express` VALUES ('213', 'abc', '爱彼西快递', '1', '0');
INSERT INTO `eb_express` VALUES ('214', 'eyoubao', 'E邮宝', '1', '0');
INSERT INTO `eb_express` VALUES ('215', 'aol', 'AOL快递', '1', '0');
INSERT INTO `eb_express` VALUES ('216', 'jixianda', '急先达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('217', 'haihong', '山东海红快递', '1', '0');
INSERT INTO `eb_express` VALUES ('218', 'feiyang', '飞洋快递', '1', '0');
INSERT INTO `eb_express` VALUES ('219', 'rpx', 'RPX保时达', '1', '0');
INSERT INTO `eb_express` VALUES ('220', 'zhaijisong', '宅急送', '1', '0');
INSERT INTO `eb_express` VALUES ('221', 'tiantian', '天天快递', '99', '0');
INSERT INTO `eb_express` VALUES ('222', 'yunwuliu', '云物流', '1', '0');
INSERT INTO `eb_express` VALUES ('223', 'jiuye', '九曳供应链', '1', '0');
INSERT INTO `eb_express` VALUES ('224', 'bsky', '百世快运', '1', '0');
INSERT INTO `eb_express` VALUES ('225', 'higo', '黑狗物流', '1', '0');
INSERT INTO `eb_express` VALUES ('226', 'arke', '方舟速递', '1', '0');
INSERT INTO `eb_express` VALUES ('227', 'zwsy', '中外速运', '1', '0');
INSERT INTO `eb_express` VALUES ('228', 'jxy', '吉祥邮', '1', '0');
INSERT INTO `eb_express` VALUES ('229', 'aramex', 'Aramex', '1', '0');
INSERT INTO `eb_express` VALUES ('230', 'guotong', '国通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('231', 'jiayi', '佳怡物流', '1', '0');
INSERT INTO `eb_express` VALUES ('232', 'longbang', '龙邦快运', '1', '0');
INSERT INTO `eb_express` VALUES ('233', 'minhang', '民航快递', '1', '0');
INSERT INTO `eb_express` VALUES ('234', 'quanyi', '全一快递', '1', '0');
INSERT INTO `eb_express` VALUES ('235', 'quanchen', '全晨快递', '1', '0');
INSERT INTO `eb_express` VALUES ('236', 'usps', 'USPS快递', '1', '0');
INSERT INTO `eb_express` VALUES ('237', 'xinbang', '新邦物流', '1', '0');
INSERT INTO `eb_express` VALUES ('238', 'yuanzhi', '元智捷诚快递', '1', '0');
INSERT INTO `eb_express` VALUES ('239', 'zhongyou', '中邮物流', '1', '0');
INSERT INTO `eb_express` VALUES ('240', 'yuxin', '宇鑫物流', '1', '0');
INSERT INTO `eb_express` VALUES ('241', 'cnpex', '中环快递', '1', '0');
INSERT INTO `eb_express` VALUES ('242', 'shengfeng', '盛丰物流', '1', '0');
INSERT INTO `eb_express` VALUES ('243', 'yuantong', '圆通速递', '97', '1');
INSERT INTO `eb_express` VALUES ('244', 'jiayunmei', '加运美物流', '1', '0');
INSERT INTO `eb_express` VALUES ('245', 'ywfex', '源伟丰快递', '1', '0');
INSERT INTO `eb_express` VALUES ('246', 'xinfeng', '信丰物流', '1', '0');
INSERT INTO `eb_express` VALUES ('247', 'wanxiang', '万象物流', '1', '0');
INSERT INTO `eb_express` VALUES ('248', 'menduimen', '门对门', '1', '0');
INSERT INTO `eb_express` VALUES ('249', 'mingliang', '明亮物流', '1', '0');
INSERT INTO `eb_express` VALUES ('250', 'fengxingtianxia', '风行天下', '1', '0');
INSERT INTO `eb_express` VALUES ('251', 'gongsuda', '共速达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('252', 'zhongtong', '中通快递', '100', '1');
INSERT INTO `eb_express` VALUES ('253', 'quanritong', '全日通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('254', 'ems', 'EMS', '1', '1');
INSERT INTO `eb_express` VALUES ('255', 'wanjia', '万家物流', '1', '0');
INSERT INTO `eb_express` VALUES ('256', 'yuntong', '运通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('257', 'feikuaida', '飞快达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('258', 'haimeng', '海盟速递', '1', '0');
INSERT INTO `eb_express` VALUES ('259', 'zhongsukuaidi', '中速快件', '1', '0');
INSERT INTO `eb_express` VALUES ('260', 'yuefeng', '越丰快递', '1', '0');
INSERT INTO `eb_express` VALUES ('261', 'shenghui', '盛辉物流', '1', '0');
INSERT INTO `eb_express` VALUES ('262', 'datian', '大田物流', '1', '0');
INSERT INTO `eb_express` VALUES ('263', 'quanjitong', '全际通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('264', 'longlangkuaidi', '隆浪快递', '1', '0');
INSERT INTO `eb_express` VALUES ('265', 'neweggozzo', '新蛋奥硕物流', '1', '0');
INSERT INTO `eb_express` VALUES ('266', 'shentong', '申通快递', '95', '1');
INSERT INTO `eb_express` VALUES ('267', 'haiwaihuanqiu', '海外环球', '1', '0');
INSERT INTO `eb_express` VALUES ('268', 'yad', '源安达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('269', 'jindawuliu', '金大物流', '1', '0');
INSERT INTO `eb_express` VALUES ('270', 'sevendays', '七天连锁', '1', '0');
INSERT INTO `eb_express` VALUES ('271', 'tnt', 'TNT快递', '1', '0');
INSERT INTO `eb_express` VALUES ('272', 'huayu', '天地华宇物流', '1', '0');
INSERT INTO `eb_express` VALUES ('273', 'lianhaotong', '联昊通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('274', 'nengda', '港中能达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('275', 'LBWL', '联邦物流', '1', '0');
INSERT INTO `eb_express` VALUES ('276', 'ontrac', 'onTrac', '1', '0');
INSERT INTO `eb_express` VALUES ('277', 'feihang', '原飞航快递', '1', '0');
INSERT INTO `eb_express` VALUES ('278', 'bangsongwuliu', '邦送物流', '1', '0');
INSERT INTO `eb_express` VALUES ('279', 'huaxialong', '华夏龙物流', '1', '0');
INSERT INTO `eb_express` VALUES ('280', 'ztwy', '中天万运快递', '1', '0');
INSERT INTO `eb_express` VALUES ('281', 'fkd', '飞康达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('282', 'anxinda', '安信达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('283', 'quanfeng', '全峰快递', '1', '0');
INSERT INTO `eb_express` VALUES ('284', 'shengan', '圣安物流', '1', '0');
INSERT INTO `eb_express` VALUES ('285', 'jiaji', '佳吉物流', '1', '0');
INSERT INTO `eb_express` VALUES ('286', 'yunda', '韵达快运', '94', '0');
INSERT INTO `eb_express` VALUES ('287', 'ups', 'UPS快递', '1', '0');
INSERT INTO `eb_express` VALUES ('288', 'debang', '德邦物流', '1', '0');
INSERT INTO `eb_express` VALUES ('289', 'yafeng', '亚风速递', '1', '0');
INSERT INTO `eb_express` VALUES ('290', 'kuaijie', '快捷速递', '98', '0');
INSERT INTO `eb_express` VALUES ('291', 'huitong', '百世快递', '93', '0');
INSERT INTO `eb_express` VALUES ('293', 'aolau', 'AOL澳通速递', '1', '0');
INSERT INTO `eb_express` VALUES ('294', 'anneng', '安能物流', '1', '0');
INSERT INTO `eb_express` VALUES ('295', 'auexpress', '澳邮中国快运', '1', '0');
INSERT INTO `eb_express` VALUES ('296', 'exfresh', '安鲜达', '1', '0');
INSERT INTO `eb_express` VALUES ('297', 'bcwelt', 'BCWELT', '1', '0');
INSERT INTO `eb_express` VALUES ('298', 'youzhengguonei', '挂号信', '1', '0');
INSERT INTO `eb_express` VALUES ('299', 'xiaohongmao', '北青小红帽', '1', '0');
INSERT INTO `eb_express` VALUES ('300', 'lbbk', '宝凯物流', '1', '0');
INSERT INTO `eb_express` VALUES ('301', 'byht', '博源恒通', '1', '0');
INSERT INTO `eb_express` VALUES ('302', 'idada', '百成大达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('303', 'baitengwuliu', '百腾物流', '1', '0');
INSERT INTO `eb_express` VALUES ('304', 'birdex', '笨鸟海淘', '1', '0');
INSERT INTO `eb_express` VALUES ('305', 'bsht', '百事亨通', '1', '0');
INSERT INTO `eb_express` VALUES ('306', 'dayang', '大洋物流快递', '1', '0');
INSERT INTO `eb_express` VALUES ('307', 'dechuangwuliu', '德创物流', '1', '0');
INSERT INTO `eb_express` VALUES ('308', 'donghanwl', '东瀚物流', '1', '0');
INSERT INTO `eb_express` VALUES ('309', 'dfpost', '达方物流', '1', '0');
INSERT INTO `eb_express` VALUES ('310', 'dongjun', '东骏快捷物流', '1', '0');
INSERT INTO `eb_express` VALUES ('311', 'dindon', '叮咚澳洲转运', '1', '0');
INSERT INTO `eb_express` VALUES ('312', 'dazhong', '大众佐川急便', '1', '0');
INSERT INTO `eb_express` VALUES ('313', 'decnlh', '德中快递', '1', '0');
INSERT INTO `eb_express` VALUES ('314', 'dekuncn', '德坤供应链', '1', '0');
INSERT INTO `eb_express` VALUES ('315', 'eshunda', '俄顺达', '1', '0');
INSERT INTO `eb_express` VALUES ('316', 'ewe', 'EWE全球快递', '1', '0');
INSERT INTO `eb_express` VALUES ('317', 'fedexuk', 'FedEx英国', '1', '0');
INSERT INTO `eb_express` VALUES ('318', 'fox', 'FOX国际速递', '1', '0');
INSERT INTO `eb_express` VALUES ('319', 'rufengda', '凡客如风达', '1', '0');
INSERT INTO `eb_express` VALUES ('320', 'fandaguoji', '颿达国际快递', '1', '0');
INSERT INTO `eb_express` VALUES ('321', 'hnfy', '飞鹰物流', '1', '0');
INSERT INTO `eb_express` VALUES ('322', 'flysman', '飞力士物流', '1', '0');
INSERT INTO `eb_express` VALUES ('323', 'sccod', '丰程物流', '1', '0');
INSERT INTO `eb_express` VALUES ('324', 'farlogistis', '泛远国际物流', '1', '0');
INSERT INTO `eb_express` VALUES ('325', 'gsm', 'GSM', '1', '0');
INSERT INTO `eb_express` VALUES ('326', 'gaticn', 'GATI快递', '1', '0');
INSERT INTO `eb_express` VALUES ('327', 'gts', 'GTS快递', '1', '0');
INSERT INTO `eb_express` VALUES ('328', 'gangkuai', '港快速递', '1', '0');
INSERT INTO `eb_express` VALUES ('329', 'gtsd', '高铁速递', '1', '0');
INSERT INTO `eb_express` VALUES ('330', 'tiandihuayu', '华宇物流', '1', '0');
INSERT INTO `eb_express` VALUES ('331', 'huangmajia', '黄马甲快递', '1', '0');
INSERT INTO `eb_express` VALUES ('332', 'ucs', '合众速递', '1', '0');
INSERT INTO `eb_express` VALUES ('333', 'huoban', '伙伴物流', '1', '0');
INSERT INTO `eb_express` VALUES ('334', 'nedahm', '红马速递', '1', '0');
INSERT INTO `eb_express` VALUES ('335', 'huiwen', '汇文配送', '1', '0');
INSERT INTO `eb_express` VALUES ('336', 'nmhuahe', '华赫物流', '1', '0');
INSERT INTO `eb_express` VALUES ('337', 'hangyu', '航宇快递', '1', '0');
INSERT INTO `eb_express` VALUES ('338', 'minsheng', '闽盛物流', '1', '0');
INSERT INTO `eb_express` VALUES ('339', 'riyu', '日昱物流', '1', '0');
INSERT INTO `eb_express` VALUES ('340', 'sxhongmajia', '山西红马甲', '1', '0');
INSERT INTO `eb_express` VALUES ('341', 'syjiahuier', '沈阳佳惠尔', '1', '0');
INSERT INTO `eb_express` VALUES ('342', 'shlindao', '上海林道货运', '1', '0');
INSERT INTO `eb_express` VALUES ('343', 'shunjiefengda', '顺捷丰达', '1', '0');
INSERT INTO `eb_express` VALUES ('344', 'subida', '速必达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('345', 'bphchina', '速方国际物流', '1', '0');
INSERT INTO `eb_express` VALUES ('346', 'sendtochina', '速递中国', '1', '0');
INSERT INTO `eb_express` VALUES ('347', 'suning', '苏宁快递', '1', '0');
INSERT INTO `eb_express` VALUES ('348', 'sihaiet', '四海快递', '1', '0');
INSERT INTO `eb_express` VALUES ('349', 'tianzong', '天纵物流', '1', '0');
INSERT INTO `eb_express` VALUES ('350', 'chinatzx', '同舟行物流', '1', '0');
INSERT INTO `eb_express` VALUES ('351', 'nntengda', '腾达速递', '1', '0');
INSERT INTO `eb_express` VALUES ('352', 'sd138', '泰国138', '1', '0');
INSERT INTO `eb_express` VALUES ('353', 'tongdaxing', '通达兴物流', '1', '0');
INSERT INTO `eb_express` VALUES ('354', 'tlky', '天联快运', '1', '0');
INSERT INTO `eb_express` VALUES ('355', 'youshuwuliu', 'UC优速快递', '1', '0');
INSERT INTO `eb_express` VALUES ('356', 'ueq', 'UEQ快递', '1', '0');
INSERT INTO `eb_express` VALUES ('357', 'weitepai', '微特派快递', '1', '0');
INSERT INTO `eb_express` VALUES ('358', 'wtdchina', '威时沛运', '1', '0');
INSERT INTO `eb_express` VALUES ('359', 'wzhaunyun', '微转运', '1', '0');
INSERT INTO `eb_express` VALUES ('360', 'gswtkd', '万通快递', '1', '0');
INSERT INTO `eb_express` VALUES ('361', 'wotu', '渥途国际速运', '1', '0');
INSERT INTO `eb_express` VALUES ('362', 'xiyoute', '希优特快递', '1', '0');
INSERT INTO `eb_express` VALUES ('363', 'xilaikd', '喜来快递', '1', '0');
INSERT INTO `eb_express` VALUES ('364', 'xsrd', '鑫世锐达', '1', '0');
INSERT INTO `eb_express` VALUES ('365', 'xtb', '鑫通宝物流', '1', '0');
INSERT INTO `eb_express` VALUES ('366', 'xintianjie', '信天捷快递', '1', '0');
INSERT INTO `eb_express` VALUES ('367', 'xaetc', '西安胜峰', '1', '0');
INSERT INTO `eb_express` VALUES ('368', 'xianfeng', '先锋快递', '1', '0');
INSERT INTO `eb_express` VALUES ('369', 'sunspeedy', '新速航', '1', '0');
INSERT INTO `eb_express` VALUES ('370', 'xipost', '西邮寄', '1', '0');
INSERT INTO `eb_express` VALUES ('371', 'sinatone', '信联通', '1', '0');
INSERT INTO `eb_express` VALUES ('372', 'sunjex', '新杰物流', '1', '0');
INSERT INTO `eb_express` VALUES ('373', 'yundaexus', '韵达美国件', '1', '0');
INSERT INTO `eb_express` VALUES ('374', 'yxwl', '宇鑫物流', '1', '0');
INSERT INTO `eb_express` VALUES ('375', 'yitongda', '易通达', '1', '0');
INSERT INTO `eb_express` VALUES ('376', 'yiqiguojiwuliu', '一柒物流', '1', '0');
INSERT INTO `eb_express` VALUES ('377', 'yilingsuyun', '亿领速运', '1', '0');
INSERT INTO `eb_express` VALUES ('378', 'yujiawuliu', '煜嘉物流', '1', '0');
INSERT INTO `eb_express` VALUES ('379', 'gml', '英脉物流', '1', '0');
INSERT INTO `eb_express` VALUES ('380', 'leopard', '云豹国际货运', '1', '0');
INSERT INTO `eb_express` VALUES ('381', 'czwlyn', '云南中诚', '1', '0');
INSERT INTO `eb_express` VALUES ('382', 'sdyoupei', '优配速运', '1', '0');
INSERT INTO `eb_express` VALUES ('383', 'yongchang', '永昌物流', '1', '0');
INSERT INTO `eb_express` VALUES ('384', 'yufeng', '御风速运', '1', '0');
INSERT INTO `eb_express` VALUES ('385', 'yamaxunwuliu', '亚马逊物流', '1', '0');
INSERT INTO `eb_express` VALUES ('386', 'yousutongda', '优速通达', '1', '0');
INSERT INTO `eb_express` VALUES ('387', 'yishunhang', '亿顺航', '1', '0');
INSERT INTO `eb_express` VALUES ('388', 'yongwangda', '永旺达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('389', 'ecmscn', '易满客', '1', '0');
INSERT INTO `eb_express` VALUES ('390', 'yingchao', '英超物流', '1', '0');
INSERT INTO `eb_express` VALUES ('391', 'edlogistics', '益递物流', '1', '0');
INSERT INTO `eb_express` VALUES ('392', 'yyexpress', '远洋国际', '1', '0');
INSERT INTO `eb_express` VALUES ('393', 'onehcang', '一号仓', '1', '0');
INSERT INTO `eb_express` VALUES ('394', 'ycgky', '远成快运', '1', '0');
INSERT INTO `eb_express` VALUES ('395', 'lineone', '一号线', '1', '0');
INSERT INTO `eb_express` VALUES ('396', 'ypsd', '壹品速递', '1', '0');
INSERT INTO `eb_express` VALUES ('397', 'vipexpress', '鹰运国际速递', '1', '0');
INSERT INTO `eb_express` VALUES ('398', 'el56', '易联通达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('399', 'yyqc56', '一运全成物流', '1', '0');
INSERT INTO `eb_express` VALUES ('400', 'zhongtie', '中铁快运', '1', '0');
INSERT INTO `eb_express` VALUES ('401', 'ZTKY', '中铁物流', '1', '0');
INSERT INTO `eb_express` VALUES ('402', 'zzjh', '郑州建华快递', '1', '0');
INSERT INTO `eb_express` VALUES ('403', 'zhongruisudi', '中睿速递', '1', '0');
INSERT INTO `eb_express` VALUES ('404', 'zhongwaiyun', '中外运速递', '1', '0');
INSERT INTO `eb_express` VALUES ('405', 'zengyisudi', '增益速递', '1', '0');
INSERT INTO `eb_express` VALUES ('406', 'sujievip', '郑州速捷', '1', '0');
INSERT INTO `eb_express` VALUES ('407', 'zhichengtongda', '至诚通达快递', '1', '0');
INSERT INTO `eb_express` VALUES ('408', 'zhdwl', '众辉达物流', '1', '0');
INSERT INTO `eb_express` VALUES ('409', 'kuachangwuliu', '直邮易', '1', '0');
INSERT INTO `eb_express` VALUES ('410', 'topspeedex', '中运全速', '1', '0');
INSERT INTO `eb_express` VALUES ('411', 'otobv', '中欧快运', '1', '0');
INSERT INTO `eb_express` VALUES ('412', 'zsky123', '准实快运', '1', '0');
INSERT INTO `eb_express` VALUES ('413', 'donghong', '东红物流', '1', '0');
INSERT INTO `eb_express` VALUES ('414', 'kuaiyouda', '快优达速递', '1', '0');
INSERT INTO `eb_express` VALUES ('415', 'balunzhi', '巴伦支快递', '1', '0');
INSERT INTO `eb_express` VALUES ('416', 'hutongwuliu', '户通物流', '1', '0');
INSERT INTO `eb_express` VALUES ('417', 'xianchenglian', '西安城联速递', '1', '0');
INSERT INTO `eb_express` VALUES ('418', 'youbijia', '邮必佳', '1', '0');
INSERT INTO `eb_express` VALUES ('419', 'feiyuan', '飞远物流', '1', '0');
INSERT INTO `eb_express` VALUES ('420', 'chengji', '城际速递', '1', '0');
INSERT INTO `eb_express` VALUES ('421', 'huaqi', '华企快运', '1', '0');
INSERT INTO `eb_express` VALUES ('422', 'yibang', '一邦快递', '1', '0');
INSERT INTO `eb_express` VALUES ('423', 'citylink', 'CityLink快递', '1', '0');
INSERT INTO `eb_express` VALUES ('424', 'meixi', '美西快递', '1', '0');
INSERT INTO `eb_express` VALUES ('425', 'acs', 'ACS', '1', '0');

-- ----------------------------
-- Table structure for eb_routine_access_token
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_access_token`;
CREATE TABLE `eb_routine_access_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小程序access_token表ID',
  `access_token` varchar(256) NOT NULL COMMENT 'openid',
  `stop_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='小程序access_token表';

-- ----------------------------
-- Records of eb_routine_access_token
-- ----------------------------
INSERT INTO `eb_routine_access_token` VALUES ('1', '20_z3MAutcbznCSyQPqMVOQVRUktcvLYUXAAICpCMXkpu5rLoVnBB0u88rnJr1sWDJlwj-S6aVhmswmLdW86e9Bg2ugd3BOayE6ntY6FfckSXWgvW2y5N0bLkBxHpCjJH2bQpuvnmMIZr08G32hWSQfACAZVT', '1554809658');

-- ----------------------------
-- Table structure for eb_routine_form_id
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_form_id`;
CREATE TABLE `eb_routine_form_id` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单ID表ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `form_id` varchar(36) NOT NULL COMMENT '表单ID',
  `stop_time` int(11) unsigned DEFAULT NULL COMMENT '表单ID失效时间',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态1 未使用 2不能使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='表单id表记录表';

-- ----------------------------
-- Records of eb_routine_form_id
-- ----------------------------

-- ----------------------------
-- Table structure for eb_routine_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_qrcode`;
CREATE TABLE `eb_routine_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) NOT NULL COMMENT '二维码类型 spread(用户推广) product_spread(产品推广)',
  `third_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 0不可用 1可用',
  `add_time` varchar(255) DEFAULT NULL COMMENT '添加时间',
  `page` varchar(255) DEFAULT NULL COMMENT '小程序页面路径带参数',
  `qrcode_url` varchar(255) DEFAULT NULL COMMENT '小程序二维码路径',
  `url_time` int(11) unsigned DEFAULT NULL COMMENT '二维码添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='小程序二维码管理表';

-- ----------------------------
-- Records of eb_routine_qrcode
-- ----------------------------

-- ----------------------------
-- Table structure for eb_routine_template
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_template`;
CREATE TABLE `eb_routine_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) NOT NULL COMMENT '模板编号',
  `name` char(100) NOT NULL COMMENT '模板名',
  `content` varchar(1000) NOT NULL COMMENT '回复内容',
  `tempid` char(100) DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) NOT NULL COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tempkey` (`tempkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='微信模板';

-- ----------------------------
-- Records of eb_routine_template
-- ----------------------------
INSERT INTO `eb_routine_template` VALUES ('13', 'AT0007', '订单发货提醒', '订单号{{keyword1.DATA}}\n快递公司{{keyword2.DATA}}\n快递单号{{keyword3.DATA}}\n发货时间{{keyword4.DATA}}\n备注{{keyword5.DATA}}', 'CyPxnxg-9eRgXoYUKhXY4IqXI4hecaUzgEQGX76OXng', '1534469928', '1');
INSERT INTO `eb_routine_template` VALUES ('14', 'AT0787', '退款成功通知', '订单号{{keyword1.DATA}}\n退款时间{{keyword2.DATA}}\n退款金额{{keyword3.DATA}}\n退款方式{{keyword4.DATA}}\n备注{{keyword5.DATA}}', 'iLHSBbVVtg_ijs-hVABl5p-yaBV8JxpInqXIZy2c5To', '1534469993', '1');
INSERT INTO `eb_routine_template` VALUES ('15', 'AT0009', '订单支付成功通知', '单号{{keyword1.DATA}}\n下单时间{{keyword2.DATA}}\n订单状态{{keyword3.DATA}}\n支付金额{{keyword4.DATA}}\n支付方式{{keyword5.DATA}}', 'bfXGbrwl70jdlvCnO_vZ7AeXVDsziYQW7oGT2KXiDz4', '1534470043', '1');
INSERT INTO `eb_routine_template` VALUES ('16', 'AT1173', '砍价成功通知', '商品名称{{keyword1.DATA}}\n砍价金额{{keyword2.DATA}}\n底价{{keyword3.DATA}}\n砍掉价格{{keyword4.DATA}}\n支付金额{{keyword5.DATA}}\n备注{{keyword6.DATA}}', 'l3JCopf5cgNLXtmziLTxkVTHtImHPmDyHp5wBRZd3SI', '1534470085', '1');
INSERT INTO `eb_routine_template` VALUES ('17', 'AT0036', '退款通知', '订单编号{{keyword1.DATA}}\n退款原因{{keyword2.DATA}}\n退款时间{{keyword3.DATA}}\n退款金额{{keyword4.DATA}}\n退款方式{{keyword5.DATA}}', '14pyhB_6xYAXfEk_iVBbtLWkph0rAqompGPbuDP3CWo', '1534470134', '1');
INSERT INTO `eb_routine_template` VALUES ('19', 'AT2430', '拼团取消通知', '活动名称{{keyword1.DATA}}\n订单编号{{keyword2.DATA}}\n订单金额{{keyword3.DATA}}', 'KynVVBJcoYgaTbcnAKuy5N0YpAa82xZG1KCQIlb-Ws8', '1553910500', '1');
INSERT INTO `eb_routine_template` VALUES ('20', 'AT0310', '拼团失败通知', '商品名称{{keyword1.DATA}}\n失败原因{{keyword2.DATA}}\n订单号{{keyword3.DATA}}\n开团时间{{keyword4.DATA}}\n退款金额{{keyword5.DATA}}', 'uOXsl0qRtuMWhExHGk57Hf_GLkYT6q9m16U0bg95uIQ', '1553910844', '1');
INSERT INTO `eb_routine_template` VALUES ('21', 'AT0051', '拼团成功通知', '活动名称{{keyword1.DATA}}\n团长{{keyword2.DATA}}\n成团时间{{keyword3.DATA}}\n拼团价{{keyword4.DATA}}', '4uXFnRF1jnpG1R0F71JOj-NCnYbGwcI20xgihfx8Xzs', '1553911022', '1');
INSERT INTO `eb_routine_template` VALUES ('22', 'AT0541', '开团成功提醒', '开团时间{{keyword1.DATA}}\n截至时间{{keyword2.DATA}}\n产品名称{{keyword3.DATA}}\n单号{{keyword4.DATA}}\n支付金额{{keyword5.DATA}}', '6rU48pJrJS7Y1MixVyGMfQmrXRtOIZZjJtc7q9kwo24', '1555133496', '1');

-- ----------------------------
-- Table structure for eb_store_bargain
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain`;
CREATE TABLE `eb_store_bargain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价产品ID',
  `product_id` int(11) unsigned NOT NULL COMMENT '关联产品ID',
  `title` varchar(255) NOT NULL COMMENT '砍价活动名称',
  `image` varchar(150) NOT NULL COMMENT '砍价活动图片',
  `unit_name` varchar(16) DEFAULT NULL COMMENT '单位名称',
  `stock` int(11) unsigned DEFAULT NULL COMMENT '库存',
  `sales` int(11) unsigned DEFAULT NULL COMMENT '销量',
  `images` varchar(1000) NOT NULL COMMENT '砍价产品轮播图',
  `start_time` int(11) unsigned NOT NULL COMMENT '砍价开启时间',
  `stop_time` int(11) unsigned NOT NULL COMMENT '砍价结束时间',
  `store_name` varchar(255) DEFAULT NULL COMMENT '砍价产品名称',
  `price` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍价金额',
  `min_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍价商品最低价',
  `num` int(11) unsigned DEFAULT NULL COMMENT '每次购买的砍价产品数量',
  `bargain_max_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '用户每次砍价的最大金额',
  `bargain_min_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '用户每次砍价的最小金额',
  `bargain_num` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '用户每次砍价的次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间)',
  `description` text COMMENT '砍价详情',
  `give_integral` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '反多少积分',
  `info` varchar(255) DEFAULT NULL COMMENT '砍价活动简介',
  `cost` decimal(8,2) unsigned DEFAULT NULL COMMENT '成本价',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐0不推荐1推荐',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1删除',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `is_postage` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否包邮 0不包邮 1包邮',
  `postage` decimal(10,2) unsigned DEFAULT NULL COMMENT '邮费',
  `rule` text COMMENT '砍价规则',
  `look` int(11) unsigned DEFAULT '0' COMMENT '砍价产品浏览量',
  `share` int(11) unsigned DEFAULT '0' COMMENT '砍价产品分享量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='砍价表';

-- ----------------------------
-- Records of eb_store_bargain
-- ----------------------------
INSERT INTO `eb_store_bargain` VALUES ('1', '1', '拼团购 无线吸尘器F8 玫瑰金礼盒版', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '件', '988', '12', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '1546272000', '1551283200', '无线吸尘器F8 玫瑰金礼盒版', '999.00', '10.00', '1', '50.00', '1.00', '1', '0', '', '1699.00', '无线吸尘器F8', '100.00', '1', '1', '1', '0', '1', '1.00', '', '73', '0');
INSERT INTO `eb_store_bargain` VALUES ('2', '3', '加湿器 智能 白色', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '件', '999', '1', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '1546272000', '1551283200', '智米加湿器 白色 4L', '249.00', '1.00', '1', '10.00', '0.01', '1', '0', '', '249.00', '加湿器 智能 白色', '10.00', '0', '1', '1', '0', '1', '0.00', '', '15', '0');
INSERT INTO `eb_store_bargain` VALUES ('3', '1', '测试', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '件', '576', '41', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '1553011200', '1556553600', '无线吸尘器F8 玫瑰金礼盒版', '2.00', '0.00', '1', '2.00', '1.00', '1', '1', null, '1699.00', '测试', '100.00', '1', '1', '0', null, '1', '1.00', null, '388', '24');
INSERT INTO `eb_store_bargain` VALUES ('4', '2', '测试2', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '件', '992', '15', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '1553011200', '1556553600', '智能马桶盖 AI版', '3.00', '0.00', '1', '2.00', '1.00', '1', '1', '只能马桶限时砍价活动<p></p>', '1999.00', '测试2', '1500.00', '0', '1', '0', null, '1', '0.00', '<p>没人限购一件哦</p><p>活动截止时间：2019-05-01</p><p></p>', '137', '13');
INSERT INTO `eb_store_bargain` VALUES ('5', '3', '砍价活动测试产品', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '件', '999', '41', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '1554912000', '1555689600', '智米加湿器 白色', '11.00', '0.00', '1', '3.00', '2.00', '1', '1', null, '249.00', '砍价活动测试产品', '10.00', '0', '1', '0', null, '1', '0.00', null, '5', '2');
INSERT INTO `eb_store_bargain` VALUES ('6', '4', '10人砍价', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '件', '418', '82', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '1554825600', '1556553600', '互联网电热水器1A', '100.00', '0.00', '1', '11.00', '9.00', '1', '1', null, '999.00', '10人砍价', '888.00', '0', '1', '0', null, '1', '0.00', null, '46', '5');

-- ----------------------------
-- Table structure for eb_store_bargain_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain_user`;
CREATE TABLE `eb_store_bargain_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户参与砍价表ID',
  `uid` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `bargain_id` int(11) unsigned DEFAULT NULL COMMENT '砍价产品id',
  `bargain_price_min` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍价的最低价',
  `bargain_price` decimal(8,2) DEFAULT NULL COMMENT '砍价金额',
  `price` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍掉的价格',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1参与中 2 活动结束参与失败 3活动结束参与成功',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '参与时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否取消',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户参与砍价表';

-- ----------------------------
-- Records of eb_store_bargain_user
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_bargain_user_help
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain_user_help`;
CREATE TABLE `eb_store_bargain_user_help` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价用户帮助表ID',
  `uid` int(11) unsigned DEFAULT NULL COMMENT '帮助的用户id',
  `bargain_id` int(11) unsigned DEFAULT NULL COMMENT '砍价产品ID',
  `bargain_user_id` int(11) unsigned DEFAULT NULL COMMENT '用户参与砍价表id',
  `price` decimal(8,2) unsigned DEFAULT NULL COMMENT '帮助砍价多少金额',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='砍价用户帮助表';

-- ----------------------------
-- Records of eb_store_bargain_user_help
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_cart
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_cart`;
CREATE TABLE `eb_store_cart` (
  `id` bigint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `type` varchar(32) NOT NULL COMMENT '类型',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `product_attr_unique` varchar(16) NOT NULL DEFAULT '' COMMENT '商品属性',
  `cart_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = 未购买 1 = 已购买',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为立即购买',
  `combination_id` int(11) unsigned DEFAULT '0' COMMENT '拼团id',
  `seckill_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀产品ID',
  `bargain_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '砍价id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`uid`) USING BTREE,
  KEY `goods_id` (`product_id`) USING BTREE,
  KEY `uid` (`uid`,`is_pay`) USING BTREE,
  KEY `uid_2` (`uid`,`is_del`) USING BTREE,
  KEY `uid_3` (`uid`,`is_new`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='购物车表';

-- ----------------------------
-- Records of eb_store_cart
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_category`;
CREATE TABLE `eb_store_category` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint(11) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) NOT NULL COMMENT '分类名称',
  `sort` mediumint(11) NOT NULL COMMENT '排序',
  `pic` varchar(128) NOT NULL DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否推荐',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_base` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类表';

-- ----------------------------
-- Records of eb_store_category
-- ----------------------------
INSERT INTO `eb_store_category` VALUES ('1', '0', '热门推荐', '2', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3db8b933d92.jpg', '1', '1547205038');
INSERT INTO `eb_store_category` VALUES ('2', '1', '热门促销', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '1', '1547205055');
INSERT INTO `eb_store_category` VALUES ('3', '1', '折扣专区', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '1', '1547550363');
INSERT INTO `eb_store_category` VALUES ('4', '1', '新品上线', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc6a38fab.jpg', '1', '1553783295');
INSERT INTO `eb_store_category` VALUES ('6', '0', '居家生活', '1', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3db8b933d92.jpg', '1', '1553783609');
INSERT INTO `eb_store_category` VALUES ('7', '6', '床垫', '1', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9de8b7c5cc5.png', '1', '1553784473');
INSERT INTO `eb_store_category` VALUES ('8', '6', '灯具', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9def00c2882.png', '1', '1553784490');
INSERT INTO `eb_store_category` VALUES ('9', '0', '家电电器', '3', '', '1', '1553852206');
INSERT INTO `eb_store_category` VALUES ('10', '0', '手机数码', '4', '', '1', '1553852227');
INSERT INTO `eb_store_category` VALUES ('11', '0', '智能设备', '5', '', '1', '1553852259');
INSERT INTO `eb_store_category` VALUES ('12', '0', '影音音响', '6', '', '1', '1553852288');
INSERT INTO `eb_store_category` VALUES ('13', '0', '服饰鞋帽', '7', '', '1', '1553852314');
INSERT INTO `eb_store_category` VALUES ('14', '0', '餐厨厨房', '8', '', '1', '1553852353');
INSERT INTO `eb_store_category` VALUES ('15', '0', '洗护健康', '9', '', '1', '1553852370');
INSERT INTO `eb_store_category` VALUES ('16', '0', '日杂用品', '10', '', '1', '1553852390');
INSERT INTO `eb_store_category` VALUES ('17', '0', '出行交通', '11', '', '1', '1553852413');
INSERT INTO `eb_store_category` VALUES ('18', '0', '配件设备', '13', '', '1', '1553852458');
INSERT INTO `eb_store_category` VALUES ('19', '6', '家具', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9def5fa968c.png', '1', '1553854308');
INSERT INTO `eb_store_category` VALUES ('20', '6', '床品件套', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9df11e13742.png', '1', '1553854755');
INSERT INTO `eb_store_category` VALUES ('21', '6', '家饰花卉', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9df170010cb.png', '1', '1553854835');
INSERT INTO `eb_store_category` VALUES ('22', '6', '布艺软装', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9df1b8f0a7a.png', '1', '1553854908');

-- ----------------------------
-- Table structure for eb_store_combination
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination`;
CREATE TABLE `eb_store_combination` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `mer_id` int(10) unsigned DEFAULT '0' COMMENT '商户id',
  `image` varchar(255) NOT NULL COMMENT '推荐图',
  `images` varchar(1000) NOT NULL COMMENT '轮播图',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `attr` varchar(255) DEFAULT NULL COMMENT '活动属性',
  `people` int(2) unsigned NOT NULL COMMENT '参团人数',
  `info` varchar(255) NOT NULL COMMENT '简介',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `stock` int(10) unsigned NOT NULL COMMENT '库存',
  `add_time` varchar(128) NOT NULL COMMENT '添加时间',
  `is_host` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐',
  `is_show` tinyint(1) unsigned NOT NULL COMMENT '产品状态',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `combination` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `mer_use` tinyint(1) unsigned DEFAULT NULL COMMENT '商户是否可用1可用0不可用',
  `is_postage` tinyint(1) unsigned NOT NULL COMMENT '是否包邮1是0否',
  `postage` decimal(10,2) unsigned NOT NULL COMMENT '邮费',
  `description` text NOT NULL COMMENT '拼团内容',
  `start_time` int(11) unsigned NOT NULL COMMENT '拼团开始时间',
  `stop_time` int(11) unsigned NOT NULL COMMENT '拼团结束时间',
  `cost` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拼图产品成本',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `unit_name` varchar(32) NOT NULL COMMENT '单位名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='拼团产品表';

-- ----------------------------
-- Records of eb_store_combination
-- ----------------------------
INSERT INTO `eb_store_combination` VALUES ('1', '1', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '3人团 无线吸尘器F8 玫瑰金礼盒版', '', '3', '年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元', '1.00', '0', '20', '980', '1547554180', '1', '1', '1', '1', '0', '1', '1.00', '', '1546272000', '1551283200', '0', '4', '');
INSERT INTO `eb_store_combination` VALUES ('2', '3', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '', '6', '智米加湿器 白色', '199.00', '0', '0', '999', '1547554327', '1', '1', '1', '1', '0', '1', '0.00', '', '1546272000', '1551283200', '0', '3', '');
INSERT INTO `eb_store_combination` VALUES ('3', '2', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版', '', '10', '智能马桶盖 AI版', '499.00', '0', '8', '992', '1547554596', '1', '1', '1', '1', '0', '1', '0.00', '', '1546272000', '1551283200', '0', '3', '');
INSERT INTO `eb_store_combination` VALUES ('4', '3', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '测试', null, '2', '测试', '0.01', '0', '537', '463', '1554909810', '1', '1', '0', '1', null, '1', '0.00', '', '1554825600', '1559232000', '0', '0', '');
INSERT INTO `eb_store_combination` VALUES ('5', '1', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '5人团：无线吸尘器F8 玫瑰金礼盒版', null, '5', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', '0.01', '0', '231', '5858', '1555125024', '1', '1', '0', '1', null, '1', '1.00', '', '1554998400', '1556553600', '0', '0', '');
INSERT INTO `eb_store_combination` VALUES ('6', '2', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '10人团：智能马桶盖 AI版', null, '10', '智能马桶盖 AI版', '0.01', '0', '53', '9934', '1555125049', '1', '1', '0', '1', null, '1', '0.00', '', '1554998400', '1556553600', '0', '0', '');

-- ----------------------------
-- Table structure for eb_store_combination_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination_attr`;
CREATE TABLE `eb_store_combination_attr` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) NOT NULL COMMENT '属性值',
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品属性表';

-- ----------------------------
-- Records of eb_store_combination_attr
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_combination_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination_attr_result`;
CREATE TABLE `eb_store_combination_attr_result` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `result` text NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) unsigned NOT NULL COMMENT '上次修改时间',
  UNIQUE KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品属性详情表';

-- ----------------------------
-- Records of eb_store_combination_attr_result
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_combination_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination_attr_value`;
CREATE TABLE `eb_store_combination_attr_value` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `suk` varchar(128) NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `unique` char(8) NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  KEY `store_id` (`product_id`,`suk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品属性值表';

-- ----------------------------
-- Records of eb_store_combination_attr_value
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_coupon
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon`;
CREATE TABLE `eb_store_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券表ID',
  `title` varchar(64) NOT NULL COMMENT '优惠券名称',
  `integral` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '兑换消耗积分值',
  `coupon_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '兑换的优惠券面值',
  `use_min_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低消费多少金额可用优惠券',
  `coupon_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券有效期限（单位：天）',
  `sort` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0：关闭，1：开启）',
  `add_time` int(11) unsigned NOT NULL COMMENT '兑换项目添加时间',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `state` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `coupon_time` (`coupon_time`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='优惠券表';

-- ----------------------------
-- Records of eb_store_coupon
-- ----------------------------
INSERT INTO `eb_store_coupon` VALUES ('1', '测试优惠券满10减9.9', '0', '9.90', '1.00', '100', '1', '0', '1547714661', '1');
INSERT INTO `eb_store_coupon` VALUES ('2', '你好', '0', '3.00', '4.00', '100', '0', '1', '1547714872', '1');
INSERT INTO `eb_store_coupon` VALUES ('3', '迷惑', '0', '5.00', '1.00', '100', '0', '0', '1547714900', '1');
INSERT INTO `eb_store_coupon` VALUES ('4', '测试 2019.3.21.21.22', '0', '1.00', '0.00', '10', '0', '1', '1553174564', '0');
INSERT INTO `eb_store_coupon` VALUES ('5', '20元优惠券满100可用', '0', '20.00', '100.00', '100', '0', '1', '1553910760', '0');

-- ----------------------------
-- Table structure for eb_store_coupon_issue
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_issue`;
CREATE TABLE `eb_store_coupon_issue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL COMMENT '优惠券ID',
  `start_time` int(10) DEFAULT NULL COMMENT '优惠券领取开启时间',
  `end_time` int(10) DEFAULT NULL COMMENT '优惠券领取结束时间',
  `total_count` int(10) DEFAULT NULL COMMENT '优惠券领取数量',
  `remain_count` int(10) DEFAULT NULL COMMENT '优惠券剩余领取数量',
  `is_permanent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否无限张数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 正常 0 未开启 -1 已无效',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) DEFAULT NULL COMMENT '优惠券添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `start_time` (`start_time`,`end_time`) USING BTREE,
  KEY `remain_count` (`remain_count`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='优惠券前台领取表';

-- ----------------------------
-- Records of eb_store_coupon_issue
-- ----------------------------
INSERT INTO `eb_store_coupon_issue` VALUES ('1', '2', '1547654400', '1547827200', '10', '5', '0', '1', '1', '1547714939');
INSERT INTO `eb_store_coupon_issue` VALUES ('2', '4', '0', '0', '5', '-6', '0', '1', '0', '1553174582');
INSERT INTO `eb_store_coupon_issue` VALUES ('3', '4', '0', '0', '10', '-10', '0', '1', '0', '1553825963');
INSERT INTO `eb_store_coupon_issue` VALUES ('4', '4', '0', '0', '100', '63', '0', '1', '0', '1553833182');
INSERT INTO `eb_store_coupon_issue` VALUES ('5', '4', '1553788800', '1559232000', '0', '0', '0', '1', '0', '1553910539');
INSERT INTO `eb_store_coupon_issue` VALUES ('6', '5', '0', '0', '0', '0', '0', '1', '0', '1553910772');

-- ----------------------------
-- Table structure for eb_store_coupon_issue_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_issue_user`;
CREATE TABLE `eb_store_coupon_issue_user` (
  `uid` int(10) DEFAULT NULL COMMENT '领取优惠券用户ID',
  `issue_coupon_id` int(10) DEFAULT NULL COMMENT '优惠券前台领取ID',
  `add_time` int(10) DEFAULT NULL COMMENT '领取时间',
  UNIQUE KEY `uid` (`uid`,`issue_coupon_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='优惠券前台用户领取记录表';

-- ----------------------------
-- Records of eb_store_coupon_issue_user
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_user`;
CREATE TABLE `eb_store_coupon_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券发放记录id',
  `cid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '兑换的项目id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券所属用户',
  `coupon_title` varchar(32) NOT NULL COMMENT '优惠券名称',
  `coupon_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠券的面值',
  `use_min_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低消费多少金额可用优惠券',
  `add_time` int(11) unsigned NOT NULL COMMENT '优惠券创建时间',
  `end_time` int(11) unsigned NOT NULL COMMENT '优惠券结束时间',
  `use_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
  `type` varchar(32) NOT NULL DEFAULT 'send' COMMENT '获取方式',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：未使用，1：已使用, 2:已过期）',
  `is_fail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `end_time` (`end_time`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_fail` (`is_fail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='优惠券发放记录表';

-- ----------------------------
-- Records of eb_store_coupon_user
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_order
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order`;
CREATE TABLE `eb_store_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_id` varchar(32) NOT NULL COMMENT '订单号',
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `real_name` varchar(32) NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(18) NOT NULL COMMENT '用户电话',
  `user_address` varchar(100) NOT NULL COMMENT '详细地址',
  `cart_id` varchar(256) NOT NULL DEFAULT '[]' COMMENT '购物车id',
  `total_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单商品总数',
  `total_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `total_postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `pay_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际支付金额',
  `pay_postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付邮费',
  `deduction_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '抵扣金额',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `coupon_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `paid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_time` int(11) unsigned DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(32) NOT NULL COMMENT '支付方式',
  `add_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：待评价；-1：已退款）',
  `refund_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 未退款 1 申请中 2 已退款',
  `refund_reason_wap_img` varchar(255) DEFAULT NULL COMMENT '退款图片',
  `refund_reason_wap_explain` varchar(255) DEFAULT NULL COMMENT '退款用户说明',
  `refund_reason_time` int(11) unsigned DEFAULT NULL COMMENT '退款时间',
  `refund_reason_wap` varchar(255) DEFAULT NULL COMMENT '前台退款原因',
  `refund_reason` varchar(255) DEFAULT NULL COMMENT '不退款的理由',
  `refund_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `delivery_name` varchar(64) DEFAULT NULL COMMENT '快递名称/送货人姓名',
  `delivery_type` varchar(32) DEFAULT NULL COMMENT '发货类型',
  `delivery_id` varchar(64) DEFAULT NULL COMMENT '快递单号/手机号',
  `gain_integral` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '消费赚取积分',
  `use_integral` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '使用积分',
  `back_integral` decimal(8,2) unsigned DEFAULT NULL COMMENT '给用户退了多少积分',
  `mark` varchar(512) NOT NULL COMMENT '备注',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `unique` char(32) NOT NULL COMMENT '唯一id(md5加密)类似id',
  `remark` varchar(512) DEFAULT NULL COMMENT '管理员备注',
  `mer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID',
  `is_mer_check` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `combination_id` int(11) unsigned DEFAULT '0' COMMENT '拼团产品id0一般产品',
  `pink_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '拼团id 0没有拼团',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  `seckill_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀产品ID',
  `bargain_id` int(11) unsigned DEFAULT '0' COMMENT '砍价id',
  `is_channel` tinyint(1) unsigned DEFAULT '0' COMMENT '支付渠道(0微信公众号1微信小程序)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id_2` (`order_id`,`uid`) USING BTREE,
  UNIQUE KEY `unique` (`unique`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `pay_price` (`pay_price`) USING BTREE,
  KEY `paid` (`paid`) USING BTREE,
  KEY `pay_time` (`pay_time`) USING BTREE,
  KEY `pay_type` (`pay_type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `coupon_id` (`coupon_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单表';

-- ----------------------------
-- Records of eb_store_order
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_order_cart_info
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order_cart_info`;
CREATE TABLE `eb_store_order_cart_info` (
  `oid` int(11) unsigned NOT NULL COMMENT '订单id',
  `cart_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购物车id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `cart_info` text NOT NULL COMMENT '购买东西的详细信息',
  `unique` char(32) NOT NULL COMMENT '唯一id',
  UNIQUE KEY `oid` (`oid`,`unique`) USING BTREE,
  KEY `cart_id` (`cart_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单购物详情表';

-- ----------------------------
-- Records of eb_store_order_cart_info
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_order_status
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order_status`;
CREATE TABLE `eb_store_order_status` (
  `oid` int(10) unsigned NOT NULL COMMENT '订单id',
  `change_type` varchar(32) NOT NULL COMMENT '操作类型',
  `change_message` varchar(256) NOT NULL COMMENT '操作备注',
  `change_time` int(10) unsigned NOT NULL COMMENT '操作时间',
  KEY `oid` (`oid`) USING BTREE,
  KEY `change_type` (`change_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单操作记录表';

-- ----------------------------
-- Records of eb_store_order_status
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_pink
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_pink`;
CREATE TABLE `eb_store_pink` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id 生成',
  `order_id_key` int(10) unsigned NOT NULL COMMENT '订单id  数据库',
  `total_num` int(10) unsigned NOT NULL COMMENT '购买商品个数',
  `total_price` decimal(10,2) unsigned NOT NULL COMMENT '购买总金额',
  `cid` int(10) unsigned NOT NULL COMMENT '拼团产品id',
  `pid` int(10) unsigned NOT NULL COMMENT '产品id',
  `people` int(10) unsigned NOT NULL COMMENT '拼图总人数',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '拼团产品单价',
  `add_time` varchar(24) NOT NULL COMMENT '开始时间',
  `stop_time` varchar(24) NOT NULL,
  `k_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '团长id 0为团长',
  `is_tpl` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否发送模板消息0未发送1已发送',
  `is_refund` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否退款 0未退款 1已退款',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1进行中2已完成3未完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='拼团表';

-- ----------------------------
-- Records of eb_store_pink
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_product
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product`;
CREATE TABLE `eb_store_product` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `mer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)',
  `image` varchar(128) NOT NULL COMMENT '商品图片',
  `slider_image` varchar(512) NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) NOT NULL COMMENT '商品简介',
  `keyword` varchar(256) NOT NULL COMMENT '关键字',
  `cate_id` varchar(64) NOT NULL COMMENT '分类id',
  `price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `vip_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '会员价格',
  `ot_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `unit_name` varchar(32) NOT NULL COMMENT '单位名',
  `sort` smallint(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `sales` mediumint(11) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `stock` mediumint(11) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热卖',
  `is_benefit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否优惠',
  `is_best` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精品',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `description` text NOT NULL COMMENT '产品描述',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `is_postage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `mer_use` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8,2) unsigned NOT NULL COMMENT '获得积分',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  `is_seckill` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint(1) unsigned DEFAULT NULL COMMENT '砍价状态 0未开启 1开启',
  `ficti` mediumint(11) DEFAULT '100' COMMENT '虚拟销量',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `code_path` varchar(64) NOT NULL COMMENT '产品二维码地址(用户小程序海报)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cate_id` (`cate_id`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_benefit` (`is_benefit`) USING BTREE,
  KEY `is_best` (`is_best`) USING BTREE,
  KEY `is_new` (`is_new`) USING BTREE,
  KEY `toggle_on_sale, is_del` (`is_del`) USING BTREE,
  KEY `price` (`price`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `sales` (`sales`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `is_postage` (`is_postage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品表';

-- ----------------------------
-- Records of eb_store_product
-- ----------------------------
INSERT INTO `eb_store_product` VALUES ('1', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', '无线吸尘器', '2', '0.01', '0.00', '1699.00', '1.00', '件', '1', '240', '586', '1', '1', '0', '1', '1', '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb137d656.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb229e820.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb3b37f84.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb513b06f.jpeg\"/></p>', '1547205504', '1', '0', '0', '1699.00', '100.00', '0', '0', '81', '0', '');
INSERT INTO `eb_store_product` VALUES ('2', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版', '智能马桶盖 AI版', '智能马桶', '3', '0.01', '0.00', '1999.00', '0.00', '件', '0', '47', '994', '1', '1', '1', '1', '1', '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbce620415.jpeg\"/></p>', '1547516202', '1', '0', '0', '1999.00', '1500.00', '0', '0', '12', '0', '');
INSERT INTO `eb_store_product` VALUES ('3', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '智米加湿器 白色', '加湿器', '3', '249.00', '0.00', '299.00', '0.00', '件', '0', '43', '999', '1', '1', '1', '1', '1', '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc1730a0c0.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc182bccac.jpg\"/></p>', '1547551009', '1', '0', '0', '249.00', '10.00', '0', '0', '8', '0', '');
INSERT INTO `eb_store_product` VALUES ('4', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\"]', '互联网电热水器1A', '3000w双管速热，动态360L热水用量，双重漏电保护，智能APP操控', '电热水器', '3', '999.00', '0.00', '1599.00', '0.00', '件', '0', '82', '418', '1', '1', '1', '1', '1', '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc286862fd.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc294a9a0a.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc2ba18a77.jpg\"/></p>', '1547551346', '1', '0', '0', '999.00', '888.00', '0', '0', '10', '0', '');
INSERT INTO `eb_store_product` VALUES ('5', '0', 'http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb513b06f.jpeg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/editor\\/20190115\\/5c3dc294a9a0a.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/editor\\/20190115\\/5c3dbb513b06f.jpeg\"]', '测试', '阿萨德啊', '去', '4,7,2,3,19', '1.00', '0.00', '1.00', '0.00', '件', '0', '0', '111', '1', '0', '0', '0', '0', '', '1554863537', '0', '0', '0', '1.00', '1.00', '0', null, '1', '0', '');

-- ----------------------------
-- Table structure for eb_store_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr`;
CREATE TABLE `eb_store_product_attr` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) NOT NULL COMMENT '属性值',
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品属性表';

-- ----------------------------
-- Records of eb_store_product_attr
-- ----------------------------
INSERT INTO `eb_store_product_attr` VALUES ('1', '颜色', '黑色,白色,蓝色');
INSERT INTO `eb_store_product_attr` VALUES ('2', '孔距', '30cm,40cm');
INSERT INTO `eb_store_product_attr` VALUES ('3', '容量', '3L,4L');
INSERT INTO `eb_store_product_attr` VALUES ('3', '颜色', '白色,黑色');

-- ----------------------------
-- Table structure for eb_store_product_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_result`;
CREATE TABLE `eb_store_product_attr_result` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `result` text NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) unsigned NOT NULL COMMENT '上次修改时间',
  UNIQUE KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品属性详情表';

-- ----------------------------
-- Records of eb_store_product_attr_result
-- ----------------------------
INSERT INTO `eb_store_product_attr_result` VALUES ('1', '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u9ed1\\u8272\",\"\\u767d\\u8272\",\"\\u84dd\\u8272\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"100.00\",\"price\":\"0.01\",\"sales\":199,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"cost\":\"100.00\",\"price\":0.02,\"sales\":199,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u84dd\\u8272\"},\"cost\":\"100.00\",\"price\":0.03,\"sales\":199,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"check\":false}]}', '1547713512');
INSERT INTO `eb_store_product_attr_result` VALUES ('2', '{\"attr\":[{\"value\":\"\\u5b54\\u8ddd\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"30cm\",\"40cm\"]}],\"value\":[{\"detail\":{\"\\u5b54\\u8ddd\":\"30cm\"},\"cost\":\"1500.00\",\"price\":\"0.01\",\"sales\":994,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"check\":false},{\"detail\":{\"\\u5b54\\u8ddd\":\"40cm\"},\"cost\":\"1500.00\",\"price\":888,\"sales\":994,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\",\"check\":false}]}', '1547553770');
INSERT INTO `eb_store_product_attr_result` VALUES ('3', '{\"attr\":[{\"value\":\"\\u5bb9\\u91cf\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"3L\",\"4L\"]},{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u767d\\u8272\",\"\\u9ed1\\u8272\"]}],\"value\":[{\"detail\":{\"\\u5bb9\\u91cf\":\"3L\",\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"cost\":\"10.00\",\"price\":248,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"3L\",\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"10.00\",\"price\":249,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"4L\",\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"cost\":\"10.00\",\"price\":289,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"4L\",\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"10.00\",\"price\":299,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"check\":false}]}', '1547553857');

-- ----------------------------
-- Table structure for eb_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_value`;
CREATE TABLE `eb_store_product_attr_value` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `suk` varchar(128) NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `unique` char(8) NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  KEY `store_id` (`product_id`,`suk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品属性值表';

-- ----------------------------
-- Records of eb_store_product_attr_value
-- ----------------------------
INSERT INTO `eb_store_product_attr_value` VALUES ('2', '40cm', '990', '4', '888.00', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc6a38fab.jpg', '19f1d772', '1500.00');
INSERT INTO `eb_store_product_attr_value` VALUES ('1', '黑色', '71', '128', '0.01', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '6af2068e', '100.00');
INSERT INTO `eb_store_product_attr_value` VALUES ('3', '4L,白色', '990', '9', '289.00', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '824485b3', '10.00');
INSERT INTO `eb_store_product_attr_value` VALUES ('1', '白色', '169', '30', '0.02', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3db9de2b73a.jpg', 'a84fff47', '100.00');
INSERT INTO `eb_store_product_attr_value` VALUES ('3', '3L,白色', '987', '12', '248.00', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', 'ab6067b3', '10.00');
INSERT INTO `eb_store_product_attr_value` VALUES ('3', '3L,黑色', '993', '6', '249.00', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', 'afb4949f', '10.00');
INSERT INTO `eb_store_product_attr_value` VALUES ('2', '30cm', '957', '37', '0.01', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', 'bae75a3a', '1500.00');
INSERT INTO `eb_store_product_attr_value` VALUES ('3', '4L,黑色', '983', '16', '299.00', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', 'c4b7ce93', '10.00');
INSERT INTO `eb_store_product_attr_value` VALUES ('1', '蓝色', '137', '62', '0.03', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba4187461.jpg', 'f39d47dc', '100.00');

-- ----------------------------
-- Table structure for eb_store_product_cate
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_cate`;
CREATE TABLE `eb_store_product_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品分类辅助表';

-- ----------------------------
-- Records of eb_store_product_cate
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_relation`;
CREATE TABLE `eb_store_product_relation` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `type` varchar(32) NOT NULL COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) NOT NULL COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  UNIQUE KEY `uid` (`uid`,`product_id`,`type`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `category` (`category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品点赞和收藏表';

-- ----------------------------
-- Records of eb_store_product_relation
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_product_reply
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_reply`;
CREATE TABLE `eb_store_product_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `oid` int(11) NOT NULL COMMENT '订单ID',
  `unique` char(32) NOT NULL COMMENT '唯一id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) NOT NULL COMMENT '评论内容',
  `pics` text NOT NULL COMMENT '评论图片',
  `add_time` int(11) NOT NULL COMMENT '评论时间',
  `merchant_reply_content` varchar(300) DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` int(11) DEFAULT NULL COMMENT '管理员回复时间',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id_2` (`oid`,`unique`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `parent_id` (`reply_type`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `product_score` (`product_score`) USING BTREE,
  KEY `service_score` (`service_score`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='评论表';

-- ----------------------------
-- Records of eb_store_product_reply
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_seckill
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill`;
CREATE TABLE `eb_store_seckill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `image` varchar(255) NOT NULL COMMENT '推荐图',
  `images` varchar(1000) NOT NULL COMMENT '轮播图',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `info` varchar(255) NOT NULL COMMENT '简介',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `cost` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本',
  `ot_price` decimal(10,2) unsigned NOT NULL COMMENT '原价',
  `give_integral` decimal(10,2) unsigned NOT NULL COMMENT '返多少积分',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `stock` int(10) unsigned NOT NULL COMMENT '库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `unit_name` varchar(16) NOT NULL COMMENT '单位名',
  `postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `description` text COMMENT '内容',
  `start_time` varchar(128) NOT NULL COMMENT '开始时间',
  `stop_time` varchar(128) NOT NULL COMMENT '结束时间',
  `add_time` varchar(128) NOT NULL COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '热门推荐',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除 0未删除1已删除',
  `num` int(11) unsigned NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `start_time` (`start_time`,`stop_time`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_show` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `is_postage` (`is_postage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品秒杀产品表';

-- ----------------------------
-- Records of eb_store_seckill
-- ----------------------------
INSERT INTO `eb_store_seckill` VALUES ('1', '1', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '手慢无 无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', '0.01', '100.00', '599.00', '1699.00', '1', '953', '47', '件', '0.00', '', '1553702400', '1556553600', '1553847138', '1', '1', '1', '1', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('2', '3', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '智米加湿器 白色', '99.00', '10.00', '249.00', '249.00', '0', '993', '7', '件', '0.00', '', '1551369600', '1556553600', '1553847124', '1', '1', '1', '1', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('3', '2', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版 限时秒杀中', '智能马桶盖 AI版', '0.01', '1500.00', '1599.00', '1999.00', '0', '990', '10', '件', '0.00', '', '1553702400', '1556553600', '1553847112', '1', '1', '1', '1', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('4', '4', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\"]', '互联网电热水器1A', '3000w双管速热，动态360L热水用量，双重漏电保护，智能APP操控', '10.00', '888.00', '999.00', '999.00', '0', '441', '59', '件', '0.00', null, '1554861600', '1554868799', '1554860320', '1', '1', '1', '1', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('5', '1', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '7-10点 无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', '0.01', '100.00', '1.00', '1699.00', '1', '586', '159', '件', '1.00', null, '1554850800', '1554861600', '1554860478', '1', '1', '1', '1', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('6', '2', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '10-12点智能马桶盖 AI版', '智能马桶盖 AI版', '0.01', '1500.00', '100.00', '1999.00', '0', '994', '31', '件', '0.00', null, '1554876000', '1554883200', '1554876551', '1', '1', '1', '1', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('7', '3', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '12-14智米加湿器 白色', '智米加湿器 白色', '0.01', '10.00', '249.00', '249.00', '0', '999', '17', '件', '0.00', null, '1554876000', '1554883200', '1554877858', '1', '1', '1', '1', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('8', '1', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '12-14无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', '0.01', '100.00', '10.00', '1699.00', '1', '586', '173', '件', '1.00', null, '1554998400', '1556553600', '1555148238', '1', '1', '1', '0', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('9', '2', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '14-16智能马桶盖 AI版', '智能马桶盖 AI版', '0.01', '1500.00', '0.01', '1999.00', '0', '994', '33', '件', '0.00', null, '1554876000', '1554883199', '1554887359', '1', '1', '1', '0', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('10', '3', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '智米加湿器 白色', '0.01', '10.00', '249.00', '249.00', '0', '998', '40', '件', '0.00', null, '1554998400', '1556553600', '1555148264', '1', '1', '1', '0', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('11', '2', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版', '智能马桶盖 AI版', '0.01', '1500.00', '0.01', '1999.00', '0', '993', '45', '件', '0.00', null, '1554998400', '1556553600', '1555148291', '1', '1', '1', '0', '1', '1');
INSERT INTO `eb_store_seckill` VALUES ('12', '4', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\"]', '互联网电热水器1A', '3000w双管速热，动态360L热水用量，双重漏电保护，智能APP操控', '1.00', '888.00', '999.00', '999.00', '0', '420', '80', '件', '0.00', null, '1554998400', '1556553600', '1555148278', '1', '1', '1', '0', '1', '1');

-- ----------------------------
-- Table structure for eb_store_seckill_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_attr`;
CREATE TABLE `eb_store_seckill_attr` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) NOT NULL COMMENT '属性值',
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='秒杀商品属性表';

-- ----------------------------
-- Records of eb_store_seckill_attr
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_seckill_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_attr_result`;
CREATE TABLE `eb_store_seckill_attr_result` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `result` text NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) unsigned NOT NULL COMMENT '上次修改时间',
  UNIQUE KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='秒杀商品属性详情表';

-- ----------------------------
-- Records of eb_store_seckill_attr_result
-- ----------------------------
INSERT INTO `eb_store_seckill_attr_result` VALUES ('16', '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u9ed1\\u8272\",\"\\u767d\\u8272\"]},{\"value\":\"\\u5305\\u88c5\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u5927\",\"\\u5c0f\",\"\\u4e2d\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u5305\\u88c5\":\"\\u5927\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u5305\\u88c5\":\"\\u5c0f\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u5305\\u88c5\":\"\\u4e2d\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u5305\\u88c5\":\"\\u5927\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u5305\\u88c5\":\"\\u5c0f\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u5305\\u88c5\":\"\\u4e2d\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false}]}', '1528271776');
INSERT INTO `eb_store_seckill_attr_result` VALUES ('21', '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u767d\\u8272\",\"\\u9ed1\\u8272\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"price\":\"10.00\",\"sales\":9,\"pic\":\"http:\\/\\/shop.crmeb.net\\/public\\/uploads\\/editor\\/20180601\\/5b10b2f5cd89b.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"price\":\"10.00\",\"sales\":9,\"pic\":\"http:\\/\\/shop.crmeb.net\\/public\\/uploads\\/editor\\/20180601\\/5b10b2f5cd89b.jpg\",\"check\":false}]}', '1530779190');
INSERT INTO `eb_store_seckill_attr_result` VALUES ('24', '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u767d\\u8272\",\"\\u9ed1\\u8272\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"price\":\"1.00\",\"sales\":99,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5ae6715187623.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"price\":\"1.00\",\"sales\":99,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5ae6715187623.jpg\",\"check\":false}]}', '1530890416');

-- ----------------------------
-- Table structure for eb_store_seckill_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_attr_value`;
CREATE TABLE `eb_store_seckill_attr_value` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `suk` varchar(128) NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `unique` char(8) NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  KEY `store_id` (`product_id`,`suk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='秒杀商品属性值表';

-- ----------------------------
-- Records of eb_store_seckill_attr_value
-- ----------------------------
INSERT INTO `eb_store_seckill_attr_value` VALUES ('16', '小,白色', '888', '0', '0.00', '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '0ea13c0e', '0.00');
INSERT INTO `eb_store_seckill_attr_value` VALUES ('16', '中,黑色', '888', '0', '0.00', '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '12b77e62', '0.00');
INSERT INTO `eb_store_seckill_attr_value` VALUES ('24', '黑色', '99', '0', '1.00', '/public/uploads/store/product/s_5ae6715187623.jpg', '147b853b', '0.00');
INSERT INTO `eb_store_seckill_attr_value` VALUES ('16', '大,白色', '888', '0', '0.00', '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '187ad0ea', '0.00');
INSERT INTO `eb_store_seckill_attr_value` VALUES ('24', '白色', '99', '0', '1.00', '/public/uploads/store/product/s_5ae6715187623.jpg', '48bf425d', '0.00');
INSERT INTO `eb_store_seckill_attr_value` VALUES ('21', '黑色', '9', '0', '10.00', 'http://shop.crmeb.net/public/uploads/editor/20180601/5b10b2f5cd89b.jpg', '56cb2fe0', '0.00');
INSERT INTO `eb_store_seckill_attr_value` VALUES ('16', '大,黑色', '888', '0', '0.00', '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '57852e0e', '0.00');
INSERT INTO `eb_store_seckill_attr_value` VALUES ('16', '小,黑色', '888', '0', '0.00', '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '747eaf51', '0.00');
INSERT INTO `eb_store_seckill_attr_value` VALUES ('16', '中,白色', '888', '0', '0.00', '/public/uploads/store/product/s_5abc58e8ad6db.jpg', 'a3421a2c', '0.00');
INSERT INTO `eb_store_seckill_attr_value` VALUES ('21', '白色', '9', '0', '10.00', 'http://shop.crmeb.net/public/uploads/editor/20180601/5b10b2f5cd89b.jpg', 'e893b71b', '0.00');

-- ----------------------------
-- Table structure for eb_store_service
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_service`;
CREATE TABLE `eb_store_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服id',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `uid` int(11) NOT NULL COMMENT '客服uid',
  `avatar` varchar(250) NOT NULL COMMENT '客服头像',
  `nickname` varchar(50) NOT NULL COMMENT '代理名称',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0隐藏1显示',
  `notify` int(2) DEFAULT '0' COMMENT '订单通知1开启0关闭',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='客服表';

-- ----------------------------
-- Records of eb_store_service
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_service_log
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_service_log`;
CREATE TABLE `eb_store_service_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服用户对话记录表ID',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `msn` text NOT NULL COMMENT '消息内容',
  `uid` int(11) NOT NULL COMMENT '发送人uid',
  `to_uid` int(11) NOT NULL COMMENT '接收人uid',
  `add_time` int(11) NOT NULL COMMENT '发送时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读（0：否；1：是；）',
  `remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='客服用户对话记录表';

-- ----------------------------
-- Records of eb_store_service_log
-- ----------------------------

-- ----------------------------
-- Table structure for eb_store_visit
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_visit`;
CREATE TABLE `eb_store_visit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `product_type` varchar(32) DEFAULT NULL COMMENT '产品类型',
  `cate_id` int(11) DEFAULT NULL COMMENT '产品分类ID',
  `type` char(50) DEFAULT NULL COMMENT '产品类型',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `count` int(11) DEFAULT NULL COMMENT '访问次数',
  `content` varchar(255) DEFAULT NULL COMMENT '备注描述',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品浏览分析表';

-- ----------------------------
-- Records of eb_store_visit
-- ----------------------------

-- ----------------------------
-- Table structure for eb_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_admin`;
CREATE TABLE `eb_system_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台管理员表ID',
  `account` varchar(32) NOT NULL COMMENT '后台管理员账号',
  `pwd` char(32) NOT NULL COMMENT '后台管理员密码',
  `real_name` varchar(16) NOT NULL COMMENT '后台管理员姓名',
  `roles` varchar(128) NOT NULL COMMENT '后台管理员权限(menus_id)',
  `last_ip` varchar(16) DEFAULT NULL COMMENT '后台管理员最后一次登录ip',
  `last_time` int(10) unsigned DEFAULT NULL COMMENT '后台管理员最后一次登录时间',
  `add_time` int(10) unsigned NOT NULL COMMENT '后台管理员添加时间',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '后台管理员级别',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '后台管理员状态 1有效0无效',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台管理员表';

-- ----------------------------
-- Records of eb_system_admin
-- ----------------------------
INSERT INTO `eb_system_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '1', '127.0.0.1', '1564819792', '1564742364', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for eb_system_attachment
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_attachment`;
CREATE TABLE `eb_system_attachment` (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '附件名称',
  `att_dir` varchar(200) NOT NULL COMMENT '附件路径',
  `satt_dir` varchar(200) DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) NOT NULL COMMENT '附件大小',
  `att_type` char(30) NOT NULL COMMENT '附件类型',
  `pid` int(10) NOT NULL COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `time` int(11) NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件管理表';

-- ----------------------------
-- Records of eb_system_attachment
-- ----------------------------
INSERT INTO `eb_system_attachment` VALUES ('2', '5c387d18c37fa.jpg', '/public/uploads/editor/20190111/5c387d18c37fa.jpg', '/public/uploads/editor/20190111/s_5c387d18c37fa.jpg', '9274', 'image/jpeg', '0', '1547205912');
INSERT INTO `eb_system_attachment` VALUES ('3', '5c387daf3ef63.jpg', '/public/uploads/editor/20190111/5c387daf3ef63.jpg', '/public/uploads/editor/20190111/s_5c387daf3ef63.jpg', '9274', 'image/jpeg', '0', '1547206063');
INSERT INTO `eb_system_attachment` VALUES ('7', '5c3db14908923.jpg', '/public/uploads/attach/2019/01/15/5c3db14908923.jpg', '/public/uploads/attach/2019/01/15/s_5c3db14908923.jpg', '102671', 'image/jpeg', '3', '1547546953');
INSERT INTO `eb_system_attachment` VALUES ('9', '5c3db5d483c7e.jpg', '/public/uploads/attach/2019/01/15/5c3db5d483c7e.jpg', '/public/uploads/attach/2019/01/15/s_5c3db5d483c7e.jpg', '41833', 'image/jpeg', '3', '1547548116');
INSERT INTO `eb_system_attachment` VALUES ('11', '5c3db8b933d92.jpg', '/public/uploads/attach/2019/01/15/5c3db8b933d92.jpg', '/public/uploads/attach/2019/01/15/s_5c3db8b933d92.jpg', '31746', 'image/jpeg', '2', '1547548857');
INSERT INTO `eb_system_attachment` VALUES ('12', '5c3db9de2b73a.jpg', '/public/uploads/attach/2019/01/15/5c3db9de2b73a.jpg', '/public/uploads/attach/2019/01/15/s_5c3db9de2b73a.jpg', '61866', 'image/jpeg', '1', '1547549150');
INSERT INTO `eb_system_attachment` VALUES ('13', '5c3dba1366885.jpg', '/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '/public/uploads/attach/2019/01/15/s_5c3dba1366885.jpg', '41951', 'image/jpeg', '1', '1547549203');
INSERT INTO `eb_system_attachment` VALUES ('14', '5c3dba4187461.jpg', '/public/uploads/attach/2019/01/15/5c3dba4187461.jpg', '/public/uploads/attach/2019/01/15/s_5c3dba4187461.jpg', '76932', 'image/jpeg', '1', '1547549249');
INSERT INTO `eb_system_attachment` VALUES ('15', '5c3dbb137d656.jpeg', '/public/uploads/editor/20190115/5c3dbb137d656.jpeg', '/public/uploads/editor/20190115/s_5c3dbb137d656.jpeg', '114386', 'image/jpeg', '0', '1547549459');
INSERT INTO `eb_system_attachment` VALUES ('16', '5c3dbb229e820.jpeg', '/public/uploads/editor/20190115/5c3dbb229e820.jpeg', '/public/uploads/editor/20190115/s_5c3dbb229e820.jpeg', '143065', 'image/jpeg', '0', '1547549474');
INSERT INTO `eb_system_attachment` VALUES ('17', '5c3dbb3b37f84.jpeg', '/public/uploads/editor/20190115/5c3dbb3b37f84.jpeg', '/public/uploads/editor/20190115/s_5c3dbb3b37f84.jpeg', '139850', 'image/jpeg', '0', '1547549499');
INSERT INTO `eb_system_attachment` VALUES ('18', '5c3dbb513b06f.jpeg', '/public/uploads/editor/20190115/5c3dbb513b06f.jpeg', '/public/uploads/editor/20190115/s_5c3dbb513b06f.jpeg', '150123', 'image/jpeg', '0', '1547549521');
INSERT INTO `eb_system_attachment` VALUES ('19', '5c3dbc27c69c7.jpg', '/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '/public/uploads/attach/2019/01/15/s_5c3dbc27c69c7.jpg', '33563', 'image/jpeg', '1', '1547549735');
INSERT INTO `eb_system_attachment` VALUES ('20', '5c3dbc6a38fab.jpg', '/public/uploads/attach/2019/01/15/5c3dbc6a38fab.jpg', '/public/uploads/attach/2019/01/15/s_5c3dbc6a38fab.jpg', '48892', 'image/jpeg', '1', '1547549802');
INSERT INTO `eb_system_attachment` VALUES ('21', '5c3dbce620415.jpeg', '/public/uploads/editor/20190115/5c3dbce620415.jpeg', '/public/uploads/editor/20190115/s_5c3dbce620415.jpeg', '132779', 'image/jpeg', '0', '1547549926');
INSERT INTO `eb_system_attachment` VALUES ('22', '5c3dc0ef27068.jpg', '/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '/public/uploads/attach/2019/01/15/s_5c3dc0ef27068.jpg', '40991', 'image/jpeg', '1', '1547550959');
INSERT INTO `eb_system_attachment` VALUES ('23', '5c3dc15ba1972.jpg', '/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', '/public/uploads/attach/2019/01/15/s_5c3dc15ba1972.jpg', '37389', 'image/jpeg', '1', '1547551067');
INSERT INTO `eb_system_attachment` VALUES ('24', '5c3dc1730a0c0.jpg', '/public/uploads/editor/20190115/5c3dc1730a0c0.jpg', '/public/uploads/editor/20190115/s_5c3dc1730a0c0.jpg', '113870', 'image/jpeg', '0', '1547551091');
INSERT INTO `eb_system_attachment` VALUES ('25', '5c3dc182bccac.jpg', '/public/uploads/editor/20190115/5c3dc182bccac.jpg', '/public/uploads/editor/20190115/s_5c3dc182bccac.jpg', '145391', 'image/jpeg', '0', '1547551106');
INSERT INTO `eb_system_attachment` VALUES ('26', '5c3dc23646fff.jpg', '/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '/public/uploads/attach/2019/01/15/s_5c3dc23646fff.jpg', '39941', 'image/jpeg', '1', '1547551286');
INSERT INTO `eb_system_attachment` VALUES ('27', '5c3dc286862fd.jpg', '/public/uploads/editor/20190115/5c3dc286862fd.jpg', '/public/uploads/editor/20190115/s_5c3dc286862fd.jpg', '81291', 'image/jpeg', '0', '1547551366');
INSERT INTO `eb_system_attachment` VALUES ('28', '5c3dc294a9a0a.jpg', '/public/uploads/editor/20190115/5c3dc294a9a0a.jpg', '/public/uploads/editor/20190115/s_5c3dc294a9a0a.jpg', '104012', 'image/jpeg', '0', '1547551380');
INSERT INTO `eb_system_attachment` VALUES ('29', '5c3dc2ba18a77.jpg', '/public/uploads/editor/20190115/5c3dc2ba18a77.jpg', '/public/uploads/editor/20190115/s_5c3dc2ba18a77.jpg', '127719', 'image/jpeg', '0', '1547551418');
INSERT INTO `eb_system_attachment` VALUES ('31', '5c3dc7146add5.png', '/public/uploads/attach/2019/01/15/5c3dc7146add5.png', '/public/uploads/attach/2019/01/15/s_5c3dc7146add5.png', '3209', 'image/png', '2', '1547552532');
INSERT INTO `eb_system_attachment` VALUES ('32', '5c3dc72335ee5.png', '/public/uploads/attach/2019/01/15/5c3dc72335ee5.png', '/public/uploads/attach/2019/01/15/s_5c3dc72335ee5.png', '3607', 'image/png', '2', '1547552547');
INSERT INTO `eb_system_attachment` VALUES ('33', '5c3dc730dead2.png', '/public/uploads/attach/2019/01/15/5c3dc730dead2.png', '/public/uploads/attach/2019/01/15/s_5c3dc730dead2.png', '3729', 'image/png', '2', '1547552560');
INSERT INTO `eb_system_attachment` VALUES ('34', '5c3dc73feecaf.png', '/public/uploads/attach/2019/01/15/5c3dc73feecaf.png', '/public/uploads/attach/2019/01/15/s_5c3dc73feecaf.png', '3351', 'image/png', '2', '1547552575');
INSERT INTO `eb_system_attachment` VALUES ('35', '5c3dc74c1bd3f.png', '/public/uploads/attach/2019/01/15/5c3dc74c1bd3f.png', '/public/uploads/attach/2019/01/15/s_5c3dc74c1bd3f.png', '2847', 'image/png', '2', '1547552588');
INSERT INTO `eb_system_attachment` VALUES ('36', '5c3dc7ee98a2e.png', '/public/uploads/attach/2019/01/15/5c3dc7ee98a2e.png', '/public/uploads/attach/2019/01/15/s_5c3dc7ee98a2e.png', '778', 'image/png', '2', '1547552750');
INSERT INTO `eb_system_attachment` VALUES ('37', '5c3dc802814e5.png', '/public/uploads/attach/2019/01/15/5c3dc802814e5.png', '/public/uploads/attach/2019/01/15/s_5c3dc802814e5.png', '574', 'image/png', '2', '1547552770');
INSERT INTO `eb_system_attachment` VALUES ('38', '5c3dc8232ac13.png', '/public/uploads/attach/2019/01/15/5c3dc8232ac13.png', '/public/uploads/attach/2019/01/15/s_5c3dc8232ac13.png', '1197', 'image/png', '2', '1547552803');
INSERT INTO `eb_system_attachment` VALUES ('39', '5c3dc84ef1070.png', '/public/uploads/attach/2019/01/15/5c3dc84ef1070.png', '/public/uploads/attach/2019/01/15/s_5c3dc84ef1070.png', '1556', 'image/png', '2', '1547552846');
INSERT INTO `eb_system_attachment` VALUES ('40', '5c3dc865bb257.png', '/public/uploads/attach/2019/01/15/5c3dc865bb257.png', '/public/uploads/attach/2019/01/15/s_5c3dc865bb257.png', '749', 'image/png', '2', '1547552869');
INSERT INTO `eb_system_attachment` VALUES ('41', '5c3dc8a7205f0.png', '/public/uploads/attach/2019/01/15/5c3dc8a7205f0.png', '/public/uploads/attach/2019/01/15/s_5c3dc8a7205f0.png', '814', 'image/png', '2', '1547552935');
INSERT INTO `eb_system_attachment` VALUES ('42', '5c3dc91cee6ed.png', '/public/uploads/attach/2019/01/15/5c3dc91cee6ed.png', '/public/uploads/attach/2019/01/15/s_5c3dc91cee6ed.png', '1100', 'image/png', '2', '1547553052');
INSERT INTO `eb_system_attachment` VALUES ('43', '5c3dc93937a48.png', '/public/uploads/attach/2019/01/15/5c3dc93937a48.png', '/public/uploads/attach/2019/01/15/s_5c3dc93937a48.png', '917', 'image/png', '2', '1547553081');
INSERT INTO `eb_system_attachment` VALUES ('44', '5c3dc95a1d134.png', '/public/uploads/attach/2019/01/15/5c3dc95a1d134.png', '/public/uploads/attach/2019/01/15/s_5c3dc95a1d134.png', '1200', 'image/png', '2', '1547553114');
INSERT INTO `eb_system_attachment` VALUES ('45', '5c3dc97a19134.png', '/public/uploads/attach/2019/01/15/5c3dc97a19134.png', '/public/uploads/attach/2019/01/15/s_5c3dc97a19134.png', '1227', 'image/png', '2', '1547553146');
INSERT INTO `eb_system_attachment` VALUES ('46', '5c9ccc99101a8.png', '/public/uploads/attach/2019/03/28/5c9ccc99101a8.png', '/public/uploads/attach/2019/03/28/s_5c9ccc99101a8.png', '2120', 'image/png', '4', '1553779865');
INSERT INTO `eb_system_attachment` VALUES ('47', '5c9ccc9918091.png', '/public/uploads/attach/2019/03/28/5c9ccc9918091.png', '/public/uploads/attach/2019/03/28/s_5c9ccc9918091.png', '1269', 'image/png', '4', '1553779865');
INSERT INTO `eb_system_attachment` VALUES ('48', '5c9ccc991f394.png', '/public/uploads/attach/2019/03/28/5c9ccc991f394.png', '/public/uploads/attach/2019/03/28/s_5c9ccc991f394.png', '1575', 'image/png', '4', '1553779865');
INSERT INTO `eb_system_attachment` VALUES ('49', '5c9ccc99269d1.png', '/public/uploads/attach/2019/03/28/5c9ccc99269d1.png', '/public/uploads/attach/2019/03/28/s_5c9ccc99269d1.png', '2007', 'image/png', '4', '1553779865');
INSERT INTO `eb_system_attachment` VALUES ('50', '5c9ccc992db31.png', '/public/uploads/attach/2019/03/28/5c9ccc992db31.png', '/public/uploads/attach/2019/03/28/s_5c9ccc992db31.png', '2762', 'image/png', '4', '1553779865');
INSERT INTO `eb_system_attachment` VALUES ('51', '5c9ccc9934a7c.png', '/public/uploads/attach/2019/03/28/5c9ccc9934a7c.png', '/public/uploads/attach/2019/03/28/s_5c9ccc9934a7c.png', '1731', 'image/png', '4', '1553779865');
INSERT INTO `eb_system_attachment` VALUES ('52', '5c9ccc993c14f.png', '/public/uploads/attach/2019/03/28/5c9ccc993c14f.png', '/public/uploads/attach/2019/03/28/s_5c9ccc993c14f.png', '1520', 'image/png', '4', '1553779865');
INSERT INTO `eb_system_attachment` VALUES ('53', '5c9ccc9943575.png', '/public/uploads/attach/2019/03/28/5c9ccc9943575.png', '/public/uploads/attach/2019/03/28/s_5c9ccc9943575.png', '1861', 'image/png', '4', '1553779865');
INSERT INTO `eb_system_attachment` VALUES ('54', '5c9ccca12638a.gif', '/public/uploads/attach/2019/03/28/5c9ccca12638a.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca12638a.gif', '122854', 'image/gif', '5', '1553779873');
INSERT INTO `eb_system_attachment` VALUES ('55', '5c9ccca151e99.gif', '/public/uploads/attach/2019/03/28/5c9ccca151e99.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca151e99.gif', '105770', 'image/gif', '5', '1553779873');
INSERT INTO `eb_system_attachment` VALUES ('56', '5c9ccca178a67.gif', '/public/uploads/attach/2019/03/28/5c9ccca178a67.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca178a67.gif', '108109', 'image/gif', '5', '1553779873');
INSERT INTO `eb_system_attachment` VALUES ('57', '5c9ccca1a01b6.gif', '/public/uploads/attach/2019/03/28/5c9ccca1a01b6.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca1a01b6.gif', '109454', 'image/gif', '5', '1553779873');
INSERT INTO `eb_system_attachment` VALUES ('58', '5c9ccca1c78cd.gif', '/public/uploads/attach/2019/03/28/5c9ccca1c78cd.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca1c78cd.gif', '110373', 'image/gif', '5', '1553779873');
INSERT INTO `eb_system_attachment` VALUES ('59', '5c9ccca8a27f0.png', '/public/uploads/attach/2019/03/28/5c9ccca8a27f0.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8a27f0.png', '3138', 'image/png', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('60', '5c9ccca8aa5b9.png', '/public/uploads/attach/2019/03/28/5c9ccca8aa5b9.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8aa5b9.png', '4066', 'image/png', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('61', '5c9ccca8b27f1.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8b27f1.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8b27f1.jpg', '25834', 'image/jpeg', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('62', '5c9ccca8bc1e0.png', '/public/uploads/attach/2019/03/28/5c9ccca8bc1e0.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8bc1e0.png', '3907', 'image/png', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('63', '5c9ccca8c3bff.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8c3bff.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8c3bff.jpg', '22916', 'image/jpeg', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('64', '5c9ccca8cd632.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8cd632.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8cd632.jpg', '24602', 'image/jpeg', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('65', '5c9ccca8d6ae1.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8d6ae1.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8d6ae1.jpg', '21491', 'image/jpeg', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('66', '5c9ccca8dfe16.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8dfe16.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8dfe16.jpg', '27120', 'image/jpeg', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('67', '5c9ccca8e9365.png', '/public/uploads/attach/2019/03/28/5c9ccca8e9365.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8e9365.png', '3648', 'image/png', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('68', '5c9ccca8f0a30.png', '/public/uploads/attach/2019/03/28/5c9ccca8f0a30.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8f0a30.png', '3066', 'image/png', '6', '1553779880');
INSERT INTO `eb_system_attachment` VALUES ('69', '5c9ccca904016.jpg', '/public/uploads/attach/2019/03/28/5c9ccca904016.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca904016.jpg', '24567', 'image/jpeg', '6', '1553779881');
INSERT INTO `eb_system_attachment` VALUES ('70', '5c9ccca90d2d3.png', '/public/uploads/attach/2019/03/28/5c9ccca90d2d3.png', '/public/uploads/attach/2019/03/28/s_5c9ccca90d2d3.png', '4409', 'image/png', '6', '1553779881');
INSERT INTO `eb_system_attachment` VALUES ('71', '5c9ccf7e97660.jpg', '/public/uploads/attach/2019/03/28/5c9ccf7e97660.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccf7e97660.jpg', '18640', 'image/jpeg', '2', '1553780606');
INSERT INTO `eb_system_attachment` VALUES ('72', '5c9ccf7e9f4d0.jpg', '/public/uploads/attach/2019/03/28/5c9ccf7e9f4d0.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccf7e9f4d0.jpg', '29549', 'image/jpeg', '2', '1553780606');
INSERT INTO `eb_system_attachment` VALUES ('73', '5c9ccfc86a6c1.jpg', '/public/uploads/attach/2019/03/28/5c9ccfc86a6c1.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccfc86a6c1.jpg', '22379', 'image/jpeg', '2', '1553780680');
INSERT INTO `eb_system_attachment` VALUES ('74', '5c9cd03224d59.jpg', '/public/uploads/attach/2019/03/28/5c9cd03224d59.jpg', '/public/uploads/attach/2019/03/28/s_5c9cd03224d59.jpg', '178435', 'image/jpeg', '2', '1553780786');
INSERT INTO `eb_system_attachment` VALUES ('75', '5c9ddc9f34bfd.png', '/public/uploads/attach/2019/03/29/5c9ddc9f34bfd.png', '/public/uploads/attach/2019/03/29/s_5c9ddc9f34bfd.png', '4453', 'image/png', '2', '1553849503');
INSERT INTO `eb_system_attachment` VALUES ('76', '5c9ddccecb7f3.png', '/public/uploads/attach/2019/03/29/5c9ddccecb7f3.png', '/public/uploads/attach/2019/03/29/s_5c9ddccecb7f3.png', '4522', 'image/png', '2', '1553849550');
INSERT INTO `eb_system_attachment` VALUES ('77', '5c9ddcec57a80.png', '/public/uploads/attach/2019/03/29/5c9ddcec57a80.png', '/public/uploads/attach/2019/03/29/s_5c9ddcec57a80.png', '2703', 'image/png', '2', '1553849580');
INSERT INTO `eb_system_attachment` VALUES ('78', '5c9ddd570b8b3.png', '/public/uploads/attach/2019/03/29/5c9ddd570b8b3.png', '/public/uploads/attach/2019/03/29/s_5c9ddd570b8b3.png', '2825', 'image/png', '2', '1553849687');
INSERT INTO `eb_system_attachment` VALUES ('79', '5c9dddce0eac9.png', '/public/uploads/attach/2019/03/29/5c9dddce0eac9.png', '/public/uploads/attach/2019/03/29/s_5c9dddce0eac9.png', '4784', 'image/png', '2', '1553849806');
INSERT INTO `eb_system_attachment` VALUES ('80', '5c9dde013f63c.png', '/public/uploads/attach/2019/03/29/5c9dde013f63c.png', '/public/uploads/attach/2019/03/29/s_5c9dde013f63c.png', '3672', 'image/png', '2', '1553849857');
INSERT INTO `eb_system_attachment` VALUES ('81', '5c9dde246ad96.png', '/public/uploads/attach/2019/03/29/5c9dde246ad96.png', '/public/uploads/attach/2019/03/29/s_5c9dde246ad96.png', '4982', 'image/png', '2', '1553849892');
INSERT INTO `eb_system_attachment` VALUES ('82', '5c9ddedbed782.png', '/public/uploads/attach/2019/03/29/5c9ddedbed782.png', '/public/uploads/attach/2019/03/29/s_5c9ddedbed782.png', '6454', 'image/png', '2', '1553850075');
INSERT INTO `eb_system_attachment` VALUES ('83', '5c9de8b7c5cc5.png', '/public/uploads/attach/2019/03/29/5c9de8b7c5cc5.png', '/public/uploads/attach/2019/03/29/s_5c9de8b7c5cc5.png', '124578', 'image/png', '7', '1553852599');
INSERT INTO `eb_system_attachment` VALUES ('84', '5c9def00c2882.png', '/public/uploads/attach/2019/03/29/5c9def00c2882.png', '/public/uploads/attach/2019/03/29/s_5c9def00c2882.png', '90279', 'image/png', '7', '1553854208');
INSERT INTO `eb_system_attachment` VALUES ('85', '5c9def5fa968c.png', '/public/uploads/attach/2019/03/29/5c9def5fa968c.png', '/public/uploads/attach/2019/03/29/s_5c9def5fa968c.png', '139059', 'image/png', '7', '1553854303');
INSERT INTO `eb_system_attachment` VALUES ('86', '5c9df11e13742.png', '/public/uploads/attach/2019/03/29/5c9df11e13742.png', '/public/uploads/attach/2019/03/29/s_5c9df11e13742.png', '137246', 'image/png', '7', '1553854750');
INSERT INTO `eb_system_attachment` VALUES ('87', '5c9df170010cb.png', '/public/uploads/attach/2019/03/29/5c9df170010cb.png', '/public/uploads/attach/2019/03/29/s_5c9df170010cb.png', '212939', 'image/png', '7', '1553854832');
INSERT INTO `eb_system_attachment` VALUES ('88', '5c9df1b8f0a7a.png', '/public/uploads/attach/2019/03/29/5c9df1b8f0a7a.png', '/public/uploads/attach/2019/03/29/s_5c9df1b8f0a7a.png', '198726', 'image/png', '7', '1553854905');
INSERT INTO `eb_system_attachment` VALUES ('89', '5c9e015bdc6f5.jpg', '/public/uploads/attach/2019/03/29/5c9e015bdc6f5.jpg', '/public/uploads/attach/2019/03/29/s_5c9e015bdc6f5.jpg', '161959', 'image/jpeg', '3', '1553858907');
INSERT INTO `eb_system_attachment` VALUES ('90', '5c9e1ef640019.jpg', '/public/uploads/attach/2019/03/29/5c9e1ef640019.jpg', '/public/uploads/attach/2019/03/29/s_5c9e1ef640019.jpg', '154063', 'image/jpeg', '8', '1553866486');
INSERT INTO `eb_system_attachment` VALUES ('92', '5cb039675597c.jpg', '/public/uploads/attach/2019/04/12/5cb039675597c.jpg', '/public/uploads/attach/2019/04/12/s_5cb039675597c.jpg', '24890', 'image/jpeg', '8', '1555052903');
INSERT INTO `eb_system_attachment` VALUES ('93', '5cb071e576b3d.jpg', '/public/uploads/attach/2019/04/12/5cb071e576b3d.jpg', '/public/uploads/attach/2019/04/12/s_5cb071e576b3d.jpg', '165730', 'image/jpeg', '8', '1555067365');
INSERT INTO `eb_system_attachment` VALUES ('94', '5cb071e5860fa.jpg', '/public/uploads/attach/2019/04/12/5cb071e5860fa.jpg', '/public/uploads/attach/2019/04/12/s_5cb071e5860fa.jpg', '97039', 'image/jpeg', '8', '1555067365');
INSERT INTO `eb_system_attachment` VALUES ('95', '5cb18df0dfba7.jpg', '/public/uploads/attach/2019/04/13/5cb18df0dfba7.jpg', '/public/uploads/attach/2019/04/13/s_5cb18df0dfba7.jpg', '213277', 'image/jpeg', '3', '1555140080');
INSERT INTO `eb_system_attachment` VALUES ('96', '5cb18e247a1a9.jpg', '/public/uploads/attach/2019/04/13/5cb18e247a1a9.jpg', '/public/uploads/attach/2019/04/13/s_5cb18e247a1a9.jpg', '56623', 'image/jpeg', '3', '1555140132');

-- ----------------------------
-- Table structure for eb_system_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_attachment_category`;
CREATE TABLE `eb_system_attachment_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父级ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `enname` varchar(50) NOT NULL COMMENT '分类目录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件分类表';

-- ----------------------------
-- Records of eb_system_attachment_category
-- ----------------------------
INSERT INTO `eb_system_attachment_category` VALUES ('1', '0', '产品图', '');
INSERT INTO `eb_system_attachment_category` VALUES ('2', '0', '分类图片', '');
INSERT INTO `eb_system_attachment_category` VALUES ('3', '0', '广告图', '');
INSERT INTO `eb_system_attachment_category` VALUES ('4', '0', '个人中心', '');
INSERT INTO `eb_system_attachment_category` VALUES ('5', '0', '订单详情', '');
INSERT INTO `eb_system_attachment_category` VALUES ('6', '0', '会员等级', '');
INSERT INTO `eb_system_attachment_category` VALUES ('7', '0', '系统分类', '');
INSERT INTO `eb_system_attachment_category` VALUES ('8', '0', '分享海报', '');

-- ----------------------------
-- Table structure for eb_system_config
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_config`;
CREATE TABLE `eb_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) NOT NULL COMMENT '字段名称',
  `type` varchar(255) NOT NULL COMMENT '类型(文本框,单选按钮...)',
  `config_tab_id` int(10) unsigned NOT NULL COMMENT '配置分类id',
  `parameter` varchar(255) DEFAULT NULL COMMENT '规则 单选框和多选框',
  `upload_type` tinyint(1) unsigned DEFAULT NULL COMMENT '上传文件格式1单图2多图3文件',
  `required` varchar(255) DEFAULT NULL COMMENT '规则',
  `width` int(10) unsigned DEFAULT NULL COMMENT '多行文本框的宽度',
  `high` int(10) unsigned DEFAULT NULL COMMENT '多行文框的高度',
  `value` varchar(5000) DEFAULT NULL COMMENT '默认值',
  `info` varchar(255) NOT NULL COMMENT '配置名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '配置简介',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='配置表';

-- ----------------------------
-- Records of eb_system_config
-- ----------------------------
INSERT INTO `eb_system_config` VALUES ('1', 'site_name', 'text', '1', '', '0', 'required:true', '100', '0', '\"\\u5c0f\\u7a0b\\u5e8f\\u7535\\u5546\\u7cfb\\u7edf\"', '网站名称', '网站名称', '0', '1');
INSERT INTO `eb_system_config` VALUES ('2', 'site_url', 'text', '1', '', '0', 'required:true,url:true', '100', '0', '\"http:\\/\\/www.xxx.com\"', '网站地址', '网站地址', '0', '1');
INSERT INTO `eb_system_config` VALUES ('3', 'site_logo', 'upload', '1', '', '1', '', '0', '0', '\"\"', '后台LOGO', '左上角logo,建议尺寸[170*50]', '0', '1');
INSERT INTO `eb_system_config` VALUES ('4', 'site_phone', 'text', '1', '', '0', '', '100', '0', '\"\"', '联系电话', '联系电话', '0', '1');
INSERT INTO `eb_system_config` VALUES ('5', 'seo_title', 'text', '1', '', '0', 'required:true', '100', '0', '\"\\u5c0f\\u7a0b\\u5e8f\\u7535\\u5546\\u7cfb\\u7edf\"', 'SEO标题', 'SEO标题', '0', '1');
INSERT INTO `eb_system_config` VALUES ('6', 'site_email', 'text', '1', '', '0', 'email:true', '100', '0', '\"admin@admin.com\"', '联系邮箱', '联系邮箱', '0', '1');
INSERT INTO `eb_system_config` VALUES ('7', 'site_qq', 'text', '1', '', '0', 'qq:true', '100', '0', '\"123456\"', '联系QQ', '联系QQ', '0', '1');
INSERT INTO `eb_system_config` VALUES ('8', 'site_close', 'radio', '1', '0=>开启\n1=>PC端关闭\n2=>WAP端关闭(含微信)\n3=>全部关闭', '0', '', '0', '0', '\"0\"', '网站关闭', '网站后台、商家中心不受影响。关闭网站也可访问', '0', '1');
INSERT INTO `eb_system_config` VALUES ('9', 'close_system', 'radio', '1', '0=>开启\n1=>关闭', '0', '', '0', '0', '\"0\"', '关闭后台', '关闭后台', '0', '2');
INSERT INTO `eb_system_config` VALUES ('31', 'store_postage', 'text', '10', '', '0', 'number:true,min:0', '100', '0', '\"0\"', '邮费基础价', '商品邮费基础价格,最终金额为(基础价 + 商品1邮费 + 商品2邮费)', '0', '1');
INSERT INTO `eb_system_config` VALUES ('32', 'store_free_postage', 'text', '5', '', '0', 'number:true,min:-1', '100', '0', '\"20\"', '满额包邮', '商城商品满多少金额即可包邮', '0', '1');
INSERT INTO `eb_system_config` VALUES ('33', 'offline_postage', 'radio', '10', '0=>不包邮\n1=>包邮', '0', '', '0', '0', '\"1\"', '线下支付是否包邮', '用户选择线下支付时是否包邮', '0', '1');
INSERT INTO `eb_system_config` VALUES ('34', 'integral_ratio', 'text', '11', '', '0', 'number:true', '100', '0', '\"0.01\"', '积分抵用比例', '积分抵用比例(1积分抵多少金额)', '0', '1');
INSERT INTO `eb_system_config` VALUES ('35', 'site_service_phone', 'text', '1', '', '0', '', '100', '0', '\"\"', '客服电话', '客服联系电话', '0', '1');
INSERT INTO `eb_system_config` VALUES ('44', 'store_user_min_recharge', 'text', '5', '', '0', 'required:true,number:true,min:0', '100', '0', '\"0.01\"', '用户最低充值金额', '用户单次最低充值金额', '0', '0');
INSERT INTO `eb_system_config` VALUES ('45', 'site_store_admin_uids', 'text', '5', '', '0', '', '100', '0', '\"4\"', '管理员用户ID', '管理员用户ID,用于接收商城订单提醒，到微信用户中查找编号，多个英文‘,’隔开', '0', '1');
INSERT INTO `eb_system_config` VALUES ('46', 'system_express_app_code', 'text', '10', '', '0', '', '100', '0', '\"\"', '快递查询密钥', '阿里云快递查询接口密钥购买地址：https://market.aliyun.com/products/56928004/cmapi021863.html', '0', '1');
INSERT INTO `eb_system_config` VALUES ('47', 'main_business', 'text', '2', '', '0', 'required:true', '100', '0', '\" IT\\u79d1\\u6280 \\u4e92\\u8054\\u7f51|\\u7535\\u5b50\\u5546\\u52a1\"', '微信模板消息_主营行业', '微信公众号模板消息中选择开通的主营行业', '0', '0');
INSERT INTO `eb_system_config` VALUES ('48', 'vice_business', 'text', '2', '', '0', 'required:true', '100', '0', '\"IT\\u79d1\\u6280 IT\\u8f6f\\u4ef6\\u4e0e\\u670d\\u52a1 \"', '微信模板消息_副营行业', '微信公众号模板消息中选择开通的副营行业', '0', '0');
INSERT INTO `eb_system_config` VALUES ('49', 'store_brokerage_ratio', 'text', '9', '', '0', 'required:true,min:0,max:100,number:true', '100', '0', '\"30\"', '一级返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', '5', '1');
INSERT INTO `eb_system_config` VALUES ('50', 'wechat_first_sub_give_coupon', 'text', '12', '', '0', 'requred:true,digits:true,min:0', '100', '0', '\"\"', '首次关注赠送优惠券ID', '首次关注赠送优惠券ID,0为不赠送', '0', '1');
INSERT INTO `eb_system_config` VALUES ('51', 'store_give_con_min_price', 'text', '12', '', '0', 'requred:true,digits:true,min:0', '100', '0', '\"0.01\"', '消费满多少赠送优惠券', '消费满多少赠送优惠券,0为不赠送', '0', '1');
INSERT INTO `eb_system_config` VALUES ('52', 'store_order_give_coupon', 'text', '12', '', '0', 'requred:true,digits:true,min:0', '100', '0', '\"\"', '消费赠送优惠劵ID', '消费赠送优惠劵ID,0为不赠送', '0', '1');
INSERT INTO `eb_system_config` VALUES ('53', 'user_extract_min_price', 'text', '9', '', '0', 'required:true,number:true,min:0', '100', '0', '\"1\"', '提现最低金额', '用户提现最低金额', '0', '1');
INSERT INTO `eb_system_config` VALUES ('54', 'sx_sign_min_int', 'text', '11', '', '0', 'required:true,number:true,min:0', '100', '0', '\"1\"', '签到奖励最低积分', '签到奖励最低积分', '0', '1');
INSERT INTO `eb_system_config` VALUES ('55', 'sx_sign_max_int', 'text', '11', '', '0', 'required:true,number:true,min:0', '100', '0', '\"5\"', '签到奖励最高积分', '签到奖励最高积分', '0', '1');
INSERT INTO `eb_system_config` VALUES ('56', 'store_home_pink', 'upload', '5', '', '1', '', '0', '0', '\"\"', '首页拼团广告图', '首页拼团广告图', '0', '1');
INSERT INTO `eb_system_config` VALUES ('57', 'about_us', 'upload', '1', '', '1', '', '0', '0', '\"\"', '关于我们', '系统的标识', '0', '1');
INSERT INTO `eb_system_config` VALUES ('58', 'replenishment_num', 'text', '5', '', '0', 'required:true,number:true,min:0', '100', '0', '\"20\"', '待补货数量', '产品待补货数量低于多少时，提示补货', '0', '1');
INSERT INTO `eb_system_config` VALUES ('59', 'routine_appId', 'text', '7', '', '0', '', '100', '0', '\"\"', 'appId', '小程序appID', '0', '1');
INSERT INTO `eb_system_config` VALUES ('60', 'routine_appsecret', 'text', '7', '', '0', '', '100', '0', '\"\"', 'AppSecret', '小程序AppSecret', '0', '1');
INSERT INTO `eb_system_config` VALUES ('73', 'routine_logo', 'upload', '7', '', '1', '', '0', '0', '\"\"', '小程序logo', '小程序logo', '0', '1');
INSERT INTO `eb_system_config` VALUES ('74', 'routine_name', 'text', '7', '', '0', '', '100', '0', '\"CRMEB\"', '小程序名称', '小程序名称', '0', '1');
INSERT INTO `eb_system_config` VALUES ('76', 'routine_style', 'text', '7', '', '0', '', '100', '0', '\"\"', '小程序风格', '小程序颜色', '0', '1');
INSERT INTO `eb_system_config` VALUES ('77', 'store_stock', 'text', '5', '', '0', '', '100', '0', '\"2\"', '警戒库存', '警戒库存提醒值', '0', '1');
INSERT INTO `eb_system_config` VALUES ('85', 'stor_reason', 'textarea', '5', '', '0', '', '100', '8', '\"\\u6536\\u8d27\\u5730\\u5740\\u586b\\u9519\\u4e86\\r\\n\\u4e0e\\u63cf\\u8ff0\\u4e0d\\u7b26\\r\\n\\u4fe1\\u606f\\u586b\\u9519\\u4e86\\uff0c\\u91cd\\u65b0\\u62cd\\r\\n\\u6536\\u5230\\u5546\\u54c1\\u635f\\u574f\\u4e86\\r\\n\\u672a\\u6309\\u9884\\u5b9a\\u65f6\\u95f4\\u53d1\\u8d27\\r\\n\\u5176\\u5b83\\u539f\\u56e0\"', '退货理由', '配置退货理由，一行一个理由', '0', '1');
INSERT INTO `eb_system_config` VALUES ('87', 'store_brokerage_two', 'text', '9', '', '0', 'required:true,min:0,max:100,number:true', '100', '0', '\"10\"', '二级返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', '4', '1');
INSERT INTO `eb_system_config` VALUES ('88', 'store_brokerage_statu', 'radio', '9', '1=>指定分销\n2=>人人分销', '0', '', '0', '0', '\"2\"', '分销模式', '人人分销默认每个人都可以分销，制定人分销后台制定人开启分销', '10', '1');
INSERT INTO `eb_system_config` VALUES ('89', 'pay_routine_appid', 'text', '14', '', '0', 'required:true', '100', '0', '\"0\"', 'Appid', '小程序Appid', '0', '1');
INSERT INTO `eb_system_config` VALUES ('90', 'pay_routine_appsecret', 'text', '14', '', '0', 'required:true', '100', '0', '\"0\"', 'Appsecret', '小程序Appsecret', '0', '1');
INSERT INTO `eb_system_config` VALUES ('91', 'pay_routine_mchid', 'text', '14', '', '0', 'required:true', '100', '0', '\"0\"', 'Mchid', '商户号', '0', '1');
INSERT INTO `eb_system_config` VALUES ('92', 'pay_routine_key', 'text', '14', '', '0', 'required:true', '100', '0', '\"0\"', 'Key', '商户key', '0', '1');
INSERT INTO `eb_system_config` VALUES ('93', 'pay_routine_client_cert', 'upload', '14', '', '3', '', '0', '0', '\"\"', '小程序支付证书', '小程序支付证书', '0', '1');
INSERT INTO `eb_system_config` VALUES ('94', 'pay_routine_client_key', 'upload', '14', '', '3', '', '0', '0', '\"\"', '小程序支付证书密钥', '小程序支付证书密钥', '0', '1');
INSERT INTO `eb_system_config` VALUES ('99', 'user_extract_bank', 'textarea', '9', '', '0', '', '100', '5', '\"\\u4e2d\\u56fd\\u519c\\u884c\\r\\n\\u4e2d\\u56fd\\u5efa\\u8bbe\\u94f6\\u884c\\r\\n\\u5de5\\u5546\\u94f6\\u884c\"', '提现银行卡', '提现银行卡，每个银行换行', '0', '1');
INSERT INTO `eb_system_config` VALUES ('107', 'routine_index_logo', 'upload', '7', null, '1', null, null, null, '\"\"', '小程序主页logo图标', '小程序主页logo图标', '0', '1');

-- ----------------------------
-- Table structure for eb_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_config_tab`;
CREATE TABLE `eb_system_config_tab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置分类id',
  `title` varchar(255) NOT NULL COMMENT '配置分类名称',
  `eng_title` varchar(255) NOT NULL COMMENT '配置分类英文名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '配置分类状态',
  `info` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配置分类是否显示',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  `type` int(2) DEFAULT '0' COMMENT '配置类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='配置分类表';

-- ----------------------------
-- Records of eb_system_config_tab
-- ----------------------------
INSERT INTO `eb_system_config_tab` VALUES ('1', '基础配置', 'basics', '1', '0', 'cog', '0');
INSERT INTO `eb_system_config_tab` VALUES ('5', '商城配置', 'store', '1', '0', 'shopping-cart', '0');
INSERT INTO `eb_system_config_tab` VALUES ('7', '小程序配置', 'routine', '1', '0', 'weixin', '2');
INSERT INTO `eb_system_config_tab` VALUES ('9', '分销配置', 'fenxiao', '1', '0', 'sitemap', '3');
INSERT INTO `eb_system_config_tab` VALUES ('10', '物流配置', 'express', '1', '0', 'motorcycle', '0');
INSERT INTO `eb_system_config_tab` VALUES ('11', '积分配置', 'point', '1', '0', 'powerpoint-o', '3');
INSERT INTO `eb_system_config_tab` VALUES ('12', '优惠券配置', 'coupon', '1', '0', 'heartbeat', '3');
INSERT INTO `eb_system_config_tab` VALUES ('14', '小程序支付配置', 'routine_pay', '1', '0', 'jpy', '2');

-- ----------------------------
-- Table structure for eb_system_file
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_file`;
CREATE TABLE `eb_system_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件对比ID',
  `cthash` char(32) NOT NULL COMMENT '文件内容',
  `filename` varchar(255) NOT NULL COMMENT '文价名称',
  `atime` char(12) NOT NULL COMMENT '上次访问时间',
  `mtime` char(12) NOT NULL COMMENT '上次修改时间',
  `ctime` char(12) NOT NULL COMMENT '上次改变时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文件对比表';

-- ----------------------------
-- Records of eb_system_file
-- ----------------------------

-- ----------------------------
-- Table structure for eb_system_group
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group`;
CREATE TABLE `eb_system_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据ID',
  `name` varchar(50) NOT NULL COMMENT '数据组名称',
  `info` varchar(256) NOT NULL COMMENT '数据提示',
  `config_name` varchar(50) NOT NULL COMMENT '数据字段',
  `fields` text COMMENT '数据组字段以及类型（json数据）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `config_name` (`config_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='组合数据表';

-- ----------------------------
-- Records of eb_system_group
-- ----------------------------
INSERT INTO `eb_system_group` VALUES ('37', '拼团、秒杀、砍价顶部banner图', '小程序', 'routine_lovely', '[{\"name\":\"\\u56fe\\u7247\",\"title\":\"img\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u63cf\\u8ff0\",\"title\":\"comment\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES ('38', '砍价列表页左上小图标', '小程序', 'bargain_banner', '[{\"name\":\"banner\",\"title\":\"banner\",\"type\":\"upload\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES ('47', '首页分类图标', '小程序', 'routine_home_menus', '[{\"name\":\"\\u5206\\u7c7b\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u5206\\u7c7b\\u56fe\\u6807\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u8df3\\u8f6c\\u8def\\u5f84\",\"title\":\"url\",\"type\":\"select\",\"param\":\"\\/pages\\/index\\/index=>\\u5546\\u57ce\\u9996\\u9875\\n\\/pages\\/spread\\/spread=>\\u4e2a\\u4eba\\u63a8\\u5e7f\\n\\/pages\\/coupon\\/coupon=>\\u4f18\\u60e0\\u5238\\n\\/pages\\/user\\/user=>\\u4e2a\\u4eba\\u4e2d\\u5fc3\\n\\/pages\\/sign\\/sign=>\\u7b7e\\u5230\\n\\/pages\\/miao-list\\/miao-list=>\\u79d2\\u6740\\u5217\\u8868\\n\\/pages\\/pink-list\\/index=>\\u62fc\\u56e2\\u5217\\u8868\\u9875\\n\\/pages\\/cut-list\\/cut-list?id=123=>\\u780d\\u4ef7\\u5217\\u8868\\n\\/pages\\/productSort\\/productSort=>\\u5206\\u7c7b\\u9875\\u9762\\n\\/pages\\/address\\/address=>\\u5730\\u5740\\u5217\\u8868\\n\\/pages\\/cash\\/cash=>\\u63d0\\u73b0\\u9875\\u9762\\n\\/pages\\/extension\\/extension=>\\u63a8\\u5e7f\\u7edf\\u8ba1\\n\\/pages\\/main\\/main=>\\u8d26\\u6237\\u91d1\\u989d\\n\\/pages\\/collect\\/collect=>\\u6211\\u7684\\u6536\\u85cf\\n\\/pages\\/promotion-card\\/promotion-card=>\\u63a8\\u5e7f\\u4e8c\\u7ef4\\u7801\\u9875\\u9762\\n\\/pages\\/buycar\\/buycar=>\\u8d2d\\u7269\\u8f66\\u9875\\u9762\\n\\/pages\\/news-list\\/news-list=>\\u6d88\\u606f\\u5217\\u8868\\u9875\\n\\/pages\\/orders-list\\/orders-list=>\\u8ba2\\u5355\\u5217\\u8868\\u9875\\u9762\\n\\/pages\\/new-list\\/new-list=>\\u6587\\u7ae0\\u5217\\u8868\\u9875\"},{\"name\":\"\\u5e95\\u90e8\\u83dc\\u5355\",\"title\":\"show\",\"type\":\"radio\",\"param\":\"1=>\\u662f\\n2=>\\u5426\"}]');
INSERT INTO `eb_system_group` VALUES ('48', '首页banner滚动图', '小程序', 'routine_home_banner', '[{\"name\":\"\\u6807\\u9898\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u7247\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]');

-- ----------------------------
-- Table structure for eb_system_group_data
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group_data`;
CREATE TABLE `eb_system_group_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据详情ID',
  `gid` int(11) NOT NULL COMMENT '对应的数据组id',
  `value` text NOT NULL COMMENT '数据组对应的数据值（json数据）',
  `add_time` int(10) NOT NULL COMMENT '添加数据时间',
  `sort` int(11) NOT NULL COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1：开启；2：关闭；）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='组合数据详情表';

-- ----------------------------
-- Records of eb_system_group_data
-- ----------------------------
INSERT INTO `eb_system_group_data` VALUES ('89', '38', '{\"banner\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc730dead2.png\"}}', '1527153599', '1', '1');
INSERT INTO `eb_system_group_data` VALUES ('91', '37', '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/04\\/13\\/5cb18df0dfba7.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"\\u79d2\\u6740\\u5217\\u8868\\u9876\\u90e8baaner\"}}', '1528688012', '1', '1');
INSERT INTO `eb_system_group_data` VALUES ('100', '47', '{\"name\":{\"type\":\"input\",\"value\":\"\\u9886\\u4f18\\u60e0\\u5238\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9ddccecb7f3.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/coupon\\/coupon\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u5426\"}}', '1533722009', '7', '1');
INSERT INTO `eb_system_group_data` VALUES ('102', '47', '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u8981\\u7b7e\\u5230\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9ddd570b8b3.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/sign\\/sign\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u5426\"}}', '1533722063', '5', '1');
INSERT INTO `eb_system_group_data` VALUES ('104', '48', '{\"name\":{\"type\":\"input\",\"value\":\"banenr2\"},\"url\":{\"type\":\"input\",\"value\":\"\\/pages\\/pink-list\\/index?id=2\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9e015bdc6f5.jpg\"}}', '1533722286', '10', '1');
INSERT INTO `eb_system_group_data` VALUES ('105', '47', '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u6536\\u85cf\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9dddce0eac9.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/collect\\/collect\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u5426\"}}', '1533797064', '5', '1');
INSERT INTO `eb_system_group_data` VALUES ('159', '47', '{\"name\":{\"type\":\"input\",\"value\":\"\\u79d2\\u6740\\u6d3b\\u52a8\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9dde246ad96.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/miao-list\\/miao-list\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u5426\"}}', '1553849905', '2', '1');

-- ----------------------------
-- Table structure for eb_system_log
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_log`;
CREATE TABLE `eb_system_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员操作记录ID',
  `admin_id` int(10) unsigned NOT NULL COMMENT '管理员id',
  `admin_name` varchar(64) NOT NULL COMMENT '管理员姓名',
  `path` varchar(128) NOT NULL COMMENT '链接',
  `page` varchar(64) NOT NULL COMMENT '行为',
  `method` varchar(12) NOT NULL COMMENT '访问类型',
  `ip` varchar(16) NOT NULL COMMENT '登录IP',
  `type` varchar(32) NOT NULL COMMENT '类型',
  `add_time` int(10) unsigned NOT NULL COMMENT '操作时间',
  `merchant_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员操作记录表';

-- ----------------------------
-- Records of eb_system_log
-- ----------------------------
INSERT INTO `eb_system_log` VALUES ('1', '1', 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564811443', '0');
INSERT INTO `eb_system_log` VALUES ('2', '1', 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564811449', '0');
INSERT INTO `eb_system_log` VALUES ('3', '1', 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564811457', '0');
INSERT INTO `eb_system_log` VALUES ('4', '1', 'admin', 'admin/setting.systemconfig/index/type/2/tab_id/7', '小程序配置', 'GET', '127.0.0.1', 'system', '1564811466', '0');
INSERT INTO `eb_system_log` VALUES ('5', '1', 'admin', 'admin/setting.systemconfig/rmpublicresource/', '未知', 'GET', '127.0.0.1', 'system', '1564811480', '0');
INSERT INTO `eb_system_log` VALUES ('6', '1', 'admin', 'admin/setting.systemconfig/rmpublicresource/', '未知', 'GET', '127.0.0.1', 'system', '1564811482', '0');
INSERT INTO `eb_system_log` VALUES ('7', '1', 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', '1564811484', '0');
INSERT INTO `eb_system_log` VALUES ('8', '1', 'admin', 'admin/setting.systemconfig/index/tab_id/14/type/2', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564811486', '0');
INSERT INTO `eb_system_log` VALUES ('9', '1', 'admin', 'admin/routine.routinetemplate/index/', '小程序模版消息列表页', 'GET', '127.0.0.1', 'system', '1564811490', '0');
INSERT INTO `eb_system_log` VALUES ('10', '1', 'admin', 'admin/setting.systemgroupdata/index/gid/37', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', '1564811500', '0');
INSERT INTO `eb_system_log` VALUES ('11', '1', 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', '1564811523', '0');
INSERT INTO `eb_system_log` VALUES ('12', '1', 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', '1564811524', '0');
INSERT INTO `eb_system_log` VALUES ('13', '1', 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', '1564811529', '0');
INSERT INTO `eb_system_log` VALUES ('14', '1', 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', '1564811530', '0');
INSERT INTO `eb_system_log` VALUES ('15', '1', 'admin', 'admin/setting.systemgroup/index/', '配置组合数据展示页', 'GET', '127.0.0.1', 'system', '1564811708', '0');
INSERT INTO `eb_system_log` VALUES ('16', '1', 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', '1564811712', '0');
INSERT INTO `eb_system_log` VALUES ('17', '1', 'admin', 'admin/system.systemlog/index/', '管理员操作记录展示页', 'GET', '127.0.0.1', 'system', '1564811718', '0');
INSERT INTO `eb_system_log` VALUES ('18', '1', 'admin', 'admin/system.systemupgradeclient/index/', '在线更新', 'GET', '127.0.0.1', 'system', '1564811723', '0');
INSERT INTO `eb_system_log` VALUES ('19', '1', 'admin', 'admin/system.systemlog/index/', '管理员操作记录展示页', 'GET', '127.0.0.1', 'system', '1564811872', '0');
INSERT INTO `eb_system_log` VALUES ('20', '1', 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', '1564811895', '0');
INSERT INTO `eb_system_log` VALUES ('21', '1', 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', '1564811898', '0');
INSERT INTO `eb_system_log` VALUES ('22', '1', 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', '1564811943', '0');
INSERT INTO `eb_system_log` VALUES ('23', '1', 'admin', 'admin/setting.systemrole/create/', '添加身份', 'GET', '127.0.0.1', 'system', '1564811946', '0');
INSERT INTO `eb_system_log` VALUES ('24', '1', 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564811973', '0');
INSERT INTO `eb_system_log` VALUES ('25', '1', 'admin', 'admin/setting.systemconfig/rmpublicresource/', '未知', 'GET', '127.0.0.1', 'system', '1564811978', '0');
INSERT INTO `eb_system_log` VALUES ('26', '1', 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', '1564811983', '0');
INSERT INTO `eb_system_log` VALUES ('27', '1', 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564811986', '0');
INSERT INTO `eb_system_log` VALUES ('28', '1', 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564811988', '0');
INSERT INTO `eb_system_log` VALUES ('29', '1', 'admin', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564811990', '0');
INSERT INTO `eb_system_log` VALUES ('30', '1', 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', '1564812033', '0');
INSERT INTO `eb_system_log` VALUES ('31', '1', 'admin', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564812036', '0');
INSERT INTO `eb_system_log` VALUES ('32', '1', 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564812044', '0');
INSERT INTO `eb_system_log` VALUES ('33', '1', 'admin', 'admin/setting.systemconfig/rmpublicresource/', '未知', 'GET', '127.0.0.1', 'system', '1564812048', '0');
INSERT INTO `eb_system_log` VALUES ('34', '1', 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', '1564812053', '0');
INSERT INTO `eb_system_log` VALUES ('35', '1', 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', '1564812055', '0');
INSERT INTO `eb_system_log` VALUES ('36', '1', 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564812057', '0');
INSERT INTO `eb_system_log` VALUES ('37', '1', 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', '1564812067', '0');
INSERT INTO `eb_system_log` VALUES ('38', '1', 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', '1564812069', '0');
INSERT INTO `eb_system_log` VALUES ('39', '1', 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', '1564812074', '0');
INSERT INTO `eb_system_log` VALUES ('40', '1', 'admin', 'admin/article.articlecategory/index/', '文章分类管理展示页', 'GET', '127.0.0.1', 'system', '1564812083', '0');
INSERT INTO `eb_system_log` VALUES ('41', '1', 'admin', 'admin/article.article/index/', '文章管理', 'GET', '127.0.0.1', 'system', '1564812087', '0');
INSERT INTO `eb_system_log` VALUES ('42', '1', 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', '1564819809', '0');
INSERT INTO `eb_system_log` VALUES ('43', '1', 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', '1564819811', '0');

-- ----------------------------
-- Table structure for eb_system_menus
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_menus`;
CREATE TABLE `eb_system_menus` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `icon` varchar(16) NOT NULL COMMENT '图标',
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT '按钮名',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '控制器',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '方法名',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '[]' COMMENT '参数',
  `sort` tinyint(3) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '子管理员是否可用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `access` (`access`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='菜单表';

-- ----------------------------
-- Records of eb_system_menus
-- ----------------------------
INSERT INTO `eb_system_menus` VALUES ('1', '289', '', '系统设置', 'admin', 'setting.systemConfig', 'index', '[]', '90', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('2', '153', '', '权限规则', 'admin', 'setting.systemMenus', 'index', '[]', '7', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('4', '153', '', '管理员列表', 'admin', 'setting.systemAdmin', 'index', '[]', '9', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('7', '467', '', '配置分类', 'admin', 'setting.systemConfigTab', 'index', '[]', '1', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('8', '153', '', '身份管理', 'admin', 'setting.systemRole', 'index', '[]', '10', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('9', '467', '', '组合数据', 'admin', 'setting.systemGroup', 'index', '[]', '1', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('21', '0', 'magic', '维护', 'admin', 'system', 'index', '[]', '1', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('23', '0', 'laptop', '商品', 'admin', 'store', 'index', '[]', '110', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('24', '23', '', '商品管理', 'admin', 'store.storeProduct', 'index', '{\"type\":\"1\"}', '100', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('25', '23', '', '商品分类', 'admin', 'store.storeCategory', 'index', '[]', '1', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('26', '285', '', '订单管理', 'admin', 'order.storeOrder', 'index', '[]', '1', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('33', '284', '', '附加权限', 'admin', 'article.articleCategory', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('34', '33', '', '添加文章分类', 'admin', 'article.articleCategory', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('35', '33', '', '编辑文章分类', 'admin', 'article.articleCategory', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('36', '33', '', '删除文章分类', 'admin', 'article.articleCategory', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('38', '283', '', '附加权限', 'admin', 'article.article', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('39', '38', '', '添加文章', 'admin', 'article. article', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('40', '38', '', '编辑文章', 'admin', 'article. article', 'add_new', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('41', '38', '', '删除文章', 'admin', 'article. article', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('46', '7', '', '配置分类附加权限', 'admin', 'setting.systemConfigTab', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('47', '46', '', '添加配置分类', 'admin', 'setting.systemConfigTab', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('48', '117', '', '添加配置', 'admin', 'setting.systemConfig', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('49', '46', '', '编辑配置分类', 'admin', 'setting.systemConfigTab', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('50', '46', '', '删除配置分类', 'admin', 'setting.systemConfigTab', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('51', '46', '', '查看子字段', 'admin', 'system.systemConfigTab', 'sonConfigTab', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('52', '9', '', '组合数据附加权限', 'admin', 'setting.systemGroup', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('53', '468', '', '添加数据', 'admin', 'setting.systemGroupData', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('54', '468', '', '编辑数据', 'admin', 'setting.systemGroupData', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('55', '468', '', '删除数据', 'admin', 'setting.systemGroupData', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('56', '468', '', '数据列表', 'admin', 'setting.systemGroupData', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('57', '52', '', '添加数据组', 'admin', 'setting.systemGroup', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('58', '52', '', '删除数据组', 'admin', 'setting.systemGroup', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('59', '4', '', '管理员列表附加权限', 'admin', 'setting.systemAdmin', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('60', '59', '', '添加管理员', 'admin', 'setting.systemAdmin', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('61', '59', '', '编辑管理员', 'admin', 'setting.systemAdmin', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('62', '59', '', '删除管理员', 'admin', 'setting.systemAdmin', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('63', '8', '', '身份管理附加权限', 'admin', 'setting.systemRole', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('64', '63', '', '添加身份', 'admin', 'setting.systemRole', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('65', '63', '', '修改身份', 'admin', 'setting.systemRole', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('66', '63', '', '删除身份', 'admin', 'setting.systemRole', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('67', '8', '', '身份管理展示页', 'admin', 'setting.systemRole', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('68', '4', '', '管理员列表展示页', 'admin', 'setting.systemAdmin', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('69', '7', '', '配置分类展示页', 'admin', 'setting.systemConfigTab', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('70', '9', '', '组合数据展示页', 'admin', 'setting.systemGroup', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('71', '284', '', '文章分类管理展示页', 'admin', 'article.articleCategory', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('72', '283', '', '文章管理展示页', 'admin', 'article.article', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('74', '2', '', '菜单管理附加权限', 'admin', 'setting.systemMenus', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('75', '74', '', '添加菜单', 'admin', 'setting.systemMenus', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('76', '74', '', '编辑菜单', 'admin', 'setting.systemMenus', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('77', '74', '', '删除菜单', 'admin', 'setting.systemMenus', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('78', '2', '', '菜单管理展示页', 'admin', 'setting.systemMenus', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('80', '0', 'leanpub', '内容', 'admin', 'article', 'index', '[]', '90', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('100', '74', '', '添加提交菜单', 'admin', 'setting.systemMenus', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('101', '74', '', '编辑提交菜单', 'admin', 'setting.systemMenus', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('102', '59', '', '提交添加管理员', 'admin', 'setting.systemAdmin', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('103', '59', '', '提交修改管理员', 'admin', 'setting.systemAdmin', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('104', '63', '', '提交添加身份', 'admin', 'setting.systemRole', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('105', '63', '', '提交修改身份', 'admin', 'setting.systemRole', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('106', '46', '', '提交添加配置分类', 'admin', 'setting.systemConfigTab', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('107', '46', '', '提交修改配置分类', 'admin', 'setting.systemConfigTab', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('108', '117', '', '提交添加配置列表', 'admin', 'setting.systemConfig', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('109', '52', '', '提交添加数据组', 'admin', 'setting.systemGroup', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('110', '52', '', '提交修改数据组', 'admin', 'setting.systemGroup', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('111', '468', '', '提交添加数据', 'admin', 'setting.systemGroupData', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('112', '468', '', '提交修改数据', 'admin', 'setting.systemGroupData', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('113', '33', '', '提交添加文章分类', 'admin', 'article.articleCategory', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('114', '33', '', '提交添加文章分类', 'admin', 'article.articleCategory', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('117', '1', '', '配置列表附加权限', 'admin', 'setting.systemConfig', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('118', '1', '', '配置列表展示页', 'admin', 'setting.systemConfig', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('119', '117', '', '提交保存配置列表', 'admin', 'setting.systemConfig', 'save_basics', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('130', '469', '', '系统日志', 'admin', 'system.systemLog', 'index', '[]', '5', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('131', '130', '', '管理员操作记录展示页', 'admin', 'system.systemLog', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('137', '135', '', '添加通知模板', 'admin', 'system.systemNotice', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('138', '135', '', '编辑通知模板', 'admin', 'system.systemNotice', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('139', '135', '', '删除辑通知模板', 'admin', 'system.systemNotice', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('140', '135', '', '提交编辑辑通知模板', 'admin', 'system.systemNotice', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('141', '135', '', '提交添加辑通知模板', 'admin', 'system.systemNotice', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('142', '25', '', '产品分类展示页', 'admin', 'store.storeCategory', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('143', '25', '', '产品分类附加权限', 'admin', 'store.storeCategory', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('144', '117', '', '获取配置列表上传文件的名称', 'admin', 'setting.systemConfig', 'getimagename', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('145', '117', '', '配置列表上传文件', 'admin', 'setting.systemConfig', 'view_upload', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('146', '24', '', '产品管理展示页', 'admin', 'store.storeProduct', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('147', '24', '', '产品管理附加权限', 'admin', 'store.storeProduct', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('148', '286', '', '优惠券', '', '', '', '[]', '10', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('149', '148', '', '优惠券制作', 'admin', 'ump.storeCoupon', 'index', '[]', '5', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('150', '148', '', '会员领取记录', 'admin', 'ump.storeCouponUser', 'index', '[]', '1', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('151', '0', 'user', '会员', 'admin', 'user', 'index', '[]', '107', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('153', '289', '', '管理权限', 'admin', 'setting.systemAdmin', '', '[]', '100', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('155', '154', '', '商户产品展示页', 'admin', 'store.storeMerchant', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('156', '154', '', '商户产品附加权限', 'admin', 'store.storeMerchant', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('158', '157', '', '商户文章管理展示页', 'admin', 'wechat.wechatNews', 'merchantIndex', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('159', '157', '', '商户文章管理附加权限', 'admin', 'wechat.wechatNews', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('170', '290', '', '评论管理', 'admin', 'store.store_product_reply', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('173', '469', '', '文件校验', 'admin', 'system.systemFile', 'index', '[]', '1', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('176', '151', '', '站内通知', 'admin', 'user.user_notice', 'index', '[]', '8', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('177', '151', '', '会员管理', 'admin', 'user.user', 'index', '[]', '10', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('179', '307', '', '充值记录', 'admin', 'finance.userRecharge', 'index', '[]', '1', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('190', '26', '', '订单管理展示页', 'admin', 'store.storeOrder', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('191', '26', '', '订单管理附加权限', 'admin', 'store.storeOrder', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('192', '191', '', '订单管理去发货', 'admin', 'store.storeOrder', 'deliver_goods', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('193', '191', '', '订单管理备注', 'admin', 'store.storeOrder', 'remark', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('194', '191', '', '订单管理去送货', 'admin', 'store.storeOrder', 'delivery', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('195', '191', '', '订单管理已收货', 'admin', 'store.storeOrder', 'take_delivery', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('196', '191', '', '订单管理退款', 'admin', 'store.storeOrder', 'refund_y', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('197', '191', '', '订单管理修改订单', 'admin', 'store.storeOrder', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('198', '191', '', '订单管理修改订单提交', 'admin', 'store.storeOrder', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('199', '191', '', '订单管理退积分', 'admin', 'store.storeOrder', 'integral_back', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('200', '191', '', '订单管理退积分提交', 'admin', 'store.storeOrder', 'updateIntegralBack', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('201', '191', '', '订单管理立即支付', 'admin', 'store.storeOrder', 'offline', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('202', '191', '', '订单管理退款原因', 'admin', 'store.storeOrder', 'refund_n', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('203', '191', '', '订单管理退款原因提交', 'admin', 'store.storeOrder', 'updateRefundN', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('204', '191', '', '订单管理修改配送信息', 'admin', 'store.storeOrder', 'distribution', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('205', '191', '', '订单管理修改配送信息提交', 'admin', 'store.storeOrder', 'updateDistribution', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('206', '191', '', '订单管理退款提交', 'admin', 'store.storeOrder', 'updateRefundY', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('207', '191', '', '订单管理去发货提交', 'admin', 'store.storeOrder', 'updateDeliveryGoods', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('208', '191', '', '订单管理去送货提交', 'admin', 'store.storeOrder', 'updateDelivery', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('216', '179', '', '用户充值记录展示页', 'admin', 'user.userRecharge', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('217', '179', '', '用户充值记录附加权限', 'admin', 'user.userRecharge', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('218', '217', '', '用户充值记录退款', 'admin', 'user.userRecharge', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('219', '217', '', '用户充值记录退款提交', 'admin', 'user.userRecharge', 'updaterefundy', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('220', '180', '', '预售卡管理批量修改预售卡金额', 'admin', 'presell.presellCard', 'batch_price', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('221', '180', '', '预售卡管理批量修改预售卡金额提交', 'admin', 'presell.presellCard', 'savebatch', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('224', '170', '', '评论管理展示页', 'admin', 'store.storeProductReply', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('225', '170', '', '评论管理附加权限', 'admin', 'store.storeProductReply', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('226', '225', '', '评论管理回复评论', 'admin', 'store.storeProductReply', 'set_reply', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('227', '225', '', '评论管理修改回复评论', 'admin', 'store.storeProductReply', 'edit_reply', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('228', '225', '', '评论管理删除评论', 'admin', 'store.storeProductReply', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('229', '149', '', '优惠券管理展示页', 'admin', 'store.storeCoupon', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('230', '149', '', '优惠券管理附加权限', 'admin', 'store.storeCoupon', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('231', '230', '', '优惠券管理添加', 'admin', 'store.storeCoupon', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('232', '230', '', '优惠券管理添加提交', 'admin', 'store.storeCoupon', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('233', '230', '', '优惠券管理删除', 'admin', 'store.storeCoupon', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('234', '230', '', '优惠券管理立即失效', 'admin', 'store.storeCoupon', 'status', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('235', '148', '', '已发布管理', 'admin', 'ump.storeCouponIssue', 'index', '[]', '3', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('237', '21', '', '刷新缓存', 'admin', 'system.clear', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('239', '306', '', '提现申请', 'admin', 'finance.user_extract', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('241', '273', '', '限时秒杀', 'admin', 'ump.storeSeckill', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('244', '294', '', '财务报表', 'admin', 'record.storeStatistics', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('247', '153', '', '个人资料', 'admin', 'setting.systemAdmin', 'admininfo', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('248', '247', '', '个人资料附加权限', 'admin', 'setting.systemAdmin', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('249', '248', '', '个人资料提交保存', 'admin', 'system.systemAdmin', 'setAdminInfo', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('250', '247', '', '个人资料展示页', 'admin', 'setting.systemAdmin', 'admininfo', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('255', '289', '', '后台通知', 'admin', 'setting.systemNotice', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('256', '0', 'cloud', '服务器端', 'admin', 'upgrade', 'index', '[]', '-100', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('261', '147', '', '编辑产品', 'admin', 'store.storeproduct', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('262', '147', '', '添加产品', 'admin', 'store.storeproduct', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('263', '147', '', '编辑产品详情', 'admin', 'store.storeproduct', 'edit_content', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('264', '147', '', '开启秒杀', 'admin', 'store.storeproduct', 'seckill', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('265', '147', '', '开启秒杀', 'admin', 'store.store_product', 'bargain', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('266', '147', '', '产品编辑属性', 'admin', 'store.storeproduct', 'attr', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('269', '0', 'cubes', '小程序', 'admin', 'routine', 'index', '[]', '92', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('270', '269', '', '小程序配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"2\",\"tab_id\":\"7\"}', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('273', '286', '', '秒杀管理', 'admin', '', '', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('276', '469', '', '附件管理', 'admin', 'widget.images', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('278', '469', '', '清除数据', 'admin', 'system.systemCleardata', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('283', '80', '', '文章管理', 'admin', 'article.article', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('284', '80', '', '文章分类', 'admin', 'article.article_category', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('285', '0', 'building-o', '订单', 'admin', 'order', 'index', '[]', '109', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('286', '0', 'paper-plane', '营销', 'admin', 'ump', 'index', '[]', '105', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('287', '0', 'money', '财务', 'admin', 'finance', 'index', '[]', '103', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('288', '0', 'line-chart', '数据', 'admin', 'record', 'index', '[]', '100', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('289', '0', 'gear', '设置', 'admin', 'setting', 'index', '[]', '90', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('290', '285', '', '售后服务', 'admin', '', '', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('293', '288', '', '交易数据', 'admin', '', '', '[]', '100', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('294', '288', '', '财务数据', 'admin', '', '', '[]', '80', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('295', '288', '', '会员数据', 'admin', '', '', '[]', '70', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('296', '288', '', '营销数据', 'admin', '', '', '[]', '90', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('297', '288', '', '排行榜', 'admin', '', '', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('300', '294', '', '提现统计', 'admin', 'record.record', 'chart_cash', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('301', '294', '', '充值统计', 'admin', 'record.record', 'chart_recharge', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('302', '294', '', '返佣统计', 'admin', 'record.record', 'chart_rebate', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('303', '295', '', '会员增长', 'admin', 'record.record', 'user_chart', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('304', '295', '', '会员业务', 'admin', 'record.record', 'user_business_chart', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('305', '295', '', '会员属性', 'admin', 'record.record', 'user_attr', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('306', '287', '', '财务操作', 'admin', '', '', '[]', '100', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('307', '287', '', '财务记录', 'admin', '', '', '[]', '50', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('308', '287', '', '佣金记录', 'admin', '', '', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('312', '307', '', '资金监控', 'admin', 'finance.finance', 'bill', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('313', '308', '', '佣金记录', 'admin', 'finance.finance', 'commission_list', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('314', '296', '', '积分统计', 'admin', 'record.record', 'chart_score', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('315', '296', '', '优惠券统计', 'admin', 'record.record', 'chart_coupon', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('317', '296', '', '秒杀统计', 'admin', 'record.record', 'chart_seckill', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('319', '297', '', '产品销售排行', 'admin', 'record.record', 'ranking_saleslists', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('320', '297', '', '返佣排行', 'admin', 'record.record', 'ranking_commission', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('321', '297', '', '积分排行', 'admin', 'record.record', 'ranking_point', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('329', '285', '', '营销订单', 'admin', 'user', 'user', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('334', '329', '', '秒杀订单', 'admin', 'user', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('335', '329', '', '积分兑换', 'admin', 'user', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('337', '0', 'users', '分销', 'admin', 'agent', 'index', '[]', '106', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('340', '293', '', '订单统计', 'admin', 'record.record', 'chart_order', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('341', '293', '', '产品统计', 'admin', 'record.record', 'chart_product', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('349', '286', '', '积分', 'admin', 'userPoint', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('350', '349', '', '积分配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"3\",\"tab_id\":\"11\"}', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('351', '349', '', '积分日志', 'admin', 'ump.userPoint', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('352', '148', '', '优惠券配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"3\",\"tab_id\":\"12\"}', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('353', '337', '', '分销配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"3\",\"tab_id\":\"9\"}', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('362', '276', '', '附加权限', 'admin', 'widget.images', '', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('363', '362', '', '上传图片', 'admin', 'widget.images', 'upload', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('364', '362', '', '删除图片', 'admin', 'widget.images', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('365', '362', '', '附件管理', 'admin', 'widget.images', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('369', '143', '', '添加产品分类', 'admin', 'store.storeCategory', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('370', '143', '', '编辑产品分类', 'admin', 'store.storeCategory', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('371', '337', '', '分销员管理', 'admin', 'agent.agentManage', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('372', '462', '', '首页幻灯片', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"48\"}', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('373', '462', '', '首页导航按钮', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"47\"}', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('374', '295', '', '分销会员业务', 'admin', 'record.record', 'user_distribution_chart', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('376', '269', '', '小程序模板消息', 'admin', 'routine.routineTemplate', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('377', '469', '', '数据备份', 'admin', 'system.systemDatabackup', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('378', '289', '', '物流公司', 'admin', 'system.express', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('379', '469', '', '文件管理', 'admin', 'system.systemFile', 'opendir', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('380', '379', '', '权限规则', 'admin', 'system.systemFile', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('381', '380', '', '打开文件', 'admin', 'system.systemFile', 'openfile', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('382', '380', '', '编辑文件', 'admin', 'system.systemFile', 'savefile', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('386', '362', '', '移动图片分类展示', 'admin', 'widget.images', 'moveimg', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('387', '362', '', '编辑分类', 'admin', 'widget.images', 'updatecate', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('388', '362', '', '添加分类', 'admin', 'widget.images', 'savecate', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('389', '362', '', '移动图片分类', 'admin', 'widget.images', 'moveimgcecate', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('390', '362', '', '编辑分类展示', 'admin', 'widget.images', 'editcate', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('392', '362', '', '删除分类', 'admin', 'widget.images', 'deletecate', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('393', '362', '', '添加分类展示', 'admin', 'widget.images', 'addcate', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('394', '191', '', '订单获取列表', 'admin', 'store.storeOrder', 'order_list', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('398', '177', '', '会员列表页', 'admin', 'user.user', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('399', '177', '', '会员附加权限', '', 'user.user', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('400', '399', '', '修改用户状态', '', 'user.user', 'set_status', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('401', '399', '', '编辑用户', 'admin', 'user.user', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('402', '399', '', '更新用户', 'admin', 'user.user', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('403', '399', '', '查看用户', 'admin', 'user.user', 'see', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('405', '399', '', '发优惠券', 'admin', 'ump.storeCouponUser', 'grant', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('406', '399', '', '推送图文', 'admin', 'wechat.wechatNewsCategory', 'push', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('407', '399', '', '发站内信', 'admin', 'user.userNotice', 'notice', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('408', '176', '', '站内通知附加权限', 'admin', 'user.user_notice', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('409', '408', '', '添加站内消息', 'admin', 'user.user_notice', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('410', '408', '', '编辑站内消息', 'admin', 'user.user_notice', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('411', '408', '', '发送站内消息', 'admin', 'user.user_notice', 'send', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('412', '408', '', '删除站内消息', 'admin', 'user.user_notice', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('413', '408', '', '指定用户发送', 'admin', 'user.user_notice', 'send_user', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('415', '371', '', '分销管理附加权限', 'admin', 'agent.agentManage', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('422', '376', '', '小程序模版消息附加权限', 'admin', 'routine.routineTemplate', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('423', '422', '', '添加模版消息展示', 'admin', 'routine.routineTemplate', 'create', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('424', '422', '', '添加模版消息', 'admin', 'routine.routineTemplate', 'save', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('425', '422', '', '编辑模版消息展示', 'admin', 'routine.routineTemplate', 'edit', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('426', '422', '', '编辑模版消息', 'admin', 'routine.routineTemplate', 'update', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('427', '422', '', '删除模版消息', 'admin', 'routine.routineTemplate', 'delete', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('439', '377', '', '数据库备份附加权限', 'admin', 'system.systemDatabackup', '', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('440', '439', '', '查看表结构', 'admin', 'system.systemDatabackup', 'seetable', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('441', '439', '', '优化表', 'admin', 'system.systemDatabackup', 'optimize', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('442', '439', '', '修复表', 'admin', 'system.systemDatabackup', 'repair', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('443', '439', '', '备份表', 'admin', 'system.systemDatabackup', 'backup', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('444', '439', '', '删除备份', 'admin', 'system.systemDatabackup', 'delFile', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('445', '439', '', '恢复备份', 'admin', 'system.systemDatabackup', 'import', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('446', '439', '', '下载备份', 'admin', 'system.systemDatabackup', 'downloadFile', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('447', '377', '', '数据备份展示页', 'admin', 'system.systemDatabackup', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('448', '379', '', '文件管理展示页', 'admin', 'system.systemFile', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('449', '176', '', '站内通知', 'admin', 'user.user_notice', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('450', '371', '', '分销管理列表页', 'admin', 'agent.agentManage', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('451', '376', '', '小程序模版消息列表页', 'admin', 'routine.routineTemplate', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('453', '276', '', '附件管理展示页', 'admin', 'widget.images', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('462', '269', '', '模块数据配置', 'admin', '', '', '[]', '100', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('467', '21', '', '开发配置', 'admin', 'system', '', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('468', '1', '', '配置组合数据附加权限', 'admin', 'setting.systemGroupData', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('469', '21', '', '安全维护', 'admin', 'system', '', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` VALUES ('470', '1', '', '配置组合数据展示页', 'admin', 'setting.systemGroup', 'index', '[]', '0', '0', '1');
INSERT INTO `eb_system_menus` VALUES ('471', '462', '', '拼团、秒杀、砍价顶部banner图', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"37\"}', '0', '1', '1');

-- ----------------------------
-- Table structure for eb_system_notice
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_notice`;
CREATE TABLE `eb_system_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '通知模板id',
  `title` varchar(64) NOT NULL COMMENT '通知标题',
  `type` varchar(64) NOT NULL COMMENT '通知类型',
  `icon` varchar(16) NOT NULL COMMENT '图标',
  `url` varchar(64) NOT NULL COMMENT '链接',
  `table_title` varchar(256) NOT NULL COMMENT '通知数据',
  `template` varchar(64) NOT NULL COMMENT '通知模板',
  `push_admin` varchar(128) NOT NULL COMMENT '通知管理员id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type` (`type`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='通知模板表';

-- ----------------------------
-- Records of eb_system_notice
-- ----------------------------
INSERT INTO `eb_system_notice` VALUES ('5', '用户关注通知', 'user_sub', 'user-plus', '', '[{\"title\":\"openid\",\"key\":\"openid\"},{\"title\":\"\\u5fae\\u4fe1\\u6635\\u79f0\",\"key\":\"nickname\"},{\"title\":\"\\u5173\\u6ce8\\u4e8b\\u4ef6\",\"key\":\"add_time\"}]', '有%u个新用户关注了公众号', '1', '1');
INSERT INTO `eb_system_notice` VALUES ('7', '新订单提醒', '订单提醒', 'building-o', '', '[{\"title\":\"\\u8ba2\\u5355\\u53f7\",\"key\":\"key1\"}]', '新订单提醒', '1', '1');
INSERT INTO `eb_system_notice` VALUES ('9', '测试通知中 ', '测试', 'buysellads', '', '[{\"title\":\"\\u8ba2\\u5355\\u53f7\",\"key\":\"key1\"}]', '测试', '20', '1');

-- ----------------------------
-- Table structure for eb_system_notice_admin
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_notice_admin`;
CREATE TABLE `eb_system_notice_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '通知记录ID',
  `notice_type` varchar(64) NOT NULL COMMENT '通知类型',
  `admin_id` smallint(5) unsigned NOT NULL COMMENT '通知的管理员',
  `link_id` int(10) unsigned NOT NULL COMMENT '关联ID',
  `table_data` text NOT NULL COMMENT '通知的数据',
  `is_click` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_visit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `visit_time` int(11) NOT NULL COMMENT '访问时间',
  `add_time` int(10) unsigned NOT NULL COMMENT '通知时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `admin_id` (`admin_id`,`notice_type`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `is_visit` (`is_visit`) USING BTREE,
  KEY `is_click` (`is_click`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='通知记录表';

-- ----------------------------
-- Records of eb_system_notice_admin
-- ----------------------------

-- ----------------------------
-- Table structure for eb_system_role
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_role`;
CREATE TABLE `eb_system_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '身份管理id',
  `role_name` varchar(32) NOT NULL COMMENT '身份管理名称',
  `rules` text NOT NULL COMMENT '身份管理权限(menus_id)',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='身份管理表';

-- ----------------------------
-- Records of eb_system_role
-- ----------------------------
INSERT INTO `eb_system_role` VALUES ('1', '超级管理员', '23,24,147,266,265,264,263,262,261,146,25,142,143,369,370,285,26,191,394,208,207,206,205,204,203,202,201,200,199,198,197,196,195,194,193,192,190,329,334,335,290,170,225,228,227,226,224,151,177,399,402,403,405,406,407,401,400,398,176,408,413,412,411,409,410,449,337,353,371,415,450,286,148,149,230,234,233,232,231,229,235,150,352,271,254,366,367,368,272,238,333,273,241,349,351,350,287,306,239,307,179,216,217,218,219,312,308,313,288,293,340,341,296,318,317,316,315,314,294,302,244,301,300,295,303,304,305,246,374,297,321,320,319,269,372,270,373,375,376,422,423,424,425,426,427,451,11,360,267,17,127,128,126,174,416,417,418,419,420,421,452,361,355,359,358,356,357,354,12,97,98,99,30,93,89,92,91,90,124,123,31,95,96,94,37,175,210,215,214,213,212,211,223,222,209,19,73,42,116,115,45,44,43,82,133,134,395,396,397,84,236,129,132,289,378,153,8,67,63,105,104,66,65,64,4,68,59,103,102,62,61,60,2,78,74,77,76,75,101,100,247,250,248,249,1,6,118,117,119,145,144,7,46,108,107,106,50,49,48,47,51,69,9,70,52,112,111,110,109,58,57,56,55,54,53,255,80,283,72,38,41,40,39,284,71,33,114,113,36,35,34,21,173,252,237,278,130,131,377,447,439,445,446,444,443,440,441,442,276,362,364,363,365,390,393,392,389,388,386,387,453,379,448,380,381,382,0', '0', '1');

-- ----------------------------
-- Table structure for eb_system_user_level
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_user_level`;
CREATE TABLE `eb_system_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '会员名称',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '购买金额',
  `valid_date` int(11) NOT NULL DEFAULT '0' COMMENT '有效时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为永久会员',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否购买,1=购买,0=不购买',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 1=显示,0=隐藏',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '享受折扣',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '会员卡背景',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '会员图标',
  `explain` text NOT NULL COMMENT '说明',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除.1=删除,0=未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='设置用户等级表';

-- ----------------------------
-- Records of eb_system_user_level
-- ----------------------------
INSERT INTO `eb_system_user_level` VALUES ('1', '0', '普通会员', '0.00', '0', '1', '0', '1', '1', '99.00', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8cd632.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8bc1e0.png', '普通会员', '1553824559', '0');
INSERT INTO `eb_system_user_level` VALUES ('2', '0', '青铜会员', '0.00', '0', '1', '0', '1', '2', '98.00', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca904016.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8f0a30.png', '青铜会员', '1553824639', '0');
INSERT INTO `eb_system_user_level` VALUES ('3', '0', '黄铜会员', '0.00', '0', '1', '0', '1', '3', '95.00', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8c3bff.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8e9365.png', '黄铜会员', '1553824742', '0');
INSERT INTO `eb_system_user_level` VALUES ('4', '0', '白银会员', '0.00', '0', '1', '0', '1', '4', '94.00', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8d6ae1.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8a27f0.png', '白银会员', '1553824797', '0');
INSERT INTO `eb_system_user_level` VALUES ('5', '0', '黄金会员', '0.00', '0', '1', '0', '1', '5', '90.00', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8b27f1.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8aa5b9.png', '黄金会员', '1553824837', '0');
INSERT INTO `eb_system_user_level` VALUES ('6', '0', '钻石会员', '0.00', '0', '1', '0', '1', '6', '88.00', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8dfe16.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca90d2d3.png', '钻石会员', '1553824871', '0');

-- ----------------------------
-- Table structure for eb_system_user_task
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_user_task`;
CREATE TABLE `eb_system_user_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '任务名称',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '配置原名',
  `task_type` varchar(50) NOT NULL DEFAULT '' COMMENT '任务类型',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '限定数',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '等级id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_must` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否务必达成任务,1务必达成,0=满足其一',
  `illustrate` varchar(255) NOT NULL DEFAULT '' COMMENT '任务说明',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='等级任务设置';

-- ----------------------------
-- Records of eb_system_user_task
-- ----------------------------
INSERT INTO `eb_system_user_task` VALUES ('1', '满足积分100分', '积分数', 'SatisfactionIntegral', '100', '1', '0', '1', '1', '', '1553827616');
INSERT INTO `eb_system_user_task` VALUES ('2', '消费满100元', '消费金额', 'ConsumptionAmount', '100', '1', '0', '1', '1', '', '1553827625');
INSERT INTO `eb_system_user_task` VALUES ('3', '满足积分200分', '积分数', 'SatisfactionIntegral', '200', '2', '0', '1', '1', '', '1553827638');
INSERT INTO `eb_system_user_task` VALUES ('4', '累计签到20天', '累计签到', 'CumulativeAttendance', '20', '2', '0', '1', '1', '', '1553827681');
INSERT INTO `eb_system_user_task` VALUES ('5', '满足积分500分', '积分数', 'SatisfactionIntegral', '500', '3', '0', '1', '1', '', '1553827695');
INSERT INTO `eb_system_user_task` VALUES ('6', '累计签到30天', '累计签到', 'CumulativeAttendance', '30', '3', '0', '1', '1', '', '1553827703');
INSERT INTO `eb_system_user_task` VALUES ('7', '满足积分1000分', '积分数', 'SatisfactionIntegral', '1000', '4', '0', '1', '1', '', '1553827731');
INSERT INTO `eb_system_user_task` VALUES ('8', '分享给朋友10次', '分享给朋友', 'SharingTimes', '10', '4', '0', '1', '1', '', '1553827740');
INSERT INTO `eb_system_user_task` VALUES ('9', '满足积分1200分', '积分数', 'SatisfactionIntegral', '1200', '5', '0', '1', '1', '', '1553827759');
INSERT INTO `eb_system_user_task` VALUES ('10', '累计签到60天', '累计签到', 'CumulativeAttendance', '60', '5', '0', '1', '1', '', '1553827768');
INSERT INTO `eb_system_user_task` VALUES ('11', '消费5次', '消费次数', 'ConsumptionFrequency', '5', '5', '0', '1', '1', '', '1553827776');
INSERT INTO `eb_system_user_task` VALUES ('12', '满足积分2000分', '积分数', 'SatisfactionIntegral', '2000', '6', '0', '1', '1', '', '1553827791');
INSERT INTO `eb_system_user_task` VALUES ('13', '消费满10000元', '消费次数', 'ConsumptionAmount', '10000', '6', '0', '1', '1', '', '1553827803');
INSERT INTO `eb_system_user_task` VALUES ('14', '累计签到100天', '累计签到', 'CumulativeAttendance', '100', '6', '0', '1', '1', '', '1553827814');

-- ----------------------------
-- Table structure for eb_token
-- ----------------------------
DROP TABLE IF EXISTS `eb_token`;
CREATE TABLE `eb_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `rand_string` varchar(10) NOT NULL DEFAULT '' COMMENT '10位随机字符串',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保存token随机字符串';

-- ----------------------------
-- Records of eb_token
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_user`;
CREATE TABLE `eb_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(32) NOT NULL COMMENT '用户账号',
  `pwd` varchar(32) NOT NULL COMMENT '用户密码',
  `nickname` varchar(16) NOT NULL COMMENT '用户昵称',
  `avatar` varchar(256) NOT NULL COMMENT '用户头像',
  `phone` char(15) DEFAULT NULL COMMENT '手机号码',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `add_ip` varchar(16) NOT NULL COMMENT '添加ip',
  `last_time` int(11) unsigned NOT NULL COMMENT '最后一次登录时间',
  `last_ip` varchar(16) NOT NULL COMMENT '最后一次登录ip',
  `now_money` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `integral` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '用户剩余积分',
  `sign_num` int(11) NOT NULL DEFAULT '0' COMMENT '连续签到天数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为正常，0为禁止',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `spread_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推广元id',
  `spread_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '推广员关联时间',
  `user_type` varchar(32) NOT NULL COMMENT '用户类型',
  `is_promoter` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为推广员',
  `pay_count` int(11) unsigned DEFAULT '0' COMMENT '用户购买次数',
  `spread_count` int(11) DEFAULT '0' COMMENT '下级人数',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `spreaduid` (`spread_uid`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_promoter` (`is_promoter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of eb_user
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_address
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_address`;
CREATE TABLE `eb_user_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `real_name` varchar(32) NOT NULL COMMENT '收货人姓名',
  `phone` varchar(16) NOT NULL COMMENT '收货人电话',
  `province` varchar(64) NOT NULL COMMENT '收货人所在省',
  `city` varchar(64) NOT NULL COMMENT '收货人所在市',
  `district` varchar(64) NOT NULL COMMENT '收货人所在区',
  `detail` varchar(256) NOT NULL COMMENT '收货人详细地址',
  `post_code` int(10) unsigned NOT NULL COMMENT '邮编',
  `longitude` varchar(16) NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `is_default` (`is_default`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户地址表';

-- ----------------------------
-- Records of eb_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_bill
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_bill`;
CREATE TABLE `eb_user_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户账单id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户uid',
  `link_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '关联id',
  `pm` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 = 支出 1 = 获得',
  `title` varchar(64) NOT NULL COMMENT '账单标题',
  `category` varchar(64) NOT NULL COMMENT '明细种类',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT '明细类型',
  `number` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '明细数字',
  `balance` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '剩余',
  `mark` varchar(512) NOT NULL COMMENT '备注',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = 带确定 1 = 有效 -1 = 无效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `openid` (`uid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `pm` (`pm`) USING BTREE,
  KEY `type` (`category`,`type`,`link_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户账单表';

-- ----------------------------
-- Records of eb_user_bill
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_enter
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_enter`;
CREATE TABLE `eb_user_enter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商户申请ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `province` varchar(32) NOT NULL COMMENT '商户所在省',
  `city` varchar(32) NOT NULL COMMENT '商户所在市',
  `district` varchar(32) NOT NULL COMMENT '商户所在区',
  `address` varchar(256) NOT NULL COMMENT '商户详细地址',
  `merchant_name` varchar(256) NOT NULL COMMENT '商户名称',
  `link_user` varchar(32) NOT NULL,
  `link_tel` varchar(16) NOT NULL COMMENT '商户电话',
  `charter` varchar(512) NOT NULL COMMENT '商户证书',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `apply_time` int(10) unsigned NOT NULL COMMENT '审核时间',
  `success_time` int(11) NOT NULL COMMENT '通过时间',
  `fail_message` varchar(256) NOT NULL COMMENT '未通过原因',
  `fail_time` int(10) unsigned NOT NULL COMMENT '未通过时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 审核未通过 0未审核 1审核通过',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 = 开启 1= 关闭',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  KEY `province` (`province`,`city`,`district`) USING BTREE,
  KEY `is_lock` (`is_lock`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商户申请表';

-- ----------------------------
-- Records of eb_user_enter
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_extract
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_extract`;
CREATE TABLE `eb_user_extract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL,
  `real_name` varchar(64) DEFAULT NULL COMMENT '名称',
  `extract_type` varchar(32) DEFAULT 'bank' COMMENT 'bank = 银行卡 alipay = 支付宝wx=微信',
  `bank_code` varchar(32) DEFAULT '0' COMMENT '银行卡',
  `bank_address` varchar(256) DEFAULT '' COMMENT '开户地址',
  `alipay_code` varchar(64) DEFAULT '' COMMENT '支付宝账号',
  `extract_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '提现金额',
  `mark` varchar(512) DEFAULT NULL,
  `balance` decimal(8,2) unsigned DEFAULT '0.00',
  `fail_msg` varchar(128) DEFAULT NULL COMMENT '无效原因',
  `fail_time` int(10) unsigned DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(2) DEFAULT '0' COMMENT '-1 未通过 0 审核中 1 已提现',
  `wechat` varchar(15) DEFAULT NULL COMMENT '微信号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `extract_type` (`extract_type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `openid` (`uid`) USING BTREE,
  KEY `fail_time` (`fail_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户提现表';

-- ----------------------------
-- Records of eb_user_extract
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_group
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_group`;
CREATE TABLE `eb_user_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) DEFAULT NULL COMMENT '用户分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户分组表';

-- ----------------------------
-- Records of eb_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_level
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_level`;
CREATE TABLE `eb_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '等级vip',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `valid_time` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否永久',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:禁止,1:正常',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已通知',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除,0=未删除,1=删除',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `discount` int(11) NOT NULL DEFAULT '0' COMMENT '享受折扣',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户等级记录表';

-- ----------------------------
-- Records of eb_user_level
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_notice`;
CREATE TABLE `eb_user_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` text NOT NULL COMMENT '接收消息的用户id（类型：json数据）',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '消息通知类型（1：系统消息；2：用户通知）',
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '发送人',
  `title` varchar(20) NOT NULL COMMENT '通知消息的标题信息',
  `content` varchar(500) NOT NULL COMMENT '通知消息的内容',
  `add_time` int(11) NOT NULL COMMENT '通知消息发送的时间',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送（0：未发送；1：已发送）',
  `send_time` int(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户通知表';

-- ----------------------------
-- Records of eb_user_notice
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_notice_see
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_notice_see`;
CREATE TABLE `eb_user_notice_see` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL COMMENT '查看的通知id',
  `uid` int(11) NOT NULL COMMENT '查看通知的用户id',
  `add_time` int(11) NOT NULL COMMENT '查看通知的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户通知发送记录表';

-- ----------------------------
-- Records of eb_user_notice_see
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_recharge
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_recharge`;
CREATE TABLE `eb_user_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '充值用户UID',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单号',
  `price` decimal(8,2) DEFAULT NULL COMMENT '充值金额',
  `recharge_type` varchar(32) DEFAULT NULL COMMENT '充值类型',
  `paid` tinyint(1) DEFAULT NULL COMMENT '是否充值',
  `pay_time` int(10) DEFAULT NULL COMMENT '充值支付时间',
  `add_time` int(12) DEFAULT NULL COMMENT '充值时间',
  `refund_price` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `recharge_type` (`recharge_type`) USING BTREE,
  KEY `paid` (`paid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户充值表';

-- ----------------------------
-- Records of eb_user_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_sign`;
CREATE TABLE `eb_user_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '签到说明',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '获得积分',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '剩余积分',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='签到记录表';

-- ----------------------------
-- Records of eb_user_sign
-- ----------------------------

-- ----------------------------
-- Table structure for eb_user_task_finish
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_task_finish`;
CREATE TABLE `eb_user_task_finish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户任务完成记录表';

-- ----------------------------
-- Records of eb_user_task_finish
-- ----------------------------

-- ----------------------------
-- Table structure for eb_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_user`;
CREATE TABLE `eb_wechat_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信用户id',
  `unionid` varchar(30) DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `openid` varchar(30) DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `routine_openid` varchar(32) DEFAULT NULL COMMENT '小程序唯一身份ID',
  `nickname` varchar(64) NOT NULL COMMENT '用户的昵称',
  `headimgurl` varchar(256) NOT NULL COMMENT '用户头像',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(64) NOT NULL COMMENT '用户所在城市',
  `language` varchar(64) NOT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `province` varchar(64) NOT NULL COMMENT '用户所在省份',
  `country` varchar(64) NOT NULL COMMENT '用户所在国家',
  `remark` varchar(256) DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` smallint(5) unsigned DEFAULT '0' COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(256) DEFAULT NULL COMMENT '用户被打上的标签ID列表',
  `subscribe` tinyint(3) unsigned DEFAULT '1' COMMENT '用户是否订阅该公众号标识',
  `subscribe_time` int(10) unsigned DEFAULT NULL COMMENT '关注公众号时间',
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `stair` int(11) unsigned DEFAULT NULL COMMENT '一级推荐人',
  `second` int(11) unsigned DEFAULT NULL COMMENT '二级推荐人',
  `order_stair` int(11) DEFAULT NULL COMMENT '一级推荐人订单',
  `order_second` int(11) unsigned DEFAULT NULL COMMENT '二级推荐人订单',
  `now_money` decimal(8,2) unsigned DEFAULT NULL COMMENT '佣金',
  `session_key` varchar(32) DEFAULT NULL COMMENT '小程序用户会话密匙',
  `user_type` varchar(32) DEFAULT 'wechat' COMMENT '用户类型',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `openid` (`openid`) USING BTREE,
  KEY `groupid` (`groupid`) USING BTREE,
  KEY `subscribe_time` (`subscribe_time`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `subscribe` (`subscribe`) USING BTREE,
  KEY `unionid` (`unionid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='微信用户表';

-- ----------------------------
-- Records of eb_wechat_user
-- ----------------------------
