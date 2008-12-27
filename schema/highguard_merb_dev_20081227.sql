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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barbettes`
--

LOCK TABLES `barbettes` WRITE;
/*!40000 ALTER TABLE `barbettes` DISABLE KEYS */;
INSERT INTO `barbettes` VALUES (25,'5',10000,'2008-12-15 19:18:32','2008-12-15 19:18:32',8,1),(42,'5',2,'2008-12-16 19:45:43','2008-12-16 19:45:43',7,6),(43,'5',4,'2008-12-16 19:45:50','2008-12-16 19:45:50',7,1),(65,'5',70,'2008-12-26 22:12:45','2008-12-26 23:58:58',1,1),(66,'5',20,'2008-12-26 23:25:01','2008-12-26 23:25:04',1,6);
/*!40000 ALTER TABLE `barbettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bays`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bays`
--

LOCK TABLES `bays` WRITE;
/*!40000 ALTER TABLE `bays` DISABLE KEYS */;
INSERT INTO `bays` VALUES (58,'100',6,'2008-12-15 19:16:25','2008-12-15 19:16:25',500,8),(65,'100',6,'2008-12-15 23:08:32','2008-12-15 23:08:32',200,9),(107,'100',4,'2008-12-26 15:11:03','2008-12-26 15:11:03',100,9),(108,'100',1,'2008-12-26 15:11:09','2008-12-26 15:11:09',100,9),(109,'50',1,'2008-12-26 15:11:15','2008-12-26 15:11:15',100,9),(110,'50',1,'2008-12-26 15:11:38','2008-12-26 15:11:38',500,9),(136,'50',1,'2008-12-27 09:23:56','2008-12-27 09:29:37',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships` VALUES (1,'Cruiser','The description is not\r\n                                                                                                                                                                                                                                                                                                                                                                                                                  \r\n                                                                                                                                                                                                                                                                                                                                                                                                                                    \r\n                                                                                                                                                                                                                                                                                                                                                                                                                                    ','',10000,14,20,4,6,6,0,'2008-12-03 20:00:25','2008-12-27 09:24:36',NULL,4,14,'A big fast ship test',NULL,NULL),(3,'Trader','',NULL,200,0,0,3,6,6,0,'2008-12-09 23:05:00','2008-12-25 19:50:34',NULL,10,13,'',NULL,NULL),(7,'Flying Railgun',NULL,NULL,600,0,10,1,6,6,0,'2008-12-14 23:01:01','2008-12-25 19:32:57',NULL,3,9,'',NULL,NULL),(9,'Death Star',NULL,NULL,1000000,0,0,2,1,6,0,'2008-12-15 23:04:02','2008-12-26 15:10:45',NULL,9,15,'',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `turrets`
--

LOCK TABLES `turrets` WRITE;
/*!40000 ALTER TABLE `turrets` DISABLE KEYS */;
INSERT INTO `turrets` VALUES (2,'Triple',2,'2008-12-15 23:04:55','2008-12-15 23:04:55',9,1000);
/*!40000 ALTER TABLE `turrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(50) default NULL,
  `file_size` int(11) default NULL,
  `content_type` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES (71,'117016_5000x5000.jpg',646462,'image/jpeg'),(72,'116993_5000x5000.jpg',384891,'image/jpeg'),(73,'116293_5000x5000.jpg',188886,'image/jpeg'),(74,'116274_5000x5000.jpg',397663,'image/jpeg'),(75,'117013_5000x5000.jpg',435326,'image/jpeg'),(76,'117009_5000x5000.jpg',227208,'image/jpeg'),(77,'117006_5000x5000.jpg',666926,'image/jpeg'),(78,'116290_5000x5000.jpg',478558,'image/jpeg'),(79,'117011_5000x5000.jpg',891982,'image/jpeg'),(80,'116282_5000x5000.jpg',258897,'image/jpeg'),(81,'114031_5000x5000.jpg',550214,'image/jpeg'),(82,'116272_5000x5000.jpg',335966,'image/jpeg'),(83,'117010_5000x5000.jpg',452907,'image/jpeg'),(84,'116285_5000x5000.jpg',284441,'image/jpeg'),(85,'116996_5000x5000.jpg',186518,'image/jpeg'),(86,'117005_5000x5000.jpg',298344,'image/jpeg'),(88,'113017_5000x5000.jpg',294830,'image/jpeg'),(89,'116292_5000x5000.jpg',327405,'image/jpeg'),(90,'113030_5000x5000.jpg',434372,'image/jpeg'),(91,'114018_5000x5000.jpg',245762,'image/jpeg'),(92,'113995_5000x5000.jpg',411998,'image/jpeg'),(93,'116295_5000x5000.jpg',479779,'image/jpeg'),(94,'114021_5000x5000.jpg',389790,'image/jpeg'),(95,'113025_5000x5000.jpg',286301,'image/jpeg'),(96,'117021_5000x5000.jpg',710372,'image/jpeg'),(97,'114033_5000x5000.jpg',353186,'image/jpeg'),(99,'113991_5000x5000.jpg',342564,'image/jpeg'),(102,'117763_5000x5000.jpg',NULL,NULL),(103,'117764_5000x5000.jpg',NULL,NULL),(104,'117765_5000x5000.jpg',NULL,NULL),(105,'117766_5000x5000.jpg',NULL,NULL),(106,'117767_5000x5000.jpg',NULL,NULL),(107,'117768_5000x5000.jpg',NULL,NULL),(108,'117769_5000x5000.jpg',NULL,NULL),(109,'117770_5000x5000.jpg',NULL,NULL),(110,'117771_5000x5000.jpg',NULL,NULL),(111,'117772_5000x5000.jpg',NULL,NULL),(112,'117773_5000x5000.jpg',NULL,NULL),(113,'117774_5000x5000.jpg',NULL,NULL),(114,'117775_5000x5000.jpg',NULL,NULL),(115,'117776_5000x5000.jpg',NULL,NULL),(116,'117777_5000x5000.jpg',NULL,NULL),(117,'ccde_Cel_Caroline_Rocher_06_original.jpg',NULL,NULL),(118,'ccde_Cel_Caroline_Rocher_08.jpg',NULL,NULL),(119,'ccde_Cel_Caroline_Rocher_14.jpg',NULL,NULL),(120,'ccde_Cel_Doreen_Jacobi_01_AltSize.jpg',NULL,NULL),(121,'ccde_Cel_Doreen_Jacobi_02_AltSize.jpg',NULL,NULL),(122,'ccde_Cel_Eva_Padberg_07.jpg',NULL,NULL),(123,'ccde_Cel_Isabel_Edvardsson_02.jpg',NULL,NULL),(124,'ccde_Cel_Isabel_Edvardsson_03.jpg',NULL,NULL),(125,'ccde_Cel_Isabel_Edvardsson_05_AltSize.jpg',NULL,NULL),(126,'ccde_Cel_Isabel_Edvardsson_06.jpg',NULL,NULL),(127,'ccde_Cel_Liza_Li_03.jpg',NULL,NULL),(128,'ccde_Cel_Liza_Li_05.jpg',NULL,NULL),(129,'ccde_Cel_Gerit_Kling_05.jpg',NULL,NULL),(130,'ccde_Cel_Gerit_Kling_07.jpg',NULL,NULL),(131,'ccde_Cel_Karina_Kraushaar_04_AltSize.jpg',NULL,NULL),(132,'ccde_Cel_Liza_Li_08.jpg',NULL,NULL);
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
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
INSERT INTO `weapons` VALUES (1,'Railgun',9,'2008-12-12 08:24:32','2008-12-12 08:24:37',0,1,1),(2,'Laser',8,'2008-12-12 08:38:24','2008-12-12 08:38:55',1,0,0),(3,'Missle',7,'2008-12-12 21:31:40','2008-12-12 21:31:45',1,1,0),(4,'Meson Gun',8,'2008-12-12 21:32:42','2008-12-12 21:32:42',0,1,0),(5,'Sandcaster',7,'2008-12-12 21:47:27','2008-12-12 21:47:27',1,0,0),(6,'Torpedo',9,'2008-12-13 11:21:20','2008-12-13 11:21:20',0,1,1);
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

-- Dump completed on 2008-12-27  9:27:49
