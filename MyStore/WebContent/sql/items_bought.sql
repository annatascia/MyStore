SET FOREIGN_KEY_CHECKS=0;

/*TABLE STRUCTURE FOR ITEMS*/
DROP TABLE IF EXISTS `items_bought`;
CREATE TABLE `items_bought` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL,
  `itemId` int(11) default NULL,
  `amount` int(11) default NULL,
  `buyDate` date default NULL,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------

