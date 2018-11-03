/*
 Navicat Premium Data Transfer

 Source Server         : myServer
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 18/09/2018 09:51:30
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for travelnote
-- ----------------------------
DROP TABLE IF EXISTS `travelnote`;
CREATE TABLE `travelnote`  (
  `travelNoteId` int(11) NOT NULL AUTO_INCREMENT,
  `travelTitle` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travelNoteContent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travelNoteImage` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
  INDEX `travelNoteId_7`(`travelNoteId`) USING BTREE,
  CONSTRAINT `fk_游记表_user 用户信息1` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travelnote
-- ----------------------------
INSERT INTO `travelnote` VALUES (2, '留园', '我们第一个景点就是留园，中国四大名园之一，差不多两个小时就能把整个园走遍。门口的古装小生还是比较有趣的，比较应留园的景。进去后不得不佩服此园的设计者，也感概以前的有钱人真的很会享受生活，对生活很讲究。园林里的假山石都是太湖石，典型的特色就是:皱，漏，瘦，透 。园林四通八达，我们参照着游览册的地图全都走了一遍，里面有假山，有园中湖，有小径有竹林。看着这些都想回农村也造一个了，一直都向往这种惬意的生活，只是在当今社会太不现实了。总体值得去看，就是节假日人太多，有点失了兴致，照片也没怎么拍。', '1', NULL, NULL, 855, 20);
INSERT INTO `travelnote` VALUES (3, '金鸡湖', '苏州 人盼了3年的\r\n梦幻喷泉将重新上演！\r\n简直太棒了有没有！来 苏州 旅游的朋友们可以在 苏州 中心吃着美食边看音乐喷泉啦。', '2', NULL, NULL, 844, 33);
INSERT INTO `travelnote` VALUES (4, '独墅湖', '斜塘位于苏州工业园区南部城市核心区域，南面与苏州市吴中区隔河相望，北面紧靠园区中新合作区，东面滨临金鸡湖、独墅湖，吴淞江、镬底潭与斜塘河三大水系环绕街道南北。\r\n\r\n斜塘具有千年的历史文化底蕴。曾几何时，这里河流纵横交错，湖荡星罗棋布，水照着天，天飘着云，映衬着老树、村舍、小桥、堤岸、田畴，也映衬着当地居民恬淡、平静的生活', '2', NULL, NULL, 832, 25);
INSERT INTO `travelnote` VALUES (8, '虎丘', '虎丘山风景名胜区位于苏州古城西北角的虎丘山风景名胜区，有2500多年的悠久历史，有“吴中第一名胜”、“吴中第一山”的美誉，宋代大诗人苏东坡写下“到苏州不游虎丘，乃憾事也！”的千古名言。', '3', NULL, NULL, 866, NULL);
INSERT INTO `travelnote` VALUES (9, '虎丘', '虎丘山风景名胜区位于苏州古城西北角的虎丘山风景名胜区，有2500多年的悠久历史，有“吴中第一名胜”、“吴中第一山”的美誉，宋代大诗人苏东坡写下“到苏州不游虎丘，乃憾事也！”的千古名言。', '3', NULL, NULL, 866, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travelnotecomment
-- ----------------------------
INSERT INTO `travelnotecomment` VALUES (1, '留园就像你说的真好啊', 832, 2);
INSERT INTO `travelnotecomment` VALUES (2, '看你的游记我也想去金鸡湖了啊 ', 832, 3);
INSERT INTO `travelnotecomment` VALUES (3, '独墅湖我还没去过呢', 832, 4);
INSERT INTO `travelnotecomment` VALUES (4, '留园真棒  我也要去看下', 844, 2);
INSERT INTO `travelnotecomment` VALUES (5, '音乐喷泉好漂亮', 844, 3);
INSERT INTO `travelnotecomment` VALUES (6, '虎丘听你这样说真好啊', 855, 8);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPwd` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPhone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userImage` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
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
) ENGINE = InnoDB AUTO_INCREMENT = 867 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王思聪', '213654', '13103907892', NULL);
INSERT INTO `user` VALUES (832, '徐洁', '665544', '1239067563', NULL);
INSERT INTO `user` VALUES (844, '樟树街', '224533', '1826204789', NULL);
INSERT INTO `user` VALUES (855, '陈林', '123456', '1836083906', NULL);
INSERT INTO `user` VALUES (866, '流畅', '226632', '1856203877', NULL);
INSERT INTO `user` VALUES (868, 'tom', '34b7da764b21d298ef307d04d8152dc5', '15874236654', NULL);

SET FOREIGN_KEY_CHECKS = 1;
