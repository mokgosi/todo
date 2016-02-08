-- MySQL dump 10.16  Distrib 10.1.9-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: todo
-- ------------------------------------------------------
-- Server version	10.1.9-MariaDB

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
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'admin','admin','admin@domain.com','admin@domain.com',1,'dnse7rw536ogk4gw8kw4wwgwoogwog8','$2y$13$dnse7rw536ogk4gw8kw4wubs2u6Pov4MWpvHr9Ny3shzWt6qJax9y','2016-02-08 19:25:30',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL),(2,'user','user','user@domain.com','user@domain.com',1,'17hfiomhhgyogg8w80kcg80w0ccw8go','$2y$13$17hfiomhhgyogg8w80kcgus4T/pCTnCgAWVC.SXS6imyJrlbibLA6',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(3,'tshepo','tshepo','tshepo@domain.com','tshepo@domain.com',1,'o3laua6fzuowsc0wo480k8cg8wkgws8','$2y$13$o3laua6fzuowsc0wo480kuLpB4P1xAICCmyl6dxUp3YkBvtdlB.tS','2016-02-08 07:10:19',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2FB3D0EE5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Project1','Some project description goes here.','2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(2,'Project2','Some project description goes here.','2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_527EDB25166D1F9C` (`project_id`),
  CONSTRAINT `FK_527EDB25166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,'Project-1-Task-1','Some brief project description to go here.',1,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(2,1,'Project-1-Task-2','Some brief project description to go here.',1,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(3,1,'Project-1-Task-3','Some brief project description to go here.',1,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(4,1,'Project-1-Task-4','Some brief project description to go here.',1,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(5,1,'Project-1-Task-5','Some brief project description to go here.',1,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(6,2,'Project-2-Task-1','Some brief project description to go here.',2,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(7,2,'Project-2-Task-2','Some brief project description to go here.',2,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(8,2,'Project-2-Task-3','Some brief project description to go here.',2,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(9,2,'Project-2-Task-4','Some brief project description to go here.',2,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(10,2,'Project-2-Task-5','Some brief project description to go here.',2,'2016-02-07 12:07:27','2016-02-07 12:07:27','2016-03-08 12:07:27','Pending'),(11,1,'Eula','desc',1,'2016-02-07 15:00:49','2016-02-07 15:00:49','2016-02-17 00:00:00','Pending'),(12,1,'Eula Tibet','descrippiboios',1,'2016-02-07 15:02:10','2016-02-07 15:02:10','2016-02-27 00:00:00','Pending');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-08 21:55:08
