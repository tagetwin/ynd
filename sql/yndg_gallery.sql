-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: yndg
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `original` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `pCreateTime` timestamp NULL DEFAULT NULL,
  `only` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `userId` (`userId`),
  KEY `gallery_ibfk_2_idx` (`filename`),
  CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (4,1,'Screenshot_113.png','Screenshot_11.png','image/png',119003,'2020-01-28 00:58:22',NULL),(13,1,'Screenshot_133.png','Screenshot_13.png','image/png',107743,'2020-01-28 01:44:47',NULL),(16,1,'Screenshot_101.png','Screenshot_10.png','image/png',537328,'2020-01-28 02:05:54',NULL),(17,2,'Screenshot_61.png','Screenshot_6.png','image/png',270173,'2020-01-28 02:12:15',NULL),(19,2,'Screenshot_71.png','Screenshot_7.png','image/png',1133247,'2020-01-28 02:25:48',1),(20,2,'Screenshot_84.png','Screenshot_8.png','image/png',637581,'2020-01-28 02:26:07',0),(21,1,'b14.jpg','b1.jpg','image/jpeg',16254,'2020-01-28 02:28:10',0),(22,1,'Screenshot_33.png','Screenshot_3.png','image/png',49492,'2020-01-28 02:28:28',0),(23,2,'Screenshot_72.png','Screenshot_7.png','image/png',1133247,'2020-01-28 02:44:27',0),(24,2,'Screenshot_34.png','Screenshot_3.png','image/png',49492,'2020-01-28 02:46:19',0),(25,3,'Screenshot_14.png','Screenshot_14.png','image/png',219755,'2020-01-28 02:48:35',0);
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-28 19:02:45
