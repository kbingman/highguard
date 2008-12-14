-- MySQL dump 10.11
--
-- Host: localhost    Database: highguard_merb_dev
-- ------------------------------------------------------
-- Server version	5.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barbettes`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barbettes`
--

LOCK TABLES `barbettes` WRITE;
/*!40000 ALTER TABLE `barbettes` DISABLE KEYS */;
/*!40000 ALTER TABLE `barbettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bays`
--

DROP TABLE IF EXISTS `bays`;
CREATE TABLE `bays` (
  `id` int(11) NOT NULL auto_increment,
  `size` int(50) default NULL,
  `weapon_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `number` int(11) default NULL,
  `ship_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bays`
--

LOCK TABLES `bays` WRITE;
/*!40000 ALTER TABLE `bays` DISABLE KEYS */;
INSERT INTO `bays` VALUES (1,50,1,'2008-12-12 08:25:46','2008-12-12 08:41:15',10,1);
/*!40000 ALTER TABLE `bays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computers`
--

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

--
-- Dumping data for table `computers`
--

LOCK TABLES `computers` WRITE;
/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

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

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (2,'Needle/Wedge','streamlined',1.2,'2008-12-09 08:46:45','2008-12-09 08:46:45'),(3,'Cone','streamlined',1.1,'2008-12-09 08:46:45','2008-12-09 08:46:45'),(4,'Cylinder','partial',1,'2008-12-09 08:46:45','2008-12-09 08:46:45'),(5,'Close Structure','partial',0.6,'2008-12-09 08:46:45','2008-12-09 08:46:45'),(6,'Sphere','partial',0.7,'2008-12-09 08:46:45','2008-12-09 08:46:45'),(7,'Flattened Sphere','streamlined',0.8,'2008-12-09 08:46:45','2008-12-09 08:46:45'),(8,'Dispersed Structure','non-streamlined',0.5,'2008-12-09 08:46:45','2008-12-09 08:46:45'),(9,'Planetoid','non-streamlined',0,'2008-12-09 08:46:45','2008-12-09 08:46:45'),(10,'Buffered Planetoid','non-streamlined',0,'2008-12-09 08:46:45','2008-12-09 08:46:45');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_info`
--

DROP TABLE IF EXISTS `migration_info`;
CREATE TABLE `migration_info` (
  `migration_name` varchar(255) default NULL,
  UNIQUE KEY `migration_name` (`migration_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration_info`
--

LOCK TABLES `migration_info` WRITE;
/*!40000 ALTER TABLE `migration_info` DISABLE KEYS */;
INSERT INTO `migration_info` VALUES ('setup_configurations');
/*!40000 ALTER TABLE `migration_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(32) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ships`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships` VALUES (1,'Cruiser','The description is not\r\n                                                                                                                                                                                                                                                                                                                                                                                                                  \r\n                                                                                                                                                                                                                                                                                                                                                                                                                                    \r\n                                                                                                                                                                                                                                                                                                                                                                                                                                    ','',10000,14,0,4,6,6,0,'2008-12-03 20:00:25','2008-12-13 16:56:01',NULL,8,15,NULL,NULL,NULL),(3,'Trader','',NULL,200,0,0,0,1,1,0,'2008-12-09 23:05:00','2008-12-10 08:28:07',NULL,6,8,NULL,NULL,NULL),(4,'Testing',NULL,NULL,10000,0,4,3,6,6,0,'2008-12-10 19:37:58','2008-12-10 19:48:22',NULL,2,12,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turrets`
--

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

--
-- Dumping data for table `turrets`
--

LOCK TABLES `turrets` WRITE;
/*!40000 ALTER TABLE `turrets` DISABLE KEYS */;
INSERT INTO `turrets` VALUES (1,'Single',2,'2008-12-12 08:40:00','2008-12-12 08:45:06',1,2),(2,'Barbette',1,'2008-12-12 09:03:34','2008-12-12 09:05:17',1,10);
/*!40000 ALTER TABLE `turrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

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

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

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

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES (1,'Railgun',9,'2008-12-12 08:24:32','2008-12-12 08:24:37',0,1,1),(2,'Laser',8,'2008-12-12 08:38:24','2008-12-12 08:38:55',1,0,0),(3,'Missle',7,'2008-12-12 21:31:40','2008-12-12 21:31:45',1,1,1),(4,'Meson Gun',8,'2008-12-12 21:32:42','2008-12-12 21:32:42',0,1,0),(5,'Sandcaster',7,'2008-12-12 21:47:27','2008-12-12 21:47:27',1,0,0),(6,'Torpedo',9,'2008-12-13 11:21:20','2008-12-13 11:21:20',0,1,1);
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-12-13 16:50:49
