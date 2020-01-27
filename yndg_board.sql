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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boardtitle` varchar(100) DEFAULT NULL,
  `content` mediumtext,
  `userId` int(11) DEFAULT NULL,
  `boardcreatetime` timestamp NULL DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `board_ibfk_2_idx` (`filename`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `board_ibfk_2` FOREIGN KEY (`filename`) REFERENCES `gallery` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (14,'H2 인터렉티브, 다이렉트 게임즈 & H2몰 설날 프로모션 및 기타 이벤트','<p>test</p>',2,'2020-01-24 17:11:54',NULL,NULL),(17,'펄어비스 검은사막, 북미, 유럽 주요 국가에서 ‘2020년 최고의 MMORPG’로 선정','<p>으로 웹사이트의 내용을 발췌하거나 서식이 들어있는 글들을 복사하여 붙여 넣으면 서식이 함께 복사됩니다.</p><p><br></p><p>의도한 바와 같으면 상관없지만 서식을 제외하고 텍스트만 복사하는 경우에는&nbsp;</p><p><br></p><p>우선 메모장에 한 번 붙여 넣은 후 서식을 제거하고 텍스트만 다시 복사하여</p><p><br></p><p>문서에 붙여 넣거나 특정 툴을 사용하여 서식을 제외하고 복사하는데요,</p><p><br></p><p>그러다 보니 문서를 작성하는데 많은 시간이 소요되고 불</p><p><br></p><p><br></p><p><br></p><p>출처: https://fluorite94.tistory.com/80 [향삭]</p>',2,'2020-01-24 17:28:21',NULL,NULL),(18,'EPIC, 2020년에도 무료 게임 제공 프로그램 진행','㈜에이치투 인터렉티브(이하 H2 INTERACTIVE, 대표 허준하)는 파이로 스튜디오(Pyro Studios)가 개발하고 칼립소 미디어 디지털(Kalypso Media Digital)이 퍼블리싱하는 전략 게임 ‘코만도스 2 HD 리마스터’(Commandos 2 HD Remaster) 한국어판과 ‘프레토리언 HD 리마스터’(Praetorians HD Remaster) 한국어판을 내일(1월24일) PC 플랫폼으로 각각 소비자가격 19,800원에 정식 출시한다고 밝혔다.\r\n\r\n\r\n\r\n‘코만도스 2 HD 리마스터’와 ‘프레토리언 HD 리마스터’는 추후 PS4로 콜렉션 패키지가 정식 출시될 예정이며, 닌텐도 스위치로도 ‘코만도스 2 HD 리마스터’가 별도로 출시될 예정이다.\r\n\r\n\r\n\r\n‘코만도스 2 HD 리마스터’는 파이로 스튜디오가 제작한 실시간 전략 게임 장르의 교과서인 ‘코만도스 2’를 HD로 리마스터한 작품이다. 조작 및 UI, 튜토리얼 등 많은 부분이 현 시대에 맞는 HD로 다시 제작되었으며, 자막은 물론 인터페이스와 음성이 모두 한국어로 지원된다.\r\n\r\n\r\n\r\n‘프레토리언 HD 리마스터’ 역시 파이로 스튜디오가 제작한 실시간 전략 게임 ‘프레토리언’의 HD 리마스터 버전이다. 조작 및 UI 등 많은 부분이 현 시대에 맞는 HD로 다시 제작되었고, 이집트와 갈리아, 이탈리아에 걸친 로마 제국의 이야기를 싱글 및 멀티플레이어 모드를 통해 즐기는 것이 가능하며, 인터페이스와 자막이 한국어로 지원된다.\r\n\r\n \r\n\r\n \r\n\r\n코만도스 2 HD 리마스터 게임 특징\r\n\r\n ',13,'2020-01-26 15:34:20',NULL,NULL),(19,'아이유제목','아이유내용',19,'2020-01-26 17:33:57',NULL,NULL),(20,'아이유제목1','아이유내용1',13,'2020-01-26 17:38:25',NULL,NULL),(23,'아이유제목','아이유',13,'2020-01-27 03:38:48','아이유 020.JPG',NULL),(24,'아이유제목','123',13,'2020-01-27 03:45:02','37ADC812-EAC4-4847-9196-0524444D27ED.jpeg',NULL),(26,'아이유제목','123',13,'2020-01-27 04:28:48','아이유 023.jpg',NULL),(27,'나비','나비',13,'2020-01-27 04:34:40','20141018_010952.jpg',NULL),(28,'iu 추천','iu추천',13,'2020-01-27 08:34:17','7194C93B-2CC9-4E10-9FA5-A5C7C423B553.png','Recommendation'),(29,'나비 가로 리뷰','나비 ',19,'2020-01-27 09:55:36','20141223_161343.jpg','Review'),(30,'양이 인포메이션 가로','양이',19,'2020-01-27 09:57:57','20130720_160850.jpg','Information'),(31,'팁 고둥 내용긴거','\r\n기사 이미지\r\n[OSEN=방콕(태국), 이승우 기자] 냉정한 승부사처럼 보이지만 김학범 감독은 열정을 가진 축구인이었다.\r\n\r\n김학범 감독이 이끄는 한국 U-23 축구대표팀은 27일(한국시간) 오전 태국 방콕의 라자망갈라 국립경기장에서 끝난 아시아축구연맹(AFC) U-23 챔피언십 사우디아라비아와 결승전에서 정태욱의 극적인 골에 힘 입어 1-0으로 승리했다. 정규시간 90분에 승부를 가리지 못했으나 연장 후반 정태욱이 결승골을 넣었다.\r\n\r\n조별리그부터 파죽지세로 전승을 달리며 결승에 진출한 한국은 사우디를 상대로 고전했으나 결국 승리했다. 한국은 2020 도쿄 올림픽 진출과 함께 AFC U-23 챔피언십 첫 우승을 거머쥐며 두 마리 토끼를 잡았다.\r\n\r\n경기 종료 후 진행된 기자회견에서 김학범 감독은 \"한국은 2012년 런던 올림픽에서 동메달을 따냈다. 이번에는 동메달 이상의 성적을 목표로 하겠다\"라는 포부를 밝혔다.\r\n\r\n한국은 사우디의 탄탄한 수비와 예리한 공격에 고전하며 연장전까지 치르는 접전을 펼쳤다. 결국 연장 후반 8분 세트피스 공격에 가담한 정태욱이 이동경의 프리킥을 받아 헤더골을 작렬했다.\r\n\r\n정태욱의 골이 터지는 순간 김학범 감독을 비롯한 모든 코치진과 선수들은 서로 부둥켜 안고 환호했다. 이내 김 감독은 벤치에 주저 앉았다.\r\n\r\n김학범 감독은 경기 종료 후 공동취재구역에서 취재진과 만나 허심탄회한 심정을 털어놨다. 김 감독은 정태욱이 골이 터진 후 감정에 대해 “시합은 하면 할수록 힘들다”라며 “감독도 힘들다. 선수들한테도 강조한다. 요즘 시합이 끝나면 많이 허탈하다”라고 밝혔다.',19,'2020-01-27 09:59:48','20151003_192452.jpg','Tip');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-28  3:12:38
