-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: yndg
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gametitle` varchar(30) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `publisher` varchar(30) DEFAULT NULL,
  `publishdate` date DEFAULT NULL,
  `steamPrice` int(11) DEFAULT NULL,
  `directPrice` int(11) DEFAULT NULL,
  `gamecontent` text,
  `recommendation` int(11) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `filename` (`filename`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`filename`) REFERENCES `gallery` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'DRAGON BALL Z','액션','BANDAI NAMCO Entertainment','2020-01-17',64800,61000,'Z 전사들이 되어 싸우기만 하지 마세요. 그들처럼 살아가세요! 낚시하고, 날아다니고, 먹고, 훈련하여, 드래곤볼 Z의 전설적인 이야기를 많은 캐릭터들과 관계를 쌓고 친구를 만들면서 싸워나가세요.',500,NULL),(2,'DRAGON BALL Z','액션','BANDAI NAMCO Entertainment','2020-01-17',34800,41000,'Z 를 형성해보자',200,NULL),(3,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-24',64800,61000,'Z 를 형성해보자',300,NULL),(4,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(5,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(6,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(7,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(8,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(9,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(10,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(11,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(13,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(14,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(15,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(16,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(17,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(18,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(19,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(20,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(21,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(22,'RAGON BALL Z: KAKAROT','액션','BANDAI NAMCO Entertainment','2020-01-25',64800,61000,'Z 를 형성해보자',300,NULL),(23,'DRAGON BALL Z','액션','BANDAI NAMCO Entertainment','2020-01-17',34800,41000,'Z 를 형성해보자',200,NULL),(26,'배틀그라운드','TPS','스콜라','2012-04-23',65000,64000,'<p>123</p>',0,'bg2.png');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-28  3:12:37
