-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: Newlife
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `feelings`
--

DROP TABLE IF EXISTS `feelings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feelings` (
  `id_feeling` int NOT NULL AUTO_INCREMENT,
  `title_post` varchar(145) NOT NULL,
  `content_post` varchar(300) NOT NULL,
  `date_post` date NOT NULL,
  PRIMARY KEY (`id_feeling`),
  FULLTEXT KEY `index2` (`content_post`),
  CONSTRAINT `fk_post_1` FOREIGN KEY (`id_feeling`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `sender_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  PRIMARY KEY (`recipient_id`,`sender_id`),
  KEY `fk_friendship_1` (`sender_id`),
  CONSTRAINT `fk_friendship_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id_user`),
  CONSTRAINT `fk_friendship_2` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friendship_status`
--

DROP TABLE IF EXISTS `friendship_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship_status` (
  `sender_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `id_status` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`sender_id`,`recipient_id`),
  KEY `fk_friendship_status_status1_idx` (`recipient_id`),
  CONSTRAINT `fk_friendship_status_1` FOREIGN KEY (`recipient_id`) REFERENCES `friendship` (`recipient_id`),
  CONSTRAINT `fk_friendship_status_2` FOREIGN KEY (`recipient_id`) REFERENCES `status` (`id_status`),
  CONSTRAINT `fk_friendship_status_users1` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `name_user`,
 1 AS `surname_user`,
 1 AS `date_of_birth_user`,
 1 AS `place_of_birth_user`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id_post` int NOT NULL,
  `title_post` varchar(45) DEFAULT NULL,
  `content_post` varchar(300) NOT NULL,
  `date_post` date NOT NULL,
  `photo` blob,
  PRIMARY KEY (`id_post`),
  FULLTEXT KEY `index2` (`content_post`),
  CONSTRAINT `fk_posts_users1` FOREIGN KEY (`id_post`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `pending` varchar(45) DEFAULT NULL,
  `accepted` varchar(45) DEFAULT NULL,
  `declined` varchar(45) DEFAULT NULL,
  `blocked` varchar(45) DEFAULT NULL,
  `id_status` int NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `name_user` varchar(45) NOT NULL,
  `surname_user` varchar(45) NOT NULL,
  `date_of_birth_user` date NOT NULL,
  `place_of_birth_user` varchar(45) NOT NULL,
  `e_mail_user` varchar(45) NOT NULL,
  `username_user` varchar(45) NOT NULL,
  `description_user` varchar(100) NOT NULL,
  `photo_users` blob,
  PRIMARY KEY (`id_user`),
  KEY `index2` (`name_user`,`surname_user`,`username_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'Newlife'
--
/*!50003 DROP FUNCTION IF EXISTS `check_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;


DELIMITER ;;
CREATE DEFINER=`dalina`@`%` FUNCTION `check_num`() RETURNS int
    DETERMINISTIC
BEGIN
select recipient_id from friendship_status into @idrecipient;
select id_status from friendship_status into @idstatus;
while @idstatus = 2 and idrecipient= 2 do
	SELECT COUNT(@idrecipient) into @numberfriends;
end while;
return @numberfriends;
END ;;
DELIMITER ;


/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;


DELIMITER ;;
CREATE DEFINER=`dalina`@`%` PROCEDURE `delete_procedure`(IN p_id_user int)
BEGIN
DELETE FROM `users` WHERE (`id_user` = p_id_user);
END ;;
DELIMITER ;


/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;


DELIMITER ;;
CREATE DEFINER=`dalina`@`%` PROCEDURE `insert_procedure`(IN p_id_user int, IN p_name_user varchar(20), IN p_surname_user VARCHAR(20), IN p_date_of_birth_user DATE, IN p_place_of_birth_user VARCHAR(20), IN p_e_mail_user VARCHAR(20), IN p_username_user VARCHAR(20), IN p_description_user VARCHAR(100))
BEGIN
INSERT INTO `users` (`id_user`, `name_user`, `surname_user`, `date_of_birth_user`, `place_of_birth_user`, `e_mail_user`, `username_user`, `description_user`) VALUES (p_id_user, p_name_user, p_surname_user , p_date_of_birth_user , p_place_of_birth_user, p_e_mail_user, p_username_user, p_description_user);
END ;;
DELIMITER ;


/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;


DELIMITER ;;
CREATE DEFINER=`dalina`@`%` PROCEDURE `update_procedure`(IN p_description_user VARCHAR(50), IN p_id_user int)
BEGIN
UPDATE `users`
SET 
`description_user` = p_description_user WHERE (`id_user` = p_id_user);
END ;;
DELIMITER ;


/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dalina`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `users`.`name_user` AS `name_user`,`users`.`surname_user` AS `surname_user`,`users`.`date_of_birth_user` AS `date_of_birth_user`,`users`.`place_of_birth_user` AS `place_of_birth_user` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-27  0:10:18
