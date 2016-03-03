SET FOREIGN_KEY_CHECKS=0;

/*TABLE STRUCTURE FOR ITEMS*/
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `birthday` date default NULL,
  `gender` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'abc', '123','19910822','female');
INSERT INTO `users` VALUES ('2', 'opq', '456','19920318','male');
INSERT INTO `users` VALUES ('3', 'xyz', '789','19931104','female');
