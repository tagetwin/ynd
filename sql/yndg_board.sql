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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'펭','수',2,'2020-01-28 01:50:07','Screenshot_61.png','information'),(2,'우주','선',2,'2020-01-28 02:26:07','Screenshot_84.png','information'),(3,'고양이','노란고양이',2,'2020-01-28 02:44:27','Screenshot_72.png','information'),(4,'콘','콘콘',2,'2020-01-28 02:46:19','Screenshot_34.png','recommendation'),(5,'용과','같이',3,'2020-01-28 02:48:35','Screenshot_14.png','review'),(7,'인포메이션','인포',2,'2020-01-29 04:54:26',NULL,'information'),(8,'마우스 프로필 확인용','2020',4,'2020-01-29 05:39:29','Screenshot_26.png','review'),(9,'이미지','없이',3,'2020-01-29 06:02:54',NULL,'review'),(10,'‘워크래프트 III: 리포지드’ 오늘 출시','블리자드 엔터테인먼트의 획기적인 실시간 전략(RTS, real time strategy) 게임을 재구성한 워크래프트 III: 리포지드(Warcraft® III: Reforged)와 함께 아제로스(Azeroth) 역사상 가장 상징적인 순간들을 이제 다시 경험한다. 워크래프트 III: 혼돈의 지배(Warcraft III: Reign of Chaos® )와 수상 경력에 빛나는 확장팩 얼어붙은 왕좌(The Frozen Throne®)로 구성된 워크래프트 III: 리포지드는 워크래프트 세계관의 주요한 시기를 7개의 캠페인으로 구성된 풍부한 싱글 플레이어 스토리, 대대적인 개편을 거친 그래픽과 오디오, 블리자드 Battle.net® 온라인 게임 서비스를 통해 현대화된 소셜 및 대전 상대 찾기 기능, 커뮤니티의 창작물에 힘을 실어줄 새로워진 월드 에디터 등을 통해 다시 그려 나간다. \r\n\r\n리포지드는 강력한 오크, 고결한 인간, 고대 나이트 엘프, 흉악한 언데드 등 4개 종족의 시점에서 경험하는 60개 이상의 미션을 통해 플레이어들에게 워크래프트 III 스토리를 장대하게 다시 들려준다. 플레이어들은 불타는 군단의 침공부터 리치왕의 승천 등 아제로스 역사의 주요 순간들을 직접 목격할 수 있고 스랄(Thrall), 제이나 프라우드무어(Jaina Proudmoore), 실바나스 윈드러너(Sylvanas Windrunner), 일리단 스톰레이지(Illidan Stormrage) 등 워크래프트의 상징적인 주요 인물들의 이야기도 확인할 수 있다. \r\n\r\nJ. 알렌 브랙 블리자드 엔터테인먼트 사장(J. Allen Brack, president of Blizzard Entertainment)은 “워크래프트 III는 블리자드가 한 회사로서 이룬 가장 자랑스러운 업적 중 하나로 전세계적으로 수많은 플레이어들이 여전히 워크래프트 III를 RTS 장르의 귀감이 되는 게임으로 여기는 것을 영광스럽게 생각한다. 플레이어들이 좋아하는 부분들은 유지한 채 게임을 현대화하는 것이 워크래프트 III: 리포지드에 있어 가장 중요한 목표였고, 모든 이들이 우리가 그 목표를 이뤘다고 동의할 수 있기를 바란다”며 워크래프트 III: 리포지드 출시에 대한 소감을 밝혔다. \r\n\r\nhttps://bbs.ruliweb.com/news/read/133125',2,'2020-01-29 06:56:20','Screenshot_18.png','review'),(11,'로지텍, 기계식 게이밍 키보드 ‘G512’ 리뉴얼 출시','개인용 주변기기 전문기업 로지텍 코리아가 게이머들에게 오랫동안 사랑 받아온 기계식 게이밍 키보드 ‘G512’를 리뉴얼 출시한다.\r\n\r\n이번에 출시된 리뉴얼 모델 ‘G512 GX 브라운’, ‘G512 GX 레드’ 등은 더욱 강력해진 2가지 타입의 GX 축을 제품 라인업에 추가해 소비자 선택 폭을 넓혔다. 조용하면서도 작동감이 명확한 ‘GX 브라운 택타일(GX Brown Tactile)축’, 부드럽고 일관된 입력감을 자랑하는 ‘GX 레드 리니어(GX Red Linear)축’ 등 게이머들이 자신의 취향에 맞게 세 가지 키보드를 선택 할 수 있다.\r\n\r\n기존 ‘G512 기계식 게이밍 키보드’에서 게이머들이 호평한 게임 사운드와 RGB 조명을 동기화할 수 있는 라이트싱크(LIGHTSYNC), 내구성 좋은 항공기용 5052 알루미늄 소재 탑케이스, 마우스 등 다양한 주변기기를 연결할 수 있는 USB 패스 스루(USB Passthrough) 포트도 그대로 적용됐다. \r\n\r\n로지텍 코리아는 G512 기계식 게이밍 키보드 리뉴얼 출시를 기념해 다양한 이벤트를 진행할 예정이다. 2월 3일부터 오픈마켓과 함께 진행하는 협업 이벤트를 통해 마우스 장패드, 키보드 루프, 전용 팜레스트, 문화상품권 1만원권 등을 증정한다.\r\n\r\n로지텍 코리아 게이밍 카테고리 이진회 차장은 “G512 기계식 게이밍 키보드가 리뉴얼 출시 된 이유는 게이머들의 큰 사랑 덕분”이라며 “게이머들의 취향이 고도화되고 세분화 되는 만큼 앞으로도 다양한 게이머들의 성향과 상황에 맞는 최고의 게이밍 환경을 전달하기 위해 노력하겠다”고 말했다.\r\nhttps://bbs.ruliweb.com/news/read/133109',2,'2020-01-29 06:59:36','Screenshot_19.png','review'),(12,'5500만의 아마존 뮤직, 스포티파이·애플뮤직 맹 추격','유통 공룡 아마존이 음악 스트리밍 서비스 시장에서도 빠른 성장세를 보이고 있다. 아마존 특유의 구독(서브스크립션) 모델을 앞세워 음악 스트리밍 세계 1위 스포티파이와 2위 애플 뮤직을 맹 추격 중이다.\r\n\r\n아마존은 최근 자사 음악 스트리밍 서비스 \'아마존 뮤직\' 이용자가 5500만명을 돌파했다고 밝혔다. 무료 이용자부터 6개 서로 다른 가격대의 구독 이용자를 아우르는 숫자다.\r\n\r\n음악 스트리밍 시장 1위와 2위에 견주면 아직 미약한 규모다. 1위인 스포티파이는 지난해 3분기 세계 2억2400만명 가입자를 확보했다고 밝혔다. 2위인 애플 뮤직도 작년 여름 유료 이용자 6000만명을 돌파했다. 글로벌 음악 스트리밍 서비스 시장에서 아마존은 이 두 회사에 이어 3위를 차지하고 있다.\r\n​\r\n\r\n[출처] 5500만의 아마존 뮤직, 스포티파이·애플뮤직 맹 추격|작성자 테크플러스\r\nhttps://blog.naver.com/PostView.nhn?blogId=tech-plus&logNo=221782645953&navType=tl\r\n',2,'2020-01-29 07:01:48','Screenshot_201.png','review');
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

-- Dump completed on 2020-01-29 18:48:49
