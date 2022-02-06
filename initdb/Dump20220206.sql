CREATE DATABASE  IF NOT EXISTS `eventapp` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eventapp`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: eventapp
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'random'),(2,'gatau');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `eventid` int DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `eventid` (`eventid`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `promotor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `categoryid` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkuserevent_idx` (`userid`),
  KEY `fkcatevent_idx` (`categoryid`),
  CONSTRAINT `fkcatevent` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`),
  CONSTRAINT `fkuserevent` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'tidur',8,'anulah',1,'2023-03-03 22:00:00','Bojongsoang','ya gitu aja','https://www.last.fm/static/images/whatsnew/trackmymusic/windows_logo.0079fd78cebd.png','2022-02-04 00:29:24',NULL),(2,'bajak anunya',8,'anulah',1,'2022-03-03 22:00:00','Bojongsoang','ya gitu aja','https://www.last.fm/static/images/whatsnew/trackmymusic/windows_logo.0079fd78cebd.png','2022-02-04 11:01:08',NULL),(3,'bajak anunya',8,'anulah',2,'2023-03-03 22:00:00','Bojongsoang','ya gitu aja','https://www.last.fm/static/images/whatsnew/trackmymusic/windows_logo.0079fd78cebd.png','2022-02-04 11:46:34','2022-02-04 22:22:23'),(4,'mamaaaaa',10,'huuuuu',1,'2022-12-03 22:00:00','Mampang','didn\'t mean to make you cry','https://www.last.fm/static/images/whatsnew/trackmymusic/windows_logo.0079fd78cebd.png','2022-02-04 22:36:43',NULL),(5,'Gacha abah Zhongli',12,'F2P yang sabar',2,'2022-02-24 12:00:00','Jakarta','Gacha abah zhongli akan mempermudah hidup anda...','https://1.bp.blogspot.com/-_o3Fu_vovVA/X8WZA8Ssy5I/AAAAAAAAAgw/bcJFHLxGI0Eurqi9czrDwUG32T3A2M95ACLcBGAsYHQ/s1125/Screenshot_483.jpg','2022-02-06 02:21:49',NULL),(6,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:19',NULL),(7,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:33',NULL),(8,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:44',NULL),(9,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:47',NULL),(10,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:48',NULL),(11,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:49',NULL),(12,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:27',NULL),(13,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:27',NULL),(14,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28',NULL),(15,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28',NULL),(16,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28',NULL),(17,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28',NULL),(18,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28',NULL),(19,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:43',NULL),(20,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:20',NULL),(21,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:27',NULL),(22,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:29',NULL),(23,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:29',NULL),(24,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30',NULL),(25,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30',NULL),(26,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30',NULL),(27,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30',NULL),(28,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30',NULL),(29,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:35',NULL),(30,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:35',NULL),(31,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:35',NULL),(32,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:35',NULL),(33,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49',NULL),(34,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49',NULL),(35,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49',NULL),(36,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49',NULL),(37,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49',NULL),(38,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:50',NULL),(39,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:50',NULL),(40,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:50',NULL),(41,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:51',NULL),(42,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:13',NULL),(43,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14',NULL),(44,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14',NULL),(45,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14',NULL),(46,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14',NULL),(47,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14',NULL),(48,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15',NULL),(49,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15',NULL),(50,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15',NULL),(51,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15',NULL),(52,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15',NULL),(53,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15',NULL),(54,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16',NULL),(55,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16',NULL),(56,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16',NULL),(57,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16',NULL),(58,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16',NULL),(59,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:17',NULL),(60,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:17',NULL),(61,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-17 12:00:00','Bogor','Gacha...','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:42',NULL),(62,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-17 12:00:00','Bogor','Gacha...','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:43',NULL),(63,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-17 12:00:00','Bogor','Gacha...','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:29:05',NULL),(64,'Event Besar',12,'Luzky',2,'2022-02-23 12:00:00','Bandung','mari kita lucky','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:13:26',NULL),(65,'Event Besar',12,'Luzky',2,'2022-02-23 12:00:00','Bandung','mari kita lucky','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:13:29',NULL),(66,'Spyral Abyss',12,'F2P yang sabar',2,'2022-02-24 12:00:00','Bandung','satu','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:14:20',NULL),(67,'Spyral Abyss',12,'F2P yang sabar',2,'2022-02-24 12:00:00','Bandung','satu','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:14:21',NULL),(71,'nama acara',12,'nama promotor',1,'2022-01-01 00:00:00','jakarta','event seru','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:20:43',NULL),(72,'Spyral Abyss',12,'F2P yang sabar',2,'2022-02-25 12:00:00','Cianjur','ga','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 04:23:03',NULL),(73,'Spyral Abyss',12,'F2P yang sabar',2,'2022-02-25 12:00:00','Cianjur','ga','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 04:23:04',NULL),(74,'1',12,'F2P yang sabar',1,'2022-02-10 12:00:00','Bandung','1','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:24:32',NULL),(75,'1',12,'F2P yang sabar',1,'2022-02-10 12:00:00','Bandung','1','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:24:33',NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eventid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `joined_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `eventid` (`eventid`),
  CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participants_ibfk_3` FOREIGN KEY (`eventid`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,5,12,'2022-02-06 02:34:30',NULL),(2,5,12,'2022-02-06 02:34:36',NULL),(3,2,12,'2022-02-06 03:03:02',NULL),(4,2,12,'2022-02-06 03:03:04',NULL),(5,2,12,'2022-02-06 03:03:05',NULL),(6,2,12,'2022-02-06 03:03:05',NULL),(7,2,12,'2022-02-06 03:03:05',NULL),(8,2,12,'2022-02-06 03:03:14',NULL),(9,2,12,'2022-02-06 03:03:14',NULL),(10,2,12,'2022-02-06 03:03:14',NULL),(11,2,12,'2022-02-06 03:03:19',NULL),(12,2,12,'2022-02-06 03:03:19',NULL),(13,2,12,'2022-02-06 03:03:21',NULL),(14,2,12,'2022-02-06 03:03:23',NULL),(15,2,12,'2022-02-06 03:03:58',NULL),(16,2,12,'2022-02-06 03:04:18',NULL),(17,2,12,'2022-02-06 03:04:34',NULL),(18,2,12,'2022-02-06 03:04:50',NULL),(19,2,12,'2022-02-06 03:04:57',NULL),(20,2,12,'2022-02-06 03:05:20',NULL),(21,2,12,'2022-02-06 03:08:50',NULL),(22,2,12,'2022-02-06 03:08:56',NULL),(23,2,12,'2022-02-06 03:08:56',NULL),(24,2,12,'2022-02-06 03:08:56',NULL),(25,2,12,'2022-02-06 03:08:57',NULL),(26,2,12,'2022-02-06 03:08:57',NULL),(27,2,12,'2022-02-06 03:08:57',NULL),(28,2,12,'2022-02-06 03:08:57',NULL),(29,2,12,'2022-02-06 03:09:01',NULL),(30,2,12,'2022-02-06 03:09:01',NULL),(31,2,12,'2022-02-06 03:09:02',NULL),(32,2,12,'2022-02-06 03:09:02',NULL),(33,2,12,'2022-02-06 03:09:02',NULL),(34,2,12,'2022-02-06 03:09:18',NULL),(35,2,12,'2022-02-06 03:09:18',NULL),(36,2,12,'2022-02-06 03:09:32',NULL),(37,2,12,'2022-02-06 03:09:32',NULL),(38,2,12,'2022-02-06 03:10:15',NULL),(39,2,12,'2022-02-06 03:10:22',NULL),(40,2,12,'2022-02-06 03:10:26',NULL),(41,2,12,'2022-02-06 03:10:27',NULL),(42,2,12,'2022-02-06 03:10:27',NULL),(43,2,12,'2022-02-06 03:10:27',NULL),(44,2,12,'2022-02-06 03:10:27',NULL),(45,2,12,'2022-02-06 03:10:28',NULL),(46,2,12,'2022-02-06 03:10:28',NULL),(47,2,12,'2022-02-06 03:10:28',NULL),(48,2,12,'2022-02-06 03:10:28',NULL),(49,2,12,'2022-02-06 03:10:28',NULL),(50,2,12,'2022-02-06 03:10:29',NULL),(51,2,12,'2022-02-06 03:10:29',NULL),(52,2,12,'2022-02-06 03:10:39',NULL),(53,2,12,'2022-02-06 03:10:40',NULL),(54,2,12,'2022-02-06 03:10:41',NULL),(55,2,12,'2022-02-06 03:10:41',NULL),(56,2,12,'2022-02-06 03:10:41',NULL),(57,2,12,'2022-02-06 03:10:52',NULL),(58,2,12,'2022-02-06 03:10:53',NULL),(59,2,12,'2022-02-06 03:11:32',NULL),(60,2,12,'2022-02-06 03:12:30',NULL),(61,2,12,'2022-02-06 03:12:31',NULL),(62,2,12,'2022-02-06 03:12:32',NULL),(63,2,12,'2022-02-06 03:12:32',NULL),(64,2,12,'2022-02-06 03:12:32',NULL),(65,2,12,'2022-02-06 03:12:32',NULL),(66,2,12,'2022-02-06 03:12:32',NULL),(67,2,12,'2022-02-06 03:12:32',NULL),(68,2,12,'2022-02-06 03:12:33',NULL),(69,2,12,'2022-02-06 03:12:33',NULL),(70,2,12,'2022-02-06 03:12:33',NULL),(71,2,12,'2022-02-06 03:12:33',NULL),(72,2,12,'2022-02-06 03:12:33',NULL),(73,2,12,'2022-02-06 03:12:37',NULL),(74,2,12,'2022-02-06 03:12:37',NULL),(75,2,12,'2022-02-06 03:12:38',NULL),(76,2,12,'2022-02-06 03:12:38',NULL),(77,2,12,'2022-02-06 03:12:38',NULL),(78,2,12,'2022-02-06 03:12:38',NULL),(79,2,12,'2022-02-06 03:12:38',NULL),(80,2,12,'2022-02-06 03:12:39',NULL),(81,2,12,'2022-02-06 03:12:39',NULL),(82,2,12,'2022-02-06 03:12:39',NULL),(83,2,12,'2022-02-06 03:12:39',NULL),(84,2,12,'2022-02-06 03:12:39',NULL),(85,2,12,'2022-02-06 03:12:40',NULL),(86,2,12,'2022-02-06 03:12:40',NULL),(87,2,12,'2022-02-06 03:12:40',NULL),(88,2,12,'2022-02-06 03:13:46',NULL),(89,2,12,'2022-02-06 03:13:48',NULL),(90,2,12,'2022-02-06 03:13:48',NULL),(91,12,12,'2022-02-06 03:14:29',NULL),(92,7,12,'2022-02-06 03:14:53',NULL),(93,2,12,'2022-02-06 03:16:09',NULL),(94,2,12,'2022-02-06 03:16:10',NULL),(95,2,12,'2022-02-06 03:16:10',NULL),(96,2,12,'2022-02-06 03:16:10',NULL),(97,2,12,'2022-02-06 03:16:11',NULL),(98,8,12,'2022-02-06 03:18:10',NULL),(99,8,12,'2022-02-06 03:18:14',NULL),(100,8,12,'2022-02-06 03:18:14',NULL),(101,8,12,'2022-02-06 03:18:14',NULL),(102,8,12,'2022-02-06 03:18:15',NULL),(103,8,12,'2022-02-06 03:18:20',NULL),(104,8,12,'2022-02-06 03:18:20',NULL),(105,8,12,'2022-02-06 03:18:20',NULL),(106,8,12,'2022-02-06 03:18:20',NULL),(107,8,12,'2022-02-06 03:18:21',NULL),(108,1,12,'2022-02-06 03:18:44',NULL),(109,21,12,'2022-02-06 03:28:00',NULL),(110,7,12,'2022-02-06 03:30:13',NULL),(111,7,12,'2022-02-06 03:30:28',NULL),(112,15,12,'2022-02-06 03:30:47',NULL),(113,9,12,'2022-02-06 03:32:03',NULL),(114,62,12,'2022-02-06 03:35:08',NULL),(115,13,12,'2022-02-06 03:40:25',NULL),(116,16,12,'2022-02-06 03:43:46',NULL),(117,11,12,'2022-02-06 04:09:34',NULL),(118,35,12,'2022-02-06 04:12:43',NULL),(119,75,12,'2022-02-06 04:34:47',NULL);
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'najib','najib@gmail.com','najib','0251','https://avatars.githubusercontent.com/u/62690560?v=4',NULL,NULL),(2,'lala','lala@land.com','lala','7474','',NULL,NULL),(6,'gtc','gtc@mail.com','123','1212','',NULL,NULL),(7,'pointer','poin@ter.com','bisadong','gagalmele','nyangkut',NULL,NULL),(8,'test','test','test','123123','ganti terahir ya',NULL,NULL),(9,'anu','anua','anu','1234','anu','2022-02-03 19:43:31',NULL),(10,'mama','mama@mail.com','$2a$10$5lsEzqht.W2V8fDlKaENyehy.bm7MdCsB7yqG8QSJvhlbmin8NnaS',NULL,NULL,'2022-02-04 22:34:20',NULL),(11,'admin','admin@mail.com','$2a$10$SzJeaCjEz2KOdmcbqMPCfeCWRA44krSETPuihTDf6DRukaSDrQvIi',NULL,NULL,'2022-02-06 01:59:23',NULL),(12,'Lukman Nur Hakim','santuy@gmail.com','$2a$10$sXgO4nKuzyDfZ32nGzJ4GuMVt/s5P1Q5MaGFv9.sL42zjf12NCaJC',NULL,NULL,'2022-02-06 02:04:28',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-06 11:51:10
