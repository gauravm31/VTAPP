-- MySQL dump 10.13  Distrib 5.6.19, for osx10.9 (x86_64)
--
-- Host: localhost    Database: colors_mix
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  `density` float(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (10,'red',0.20),(11,'green',0.30),(12,'blue',0.40),(13,'yellow',0.20),(14,'pink',0.30),(15,'cyan',0.40),(16,'white',0.28);
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixtures`
--

DROP TABLE IF EXISTS `mixtures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixtures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent1_id` int(11) DEFAULT NULL,
  `parent2_id` int(11) DEFAULT NULL,
  `mix_id` int(11) DEFAULT NULL,
  `mix_density` float(3,2) DEFAULT NULL,
  `parent1_perc` int(11) DEFAULT NULL,
  `parent2_perc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mix_id` (`mix_id`),
  CONSTRAINT `mixtures_ibfk_1` FOREIGN KEY (`mix_id`) REFERENCES `colors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixtures`
--

LOCK TABLES `mixtures` WRITE;
/*!40000 ALTER TABLE `mixtures` DISABLE KEYS */;
INSERT INTO `mixtures` VALUES (1,10,11,13,0.60,30,70),(2,10,12,14,0.50,50,50),(3,11,12,15,0.75,40,60),(4,10,13,16,0.28,80,20);
/*!40000 ALTER TABLE `mixtures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-12 11:13:27
