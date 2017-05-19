
/**
* Author : Thach Pholly
* contact IoT dev, TMA Solution
* Date created: 30/03/2017
 */
CREATE USER 'myuser'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;  



drop database musium_ibeacon;
create database musium_ibeacon;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: musium_ibeacon
-- ------------------------------------------------------
-- Server version   5.7.17-0ubuntu0.16.04.2

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
-- Table structure for table `artifact`
--

DROP TABLE IF EXISTS `artifact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  `image_url` varchar(50) DEFAULT NULL,
  `ibeaconId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ibeaconId` (`ibeaconId`),
  CONSTRAINT `artifact_ibfk_1` FOREIGN KEY (`ibeaconId`) REFERENCES `ibeacon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifact`
--

LOCK TABLES `artifact` WRITE;
/*!40000 ALTER TABLE `artifact` DISABLE KEYS */;
INSERT INTO `artifact` VALUES (1,'chair','old chair','this is Old chair','/lib/images/oldchair.jpg',1),(2,'chair','old desk','this is Old desk','/lib/images/olddesk.jpg',1),(3,'chair','old bottle','this is Old bottle','/lib/images/oldbottle.jpg',2),(4,'chair','old knife','this is Old knife','/lib/images/knife.jpg',3);
/*!40000 ALTER TABLE `artifact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibeacon`
--

DROP TABLE IF EXISTS `ibeacon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibeacon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `macAdrr` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `macAdrr` (`macAdrr`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibeacon`
--

LOCK TABLES `ibeacon` WRITE;
/*!40000 ALTER TABLE `ibeacon` DISABLE KEYS */;
INSERT INTO `ibeacon` VALUES (1,'12345','ibeacon 1'),(2,'123456','ibeacon 2'),(3,'1234567','ibeacon 3');
/*!40000 ALTER TABLE `ibeacon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-24 19:00:57
