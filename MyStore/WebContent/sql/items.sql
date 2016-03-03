SET FOREIGN_KEY_CHECKS=0;

/*TABLE STRUCTURE FOR ITEMS*/
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL auto_increment,
  `brand` varchar(50) default NULL,
  `name` varchar(100) default NULL,
  `drums` varchar(100) default NULL,
  `hardware` varchar(50) default NULL,
  `cymbals` varchar(50) default NULL,
  `discription` varchar(200) default NULL,
  `image` varchar(50) default NULL,
  `price` float(10,2) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', 'Mapex', 'Tornado Rock Drum Set','14x5.5 snare,10x8 and 12x9 shallow,16x14 floor tom,22x16 kick','a full set of double braced hardware','Hi Hat & Crash/Ride cymbals','THE ROCK FUSION HYBRID WITH CONTEMPORARY SHELL SIZES!','1.jpg','499.00');
INSERT INTO `items` VALUES ('2', 'Mapex', 'Armory Kit','14x5.5 snare,10x8 and 12x9 shallow,16x14 floor tom,22x16 kick','a full set of double braced hardware','Hi Hat & Crash/Ride cymbals','THE ROCK FUSION HYBRID WITH CONTEMPORARY SHELL SIZES!','2.jpg','1050.00');
INSERT INTO `items` VALUES ('3', 'TAMA', 'Imperialstar Hyper-Drive 5-piece Drum Set With Cymbals','14x5.5 snare,10x8 and 12x9 shallow,16x14 floor tom,22x16 kick','a full set of double braced hardware','Hi Hat & Crash/Ride cymbals','THE ROCK FUSION HYBRID WITH CONTEMPORARY SHELL SIZES!','3.jpg','1050.00');
INSERT INTO `items` VALUES ('4', 'TAMA', 'HyperDrive 5 Piece Shell Kit-Chanmpagne Sparkle','14x5.5 snare,10x8 and 12x9 shallow,16x14 floor tom,22x16 kick','a full set of double braced hardware','Hi Hat & Crash/Ride cymbals','THE ROCK FUSION HYBRID WITH CONTEMPORARY SHELL SIZES!','4.jpg','699.00');
INSERT INTO `items` VALUES ('5', 'SONOR', 'Essential Force Stage 3 5-Piece Drum Kit With Hardware','14x5.5 snare,10x8 and 12x9 shallow,16x14 floor tom,22x16 kick','a full set of double braced hardware','Hi Hat & Crash/Ride cymbals','THE ROCK FUSION HYBRID WITH CONTEMPORARY SHELL SIZES!','5.jpg','300.00');
INSERT INTO `items` VALUES ('6', 'TAMA', 'Silverstar Custom 6-Piece Drum Kit','14x5.5 snare,10x8 and 12x9 shallow,16x14 floor tom,22x16 kick','a full set of double braced hardware','Hi Hat & Crash/Ride cymbals','THE ROCK FUSION HYBRID WITH CONTEMPORARY SHELL SIZES!','6.jpg','800.00');
INSERT INTO `items` VALUES ('7', 'PEARL', 'Export EXX 5 Piece Kit With Hardware & Cymbals','14x5.5 snare,10x8 and 12x9 shallow,16x14 floor tom,22x16 kick','a full set of double braced hardware','Hi Hat & Crash/Ride cymbals','THE ROCK FUSION HYBRID WITH CONTEMPORARY SHELL SIZES!','7.jpg','1500.00');
INSERT INTO `items` VALUES ('8', 'PEARL', 'Export EXX 5 Piece Kit With Hardware & Cymbals','14x5.5 snare,10x8 and 12x9 shallow,16x14 floor tom,22x16 kick','a full set of double braced hardware','Hi Hat & Crash/Ride cymbals','THE ROCK FUSION HYBRID WITH CONTEMPORARY SHELL SIZES!','8.jpg','500.00');
INSERT INTO `items` VALUES ('9', 'PDP', 'CB4 Concept Birch 4-Piece Shell Pack','14x5.5 snare,10x8 and 12x9 shallow,16x14 floor tom,22x16 kick','a full set of double braced hardware','Hi Hat & Crash/Ride cymbals','THE ROCK FUSION HYBRID WITH CONTEMPORARY SHELL SIZES!','9.jpg','600.00');



