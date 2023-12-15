-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: wrestling
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `match_num` int unsigned NOT NULL AUTO_INCREMENT,
  `promotion_id` int unsigned NOT NULL,
  `show_date` date NOT NULL,
  PRIMARY KEY (`match_num`,`promotion_id`,`show_date`),
  KEY `fk_match_show1_idx` (`promotion_id`,`show_date`),
  CONSTRAINT `fk_match_show1` FOREIGN KEY (`promotion_id`, `show_date`) REFERENCES `show` (`promotion_id`, `show_date`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (1,1,'2021-12-04'),(2,1,'2021-12-04'),(3,1,'2021-12-04'),(4,1,'2021-12-04'),(5,1,'2021-12-04'),(6,1,'2021-12-04'),(7,1,'2021-12-04'),(1,1,'2021-12-08'),(2,1,'2021-12-08'),(3,1,'2021-12-08'),(4,1,'2021-12-08'),(5,1,'2021-12-08'),(6,1,'2021-12-08'),(7,1,'2021-12-08'),(1,1,'2021-12-11'),(2,1,'2021-12-11'),(3,1,'2021-12-11'),(4,1,'2021-12-11'),(5,1,'2021-12-11'),(6,1,'2021-12-11'),(7,1,'2021-12-11'),(1,1,'2022-05-06'),(2,1,'2022-05-06'),(3,1,'2022-05-06'),(4,1,'2022-05-06'),(5,1,'2022-05-06'),(6,1,'2022-05-06'),(7,1,'2022-05-06'),(1,1,'2022-07-19'),(2,1,'2022-07-19'),(3,1,'2022-07-19'),(4,1,'2022-07-19'),(5,1,'2022-07-19'),(6,1,'2022-07-19'),(7,1,'2022-07-19'),(1,1,'2023-11-01'),(2,1,'2023-11-01'),(3,1,'2023-11-01'),(4,1,'2023-11-01'),(5,1,'2023-11-01'),(6,1,'2023-11-01'),(7,1,'2023-11-01'),(1,1,'2023-11-02'),(2,1,'2023-11-02'),(3,1,'2023-11-02'),(4,1,'2023-11-02'),(5,1,'2023-11-02'),(6,1,'2023-11-02'),(7,1,'2023-11-02'),(1,1,'2023-11-15'),(2,1,'2023-11-15'),(3,1,'2023-11-15'),(4,1,'2023-11-15'),(5,1,'2023-11-15'),(6,1,'2023-11-15'),(7,1,'2023-11-15'),(1,2,'2022-02-11'),(2,2,'2022-02-11'),(3,2,'2022-02-11'),(4,2,'2022-02-11'),(5,2,'2022-02-11'),(6,2,'2022-02-11'),(7,2,'2022-02-11'),(1,2,'2022-02-19'),(2,2,'2022-02-19'),(3,2,'2022-02-19'),(4,2,'2022-02-19'),(5,2,'2022-02-19'),(6,2,'2022-02-19'),(7,2,'2022-02-19'),(1,2,'2023-01-02'),(2,2,'2023-01-02'),(3,2,'2023-01-02'),(4,2,'2023-01-02'),(5,2,'2023-01-02'),(6,2,'2023-01-02'),(7,2,'2023-01-02'),(1,2,'2023-02-09'),(2,2,'2023-02-09'),(3,2,'2023-02-09'),(4,2,'2023-02-09'),(5,2,'2023-02-09'),(6,2,'2023-02-09'),(7,2,'2023-02-09'),(1,2,'2023-05-11'),(2,2,'2023-05-11'),(3,2,'2023-05-11'),(4,2,'2023-05-11'),(5,2,'2023-05-11'),(6,2,'2023-05-11'),(7,2,'2023-05-11'),(1,2,'2023-11-17'),(2,2,'2023-11-17'),(3,2,'2023-11-17'),(4,2,'2023-11-17'),(5,2,'2023-11-17'),(6,2,'2023-11-17'),(7,2,'2023-11-17'),(1,3,'2022-02-23'),(2,3,'2022-02-23'),(3,3,'2022-02-23'),(4,3,'2022-02-23'),(5,3,'2022-02-23'),(6,3,'2022-02-23'),(7,3,'2022-02-23'),(1,3,'2022-03-14'),(2,3,'2022-03-14'),(3,3,'2022-03-14'),(4,3,'2022-03-14'),(5,3,'2022-03-14'),(6,3,'2022-03-14'),(7,3,'2022-03-14'),(1,3,'2022-05-02'),(2,3,'2022-05-02'),(3,3,'2022-05-02'),(4,3,'2022-05-02'),(5,3,'2022-05-02'),(6,3,'2022-05-02'),(7,3,'2022-05-02'),(1,3,'2022-08-02'),(2,3,'2022-08-02'),(3,3,'2022-08-02'),(4,3,'2022-08-02'),(5,3,'2022-08-02'),(6,3,'2022-08-02'),(7,3,'2022-08-02'),(1,3,'2022-09-01'),(2,3,'2022-09-01'),(3,3,'2022-09-01'),(4,3,'2022-09-01'),(5,3,'2022-09-01'),(6,3,'2022-09-01'),(7,3,'2022-09-01'),(1,3,'2022-09-18'),(2,3,'2022-09-18'),(3,3,'2022-09-18'),(4,3,'2022-09-18'),(5,3,'2022-09-18'),(6,3,'2022-09-18'),(7,3,'2022-09-18');
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `home_town` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `home_state` char(2) COLLATE utf8mb3_bin DEFAULT NULL,
  `home_zip` int DEFAULT NULL,
  `home_country` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `person_id_UNIQUE` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'sensei','bock','peoria','il',NULL,'usa'),(2,'latin','thunder','muscatine','ia',52761,'usa'),(3,'shane','hollister','davenport','ia',NULL,'usa'),(4,'knight','wagner','davenport','ia',NULL,'usa'),(5,'valentina','loca','albuquerque','nm',NULL,'usa'),(6,'jt','energy','ames','ia',NULL,'usa'),(7,'jah-c',NULL,'minneapolis','mn',NULL,'usa'),(8,'rahne','victoria','dubuque','ia',NULL,'usa'),(9,'jp','finger','new boston','il',NULL,'usa'),(10,'jared','thumb','muscatine','ia',52761,'usa'),(11,'augustus','draven','area 51','nm',NULL,'usa'),(12,'john','g','iowa city','ia',NULL,'usa'),(13,'larry','lemons','seattle','wa',NULL,'usa'),(14,'devil dog','moseley',NULL,NULL,NULL,'usa'),(15,'deonn','rusman','anchorage','al',NULL,'usa'),(16,'shain','boucher','new orleans','la',NULL,'usa'),(17,'steve','manders','iowa city','ia',NULL,'usa'),(18,'marek','brave','davenport','ia',NULL,'usa'),(19,'alex','mccarthy','davenport','ia',NULL,'usa'),(20,'tim','regal','davenport','ia',NULL,'usa'),(21,'bucky','collins',NULL,NULL,NULL,'usa'),(22,'dakota',NULL,NULL,NULL,NULL,'usa'),(23,'christian','rose',NULL,NULL,NULL,'usa'),(24,'ript','studwell','davenport','ia',NULL,'usa'),(25,'cole','havens',NULL,NULL,NULL,'usa');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_has_match`
--

DROP TABLE IF EXISTS `person_has_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_has_match` (
  `person_id` int unsigned NOT NULL,
  `match_num` int unsigned NOT NULL,
  `promotion_id` int unsigned NOT NULL,
  `show_date` date NOT NULL,
  `winner` blob,
  `role_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`person_id`,`match_num`,`promotion_id`,`show_date`),
  KEY `fk_person_has_match_match1_idx` (`match_num`,`promotion_id`,`show_date`),
  KEY `fk_person_has_match_person1_idx` (`person_id`),
  KEY `fk_person_has_match_role1_idx` (`role_id`),
  CONSTRAINT `fk_person_has_match_match1` FOREIGN KEY (`match_num`, `promotion_id`, `show_date`) REFERENCES `match` (`match_num`, `promotion_id`, `show_date`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_person_has_match_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_person_has_match_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_has_match`
--

LOCK TABLES `person_has_match` WRITE;
/*!40000 ALTER TABLE `person_has_match` DISABLE KEYS */;
INSERT INTO `person_has_match` VALUES (1,1,1,'2021-12-08',_binary '1',2),(1,1,1,'2023-11-01',_binary '1',2),(1,1,1,'2023-11-15',_binary '1',2),(1,2,3,'2022-02-23',_binary '1',2),(1,2,3,'2022-09-01',_binary '1',2),(1,3,1,'2023-11-02',_binary '1',2),(1,3,2,'2022-02-19',_binary '1',2),(1,3,2,'2023-05-11',_binary '1',2),(1,4,1,'2021-12-04',_binary '1',2),(1,4,1,'2021-12-11',_binary '1',2),(1,5,3,'2022-05-02',_binary '1',2),(1,5,3,'2022-09-18',_binary '1',2),(1,6,2,'2022-02-11',_binary '1',2),(1,6,2,'2023-11-17',_binary '1',2),(1,7,1,'2022-05-06',_binary '1',2),(1,7,1,'2022-07-19',_binary '1',2),(2,1,2,'2023-01-02',_binary '1',2),(2,1,2,'2023-02-09',_binary '1',2),(2,2,1,'2021-12-08',_binary '1',2),(2,2,1,'2023-11-01',_binary '1',2),(2,2,1,'2023-11-15',_binary '1',2),(2,3,3,'2022-02-23',_binary '1',2),(2,3,3,'2022-09-01',_binary '1',2),(2,4,1,'2023-11-02',_binary '1',2),(2,4,2,'2022-02-19',_binary '1',2),(2,4,2,'2023-05-11',_binary '1',2),(2,5,1,'2021-12-04',_binary '1',2),(2,5,1,'2021-12-11',_binary '1',2),(2,6,3,'2022-05-02',_binary '1',2),(2,6,3,'2022-09-18',_binary '1',2),(2,7,2,'2022-02-11',_binary '1',2),(2,7,2,'2023-11-17',_binary '1',2),(3,1,3,'2022-03-14',_binary '1',2),(3,1,3,'2022-08-02',_binary '1',2),(3,2,2,'2023-01-02',_binary '1',2),(3,2,2,'2023-02-09',_binary '1',2),(3,3,1,'2021-12-08',_binary '1',2),(3,3,1,'2023-11-01',_binary '1',2),(3,3,1,'2023-11-15',_binary '1',2),(3,4,3,'2022-02-23',_binary '1',2),(3,4,3,'2022-09-01',_binary '1',2),(3,5,1,'2023-11-02',_binary '1',2),(3,5,2,'2022-02-19',_binary '1',2),(3,5,2,'2023-05-11',_binary '1',2),(3,6,1,'2021-12-04',_binary '1',2),(3,6,1,'2021-12-11',_binary '1',2),(3,7,3,'2022-05-02',_binary '1',2),(3,7,3,'2022-09-18',_binary '1',2),(4,1,1,'2021-12-08',_binary '0',3),(4,1,2,'2023-05-11',_binary '0',3),(4,2,2,'2023-11-17',_binary '0',3),(4,2,3,'2022-03-14',_binary '0',3),(4,3,2,'2023-01-02',_binary '0',3),(4,3,3,'2022-09-01',_binary '0',3),(4,4,2,'2022-02-19',_binary '0',3),(4,4,3,'2022-09-18',_binary '0',3),(4,5,1,'2023-11-01',_binary '0',3),(4,5,3,'2022-08-02',_binary '0',3),(4,6,1,'2021-12-04',_binary '0',3),(4,6,3,'2022-02-23',_binary '0',3),(4,7,1,'2022-05-06',_binary '0',3),(4,7,3,'2022-05-02',_binary '0',3),(5,1,1,'2022-07-19',_binary '0',3),(5,1,2,'2023-02-09',_binary '0',3),(5,2,1,'2021-12-08',_binary '0',3),(5,2,2,'2023-05-11',_binary '0',3),(5,3,2,'2023-11-17',_binary '0',3),(5,3,3,'2022-03-14',_binary '0',3),(5,4,2,'2023-01-02',_binary '0',3),(5,4,3,'2022-09-01',_binary '0',3),(5,5,2,'2022-02-19',_binary '0',3),(5,5,3,'2022-09-18',_binary '0',3),(5,6,1,'2023-11-01',_binary '0',3),(5,6,3,'2022-08-02',_binary '0',3),(5,7,1,'2021-12-04',_binary '0',3),(5,7,3,'2022-02-23',_binary '0',3),(6,1,1,'2021-12-11',_binary '0',3),(6,1,2,'2022-02-11',_binary '0',3),(6,2,1,'2022-07-19',_binary '0',3),(6,2,2,'2023-02-09',_binary '0',3),(6,3,1,'2021-12-08',_binary '0',3),(6,3,2,'2023-05-11',_binary '0',3),(6,4,2,'2023-11-17',_binary '0',3),(6,4,3,'2022-03-14',_binary '0',3),(6,5,2,'2023-01-02',_binary '0',3),(6,5,3,'2022-09-01',_binary '0',3),(6,6,2,'2022-02-19',_binary '0',3),(6,6,3,'2022-09-18',_binary '0',3),(6,7,1,'2023-11-01',_binary '0',3),(6,7,3,'2022-08-02',_binary '0',3),(7,1,1,'2022-05-06',_binary '1',2),(7,1,1,'2022-07-19',_binary '1',2),(7,2,3,'2022-03-14',_binary '1',2),(7,2,3,'2022-08-02',_binary '1',2),(7,3,2,'2023-01-02',_binary '1',2),(7,3,2,'2023-02-09',_binary '1',2),(7,4,1,'2021-12-08',_binary '1',2),(7,4,1,'2023-11-01',_binary '1',2),(7,4,1,'2023-11-15',_binary '1',2),(7,5,3,'2022-02-23',_binary '1',2),(7,5,3,'2022-09-01',_binary '1',2),(7,6,1,'2023-11-02',_binary '1',2),(7,6,2,'2022-02-19',_binary '1',2),(7,6,2,'2023-05-11',_binary '1',2),(7,7,1,'2021-12-04',_binary '1',2),(7,7,1,'2021-12-11',_binary '1',2),(8,1,2,'2022-02-11',_binary '1',2),(8,1,2,'2023-11-17',_binary '1',2),(8,2,1,'2022-05-06',_binary '1',2),(8,2,1,'2022-07-19',_binary '1',2),(8,3,3,'2022-03-14',_binary '1',2),(8,3,3,'2022-08-02',_binary '1',2),(8,4,2,'2023-01-02',_binary '1',2),(8,4,2,'2023-02-09',_binary '1',2),(8,5,1,'2021-12-08',_binary '1',2),(8,5,1,'2023-11-01',_binary '1',2),(8,5,1,'2023-11-15',_binary '1',2),(8,6,3,'2022-02-23',_binary '1',2),(8,6,3,'2022-09-01',_binary '1',2),(8,7,1,'2023-11-02',_binary '1',2),(8,7,2,'2022-02-19',_binary '1',2),(8,7,2,'2023-05-11',_binary '1',2),(9,1,1,'2023-11-02',_binary '0',3),(9,1,1,'2023-11-15',_binary '0',3),(9,2,1,'2021-12-11',_binary '0',3),(9,2,2,'2022-02-11',_binary '0',3),(9,3,1,'2022-07-19',_binary '0',3),(9,3,2,'2023-02-09',_binary '0',3),(9,4,1,'2021-12-08',_binary '0',3),(9,4,2,'2023-05-11',_binary '0',3),(9,5,2,'2023-11-17',_binary '0',3),(9,5,3,'2022-03-14',_binary '0',3),(9,6,2,'2023-01-02',_binary '0',3),(9,6,3,'2022-09-01',_binary '0',3),(9,7,2,'2022-02-19',_binary '0',3),(9,7,3,'2022-09-18',_binary '0',3),(10,1,3,'2022-05-02',_binary '1',2),(10,1,3,'2022-09-18',_binary '1',2),(10,2,2,'2022-02-11',_binary '1',2),(10,2,2,'2023-11-17',_binary '1',2),(10,3,1,'2022-05-06',_binary '1',2),(10,3,1,'2022-07-19',_binary '1',2),(10,4,3,'2022-03-14',_binary '1',2),(10,4,3,'2022-08-02',_binary '1',2),(10,5,2,'2023-01-02',_binary '1',2),(10,5,2,'2023-02-09',_binary '1',2),(10,6,1,'2021-12-08',_binary '1',2),(10,6,1,'2023-11-01',_binary '1',2),(10,6,1,'2023-11-15',_binary '1',2),(10,7,3,'2022-02-23',_binary '1',2),(10,7,3,'2022-09-01',_binary '1',2),(11,1,1,'2022-05-06',_binary '0',3),(11,1,3,'2022-05-02',_binary '0',3),(11,2,1,'2023-11-02',_binary '0',3),(11,2,1,'2023-11-15',_binary '0',3),(11,3,1,'2021-12-11',_binary '0',3),(11,3,2,'2022-02-11',_binary '0',3),(11,4,1,'2022-07-19',_binary '0',3),(11,4,2,'2023-02-09',_binary '0',3),(11,5,1,'2021-12-08',_binary '0',3),(11,5,2,'2023-05-11',_binary '0',3),(11,6,2,'2023-11-17',_binary '0',3),(11,6,3,'2022-03-14',_binary '0',3),(11,7,2,'2023-01-02',_binary '0',3),(11,7,3,'2022-09-01',_binary '0',3),(14,1,1,'2021-12-04',_binary '0',3),(14,1,3,'2022-02-23',_binary '0',3),(14,2,1,'2022-05-06',_binary '0',3),(14,2,3,'2022-05-02',_binary '0',3),(14,3,1,'2023-11-02',_binary '0',3),(14,3,1,'2023-11-15',_binary '0',3),(14,4,1,'2021-12-11',_binary '0',3),(14,4,2,'2022-02-11',_binary '0',3),(14,5,1,'2022-07-19',_binary '0',3),(14,5,2,'2023-02-09',_binary '0',3),(14,6,1,'2021-12-08',_binary '0',3),(14,6,2,'2023-05-11',_binary '0',3),(14,7,2,'2023-11-17',_binary '0',3),(14,7,3,'2022-03-14',_binary '0',3),(15,1,1,'2021-12-04',_binary '1',2),(15,1,1,'2021-12-11',_binary '1',2),(15,2,3,'2022-05-02',_binary '1',2),(15,2,3,'2022-09-18',_binary '1',2),(15,3,2,'2022-02-11',_binary '1',2),(15,3,2,'2023-11-17',_binary '1',2),(15,4,1,'2022-05-06',_binary '1',2),(15,4,1,'2022-07-19',_binary '1',2),(15,5,3,'2022-03-14',_binary '1',2),(15,5,3,'2022-08-02',_binary '1',2),(15,6,2,'2023-01-02',_binary '1',2),(15,6,2,'2023-02-09',_binary '1',2),(15,7,1,'2021-12-08',_binary '1',2),(15,7,1,'2023-11-01',_binary '1',2),(15,7,1,'2023-11-15',_binary '1',2),(16,1,1,'2023-11-02',_binary '1',2),(16,1,2,'2022-02-19',_binary '1',2),(16,1,2,'2023-05-11',_binary '1',2),(16,2,1,'2021-12-04',_binary '1',2),(16,2,1,'2021-12-11',_binary '1',2),(16,3,3,'2022-05-02',_binary '1',2),(16,3,3,'2022-09-18',_binary '1',2),(16,4,2,'2022-02-11',_binary '1',2),(16,4,2,'2023-11-17',_binary '1',2),(16,5,1,'2022-05-06',_binary '1',2),(16,5,1,'2022-07-19',_binary '1',2),(16,6,3,'2022-03-14',_binary '1',2),(16,6,3,'2022-08-02',_binary '1',2),(16,7,2,'2023-01-02',_binary '1',2),(16,7,2,'2023-02-09',_binary '1',2),(17,1,3,'2022-02-23',_binary '1',2),(17,1,3,'2022-09-01',_binary '1',2),(17,2,1,'2023-11-02',_binary '1',2),(17,2,2,'2022-02-19',_binary '1',2),(17,2,2,'2023-05-11',_binary '1',2),(17,3,1,'2021-12-04',_binary '1',2),(17,3,1,'2021-12-11',_binary '1',2),(17,4,3,'2022-05-02',_binary '1',2),(17,4,3,'2022-09-18',_binary '1',2),(17,5,2,'2022-02-11',_binary '1',2),(17,5,2,'2023-11-17',_binary '1',2),(17,6,1,'2022-05-06',_binary '1',2),(17,6,1,'2022-07-19',_binary '1',2),(17,7,3,'2022-03-14',_binary '1',2),(17,7,3,'2022-08-02',_binary '1',2),(21,1,1,'2023-11-01',_binary '0',3),(21,1,3,'2022-08-02',_binary '0',3),(21,2,1,'2021-12-04',_binary '0',3),(21,2,3,'2022-02-23',_binary '0',3),(21,3,1,'2022-05-06',_binary '0',3),(21,3,3,'2022-05-02',_binary '0',3),(21,4,1,'2023-11-02',_binary '0',3),(21,4,1,'2023-11-15',_binary '0',3),(21,5,1,'2021-12-11',_binary '0',3),(21,5,2,'2022-02-11',_binary '0',3),(21,6,1,'2022-07-19',_binary '0',3),(21,6,2,'2023-02-09',_binary '0',3),(21,7,1,'2021-12-08',_binary '0',3),(21,7,2,'2023-05-11',_binary '0',3),(23,1,2,'2022-02-19',_binary '0',3),(23,1,3,'2022-09-18',_binary '0',3),(23,2,1,'2023-11-01',_binary '0',3),(23,2,3,'2022-08-02',_binary '0',3),(23,3,1,'2021-12-04',_binary '0',3),(23,3,3,'2022-02-23',_binary '0',3),(23,4,1,'2022-05-06',_binary '0',3),(23,4,3,'2022-05-02',_binary '0',3),(23,5,1,'2023-11-02',_binary '0',3),(23,5,1,'2023-11-15',_binary '0',3),(23,6,1,'2021-12-11',_binary '0',3),(23,6,2,'2022-02-11',_binary '0',3),(23,7,1,'2022-07-19',_binary '0',3),(23,7,2,'2023-02-09',_binary '0',3),(24,1,2,'2023-01-02',_binary '0',3),(24,1,3,'2022-09-01',_binary '0',3),(24,2,2,'2022-02-19',_binary '0',3),(24,2,3,'2022-09-18',_binary '0',3),(24,3,1,'2023-11-01',_binary '0',3),(24,3,3,'2022-08-02',_binary '0',3),(24,4,1,'2021-12-04',_binary '0',3),(24,4,3,'2022-02-23',_binary '0',3),(24,5,1,'2022-05-06',_binary '0',3),(24,5,3,'2022-05-02',_binary '0',3),(24,6,1,'2023-11-02',_binary '0',3),(24,6,1,'2023-11-15',_binary '0',3),(24,7,1,'2021-12-11',_binary '0',3),(24,7,2,'2022-02-11',_binary '0',3),(25,1,2,'2023-11-17',_binary '0',3),(25,1,3,'2022-03-14',_binary '0',3),(25,2,2,'2023-01-02',_binary '0',3),(25,2,3,'2022-09-01',_binary '0',3),(25,3,2,'2022-02-19',_binary '0',3),(25,3,3,'2022-09-18',_binary '0',3),(25,4,1,'2023-11-01',_binary '0',3),(25,4,3,'2022-08-02',_binary '0',3),(25,5,1,'2021-12-04',_binary '0',3),(25,5,3,'2022-02-23',_binary '0',3),(25,6,1,'2022-05-06',_binary '0',3),(25,6,3,'2022-05-02',_binary '0',3),(25,7,1,'2023-11-02',_binary '0',3),(25,7,1,'2023-11-15',_binary '0',3);
/*!40000 ALTER TABLE `person_has_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_is_staff`
--

DROP TABLE IF EXISTS `person_is_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_is_staff` (
  `promotion_id` int unsigned NOT NULL,
  `show_date` date NOT NULL,
  `person_id` int unsigned NOT NULL,
  `role_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`promotion_id`,`show_date`,`person_id`),
  KEY `fk_show_has_person_person1_idx` (`person_id`),
  KEY `fk_show_has_person_show1_idx` (`promotion_id`,`show_date`),
  KEY `fk_staff_role1_idx` (`role_id`),
  CONSTRAINT `fk_show_has_person_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_show_has_person_show1` FOREIGN KEY (`promotion_id`, `show_date`) REFERENCES `show` (`promotion_id`, `show_date`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_is_staff`
--

LOCK TABLES `person_is_staff` WRITE;
/*!40000 ALTER TABLE `person_is_staff` DISABLE KEYS */;
INSERT INTO `person_is_staff` VALUES (1,'2021-12-04',19,6),(1,'2021-12-08',19,6),(1,'2021-12-11',19,6),(1,'2022-05-06',19,6),(1,'2022-07-19',19,6),(1,'2023-11-01',19,6),(1,'2023-11-15',19,6),(1,'2021-12-04',4,11),(1,'2021-12-04',20,11),(1,'2021-12-08',4,11),(1,'2021-12-08',20,11),(1,'2021-12-11',4,11),(1,'2021-12-11',20,11),(1,'2022-05-06',4,11),(1,'2022-05-06',20,11),(1,'2022-07-19',4,11),(1,'2022-07-19',20,11),(1,'2023-11-01',20,11),(1,'2023-11-15',4,11),(1,'2023-11-15',20,11);
/*!40000 ALTER TABLE `person_is_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `promotion_id` int unsigned NOT NULL AUTO_INCREMENT,
  `promotion_initials` varchar(10) COLLATE utf8mb3_bin NOT NULL,
  `promotion_name` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `promoter` int unsigned DEFAULT NULL,
  PRIMARY KEY (`promotion_id`),
  UNIQUE KEY `promotion_id_UNIQUE` (`promotion_id`),
  KEY `fk_promotion_person1_idx` (`promoter`),
  CONSTRAINT `fk_promotion_person1` FOREIGN KEY (`promoter`) REFERENCES `person` (`person_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'scw','scott county wrestling',18),(2,'zowa','zen of wrestling association',NULL),(3,'apw','absolute pro wrestling',NULL);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_description` varchar(15) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id_UNIQUE` (`role_id`),
  UNIQUE KEY `role_description_UNIQUE` (`role_description`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (11,'commentator'),(2,'face'),(4,'gimmick'),(3,'heel'),(8,'manager'),(1,'promoter'),(5,'referee'),(6,'ring announcer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show`
--

DROP TABLE IF EXISTS `show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show` (
  `promotion_id` int unsigned NOT NULL,
  `show_date` date NOT NULL,
  `venue_id` int DEFAULT NULL,
  PRIMARY KEY (`promotion_id`,`show_date`),
  KEY `fk_show_venue1_idx` (`venue_id`),
  CONSTRAINT `fk_show_promotion` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_show_venue1` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show`
--

LOCK TABLES `show` WRITE;
/*!40000 ALTER TABLE `show` DISABLE KEYS */;
INSERT INTO `show` VALUES (1,'2021-12-08',1),(1,'2021-12-11',1),(1,'2022-05-06',1),(1,'2023-11-01',1),(1,'2021-12-04',2),(1,'2022-07-19',2),(1,'2023-11-02',2),(1,'2023-11-15',2),(3,'2022-02-23',3),(3,'2022-03-14',3),(3,'2022-05-02',3),(3,'2022-08-02',3),(3,'2022-09-01',3),(3,'2022-09-18',3),(2,'2022-02-11',4),(2,'2022-02-19',4),(2,'2023-01-02',4),(2,'2023-02-09',4),(2,'2023-05-11',4),(2,'2023-11-17',4);
/*!40000 ALTER TABLE `show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `venue_id` int NOT NULL AUTO_INCREMENT,
  `venue_name` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `venue_address` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `venue_town` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `venue_state` char(2) COLLATE utf8mb3_bin DEFAULT NULL,
  `venue_zip` int DEFAULT NULL,
  PRIMARY KEY (`venue_id`),
  UNIQUE KEY `venue_id_UNIQUE` (`venue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'blue grass community center','232 e orphed st','blue grass','ia',52726),(2,'wildwood smokehouse & saloon','4919 walley dr se','iowa city','ia',52240),(3,'cedar valley sportsplex','300 jefferson st','waterloo','ia',50701),(4,'northside barbaq','117 n 4th st','oregon','il',61061);
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 17:53:37
