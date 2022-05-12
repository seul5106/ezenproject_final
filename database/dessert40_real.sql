-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: dessert40
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `cart_code` int NOT NULL AUTO_INCREMENT,
  `product_count` int NOT NULL,
  `product_code` int NOT NULL,
  `member_code` int NOT NULL,
  PRIMARY KEY (`cart_code`),
  KEY `product_code` (`product_code`),
  KEY `member_code` (`member_code`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_code`) REFERENCES `products` (`product_code`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`member_code`) REFERENCES `members` (`member_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1,44,10),(2,1,47,10),(5,2,44,1);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_code` int NOT NULL AUTO_INCREMENT COMMENT '이벤트 코드',
  `event_title` varchar(50) NOT NULL COMMENT '제목',
  `event_link` varchar(255) DEFAULT NULL COMMENT '링크',
  `event_img` varchar(255) DEFAULT NULL COMMENT '썸네일 사진',
  `event_show` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '배너노출여부 Y= 공개, N = 비공개',
  PRIMARY KEY (`event_code`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (41,'설렘가득','http://dessert39.com/main.php','/upload/1648105740099.png','Y'),(42,'지구살리기','http://dessert39.com/main.php','/upload/1648105826965.png','Y'),(43,'특별한 날 프리미엄 케이크','http://dessert39.com/main.php','/upload/1648105878829.png','Y'),(44,'순수생딸기 시리즈','http://dessert39.com/main.php','/upload/1648105935275.png','Y'),(45,'티아라 케이크','http://dessert39.com/main.php','/upload/1648105990622.png','Y');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_code` int NOT NULL AUTO_INCREMENT COMMENT '회원일련번호',
  `member_id` varchar(30) NOT NULL COMMENT '아이디',
  `member_email` varchar(255) NOT NULL COMMENT '이메일',
  `member_pw` varchar(255) NOT NULL COMMENT '비밀번호',
  `member_name` varchar(30) NOT NULL COMMENT '회원명',
  `member_phone` varchar(20) NOT NULL COMMENT '전화번호',
  `member_postcode` char(5) DEFAULT NULL COMMENT '우편번호',
  `member_addr1` varchar(255) DEFAULT NULL COMMENT '검색된 주소',
  `member_addr2` varchar(255) DEFAULT NULL COMMENT '나머지 주소',
  `member_birth` date NOT NULL COMMENT '생년월일',
  `admin` enum('Y','N') NOT NULL COMMENT '관리자여부',
  `reg_date` datetime NOT NULL COMMENT '가입한날짜',
  `is_out` enum('Y','N') NOT NULL COMMENT '탈퇴여부',
  PRIMARY KEY (`member_code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'woody','dazoo0221@hanmail.net','1234','우디','01012341232','12345','서울 강남구 논현동','도산대로 28길','2000-11-12','N','2022-02-11 00:00:00','N'),(2,'paos','ajdi1@assdq.com','112312','최준','01029310213','10291','서울시 동작구 대방동','123-213','1997-11-20','N','2022-02-08 16:20:57','Y'),(3,'seul5106','seul5106@naver.com','han3333','정한슬','01090570451','05695','서울 송파구 가락로12길 4','asdasd','2022-01-30','N','2022-02-09 00:00:00','Y'),(4,'aaasdasdasd','seul5106@naver.com','han3588s1','정한슬','01090570451','01030','서울 강북구 삼양로123길 1','ㅁㄴㅇㅁㄴㅇ','2022-02-03','N','2022-02-09 00:00:00','N'),(5,'seulda','seul5106@naver.com','han3588s1','정한슬','01090570451','05315','서울 강동구 양재대로123길 7','1234','2022-02-02','N','2022-02-09 18:07:34','N'),(6,'han3588s1','seul5106@gmail.com','han3588s1','정한슬','01090570451','05237','서울 강동구 암사동 445-15','asdasdasd','2022-02-23','N','2022-02-11 18:00:44','N'),(7,'seul51064','seul5106@gmail.com','han3588s1!!','정한슬1','01090570451','14125','주소다아아아아아','주소임이이이이','1995-02-04','Y','2022-02-14 16:00:38','N'),(8,'ezenAC','ezenPJ@gmail.com','woody','정임최','01099999999','06774','서울 서초구 양재동 232','타워','2022-02-03','N','2022-02-18 15:50:28','N'),(9,'ezenac1','ezenPJ@gmail.com','1234','정임최','01099999999','05315','서울 강동구 양재대로123길 7','1234','2022-02-03','N','2022-02-18 16:30:15','Y'),(10,'ezenac123','ezenPJ@gmail.com','1234','테스트','01099999999','01067','서울 강북구 번동 410-2','124123','2022-02-03','N','2022-02-20 21:23:13','Y'),(11,'seul51065106','seul5106@gmail.com','han3588s1!!','정한슬','01090570451','16070','경기 의왕시 경수대로 9-6','124151','2022-03-01','N','2022-03-10 01:51:15','N'),(12,'aegage','ezenPJ@gmail.com','han3588s1','정한슬','01099999999','05695','서울 송파구 가락로12길 4','124153','2022-03-02','N','2022-03-21 10:50:22','N'),(13,'confrim','seul5106@gmail.com','han3588s1','정한슬','01090570451','05315','서울 강동구 양재대로123길 7','216동 2002호','1995-02-04','N','2022-03-26 13:20:52','N'),(14,'594859649','seul5106@gmail.com','han3588s1','정한슬','01090570451','01030','서울 강북구 삼양로123길 1','1243653546','2022-03-02','N','2022-03-26 13:24:45','N');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_code` int NOT NULL AUTO_INCREMENT COMMENT '주문상세번호',
  `order_quantity` int NOT NULL COMMENT '주문수량',
  `order_price` int NOT NULL COMMENT '가격',
  `product_code` int NOT NULL,
  `order_code` int NOT NULL,
  PRIMARY KEY (`order_detail_code`),
  KEY `product_code` (`product_code`),
  KEY `order_code` (`order_code`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_code`) REFERENCES `products` (`product_code`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_code`) REFERENCES `orders` (`order_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_product`
--

DROP TABLE IF EXISTS `ordered_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_product` (
  `ordered_product_code` int NOT NULL AUTO_INCREMENT COMMENT '카트상품코드',
  `merchant_uid` varchar(45) NOT NULL COMMENT '주문번호',
  `ordered_product_name` varchar(255) NOT NULL COMMENT '상품이름',
  `ordered_product_img` varchar(255) NOT NULL COMMENT '상품사진',
  `ordered_product_count` int NOT NULL COMMENT '상품하나의 총 갯수',
  `ordered_product_price` int NOT NULL COMMENT '상품하나의 총 가격',
  PRIMARY KEY (`ordered_product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_product`
--

LOCK TABLES `ordered_product` WRITE;
/*!40000 ALTER TABLE `ordered_product` DISABLE KEYS */;
INSERT INTO `ordered_product` VALUES (1,'merchant_1645882850759','말랑말랑 치즈 케이크','/upload/1644982463828.png',1,5000),(2,'merchant_1645882887596','말랑말랑 초코 케이크','/upload/1644982501138.png',1,5000),(3,'merchant_1646844923613','말랑말랑 초코 케이크','/upload/1644982501138.png',3,5000),(4,'merchant_1646844923613','달달 크루아상','/upload/1644994275510.png',2,7000),(5,'merchant_1647430148422','말랑말랑 치즈 케이크','/upload/1644982463828.png',2,5000),(6,'merchant_1647430426558','보송보송 케이크','/upload/1644986741881.png',1,9000),(7,'merchant_1649213701440','말랑말랑 초코 케이크','/upload/1644982501138.png',1,5000),(8,'merchant_1649213701440','초코 분쇄기 쿠키','/upload/1644993263114.png',2,4500),(9,'merchant_1649215421638','말랑말랑 치즈 케이크','/upload/1644982463828.png',1,5000),(10,'merchant_1649219552323','말랑말랑 초코 케이크','/upload/1644982501138.png',1,5000),(11,'merchant_1649235684022','말랑말랑 초코 케이크','/upload/1644982501138.png',1,5000),(12,'merchant_1649730901785','말랑말랑 초코 케이크','/upload/1644982501138.png',1,5000),(13,'merchant_1649844890166','말랑말랑 치즈 케이크','/upload/1644982463828.png',1,5000),(14,'merchant_1649990811514','말랑말랑 치즈 케이크','/upload/1644982463828.png',1,5000);
/*!40000 ALTER TABLE `ordered_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_code` int NOT NULL AUTO_INCREMENT COMMENT '주문일련번호',
  `merchant_uid` varchar(45) DEFAULT NULL COMMENT '주문번호',
  `order_state` enum('Y','N','D','C') DEFAULT 'D' COMMENT '주문상태 ( Y = 주문완료, N = 주문실패, D = 결제 대기, C = "취소완료")',
  `order_date` datetime NOT NULL COMMENT '주문날짜',
  `order_total_price` int DEFAULT NULL COMMENT '총가격',
  `receiver_name` varchar(30) DEFAULT NULL COMMENT '수령자이름',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '수령자 전화번호',
  `receiver_addr1` char(5) DEFAULT NULL COMMENT '배송지 주소1(우편번호)',
  `receiver_addr2` varchar(255) DEFAULT NULL COMMENT '배송지 주소2(검색된 주소)',
  `receiver_addr3` varchar(255) DEFAULT NULL COMMENT '배송지 주소3(나머지 주소)',
  `receiver_email` varchar(255) DEFAULT NULL COMMENT '주문자 이메일',
  `imp_uid` varchar(45) DEFAULT NULL COMMENT '아임포트 결제번호',
  `rq_cancel` enum('Y','N') DEFAULT NULL COMMENT '결제취소요청 Y=취소요청, N=기본값',
  `member_code` int NOT NULL,
  PRIMARY KEY (`order_code`),
  KEY `member_code` (`member_code`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`member_code`) REFERENCES `members` (`member_code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (9,'merchant_1645882850759','N','2022-02-26 22:40:59',5050,'정한슬','01099999999','06304','서울 강남구 개포동 1267-1','125125','ezenPJ@gmail.com','imp_052860629689','N',8),(10,'merchant_1645882887596','C','2022-02-26 22:41:43',5050,'정한슬','01099999999','05695','서울 송파구 가락로12길 4','12515','ezenPJ@gmail.com','imp_823903936787','N',8),(11,'merchant_1646844923613','C','2022-03-10 01:55:37',29290,'정임최','01099999999','01030','서울 강북구 삼양로123길 1','125235235','seul5106@gmail.com','imp_404938098279','N',7),(12,'merchant_1647430148422','D','2022-03-16 20:32:19',10100,'정한슬','01099999999','01012','서울 강북구 4.19로12길 8','125533235','seul5106@gmail.com',NULL,'N',7),(13,'merchant_1647430426558','C','2022-03-16 20:33:59',9090,'정임최','01099999999','03437','서울 은평구 가좌로12길 12','124125','seul5106@gmail.com','imp_925440767286','N',7),(14,'merchant_1649213701440','C','2022-04-06 12:21:40',14140,'정임최','01090570451','01637','서울 노원구 덕릉로123길 11','12415','seul5106@gmail.com','imp_871301532659','N',8),(15,'merchant_1649215421638','C','2022-04-06 12:24:00',5050,'정한슬','01099999999','18584','경기 화성시 장안면 3.1만세로322번길 10','121245','seul5106@naver.com','imp_370441545069','N',8),(16,'merchant_1649219552323','C','2022-04-06 13:32:43',5050,'정한슬','01099999999','01030','서울 강북구 삼양로123길 1','1235','seul5106@gamil.com','imp_435564517209','N',8),(17,'merchant_1649235684022','N','2022-04-06 18:01:39',5050,'으아아아','01099999999','46704','부산 강서구 낙동북로212번길 5-3','asdfagre','ezenPJ@gmail.com','imp_782700257691','N',8),(18,'merchant_1649730901785','Y','2022-04-12 11:35:25',5050,'정한슬','01099999999','05696','서울 송파구 가락로12길 5','아파트','seul5106@gmail.com','imp_699924549696','Y',7),(19,'merchant_1649844890166','D','2022-04-13 19:15:01',5050,'정한슬','01099999999','08309','서울 구로구 구로동 414-14','135245','ezenPJ@gmail.com',NULL,'N',8),(20,'merchant_1649990811514','N','2022-04-15 11:47:07',5050,'정한슬','01090570451','01012','서울 강북구 4.19로12길 5','125225','ezenPJ@gmail.com','imp_428826581900','N',8);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_code` int NOT NULL AUTO_INCREMENT COMMENT '상품번호',
  `product_name` varchar(30) NOT NULL COMMENT '상품명',
  `product_price` int NOT NULL COMMENT '가격',
  `product_stock` int NOT NULL COMMENT '수량(재고)',
  `product_img` varchar(255) NOT NULL COMMENT '상품이미지',
  `product_categorie` varchar(20) NOT NULL COMMENT '카테고리',
  `product_desc` varchar(255) DEFAULT NULL COMMENT '설명',
  `product_nutri` varchar(255) DEFAULT NULL COMMENT '영양정보',
  `product_allergy` varchar(255) DEFAULT NULL COMMENT '알레르기',
  `product_date` date DEFAULT NULL COMMENT '등록날짜',
  `product_state` enum('Y','N') NOT NULL COMMENT '상품 상태 Y= 공개, N = 비공개',
  PRIMARY KEY (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (44,'말랑말랑 치즈 케이크',5000,131,'/upload/1644982463828.png','t','엄청나게 큰  호두 케이크타워입니다','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(45,'말랑말랑 초코 케이크',5000,131,'/upload/1644982501138.png','t','초코 케이크 조각입니다','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(46,'보송보송 케이크',9000,20130,'/upload/1644986741881.png','t','달콤한 우유 크림이 얹어진 빵입니다.','총 내용량 (390g) 1100 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(47,'우유 생크림 케이크',4500,120,'/upload/1644986818388.png','t','생크림과 달콤한 특제 소스로 무장한 케이크 타워입니다.','총 내용량 (390g) 1100 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(48,'화이트 초콜렛 쿠키',4000,1000,'/upload/1644993181686.png','c','보기엔 좀 그래도 맛있다구요','총 내용량 (390g) 1100 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(49,'초코 분쇄기 쿠키',4500,1000,'/upload/1644993263114.png','c','당신의 이빨을 부숴드리죠','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(50,'커리 쿠키',3900,2013,'/upload/1644993341945.png','c','커리(curry)가 들어있는 강황마니아 쿠키입니다.','총 내용량 (390g) 1100 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(51,'딸기 빙수',14000,1203,'/upload/1644993574993.png','v','딸기와 치즈가 동동 떠있는 막걸리같은 빙수입니다.','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(52,'죠리퐁 빙수',8000,1200,'/upload/1644993669502.png','v','죠리퐁과 검은콩으로 고소한 빙수를 맛보세요','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(53,'플랑크톤 마카롱',3000,2000,'/upload/1644993744959.png','t','플랑크톤이 좋아하는 마카롱','총 내용량 (390g) 1100 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(54,'딸기와 마늘 빙수',6000,192,'/upload/1644993841742.png','v','마늘과 딸기는 안 어울릴거라 생각하시죠?','총 내용량 (390g) 1100 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(55,'녹차 오믈렛',8000,1021,'/upload/1644993885809.png','m','녹차 오믈렛입니다.','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(56,'버터링 오믈렛',10200,102,'/upload/1644993962201.png','m','버터링같이 생긴 오믈렛입니다','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(57,'크런키 빙수',7000,1929,'/upload/1644994028368.png','v','초코 크런키가 들어간 빙수입니다.','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(58,'치즈 베이비',15130,2013,'/upload/1644994105134.png','b','가운데 퐁당 빠지고 싶은 치즈 크림이 듬뿍 들어간 베이비입니다','총 내용량 (390g) 1100 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(59,'스폰지밥 마카롱',14000,2013,'/upload/1644994185478.png','m','스폰지밥이 약간 들어간 마카롱입니다','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(60,'달달 크루아상',7000,1231,'/upload/1644994275510.png','b','그냥 크루아상입니다','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(61,'커스타드 크로칸 슈',15000,2013,'/upload/1644994370359.png','b','슈크림이 들어간 브레드입니다','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','asd','2022-02-16','Y'),(62,'소세지 브레드',5000,1021,'/upload/1644994436022.png','b','소세지가 가득찬 빵입니다.','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(63,'프렌치 쿠키슈',13100,1232,'/upload/1644994525282.png','b','달콤한 우유 크림이 안에 들어간 빵입니다','총 내용량 (390g) 1100 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(64,'순우유크림 케이크',23000,1020,'/upload/1644994574869.png','t','순우유크림에 흠뻑 빠진 케이크입니다','총 내용량 (390g) 1300 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y'),(65,'프렌치 쿠키슈(밀키쇼콜라)',14000,2013,'/upload/1644994652734.png','b','달콤한 우유크림과 초코 향이 가미된 빵입니다','총 내용량 (390g) 1100 kcal 총 내용량당 (% : 1일 영양성분기준치에 대한 비율) - 나트륨 : 1180mg / 59% · 당류 : 29g /29% · 포화지방 : 11g / 73% · 단백질 : 22g / 40%','밀, 계란, 대두, 우유, 쇠고기, 땅콩 함유','2022-02-16','Y');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qnas`
--

DROP TABLE IF EXISTS `qnas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qnas` (
  `qna_code` int NOT NULL AUTO_INCREMENT COMMENT 'qna번호',
  `qna_title` varchar(20) NOT NULL COMMENT '제목',
  `qna_desc` varchar(255) NOT NULL COMMENT '내용',
  `qna_answer` varchar(255) DEFAULT NULL COMMENT '관리자답변',
  `qna_state` enum('Y','N') DEFAULT 'N' COMMENT '답변상태 Y = 완료, N = 미완료',
  `qna_date` date NOT NULL COMMENT '작성날짜',
  `member_code` int NOT NULL,
  PRIMARY KEY (`qna_code`),
  KEY `member_code` (`member_code`),
  CONSTRAINT `qnas_ibfk_1` FOREIGN KEY (`member_code`) REFERENCES `members` (`member_code`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qnas`
--

LOCK TABLES `qnas` WRITE;
/*!40000 ALTER TABLE `qnas` DISABLE KEYS */;
INSERT INTO `qnas` VALUES (43,'이거 뭔가요?','뭔지 모르겠네요',NULL,'N','2022-04-04',1),(44,'이게 뭔가요','뭔지모르겠는ㄷ재요',NULL,'N','2022-04-04',1),(45,'asdasdas','asdasdasdasd',NULL,'N','2022-04-04',1),(46,'asdasdasd','asdasdasdasdasd',NULL,'N','2022-04-04',1),(47,'asd','asd',NULL,'N','2022-04-04',1),(48,'12314','124124',NULL,'N','2022-04-04',1),(49,'123124','124124','12314','Y','2022-04-04',8),(50,'주문이 실패했다는대 왜그러죠?','분명히 주문했는대',NULL,'N','2022-04-06',8),(51,'주문이 아직까지 안왔어요','분명히 일주일 전에 주문했는대 배송이 아직도 안되있네요',NULL,'N','2022-04-12',7);
/*!40000 ALTER TABLE `qnas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('00z71YpZtKOE-pik3Vh0CViASCW2yGjd',1650077593,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"memberInfo\":{\"member_code\":8,\"member_id\":\"ezenAC\",\"member_email\":\"ezenPJ@gmail.com\",\"member_pw\":\"woody\",\"member_name\":\"정임최\",\"member_phone\":\"01099999999\",\"member_postcode\":\"06774\",\"member_addr1\":\"서울 서초구 양재동 232\",\"member_addr2\":\"타워\",\"member_birth\":\"2022-02-03\",\"admin\":\"N\",\"reg_date\":\"2022-02-18 15:50:28\",\"is_out\":\"N\"}}'),('mQOrYeavrl1HCN0ADPYP6cy6loC92Cna',1651565681,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"memberInfo\":{\"member_code\":8,\"member_id\":\"ezenAC\",\"member_email\":\"ezenPJ@gmail.com\",\"member_pw\":\"woody\",\"member_name\":\"정임최\",\"member_phone\":\"01099999999\",\"member_postcode\":\"06774\",\"member_addr1\":\"서울 서초구 양재동 232\",\"member_addr2\":\"타워\",\"member_birth\":\"2022-02-03\",\"admin\":\"N\",\"reg_date\":\"2022-02-18 15:50:28\",\"is_out\":\"N\"}}'),('xpNMD2_CuerO6x-yb4Oe9RIWdgVinb2D',1649931441,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"memberInfo\":{\"member_code\":7,\"member_id\":\"seul51064\",\"member_email\":\"seul5106@gmail.com\",\"member_pw\":\"han3588s1!!\",\"member_name\":\"정한슬1\",\"member_phone\":\"01090570451\",\"member_postcode\":\"14125\",\"member_addr1\":\"주소다아아아아아\",\"member_addr2\":\"주소임이이이이\",\"member_birth\":\"1995-02-04\",\"admin\":\"Y\",\"reg_date\":\"2022-02-14 16:00:38\",\"is_out\":\"N\"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-02 17:17:24
