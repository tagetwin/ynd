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
  `steamUrl` varchar(150) DEFAULT NULL,
  `directUrl` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `filename` (`filename`),
  KEY `rec_idx` (`recommendation`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`filename`) REFERENCES `gallery` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'The Walking Dead: Saints & Sinners','Action',' Skydance Interactive','2020-01-24',41000,999999,'Saints & Sinners is a game unlike any other in The Walking Dead universe. Every challenge you face and decision you make is driven by YOU. Fight the undead, scavenge through the flooded ruins of New Orleans, and face gut-wrenching choices for you and the other survivors. Live The Walking Dead.',2,'Screenshot_114.png','https://store.steampowered.com/app/916840/The_Walking_Dead_Saints__Sinners/',NULL),(2,'Plague Inc: Evolved','Simulation',' Ndemic Creations','2016-02-19',1600,999999,'Plague Inc: Evolved is a unique mix of high strategy and terrifyingly realistic simulation. Your pathogen has just infected \'Patient Zero\' - now you must bring about the end of human history by evolving a deadly, global Plague whilst adapting against everything humanity can do to defend itself.',1,NULL,NULL,NULL),(3,'코만도스 2 - HD 리마스터 - Commandos 2 - HD Remaster [Pyro]','strategy',' Kalypso Media','2020-01-24',1700,999999,'■HD로 리마스터된 그래픽과 새로워진 튜토리얼.\r\n\r\n■적의 의복과 무기를 훔치고 장대 위에 올라가서 케이블을 이용해 하강하라. 수영하고 차량을 훔치거나 적의 기지와 배는 물론 비행기에 드나들며 임무를 완수하라.\r\n\r\n■그린베레, 저격병, 공병, 도둑 및 스파이 등 서로 다른 기술과 전문성을 지닌 9종류의 고유 병사들을 활용하라.\r\n\r\n■화면을 360도 회전시키거나 건물이나 선박, 수중에서 확대 및 축소하며 맵을 둘러보고 전황을 확인할 수 있다.\r\n\r\n■현실적인 날씨 효과와 밤낮에 걸쳐 9가지 환경으로 묘사된 10개의 미션을 즐겨라.\r\n\r\n■자신만의 플레이 스타일과 스킬, 선호 무기를 활용하여 다양한 방법으로 게임을 즐기는 것이 가능하다.\r\n\r\n■지프, 탱크, 트럭, 선박 및 바주카와 화염방사기 등 2차 세계대전을 대표하는 무기들과 차량들이 등장한다.',6,'Screenshot_136.png','https://store.steampowered.com/app/1100410/Commandos_2__HD_Remaster/',NULL),(9,'Return of the Obra Dinn','Simulation','3090','2019-10-16',14350,999999,'In 1802, the merchant ship Obra Dinn set out from London for the Orient with over 200 tons of trade goods. Six months later it hadn\'t met its rendezvous point at the Cape of Good Hope and was declared lost at sea.\r\n\r\nEarly this morning of October 14th, 1807, the Obra Dinn drifted into port at Falmouth with damaged sails and no visible crew. As insurance investigator for the East India Company\'s London Office, dispatch immediately to Falmouth, find means to board the ship, and prepare an assessment of damages.\r\n\r\nReturn of the Obra Dinn is a first-person mystery adventure based on exploration and logical deduction.',1,'Screenshot_153.png','https://store.steampowered.com/app/653530/Return_of_the_Obra_Dinn/',NULL),(10,'DRAGON BALL Z: KAKAROT','Action',' BANDAI NAMCO Entertainment','2020-01-17',64800,61000,'Relive the story of Goku and other Z Fighters in DRAGON BALL Z: KAKAROT! Beyond the epic battles, experience life in the DRAGON BALL Z world as you fight, fish, eat, and train with Goku, Gohan, Vegeta and others.',0,'Screenshot_255.png','https://store.steampowered.com/app/851850/DRAGON_BALL_Z_KAKAROT/','https://directg.net/game/game_page.html?product_code=50001988'),(11,'DRAGON BALL FighterZ','Action',' BANDAI NAMCO Entertainment','2018-01-26',54800,49800,'DRAGON BALL FighterZ is born from what makes the DRAGON BALL series so loved and famous: endless spectacular fights with its all-powerful fighters.',0,NULL,'https://store.steampowered.com/app/678950/DRAGON_BALL_FighterZ/','https://directg.net/game/game_page.html?product_code=50001568'),(12,'풋볼 매니저 2020 - Football Manager 2020','Simulation','SEGA','0019-11-19',40500,44000,'당신만의 방식으로 축구 클럽을 운영하세요. 새로운 기능과 더욱 정교해진 게임 메커니즘으로 돌아온 Football Manager 2020에서는 모든 결정이 당신의 몫입니다. 전혀 새로운 방식으로 계획을 구상하고 추진하면서 클럽뿐 아니라 감독으로서 본인의 커리어도 발전시키세요.\r\n\r\n터널을 지나 살아 숨쉬는 축구의 세계 한복판으로 들어가세요. 이곳에서는 당신의 의견이 가장 중요합니다!\r\n\r\n꼼꼼하고 아는 게 많다면 보상이 주어지는 세계지만 다른 게임과 달리 이곳에는 정해진 엔딩도 스크립트도 없습니다. 무한한 가능성과 무한한 기회, 그뿐이죠. 모든 클럽마다 당신이 창조해 나갈 특별한 스토리가 있습니다.\r\n\r\n축구는 꿈의 경기라고들 합니다. 그렇다면 감독은 특별한 몽상가라고 할 수 있죠.\r\n\r\n감독은 문제점이 아닌 기회를 봅니다. 자신이 세계 최고임을 증명할 기회, 새로운 철학을 불어넣을 기회, 유능한 선수들을 키워낼 기회, 클럽의 순위와 명성을 끌어올릴 기회, 그리고 트로피를 향한 오랜 기다림을 끝낼 기회를 말이죠.\r\n\r\n정상에 오를 수 있는지는 전적으로 당신에게 달렸습니다... 직접 결정하세요. 결과는 자연스레 따라올 테니까요.\r\n\r\n- 축구를 사랑하는 전세계 50개 국가에서 당신의 커리어를 시작하세요.\r\n- 모든 레벨의 2,500개 클럽 중 한 곳에서 새로운 성공 시대를 열어보세요.\r\n- 500,000명 이상의 실제 선수들과 스탭 중에서 미래를 함께할 최고만을 골라 계약하세요.\r\n- 당신만의 전술을 만들고 훈련장에서 실전에 응용하세요.\r\n- 지금까지 가장 몰입감이 뛰어나고 스마트한 매치 엔진을 경험하세요.',0,'Screenshot_28.png','https://store.steampowered.com/app/1100600/Football_Manager_2020/','https://directg.net/game/game_page.html?product_code=50002007');
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

-- Dump completed on 2020-01-29 18:48:49
