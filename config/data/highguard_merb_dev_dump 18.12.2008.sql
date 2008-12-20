# CocoaMySQL dump
# Version 0.7b5
# http://cocoamysql.sourceforge.net
#
# Host: localhost (MySQL 5.0.45)
# Database: highguard_merb_dev
# Generation Time: 2008-12-18 20:35:00 +0100
# ************************************************************

# Dump of table barbettes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `barbettes`;

CREATE TABLE `barbettes` (
  `id` int(11) NOT NULL auto_increment,
  `size` varchar(50) default NULL,
  `number` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `ship_id` int(11) default NULL,
  `weapon_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

INSERT INTO `barbettes` (`id`,`size`,`number`,`created_at`,`updated_at`,`ship_id`,`weapon_id`) VALUES ('21','5','50','2008-12-14 20:52:56','2008-12-14 20:52:56','1','6');
INSERT INTO `barbettes` (`id`,`size`,`number`,`created_at`,`updated_at`,`ship_id`,`weapon_id`) VALUES ('22','5','50','2008-12-14 20:53:15','2008-12-14 20:53:15','1','1');
INSERT INTO `barbettes` (`id`,`size`,`number`,`created_at`,`updated_at`,`ship_id`,`weapon_id`) VALUES ('25','5','10000','2008-12-15 19:18:32','2008-12-15 19:18:32','8','1');
INSERT INTO `barbettes` (`id`,`size`,`number`,`created_at`,`updated_at`,`ship_id`,`weapon_id`) VALUES ('34','5','0','2008-12-15 23:07:29','2008-12-15 23:07:29','9','1');
INSERT INTO `barbettes` (`id`,`size`,`number`,`created_at`,`updated_at`,`ship_id`,`weapon_id`) VALUES ('42','5','2','2008-12-16 19:45:43','2008-12-16 19:45:43','7','6');
INSERT INTO `barbettes` (`id`,`size`,`number`,`created_at`,`updated_at`,`ship_id`,`weapon_id`) VALUES ('43','5','4','2008-12-16 19:45:50','2008-12-16 19:45:50','7','1');


# Dump of table bays
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bays`;

CREATE TABLE `bays` (
  `id` int(11) NOT NULL auto_increment,
  `size` varchar(255) default NULL,
  `weapon_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `number` int(11) default NULL,
  `ship_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

INSERT INTO `bays` (`id`,`size`,`weapon_id`,`created_at`,`updated_at`,`number`,`ship_id`) VALUES ('50','50','6','2008-12-14 21:09:27','2008-12-14 21:09:27','4','1');
INSERT INTO `bays` (`id`,`size`,`weapon_id`,`created_at`,`updated_at`,`number`,`ship_id`) VALUES ('58','100','6','2008-12-15 19:16:25','2008-12-15 19:16:25','500','8');
INSERT INTO `bays` (`id`,`size`,`weapon_id`,`created_at`,`updated_at`,`number`,`ship_id`) VALUES ('59','50','1','2008-12-15 19:17:30','2008-12-15 19:17:30','500','8');
INSERT INTO `bays` (`id`,`size`,`weapon_id`,`created_at`,`updated_at`,`number`,`ship_id`) VALUES ('63','100','1','2008-12-15 23:06:13','2008-12-15 23:06:13','100','9');
INSERT INTO `bays` (`id`,`size`,`weapon_id`,`created_at`,`updated_at`,`number`,`ship_id`) VALUES ('65','100','6','2008-12-15 23:08:32','2008-12-15 23:08:32','200','9');
INSERT INTO `bays` (`id`,`size`,`weapon_id`,`created_at`,`updated_at`,`number`,`ship_id`) VALUES ('75','50','1','2008-12-16 20:44:31','2008-12-16 20:44:31','6','1');
INSERT INTO `bays` (`id`,`size`,`weapon_id`,`created_at`,`updated_at`,`number`,`ship_id`) VALUES ('77','50','1','2008-12-16 23:46:10','2008-12-16 23:46:10','1','7');


# Dump of table computers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `computers`;

CREATE TABLE `computers` (
  `id` int(11) NOT NULL auto_increment,
  `tonnage` int(11) default NULL,
  `capacity` varchar(50) default NULL,
  `tech_level` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `model` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table configurations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `configurations`;

CREATE TABLE `configurations` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `streamlined` varchar(50) default NULL,
  `modifier` float default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `configurations` (`id`,`name`,`streamlined`,`modifier`,`created_at`,`updated_at`) VALUES ('2','Needle/Wedge','streamlined','1.2','2008-12-09 08:46:45','2008-12-09 08:46:45');
INSERT INTO `configurations` (`id`,`name`,`streamlined`,`modifier`,`created_at`,`updated_at`) VALUES ('3','Cone','streamlined','1.1','2008-12-09 08:46:45','2008-12-09 08:46:45');
INSERT INTO `configurations` (`id`,`name`,`streamlined`,`modifier`,`created_at`,`updated_at`) VALUES ('4','Cylinder','partial','1','2008-12-09 08:46:45','2008-12-09 08:46:45');
INSERT INTO `configurations` (`id`,`name`,`streamlined`,`modifier`,`created_at`,`updated_at`) VALUES ('5','Close Structure','partial','0.6','2008-12-09 08:46:45','2008-12-09 08:46:45');
INSERT INTO `configurations` (`id`,`name`,`streamlined`,`modifier`,`created_at`,`updated_at`) VALUES ('6','Sphere','partial','0.7','2008-12-09 08:46:45','2008-12-09 08:46:45');
INSERT INTO `configurations` (`id`,`name`,`streamlined`,`modifier`,`created_at`,`updated_at`) VALUES ('7','Flattened Sphere','streamlined','0.8','2008-12-09 08:46:45','2008-12-09 08:46:45');
INSERT INTO `configurations` (`id`,`name`,`streamlined`,`modifier`,`created_at`,`updated_at`) VALUES ('8','Dispersed Structure','non-streamlined','0.5','2008-12-09 08:46:45','2008-12-09 08:46:45');
INSERT INTO `configurations` (`id`,`name`,`streamlined`,`modifier`,`created_at`,`updated_at`) VALUES ('9','Planetoid','non-streamlined','0','2008-12-09 08:46:45','2008-12-09 08:46:45');
INSERT INTO `configurations` (`id`,`name`,`streamlined`,`modifier`,`created_at`,`updated_at`) VALUES ('10','Buffered Planetoid','non-streamlined','0','2008-12-09 08:46:45','2008-12-09 08:46:45');


# Dump of table migration_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migration_info`;

CREATE TABLE `migration_info` (
  `migration_name` varchar(255) default NULL,
  UNIQUE KEY `migration_name` (`migration_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `migration_info` (`migration_name`) VALUES ('setup_configurations');


# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `session_id` varchar(32) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ships`;

CREATE TABLE `ships` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `class_description` text,
  `ship_type` varchar(50) default NULL,
  `tonnage` int(11) NOT NULL,
  `techlevel` int(11) NOT NULL,
  `staterooms` int(11) NOT NULL,
  `jumpdrive` int(11) NOT NULL,
  `thrust` int(11) NOT NULL,
  `power` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `computer_id` int(11) default NULL,
  `configuration_id` int(11) default NULL,
  `tech_level` int(11) default NULL,
  `description` text,
  `turret_id` int(11) default NULL,
  `bay_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `ships` (`id`,`name`,`class_description`,`ship_type`,`tonnage`,`techlevel`,`staterooms`,`jumpdrive`,`thrust`,`power`,`price`,`created_at`,`updated_at`,`computer_id`,`configuration_id`,`tech_level`,`description`,`turret_id`,`bay_id`) VALUES ('1','Cruiser','The description is not\r\n                                                                                                                                                                                                                                                                                                                                                                                                                  \r\n                                                                                                                                                                                                                                                                                                                                                                                                                                    \r\n                                                                                                                                                                                                                                                                                                                                                                                                                                    ','','10000','14','0','4','6','6','0','2008-12-03 20:00:25','2008-12-16 20:45:12',NULL,'4','15',NULL,NULL,NULL);
INSERT INTO `ships` (`id`,`name`,`class_description`,`ship_type`,`tonnage`,`techlevel`,`staterooms`,`jumpdrive`,`thrust`,`power`,`price`,`created_at`,`updated_at`,`computer_id`,`configuration_id`,`tech_level`,`description`,`turret_id`,`bay_id`) VALUES ('3','Trader','',NULL,'200','0','0','3','6','6','0','2008-12-09 23:05:00','2008-12-18 10:36:40',NULL,'6','14',NULL,NULL,NULL);
INSERT INTO `ships` (`id`,`name`,`class_description`,`ship_type`,`tonnage`,`techlevel`,`staterooms`,`jumpdrive`,`thrust`,`power`,`price`,`created_at`,`updated_at`,`computer_id`,`configuration_id`,`tech_level`,`description`,`turret_id`,`bay_id`) VALUES ('7','Flying Railgun',NULL,NULL,'600','0','10','3','6','6','0','2008-12-14 23:01:01','2008-12-16 23:45:57',NULL,'3','15',NULL,NULL,NULL);
INSERT INTO `ships` (`id`,`name`,`class_description`,`ship_type`,`tonnage`,`techlevel`,`staterooms`,`jumpdrive`,`thrust`,`power`,`price`,`created_at`,`updated_at`,`computer_id`,`configuration_id`,`tech_level`,`description`,`turret_id`,`bay_id`) VALUES ('9','Death Star',NULL,NULL,'1000000','0','0','3','1','6','0','2008-12-15 23:04:02','2008-12-18 17:15:47',NULL,'6','15',NULL,NULL,NULL);


# Dump of table turrets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `turrets`;

CREATE TABLE `turrets` (
  `id` int(11) NOT NULL auto_increment,
  `size` varchar(50) default NULL,
  `weapon_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `ship_id` int(11) default NULL,
  `number` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `turrets` (`id`,`size`,`weapon_id`,`created_at`,`updated_at`,`ship_id`,`number`) VALUES ('2','Triple','2','2008-12-15 23:04:55','2008-12-15 23:04:55','9','1000');


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(50) default NULL,
  `crypted_password` varchar(50) default NULL,
  `salt` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table weapons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `weapons`;

CREATE TABLE `weapons` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `min_tech_level` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `turret` tinyint(4) default NULL,
  `bay` tinyint(4) default NULL,
  `barbette` tinyint(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `weapons` (`id`,`name`,`min_tech_level`,`created_at`,`updated_at`,`turret`,`bay`,`barbette`) VALUES ('1','Railgun','9','2008-12-12 08:24:32','2008-12-12 08:24:37','0','1','1');
INSERT INTO `weapons` (`id`,`name`,`min_tech_level`,`created_at`,`updated_at`,`turret`,`bay`,`barbette`) VALUES ('2','Laser','8','2008-12-12 08:38:24','2008-12-12 08:38:55','1','0','0');
INSERT INTO `weapons` (`id`,`name`,`min_tech_level`,`created_at`,`updated_at`,`turret`,`bay`,`barbette`) VALUES ('3','Missle','7','2008-12-12 21:31:40','2008-12-12 21:31:45','1','1','0');
INSERT INTO `weapons` (`id`,`name`,`min_tech_level`,`created_at`,`updated_at`,`turret`,`bay`,`barbette`) VALUES ('4','Meson Gun','8','2008-12-12 21:32:42','2008-12-12 21:32:42','0','1','0');
INSERT INTO `weapons` (`id`,`name`,`min_tech_level`,`created_at`,`updated_at`,`turret`,`bay`,`barbette`) VALUES ('5','Sandcaster','7','2008-12-12 21:47:27','2008-12-12 21:47:27','1','0','0');
INSERT INTO `weapons` (`id`,`name`,`min_tech_level`,`created_at`,`updated_at`,`turret`,`bay`,`barbette`) VALUES ('6','Torpedo','9','2008-12-13 11:21:20','2008-12-13 11:21:20','0','1','1');


