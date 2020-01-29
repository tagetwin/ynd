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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (4,1,'Screenshot_113.png','Screenshot_11.png','image/png',119003,'2020-01-28 00:58:22',NULL),(13,1,'Screenshot_133.png','Screenshot_13.png','image/png',107743,'2020-01-28 01:44:47',NULL),(16,1,'Screenshot_101.png','Screenshot_10.png','image/png',537328,'2020-01-28 02:05:54',NULL),(17,2,'Screenshot_61.png','Screenshot_6.png','image/png',270173,'2020-01-28 02:12:15',NULL),(19,2,'Screenshot_71.png','Screenshot_7.png','image/png',1133247,'2020-01-28 02:25:48',1),(20,2,'Screenshot_84.png','Screenshot_8.png','image/png',637581,'2020-01-28 02:26:07',0),(21,1,'b14.jpg','b1.jpg','image/jpeg',16254,'2020-01-28 02:28:10',0),(22,1,'Screenshot_33.png','Screenshot_3.png','image/png',49492,'2020-01-28 02:28:28',0),(23,2,'Screenshot_72.png','Screenshot_7.png','image/png',1133247,'2020-01-28 02:44:27',0),(24,2,'Screenshot_34.png','Screenshot_3.png','image/png',49492,'2020-01-28 02:46:19',0),(25,3,'Screenshot_14.png','Screenshot_14.png','image/png',219755,'2020-01-28 02:48:35',0),(26,2,'b15.jpg','b1.jpg','image/jpeg',16254,'2020-01-29 01:27:22',0),(27,1,NULL,NULL,NULL,0,'2020-01-29 01:58:00',0),(28,1,'Screenshot_24.png','Screenshot_2.png','image/png',71823,'2020-01-29 02:08:01',0),(29,1,'Screenshot_25.png','Screenshot_2.png','image/png',71823,'2020-01-29 02:08:58',0),(30,1,NULL,NULL,NULL,0,'2020-01-29 02:09:36',0),(31,1,NULL,NULL,NULL,0,'2020-01-29 02:13:28',0),(32,1,NULL,NULL,NULL,0,'2020-01-29 02:18:19',0),(33,1,NULL,NULL,NULL,0,'2020-01-29 02:20:26',0),(34,1,NULL,NULL,NULL,0,'2020-01-29 02:21:12',0),(35,1,NULL,NULL,NULL,0,'2020-01-29 02:21:19',0),(36,1,NULL,NULL,NULL,0,'2020-01-29 02:21:25',0),(37,1,NULL,NULL,NULL,0,'2020-01-29 02:21:30',0),(38,1,NULL,NULL,NULL,0,'2020-01-29 02:21:35',0),(39,1,NULL,NULL,NULL,0,'2020-01-29 02:22:22',0),(40,1,'Screenshot_92.png','Screenshot_9.png','image/png',861112,'2020-01-29 02:31:12',0),(41,1,'Screenshot_15.png','Screenshot_15.png','image/png',91705,'2020-01-29 03:47:15',0),(42,1,'Screenshot_151.png','Screenshot_15.png','image/png',91705,'2020-01-29 03:51:18',0),(43,1,'Screenshot_152.png','Screenshot_15.png','image/png',91705,'2020-01-29 03:52:21',0),(44,1,NULL,NULL,NULL,0,'2020-01-29 04:13:56',0),(45,1,'Screenshot_153.png','Screenshot_15.png','image/png',91705,'2020-01-29 04:15:49',0),(46,1,'Screenshot_134.png','Screenshot_13.png','image/png',107743,'2020-01-29 04:40:30',0),(47,1,'Screenshot_135.png','Screenshot_13.png','image/png',107743,'2020-01-29 04:44:29',0),(48,1,'Screenshot_136.png','Screenshot_13.png','image/png',107743,'2020-01-29 04:46:58',0),(49,1,'Screenshot_114.png','Screenshot_11.png','image/png',119003,'2020-01-29 04:49:17',0),(50,2,NULL,NULL,NULL,0,'2020-01-29 04:54:26',0),(51,4,'Screenshot_26.png','Screenshot_2.png','image/png',71823,'2020-01-29 05:39:29',0),(52,4,'Screenshot_62.png','Screenshot_6.png','image/png',270173,'2020-01-29 05:41:58',0),(53,1,'Screenshot_35.png','Screenshot_3.png','image/png',49492,'2020-01-29 05:47:03',0),(54,4,'Screenshot_85.png','Screenshot_8.png','image/png',637581,'2020-01-29 05:48:19',0),(55,4,'Screenshot_36.png','Screenshot_3.png','image/png',49492,'2020-01-29 05:49:58',0),(56,2,'b16.jpg','b1.jpg','image/jpeg',16254,'2020-01-29 05:55:31',0),(57,1,'Screenshot_86.png','Screenshot_8.png','image/png',637581,'2020-01-29 05:56:01',0),(58,3,'Screenshot_102.png','Screenshot_10.png','image/png',537328,'2020-01-29 05:59:21',0),(59,3,NULL,NULL,NULL,0,'2020-01-29 06:02:54',0),(60,2,'Screenshot_93.png','Screenshot_9.png','image/png',861112,'2020-01-29 06:56:20',0),(61,2,NULL,NULL,NULL,0,'2020-01-29 06:59:36',0),(62,2,'Screenshot_19.png','Screenshot_19.png','image/png',191475,'2020-01-29 06:59:51',0),(63,2,'Screenshot_18.png','Screenshot_18.png','image/png',493831,'2020-01-29 07:00:06',0),(64,2,'Screenshot_20.png','Screenshot_20.png','image/png',587642,'2020-01-29 07:01:48',0),(65,1,'Screenshot_251.png','Screenshot_25.png','image/png',111027,'2020-01-29 07:51:17',0),(66,1,NULL,NULL,NULL,0,'2020-01-29 07:51:45',0),(67,1,'Screenshot_252.png','Screenshot_25.png','image/png',111027,'2020-01-29 07:57:20',0),(68,1,'Screenshot_253.png','Screenshot_25.png','image/png',111027,'2020-01-29 07:59:37',0),(69,1,NULL,NULL,NULL,0,'2020-01-29 07:59:49',0),(70,1,NULL,NULL,NULL,0,'2020-01-29 08:03:10',0),(71,1,NULL,NULL,NULL,0,'2020-01-29 08:06:26',0),(72,1,'Screenshot_254.png','Screenshot_25.png','image/png',111027,'2020-01-29 08:09:04',0),(73,1,'Screenshot_255.png','Screenshot_25.png','image/png',111027,'2020-01-29 08:10:26',0),(74,1,'Screenshot_28.png','Screenshot_28.png','image/png',155245,'2020-01-29 08:13:46',0),(75,2,NULL,NULL,NULL,0,'2020-01-29 08:25:04',0),(76,2,'Screenshot_201.png','Screenshot_20.png','image/png',587642,'2020-01-29 08:25:22',0),(77,1,'Screenshot_361.png','Screenshot_36.png','image/png',1191178,'2020-01-29 09:00:43',1),(78,1,'Screenshot_37.png','Screenshot_37.png','image/png',300013,'2020-01-29 09:02:18',1);
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

-- Dump completed on 2020-01-29 18:48:50
