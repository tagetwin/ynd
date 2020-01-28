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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gametitle` varchar(100) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `publishdate` date DEFAULT NULL,
  `steamPrice` int(11) DEFAULT NULL,
  `directPrice` int(11) DEFAULT NULL,
  `gamecontent` text,
  `recommendation` int(11) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `filename` (`filename`),
  KEY `rec_idx` (`recommendation`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`filename`) REFERENCES `gallery` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'The Walking Dead: Saints & Sinners','Action',' Skydance Interactive','2020-01-24',41000,42000,'Saints & Sinners is a game unlike any other in The Walking Dead universe. Every challenge you face and decision you make is driven by YOU. Fight the undead, scavenge through the flooded ruins of New Orleans, and face gut-wrenching choices for you and the other survivors. Live The Walking Dead.',1,'Screenshot_113.png'),(2,'Plague Inc: Evolved','Simulation',' Ndemic Creations','2016-02-19',16000,999999,'Plague Inc: Evolved is a unique mix of high strategy and terrifyingly realistic simulation. Your pathogen has just infected \'Patient Zero\' - now you must bring about the end of human history by evolving a deadly, global Plague whilst adapting against everything humanity can do to defend itself.',0,'Screenshot_101.png'),(3,'코만도스 2 - HD 리마스터 - Commandos 2 - HD Remaster [Pyro]','strategy',' Kalypso Media','2020-01-24',17850,16800,'■HD로 리마스터된 그래픽과 새로워진 튜토리얼.\r\n\r\n■적의 의복과 무기를 훔치고 장대 위에 올라가서 케이블을 이용해 하강하라. 수영하고 차량을 훔치거나 적의 기지와 배는 물론 비행기에 드나들며 임무를 완수하라.\r\n\r\n■그린베레, 저격병, 공병, 도둑 및 스파이 등 서로 다른 기술과 전문성을 지닌 9종류의 고유 병사들을 활용하라.\r\n\r\n■화면을 360도 회전시키거나 건물이나 선박, 수중에서 확대 및 축소하며 맵을 둘러보고 전황을 확인할 수 있다.\r\n\r\n■현실적인 날씨 효과와 밤낮에 걸쳐 9가지 환경으로 묘사된 10개의 미션을 즐겨라.\r\n\r\n■자신만의 플레이 스타일과 스킬, 선호 무기를 활용하여 다양한 방법으로 게임을 즐기는 것이 가능하다.\r\n\r\n■지프, 탱크, 트럭, 선박 및 바주카와 화염방사기 등 2차 세계대전을 대표하는 무기들과 차량들이 등장한다.',6,'Screenshot_133.png');
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

-- Dump completed on 2020-01-28 19:02:44
