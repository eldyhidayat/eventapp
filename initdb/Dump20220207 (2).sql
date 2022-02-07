CREATE DATABASE  IF NOT EXISTS `eventapp` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eventapp`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Art'),(2,'Sport'),(3,'Tech'),(4,'Edu'),(5,'Music');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,12,5,'a','2022-02-06 13:14:07',NULL),(2,12,5,'b','2022-02-06 13:14:43',NULL),(3,12,5,'z','2022-02-06 13:16:19',NULL),(4,12,5,'b','2022-02-06 13:16:27',NULL),(5,12,5,'c','2022-02-06 13:16:46',NULL),(6,12,4,'mantap','2022-02-06 13:25:49',NULL),(7,12,4,'mantap','2022-02-06 13:25:53',NULL),(8,12,4,'kenapa','2022-02-06 13:26:02',NULL),(9,12,4,'mantap pisan euy','2022-02-06 13:26:48',NULL),(10,12,4,'mantap kali lagi','2022-02-06 13:27:17',NULL),(11,12,4,'mantap kali lagi','2022-02-06 13:27:36',NULL),(12,12,4,'mantap kali lagi','2022-02-06 13:29:32',NULL),(13,12,4,'asik','2022-02-06 13:30:05',NULL),(14,12,4,'asik','2022-02-06 13:32:18',NULL),(15,12,4,'wait','2022-02-06 13:32:29',NULL),(16,12,4,'a','2022-02-06 13:35:29',NULL),(17,12,4,'b','2022-02-06 13:35:57',NULL),(18,12,30,'gacha kuy','2022-02-06 13:36:23',NULL),(19,12,5,'zhongli','2022-02-06 13:38:44',NULL),(20,12,76,'Wah ada abah zhongli','2022-02-06 14:24:48',NULL),(21,12,76,'Abah....','2022-02-06 14:25:21',NULL),(22,12,76,'mantap abah','2022-02-06 14:26:24',NULL),(23,12,76,'siap abah','2022-02-06 14:26:40',NULL),(24,12,76,'kenapa abah','2022-02-06 14:27:01',NULL),(25,12,5,'bagus euy','2022-02-06 14:59:47',NULL),(26,12,7,'bagus','2022-02-06 15:02:19',NULL),(27,12,74,'a','2022-02-06 23:45:04',NULL),(28,20,77,'mantap ganyu, salah satu dps terbaik ','2022-02-07 03:02:10',NULL),(29,20,77,'a','2022-02-07 03:06:11',NULL),(30,20,77,'gg','2022-02-07 03:07:16',NULL),(31,20,77,'','2022-02-07 03:08:49',NULL),(32,21,1,'sas','2022-02-07 03:28:01',NULL),(33,21,1,'','2022-02-07 03:28:03',NULL),(34,21,1,'','2022-02-07 03:28:03',NULL),(35,21,1,'','2022-02-07 03:28:04',NULL),(36,21,1,'','2022-02-07 03:28:05',NULL),(37,21,1,'','2022-02-07 03:28:05',NULL),(38,21,1,'ada','2022-02-07 03:28:43',NULL),(39,21,79,'s','2022-02-07 03:29:25',NULL),(40,13,80,'mantap','2022-02-07 03:43:16',NULL),(41,22,80,'hallo','2022-02-07 03:43:21',NULL),(42,22,80,'asa','2022-02-07 04:49:56',NULL),(43,19,2,'mantap','2022-02-07 04:59:00',NULL),(44,19,2,'','2022-02-07 05:00:25',NULL),(45,25,84,'Walaupun dia hilang dari sampingku, tpi dia pernah membuatku bahagia.','2022-02-07 08:31:34',NULL),(46,25,84,'Sedih, tpi itu adalah sebuah kenyataan','2022-02-07 08:32:05',NULL),(47,25,84,'Tapi aku tetap bahagia, walaupun dia dengan orang lain','2022-02-07 08:32:43',NULL),(48,26,84,'keren','2022-02-07 08:46:13',NULL),(49,25,85,'wkwkwk bisa aja mba','2022-02-07 09:20:36',NULL),(50,25,85,'mantap','2022-02-07 09:21:14',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'tidur',8,'anulah',1,'2023-03-03 22:00:00','Bojongsoang','ya gitu aja','https://www.last.fm/static/images/whatsnew/trackmymusic/windows_logo.0079fd78cebd.png','2022-02-04 00:29:24',NULL),(2,'bajak anunya',8,'anulah',1,'2022-03-03 22:00:00','Bojongsoang','ya gitu aja','https://www.last.fm/static/images/whatsnew/trackmymusic/windows_logo.0079fd78cebd.png','2022-02-04 11:01:08',NULL),(3,'bajak anunya',8,'anulah',2,'2023-03-03 22:00:00','Bojongsoang','ya gitu aja','https://www.last.fm/static/images/whatsnew/trackmymusic/windows_logo.0079fd78cebd.png','2022-02-04 11:46:34','2022-02-04 22:22:23'),(4,'mamaaaaa',10,'huuuuu',1,'2022-12-03 22:00:00','Mampang','didn\'t mean to make you cry','https://www.last.fm/static/images/whatsnew/trackmymusic/windows_logo.0079fd78cebd.png','2022-02-04 22:36:43',NULL),(5,'Gacha abah Zhongli',12,'F2P yang sabar',2,'2022-02-24 12:00:00','Jakarta','Gacha abah zhongli akan mempermudah hidup anda...','https://1.bp.blogspot.com/-_o3Fu_vovVA/X8WZA8Ssy5I/AAAAAAAAAgw/bcJFHLxGI0Eurqi9czrDwUG32T3A2M95ACLcBGAsYHQ/s1125/Screenshot_483.jpg','2022-02-06 02:21:49','2022-02-07 02:57:50'),(6,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:19','2022-02-07 02:57:50'),(7,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:33','2022-02-07 02:57:50'),(8,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:44','2022-02-07 02:57:50'),(9,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:47','2022-02-07 02:57:50'),(10,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:48','2022-02-07 02:57:50'),(11,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:25:49','2022-02-07 02:57:50'),(12,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:27','2022-02-07 02:57:50'),(13,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:27','2022-02-07 02:57:50'),(14,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28','2022-02-07 02:57:50'),(15,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28','2022-02-07 02:57:50'),(16,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28','2022-02-07 02:57:50'),(17,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28','2022-02-07 02:57:50'),(18,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:28','2022-02-07 02:57:50'),(19,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:26:43','2022-02-07 02:57:50'),(20,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:20','2022-02-07 02:57:50'),(21,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:27','2022-02-07 02:57:50'),(22,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:29','2022-02-07 02:57:50'),(23,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:29','2022-02-07 02:57:50'),(24,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30','2022-02-07 02:57:50'),(25,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30','2022-02-07 02:57:50'),(26,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30','2022-02-07 02:57:50'),(27,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30','2022-02-07 02:57:50'),(28,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:30','2022-02-07 02:57:50'),(29,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:35','2022-02-07 02:57:50'),(30,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:35','2022-02-07 02:57:50'),(31,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:35','2022-02-07 02:57:50'),(32,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:35','2022-02-07 02:57:50'),(33,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49','2022-02-07 02:57:50'),(34,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49','2022-02-07 02:57:50'),(35,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49','2022-02-07 02:57:50'),(36,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49','2022-02-07 02:57:50'),(37,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:49','2022-02-07 02:57:50'),(38,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:50','2022-02-07 02:57:50'),(39,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:50','2022-02-07 02:57:50'),(40,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:50','2022-02-07 02:57:50'),(41,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:27:51','2022-02-07 02:57:50'),(42,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:13','2022-02-07 02:57:50'),(43,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14','2022-02-07 02:57:50'),(44,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14','2022-02-07 02:57:50'),(45,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14','2022-02-07 02:57:50'),(46,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14','2022-02-07 02:57:50'),(47,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:14','2022-02-07 02:57:50'),(48,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15','2022-02-07 02:57:50'),(49,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15','2022-02-07 02:57:50'),(50,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15','2022-02-07 02:57:50'),(51,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15','2022-02-07 02:57:50'),(52,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15','2022-02-07 02:57:50'),(53,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:15','2022-02-07 02:57:50'),(54,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16','2022-02-07 02:57:50'),(55,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16','2022-02-07 02:57:50'),(56,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16','2022-02-07 02:57:50'),(57,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16','2022-02-07 02:57:50'),(58,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:16','2022-02-07 02:57:50'),(59,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:17','2022-02-07 02:57:50'),(60,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-18 12:00:00','Jakarta','Gacha ganyu','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:17','2022-02-07 02:57:50'),(61,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-17 12:00:00','Bogor','Gacha...','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:42','2022-02-07 02:57:50'),(62,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-17 12:00:00','Bogor','Gacha...','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:28:43','2022-02-07 02:57:50'),(63,'Gacha Karakter Ganyu',12,'F2P yang sabar',2,'2022-02-17 12:00:00','Bogor','Gacha...','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 02:29:05','2022-02-07 02:57:50'),(64,'Event Besar',12,'Luzky',2,'2022-02-23 12:00:00','Bandung','mari kita lucky','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:13:26','2022-02-07 02:57:50'),(65,'Event Besar',12,'Luzky',2,'2022-02-23 12:00:00','Bandung','mari kita lucky','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:13:29','2022-02-07 02:57:50'),(66,'Spyral Abyss',12,'F2P yang sabar',2,'2022-02-24 12:00:00','Bandung','satu','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:14:20','2022-02-07 02:57:50'),(67,'Spyral Abyss',12,'F2P yang sabar',2,'2022-02-24 12:00:00','Bandung','satu','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:14:21','2022-02-07 02:57:50'),(71,'nama acara',12,'nama promotor',1,'2022-01-01 00:00:00','jakarta','event seru','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:20:43','2022-02-07 02:57:50'),(72,'Spyral Abyss',12,'F2P yang sabar',2,'2022-02-25 12:00:00','Cianjur','ga','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 04:23:03','2022-02-07 02:57:50'),(73,'Spyral Abyss',12,'F2P yang sabar',2,'2022-02-25 12:00:00','Cianjur','ga','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-06 04:23:04','2022-02-07 02:57:50'),(74,'Gacha Karakter Albedo dan Eula',12,'F2P yang sabar ',1,'2022-02-17 12:00:00','Bandung','Dua karakter dari monstard','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:24:32','2022-02-07 02:57:50'),(75,'Gacha 2.2',12,'F2P yang sabar',1,'2022-02-24 12:00:00','Bandung','Albedo geo dan Eula cryo','https://asset.vg247.com/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg/BROK/resize/1920x1920%3E/format/jpg/quality/80/genshin_impact_wish_2_update_2-(2)_Q3UcypU.jpg','2022-02-06 04:24:33','2022-02-07 02:57:50'),(76,'Abah Zhongli itu Morax!',12,'F2P yang sabar ',2,'2022-02-11 12:00:00','Indonesia ','Abah zhongli itu archon','https://1.bp.blogspot.com/-_o3Fu_vovVA/X8WZA8Ssy5I/AAAAAAAAAgw/bcJFHLxGI0Eurqi9czrDwUG32T3A2M95ACLcBGAsYHQ/s1125/Screenshot_483.jpg','2022-02-06 14:24:26','2022-02-07 02:57:50'),(77,'Gacha Karakter Ganyu Tapi dapetnya Qiqi :(',20,'F2P yang sabar ',2,'2022-02-25 12:00:00','Bandung ','ganyu ku...','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg ','2022-02-07 03:01:38','2022-02-07 03:10:55'),(78,'Gacha Karakter Ganyu',20,'F2P yang sabar',2,'2022-02-25 12:00:00','Bandung','polo','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-07 03:10:47','2022-02-07 03:10:55'),(79,'ganyu',21,'F2P yang sabar ',2,'2022-02-25 12:00:00','Bandung ','poloo','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-07 03:29:13','2022-02-07 03:31:24'),(80,'Spyral Abyss',22,'F2P yang sabar',2,'2022-02-24 12:00:00','Cianjur','a','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-07 03:35:15','2022-02-07 04:52:00'),(81,'Gacha',22,'F2P',3,'2022-02-11 12:00:00','Jakarta','polo','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-07 04:50:26','2022-02-07 04:52:00'),(82,'Gacha Karakter Ganyu',25,'F2P yang sabar',3,'2022-02-23 12:00:00','Bogor','Gacha ganyu kuy...','https://jagatplay.com/wp-content/uploads/2021/01/genshin-impact-ganyu.jpg','2022-02-07 08:16:22',NULL),(83,'Garis waktu',25,'Happy_Boy',4,'2022-02-17 12:00:00','Bandung','APA','https://1.bp.blogspot.com/-C6OqcUIE4DA/X7jMaLLdrCI/AAAAAAAABaY/_v56v7934WEJS_v2BksafEZ_A9T5mHRXQCLcBGAsYHQ/s2048/1111.jpg','2022-02-07 08:17:15','2022-02-07 08:19:18'),(84,'Garis waktu',25,'Happy_Boy',4,'2022-02-17 12:00:00','Bandung','Walaupun alam semesta hanya mempertemukan bukan untuk dipersatukan, tapi tidak apa karena bertemu dengan mu  itu adalah sebuah kebahagiaan yang aku dapatkan. Mari ramaikan acara ini ya!','https://1.bp.blogspot.com/-C6OqcUIE4DA/X7jMaLLdrCI/AAAAAAAABaY/_v56v7934WEJS_v2BksafEZ_A9T5mHRXQCLcBGAsYHQ/s2048/1111.jpg','2022-02-07 08:17:43',NULL),(85,'Jogja Walking Tour (5 & 6 Februari 2022)',13,'jogjawalkingtour',1,'2022-02-17 12:00:00','Yogyakarta','djasjdaskjdsajd','https://visitingjogja.jogjaprov.go.id/web/wp-content/uploads/2022/02/capture_02042022_122641.jpg','2022-02-07 09:15:26',NULL),(86,'MotoGP Mandalika - cs meet up',13,'Couchsurfing',2,'2022-02-18 12:00:00','Bantul','sasasdsada','https://tcdn.couchsurfing.com/wEzwJc_rj2fSblP6_rjAQxOkUXY=/653x368/smart/https://s3.amazonaws.com/ht-images.couchsurfing.com/u/1005791580/25eb7c0a-2fd7-46c0-bbfb-6d1ac45624bf','2022-02-07 09:20:54',NULL),(87,'Ngamen 0.2',17,'pamggung',5,'2022-02-16 12:00:00','Yogyakarta','sdasdasdasd','https://images.solopos.com/2021/07/pamungkas.jpg','2022-02-07 09:33:51',NULL),(88,'Wayang Jogja Night Carnival',17,'dinas kebudayaan',1,'2022-02-25 12:00:00','Yogyakarta','asdasdad','http://www.jogja.co/wp-content/uploads/2017/10/wayang-jogja-night-carnival-hut-261.jpg','2022-02-07 09:40:26',NULL),(89,'Dufan at Night',17,'Dufan',5,'2022-02-13 12:00:00','Jakarta','Hadir eksklusif di GoTix dengan slot terbatas di bulan Februari!\nLokasi : Dufan Fantasi, Taman Impian Jaya Ancol\nTanggal : 12 - 13 Februari 2022 \nJam : 17.00 s.d 21.00 WIB','https://s3-ap-southeast-1.amazonaws.com/loket-production-sg/images/banner/20220202122129.png','2022-02-07 09:43:15',NULL),(90,'Dunia Mencekam',17,'Mall @Alam Sutera',1,'2022-02-20 12:00:00',' Parkir Utara Mall @Alam Sutera','Dunia Mencekam: Hutan Terlarang merupakan jalur mobil horor bertema Jepang, memadukan konsep labirin rumah hantu, dengan desain produksi dan pemain theatrik berskala internasional.','https://s3-ap-southeast-1.amazonaws.com/loket-production-sg/images/banner/20211201161806_61a73dce03d5b.jpg','2022-02-07 09:47:39',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,5,12,'2022-02-06 02:34:30',NULL),(2,5,12,'2022-02-06 02:34:36',NULL),(3,2,12,'2022-02-06 03:03:02',NULL),(4,2,12,'2022-02-06 03:03:04',NULL),(5,2,12,'2022-02-06 03:03:05',NULL),(6,2,12,'2022-02-06 03:03:05',NULL),(7,2,12,'2022-02-06 03:03:05',NULL),(8,2,12,'2022-02-06 03:03:14',NULL),(9,2,12,'2022-02-06 03:03:14',NULL),(10,2,12,'2022-02-06 03:03:14',NULL),(11,2,12,'2022-02-06 03:03:19',NULL),(12,2,12,'2022-02-06 03:03:19',NULL),(13,2,12,'2022-02-06 03:03:21',NULL),(14,2,12,'2022-02-06 03:03:23',NULL),(15,2,12,'2022-02-06 03:03:58',NULL),(16,2,12,'2022-02-06 03:04:18',NULL),(17,2,12,'2022-02-06 03:04:34',NULL),(18,2,12,'2022-02-06 03:04:50',NULL),(19,2,12,'2022-02-06 03:04:57',NULL),(20,2,12,'2022-02-06 03:05:20',NULL),(21,2,12,'2022-02-06 03:08:50',NULL),(22,2,12,'2022-02-06 03:08:56',NULL),(23,2,12,'2022-02-06 03:08:56',NULL),(24,2,12,'2022-02-06 03:08:56',NULL),(25,2,12,'2022-02-06 03:08:57',NULL),(26,2,12,'2022-02-06 03:08:57',NULL),(27,2,12,'2022-02-06 03:08:57',NULL),(28,2,12,'2022-02-06 03:08:57',NULL),(29,2,12,'2022-02-06 03:09:01',NULL),(30,2,12,'2022-02-06 03:09:01',NULL),(31,2,12,'2022-02-06 03:09:02',NULL),(32,2,12,'2022-02-06 03:09:02',NULL),(33,2,12,'2022-02-06 03:09:02',NULL),(34,2,12,'2022-02-06 03:09:18',NULL),(35,2,12,'2022-02-06 03:09:18',NULL),(36,2,12,'2022-02-06 03:09:32',NULL),(37,2,12,'2022-02-06 03:09:32',NULL),(38,2,12,'2022-02-06 03:10:15',NULL),(39,2,12,'2022-02-06 03:10:22',NULL),(40,2,12,'2022-02-06 03:10:26',NULL),(41,2,12,'2022-02-06 03:10:27',NULL),(42,2,12,'2022-02-06 03:10:27',NULL),(43,2,12,'2022-02-06 03:10:27',NULL),(44,2,12,'2022-02-06 03:10:27',NULL),(45,2,12,'2022-02-06 03:10:28',NULL),(46,2,12,'2022-02-06 03:10:28',NULL),(47,2,12,'2022-02-06 03:10:28',NULL),(48,2,12,'2022-02-06 03:10:28',NULL),(49,2,12,'2022-02-06 03:10:28',NULL),(50,2,12,'2022-02-06 03:10:29',NULL),(51,2,12,'2022-02-06 03:10:29',NULL),(52,2,12,'2022-02-06 03:10:39',NULL),(53,2,12,'2022-02-06 03:10:40',NULL),(54,2,12,'2022-02-06 03:10:41',NULL),(55,2,12,'2022-02-06 03:10:41',NULL),(56,2,12,'2022-02-06 03:10:41',NULL),(57,2,12,'2022-02-06 03:10:52',NULL),(58,2,12,'2022-02-06 03:10:53',NULL),(59,2,12,'2022-02-06 03:11:32',NULL),(60,2,12,'2022-02-06 03:12:30',NULL),(61,2,12,'2022-02-06 03:12:31',NULL),(62,2,12,'2022-02-06 03:12:32',NULL),(63,2,12,'2022-02-06 03:12:32',NULL),(64,2,12,'2022-02-06 03:12:32',NULL),(65,2,12,'2022-02-06 03:12:32',NULL),(66,2,12,'2022-02-06 03:12:32',NULL),(67,2,12,'2022-02-06 03:12:32',NULL),(68,2,12,'2022-02-06 03:12:33',NULL),(69,2,12,'2022-02-06 03:12:33',NULL),(70,2,12,'2022-02-06 03:12:33',NULL),(71,2,12,'2022-02-06 03:12:33',NULL),(72,2,12,'2022-02-06 03:12:33',NULL),(73,2,12,'2022-02-06 03:12:37',NULL),(74,2,12,'2022-02-06 03:12:37',NULL),(75,2,12,'2022-02-06 03:12:38',NULL),(76,2,12,'2022-02-06 03:12:38',NULL),(77,2,12,'2022-02-06 03:12:38',NULL),(78,2,12,'2022-02-06 03:12:38',NULL),(79,2,12,'2022-02-06 03:12:38',NULL),(80,2,12,'2022-02-06 03:12:39',NULL),(81,2,12,'2022-02-06 03:12:39',NULL),(82,2,12,'2022-02-06 03:12:39',NULL),(83,2,12,'2022-02-06 03:12:39',NULL),(84,2,12,'2022-02-06 03:12:39',NULL),(85,2,12,'2022-02-06 03:12:40',NULL),(86,2,12,'2022-02-06 03:12:40',NULL),(87,2,12,'2022-02-06 03:12:40',NULL),(88,2,12,'2022-02-06 03:13:46',NULL),(89,2,12,'2022-02-06 03:13:48',NULL),(90,2,12,'2022-02-06 03:13:48',NULL),(91,12,12,'2022-02-06 03:14:29',NULL),(92,7,12,'2022-02-06 03:14:53',NULL),(93,2,12,'2022-02-06 03:16:09',NULL),(94,2,12,'2022-02-06 03:16:10',NULL),(95,2,12,'2022-02-06 03:16:10',NULL),(96,2,12,'2022-02-06 03:16:10',NULL),(97,2,12,'2022-02-06 03:16:11',NULL),(98,8,12,'2022-02-06 03:18:10',NULL),(99,8,12,'2022-02-06 03:18:14',NULL),(100,8,12,'2022-02-06 03:18:14',NULL),(101,8,12,'2022-02-06 03:18:14',NULL),(102,8,12,'2022-02-06 03:18:15',NULL),(103,8,12,'2022-02-06 03:18:20',NULL),(104,8,12,'2022-02-06 03:18:20',NULL),(105,8,12,'2022-02-06 03:18:20',NULL),(106,8,12,'2022-02-06 03:18:20',NULL),(107,8,12,'2022-02-06 03:18:21',NULL),(108,1,12,'2022-02-06 03:18:44',NULL),(109,21,12,'2022-02-06 03:28:00',NULL),(110,7,12,'2022-02-06 03:30:13',NULL),(111,7,12,'2022-02-06 03:30:28',NULL),(112,15,12,'2022-02-06 03:30:47',NULL),(113,9,12,'2022-02-06 03:32:03',NULL),(114,62,12,'2022-02-06 03:35:08',NULL),(115,13,12,'2022-02-06 03:40:25',NULL),(116,16,12,'2022-02-06 03:43:46',NULL),(117,11,12,'2022-02-06 04:09:34',NULL),(118,35,12,'2022-02-06 04:12:43',NULL),(119,75,12,'2022-02-06 04:34:47',NULL),(120,76,12,'2022-02-06 14:24:36',NULL),(121,64,13,'2022-02-07 01:56:03',NULL),(122,64,14,'2022-02-07 02:15:00',NULL),(123,64,15,'2022-02-07 02:15:40',NULL),(124,64,16,'2022-02-07 02:16:57',NULL),(125,64,17,'2022-02-07 02:17:50',NULL),(126,64,18,'2022-02-07 02:18:46',NULL),(127,64,19,'2022-02-07 02:19:40',NULL),(128,77,20,'2022-02-07 03:01:45',NULL),(129,1,21,'2022-02-07 03:27:50',NULL),(130,79,21,'2022-02-07 03:29:23',NULL),(131,80,13,'2022-02-07 03:43:29',NULL),(132,80,22,'2022-02-07 03:43:32',NULL),(133,80,18,'2022-02-07 03:44:03',NULL),(134,80,17,'2022-02-07 03:45:16',NULL),(135,4,22,'2022-02-07 04:49:39',NULL),(136,4,25,'2022-02-07 08:06:26',NULL),(137,84,25,'2022-02-07 08:27:27',NULL),(138,82,26,'2022-02-07 08:45:30',NULL),(139,84,26,'2022-02-07 08:46:08',NULL),(140,85,25,'2022-02-07 09:28:41',NULL),(141,86,25,'2022-02-07 09:33:44',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'najib','najib@gmail.com','najib','0251','https://avatars.githubusercontent.com/u/62690560?v=4',NULL,NULL),(2,'lala','lala@land.com','lala','7474','',NULL,NULL),(6,'gtc','gtc@mail.com','123','1212','',NULL,NULL),(7,'pointer','poin@ter.com','bisadong','gagalmele','nyangkut',NULL,NULL),(8,'test','test','test','123123','ganti terahir ya',NULL,NULL),(9,'anu','anua','anu','1234','anu','2022-02-03 19:43:31',NULL),(10,'mama','mama@mail.com','$2a$10$5lsEzqht.W2V8fDlKaENyehy.bm7MdCsB7yqG8QSJvhlbmin8NnaS',NULL,NULL,'2022-02-04 22:34:20',NULL),(11,'admin','admin@mail.com','$2a$10$SzJeaCjEz2KOdmcbqMPCfeCWRA44krSETPuihTDf6DRukaSDrQvIi',NULL,NULL,'2022-02-06 01:59:23',NULL),(12,'Lukman Nur Hakim','polo123@gmail.com','$2a$10$ybPo9AGQ6aJ.H6/XA4YY..L6AnMj7qV.zuR/sbM4whyO2m/Aeta.e','089658064695','https://qph.fs.quoracdn.net/main-qimg-034253ef2a12b186fd6e4870328fa178-lq','2022-02-06 02:04:28','2022-02-07 02:57:50'),(13,'Mutiara A\'yun','mutiara@gmail.com','$2a$10$S1tiJxvc8Sy35.E0lp6KF.uROR8VHrH1xYRNE6snh4rdh/wW7vAXq',NULL,NULL,'2022-02-06 12:49:23',NULL),(14,'Jogja Walking','ara@gmail.com','$2a$10$6uZRYmPUCG/VEmD9lTuExuvegg8A.yx13Gb28jrK9Yv1YyHw9NKPC',NULL,NULL,'2022-02-07 02:14:38',NULL),(15,'Tiara','tiara@gmail.com','$2a$10$.WVpmR4KxS8WNHrqmtkEFe.vkuaeHtz/s.kSTMQCvzvcN2rvfiUdi',NULL,NULL,'2022-02-07 02:15:24',NULL),(16,'muti','mut@gmail.com','$2a$10$kPEQglDLp9lC8vfw1uJdmea0UArzJpBF7Qg3ceIuwNBHQOAM3sHuS',NULL,NULL,'2022-02-07 02:16:05',NULL),(17,'tiar','tiar@gmail.com','$2a$10$zj0GtUHxmAvStGyIAaFw/usW25jBiOFYUkFUWnutBbGWW8SGQFTUq',NULL,NULL,'2022-02-07 02:17:25',NULL),(18,'sakawisata','ara@gmail.com','$2a$10$LPOYSjKxJydMHP6AGYO2pOfd6crnZMA1DAqdsgJs8Du3dP96na/zO',NULL,NULL,'2022-02-07 02:18:18',NULL),(19,'Tara','tara@gmail.com','$2a$10$DMPqBwRxzNGAd1L00NVfquy.ecAk/by9mZTVcPrZaLFzD7Nxe73Py',NULL,NULL,'2022-02-07 02:19:16',NULL),(20,'Lukman','polo123@gmail.com','$2a$10$X2ULDjwwhOkayp4kjoRo3OLZy8KUBjTj1VhPF41lnJMwMP1ErxKlS','986532','https://qph.fs.quoracdn.net/main-qimg-034253ef2a12b186fd6e4870328fa178-lq','2022-02-07 03:00:52','2022-02-07 03:10:55'),(21,'lukcyman','polo123@gmail.com','$2a$10$9tjlKsy0Dh8SvXzjnEbi2usJFdL.sandUjNS7XgLQtGF.5vQK1hgK','98653232','https://qph.fs.quoracdn.net/main-qimg-034253ef2a12b186fd6e4870328fa178-lq','2022-02-07 03:27:13','2022-02-07 03:31:24'),(22,'Lukman Nur Hakim','polo123@gmail.com','$2a$10$ORoQNRXhfWtk9ULMwc/fKefqg35dqi1WiCl5R272iq3NAegHdKAjS','986532','https://qph.fs.quoracdn.net/main-qimg-034253ef2a12b186fd6e4870328fa178-lq','2022-02-07 03:34:50','2022-02-07 04:52:00'),(23,'Lukman Nur Hakim','lukman@test.com','$2a$10$01Whqk/UM/fWdc4/kLzv9OzEWApK6e3feTMKWmsLfchogHf9pxst.',NULL,NULL,'2022-02-07 05:18:20',NULL),(24,'admin','admin@mail.com','$2a$10$1xj1SeBbuRifD6Ou4exb7./jKbyjtC0nObCyQI5rN8YaunXBpu8ka',NULL,NULL,'2022-02-07 06:55:08',NULL),(25,'Lukman Nur Hakim','santuy@gmail.com','$2a$10$n3JXU6hq8l0X9EDiOw/wl.ia0MRTzB9A.RcCrSfiEKQfSwuZXroD.','986532','https://comicvine.gamespot.com/a/uploads/original/6/67663/5909709-1221163529-32236.jpg','2022-02-07 08:05:50',NULL),(26,'Lukman Nur Hakim','lukman@test.com','$2a$10$DT3fvolVfBWvIO3X89Ezk.3GDP8XgQscmGPatfTRigGDy1lqBD316',NULL,NULL,'2022-02-07 08:44:31','2022-02-07 08:46:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `delete_user_and_event` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
DECLARE v_user_id int;
SET v_user_id=OLD.id;
if NOT(NEW.deleted_at <=> OLD.deleted_at) then
update events set deleted_at = current_timestamp WHERE userid = v_user_id;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-07 16:53:38
