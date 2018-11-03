/*
 Navicat Premium Data Transfer

 Source Server         : mybb
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 16/10/2018 16:02:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `activityId` int(11) NOT NULL,
  `activityTitle` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activityDays` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `beginTime` date NULL DEFAULT NULL,
  `endTime` date NULL DEFAULT NULL,
  `personNum` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telNum` int(11) NULL DEFAULT NULL,
  `activityIntroduce` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manageCheck` int(11) NOT NULL DEFAULT 2,
  `user_userId` int(11) NOT NULL,
  PRIMARY KEY (`activityId`) USING BTREE,
  INDEX `fk_activity_user1_idx`(`user_userId`) USING BTREE,
  INDEX `activityId`(`activityId`) USING BTREE,
  INDEX `activityId_2`(`activityId`) USING BTREE,
  INDEX `activityId_3`(`activityId`) USING BTREE,
  INDEX `activityId_4`(`activityId`) USING BTREE,
  CONSTRAINT `fk_activity_user1` FOREIGN KEY (`user_userId`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (12, '苏州', '3', '2018-10-01', '2018-10-03', '10', '200', 1231231322, '旅游', 2, 1);
INSERT INTO `activity` VALUES (123321, '苏州', '3', '2018-10-01', '2018-10-03', '10', '200', 1231231322, '旅游', 2, 1);

-- ----------------------------
-- Table structure for activitycomment
-- ----------------------------
DROP TABLE IF EXISTS `activitycomment`;
CREATE TABLE `activitycomment`  (
  `activityCommentId` int(11) NOT NULL,
  `activityTime` date NULL DEFAULT NULL,
  `activityCommentContent` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activity_activityId` int(11) NOT NULL,
  `userstatus` int(11) NULL DEFAULT 2,
  `userid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`activityCommentId`) USING BTREE,
  INDEX `fk_activityComment_activity1_idx`(`activity_activityId`) USING BTREE,
  CONSTRAINT `fk_activityComment_activity1` FOREIGN KEY (`activity_activityId`) REFERENCES `activity` (`activityid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activitycomment
-- ----------------------------
INSERT INTO `activitycomment` VALUES (1, '2018-09-10', '很好玩', 12, 1, 1);
INSERT INTO `activitycomment` VALUES (2, '2018-09-09', '一般吧，不舒服', 12, 1, 866);
INSERT INTO `activitycomment` VALUES (3, '2018-09-09', '哈哈哈', 123321, 1, 832);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `collectionId` int(11) NOT NULL AUTO_INCREMENT,
  `scenic_scenicId` int(11) NOT NULL,
  `route_routeId` int(11) NOT NULL,
  `user_userId` int(11) NOT NULL,
  PRIMARY KEY (`collectionId`) USING BTREE,
  INDEX `fk_collection_scenic1_idx`(`scenic_scenicId`) USING BTREE,
  INDEX `fk_collection_route1_idx`(`route_routeId`) USING BTREE,
  INDEX `fk_collection_user1_idx`(`user_userId`) USING BTREE,
  CONSTRAINT `fk_collection_route1` FOREIGN KEY (`route_routeId`) REFERENCES `route` (`routeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_collection_scenic1` FOREIGN KEY (`scenic_scenicId`) REFERENCES `scenic` (`scenicid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_collection_user1` FOREIGN KEY (`user_userId`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (1, 351, 255, 832);
INSERT INTO `collection` VALUES (2, 350, 252, 866);
INSERT INTO `collection` VALUES (3, 352, 250, 855);
INSERT INTO `collection` VALUES (10, 350, 253, 832);
INSERT INTO `collection` VALUES (12, 350, 253, 832);

-- ----------------------------
-- Table structure for joinactivity
-- ----------------------------
DROP TABLE IF EXISTS `joinactivity`;
CREATE TABLE `joinactivity`  (
  `joinActivityId` int(11) NOT NULL,
  `provideId` int(11) NOT NULL,
  `userStatus` int(11) NOT NULL DEFAULT 2,
  `user_userId` int(11) NOT NULL,
  `activity_activityId` int(11) NOT NULL,
  PRIMARY KEY (`joinActivityId`) USING BTREE,
  INDEX `fk_joinActivity_user1_idx`(`user_userId`) USING BTREE,
  INDEX `fk_joinActivity_activity1_idx`(`activity_activityId`) USING BTREE,
  CONSTRAINT `fk_joinActivity_activity1` FOREIGN KEY (`activity_activityId`) REFERENCES `activity` (`activityid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_joinActivity_user1` FOREIGN KEY (`user_userId`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for manage
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage`  (
  `manageId` int(11) NOT NULL,
  `manageName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `managePwd` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`manageId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manage
-- ----------------------------
INSERT INTO `manage` VALUES (1, 'mby', 'a790452f032a34ea80339bef474b93f4');

-- ----------------------------
-- Table structure for public
-- ----------------------------
DROP TABLE IF EXISTS `public`;
CREATE TABLE `public`  (
  `publicId` int(11) NOT NULL,
  `publicTitle` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publicContent` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`publicId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public
-- ----------------------------
INSERT INTO `public` VALUES (1, '小心出行', '9月17苏州大雨 山竹来袭小心出门');
INSERT INTO `public` VALUES (2, '苏州百年面馆打折', '百年老店装修结束，明日开业大酬宾啊。限时限量啊');

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route`  (
  `routeId` int(11) NOT NULL,
  `fromArea` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TimeArrange` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ScenicLevel` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hotRoute` int(11) NOT NULL,
  `routeImage` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`routeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES (250, '虎丘', '2h', '2', 2, '1');
INSERT INTO `route` VALUES (251, '寒山寺', '3h', '1', 1, '2');
INSERT INTO `route` VALUES (252, '金鸡湖', '2', '3', 2, '4');
INSERT INTO `route` VALUES (253, '独墅湖', '1h', '2', 3, '5');
INSERT INTO `route` VALUES (254, '留园', '2h', '1', 1, '3');
INSERT INTO `route` VALUES (255, '拙政园', '1h', '1', 1, '6');

-- ----------------------------
-- Table structure for routedetails
-- ----------------------------
DROP TABLE IF EXISTS `routedetails`;
CREATE TABLE `routedetails`  (
  `routeDetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `routeName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Days` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `placeNumber` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `routeIntroduction` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tripPlace` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playTime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openTime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `route_routeId` int(11) NOT NULL,
  PRIMARY KEY (`routeDetailsId`) USING BTREE,
  INDEX `fk_routeDetails_route1_idx`(`route_routeId`) USING BTREE,
  CONSTRAINT `fk_routeDetails_route1` FOREIGN KEY (`route_routeId`) REFERENCES `route` (`routeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scenic
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic`  (
  `scenicId` int(11) NOT NULL AUTO_INCREMENT,
  `scenicName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fromArea` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeArrange` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scenicLevel` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hotScenic` int(11) NOT NULL,
  `scenicAddress` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openHours` date NULL DEFAULT NULL,
  `scenicImage` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scenicIntroduce` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scenicLocation_scenicLocationId` int(11) NOT NULL,
  PRIMARY KEY (`scenicId`) USING BTREE,
  INDEX `fk_scenic_scenicLocation1_idx`(`scenicLocation_scenicLocationId`) USING BTREE,
  CONSTRAINT `fk_scenic_scenicLocation1` FOREIGN KEY (`scenicLocation_scenicLocationId`) REFERENCES `sceniclocation` (`sceniclocationid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 352 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES (350, '虎丘', '虎丘', '2', '2', 1, '苏州古城西北角', '2010-00-00', '1', '有“吴中第一名胜”、“吴中第一山”的美誉', 1);
INSERT INTO `scenic` VALUES (351, '金鸡湖', '金鸡湖', '2', '3', 1, '苏州吴中区', '2009-00-00', '2', '好玩啊', 2);
INSERT INTO `scenic` VALUES (352, '留园', '留园', '1', '1', 1, '市中心', '2008-00-00', '1', '真不错啊', 3);

-- ----------------------------
-- Table structure for scenicimage
-- ----------------------------
DROP TABLE IF EXISTS `scenicimage`;
CREATE TABLE `scenicimage`  (
  `scenicImageId` int(11) NOT NULL AUTO_INCREMENT,
  `image1` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image2` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image3` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image4` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image5` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scenicIntroduceID` int(11) NOT NULL,
  PRIMARY KEY (`scenicImageId`) USING BTREE,
  INDEX `fk_scenicImage_scenicIntroduce1_idx`(`scenicIntroduceID`) USING BTREE,
  CONSTRAINT `fk_scenicImage_scenicIntroduce1` FOREIGN KEY (`scenicIntroduceID`) REFERENCES `scenicintroduce` (`scenicintroduceid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scenicintroduce
-- ----------------------------
DROP TABLE IF EXISTS `scenicintroduce`;
CREATE TABLE `scenicintroduce`  (
  `scenicIntroduceID` int(11) NOT NULL AUTO_INCREMENT,
  `scenicTitle` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scenicImage` int(11) NULL DEFAULT NULL,
  `scenicParagraph` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scenic_scenicId` int(11) NOT NULL,
  PRIMARY KEY (`scenicIntroduceID`) USING BTREE,
  INDEX `fk_scenicIntroduce_scenic1_idx`(`scenic_scenicId`) USING BTREE,
  CONSTRAINT `fk_scenicIntroduce_scenic1` FOREIGN KEY (`scenic_scenicId`) REFERENCES `scenic` (`scenicid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sceniclocation
-- ----------------------------
DROP TABLE IF EXISTS `sceniclocation`;
CREATE TABLE `sceniclocation`  (
  `scenicLocationId` int(11) NOT NULL AUTO_INCREMENT,
  `industrialPark` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wuzhongDistrict` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gaoXinqu` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xiangCheng` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kunShan` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `changShu` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zhangJiagang` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `taiCang` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`scenicLocationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sceniclocation
-- ----------------------------
INSERT INTO `sceniclocation` VALUES (1, '1', '1', '2', '3', '4', '2', '1', '1');
INSERT INTO `sceniclocation` VALUES (2, '3', '6', '1', '5', '1', '2', '3', '5');
INSERT INTO `sceniclocation` VALUES (3, '2', '4', '5', '6', '4', '1', '2', '3');

-- ----------------------------
-- Table structure for travelnote
-- ----------------------------
DROP TABLE IF EXISTS `travelnote`;
CREATE TABLE `travelnote`  (
  `travelNoteId` int(11) NOT NULL AUTO_INCREMENT,
  `travelTitle` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travelNoteContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `travelNoteImage` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hotNote` int(11) NULL DEFAULT NULL,
  `manageCheck` int(11) NULL DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `travelNotePriseNum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`travelNoteId`) USING BTREE,
  INDEX `fk_游记表_user 用户信息1_idx`(`userId`) USING BTREE,
  INDEX `travelNoteId`(`travelNoteId`) USING BTREE,
  INDEX `travelNoteId_2`(`travelNoteId`) USING BTREE,
  INDEX `travelNoteId_3`(`travelNoteId`) USING BTREE,
  INDEX `travelNoteId_4`(`travelNoteId`) USING BTREE,
  INDEX `travelNoteId_5`(`travelNoteId`) USING BTREE,
  INDEX `travelNoteId_6`(`travelNoteId`) USING BTREE,
  INDEX `travelNoteId_7`(`travelNoteId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travelnote
-- ----------------------------
INSERT INTO `travelnote` VALUES (2, '夜逛七里山塘', '七里山塘又名七狸山塘，正式名称为山塘街，是江苏苏州金阊区一条有将近1200年历史的步行街，西起虎丘山下席场弄，东到阊门外古运河上的渡僧桥，全长3829.6米。\r\n\r\n唐宝历二年（825年），大诗人白居易从杭州调任苏州刺史，为了便利苏州水陆交通，开凿了一条西起虎丘东至阊门的山塘河，山塘河河北修建道路，称为“山塘街”，山塘河和山塘街长约七里，叫“七里山塘”。自古山塘街有“姑苏第一名街”之称。\r\n\r\n山塘街和山塘河有典型江南水乡的风貌，家家户户前街后河，河上小船来往如梭，街上店铺林立。横跨河上的古桥有7座：山塘桥、通贵桥（又名瑞云桥）、星桥、彩云桥（又名半塘桥）、普济桥、望山桥（曾名便山桥）和西山庙桥，竖贯堤上的古桥有8座：白姆桥、毛家桥、桐桥（曾名洞桥、胜安桥）、白公桥、青山桥、绿水桥、斟酌桥和万点桥，而对岸竖贯之桥也是八座，有同善桥（小普济桥）、引善桥等。其中山塘桥、彩云桥、便山桥和洞桥四座桥建于宋代以前。其中通贵桥旁是明代南京吏部尚书吴一鹏的府第。星桥是昔日商业最繁盛的所在。西山庙桥南北两堍分别是花神庙和西山庙。而斟酌桥是山塘河、东山浜、野芳浜的交汇处，是当年画舫云集的所在，桥东堍的花园弄花香袭人，有不少诗词赞美斟酌桥畔的风光，例如：“斟酌桥头花草香，画船载酒醉斜阳。桥边水作鹅黄色，也逐笙歌过半塘。”、“半塘春水绿如渑，赢得桥留斟酌名。桥外酒帘轻扬处，画船箫鼓正酣声。”', 'https://pic5.40017.cn/02/001/46/d4/rBANDFs-lc2ALJEGAAHQf63SO2g480_750x_00.jpg', NULL, NULL, 855, 20);
INSERT INTO `travelnote` VALUES (3, '千年斜塔，雨落虎丘 ', '苏州 人盼了3年的\r\n梦幻喷泉将重新上演！\r\n说说这次旅行\r\n我本是江南人，生于江南长于江南，江南的雨看的多，江南的小桥流水也遇见的很多，所以这里的风景一向甚少能引起的兴趣。大学的四年，我暂居苏州，春时、夏至、秋分、冬雪，每个季节的景色都看遍，唯有虎丘，四年的时间里，我只来过一次。\r\n上一次来虎丘，也是秋日，江南的秋，一直都是我最喜欢的季节。\r\n这一次再来虎丘，我已经毕业，离开苏州有三个多月了。这三个月里我从未回来过，可是刚刚下高铁的瞬间，还是觉得异常的亲切。\r\n【关于行程】\r\n9月23日，秋分。俗话说，秋风起，蟹脚痒。是啊，又到了一年吃大闸蟹的季节了。但是我们这种从小这个季节吃大闸蟹的人来说，这个时间远远还没有到大闸蟹肥美的季节。\r\n每年的9月，苏州的虎丘都会开始有庙会表演，持续时间约有一个月，值得一来\r\n23号一日，就只在虎丘一个景区里。\r\n【关于苏州】\r\n苏州，古称吴，简称为苏，又称姑苏、平江等，是国家历史文化名城和风景旅游城市。苏州属亚热带季风海洋性气候，四季分明，雨量充沛。种植水稻、小麦、油菜，出产棉花、蚕桑、林果，特产有碧螺春茶叶、长江刀鱼、太湖银鱼、阳澄湖大闸蟹等。\r\n【关于交通】\r\n苏州和无锡中间有一个苏南硕放机场，不过机场不大，吞吐量也不高，所以习惯性苏州人出行还是会选择上海浦东或者虹桥飞。\r\n苏州有很多高铁，每天往返于南京上海的铁路有几十趟，但节假日还是要提前购票，不然还是会买不到票。\r\n苏州汽车站有汽车南站、汽车北站，往省内绝大部分都有汽车。吴中汽车站可以到省内周庄、吴江之内的地方。\r\n内部交通\r\n苏州现在有地铁1号线、2号线、4号线，公交也很方便。\r\n【关于美食】\r\n苏式美食有很多，以甜为主。\r\n中秋季节最特色的的就是鲜肉月饼。其他的传统特色美食如松鼠桂鱼、响油鳝糊、碧落虾仁等。\r\n【关于虎丘】\r\n虎丘山海拔34.3米，面积0.19平方公里。景区现有面积100公顷，保护区面积475.9公顷，作为苏州的一个重要旅游窗口，虎丘屡获殊荣，先后被评为全国首批十佳文明风景旅游区示范点，国家AAAAA级旅游景区，全国文明单位。虎丘，原名海涌山，据《史记》记载，吴王阖闾葬于此，传说葬后三日有“白虎蹲其上”，故名虎丘。又一说为“丘如蹲虎”，以形为名。\r\n\r\n\r\n虎丘主景，传说众多\r\n虎丘山海拔34.3米，面积0.19平方公里。山体由侏罗系火山岩浆构成，千人石、试剑石、剑池等山石为流纹岩。虎丘山往东、北、西三个方向的整个平原地区第四系冲积层之下都分布着侏罗系火山岩。\r\n我曾暂居苏州五载，苏州大大小小的景也基本都走过，虎丘自然也不会例外。两年前来虎丘的时候，也是这样的秋天，秋高气爽最是适合出门逛逛了，也恰巧赶上了庙会，不过当初逛的并不仔细，两个小时就走马观花的走了一遭然后离开了。\r\n而这一次来，终于完完整整的浏览了一遭，那些曾经经过，却不知道典故的地方也终于都弄了明白。', 'https://tcw-public.b0.upaiyun.com/youji/2017-09-26/1852img11506414464070gXAJL.jpg!w800', 1, NULL, 844, 33);
INSERT INTO `travelnote` VALUES (4, '暑期苏州乐园之行', '　今天下午和妈妈去苏州乐园玩。我们有一张苏州乐园的卡，我们刷卡进去的。进去以后我们想先坐森林小火车，不过管理员说森林小火车半个小时以后才开。我和妈妈就先去玩具那儿玩了一会儿。我玩得正高兴，突然妈妈喊我，说“森林小火车来啦!”。我赶快去坐森林小火车。森林小火车开动以后，我顺手拔了几片小树叶。森林小火车绕着乐园转了一圈。我看到了许多玩具，还看见了瀑布，瀑布的水被风吹到了我们的脸上，感觉真凉快!瀑布象一块雪白的布，在太阳下闪闪发光。我们还经过了一个山洞，里面有一点点光，我一点也不害怕。森林小火车在路上有两处停靠点，一个是在一座桥，还有一个是在太空飞船那里。最后森林小火车开进了一个画满宇宙飞船的山洞。我感觉好像来到了太空一样，真好玩啊! 我们下了森林小火车又去玩了一会滑滑梯。后来我们又去了小小世界.一进门我们就看见五颜六色的灯一闪一闪的，真好看!我们坐上了一条黄色的船，船上只有我和妈妈两个人.我们坐船先到了世界风情，那里有很多人物，比如阿凡提，买火柴的小女孩，哪吒......又到了动物世界，里面有许多动物比如小鸟，海豚，海象，海豹......小船又经过童话世界，里面有许多童话故事力的主人公，象白雪公主和七个小矮人，葫芦娃，忍者神龟......让我想起很多有趣的动画片.最后小船快到终点时看到许多用不同国家语言写成的\"再见\"，我只看的懂中文的\"再见\".我们又去沙滩玩了一会，我在那捉了一会小鱼就回家了.今天我玩的可真高兴!', 'https://pic5.40017.cn/01/000/39/40/rBANC1s2b8CAJ5fiAAC7p_kqtr8920_750x_00.jpg', NULL, NULL, 832, 25);
INSERT INTO `travelnote` VALUES (8, '慢游苏州太湖三山岛，看最美太湖日落', '虽然距离太湖不是很远，但一直还未前去一探，眼看秋天来了，天气凉爽了起来，但伴随着的阴雨天气潮闷也紧接着而来。于是，周末约了几个朋友准备去太湖转转，如果有可能环太湖一圈那就更好了。\r\n  太湖，是中国五大淡水湖之一，湖岸线漫长，自然风光优美，且拥有众多形态不一的岛屿，其中这些岛屿中以太湖三山岛最为出名，三山岛由北山、行山、小姑山三座山峰组成，名字也由此而来。同时这里也是国家湿地公园，山水相依，面积虽不大却风光秀丽，明代称之为小蓬莱，故有“太湖蓬莱”的美誉，犹如世外桃源一般隐匿于太湖之中。\r\n  在三山岛的那两天真的不要太惬意，清晨或傍晚岛上闲逛，中午找地方喝喝茶，骑骑单车采采果子，虽然不能环湖但也可以泛舟湖上，尽享湖光山色。这里也比较适合悠闲放松，比较慢节奏的生活，原生态的风景，一派返朴归真的乡野气息，如果能多住上几日也是挺不错的。来到岛上可以买票乘坐游览车游玩，也可以徒步游览，由于岛屿并不是很大，建议徒步游览，当然如果不愿意走太多路也可以租这里的自行车，环湖路相对平缓，比较好骑。我们的游览起点是在这块牌坊前，开始徒步游览三山岛。牌坊上有对联：万顷碧波粼粼泊泊来，三春清风徐徐阵阵至，横批：湖光山色，往后可见“太湖蓬莱”四个大字，描绘的便是此处的太湖水以及岛上清风袅袅的景象，让人心旷神怡。\r\n\r\n', 'https://pic5.40017.cn/03/000/98/0b/rB5oQFu8BgCAWOM3AA2UAI1KnRs316_750x_00.jpg', 1, NULL, 866, NULL);
INSERT INTO `travelnote` VALUES (10, '穿越人海 の苏州、同里、周庄、上海三日游 ', '拙政园位于娄门内东北街178号，是苏州园林中最大的，也是最著名的一座拙政园始建于明代，王献臣是该园第一位主人。他在嘉靖、正德年间，官居监察御史，晚年仕途不得意，罢官而归，买地造园，借《闲居赋》“拙者之为政”句意，取名为拙政园。园内主要景点有：兰雪堂、芙蓉榭、秫香馆、放眼亭、远香堂、小沧浪、留亭阁、浮翠阁等。\r\n\r\n交通路线：从苏州火车站坐40路西线、202路公交车到齐门站下车步行几百米即可到达。\r\n门票：旺季￥90，景区售票处有好几个，但是入园还是要从东北街南门这个入口进。我国的建筑，从古代的宫殿到近代的一般住房，绝大部分是对称的，左边怎么样，右边也怎么样。苏州园林完全没有在讲究对称，可是也很美，不过有点感觉身在迷宫，也可能是因为人太多的原因。苏州园林在每一个角落都注意图画美。阶砌旁边栽几丛书带草。墙上蔓延着爬山虎或者蔷薇木香。如果开窗正对着白色墙壁，太单调了，给补上几竿竹子或几棵芭蕉。诸如此类。我家附近的公园怎么就只是一个亭子，种些花呢？苏州园林里的门和窗，图案设计和雕镂琢磨功夫都是工艺美术的上品。大致说来，那些门和窗工细而决不庸俗，即使简朴而别具匠心。', 'https://pic5.40017.cn/01/000/35/04/rBLkBls05f6Adqe0AAEmbWuHpC4727_750x_00.jpg', 1, NULL, 1, NULL);
INSERT INTO `travelnote` VALUES (11, '我和苏州一直有个约会', '当杭州等城市大刀阔斧赶现代化进程的时候，苏州像一个傲娇大家闺秀，丝毫没有打乱自己的信仰，依旧古朴韵律的节奏着。古城区不得肆意建造高楼大厦，新区却另辟道路繁花似锦， 两区功能划分明确，互不打扰，如此便是我最爱这座城市的地方了。\r\n几年间从上海去过无数次苏州了，今年才想着专心写一下这座处处见细节之美的城市。 \r\n建议其实比较随意，不是告诉各位亲们，怎样住宿怎么样吃喝，因为我坚持100个人心中会有100个苏州。 \r\n与其写这个，不如说下不得不去的一些地方吧。 \r\n比如【平江路】和【拙政园】虽然是爆款，但却有它经久不衰的理由。 \r\n除了老景点，每年递增的小资地点也值得一去。比如【李公堤】的一些酒吧，比如【凤凰文化广场】的【自在复合书店】，比如【圆融广场】摩天轮附近的水边，可以沿着走一圈。每一个季节的苏州，都是另一种美。\r\n【夏天的苏州】由于江南的闷热暑气，最适合去园林里坐一坐，郁郁葱葱的树枝，还有洋洋洒洒的荷叶衬托着娇嫩的荷花，园林里的温度要比外面低上了好几度。\r\n【冬日的苏州】我更愿意缩在平江路一条街，吃喝下午茶都在这里解决了。有时候啃20只卤鸡脚，喝杯茶叶，在河边可以欢喜的坐上一下午。没来苏州园林前，常听人说起，移步换景。 半信半疑之间，拿着单反就这么杀进园子。发现果不其然。每走几步，构图景色就完全不一样；并且园林常常用到“借景”的手法，很有层次。\r\n\r\n', 'https://pic5.40017.cn/02/001/35/40/rBLkCVs068KAcpKEAAKm7DJmGTU363_750x_00.jpg', NULL, NULL, 869, NULL);
INSERT INTO `travelnote` VALUES (12, '苏州.山塘街随拍', '山塘街历史悠久，始建于唐代宝历年间，是国家AAAA级旅游景区，被称誉为“姑苏第一名街”。此街位于古城苏州的西北部，东连“红尘中一、二等富贵风流之地”（《红楼梦》中描述）阊门，西接“吴中第一名胜”虎丘，全长约3600米，为唐代白居易率众修成。后人称之“白公堤”，又因堤长七华里，称为七里山塘。山塘街因其独特的地理位置和优越的水陆交通条件，曾是明清时期商贸、文化最为发达的街区之一。“上有天堂，下有苏杭。杭州有西湖，苏州有山塘。两处好地方，无限好风光。”这便是对山塘街的生动写照。山塘街东段导览图。七里山塘上有诸多的古寺、古祠、古牌坊、古会馆……这些古建筑，精雕细刻，古色古香，一派岁月沧桑感；还有耳熟能详的半塘传说，陈圆圆、董小宛等，装点了山塘的婉约一面，《山塘绝句》中就有“山塘满路皆脂粉”的句子；但五人墓和葛贤墓，却给游客留下另一种感慨。山塘街可以分为东西两段，东段从阊门渡僧桥起至半塘桥，这一段大多是商铺和住家，各种商店一家挨着一家，东段又以星桥一带最为热闹繁华。山塘街的西段指半塘桥至虎丘山。这一段渐近郊外，河面比东段要开阔，河边或绿树成荫、芳草依依，或蒹葭苍苍、村舍野艇。\r\n\r\n', 'https://pic5.40017.cn/01/001/33/fc/rBANC1s0zriAC57uAAF38YS8mhE572_750x_00.jpg', NULL, NULL, 868, NULL);
INSERT INTO `travelnote` VALUES (13, '那日花开，在苏州最隐逸的园林——游艺圃', '艺圃前身是明代进士袁祖庚所建的醉颖堂。袁官至浙江按察副使(考核官吏、管理司法的官)，四十岁后辞官退隐，在此造宅园，悬挂匾额曰“城市山林”。1659年，清初为明崇祯进士姜埰（号敬亭，山东莱阳人）辗转寓居苏州，成了艺圃的第三任主人，并改药圃为颐圃、敬亭山房。姜埰逝世，次子姜实节又将敬亭山房改名为艺圃。后来此园又数易其主，但园名仍叫艺圃。道光十九年（公元1839年）绸缎同业立为“七襄公所”，现留有小篆匾额。到了民国初，由于经济问题，园内房屋出租为民宅，艺圃变得支离零落，破败不堪。上世纪80年代，政府出资对其进行了完整修缮，2001年又把东部住宅部分收归艺圃，修复开放。艺圃的第二任主人是明代状元文震孟（文征明之曾孙），官至大学士，改“醉颖堂”名为“药圃”，文震孟尽管地位愈来愈高，但在艺圃却从未扩充过一分土地、加建过一楹房屋，基本上保存了“醉颖堂”时期“写意山水园”的特色。修缮后的窗是典型的明式格子窗，窗外的亭子就是艺圃有名的“乳鱼亭”，同样体现了明代的风格，据说部分构件为明代遗物。', 'https://pic5.40017.cn/01/000/57/ec/rBANC1tIt7eAC46qAAHvVZJbFWM418_750x_00.jpg', 1, NULL, 855, NULL);
INSERT INTO `travelnote` VALUES (14, '【苏州】倾“姑苏城外寒山寺”而往 ', '啊~~~先让本地瓜感叹几句。\r\n中秋节去的姑苏,然后上上上星期才把图片找好,顺便修了一下。新手,照片修的不好,纯属按照个人的喜好来修的(虽然说本地瓜的品味有待提升),打开这个网页的各位也别叨逼叨,我自己知道就好了~颜色什么呀~配色什么呀~要多浮夸有多浮夸~我也造,毕竟我自己都看不下去了,嗯~额!~懒癌患者。\r\n因为我是中秋节去的,所以说你们懂呀!!!那就是人多呀~多~呀~虽然说下着雨~但是也阻挡不了人们的热情~对,就是这么热情。\r\n“姑苏城外寒山寺,夜半钟声到客船”\r\n小时候,学习这首诗词的时候就蛮有赶脚的,印象蛮深刻的。直到长大了之后才知道姑苏原来就是苏州。\r\n一心念念叨叨的江南怎么能少得了苏州呢?\r\n直到中秋的前一个周这个念头才越发的强烈起来了,于是就开始定各种票,网上搜罗各种攻略:哪里好玩呀?什么好吃呀?天气怎么样?要穿什么呀?\r\n在我的三观里,不存在什么说走就走的旅行,没有目的的旅行称之为旅游。为了留出肚子来吃苏州的小吃,我在逛完了拙政园之后去全家…… 全家…… 买了三明治!~对你木有看错!就是三明治~\r\n社交软件上一搜,苏州松鹤楼的松鼠鱼蛮有名字的……但是好大一条……太甜太腻……我选择了放弃……投奔了桂花糕……生煎……糕点的怀抱……\r\nps:对了,每个景点都有客服中心,里面有电视讲解这个景点的历史故事,还有免费的导游讲解,不够有些要凑够人数……也有讲解机……这种地方最好跟着听一听,毕竟中国文化博大精深嘛~我跟着听了一点点的~不全~所以下面基本是我的碎碎念和照片~毕竟网上游记辣么多~百度都有介绍~我是按照我行走的步伐来排照片的~\r\n在ps:票都是在网络上买的,进景点的时候有的直接刷身份证就好,但是,寒山寺需要取票之后,拿票根进去的~', 'https://pic5.40017.cn/02/001/6a/02/rBLkCVtVeTiAB19lAAEYhhG11kw847_750x_00.jpg', 1, NULL, 832, NULL);
INSERT INTO `travelnote` VALUES (15, '苏州 闲散林木，渎一无二，古镇风韵', '门对香溪，背靠灵岩，\r\n乾隆皇帝每次下江南游木渎古镇的时候，必到虹饮山房，\r\n在这里游园、看戏、品茗、吟诗，直到夜色降临，才依依不舍离去。\r\n古松园内的罗汉松，苍翠虬劲。榜眼府第的石雕，精美至极。品尝完最美味的藏书羊肉，来到这里，没想到白象这么大，\r\n闲闲散散地沉浸在秋林中，花儿依然绽放，还和小伙伴们玩了玩真人CS。\r\n\r\n苏州素来以山水秀丽、园林典雅而闻名天下，\r\n有“江南园林甲天下，苏州园林甲江南”的美称，\r\n又因其小桥流水人家的水乡古城特色，有“东方水都”之称。\r\n如同苏州的精致园林一般，姑苏的春色，也是伴着吴侬软语，和着咿呀的江南小调，悄然显露。苏州，就是这需要慢步细行的温柔乡。“苏州园林甲天下”，苏州园林是建筑、山水、花木、雕刻、书画的综合艺术品，集自然美和艺术美于一体，构成了曲折迂回、步移景换的画面。除此之外，水乡古镇也是苏州的一大特色，四面环水，古代只有舟船与外界相通，所以街区和建筑保存完好。木渎古镇的历史同苏州古城一样悠久，这座水乡古镇本身稀松平常，沿着主街山塘街自西向东排布的古典园林严家花园、虹饮山房、古松园、榜眼府第，倒是带来了“园林古镇”的特色。\r\n伴着木渎山塘街的香溪和伍子胥率众开挖的人工运河胥江在东部的古桥斜桥下相汇，坐游船在充满历史故事的河道上晃晃悠悠，再听船娘用吴侬软语唱一曲也很不错。', 'https://pic5.40017.cn/02/000/4d/62/rBANDFtCd1WAW6SvAAJ6SsVUnks285_750x_00.jpg', NULL, NULL, 844, NULL);
INSERT INTO `travelnote` VALUES (16, '【冬游苏州】实拍太湖边壮丽璀璨的夕阳美景', '明天又要出门，去南岳衡山参加南岳摄影大赛，领略南岳的冬日美景，今天就再发一组苏州的片子，看看苏州太湖边东山岛上一次壮丽璀璨的夕阳美景吧！   我们是12月30日那天在同里用完午餐后，坐车赶往东山岛的。先在太湖码头坐游船，在烟波浩渺的太湖转了转，然后到达东山岛东部的启园。在启园转了一圈后，在太阳将要落山的半个多小时前，赶到了拍摄夕阳之地，湖滨公路旁一处比较开阔的地方。\r\n先看看启园吧，启园的园址原名叶家浜，是一处始建于民国时代的汉族古典园林建筑。原为民国实业家席启荪的私家花园，俗称席家花园，1933年席氏为纪念其上祖在此迎候康熙皇帝而兴建，占地50余亩。启园为江南不多见的山麓湖滨园林，依山而筑，傍湖而立，介乎山水之间。1984年被国务院批准列为太湖风景名胜区主要景点之一，经政府多次拨款整修扩建，才具今日之风貌。游罢启园，就在太湖东山镇外临湖的一条公路旁，拍到了这次日落。说实话，那天的日落很一般，日落时天空中没有云，光比大，光线强，俺加了“反渐变”镜，效果都很一般。直到太阳由亮到白，由白到黄，由黄到红，成了一轮红日以后，才有了“太湖夕阳”那壮丽璀璨的感觉，呵呵：', 'https://pic5.40017.cn/02/000/38/5e/rBLkCFs1utGANBLiAAC9pvx-ulk812_750x_00.jpg', NULL, NULL, 865, NULL);
INSERT INTO `travelnote` VALUES (17, '苏州园林—小游网师园', '网师园，一个富有诗意的名字，在苏州，名气不及拙政园，留园，却也是精致苏州园林的代表之作，敢问姑苏园林如此之多，而外国友人们却独爱网师园，这是为何？这座园子小而精的特性，的确最能代表园林意境。这可得从1978年说起呢。  \r\n\r\n1978年，美国纽约大都会艺术博物馆的友好人士来苏州 参观游览，被这里的 园林所陶醉 ，决意在其馆中建一座园林建筑。经过和苏州方面商谈，最后 决定仿照网师园的 殿春簃小院， 为了让美国 人民欣赏 中中国 的园林艺术 。这座园子最后 取名为“明轩”。 明轩由苏州园林工匠设计建造，一下子轰动了纽约 、轰动了美国 。施工期间，美国前总统 尼克松几次前去 参观 。明轩作为苏州园林的代表，开创了中国园林艺术 走出国门的先河。可能就是这个原因，导致每天来这里参观的外国人特别多，这里也是苏州园林中唯一开放也花园的地方，晚上在这里品上一壶茶，听上一段昆曲或评弹，享受一段正宗的苏式生活，可不美哉！  \r\n\r\n记得小时候来过这里，对这里的印象的确不深，不过从位于带城桥路边的阔家头 小巷子进去，沿路经过沈德潜故居和一些卖旅游纪念品的小摊，我们就进入了网师园，路不长，一两百米而已，却一下子从城市喧嚣走进了宁静氛围，一扇不大的对开门，走进厅堂，穿过回廊，一片池水假山，周边亭台楼阁，感觉甚好，坐在池边廊下的人们，说这话，聊着天，有带着小孩来感受园林的，有拿着画笔来描绘园林的，也有早晨来园林锻炼的年老者，总之，人少的时候，园子显得非常和谐，这也是普通老百姓生活在这里的真实写照。  ', 'https://pic5.40017.cn/01/001/3a/6b/rBLkBls2ya2AQ9TGAADIjhq5AYg787_750x_00.jpg', NULL, NULL, 864, NULL);
INSERT INTO `travelnote` VALUES (18, '渔洋山上观太湖、独行金鸡湖', '订购同程旅游网的酒店有幸获得100元激活码，又看到同程19日在苏州举办“细草摄影分享会”，毅然报名参加。同时在同程旅游客户端用激活码预订了苏州渔洋山景区的门票，80元，全免了哎。并上12306预订好火车票。\r\n\r\n19日上午在虹桥火车站乘6:42的动车，半个多小时就到苏州了，好快啊。7点半在苏州南广场乘上69路，5元。行程一个小时左右，该车途经苏州乐园和木渎古镇，很方便的。\r\n\r\n到景区后给景区检票人员看了电子门票后就可以进入了，10元钱乘坐景区观光车直接到山顶渔洋阁，贪婪地纵览太湖美景。接着进渔洋阁参观有关渔洋山的历史文化。看图片吧。经过法华寺，来到千斤井，知道了伍子胥与千斤小姐的传说。当年伍子胥遭楚平王追杀，穷困潦倒，是一浣纱小姐给于救助而生，日后成为吴国重臣后携千金前来报恩，得知小姐因救他而招诬陷投井而亡，伍子胥来到井边悲叹道：尔浣纱，我行乞，我腹饱，尔身溺，十年后，千金报。咬破​手指在石上血书：恩重如山，并将千金倒入井中。以示哀思之心和表达感恩之心。 ‍ ', 'https://pic5.40017.cn/01/000/39/5a/rBLkBls2QFOAeobZAAEK1QgO-Z0659_750x_00.jpg', NULL, NULL, 863, NULL);

-- ----------------------------
-- Table structure for travelnotecomment
-- ----------------------------
DROP TABLE IF EXISTS `travelnotecomment`;
CREATE TABLE `travelnotecomment`  (
  `travelNoteCommentId` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_userId` int(11) NOT NULL,
  `travelNote_travelNoteId` int(11) NOT NULL,
  PRIMARY KEY (`travelNoteCommentId`) USING BTREE,
  INDEX `fk_travelNoteComment_user1_idx`(`user_userId`) USING BTREE,
  INDEX `fk_travelNoteComment_travelNote1_idx`(`travelNote_travelNoteId`) USING BTREE,
  CONSTRAINT `fk_travelNoteComment_travelNote1` FOREIGN KEY (`travelNote_travelNoteId`) REFERENCES `travelnote` (`travelnoteid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_travelNoteComment_user1` FOREIGN KEY (`user_userId`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travelnotecomment
-- ----------------------------
INSERT INTO `travelnotecomment` VALUES (7, '美景如画，美人如画。', 832, 2);
INSERT INTO `travelnotecomment` VALUES (9, '赞', 1, 2);
INSERT INTO `travelnotecomment` VALUES (10, '相机不错', 868, 2);
INSERT INTO `travelnotecomment` VALUES (11, '真好', 844, 2);
INSERT INTO `travelnotecomment` VALUES (12, '不错', 864, 2);
INSERT INTO `travelnotecomment` VALUES (13, '大爱', 869, 2);
INSERT INTO `travelnotecomment` VALUES (14, '不错哟', 855, 2);
INSERT INTO `travelnotecomment` VALUES (15, '江山如此多娇', 865, 2);
INSERT INTO `travelnotecomment` VALUES (16, '好好好好', 866, 2);
INSERT INTO `travelnotecomment` VALUES (17, '照片已美哭！暖暖哒很温馨！', 863, 2);
INSERT INTO `travelnotecomment` VALUES (18, '漂亮', 832, 3);
INSERT INTO `travelnotecomment` VALUES (19, '奢侈的阳朔走', 1, 3);
INSERT INTO `travelnotecomment` VALUES (20, '楼主拍的真不错啊！', 868, 3);
INSERT INTO `travelnotecomment` VALUES (21, '赞', 855, 3);
INSERT INTO `travelnotecomment` VALUES (22, '太美了 么么哒', 865, 3);
INSERT INTO `travelnotecomment` VALUES (23, '不错', 866, 3);
INSERT INTO `travelnotecomment` VALUES (24, '好', 863, 3);
INSERT INTO `travelnotecomment` VALUES (25, '哇', 869, 4);
INSERT INTO `travelnotecomment` VALUES (26, '厉害呢', 855, 4);
INSERT INTO `travelnotecomment` VALUES (27, '看的我也想去了', 865, 4);
INSERT INTO `travelnotecomment` VALUES (28, '向你学习', 866, 4);
INSERT INTO `travelnotecomment` VALUES (29, '真不错呢', 863, 4);
INSERT INTO `travelnotecomment` VALUES (30, '好棒', 832, 4);
INSERT INTO `travelnotecomment` VALUES (31, '大爱', 868, 8);
INSERT INTO `travelnotecomment` VALUES (32, '好', 844, 8);
INSERT INTO `travelnotecomment` VALUES (33, '赞', 864, 8);
INSERT INTO `travelnotecomment` VALUES (34, '赞', 869, 8);
INSERT INTO `travelnotecomment` VALUES (35, '厉害', 855, 8);
INSERT INTO `travelnotecomment` VALUES (36, '不错呢', 865, 8);
INSERT INTO `travelnotecomment` VALUES (37, '哇', 869, 10);
INSERT INTO `travelnotecomment` VALUES (38, '赞', 855, 10);
INSERT INTO `travelnotecomment` VALUES (39, '相机拍的好赞', 865, 10);
INSERT INTO `travelnotecomment` VALUES (40, '赞', 866, 10);
INSERT INTO `travelnotecomment` VALUES (41, '厉害', 863, 10);
INSERT INTO `travelnotecomment` VALUES (42, '赞', 832, 11);
INSERT INTO `travelnotecomment` VALUES (43, '好', 1, 11);
INSERT INTO `travelnotecomment` VALUES (44, '很棒', 868, 11);
INSERT INTO `travelnotecomment` VALUES (45, '评论的都是人才', 844, 11);
INSERT INTO `travelnotecomment` VALUES (46, '好', 864, 11);
INSERT INTO `travelnotecomment` VALUES (47, '说的不错', 869, 11);
INSERT INTO `travelnotecomment` VALUES (48, '赞', 844, 12);
INSERT INTO `travelnotecomment` VALUES (49, '好赞啊', 864, 12);
INSERT INTO `travelnotecomment` VALUES (50, '真漂亮', 869, 12);
INSERT INTO `travelnotecomment` VALUES (51, '赞', 855, 12);
INSERT INTO `travelnotecomment` VALUES (52, '大爱', 865, 12);
INSERT INTO `travelnotecomment` VALUES (53, '赞', 866, 12);
INSERT INTO `travelnotecomment` VALUES (54, '赞', 832, 13);
INSERT INTO `travelnotecomment` VALUES (55, '厉害', 1, 13);
INSERT INTO `travelnotecomment` VALUES (56, '赞', 868, 13);
INSERT INTO `travelnotecomment` VALUES (57, '好', 844, 13);
INSERT INTO `travelnotecomment` VALUES (58, '人真多啊', 864, 13);
INSERT INTO `travelnotecomment` VALUES (59, '好赞', 855, 13);
INSERT INTO `travelnotecomment` VALUES (60, '赞', 844, 14);
INSERT INTO `travelnotecomment` VALUES (61, '大爱', 864, 14);
INSERT INTO `travelnotecomment` VALUES (62, '好', 869, 14);
INSERT INTO `travelnotecomment` VALUES (63, '棒棒的呀', 855, 14);
INSERT INTO `travelnotecomment` VALUES (64, '厉害呗', 865, 14);
INSERT INTO `travelnotecomment` VALUES (65, '真漂亮', 866, 14);
INSERT INTO `travelnotecomment` VALUES (66, '天热了', 832, 15);
INSERT INTO `travelnotecomment` VALUES (67, '爽', 1, 15);
INSERT INTO `travelnotecomment` VALUES (68, '漂亮', 868, 15);
INSERT INTO `travelnotecomment` VALUES (69, '赞', 844, 15);
INSERT INTO `travelnotecomment` VALUES (70, '不错不错啊', 864, 15);
INSERT INTO `travelnotecomment` VALUES (71, '赞', 869, 16);
INSERT INTO `travelnotecomment` VALUES (72, '说得好', 855, 16);
INSERT INTO `travelnotecomment` VALUES (73, '不错啊', 865, 16);
INSERT INTO `travelnotecomment` VALUES (74, '厉害', 866, 16);
INSERT INTO `travelnotecomment` VALUES (75, '好美啊', 863, 16);
INSERT INTO `travelnotecomment` VALUES (76, '拍的真美啊 ', 832, 17);
INSERT INTO `travelnotecomment` VALUES (77, '我也去过 没搂住拍的漂亮', 1, 17);
INSERT INTO `travelnotecomment` VALUES (78, '赞', 868, 17);
INSERT INTO `travelnotecomment` VALUES (79, '好', 844, 17);
INSERT INTO `travelnotecomment` VALUES (80, '大赞', 864, 17);
INSERT INTO `travelnotecomment` VALUES (81, '不错呢', 869, 18);
INSERT INTO `travelnotecomment` VALUES (82, '好', 855, 18);
INSERT INTO `travelnotecomment` VALUES (83, '真棒', 865, 18);
INSERT INTO `travelnotecomment` VALUES (84, '赞', 866, 18);
INSERT INTO `travelnotecomment` VALUES (85, '大爱', 863, 18);

-- ----------------------------
-- Table structure for travelnoteprise
-- ----------------------------
DROP TABLE IF EXISTS `travelnoteprise`;
CREATE TABLE `travelnoteprise`  (
  `travelNotePriseId` int(11) NOT NULL AUTO_INCREMENT,
  `travelNote_travelNoteId` int(11) NOT NULL,
  `user_userId` int(11) NOT NULL,
  `prisetime` time(6) NULL DEFAULT NULL,
  PRIMARY KEY (`travelNotePriseId`) USING BTREE,
  INDEX `fk_travelNotePrise_travelNote1_idx`(`travelNote_travelNoteId`) USING BTREE,
  INDEX `fk_travelNotePrise_user1_idx`(`user_userId`) USING BTREE,
  CONSTRAINT `fk_travelNotePrise_travelNote1` FOREIGN KEY (`travelNote_travelNoteId`) REFERENCES `travelnote` (`travelnoteid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_travelNotePrise_user1` FOREIGN KEY (`user_userId`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPwd` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userImage` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userPhone`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `userId_2`(`userId`) USING BTREE,
  INDEX `userId_3`(`userId`) USING BTREE,
  INDEX `userId_4`(`userId`) USING BTREE,
  INDEX `userId_5`(`userId`) USING BTREE,
  INDEX `userId_6`(`userId`) USING BTREE,
  INDEX `userId_7`(`userId`) USING BTREE,
  INDEX `userId_8`(`userId`) USING BTREE,
  INDEX `userId_9`(`userId`) USING BTREE,
  INDEX `userId_10`(`userId`) USING BTREE,
  INDEX `userId_11`(`userId`) USING BTREE,
  INDEX `userId_12`(`userId`) USING BTREE,
  INDEX `userId_13`(`userId`) USING BTREE,
  INDEX `userId_14`(`userId`) USING BTREE,
  INDEX `userId_15`(`userId`) USING BTREE,
  INDEX `userId_16`(`userId`) USING BTREE,
  INDEX `userId_17`(`userId`) USING BTREE,
  INDEX `userId_18`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 869 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (832, '徐洁', '665544', '12390675632', NULL);
INSERT INTO `user` VALUES (1, '王思聪', '213654', '13103907892', NULL);
INSERT INTO `user` VALUES (868, 'tom', '34b7da764b21d298ef307d04d8152dc5', '15874236654', NULL);
INSERT INTO `user` VALUES (844, '樟树街', '224533', '18262047890', NULL);
INSERT INTO `user` VALUES (864, '陈梦杰', '77ga441', '18265478963', NULL);
INSERT INTO `user` VALUES (869, '唐心', '522991', '18325964789', NULL);
INSERT INTO `user` VALUES (855, '陈林', '123456', '18360839064', NULL);
INSERT INTO `user` VALUES (865, '沈栋', '49154ae5', '18365419676', NULL);
INSERT INTO `user` VALUES (866, '流畅', '226632', '18562038772', NULL);
INSERT INTO `user` VALUES (863, '王杰', '5412fa55', '18636547895', NULL);

SET FOREIGN_KEY_CHECKS = 1;
