-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: irec
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `role` enum('SUPER_ADMIN','ADMIN','MODERATOR') NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `status` enum('ENABLED','DISABLED') DEFAULT 'DISABLED',
  `email` varchar(45) DEFAULT NULL,
  `receive_email` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `admin_2_user` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'ADMIN',NULL,NULL,'Artur',NULL,'ENABLED',NULL,0),(2,'SUPER_ADMIN',NULL,NULL,'Armen',NULL,'ENABLED',NULL,0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'yuy');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '0',
  `data` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_id` int(11) NOT NULL,
  `article_url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_news_images` (`image_id`),
  CONSTRAINT `FK_news_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (12,'Title of the first news','Here is going to be a body of the first news','2015-09-27 12:06:15',1,NULL),(15,'aw d','ddadasd','2015-11-13 09:22:02',1,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(45) NOT NULL,
  `client_id` varchar(45) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `user_2_access_tokens_idx` (`user_id`),
  CONSTRAINT `user_2_access_tokens` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('4a14606334b4ea28fd9b35c6b3189f3d55641b74','irec_id',2,'2015-09-14 22:54:02'),('81083ea3668bf48f52d25c7aeca51db381ec1b97','irec_id',1,'2015-09-14 22:55:16'),('e947905e3ca2aefbeb4d7553a6e0d584efa3aaaa','irec_id',2,'2015-09-14 23:15:40'),('18a884482a2f1ddf0fc02d598a75b804df667334','irec_id',1,'2015-09-14 23:19:58'),('9d359cc75e3ffc5e3d03c3ad6337f85f253889c0','irec_id',2,'2015-09-28 11:38:55'),('0350dc91a7a1e80315e7b1d7ee191d7e1d83b025','irec_id',2,'2015-09-28 16:05:15'),('53ce3420de59bc1e3c8ec62c8f5b1c1fffd4c1e5','irec_id',2,'2015-09-28 16:49:31'),('7e2c1537164492a52b9eca77b6798cf57abd5e3b','irec_id',2,'2015-11-14 14:04:44');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `client_id` varchar(45) NOT NULL,
  `client_secret` varchar(45) NOT NULL,
  `redirect_uri` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('irec_id','irec_secret',NULL);
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(45) DEFAULT NULL,
  `client_id` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expires` timestamp NULL DEFAULT NULL,
  KEY `user_2_refresh_tokens_idx` (`user_id`),
  CONSTRAINT `user_2_refresh_tokens` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('0b681b797b1f71fb21ba3c3a18855fc39c96dff4','irec_id',2,'2015-09-27 22:54:02'),('0b878a50b82eb7efb8d82e95ff57a5a3b46c8592','irec_id',1,'2015-09-27 22:55:16'),('250f61d6aace607c38f0dbdcacae707215a25912','irec_id',2,'2015-09-27 23:15:40'),('321fdcc7916ba000d81feb6f4ed5d7637259f0b5','irec_id',1,'2015-09-27 23:19:58'),('38473e74546b9f4ad8931616a0582b33ce23fce2','irec_id',2,'2015-10-11 11:38:55'),('57ae7a0d494fdd7c3ddf8f3b4ba5db20e0e4881c','irec_id',2,'2015-10-11 16:05:15'),('f7d7fd8122db20262c41d9549e640140265530bb','irec_id',2,'2015-10-11 16:49:31'),('e31e12eddcd4f73fb096db5eb5fb67b4f9274ae2','irec_id',2,'2015-11-27 14:04:44');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` enum('ADMIN','MASTER') NOT NULL,
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'artur','$2a$10$V9vQ.Fp4FZK1Om9A7ypz1OrhWEp7vRsU6dtP.U9e50mFahZ3LI0c.','ADMIN','0000-00-00 00:00:00'),(2,'admin','$2a$10$CSvRmSispA25nfsq3Azu.uz8cXGvKJdRjIejR7zAyE/OrO9yqX51O','ADMIN','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-06  1:12:31
