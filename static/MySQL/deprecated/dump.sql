CREATE DATABASE  IF NOT EXISTS `partsltd_prod` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `partsltd_prod`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: partsltd_prod
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `file_type`
--

DROP TABLE IF EXISTS `file_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_type` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `extension` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_last_on` datetime DEFAULT NULL,
  `updated_last_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_type`
--

LOCK TABLES `file_type` WRITE;
/*!40000 ALTER TABLE `file_type` DISABLE KEYS */;
INSERT INTO `file_type` VALUES (1,'JPEG','Joint Photographic Export Group','jpg','2024-04-28 19:03:07','root@localhost',NULL,NULL),(2,'PNG','Portable Network Graphic','png','2024-04-28 19:03:07','root@localhost',NULL,NULL),(3,'GIF','GIF','gif','2024-04-28 19:03:07','root@localhost',NULL,NULL),(4,'MPEG-4','Multimedia Photographic Export Group 4','mp4','2024-04-28 19:03:07','root@localhost',NULL,NULL);
/*!40000 ALTER TABLE `file_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_File_Type` BEFORE INSERT ON `file_type` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_File_Type` BEFORE UPDATE ON `file_type` FOR EACH ROW BEGIN
    INSERT INTO File_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed extension
	SELECT NEW.id_type, 'extension', CONVERT(OLD.extension, CHAR), CONVERT(NEW.extension, CHAR)
		WHERE NOT OLD.extension <=> NEW.extension
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `file_type_audit`
--

DROP TABLE IF EXISTS `file_type_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_type_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_type` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_last_on` datetime DEFAULT NULL,
  `updated_last_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_File_Type_Audit_id_type` (`id_type`),
  CONSTRAINT `FK_File_Type_Audit_id_type` FOREIGN KEY (`id_type`) REFERENCES `file_type` (`id_type`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_type_audit`
--

LOCK TABLES `file_type_audit` WRITE;
/*!40000 ALTER TABLE `file_type_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_type_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_File_Type_Audit` BEFORE INSERT ON `file_type_audit` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_File_Type_Audit` BEFORE UPDATE ON `file_type_audit` FOR EACH ROW BEGIN
    SET NEW.updated_last_on = NOW();
    SET NEW.updated_last_by = CURRENT_USER();
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_access_level`
--

DROP TABLE IF EXISTS `shop_access_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_access_level` (
  `id_access_level` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_access_level`),
  KEY `FK_Shop_Access_Level_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Access_Level_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_access_level`
--

LOCK TABLES `shop_access_level` WRITE;
/*!40000 ALTER TABLE `shop_access_level` DISABLE KEYS */;
INSERT INTO `shop_access_level` VALUES (1,'VIEW','View',3,_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'EDIT','Edit',2,_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL),(3,'ADMIN','Admin',1,_binary '',3,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_access_level` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Access_Level` BEFORE INSERT ON `shop_access_level` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Access_Level` BEFORE UPDATE ON `shop_access_level` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Access_Level_Audit (
		id_access_level,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_access_level, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT (OLD.code <=> NEW.code)
    UNION
    # Changed name
	SELECT NEW.id_access_level, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
    UNION
    # Changed priority
	SELECT NEW.id_access_level, 'priority', CONVERT(OLD.priority, CHAR), CONVERT(NEW.priority, CHAR), NEW.id_change_set
		WHERE NOT (OLD.priority <=> NEW.priority)
	UNION
	# Changed active
	SELECT NEW.id_access_level, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    # Changed display_order
	SELECT NEW.id_access_level, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
	;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_access_level_audit`
--

DROP TABLE IF EXISTS `shop_access_level_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_access_level_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_access_level` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Access_Level_Audit_id_access_level` (`id_access_level`),
  KEY `FK_Shop_Access_Level_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Access_Level_Audit_id_access_level` FOREIGN KEY (`id_access_level`) REFERENCES `shop_access_level` (`id_access_level`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Access_Level_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_access_level_audit`
--

LOCK TABLES `shop_access_level_audit` WRITE;
/*!40000 ALTER TABLE `shop_access_level_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_access_level_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_address`
--

DROP TABLE IF EXISTS `shop_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_address` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(200) NOT NULL,
  `id_region` int NOT NULL,
  `name_full` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `postcode` varchar(20) NOT NULL,
  `address_line_1` varchar(100) NOT NULL,
  `address_line_2` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` varchar(100) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_address`),
  KEY `FK_Shop_Address_id_user` (`id_user`),
  KEY `FK_Shop_Address_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Address_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Address_id_user` FOREIGN KEY (`id_user`) REFERENCES `shop_user` (`id_user`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_address`
--

LOCK TABLES `shop_address` WRITE;
/*!40000 ALTER TABLE `shop_address` DISABLE KEYS */;
INSERT INTO `shop_address` VALUES (1,'auth0|6582b95c895d09a70ba10fef',1,'Teddy','07375 571430','NN6 6EB','The Laurels','Cold Ashby Road','Cold Ashby','Northamptonshire',_binary '','2024-04-28 19:03:07','root@localhost',NULL),(2,'parts_guest',1,'Guest','07375 571430','NN6 6EB','The Laurels','Cold Ashby Road','Cold Ashby','Northamptonshire',_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Address` BEFORE INSERT ON `shop_address` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Address` BEFORE UPDATE ON `shop_address` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Address_Audit (
		id_address,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed region
	SELECT NEW.id_address, 'id_region', OLD.id_region, NEW.id_region, NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
    UNION
    # Changed name_full
	SELECT NEW.id_address, 'name_full', OLD.name_full, NEW.name_full, NEW.id_change_set
		WHERE NOT OLD.name_full <=> NEW.name_full
	UNION
    # Changed phone_number
	SELECT NEW.id_address, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
    # Changed postcode
	SELECT NEW.id_address, 'postcode', OLD.postcode, NEW.postcode, NEW.id_change_set
		WHERE NOT OLD.postcode <=> NEW.postcode
    UNION
    # Changed address_line_1
	SELECT NEW.id_address, 'address_line_1', OLD.address_line_1, NEW.address_line_1, NEW.id_change_set
		WHERE NOT OLD.address_line_1 <=> NEW.address_line_1
	UNION
    # Changed address_line_2
	SELECT NEW.id_address, 'address_line_2', OLD.address_line_2, NEW.address_line_2, NEW.id_change_set
		WHERE NOT OLD.address_line_2 <=> NEW.address_line_2
	UNION
    # Changed city
	SELECT NEW.id_address, 'city', OLD.city, NEW.city, NEW.id_change_set
		WHERE NOT OLD.city <=> NEW.city
    UNION
    # Changed county
	SELECT NEW.id_address, 'county', OLD.county, NEW.county, NEW.id_change_set
		WHERE NOT OLD.county <=> NEW.county
	UNION
	# Changed active
	SELECT NEW.id_address, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_address_audit`
--

DROP TABLE IF EXISTS `shop_address_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_address_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_address` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Address_Audit_id_address` (`id_address`),
  KEY `FK_Shop_Address_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Address_Audit_id_address` FOREIGN KEY (`id_address`) REFERENCES `shop_address` (`id_address`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Address_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_address_audit`
--

LOCK TABLES `shop_address_audit` WRITE;
/*!40000 ALTER TABLE `shop_address_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_address_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_category`),
  KEY `FK_Shop_Product_Category_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Category_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (1,'ASS','Assistive Devices','Braille product line and other assistive devices',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'MISC','Miscellaneous','Not category allocated products',_binary '',99,'2024-04-28 19:03:07','root@localhost',NULL),(3,'TECH','Technology','Technological devices',_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Product_Category` BEFORE INSERT ON `shop_category` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Product_Category` BEFORE UPDATE ON `shop_category` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Category_Audit (
		id_category,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_category, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_category, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed description
	SELECT NEW.id_category, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT OLD.description <=> NEW.description
	UNION
	# Changed active
	SELECT NEW.id_category, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
    # Changed display_order
	SELECT NEW.id_category, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_category_audit`
--

DROP TABLE IF EXISTS `shop_category_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Product_Category_Audit_id_category` (`id_category`),
  KEY `FK_Shop_Product_Category_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Category_Audit_id_category` FOREIGN KEY (`id_category`) REFERENCES `shop_category` (`id_category`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Category_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category_audit`
--

LOCK TABLES `shop_category_audit` WRITE;
/*!40000 ALTER TABLE `shop_category_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_category_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_currency`
--

DROP TABLE IF EXISTS `shop_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_currency` (
  `id_currency` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(1) NOT NULL,
  `factor_from_GBP` float NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_currency`),
  KEY `FK_Shop_Currency_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Currency_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_currency`
--

LOCK TABLES `shop_currency` WRITE;
/*!40000 ALTER TABLE `shop_currency` DISABLE KEYS */;
INSERT INTO `shop_currency` VALUES (1,'GBP','Great British Pound','£',1,_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'EUR','Euro','€',1.17,_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_currency` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Currency` BEFORE INSERT ON `shop_currency` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Currency` BEFORE UPDATE ON `shop_currency` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Currency_Audit (
		id_currency,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_currency, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_currency, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
    # Changed symbol
	SELECT NEW.id_currency, 'symbol', OLD.symbol, NEW.symbol, NEW.id_change_set
		WHERE NOT OLD.symbol <=> NEW.symbol
	UNION
    # Changed ratio_2_GBP
	SELECT NEW.id_currency, 'factor_from_GBP', OLD.factor_from_GBP, NEW.factor_from_GBP, NEW.id_change_set
		WHERE NOT OLD.factor_from_GBP <=> NEW.factor_from_GBP
	UNION
	# Changed active
	SELECT NEW.id_currency, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_currency, 'display_order', CONVERT(display_order, CHAR), CONVERT(display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_currency_audit`
--

DROP TABLE IF EXISTS `shop_currency_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_currency_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_currency` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Currency_Audit_id_currency` (`id_currency`),
  KEY `FK_Shop_Currency_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Currency_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Currency_Audit_id_currency` FOREIGN KEY (`id_currency`) REFERENCES `shop_currency` (`id_currency`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_currency_audit`
--

LOCK TABLES `shop_currency_audit` WRITE;
/*!40000 ALTER TABLE `shop_currency_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_currency_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_delivery_option`
--

DROP TABLE IF EXISTS `shop_delivery_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_delivery_option` (
  `id_option` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `latency_delivery_min` int NOT NULL,
  `latency_delivery_max` int NOT NULL,
  `quantity_min` int NOT NULL,
  `quantity_max` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_option`),
  KEY `FK_Shop_Delivery_Option_Type_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Delivery_Option_Type_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_delivery_option`
--

LOCK TABLES `shop_delivery_option` WRITE;
/*!40000 ALTER TABLE `shop_delivery_option` DISABLE KEYS */;
INSERT INTO `shop_delivery_option` VALUES (1,'COLLECT','Collection',NULL,0,0,0,1,_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'SIGNED_1','First Class Signed-For',NULL,2,4,0,1,_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_delivery_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Delivery_Option` BEFORE INSERT ON `shop_delivery_option` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Delivery_Option` BEFORE UPDATE ON `shop_delivery_option` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Delivery_Option_Audit (
		id_option,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_option, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_option, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed latency_delivery_min
	SELECT NEW.id_option, 'latency_delivery_min', CONVERT(OLD.latency_delivery_min, CHAR), CONVERT(NEW.latency_delivery_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_delivery_min <=> NEW.latency_delivery_min
    UNION
    # Changed latency_delivery_max
	SELECT NEW.id_option, 'latency_delivery_max', CONVERT(OLD.latency_delivery_max, CHAR), CONVERT(NEW.latency_delivery_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_delivery_max <=> NEW.latency_delivery_max
    UNION
    # Changed quantity_min
	SELECT NEW.id_option, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    # Changed quantity_max
	SELECT NEW.id_option, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    # Changed active
	SELECT NEW.id_option, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    # Changed display_order
	SELECT NEW.id_option, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_delivery_option_audit`
--

DROP TABLE IF EXISTS `shop_delivery_option_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_delivery_option_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_option` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Delivery_Option_Audit_id_option` (`id_option`),
  KEY `FK_Shop_Delivery_Option_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Delivery_Option_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Delivery_Option_Audit_id_option` FOREIGN KEY (`id_option`) REFERENCES `shop_delivery_option` (`id_option`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_delivery_option_audit`
--

LOCK TABLES `shop_delivery_option_audit` WRITE;
/*!40000 ALTER TABLE `shop_delivery_option_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_delivery_option_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_discount`
--

DROP TABLE IF EXISTS `shop_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_discount` (
  `id_discount` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `id_product` int NOT NULL,
  `id_permutation` int DEFAULT NULL,
  `multiplier` float NOT NULL DEFAULT '1',
  `subtractor` float NOT NULL DEFAULT '0',
  `apply_multiplier_first` bit(1) DEFAULT b'1',
  `quantity_min` float NOT NULL DEFAULT '0',
  `quantity_max` float NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_discount`),
  KEY `FK_Shop_Discount_id_product` (`id_product`),
  KEY `FK_Shop_Discount_id_permutation` (`id_permutation`),
  KEY `FK_Shop_Discount_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Discount_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Discount_id_permutation` FOREIGN KEY (`id_permutation`) REFERENCES `shop_product_permutation` (`id_permutation`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Discount_id_product` FOREIGN KEY (`id_product`) REFERENCES `shop_product` (`id_product`),
  CONSTRAINT `shop_discount_chk_1` CHECK ((`multiplier` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_discount`
--

LOCK TABLES `shop_discount` WRITE;
/*!40000 ALTER TABLE `shop_discount` DISABLE KEYS */;
INSERT INTO `shop_discount` VALUES (1,'CRIMBO50','Christmas 50% off sale!',1,1,0.5,0,_binary '',3,9,'2024-04-28 19:03:07','2023-12-31 23:59:59',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'CRIMBO50','Christmas 50% off sale!',1,2,0.5,0,_binary '',3,9,'2024-04-28 19:03:07','2023-12-31 23:59:59',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_discount` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Discount` BEFORE INSERT ON `shop_discount` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Discount` BEFORE UPDATE ON `shop_discount` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Discount_Audit (
		id_discount,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_discount, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_discount, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed multiplier
	SELECT NEW.id_discount, 'multiplier', OLD.multiplier, NEW.multiplier, NEW.id_change_set
		WHERE NOT OLD.multiplier <=> NEW.multiplier
    UNION
    # Changed subtractor
	SELECT NEW.id_discount, 'subtractor', OLD.subtractor, NEW.subtractor, NEW.id_change_set
		WHERE NOT OLD.subtractor <=> NEW.subtractor
    UNION
    # Changed apply_multiplier_first
	SELECT NEW.id_discount, 'apply_multiplier_first', CONVERT(CONVERT(OLD.apply_multiplier_first, SIGNED), CHAR), CONVERT(CONVERT(NEW.apply_multiplier_first, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.apply_multiplier_first <=> NEW.apply_multiplier_first
    UNION
    # Changed quantity_min
	SELECT NEW.id_discount, 'quantity_min', OLD.quantity_min, NEW.quantity_min, NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    # Changed quantity_max
	SELECT NEW.id_discount, 'quantity_max', OLD.quantity_max, NEW.quantity_max, NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    # Changed date_start
	SELECT NEW.id_discount, 'date_start', OLD.date_start, NEW.date_start, NEW.id_change_set
		WHERE NOT OLD.date_start <=> NEW.date_start
    UNION
    # Changed date_end
	SELECT NEW.id_discount, 'date_end', OLD.date_end, NEW.date_end, NEW.id_change_set
		WHERE NOT OLD.date_end <=> NEW.date_end
    UNION
    # Changed display_order
	SELECT NEW.id_discount, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
    # Changed active
	SELECT NEW.id_discount, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_discount_audit`
--

DROP TABLE IF EXISTS `shop_discount_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_discount_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_discount` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Discount_Audit_id_discount` (`id_discount`),
  KEY `FK_Shop_Discount_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Discount_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Discount_Audit_id_discount` FOREIGN KEY (`id_discount`) REFERENCES `shop_discount` (`id_discount`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_discount_audit`
--

LOCK TABLES `shop_discount_audit` WRITE;
/*!40000 ALTER TABLE `shop_discount_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_discount_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_discount_region_currency_link`
--

DROP TABLE IF EXISTS `shop_discount_region_currency_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_discount_region_currency_link` (
  `id_link` int NOT NULL AUTO_INCREMENT,
  `id_discount` int NOT NULL,
  `id_region` int NOT NULL,
  `id_currency` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_link`),
  KEY `FK_Shop_Discount_Region_Currency_Link_id_discount` (`id_discount`),
  KEY `FK_Shop_Discount_Region_Currency_Link_id_region` (`id_region`),
  KEY `FK_Shop_Discount_Region_Currency_Link_id_currency` (`id_currency`),
  KEY `FK_Shop_Discount_Region_Currency_Link_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Discount_Region_Currency_Link_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Discount_Region_Currency_Link_id_currency` FOREIGN KEY (`id_currency`) REFERENCES `shop_currency` (`id_currency`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Discount_Region_Currency_Link_id_discount` FOREIGN KEY (`id_discount`) REFERENCES `shop_discount` (`id_discount`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Discount_Region_Currency_Link_id_region` FOREIGN KEY (`id_region`) REFERENCES `shop_region` (`id_region`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_discount_region_currency_link`
--

LOCK TABLES `shop_discount_region_currency_link` WRITE;
/*!40000 ALTER TABLE `shop_discount_region_currency_link` DISABLE KEYS */;
INSERT INTO `shop_discount_region_currency_link` VALUES (1,1,1,1,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(2,2,1,1,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(3,1,1,2,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(4,2,1,2,_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_discount_region_currency_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Discount_Region_Currency_Link` BEFORE INSERT ON `shop_discount_region_currency_link` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Discount_Region_Currency_Link` BEFORE UPDATE ON `shop_discount_region_currency_link` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Discount_Region_Currency_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_discount
	SELECT NEW.id_link, 'id_discount', CONVERT(OLD.id_discount, CHAR), CONVERT(NEW.id_discount, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_discount <=> NEW.id_discount
    UNION
    # Changed id_region
	SELECT NEW.id_link, 'id_region', CONVERT(OLD.id_region, CHAR), CONVERT(NEW.id_region, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
	UNION
	*/
    # Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_discount_region_currency_link_audit`
--

DROP TABLE IF EXISTS `shop_discount_region_currency_link_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_discount_region_currency_link_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_link` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Discount_Region_Currency_Link_Audit_id_link` (`id_link`),
  KEY `FK_Shop_Discount_Region_Currency_Link_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Discount_Region_Currency_Link_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Discount_Region_Currency_Link_Audit_id_link` FOREIGN KEY (`id_link`) REFERENCES `shop_discount_region_currency_link` (`id_link`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_discount_region_currency_link_audit`
--

LOCK TABLES `shop_discount_region_currency_link_audit` WRITE;
/*!40000 ALTER TABLE `shop_discount_region_currency_link_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_discount_region_currency_link_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_general`
--

DROP TABLE IF EXISTS `shop_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_general` (
  `id_general` int NOT NULL AUTO_INCREMENT,
  `quantity_max` float DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_general`),
  KEY `CHK_Shop_General_id_change_set` (`id_change_set`),
  CONSTRAINT `CHK_Shop_General_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_general`
--

LOCK TABLES `shop_general` WRITE;
/*!40000 ALTER TABLE `shop_general` DISABLE KEYS */;
INSERT INTO `shop_general` VALUES (1,10,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_general` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_General` BEFORE INSERT ON `shop_general` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_General` BEFORE UPDATE ON `shop_general` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_General_Audit (
		id_general,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed quantity max
	SELECT NEW.id_general, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_general_audit`
--

DROP TABLE IF EXISTS `shop_general_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_general_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_general` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_General_Audit_id_general` (`id_general`),
  KEY `FK_Shop_General_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_General_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_General_Audit_id_general` FOREIGN KEY (`id_general`) REFERENCES `shop_general` (`id_general`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_general_audit`
--

LOCK TABLES `shop_general_audit` WRITE;
/*!40000 ALTER TABLE `shop_general_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_general_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_image`
--

DROP TABLE IF EXISTS `shop_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_image` (
  `id_image` int NOT NULL AUTO_INCREMENT,
  `id_type_image` int NOT NULL,
  `id_type_file` int NOT NULL,
  `id_product` int DEFAULT NULL,
  `id_permutation` int DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_image`),
  KEY `FK_Shop_Image_id_type_image` (`id_type_image`),
  KEY `FK_Shop_Image_id_type_file` (`id_type_file`),
  KEY `FK_Shop_Image_id_product` (`id_product`),
  KEY `FK_Shop_Image_id_permutation` (`id_permutation`),
  KEY `FK_Shop_Image_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Image_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Image_id_permutation` FOREIGN KEY (`id_permutation`) REFERENCES `shop_product_permutation` (`id_permutation`),
  CONSTRAINT `FK_Shop_Image_id_product` FOREIGN KEY (`id_product`) REFERENCES `shop_product` (`id_product`),
  CONSTRAINT `FK_Shop_Image_id_type_file` FOREIGN KEY (`id_type_file`) REFERENCES `file_type` (`id_type`),
  CONSTRAINT `FK_Shop_Image_id_type_image` FOREIGN KEY (`id_type_image`) REFERENCES `shop_image_type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_image`
--

LOCK TABLES `shop_image` WRITE;
/*!40000 ALTER TABLE `shop_image` DISABLE KEYS */;
INSERT INTO `shop_image` VALUES (1,1,1,1,1,'/static/images/prod_PB0NUOSEs06ymG.jpg',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,1,1,1,2,'/static/images/prod_PB0NUOSEs06ymG.jpg',_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL),(3,1,1,2,3,'/static/images/prod_PB0NUOSEs06ymG.jpg',_binary '',3,'2024-04-28 19:03:07','root@localhost',NULL),(4,1,1,3,4,'/static/images/prod_.jpg',_binary '',4,'2024-04-28 19:03:07','root@localhost',NULL),(5,1,1,4,5,'/static/images/prod_1.jpg',_binary '',5,'2024-04-28 19:03:07','root@localhost',NULL),(6,1,1,5,6,'/static/images/prod_2.jpg',_binary '',6,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_image` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Image` BEFORE INSERT ON `shop_image` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Image` BEFORE UPDATE ON `shop_image` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change set ID must be provided.';
    END IF;
    IF ISNULL(NEW.id_product) AND ISNULL(NEW.id_permutation) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Image must NOT have ID for product AND product permutation.';
    END IF;
    
    INSERT INTO Shop_Image_Audit (
		id_image,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_type_image
	SELECT NEW.id_image, 'id_type_image', CONVERT(OLD.id_type_image, CHAR), CONVERT(NEW.id_type_image, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_type_image <=> NEW.id_type_image
    UNION
    # Changed id_type_file
	SELECT NEW.id_image, 'id_type_file', CONVERT(OLD.id_type_file, CHAR), CONVERT(NEW.id_type_file, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_type_file <=> NEW.id_type_file
    UNION
    # Changed id_product
	SELECT NEW.id_image, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
    # Changed id_permutation
	SELECT NEW.id_image, 'id_permutation', CONVERT(OLD.id_permutation, CHAR), CONVERT(NEW.id_permutation, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
    # Changed url
	SELECT NEW.id_image, 'url', OLD.url, NEW.url, NEW.id_change_set
		WHERE NOT OLD.url <=> NEW.url
	UNION
	# Changed active
	SELECT NEW.id_image, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_image, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_image_audit`
--

DROP TABLE IF EXISTS `shop_image_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_image_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_image` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Image_Audit_id_image` (`id_image`),
  KEY `FK_Shop_Image_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Image_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Image_Audit_id_image` FOREIGN KEY (`id_image`) REFERENCES `shop_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_image_audit`
--

LOCK TABLES `shop_image_audit` WRITE;
/*!40000 ALTER TABLE `shop_image_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_image_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_image_type`
--

DROP TABLE IF EXISTS `shop_image_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_image_type` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_plural` varchar(256) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_type`),
  KEY `FK_Shop_Image_Type_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Image_Type_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_image_type`
--

LOCK TABLES `shop_image_type` WRITE;
/*!40000 ALTER TABLE `shop_image_type` DISABLE KEYS */;
INSERT INTO `shop_image_type` VALUES (1,'FULL','Full Quality Image','Full Quality Images',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'LOW','Low Quality Image','Low Quality Images',_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL),(3,'THUMBNAIL','Thumbnail Image','Thumbnail Images',_binary '',3,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_image_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Image_Type` BEFORE INSERT ON `shop_image_type` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Image_Type` BEFORE UPDATE ON `shop_image_type` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Image_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_type, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	# Changed active
	SELECT NEW.id_type, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_type, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_image_type_audit`
--

DROP TABLE IF EXISTS `shop_image_type_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_image_type_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_type` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Image_Type_Audit_id_type` (`id_type`),
  KEY `FK_Shop_Image_Type_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Image_Type_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Image_Type_Audit_id_type` FOREIGN KEY (`id_type`) REFERENCES `shop_image_type` (`id_type`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_image_type_audit`
--

LOCK TABLES `shop_image_type_audit` WRITE;
/*!40000 ALTER TABLE `shop_image_type_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_image_type_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_msg_error_type`
--

DROP TABLE IF EXISTS `shop_msg_error_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_msg_error_type` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_msg_error_type`
--

LOCK TABLES `shop_msg_error_type` WRITE;
/*!40000 ALTER TABLE `shop_msg_error_type` DISABLE KEYS */;
INSERT INTO `shop_msg_error_type` VALUES (1,'BAD_DATA','Invalid data','Rubbish data'),(2,'NO_PERMISSION','No permission','Not authorised'),(3,'PRODUCT_AVAILABILITY','Product not available','Product not available');
/*!40000 ALTER TABLE `shop_msg_error_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_permission`
--

DROP TABLE IF EXISTS `shop_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_permission` (
  `id_permission` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_permission_group` int NOT NULL,
  `id_access_level_required` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_permission`),
  KEY `FK_Shop_Permission_id_permission_group` (`id_permission_group`),
  KEY `FK_Shop_Permission_id_access_level_required` (`id_access_level_required`),
  KEY `FK_Shop_Permission_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Permission_id_access_level_required` FOREIGN KEY (`id_access_level_required`) REFERENCES `shop_access_level` (`id_access_level`),
  CONSTRAINT `FK_Shop_Permission_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Permission_id_permission_group` FOREIGN KEY (`id_permission_group`) REFERENCES `shop_permission_group` (`id_group`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_permission`
--

LOCK TABLES `shop_permission` WRITE;
/*!40000 ALTER TABLE `shop_permission` DISABLE KEYS */;
INSERT INTO `shop_permission` VALUES (1,'HOME','Home Page',2,1,_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'STORE_PRODUCT','Store Product Page',3,1,_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL),(3,'STORE_USER','Store User Account Page',4,2,_binary '',3,'2024-04-28 19:03:07','root@localhost',NULL),(4,'STORE_ADMIN','Store Admin Page',1,3,_binary '',4,'2024-04-28 19:03:07','root@localhost',NULL),(5,'CONTACT_US','Contact Us Page',2,1,_binary '',99,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Permission` BEFORE INSERT ON `shop_permission` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Permission` BEFORE UPDATE ON `shop_permission` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Permission_Audit (
		id_permission,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_permission, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_permission, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed id_permission_group
	SELECT NEW.id_permission, 'id_permission_group', CONVERT(OLD.id_permission_group, CHAR), CONVERT(NEW.id_permission_group, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permission_group <=> NEW.id_permission_group
	UNION
	# Changed Id_access_level_required
	SELECT NEW.id_permission, 'Id_access_level_required', CONVERT(OLD.Id_access_level_required, CHAR), CONVERT(NEW.Id_access_level_required, CHAR), NEW.id_change_set
		WHERE NOT OLD.Id_access_level_required <=> NEW.Id_access_level_required
	UNION
	# Changed active
	SELECT NEW.id_permission, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    # Changed display_order
	SELECT NEW.id_permission, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_permission_audit`
--

DROP TABLE IF EXISTS `shop_permission_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_permission_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_permission` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Permission_Audit_id_permission` (`id_permission`),
  KEY `FK_Shop_Permission_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Permission_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Permission_Audit_id_permission` FOREIGN KEY (`id_permission`) REFERENCES `shop_permission` (`id_permission`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_permission_audit`
--

LOCK TABLES `shop_permission_audit` WRITE;
/*!40000 ALTER TABLE `shop_permission_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_permission_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_permission_group`
--

DROP TABLE IF EXISTS `shop_permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_permission_group` (
  `id_group` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_group`),
  KEY `FK_Shop_Permission_Group_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Permission_Group_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_permission_group`
--

LOCK TABLES `shop_permission_group` WRITE;
/*!40000 ALTER TABLE `shop_permission_group` DISABLE KEYS */;
INSERT INTO `shop_permission_group` VALUES (1,'ADMIN','Website Admin',_binary '',0,'2024-04-28 19:03:07','root@localhost',NULL),(2,'HOME','Home, Contact Us, and other public information',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(3,'PRODUCT','Store Products',_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL),(4,'USER','Store User',_binary '',3,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_permission_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Permission_Group` BEFORE INSERT ON `shop_permission_group` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Permission_Group` BEFORE UPDATE ON `shop_permission_group` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Permission_Group_Audit (
		id_group,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_group, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_group, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed active
	SELECT NEW.id_group, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    # Changed display_order
	SELECT NEW.id_group, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_permission_group_audit`
--

DROP TABLE IF EXISTS `shop_permission_group_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_permission_group_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_group` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Permission_Group_Audit_id_group` (`id_group`),
  KEY `FK_Shop_Permission_Group_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Permission_Group_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Permission_Group_Audit_id_group` FOREIGN KEY (`id_group`) REFERENCES `shop_permission_group` (`id_group`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_permission_group_audit`
--

LOCK TABLES `shop_permission_group_audit` WRITE;
/*!40000 ALTER TABLE `shop_permission_group_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_permission_group_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_category` int NOT NULL,
  `has_variations` bit(1) NOT NULL,
  `id_access_level_required` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `FK_Shop_Product_id_access_level_required` (`id_access_level_required`),
  KEY `FK_Shop_Product_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_id_access_level_required` FOREIGN KEY (`id_access_level_required`) REFERENCES `shop_access_level` (`id_access_level`),
  CONSTRAINT `FK_Shop_Product_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,'Braille Keyboard Translator',1,_binary '',3,_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'Test product 1',2,_binary '\0',3,_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL),(3,'Phone',3,_binary '\0',1,_binary '',3,'2024-04-28 19:03:07','root@localhost',NULL),(4,'Laptop',3,_binary '\0',1,_binary '',4,'2024-04-28 19:03:07','root@localhost',NULL),(5,'Smart Watch',3,_binary '\0',1,_binary '',5,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Product` BEFORE INSERT ON `shop_product` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Product` BEFORE UPDATE ON `shop_product` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
	/*
    IF NOT NEW.has_variations THEN
		IF ISNULL(NEW.price_GBP_full) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have price or variations (with prices).';
		END IF;
		IF ISNULL(NEW.price_GBP_min) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have minimum price or variations (with prices).';
		END IF;
		IF ISNULL(NEW.latency_manuf) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have manufacturing latency or variations (with manufacturing latencies).';
		END IF;
		IF ISNULL(NEW.quantity_min) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have minimum quantity or variations (with minimum quantities).';
		END IF;
		IF ISNULL(NEW.quantity_max) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have maximum quantity or variations (with maximum quantities).';
		END IF;
		IF ISNULL(NEW.quantity_step) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have increment of quantity or variations (with increments of quantities).';
		END IF;
		IF ISNULL(NEW.quantity_stock) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have stock quantity or variations (with stock quantities).';
		END IF;
		IF ISNULL(NEW.is_subscription) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have subscription status or variations (with subscription statuses).';
		END IF;
		IF ISNULL(NEW.id_unit_measurement_interval_recurrence) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have recurrence interval or variations (with recurrence intervals).';
		END IF;
		IF ISNULL(NEW.count_interval_recurrence) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have recurrence interval count or variations (with recurrence interval counts).';
		END IF;
    END IF;
    */
    
    INSERT INTO Shop_Product_Audit (
		id_product,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed name
	SELECT NEW.id_product, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    /*
    UNION
    # Changed description
	SELECT NEW.id_product, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT OLD.description <=> NEW.description
    UNION
    # Changed price_GBP_full
	SELECT NEW.id_product, 'price_GBP_full', CONVERT(OLD.price_GBP_full, CHAR), CONVERT(NEW.price_GBP_full, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_GBP_full <=> NEW.price_GBP_full
	UNION
    # Changed price_GBP_min
	SELECT NEW.id_product, 'price_GBP_min', CONVERT(OLD.price_GBP_min, CHAR), CONVERT(NEW.price_GBP_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_GBP_min <=> NEW.price_GBP_min
	UNION
    # Changed has_variations
	SELECT NEW.id_product, 'has_variations', CONVERT(CONVERT(NEW.has_variations, SIGNED), CHAR), CONVERT(CONVERT(NEW.has_variations, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.has_variations <=> NEW.has_variations
	UNION
    /*
    # Changed discount
	SELECT NEW.id_product, 'discount', CONVERT(OLD.discount, CHAR), CONVERT(NEW.discount, CHAR), NEW.id_change_set
		WHERE NOT OLD.discount <=> NEW.discount
    */
	UNION
    # Changed id_category
	SELECT NEW.id_product, 'id_category', CONVERT(OLD.id_category, CHAR), CONVERT(NEW.id_category, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_category <=> NEW.id_category
	/*
    UNION
    # Changed latency_manuf
	SELECT NEW.id_product, 'latency_manuf', CONVERT(OLD.latency_manuf, CHAR), CONVERT(NEW.latency_manuf, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manuf <=> NEW.latency_manuf
	UNION
    # Changed quantity_min
	SELECT NEW.id_product, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    # Changed quantity_max
	SELECT NEW.id_product, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	UNION
    # Changed quantity_step
	SELECT NEW.id_product, 'quantity_step', CONVERT(OLD.quantity_step, CHAR), CONVERT(NEW.quantity_step, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_step <=> NEW.quantity_step
	UNION
    # Changed quantity_stock
	SELECT NEW.id_product, 'quantity_stock', CONVERT(OLD.quantity_stock, CHAR), CONVERT(NEW.quantity_stock, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_stock <=> NEW.quantity_stock
    UNION
    # Changed is_subscription
	SELECT NEW.id_product, 'is_subscription', CONVERT(CONVERT(OLD.is_subscription, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_subscription, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.is_subscription <=> NEW.is_subscription
	UNION
    # Changed id_unit_measurement_interval_recurrence
	SELECT NEW.id_product, 'id_unit_measurement_interval_recurrence', CONVERT(OLD.id_unit_measurement_interval_recurrence, CHAR), CONVERT(NEW.id_unit_measurement_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement_interval_recurrence <=> NEW.id_unit_measurement_interval_recurrence
    UNION
    # Changed count_interval_recurrence
	SELECT NEW.id_product, 'count_interval_recurrence', CONVERT(OLD.count_interval_recurrence, CHAR), CONVERT(NEW.count_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_interval_recurrence <=> NEW.count_interval_recurrence
	UNION
    # Changed id_access_level_required
	SELECT NEW.id_product, 'id_access_level_required', CONVERT(OLD.id_access_level_required, CHAR), CONVERT(NEW.id_access_level_required, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_access_level_required <=> NEW.id_access_level_required
	UNION
    # Changed id_stripe_product
	SELECT NEW.id_product, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT OLD.id_stripe_product <=> NEW.id_stripe_product
    /*
    UNION
    # Changed id_stripe_price
	SELECT NEW.id_product, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
	*/
    UNION
	# Changed active
	SELECT NEW.id_product, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_product, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_product_audit`
--

DROP TABLE IF EXISTS `shop_product_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Product_Audit_id_product` (`id_product`),
  KEY `FK_Shop_Product_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Audit_id_product` FOREIGN KEY (`id_product`) REFERENCES `shop_product` (`id_product`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_audit`
--

LOCK TABLES `shop_product_audit` WRITE;
/*!40000 ALTER TABLE `shop_product_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_change_set`
--

DROP TABLE IF EXISTS `shop_product_change_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_change_set` (
  `id_change_set` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) DEFAULT NULL,
  `updated_last_on` datetime DEFAULT NULL,
  `updated_last_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_change_set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_change_set`
--

LOCK TABLES `shop_product_change_set` WRITE;
/*!40000 ALTER TABLE `shop_product_change_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_change_set` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Product_Change_Set` BEFORE INSERT ON `shop_product_change_set` FOR EACH ROW BEGIN
	IF NEW.updated_last_on <=> NULL THEN
		SET NEW.updated_last_on = NOW();
	END IF;
	IF NEW.updated_last_by <=> NULL THEN
		SET NEW.updated_last_by = CURRENT_USER();
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_product_currency_link`
--

DROP TABLE IF EXISTS `shop_product_currency_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_currency_link` (
  `id_link` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `id_permutation` int DEFAULT NULL,
  `id_currency` int NOT NULL,
  `id_region_purchase` int NOT NULL,
  `price_local_VAT_incl` float DEFAULT NULL,
  `price_local_VAT_excl` float DEFAULT NULL,
  `id_stripe_price` varchar(200) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_link`),
  KEY `FK_Shop_Product_Currency_Link_id_product` (`id_product`),
  KEY `FK_Shop_Product_Currency_Link_id_permutation` (`id_permutation`),
  KEY `FK_Shop_Product_Currency_Link_id_currency` (`id_currency`),
  KEY `FK_Shop_Product_Currency_Link_id_region_purchase` (`id_region_purchase`),
  KEY `FK_Shop_Product_Currency_Link_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Currency_Link_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Currency_Link_id_currency` FOREIGN KEY (`id_currency`) REFERENCES `shop_currency` (`id_currency`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Currency_Link_id_permutation` FOREIGN KEY (`id_permutation`) REFERENCES `shop_product_permutation` (`id_permutation`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Currency_Link_id_product` FOREIGN KEY (`id_product`) REFERENCES `shop_product` (`id_product`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Currency_Link_id_region_purchase` FOREIGN KEY (`id_region_purchase`) REFERENCES `shop_region` (`id_region`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_currency_link`
--

LOCK TABLES `shop_product_currency_link` WRITE;
/*!40000 ALTER TABLE `shop_product_currency_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_currency_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Product_Currency_Link` BEFORE INSERT ON `shop_product_currency_link` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
    /*
    SET NEW.price_local = (
		SELECT PP.price_GBP_full * C.factor_from_GBP
        FROM Shop_Product_Permutation PP
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Currency C ON NEW.id_currency = C.id_currency
        WHERE NEW.id_product = P.id_product
        LIMIT 1
	);
    */
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Product_Currency_Link` BEFORE UPDATE ON `shop_product_currency_link` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    /*
    SET NEW.price_local = (
		SELECT P.price_GBP_full * C.factor_from_GBP
        FROM Shop_Product P
		INNER JOIN Shop_Currency C ON NEW.id_currency = C.id_currency
        WHERE NEW.id_product = P.id_product
        LIMIT 1
	);
    */
    
    INSERT INTO Shop_Product_Currency_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_link, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
	# Changed id_currency
	SELECT NEW.id_link, 'id_currency', CONVERT(OLD.id_currency, CHAR), CONVERT(NEW.id_currency, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	# Changed price_local
	SELECT NEW.id_link, 'price_local', OLD.price_local, NEW.price_local, NEW.id_change_set
		WHERE NOT OLD.price_local <=> NEW.price_local
    UNION
    */ 
	# Changed price_local_VAT_incl
	SELECT NEW.id_link, 'price_local_VAT_incl', OLD.price_local_VAT_incl, NEW.price_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_incl <=> NEW.price_local_VAT_incl
    UNION
	# Changed price_local_VAT_excl
	SELECT NEW.id_link, 'price_local_VAT_excl', OLD.price_local_VAT_excl, NEW.price_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_excl <=> NEW.price_local_VAT_excl
    UNION
	# Changed id_stripe_price
	SELECT NEW.id_link, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_product_currency_link_audit`
--

DROP TABLE IF EXISTS `shop_product_currency_link_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_currency_link_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_link` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Product_Currency_Link_Audit_id_link` (`id_link`),
  KEY `FK_Shop_Product_Currency_Link_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Currency_Link_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Currency_Link_Audit_id_link` FOREIGN KEY (`id_link`) REFERENCES `shop_product_currency_link` (`id_link`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_currency_link_audit`
--

LOCK TABLES `shop_product_currency_link_audit` WRITE;
/*!40000 ALTER TABLE `shop_product_currency_link_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_currency_link_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_currency_region_link`
--

DROP TABLE IF EXISTS `shop_product_currency_region_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_currency_region_link` (
  `id_link` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `id_permutation` int DEFAULT NULL,
  `id_currency` int NOT NULL,
  `id_region_purchase` int NOT NULL,
  `price_local_VAT_incl` float DEFAULT NULL,
  `price_local_VAT_excl` float DEFAULT NULL,
  `id_stripe_price` varchar(200) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_link`),
  KEY `FK_Shop_Product_Currency_Region_Link_id_product` (`id_product`),
  KEY `FK_Shop_Product_Currency_Region_Link_id_permutation` (`id_permutation`),
  KEY `FK_Shop_Product_Currency_Region_Link_id_currency` (`id_currency`),
  KEY `FK_Shop_Product_Currency_Region_Link_id_region_purchase` (`id_region_purchase`),
  KEY `FK_Shop_Product_Currency_Region_Link_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Currency_Region_Link_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Currency_Region_Link_id_currency` FOREIGN KEY (`id_currency`) REFERENCES `shop_currency` (`id_currency`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Currency_Region_Link_id_permutation` FOREIGN KEY (`id_permutation`) REFERENCES `shop_product_permutation` (`id_permutation`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Currency_Region_Link_id_product` FOREIGN KEY (`id_product`) REFERENCES `shop_product` (`id_product`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Currency_Region_Link_id_region_purchase` FOREIGN KEY (`id_region_purchase`) REFERENCES `shop_region` (`id_region`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_currency_region_link`
--

LOCK TABLES `shop_product_currency_region_link` WRITE;
/*!40000 ALTER TABLE `shop_product_currency_region_link` DISABLE KEYS */;
INSERT INTO `shop_product_currency_region_link` VALUES (1,1,1,1,1,24,20,NULL,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(2,1,1,2,1,48,40,NULL,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(3,1,2,1,1,96,80,NULL,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(4,2,3,1,1,144,120,NULL,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(5,3,4,1,1,600,500,NULL,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(6,4,5,1,1,1500,1200,NULL,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(7,5,6,1,1,180,150,NULL,_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_product_currency_region_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Product_Currency_Region_Link` BEFORE INSERT ON `shop_product_currency_region_link` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
    /*
    SET NEW.price_local = (
		SELECT PP.price_GBP_full * C.factor_from_GBP
        FROM Shop_Product_Permutation PP
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Currency C ON NEW.id_currency = C.id_currency
        WHERE NEW.id_product = P.id_product
        LIMIT 1
	);
    */
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Product_Currency_Region_Link` BEFORE UPDATE ON `shop_product_currency_region_link` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    /*
    SET NEW.price_local = (
		SELECT P.price_GBP_full * C.factor_from_GBP
        FROM Shop_Product P
		INNER JOIN Shop_Currency C ON NEW.id_currency = C.id_currency
        WHERE NEW.id_product = P.id_product
        LIMIT 1
	);
    */
    
    INSERT INTO Shop_Product_Currency_Region_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_link, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
	# Changed id_currency
	SELECT NEW.id_link, 'id_currency', CONVERT(OLD.id_currency, CHAR), CONVERT(NEW.id_currency, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	# Changed price_local
	SELECT NEW.id_link, 'price_local', OLD.price_local, NEW.price_local, NEW.id_change_set
		WHERE NOT OLD.price_local <=> NEW.price_local
    UNION
    */ 
	# Changed price_local_VAT_incl
	SELECT NEW.id_link, 'price_local_VAT_incl', OLD.price_local_VAT_incl, NEW.price_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_incl <=> NEW.price_local_VAT_incl
    UNION
	# Changed price_local_VAT_excl
	SELECT NEW.id_link, 'price_local_VAT_excl', OLD.price_local_VAT_excl, NEW.price_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_excl <=> NEW.price_local_VAT_excl
    UNION
	# Changed id_stripe_price
	SELECT NEW.id_link, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_product_currency_region_link_audit`
--

DROP TABLE IF EXISTS `shop_product_currency_region_link_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_currency_region_link_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_link` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Product_Currency_Region_Link_Audit_id_link` (`id_link`),
  KEY `FK_Shop_Product_Currency_Region_Link_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Currency_Region_Link_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Currency_Region_Link_Audit_id_link` FOREIGN KEY (`id_link`) REFERENCES `shop_product_currency_region_link` (`id_link`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_currency_region_link_audit`
--

LOCK TABLES `shop_product_currency_region_link_audit` WRITE;
/*!40000 ALTER TABLE `shop_product_currency_region_link_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_currency_region_link_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_delivery_option_link`
--

DROP TABLE IF EXISTS `shop_product_delivery_option_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_delivery_option_link` (
  `id_link` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `id_permutation` int DEFAULT NULL,
  `id_delivery_option` int NOT NULL,
  `id_region` int NOT NULL,
  `id_currency` int NOT NULL,
  `price_local` float NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_link`),
  KEY `FK_Shop_Product_Delivery_Option_Link_id_product` (`id_product`),
  KEY `FK_Shop_Product_Delivery_Option_Link_id_permutation` (`id_permutation`),
  KEY `FK_Shop_Product_Delivery_Option_Link_id_delivery_option` (`id_delivery_option`),
  KEY `FK_Shop_Product_Delivery_Option_Link_id_region` (`id_region`),
  KEY `FK_Shop_Product_Delivery_Option_Link_id_currency` (`id_currency`),
  KEY `FK_Shop_Product_Delivery_Option_Link_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Delivery_Option_Link_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Delivery_Option_Link_id_currency` FOREIGN KEY (`id_currency`) REFERENCES `shop_currency` (`id_currency`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Delivery_Option_Link_id_delivery_option` FOREIGN KEY (`id_delivery_option`) REFERENCES `shop_delivery_option` (`id_option`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Delivery_Option_Link_id_permutation` FOREIGN KEY (`id_permutation`) REFERENCES `shop_product_permutation` (`id_permutation`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Delivery_Option_Link_id_product` FOREIGN KEY (`id_product`) REFERENCES `shop_product` (`id_product`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Delivery_Option_Link_id_region` FOREIGN KEY (`id_region`) REFERENCES `shop_region` (`id_region`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_delivery_option_link`
--

LOCK TABLES `shop_product_delivery_option_link` WRITE;
/*!40000 ALTER TABLE `shop_product_delivery_option_link` DISABLE KEYS */;
INSERT INTO `shop_product_delivery_option_link` VALUES (1,1,1,1,1,1,5,_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,1,2,1,1,1,9,_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL),(3,2,NULL,1,1,1,10,_binary '',3,'2024-04-28 19:03:07','root@localhost',NULL),(4,3,4,1,1,1,10,_binary '',4,'2024-04-28 19:03:07','root@localhost',NULL),(5,4,5,1,1,1,10,_binary '',5,'2024-04-28 19:03:07','root@localhost',NULL),(6,5,6,1,1,1,10,_binary '',6,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_product_delivery_option_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Product_Delivery_Option_Link` BEFORE INSERT ON `shop_product_delivery_option_link` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Product_Delivery_Option_Link` BEFORE UPDATE ON `shop_product_delivery_option_link` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Delivery_Option_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_link, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
    # Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', CONVERT(OLD.id_permutation, CHAR), CONVERT(NEW.id_permutation, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
    # Changed id_option
	SELECT NEW.id_link, 'id_option', CONVERT(OLD.id_option, CHAR), CONVERT(NEW.id_option, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_option <=> NEW.id_option
	UNION
    # Changed id_region
	SELECT NEW.id_link, 'id_region', CONVERT(OLD.id_region, CHAR), CONVERT(NEW.id_region, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
	UNION
    */
    # Changed price_local
	SELECT NEW.id_link, 'price_local', CONVERT(OLD.price_local, CHAR), CONVERT(NEW.price_local, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_local <=> NEW.price_local
	UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_product_delivery_option_link_audit`
--

DROP TABLE IF EXISTS `shop_product_delivery_option_link_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_delivery_option_link_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_link` int NOT NULL,
  `name_field` varchar(64) NOT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Product_Delivery_Option_Link_Audit_id_link` (`id_link`),
  KEY `FK_Shop_Product_Delivery_Option_Link_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Delivery_Option_Link_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Delivery_Option_Link_Audit_id_link` FOREIGN KEY (`id_link`) REFERENCES `shop_product_delivery_option_link` (`id_link`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_delivery_option_link_audit`
--

LOCK TABLES `shop_product_delivery_option_link_audit` WRITE;
/*!40000 ALTER TABLE `shop_product_delivery_option_link_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_delivery_option_link_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_permutation`
--

DROP TABLE IF EXISTS `shop_product_permutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_permutation` (
  `id_permutation` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `description` varchar(4000) NOT NULL,
  `cost_local_manufacturing` float NOT NULL,
  `id_currency_cost_manufacturing` int NOT NULL,
  `profit_local_min` float NOT NULL,
  `id_currency_profit_min` int NOT NULL,
  `latency_manufacture_days` int NOT NULL,
  `quantity_min` float NOT NULL,
  `quantity_max` float NOT NULL,
  `quantity_step` float NOT NULL,
  `quantity_stock` float NOT NULL,
  `is_subscription` bit(1) NOT NULL,
  `id_unit_measurement_interval_recurrence` int DEFAULT NULL,
  `count_interval_recurrence` int DEFAULT NULL,
  `id_access_level_required` int NOT NULL,
  `id_stripe_product` varchar(100) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_permutation`),
  KEY `FK_Shop_Product_Variation_Link_id_product` (`id_product`),
  KEY `FK_Shop_Product_Permutation_id_unit_measurement_interval_recurrence` (`id_unit_measurement_interval_recurrence`),
  KEY `FK_Shop_Product_Permutation_id_access_level_required` (`id_access_level_required`),
  KEY `FK_Shop_Product_Variation_Link_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Permutation_id_access_level_required` FOREIGN KEY (`id_access_level_required`) REFERENCES `shop_access_level` (`id_access_level`),
  CONSTRAINT `FK_Shop_Product_Permutation_id_unit_measurement_interval_recurrence` FOREIGN KEY (`id_unit_measurement_interval_recurrence`) REFERENCES `shop_interval_recurrence` (`id_interval`),
  CONSTRAINT `FK_Shop_Product_Variation_Link_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Variation_Link_id_product` FOREIGN KEY (`id_product`) REFERENCES `shop_product` (`id_product`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_permutation`
--

LOCK TABLES `shop_product_permutation` WRITE;
/*!40000 ALTER TABLE `shop_product_permutation` DISABLE KEYS */;
INSERT INTO `shop_product_permutation` VALUES (1,1,'Good Red',5,1,3,1,14,1,3,1,99,_binary '\0',NULL,NULL,1,NULL,_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,1,'Good Blue',6,1,4,1,14,1,3,1,99,_binary '\0',NULL,NULL,1,NULL,_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL),(3,2,'Test product describes good',10,1,5,1,14,1,2,1,99,_binary '\0',NULL,NULL,1,NULL,_binary '',3,'2024-04-28 19:03:07','root@localhost',NULL),(4,3,'Phone describes good',10,1,5,1,14,1,2,1,99,_binary '\0',NULL,NULL,1,NULL,_binary '',4,'2024-04-28 19:03:07','root@localhost',NULL),(5,4,'Laptop describes good',10,1,5,1,14,1,2,1,99,_binary '\0',NULL,NULL,1,NULL,_binary '',5,'2024-04-28 19:03:07','root@localhost',NULL),(6,5,'Smart watch describes good',10,1,5,1,14,1,2,1,99,_binary '\0',NULL,NULL,1,NULL,_binary '',6,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_product_permutation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Product_Permutation` BEFORE INSERT ON `shop_product_permutation` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Product_Permutation` BEFORE UPDATE ON `shop_product_permutation` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Permutation_Audit (
		id_permutation,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_permutation, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    # Changed id_variation
	SELECT NEW.id_permutation, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	# Changed name
	SELECT NEW.id_permutation, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
	UNION
	*/
	# Changed description
	SELECT NEW.id_permutation, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT (OLD.description <=> NEW.description)
	UNION
	# Changed cost_local_manufacturing
	SELECT NEW.id_permutation, 'cost_local_manufacturing', CONVERT(OLD.cost_local_manufacturing, CHAR), CONVERT(NEW.cost_local_manufacturing, CHAR), NEW.id_change_set
		WHERE NOT (OLD.cost_local_manufacturing <=> NEW.cost_local_manufacturing)
	UNION
	# Changed id_currency_cost_manufacturing
	SELECT NEW.id_permutation, 'id_currency_cost_manufacturing', CONVERT(OLD.id_currency_cost_manufacturing, CHAR), CONVERT(NEW.id_currency_cost_manufacturing, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_cost_manufacturing <=> NEW.id_currency_cost_manufacturing)
	UNION
	# Changed profit_local_min
	SELECT NEW.id_permutation, 'profit_local_min', CONVERT(OLD.profit_local_min, CHAR), CONVERT(NEW.profit_local_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.profit_local_min <=> NEW.profit_local_min)
	UNION
	# Changed id_currency_profit_min
	SELECT NEW.id_permutation, 'id_currency_profit_min', CONVERT(OLD.id_currency_profit_min, CHAR), CONVERT(NEW.id_currency_profit_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_profit_min <=> NEW.id_currency_profit_min)
	UNION
    /*
	# Changed price_GBP_min
	SELECT NEW.id_permutation, 'price_GBP_min', CONVERT(OLD.price_GBP_min, CHAR), CONVERT(NEW.price_GBP_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.price_GBP_min <=> NEW.price_GBP_min)
	UNION
    */
    # Changed latency_manufacture_days
	SELECT NEW.id_product, 'latency_manufacture_days', CONVERT(OLD.latency_manufacture_days, CHAR), CONVERT(NEW.latency_manufacture_days, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manufacture_days <=> NEW.latency_manufacture_days
	UNION
    # Changed quantity_min
	SELECT NEW.id_product, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    # Changed quantity_max
	SELECT NEW.id_product, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	UNION
    # Changed quantity_step
	SELECT NEW.id_product, 'quantity_step', CONVERT(OLD.quantity_step, CHAR), CONVERT(NEW.quantity_step, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_step <=> NEW.quantity_step
	UNION
    # Changed quantity_stock
	SELECT NEW.id_product, 'quantity_stock', CONVERT(OLD.quantity_stock, CHAR), CONVERT(NEW.quantity_stock, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_stock <=> NEW.quantity_stock
    UNION
    # Changed is_subscription
	SELECT NEW.id_product, 'is_subscription', CONVERT(CONVERT(OLD.is_subscription, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_subscription, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.is_subscription <=> NEW.is_subscription
	UNION
    # Changed id_unit_measurement_interval_recurrence
	SELECT NEW.id_product, 'id_unit_measurement_interval_recurrence', CONVERT(OLD.id_unit_measurement_interval_recurrence, CHAR), CONVERT(NEW.id_unit_measurement_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement_interval_recurrence <=> NEW.id_unit_measurement_interval_recurrence
    UNION
    # Changed count_interval_recurrence
	SELECT NEW.id_product, 'count_interval_recurrence', CONVERT(OLD.count_interval_recurrence, CHAR), CONVERT(NEW.count_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_interval_recurrence <=> NEW.count_interval_recurrence
	UNION
    # Changed id_stripe_product
	SELECT NEW.id_permutation, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT (OLD.id_stripe_product <=> NEW.id_stripe_product)
	UNION
    # Changed active
	SELECT NEW.id_permutation, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_permutation, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_product_permutation_audit`
--

DROP TABLE IF EXISTS `shop_product_permutation_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_permutation_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_permutation` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Product_Permutation_Audit_id_permutation` (`id_permutation`),
  KEY `FK_Shop_Product_Permutation_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Permutation_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Permutation_Audit_id_permutation` FOREIGN KEY (`id_permutation`) REFERENCES `shop_product_permutation` (`id_permutation`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_permutation_audit`
--

LOCK TABLES `shop_product_permutation_audit` WRITE;
/*!40000 ALTER TABLE `shop_product_permutation_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_permutation_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_permutation_variation_link`
--

DROP TABLE IF EXISTS `shop_product_permutation_variation_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_permutation_variation_link` (
  `id_link` int NOT NULL AUTO_INCREMENT,
  `id_permutation` int NOT NULL,
  `id_variation` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_link`),
  KEY `FK_Shop_Product_Permutation_Variation_Link_id_permutation` (`id_permutation`),
  KEY `FK_Shop_Product_Permutation_Variation_Link_id_variation` (`id_variation`),
  KEY `FK_Shop_Product_Permutation_Variation_Link_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Permutation_Variation_Link_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Permutation_Variation_Link_id_permutation` FOREIGN KEY (`id_permutation`) REFERENCES `shop_product_permutation` (`id_permutation`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Permutation_Variation_Link_id_variation` FOREIGN KEY (`id_variation`) REFERENCES `shop_variation` (`id_variation`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_permutation_variation_link`
--

LOCK TABLES `shop_product_permutation_variation_link` WRITE;
/*!40000 ALTER TABLE `shop_product_permutation_variation_link` DISABLE KEYS */;
INSERT INTO `shop_product_permutation_variation_link` VALUES (1,1,1,_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,2,2,_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_product_permutation_variation_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Product_Permutation_Variation_Link` BEFORE INSERT ON `shop_product_permutation_variation_link` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Product_Permutation_Variation_Link` BEFORE UPDATE ON `shop_product_permutation_variation_link` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Permutation_Variation_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_link, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    # Changed id_variation
	SELECT NEW.id_link, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	*/
    # Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_product_permutation_variation_link_audit`
--

DROP TABLE IF EXISTS `shop_product_permutation_variation_link_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_permutation_variation_link_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_link` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Product_Permutation_Variation_Link_Audit_id_link` (`id_link`),
  KEY `FK_Shop_Product_Permutation_Variation_Link_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Product_Permutation_Variation_Link_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Product_Permutation_Variation_Link_Audit_id_link` FOREIGN KEY (`id_link`) REFERENCES `shop_product_permutation_variation_link` (`id_link`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_permutation_variation_link_audit`
--

LOCK TABLES `shop_product_permutation_variation_link_audit` WRITE;
/*!40000 ALTER TABLE `shop_product_permutation_variation_link_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_permutation_variation_link_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_interval_recurrence`
--

DROP TABLE IF EXISTS `shop_interval_recurrence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_interval_recurrence` (
  `id_interval` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_plural` varchar(256) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_interval`),
  KEY `FK_Shop_Interval_Recurrence_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Interval_Recurrence_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_interval_recurrence`
--

LOCK TABLES `shop_interval_recurrence` WRITE;
/*!40000 ALTER TABLE `shop_interval_recurrence` DISABLE KEYS */;
INSERT INTO `shop_interval_recurrence` VALUES (1,'WEEK','Week','Weeks',_binary '','2024-04-28 19:03:07','root@localhost',NULL),(2,'MONTH','Month','Months',_binary '','2024-04-28 19:03:07','root@localhost',NULL),(3,'YEAR','Year','Years',_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_interval_recurrence` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Interval_Recurrence` BEFORE INSERT ON `shop_interval_recurrence` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Interval_Recurrence` BEFORE UPDATE ON `shop_interval_recurrence` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Interval_Recurrence_Audit (
		id_interval,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_interval, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_interval, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_interval, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
    UNION
    # Changed name
	SELECT NEW.id_interval, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
	;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_interval_recurrence_audit`
--

DROP TABLE IF EXISTS `shop_interval_recurrence_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_interval_recurrence_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_interval` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(256) DEFAULT NULL,
  `value_new` varchar(256) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Interval_Recurrence_Audit_id_interval` (`id_interval`),
  KEY `FK_Shop_Interval_Recurrence_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Interval_Recurrence_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Interval_Recurrence_Audit_id_interval` FOREIGN KEY (`id_interval`) REFERENCES `shop_interval_recurrence` (`id_interval`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_interval_recurrence_audit`
--

LOCK TABLES `shop_interval_recurrence_audit` WRITE;
/*!40000 ALTER TABLE `shop_interval_recurrence_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_interval_recurrence_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_region`
--

DROP TABLE IF EXISTS `shop_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_region` (
  `id_region` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_region`),
  KEY `FK_Shop_Region_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Region_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_region`
--

LOCK TABLES `shop_region` WRITE;
/*!40000 ALTER TABLE `shop_region` DISABLE KEYS */;
INSERT INTO `shop_region` VALUES (1,'UK','United Kingdom',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_region` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Region` BEFORE INSERT ON `shop_region` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Region` BEFORE UPDATE ON `shop_region` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Region_Audit (
		id_region,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_region, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_region, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed active
	SELECT NEW.id_region, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    # Changed display_order
	SELECT NEW.id_region, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_region_audit`
--

DROP TABLE IF EXISTS `shop_region_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_region_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_region` int NOT NULL,
  `name_field` varchar(64) NOT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Region_Audit_id_region` (`id_region`),
  KEY `FK_Shop_Region_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Region_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Region_Audit_id_region` FOREIGN KEY (`id_region`) REFERENCES `shop_region` (`id_region`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_region_audit`
--

LOCK TABLES `shop_region_audit` WRITE;
/*!40000 ALTER TABLE `shop_region_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_region_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_region_branch`
--

DROP TABLE IF EXISTS `shop_region_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_region_branch` (
  `id_branch` int NOT NULL AUTO_INCREMENT,
  `id_region_parent` int NOT NULL,
  `id_region_child` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_branch`),
  KEY `FK_Shop_Region_Branch_id_region_parent` (`id_region_parent`),
  KEY `FK_Shop_Region_Branch_id_region_child` (`id_region_child`),
  KEY `FK_Shop_Region_Branch_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Region_Branch_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Region_Branch_id_region_child` FOREIGN KEY (`id_region_child`) REFERENCES `shop_region` (`id_region`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Region_Branch_id_region_parent` FOREIGN KEY (`id_region_parent`) REFERENCES `shop_region` (`id_region`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_region_branch`
--

LOCK TABLES `shop_region_branch` WRITE;
/*!40000 ALTER TABLE `shop_region_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_region_branch` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Region_Branch` BEFORE INSERT ON `shop_region_branch` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Region_Branch` BEFORE UPDATE ON `shop_region_branch` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Region_Branch_Audit (
		id_branch,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed depth
	SELECT NEW.id_branch, 'depth', CONVERT(OLD.depth, CHAR), CONVERT(NEW.depth, CHAR), NEW.id_change_set
		WHERE NOT OLD.depth <=> NEW.depth
    UNION
    */
    # Changed active
	SELECT NEW.id_branch, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    # Changed display_order
	SELECT NEW.id_branch, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_region_branch_audit`
--

DROP TABLE IF EXISTS `shop_region_branch_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_region_branch_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_branch` int NOT NULL,
  `name_field` varchar(64) NOT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Region_Branch_Audit_id_branch` (`id_branch`),
  KEY `FK_Shop_Region_Branch_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Region_Branch_Audit_id_branch` FOREIGN KEY (`id_branch`) REFERENCES `shop_region_branch` (`id_branch`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Region_Branch_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_region_branch_audit`
--

LOCK TABLES `shop_region_branch_audit` WRITE;
/*!40000 ALTER TABLE `shop_region_branch_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_region_branch_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_role`
--

DROP TABLE IF EXISTS `shop_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_role`),
  KEY `FK_Shop_Role_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Role_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_role`
--

LOCK TABLES `shop_role` WRITE;
/*!40000 ALTER TABLE `shop_role` DISABLE KEYS */;
INSERT INTO `shop_role` VALUES (1,'DIRECTOR','Director',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'USER','User',_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Role` BEFORE INSERT ON `shop_role` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Role` BEFORE UPDATE ON `shop_role` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Role_Audit (
		id_role,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_role, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
	# Changed name
	SELECT NEW.id_role, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed active
	SELECT NEW.id_role, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    # Changed display_order
	SELECT NEW.id_role, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_role_audit`
--

DROP TABLE IF EXISTS `shop_role_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_role_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_role` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Role_Audit_id_role` (`id_role`),
  KEY `FK_Shop_Role_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Role_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Role_Audit_id_role` FOREIGN KEY (`id_role`) REFERENCES `shop_role` (`id_role`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_role_audit`
--

LOCK TABLES `shop_role_audit` WRITE;
/*!40000 ALTER TABLE `shop_role_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_role_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_role_permission_link`
--

DROP TABLE IF EXISTS `shop_role_permission_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_role_permission_link` (
  `id_link` int NOT NULL AUTO_INCREMENT,
  `id_role` int DEFAULT NULL,
  `id_permission` int DEFAULT NULL,
  `id_access_level` int DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_link`),
  KEY `FK_Shop_Role_Permission_Link_id_role` (`id_role`),
  KEY `FK_Shop_Role_Permission_Link_id_permission` (`id_permission`),
  KEY `FK_Shop_Role_Permission_Link_id_access_level` (`id_access_level`),
  KEY `FK_Shop_Role_Permission_Link_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Role_Permission_Link_id_access_level` FOREIGN KEY (`id_access_level`) REFERENCES `shop_access_level` (`id_access_level`),
  CONSTRAINT `FK_Shop_Role_Permission_Link_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Role_Permission_Link_id_permission` FOREIGN KEY (`id_permission`) REFERENCES `shop_permission` (`id_permission`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Role_Permission_Link_id_role` FOREIGN KEY (`id_role`) REFERENCES `shop_role` (`id_role`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_role_permission_link`
--

LOCK TABLES `shop_role_permission_link` WRITE;
/*!40000 ALTER TABLE `shop_role_permission_link` DISABLE KEYS */;
INSERT INTO `shop_role_permission_link` VALUES (1,1,1,3,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(2,1,2,3,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(3,1,3,3,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(4,1,4,3,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(5,1,5,3,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(6,2,1,1,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(7,2,2,1,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(8,2,3,1,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(9,2,4,1,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(10,2,5,1,_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_role_permission_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Role_Permission_Link` BEFORE INSERT ON `shop_role_permission_link` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Role_Permission_Link` BEFORE UPDATE ON `shop_role_permission_link` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Role_Permission_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_role
	SELECT NEW.id_link, 'id_role', CONVERT(OLD.id_role, CHAR), CONVERT(NEW.id_role, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_role <=> NEW.id_role
	UNION
	# Changed id_permission
	SELECT NEW.id_link, 'id_permission', CONVERT(OLD.id_permission, CHAR), CONVERT(NEW.id_permission, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permission <=> NEW.id_permission
    UNION
    */
    # Changed id_access_level
	SELECT NEW.id_link, 'id_access_level', CONVERT(OLD.id_access_level, CHAR), CONVERT(NEW.id_access_level, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_access_level <=> NEW.id_access_level
	UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_role_permission_link_audit`
--

DROP TABLE IF EXISTS `shop_role_permission_link_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_role_permission_link_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_link` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Role_Permission_Link_Audit_id_link` (`id_link`),
  KEY `FK_Shop_Role_Permission_Link_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Role_Permission_Link_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Role_Permission_Link_Audit_id_link` FOREIGN KEY (`id_link`) REFERENCES `shop_role_permission_link` (`id_link`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_role_permission_link_audit`
--

LOCK TABLES `shop_role_permission_link_audit` WRITE;
/*!40000 ALTER TABLE `shop_role_permission_link_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_role_permission_link_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_tax_or_surcharge`
--

DROP TABLE IF EXISTS `shop_tax_or_surcharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_tax_or_surcharge` (
  `id_tax` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `id_region_buyer` int NOT NULL,
  `id_region_seller` int NOT NULL,
  `id_currency` int DEFAULT NULL,
  `fixed_fee` float NOT NULL DEFAULT '0',
  `multiplier` float NOT NULL DEFAULT '1',
  `apply_fixed_fee_before_multiplier` bit(1) DEFAULT b'1',
  `quantity_min` float NOT NULL DEFAULT '0',
  `quantity_max` float NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_tax`),
  KEY `FK_Shop_Tax_Or_Surcharge_id_region_buyer` (`id_region_buyer`),
  KEY `FK_Shop_Tax_Or_Surcharge_id_region_seller` (`id_region_seller`),
  KEY `FK_Shop_Tax_Or_Surcharge_id_currency` (`id_currency`),
  KEY `FK_Shop_Tax_Or_Surcharge_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Tax_Or_Surcharge_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Tax_Or_Surcharge_id_currency` FOREIGN KEY (`id_currency`) REFERENCES `shop_currency` (`id_currency`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Tax_Or_Surcharge_id_region_buyer` FOREIGN KEY (`id_region_buyer`) REFERENCES `shop_region` (`id_region`),
  CONSTRAINT `FK_Shop_Tax_Or_Surcharge_id_region_seller` FOREIGN KEY (`id_region_seller`) REFERENCES `shop_region` (`id_region`),
  CONSTRAINT `shop_tax_or_surcharge_chk_1` CHECK ((`multiplier` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_tax_or_surcharge`
--

LOCK TABLES `shop_tax_or_surcharge` WRITE;
/*!40000 ALTER TABLE `shop_tax_or_surcharge` DISABLE KEYS */;
INSERT INTO `shop_tax_or_surcharge` VALUES (1,'VAT','Value Added Tax',1,1,NULL,0,0.2,_binary '',0,1,_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_tax_or_surcharge` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Tax_Or_Surcharge` BEFORE INSERT ON `shop_tax_or_surcharge` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Tax_Or_Surcharge` BEFORE UPDATE ON `shop_tax_or_surcharge` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Tax_Or_Surcharge_Audit (
		id_tax,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_tax, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_tax, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed fixed_fee
	SELECT NEW.id_tax, 'fixed_fee', OLD.fixed_fee, NEW.fixed_fee, NEW.id_change_set
		WHERE NOT OLD.fixed_fee <=> NEW.fixed_fee
    UNION
    # Changed multiplier
	SELECT NEW.id_tax, 'multiplier', OLD.multiplier, NEW.multiplier, NEW.id_change_set
		WHERE NOT OLD.multiplier <=> NEW.multiplier
    UNION
    # Changed apply_fixed_fee_before_multiplier
	SELECT NEW.id_tax, 'apply_fixed_fee_before_multiplier', CONVERT(CONVERT(OLD.apply_fixed_fee_before_multiplier, SIGNED), CHAR), CONVERT(CONVERT(NEW.apply_fixed_fee_before_multiplier, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.apply_fixed_fee_before_multiplier <=> NEW.apply_fixed_fee_before_multiplier
    UNION
    # Changed quantity_min
	SELECT NEW.id_tax, 'quantity_min', OLD.quantity_min, NEW.quantity_min, NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    # Changed quantity_max
	SELECT NEW.id_tax, 'quantity_max', OLD.quantity_max, NEW.quantity_max, NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    # Changed display_order
	SELECT NEW.id_tax, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
    # Changed active
	SELECT NEW.id_tax, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_tax_or_surcharge_audit`
--

DROP TABLE IF EXISTS `shop_tax_or_surcharge_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_tax_or_surcharge_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_tax` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Tax_Or_Surcharge_Audit_id_discount` (`id_tax`),
  KEY `FK_Shop_Tax_Or_Surcharge_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Tax_Or_Surcharge_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_Tax_Or_Surcharge_Audit_id_discount` FOREIGN KEY (`id_tax`) REFERENCES `shop_tax_or_surcharge` (`id_tax`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_tax_or_surcharge_audit`
--

LOCK TABLES `shop_tax_or_surcharge_audit` WRITE;
/*!40000 ALTER TABLE `shop_tax_or_surcharge_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_tax_or_surcharge_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user`
--

DROP TABLE IF EXISTS `shop_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user` (
  `id_user` varchar(200) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `email_verified` bit(1) NOT NULL DEFAULT b'0',
  `is_super_user` bit(1) NOT NULL DEFAULT b'0',
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `FK_Shop_User_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user`
--

LOCK TABLES `shop_user` WRITE;
/*!40000 ALTER TABLE `shop_user` DISABLE KEYS */;
INSERT INTO `shop_user` VALUES ('auth0|6582b95c895d09a70ba10fef','Teddy','edward.middletonsmith@gmail.com',_binary '\0',_binary '',_binary '','2024-04-28 19:03:07','root@localhost',NULL),('parts_guest','Guest','',_binary '\0',_binary '\0',_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_User` BEFORE INSERT ON `shop_user` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_User` BEFORE UPDATE ON `shop_user` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Audit (
		id_user,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed name
	SELECT NEW.id_user, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
	UNION
	# Changed is_super_user
	SELECT NEW.id_user, 'is_super_user', CONVERT(CONVERT(OLD.is_super_user, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_super_user, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_super_user <=> NEW.is_super_user)
	UNION
    # Changed active
	SELECT NEW.id_user, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_user_audit`
--

DROP TABLE IF EXISTS `shop_user_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(200) NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_User_Audit_id_user` (`id_user`),
  KEY `FK_Shop_User_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_User_Audit_id_user` FOREIGN KEY (`id_user`) REFERENCES `shop_user` (`id_user`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_audit`
--

LOCK TABLES `shop_user_audit` WRITE;
/*!40000 ALTER TABLE `shop_user_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user_basket`
--

DROP TABLE IF EXISTS `shop_user_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_basket` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(200) NOT NULL,
  `id_product` int NOT NULL,
  `id_permutation` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set_user` int DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  KEY `FK_Shop_User_Basket_id_user` (`id_user`),
  KEY `FK_Shop_User_Basket_id_product` (`id_product`),
  KEY `FK_Shop_User_Basket_id_permutation` (`id_permutation`),
  KEY `FK_Shop_User_Basket_id_change_set_user` (`id_change_set_user`),
  CONSTRAINT `FK_Shop_User_Basket_id_change_set_user` FOREIGN KEY (`id_change_set_user`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Basket_id_permutation` FOREIGN KEY (`id_permutation`) REFERENCES `shop_product_permutation` (`id_permutation`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_User_Basket_id_product` FOREIGN KEY (`id_product`) REFERENCES `shop_product` (`id_product`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_User_Basket_id_user` FOREIGN KEY (`id_user`) REFERENCES `shop_user` (`id_user`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_basket`
--

LOCK TABLES `shop_user_basket` WRITE;
/*!40000 ALTER TABLE `shop_user_basket` DISABLE KEYS */;
INSERT INTO `shop_user_basket` VALUES (1,'auth0|6582b95c895d09a70ba10fef',1,1,69,_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_user_basket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_User_Basket` BEFORE INSERT ON `shop_user_basket` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_User_Basket` BEFORE UPDATE ON `shop_user_basket` FOR EACH ROW BEGIN
	IF NEW.id_change_set_user <=> OLD.id_change_set_user THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Basket_Audit (
		id_item,
        name_field,
        value_prev,
        value_new,
        id_change_set_user
    )
    # Changed id_user
	SELECT NEW.id_item, 'id_user', OLD.id_user, NEW.id_user, NEW.id_change_set_user
		WHERE NOT OLD.id_user <=> NEW.id_user
	UNION
	# Changed id_product
	SELECT NEW.id_item, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set_user
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
	# Changed quantity
	SELECT NEW.id_item, 'quantity', CONVERT(OLD.quantity, CHAR), CONVERT(NEW.quantity, CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.quantity <=> NEW.quantity)
	UNION
    # Changed active
	SELECT NEW.id_item, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.active <=> NEW.active)
	;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_user_basket_audit`
--

DROP TABLE IF EXISTS `shop_user_basket_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_basket_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_item` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set_user` int DEFAULT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_User_Basket_Audit_id_link` (`id_item`),
  KEY `FK_Shop_User_Basket_Audit_id_change_set_user` (`id_change_set_user`),
  CONSTRAINT `FK_Shop_User_Basket_Audit_id_change_set_user` FOREIGN KEY (`id_change_set_user`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Basket_Audit_id_link` FOREIGN KEY (`id_item`) REFERENCES `shop_user_basket` (`id_item`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_basket_audit`
--

LOCK TABLES `shop_user_basket_audit` WRITE;
/*!40000 ALTER TABLE `shop_user_basket_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user_basket_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user_change_set`
--

DROP TABLE IF EXISTS `shop_user_change_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_change_set` (
  `id_change_set` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) DEFAULT NULL,
  `updated_last_on` datetime DEFAULT NULL,
  `updated_last_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_change_set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_change_set`
--

LOCK TABLES `shop_user_change_set` WRITE;
/*!40000 ALTER TABLE `shop_user_change_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user_change_set` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_User_Change_Set` BEFORE INSERT ON `shop_user_change_set` FOR EACH ROW BEGIN
	IF NEW.updated_last_on <=> NULL THEN
		SET NEW.updated_last_on = NOW();
	END IF;
	IF NEW.updated_last_by <=> NULL THEN
		SET NEW.updated_last_by = CURRENT_USER();
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_user_order`
--

DROP TABLE IF EXISTS `shop_user_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_order` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(200) NOT NULL,
  `value_total` float DEFAULT NULL,
  `id_order_status` int NOT NULL,
  `id_checkout_session` varchar(200) NOT NULL,
  `id_currency` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set_user` int DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `FK_Shop_User_Order_id_user` (`id_user`),
  KEY `FK_Shop_User_Order_id_order_status` (`id_order_status`),
  KEY `FK_Shop_User_Order_id_currency` (`id_currency`),
  KEY `FK_Shop_User_Order_id_change_set_user` (`id_change_set_user`),
  CONSTRAINT `FK_Shop_User_Order_id_change_set_user` FOREIGN KEY (`id_change_set_user`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Order_id_currency` FOREIGN KEY (`id_currency`) REFERENCES `shop_currency` (`id_currency`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_User_Order_id_order_status` FOREIGN KEY (`id_order_status`) REFERENCES `shop_user_order_status` (`id_status`),
  CONSTRAINT `FK_Shop_User_Order_id_user` FOREIGN KEY (`id_user`) REFERENCES `shop_user` (`id_user`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_order`
--

LOCK TABLES `shop_user_order` WRITE;
/*!40000 ALTER TABLE `shop_user_order` DISABLE KEYS */;
INSERT INTO `shop_user_order` VALUES (1,'auth0|6582b95c895d09a70ba10fef',25,1,'noods',1,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(2,'auth0|6582b95c895d09a70ba10fef',25,1,'noods',1,_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_user_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_User_Order` BEFORE INSERT ON `shop_user_order` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_User_Order` BEFORE UPDATE ON `shop_user_order` FOR EACH ROW BEGIN
	IF OLD.id_change_set_user <=> NEW.id_change_set_user THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
	IF NOT (NEW.id_checkout_session <=> OLD.id_checkout_session) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Checkout session ID must not change.';
    END IF;
    
    INSERT INTO Shop_User_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set_user
    )
    # Changed id_user
	SELECT NEW.id_order, 'id_user', OLD.id_user, NEW.id_user, NEW.id_change_set_user
		WHERE NOT OLD.id_user <=> NEW.id_user
	UNION
	# Changed value_total
	SELECT NEW.id_order, 'value_total', CONVERT(OLD.value_total, CHAR), CONVERT(NEW.value_total, CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.value_total <=> NEW.value_total)
	UNION
	# Changed id_order_status
	SELECT NEW.id_order, 'id_order_status', CONVERT(OLD.id_order_status, CHAR), CONVERT(NEW.id_order_status, CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.id_order_status <=> NEW.id_order_status)
	UNION
	# Changed id_checkout_session
	SELECT NEW.id_order, 'id_checkout_session', OLD.id_checkout_session, NEW.id_checkout_session, NEW.id_change_set_user
		WHERE NOT (OLD.id_checkout_session <=> NEW.id_checkout_session)
	UNION
    # Changed active
	SELECT NEW.id_order, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.active <=> NEW.active)
	;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_user_order_audit`
--

DROP TABLE IF EXISTS `shop_user_order_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_order_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set_user` int DEFAULT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_User_Order_Audit_id_order` (`id_order`),
  KEY `FK_Shop_User_Order_Audit_id_change_set_user` (`id_change_set_user`),
  CONSTRAINT `FK_Shop_User_Order_Audit_id_change_set_user` FOREIGN KEY (`id_change_set_user`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Order_Audit_id_order` FOREIGN KEY (`id_order`) REFERENCES `shop_user_order` (`id_order`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_order_audit`
--

LOCK TABLES `shop_user_order_audit` WRITE;
/*!40000 ALTER TABLE `shop_user_order_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user_order_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user_order_product_link`
--

DROP TABLE IF EXISTS `shop_user_order_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_order_product_link` (
  `id_link` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `id_permutation` int DEFAULT NULL,
  `quantity` float NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_link`),
  KEY `FK_Shop_User_Order_Product_Link_id_order` (`id_order`),
  KEY `FK_Shop_User_Order_Product_Link_id_product` (`id_product`),
  KEY `FK_Shop_User_Order_Product_Link_id_permutation` (`id_permutation`),
  KEY `FK_Shop_User_Order_Product_Link_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Order_Product_Link_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Order_Product_Link_id_order` FOREIGN KEY (`id_order`) REFERENCES `shop_user_order` (`id_order`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_User_Order_Product_Link_id_permutation` FOREIGN KEY (`id_permutation`) REFERENCES `shop_product_permutation` (`id_permutation`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_Shop_User_Order_Product_Link_id_product` FOREIGN KEY (`id_product`) REFERENCES `shop_product` (`id_product`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_order_product_link`
--

LOCK TABLES `shop_user_order_product_link` WRITE;
/*!40000 ALTER TABLE `shop_user_order_product_link` DISABLE KEYS */;
INSERT INTO `shop_user_order_product_link` VALUES (1,1,1,1,69,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(2,1,2,NULL,69,_binary '','2024-04-28 19:03:07','root@localhost',NULL),(3,1,1,2,69,_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_user_order_product_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_User_Order_Product_Link` BEFORE INSERT ON `shop_user_order_product_link` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_User_Order_Product_Link` BEFORE UPDATE ON `shop_user_order_product_link` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_product
	SELECT NEW.id_link, 'active', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_product <=> NEW.id_product)
    UNION
	# Changed quantity
	SELECT NEW.id_link, 'quantity', CONVERT(OLD.quantity, CHAR), CONVERT(NEW.quantity, CHAR), NEW.id_change_set
		WHERE NOT (OLD.quantity <=> NEW.quantity)
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_user_order_product_link_audit`
--

DROP TABLE IF EXISTS `shop_user_order_product_link_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_order_product_link_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_link` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_User_Order_Product_Link_Audit_id_link` (`id_link`),
  KEY `FK_Shop_User_Order_Product_Link_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Order_Product_Link_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Order_Product_Link_Audit_id_link` FOREIGN KEY (`id_link`) REFERENCES `shop_user_order_product_link` (`id_link`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_order_product_link_audit`
--

LOCK TABLES `shop_user_order_product_link_audit` WRITE;
/*!40000 ALTER TABLE `shop_user_order_product_link_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user_order_product_link_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user_order_status`
--

DROP TABLE IF EXISTS `shop_user_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_order_status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_plural` varchar(256) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_status`),
  KEY `FK_Shop_User_Order_Status_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Order_Status_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_order_status`
--

LOCK TABLES `shop_user_order_status` WRITE;
/*!40000 ALTER TABLE `shop_user_order_status` DISABLE KEYS */;
INSERT INTO `shop_user_order_status` VALUES (1,'SUCCESS','Success','Successes',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,'FAIL','Failure','Failures',_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_user_order_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_User_Order_Status` BEFORE INSERT ON `shop_user_order_status` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_User_Order_Status` BEFORE UPDATE ON `shop_user_order_status` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Order_Status_Audit (
		id_Status,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_Status, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_Status, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_Status, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	# Changed active
	SELECT NEW.id_Status, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_Status, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_user_order_status_audit`
--

DROP TABLE IF EXISTS `shop_user_order_status_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_order_status_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_status` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_User_Order_Status_Audit_id_status` (`id_status`),
  KEY `FK_Shop_User_Order_Status_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Order_Status_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Order_Status_Audit_id_status` FOREIGN KEY (`id_status`) REFERENCES `shop_user_order_status` (`id_status`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_order_status_audit`
--

LOCK TABLES `shop_user_order_status_audit` WRITE;
/*!40000 ALTER TABLE `shop_user_order_status_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user_order_status_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user_role_link`
--

DROP TABLE IF EXISTS `shop_user_role_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_role_link` (
  `id_link` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(200) NOT NULL,
  `id_role` int NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_link`),
  KEY `FK_Shop_User_Role_Link_id_user` (`id_user`),
  KEY `FK_Shop_User_Role_Link_id_role` (`id_role`),
  KEY `FK_Shop_User_Role_Link_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Role_Link_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Role_Link_id_role` FOREIGN KEY (`id_role`) REFERENCES `shop_role` (`id_role`),
  CONSTRAINT `FK_Shop_User_Role_Link_id_user` FOREIGN KEY (`id_user`) REFERENCES `shop_user` (`id_user`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_role_link`
--

LOCK TABLES `shop_user_role_link` WRITE;
/*!40000 ALTER TABLE `shop_user_role_link` DISABLE KEYS */;
INSERT INTO `shop_user_role_link` VALUES (1,'auth0|6582b95c895d09a70ba10fef',1,_binary '','2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_user_role_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_User_Role_Link` BEFORE INSERT ON `shop_user_role_link` FOR EACH ROW BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_User_Role_Link` BEFORE UPDATE ON `shop_user_role_link` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Role_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_user_role_link_audit`
--

DROP TABLE IF EXISTS `shop_user_role_link_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user_role_link_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_link` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_User_Role_Link_Audit_id_link` (`id_link`),
  KEY `FK_Shop_User_Role_Link_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Role_Link_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_user_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_User_Role_Link_Audit_id_link` FOREIGN KEY (`id_link`) REFERENCES `shop_user_role_link` (`id_link`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user_role_link_audit`
--

LOCK TABLES `shop_user_role_link_audit` WRITE;
/*!40000 ALTER TABLE `shop_user_role_link_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user_role_link_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_variation`
--

DROP TABLE IF EXISTS `shop_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_variation` (
  `id_variation` int NOT NULL AUTO_INCREMENT,
  `id_type` int NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_variation`),
  KEY `FK_Shop_Variation_id_type` (`id_type`),
  KEY `FK_Shop_Variation_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Variation_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Variation_id_type` FOREIGN KEY (`id_type`) REFERENCES `shop_variation_type` (`id_type`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_variation`
--

LOCK TABLES `shop_variation` WRITE;
/*!40000 ALTER TABLE `shop_variation` DISABLE KEYS */;
INSERT INTO `shop_variation` VALUES (1,1,'RED','Red',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL),(2,1,'BLUE','Blue',_binary '',2,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_variation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Variation` BEFORE INSERT ON `shop_variation` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Variation` BEFORE UPDATE ON `shop_variation` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Variation_Audit (
		id_variation,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_variation, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_variation, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed active
	SELECT NEW.id_variation, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_variation, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_variation_audit`
--

DROP TABLE IF EXISTS `shop_variation_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_variation_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_variation` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Variation_Audit_id_variation` (`id_variation`),
  KEY `FK_Shop_Variation_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Variation_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Variation_Audit_id_variation` FOREIGN KEY (`id_variation`) REFERENCES `shop_variation` (`id_variation`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_variation_audit`
--

LOCK TABLES `shop_variation_audit` WRITE;
/*!40000 ALTER TABLE `shop_variation_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_variation_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_variation_type`
--

DROP TABLE IF EXISTS `shop_variation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_variation_type` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_plural` varchar(256) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `display_order` int NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `id_change_set` int DEFAULT NULL,
  PRIMARY KEY (`id_type`),
  KEY `FK_Shop_Variation_Type_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Variation_Type_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_variation_type`
--

LOCK TABLES `shop_variation_type` WRITE;
/*!40000 ALTER TABLE `shop_variation_type` DISABLE KEYS */;
INSERT INTO `shop_variation_type` VALUES (1,'COLOUR','Colour','Colours',_binary '',1,'2024-04-28 19:03:07','root@localhost',NULL);
/*!40000 ALTER TABLE `shop_variation_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_Shop_Variation_Type` BEFORE INSERT ON `shop_variation_type` FOR EACH ROW BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_Shop_Variation_Type` BEFORE UPDATE ON `shop_variation_type` FOR EACH ROW BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Variation_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_type, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	# Changed active
	SELECT NEW.id_type, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_type, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;
END */;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shop_variation_type_audit`
--

DROP TABLE IF EXISTS `shop_variation_type_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_variation_type_audit` (
  `id_audit` int NOT NULL AUTO_INCREMENT,
  `id_type` int NOT NULL,
  `name_field` varchar(50) DEFAULT NULL,
  `value_prev` varchar(500) DEFAULT NULL,
  `value_new` varchar(500) DEFAULT NULL,
  `id_change_set` int NOT NULL,
  PRIMARY KEY (`id_audit`),
  KEY `FK_Shop_Variation_Type_Audit_id_type` (`id_type`),
  KEY `FK_Shop_Variation_Type_Audit_id_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Variation_Type_Audit_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`),
  CONSTRAINT `FK_Shop_Variation_Type_Audit_id_type` FOREIGN KEY (`id_type`) REFERENCES `shop_variation_type` (`id_type`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_variation_type_audit`
--

LOCK TABLES `shop_variation_type_audit` WRITE;
/*!40000 ALTER TABLE `shop_variation_type_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_variation_type_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_msg_error`
--

DROP TABLE IF EXISTS `tmp_msg_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_msg_error` (
  `display_order` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(36) NOT NULL,
  `id_type` int NOT NULL,
  `msg` varchar(4000) NOT NULL,
  PRIMARY KEY (`display_order`),
  KEY `FK_tmp_Msg_Error_id_type` (`id_type`),
  CONSTRAINT `FK_tmp_Msg_Error_id_type` FOREIGN KEY (`id_type`) REFERENCES `shop_msg_error_type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_msg_error`
--

LOCK TABLES `tmp_msg_error` WRITE;
/*!40000 ALTER TABLE `tmp_msg_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_msg_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'partsltd_prod'
--

--
-- Dumping routines for database 'partsltd_prod'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_shop_edit_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_shop_edit_user`(
	IN a_id_user INT,
    IN a_name VARCHAR(255),
	IN a_email VARCHAR(254),
    IN a_email_verified BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_user BIT;
    -- DECLARE v_now DATETIME;
    
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_name IS NULL THEN
		SET a_name = '';
	ELSE
		SET a_name = TRIM(a_name);
    END IF;
	IF a_email IS NULL THEN
		SET a_email = '';
	ELSE
		SET a_email = TRIM(a_email);
    END IF;
	IF a_email_verified IS NULL THEN
		SET a_email_verified = 0;
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User (
		id_user INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		id_type INT NOT NULL,
        # code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		msg VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
    
    
    -- User
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user LIKE CONCAT('%', a_id_user, '%')
			AND active
		LIMIT 1
        ;
        
		IF NOT EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1) THEN
			INSERT INTO Shop_User (
				id_user,
                name,
                email,
                email_verified
            )
            VALUES (
				a_id_user,
                a_name,
                a_email,
                a_email_verified
            );
            
            INSERT INTO tmp_Shop_User (
				id_user,
				active
			)
			SELECT id_user,
				active
			FROM Shop_User
			WHERE id_user LIKE CONCAT('%', a_id_user, '%')
				AND active
			LIMIT 1
            ;
        END IF;
        
        SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
	ELSE
		INSERT INTO tmp_Msg_Error (
			id_type,
            msg
		)
        VALUES (
			 (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
            'No user ID provided.'
		)
        ;
    END IF;
    
    
    /*
    IF NOT EXISTS (SELECT msg FROM tmp_Msg_Error LIMIT 1) THEN
    END IF;
    */
    
    
    -- Returns
    # User
    SELECT *
    FROM tmp_Shop_User
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    ;
    
    /*
    # Return arguments for test
    SELECT a_id_user,
		a_name,
        a_email,
        a_email_verified
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_User;
END ;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_shop_edit_user_basket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_shop_edit_user_basket`(
	IN a_id_user INT,
	IN a_ids_permutation_basket VARCHAR(4000),
	IN a_quantities_permutation_basket VARCHAR(4000),
	IN a_id_permutation_edit INT,
	IN a_quantity_permutation_edit INT,
    IN a_sum_not_edit BIT,
    IN a_id_currency INT,
    IN a_id_region_purchase INT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_permutation_basket BIT;
    DECLARE v_has_filter_permutation_edit BIT;
    DECLARE v_has_filter_region BIT;
    DECLARE v_has_filter_currency BIT;
    DECLARE v_n_id_permutation_basket INT;
    DECLARE v_n_quantity_permutation_basket INT;
    DECLARE v_row_number INT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_now DATETIME;
    # DECLARE v_quantity_new INT;
    DECLARE v_change_set_used BIT;
    DECLARE v_id_change_set INT;
    
    SET v_guid = UUID();
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_ids_permutation_basket IS NULL THEN
		SET a_ids_permutation_basket = '';
	ELSE
		SET a_ids_permutation_basket = TRIM(a_ids_permutation_basket);
    END IF;
	IF a_quantities_permutation_basket IS NULL THEN
		SET a_quantities_permutation_basket = '';
	ELSE
		SET a_quantities_permutation_basket = TRIM(a_quantities_permutation_basket);
    END IF;
	IF a_sum_not_edit IS NULL THEN
		SET a_sum_not_edit = 1;
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_Basket;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Quantity;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User (
		id_user INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product (
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        display_order INT NOT NULL,
        active INT NOT NULL DEFAULT 1
	);
    
    CREATE TEMPORARY TABLE tmp_Shop_Quantity(
		quantity INT NOT NULL,
        display_order INT NOT NULL,
        active INT NOT NULL DEFAULT 1
	);
    
    CREATE TABLE tmp_Shop_Basket (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
        id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_region_purchase INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_region_purchase
			FOREIGN KEY (id_region_purchase)
			REFERENCES Shop_Region(id_region),
		id_currency INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
        quantity INT NOT NULL,
        active BIT NOT NULL DEFAULT 1
        /*
        display_order_category INT NOT NULL,
        display_order_product INT NOT NULL
        */
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        # code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		msg VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    SET v_has_filter_user = NOT (a_id_user = '');
    SET v_has_filter_permutation_basket = NOT (a_ids_permutation_basket = '');
    SET v_has_filter_permutation_edit = NOT ISNULL(a_id_permutation_edit);
    SET v_has_filter_currency = NOT ISNULL(a_id_currency);
    SET v_has_filter_region = NOT ISNULL(a_id_region_purchase);
    # SET v_quantity_new = CASE WHEN a_sum_not_edit THEN quantity + a_quantity_product_edit ELSE a_quantity_product_edit END;
    /*
    SELECT v_has_filter_user, v_has_filter_basket
    ;
    
    */
    
    -- Currency
    IF NOT v_has_filter_currency THEN
		INSERT INTO tmp_Msg_Error (
			id_type,
			guid,
			msg
		)
		VALUES (
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
			v_guid,
			'Currency ID not provided.'
		)
		;
    END IF;
    IF v_has_filter_currency AND NOT EXISTS ( SELECT * FROM Shop_Currency WHERE id_currency = a_id_currency) THEN
		INSERT INTO tmp_Msg_Error (
			id_type,
			guid,
			msg
		)
		VALUES (
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
			v_guid,
			CONCAT('Currency ID not found: ', a_id_currency, '.')
		)
		;
    END IF;
    
    -- Region
    IF NOT v_has_filter_region THEN
		INSERT INTO tmp_Msg_Error (
			id_type,
			guid,
			msg
		)
		VALUES (
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
			v_guid,
			'Region ID not provided.'
		)
		;
    END IF;
    IF v_has_filter_region AND NOT EXISTS ( SELECT * FROM Shop_Region WHERE id_region = a_id_region_purchase) THEN
		INSERT INTO tmp_Msg_Error (
			id_type,
			guid,
			msg
		)
		VALUES (
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
			v_guid,
			CONCAT('Region ID not found: ', a_id_region_purchase, '.')
		)
		;
    END IF;
    
    -- User
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user LIKE CONCAT('%', a_id_user, '%')
			AND active
		LIMIT 1
        ;
        
		IF NOT EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1) THEN
			SET v_has_filter_user = 0;
            
			INSERT INTO tmp_Msg_Error (
				id_type,
                guid,
				msg
			)
			VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
                CONCAT('User ID not found: ', a_id_user, '.')
			)
			;
        END IF;
        
        SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
    END IF;
    
    IF v_has_filter_user AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		SET v_change_set_used = 0;
		INSERT INTO Shop_User_Change_Set (
			comment
		)
		VALUES (
			'edit basket'
		);
		SET v_id_change_set := (SELECT id_change_set FROM Shop_User_Change_Set ORDER BY id_change_set DESC LIMIT 1);
    END IF;
    
    -- Get basket
    -- User
    IF v_has_filter_user AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		INSERT INTO tmp_Shop_Basket (
			id_category,
            id_product,
            id_permutation,
            id_region_purchase,
            id_currency,
            quantity,
            active
            /*
            display_order_category,
            display_order_product
            */
        )
        SELECT 
			C.id_category,
			UB.id_product,
			UB.id_permutation,
            UB.id_region_purchase,
            UB.id_currency,
            UB.quantity,
            UB.active
            /*
			C.display_order,
			P.display_order
            */
		FROM Shop_User_Basket UB
        /*
        INNER JOIN tmp_Shop_User t_U
			ON UB.id_user = t_U.id_user
		*/
		INNER JOIN Shop_Product_Permutation PP
			ON UB.id_product = PP.id_product
            AND PP.active
		INNER JOIN Shop_Product P
			ON PP.id_product = P.id_product
			AND P.active
        INNER JOIN Shop_Product_Category C
			ON P.id_category = C.id_category
			AND C.active
		WHERE UB.id_user = a_id_user
        ;
    END IF;
    
    -- Currency
    IF EXISTS (SELECT * FROM tmp_Shop_Basket WHERE active LIMIT 1) 
		AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		IF EXISTS (SELECT * FROM tmp_Shop_Basket WHERE active AND id_currency != a_id_currency) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
                guid,
				msg
			)
			VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
                CONCAT(
					'Currency ID does not match currency of other items in basket. Basket currency: ', 
					(SELECT code FROM Shop_Currency WHERE id_currency = (
						SELECT 
							id_currency 
						FROM tmp_Shop_Basket 
                        WHERE active 
							AND id_currency != a_id_currency 
						LIMIT 1
					)), 
                    ', new currency: ', 
                    (SELECT code FROM Shop_Currency WHERE id_currency = a_id_currency), 
                    '.'
				)
			)
			;
        END IF;
    END IF;
    
    -- Region
    IF EXISTS (SELECT * FROM tmp_Shop_Basket WHERE active LIMIT 1) 
		AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Basket 
            WHERE 
				active 
                AND id_region_purchase != a_id_region_purchase
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
                guid,
				msg
			)
			VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
                CONCAT('Purchase region ID does not match region of other items in basket. Basket currency: ', 
					(SELECT code FROM Shop_Region WHERE id_region = (
						SELECT 
							id_region_purchase
						FROM tmp_Shop_Basket 
                        WHERE active 
							AND id_region != a_id_region_purchase 
						LIMIT 1
					)), 
                    ', new currency: ', 
                    (SELECT code FROM Shop_Region WHERE id_region = a_id_region_purchase), 
                    '.'
				)
			)
			;
        END IF;
    END IF;
    
    -- String product id, permutation id, quantity list
    IF NOT EXISTS (SELECT * FROM tmp_Shop_Basket WHERE active LIMIT 1) AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN -- NOT v_has_filter_user AND
		# Get product ids
		CALL p_split(a_ids_permutation_basket, ',');
		INSERT INTO tmp_Shop_Product (
			id_product, id_permutation, display_order
		)
		SELECT PP.id_product, ST.substring, ST.display_order
		FROM Split_Temp ST
		INNER JOIN Shop_Product_Permutation PP
			ON ST.substring = PP.id_permutation
			-- AND PP.active
		;
        /*
		SELECT substring as id_product, display_order
		FROM Split_Temp
		;
        */
		DROP TABLE Split_Temp;
		
		# Get product quantities
		CALL p_split(a_quantities_permutation_basket, ',');
		INSERT INTO tmp_Shop_Quantity (
			quantity, display_order
		)
		SELECT substring, display_order
		FROM Split_Temp
		;
        /*
		SELECT substring AS quantity_product, display_order
		FROM Split_Temp
		;
        */
		DROP TABLE Split_Temp;
        
        # Compare number of product ids to number of quantities
        SET v_n_id_permutation_basket := (SELECT display_order FROM tmp_Shop_Product ORDER BY display_order DESC LIMIT 1);
        SET v_n_quantity_permutation_basket := (SELECT display_order FROM tmp_Shop_Quantity ORDER BY display_order DESC LIMIT 1);
        IF NOT v_n_id_permutation_basket = v_n_quantity_permutation_basket THEN
			INSERT INTO tmp_Msg_Error ( 
				id_type,
                guid,
                msg
			)
            VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
                CONCAT('Number of permutations (', v_n_id_permutation_basket, ') does not equal number of quantities (', v_n_quantity_permutation_basket, ') for basket.')
			)
            ;
		ELSE
			INSERT INTO tmp_Shop_Basket (
				id_category,
				id_product,
                id_permutation,
				id_region_purchase,
				id_currency,
				quantity
			)
			SELECT 
				C.id_category,
                P.id_product,
				t_P.id_permutation,
				a_id_region_purchase,
				a_id_currency,
				t_Q.quantity
			FROM tmp_Shop_Product t_P
			INNER JOIN tmp_Shop_Quantity t_Q
				ON t_P.display_order = t_Q.display_order
			INNER JOIN Shop_Product_Permutation PP
				ON t_P.id_permutation = PP.id_permutation
                AND PP.active
			INNER JOIN Shop_Product P
				ON PP.id_product = P.id_product
                AND P.active
			INNER JOIN Shop_Product_Category C
				ON P.id_category = C.id_category
				AND C.active
			-- RIGHT JOIN tmp_Shop_Basket t_UB ON ISNULL(t_UB.id_product)
			-- WHERE t_P.id_product NOT IN (SELECT id_product FROM tmp_Shop_Basket)
			;
            
            /*
            IF EXISTS(
				SELECT * 
                FROM Shop_Product P 
                INNER JOIN Shop_Product_Category C 
					ON P.id_category = C.id_category 
				INNER JOIN tmp_Shop_Basket t_B
					ON P.id_product = t_B.id_product 
				WHERE C.active = 0 OR P.active = 0 LIMIT 1
			) THEN
				INSERT INTO tmp_Msg_Error ( 
					id_type,
					guid,
					msg
				)
				VALUES (
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
					v_guid,
					CONCAT('No valid product IDs in list: ', a_ids_permutation_basket, '.')
				)
				;
            END IF;
            */
        END IF;
    END IF;
    
    /*
    select v_has_filter_edit;
    select * from tmp_Shop_Basket;
    select * from tmp_Msg_Error;
    */
    
    
    # Edit basket product
    IF v_has_filter_permutation_edit AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		IF EXISTS (
			SELECT *
            FROM Shop_Product_Permutation PP
			INNER JOIN Shop_Product P 
				ON PP.id_product = P.id_product
            INNER JOIN Shop_Product_Category C 
				ON P.id_category = C.id_category 
            WHERE 
				(
					C.active = 0 
					OR P.active = 0 
                    OR PP.active = 0
				)
				AND PP.id_permutation = a_id_permutation_edit
			LIMIT 1
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				id_type,
                guid,
				msg
			)
			VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
				CONCAT('Invalid product ID to edit: ', a_id_product_edit, '.')
			)
			;
        END IF;
	END IF;
    IF v_has_filter_permutation_edit AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
        IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Basket 
            WHERE 
				id_permutation = a_id_permutation_edit
		) THEN
			UPDATE tmp_Shop_Basket
            SET quantity = CASE WHEN a_sum_not_edit = 1 THEN IFNULL(quantity, 0) + a_quantity_permutation_edit ELSE a_quantity_permutation_edit END,
				active = CASE WHEN CASE WHEN a_sum_not_edit = 1 THEN IFNULL(quantity, 0) + a_quantity_permutation_edit ELSE a_quantity_permutation_edit END = 0 THEN 0 ELSE 1 END
            WHERE id_permutation = a_id_permutation_edit
            ;
            
            IF EXISTS (
				SELECT *
                FROM tmp_Shop_Basket t_B
                WHERE t_B.quantity < 0
			) THEN
				INSERT INTO tmp_Msg_Error ( 
					id_type,
					guid,
					msg
				)
				VALUES (
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
					v_guid,
					'Invalid basket quantity.'
				)
				;
            END IF;
            
            IF v_has_filter_user AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
				SET v_change_set_used = 1;
				
				UPDATE Shop_User_Basket UB
                INNER JOIN tmp_Shop_Basket t_UB
					ON UB.id_permutation = a_id_permutation_edit
				SET UB.quantity = t_UB.quantity,
					UB.active = t_UB.active,
					UB.id_change_set_user = v_id_change_set
				WHERE UB.id_permutation = a_id_permutation_edit
					AND id_user = a_id_user
				;
            END IF;
        ELSE
            IF a_quantity_permutation_edit < 0 THEN
				INSERT INTO tmp_Msg_Error ( 
					id_type,
					guid,
					msg
				)
				VALUES (
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
					v_guid,
					'Invalid basket quantity.'
				)
				;
			ELSE
				INSERT INTO tmp_Shop_Basket (
					id_category,
					id_product,
                    id_permutation,
                    id_region_purchase,
                    id_currency,
					quantity,
                    active
				)
				SELECT 
					P.id_category,
					P.id_product,
                    PP.id_permutation,
                    a_id_region_purchase,
                    a_id_currency,
					a_quantity_permutation_edit,
					CASE WHEN a_quantity_permutation_edit > 0 THEN 1 ELSE 0 END
				FROM Shop_Product_Permutation PP
                INNER JOIN Shop_Product P
					ON PP.id_product = P.id_product
				WHERE id_permutation = a_id_permutation_edit
				;
				IF v_has_filter_user THEN
					IF EXISTS (
						SELECT * 
                        FROM Shop_User_Basket UB
                        WHERE 
							UB.id_permutation = a_id_permutation_edit
					) THEN
						SET v_change_set_used = 1;
						
						UPDATE Shop_User_Basket
						INNER JOIN tmp_Shop_Basket t_UB ON UB.id_permutation = t_UB.id_permutation
						SET UB.quantity = t_UB.quantity,
							UB.active = t_UB.active,
							UB.id_change_set_user = v_id_change_set
						WHERE UB.id_permutation = a_id_permutation_edit
							AND id_user = a_id_user
						;
					ELSE
						INSERT INTO Shop_User_Basket (
							id_user,
							id_product,
                            id_permutation,
                            id_region_purchase,
                            id_currency,
							quantity,
                            active
						)
						SELECT a_id_user,
							t_UB.id_product,
							t_UB.id_permutation,
							t_UB.id_region_purchase,
							t_UB.id_currency,
							t_UB.quantity,
                            t_UB.active
						FROM tmp_Shop_Basket t_UB
						WHERE id_permutation = a_id_permutation_edit
						;
					END IF;
				END IF;
            END IF;
        END IF;
    END IF;
    
    
    -- Checks
    /*
    SELECT * FROM tmp_Shop_Basket;
    SELECT 
		GROUP_CONCAT(t_UB.id_product SEPARATOR ',') AS basket_product_ids
	FROM tmp_Shop_Basket t_UB
	-- WHERE ISNULL(t_UB.id_permutation)
    ;
    SELECT 
		GROUP_CONCAT(t_UB.id_permutation SEPARATOR ',') AS basket_permutation_ids
	FROM tmp_Shop_Basket t_UB
	WHERE NOT ISNULL(t_UB.id_permutation)
    ;
    */
    -- Returns
	CALL p_shop_get_many_product (
		a_id_user, # a_id_user
		1, # a_get_all_categories
		'', # a_ids_category
		0, # a_get_inactive_categories
		0, # a_get_all_products
		(
			SELECT 
				GROUP_CONCAT(t_B.id_product SEPARATOR ',') 
			FROM tmp_Shop_Basket t_B
            WHERE active = 1
		), # a_ids_product
		0, # a_get_inactive_products
		0, # a_get_first_product_only
		0, # a_get_all_product_permutations
		(
			SELECT 
				GROUP_CONCAT(t_B.id_permutation SEPARATOR ',') 
			FROM tmp_Shop_Basket t_B
            WHERE NOT ISNULL(t_B.id_permutation)
				AND active = 1
		), # a_ids_permutation
		0, # a_get_inactive_permutations
		0, # a_get_all_images
		'', # a_ids_image
		0, # a_get_inactive_images
		1, # a_get_first_image_only
		0, # a_get_all_delivery_region
		a_id_region_purchase, # a_ids_delivery_region
		0, # a_get_inactive_delivery_region
		0, # a_get_all_currency
		a_id_currency, # a_ids_currency
		0, # a_get_inactive_currency
		1, # a_get_all_discount
		'', # a_ids_discount
		0 # a_get_inactive_discount
	);
    
    # Basket
	SELECT t_UB.id_category,
		t_UB.id_product,
		t_UB.id_permutation,
		P.name,
		PCL.price_local_VAT_incl,
        PCL.price_local_VAT_excl,
        PCL.id_currency,
		t_UB.quantity
	FROM tmp_Shop_Basket t_UB
	INNER JOIN Shop_Product_Permutation PP
		ON t_UB.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P
		ON PP.id_product = P.id_product
	INNER JOIN Shop_Product_Category C
		ON P.id_category = C.id_category
	INNER JOIN Shop_Product_Currency_Link PCL
		ON PP.id_permutation = PCL.id_permutation
        AND PCL.id_region_purchase = a_id_region_purchase
        AND PCL.id_currency = a_id_currency
	WHERE t_UB.active = 1
	ORDER BY C.display_order, P.display_order
	;
    
    # Errors
    /* Completed by product get many */
    SELECT 
		t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE GUID = v_guid
    ;
    
    /*
    # Return arguments for test
    SELECT
	a_ids_category,
	a_get_inactive_categories,
	a_ids_product,
	a_get_inactive_products,
    a_get_first_product_only,
    a_get_all_products,
	a_ids_image,
	a_get_inactive_images,
    a_get_first_image_only,
    a_get_all_images
    ;
    */
    
    -- Clean up
    IF NOT v_change_set_used THEN
		DELETE FROM Shop_User_Change_Set
        WHERE id_change_set = v_id_change_set
        ;
    END IF;
    
    # DROP TABLE IF EXISTS tmp_Msg_Error;
    DELETE FROM tmp_Msg_Error WHERE guid = v_guid;
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN 
		DROP TABLE tmp_Msg_Error;
	END IF;
    DROP TABLE IF EXISTS tmp_Shop_Basket;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Quantity;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
END ;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_shop_get_many_currency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_shop_get_many_currency`(
	IN a_get_inactive_currency BIT
)
BEGIN
	IF a_get_inactive_currency IS NULL THEN
		SET a_get_inactive_currency = 0;
    END IF;
    
	SELECT 
		C.id_currency,
        C.code,
        C.name,
        C.factor_from_GBP,
        C.active,
        C.display_order
	FROM Shop_Currency C
	WHERE a_get_inactive_currency
		OR C.active
	ORDER BY C.display_order
	;
END ;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_shop_get_many_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_shop_get_many_product`(
	IN a_id_user INT,
    IN a_get_all_category BIT,
	IN a_ids_category VARCHAR(500),
	IN a_get_inactive_category BIT,
    IN a_get_all_product BIT,
	IN a_ids_product VARCHAR(500),
	IN a_get_inactive_product BIT,
    IN a_get_first_product_only BIT,
    IN a_get_all_product_permutation BIT,
	IN a_ids_permutation VARCHAR(4000),
	IN a_get_inactive_permutation BIT,
    IN a_get_all_image BIT,
    IN a_ids_image VARCHAR(4000),
	IN a_get_inactive_image BIT,
    IN a_get_first_image_only BIT,
    IN a_get_all_delivery_region BIT,
    IN a_ids_delivery_region VARCHAR(4000),
	IN a_get_inactive_delivery_region BIT,
    IN a_get_all_currency BIT,
    IN a_ids_currency VARCHAR(4000),
	IN a_get_inactive_currency BIT,
    IN a_get_all_discount BIT,
    IN a_ids_discount VARCHAR(4000),
	IN a_get_inactive_discount BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_image BIT;
    DECLARE v_has_filter_delivery_region BIT;
    DECLARE v_has_filter_currency BIT;
    DECLARE v_has_filter_discount BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission VARCHAR(4000);
    DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_all_category IS NULL THEN
		SET a_get_all_category = 0;
    END IF;
	IF a_ids_category IS NULL THEN
		SET a_ids_category = '';
	ELSE
		SET a_ids_category = REPLACE(TRIM(a_ids_category), '|', ',');
    END IF;
	IF a_get_inactive_category IS NULL THEN
		SET a_get_inactive_category = 0;
    END IF;
	IF a_ids_product IS NULL THEN
		SET a_ids_product = '';
	ELSE
		SET a_ids_product = REPLACE(TRIM(a_ids_product), '|', ',');
    END IF;
	IF a_get_inactive_product IS NULL THEN
		SET a_get_inactive_product = 0;
    END IF;
	IF a_get_first_product_only IS NULL THEN
		SET a_get_first_product_only = 1;
    END IF;
	IF a_get_all_product IS NULL THEN
		SET a_get_all_product = 0;
    END IF;
	IF a_ids_permutation IS NULL THEN
		SET a_ids_permutation = '';
	ELSE
		SET a_ids_permutation = REPLACE(TRIM(a_ids_permutation), '|', ',');
    END IF;
	IF a_get_inactive_permutation IS NULL THEN
		SET a_get_inactive_permutation = 0;
    END IF;
	IF a_get_all_image IS NULL THEN
		SET a_get_all_image = 1;
    END IF;
	IF a_ids_image IS NULL THEN
		SET a_ids_image = '';
	ELSE
		SET a_ids_image = REPLACE(TRIM(a_ids_image), '|', ',');
    END IF;
	IF a_get_inactive_image IS NULL THEN
		SET a_get_inactive_image = 0;
    END IF;
    IF a_get_first_image_only IS NULL THEN
		SET a_get_first_image_only = 0;
    END IF;
	IF a_get_inactive_image IS NULL THEN
		SET a_get_inactive_image = 0;
    END IF;
	IF a_get_all_delivery_region IS NULL THEN
		SET a_get_all_delivery_region = 1;
    END IF;
	IF a_ids_delivery_region IS NULL THEN
		SET a_ids_delivery_region = '';
	ELSE
		SET a_ids_delivery_region = REPLACE(TRIM(a_ids_delivery_region), '|', ',');
    END IF;
	IF a_get_inactive_delivery_region IS NULL THEN
		SET a_get_inactive_delivery_region = 0;
    END IF;
	IF a_get_all_currency IS NULL THEN
		SET a_get_all_currency = 1;
    END IF;
	IF a_ids_currency IS NULL THEN
		SET a_ids_currency = '';
	ELSE
		SET a_ids_currency = REPLACE(TRIM(a_ids_currency), '|', ',');
    END IF;
	IF a_get_inactive_currency IS NULL THEN
		SET a_get_inactive_currency = 0;
    END IF;
	IF a_get_all_discount IS NULL THEN
		SET a_get_all_discount = 1;
    END IF;
	IF a_ids_discount IS NULL THEN
		SET a_ids_discount = '';
	ELSE
		SET a_ids_discount = REPLACE(TRIM(a_ids_discount), '|', ',');
    END IF;
	IF a_get_inactive_discount IS NULL THEN
		SET a_get_inactive_discount = 0;
    END IF;
    
    /*
    SELECT a_id_user, a_get_all_category, a_ids_category, a_get_inactive_category, a_get_all_product, 
    a_ids_product, a_get_inactive_product, a_get_first_product_only, a_get_all_product_permutation, a_ids_permutation, 
    a_get_inactive_permutation, a_get_all_image, a_ids_image, a_get_inactive_image, a_get_first_image_only, 
    a_get_all_delivery_region, a_ids_delivery_region, a_get_inactive_delivery_region, a_get_all_currency, a_ids_currency, 
    a_get_inactive_currency, a_get_all_discount, a_ids_discount, a_get_inactive_discount
    ;
    */
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Discount;
    DROP TABLE IF EXISTS tmp_Currency;
    DROP TABLE IF EXISTS tmp_Delivery_Region;
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Product_Category;
    
    CREATE TABLE tmp_Shop_Product_Category (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Category_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
        active BIT NOT NULL,
        display_order INT NOT NULL, 
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    CREATE TABLE tmp_Shop_Product (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		-- product_has_variations BIT NOT NULL,
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active_category BIT NOT NULL,
        active_product BIT NOT NULL,
        active_permutation BIT NULL,
        display_order_category INT NOT NULL, 
        display_order_product INT NOT NULL, 
        display_order_permutation INT NULL, 
        rank_permutation INT NOT NULL, # _in_category
        name VARCHAR(255) NOT NULL,
        description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full FLOAT NOT NULL,
		price_GBP_min FLOAT NOT NULL,
		*/
        latency_manufacture_days INT NOT NULL,
		quantity_min FLOAT NOT NULL,
		quantity_max FLOAT NOT NULL,
		quantity_step FLOAT NOT NULL,
		quantity_stock FLOAT NOT NULL,
		is_subscription BIT NOT NULL,
		id_unit_measurement_interval_recurrence INT,
		CONSTRAINT FK_tmp_Shop_Product_id_unit_measurement_interval_recurrence
			FOREIGN KEY (id_unit_measurement_interval_recurrence)
			REFERENCES Shop_Interval_Recurrence(id_interval),
		count_interval_recurrence INT,
        id_stripe_product VARCHAR(100),
        product_has_variations INT NOT NULL,
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    /*
    CREATE TEMPORARY TABLE tmp_Shop_Variation (
		id_variation INT NOT NULL,
		id_product INT NOT NULL,
        display_order INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Image (
		id_image INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Image_id_image
			FOREIGN KEY (id_image)
			REFERENCES Shop_Image(id_image),
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Image_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Image_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active BIT NOT NULL,
        display_order INT NOT NULL,
        rank_in_product_permutation INT NOT NULL
    );
    
    CREATE TABLE tmp_Delivery_Region (
		id_region INT NOT NULL,
        CONSTRAINT FK_tmp_Delivery_Region_id_region
			FOREIGN KEY (id_region)
			REFERENCES Shop_Region(id_region),
        active BIT NOT NULL,
        display_order INT NOT NULL,
        requires_delivery_option BIT NOT NULL DEFAULT 0
    );
    
    CREATE TABLE tmp_Currency (
		id_currency INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Currency_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
        active BIT NOT NULL,
        display_order INT NOT NULL
    );
    
    CREATE TABLE tmp_Discount (
		id_discount INT NOT NULL,
        CONSTRAINT FK_tmp_Discount_id_discount
			FOREIGN KEY (id_discount)
			REFERENCES Shop_Discount(id_discount),
        active BIT NOT NULL,
        display_order INT NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( # IF NOT EXISTS 
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		# code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		id_type INT NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		msg VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    SET v_has_filter_category = CASE WHEN a_ids_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_image = CASE WHEN a_ids_image = '' THEN 0 ELSE 1 END;
    SET v_has_filter_delivery_region = CASE WHEN a_ids_delivery_region = '' THEN 0 ELSE 1 END;
    SET v_has_filter_currency = CASE WHEN a_ids_currency = '' THEN 0 ELSE 1 END;
    SET v_has_filter_discount = CASE WHEN a_ids_discount = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
	INSERT INTO tmp_Shop_Product (
		id_category,
		id_product,
		id_permutation,
		active_category,
		active_product,
		active_permutation,
        display_order_category,
        display_order_product,
        display_order_permutation,
        rank_permutation,
        name,
        description,
        /*
		price_GBP_VAT_incl,
		price_GBP_VAT_excl,
		price_GBP_min,
		*/
        latency_manufacture_days,
		quantity_min,
		quantity_max,
		quantity_step,
		quantity_stock,
		is_subscription,
		id_unit_measurement_interval_recurrence,
		count_interval_recurrence,
        id_stripe_product,
        product_has_variations
	)
    SELECT 
		P.id_category,
		P.id_product,
		-- P.has_variations AS product_has_variations,
		PP.id_permutation,
		C.active AS active_category,
		P.active AS active_product,
		PP.active AS active_permutation,
		C.display_order AS display_order_category,
		P.display_order AS display_order_product,
		PP.display_order AS display_order_permutation,
        RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category # _in_category
		P.name,
		PP.description,
        /*
		PP.price_GBP_VAT_incl,
		PP.price_GBP_VAT_excl,
		PP.price_GBP_min,
		*/
        PP.latency_manufacture_days,
		PP.quantity_min,
		PP.quantity_max,
		PP.quantity_step,
		PP.quantity_stock,
		PP.is_subscription,
		PP.id_unit_measurement_interval_recurrence,
		PP.count_interval_recurrence,
		PP.id_stripe_product,
        P.has_variations
	FROM Shop_Product P
    INNER JOIN Shop_Product_Permutation PP
		ON P.id_product = PP.id_product
	INNER JOIN Shop_Product_Category C
		ON P.id_category = C.id_category
	WHERE
		# permutations
		(
			(
				a_get_all_product_permutation 
				OR v_has_filter_permutation AND FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
			)
			AND (a_get_inactive_permutation OR PP.active)
        )
		# categories
		AND (
			(
				a_get_all_category 
                OR v_has_filter_category AND FIND_IN_SET(P.id_category, a_ids_category) > 0
			)
			AND (a_get_inactive_category OR C.active)
		) 
		# products
		AND (
			(
				a_get_all_product 
				OR v_has_filter_product AND FIND_IN_SET(P.id_product, a_ids_product) > 0
			)
			AND (a_get_inactive_product OR P.active)
		)
    ;
    
    -- select * from tmp_Shop_Product;
    
    IF a_get_first_product_only THEN
		DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.rank_permutation > 1
		;
    END IF;
    
    INSERT INTO tmp_Shop_Product_Category (
		id_category, 
        active,
        display_order
	)
	SELECT DISTINCT C.id_category,
		C.active,
		C.display_order
	FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Product_Category C
		ON t_P.id_category = C.id_category
	ORDER BY C.display_order
	;
    
    /*
    INSERT INTO tmp_Shop_Variation (
		id_variation, id_product # , display_order
	)
    SELECT P.id_variation, P.id_product # , P.display_order
	FROM Shop_Variation V
    INNER JOIN tmp_Shop_Product t_P
		ON V.id_product = t_P.id_product
		WHERE V.active;
    */
    
    # Product Images
    INSERT INTO tmp_Shop_Image (
		id_product, 
        id_permutation,
        id_image, 
        active, 
        display_order,
        rank_in_product_permutation
	)
    SELECT id_product, 
		id_permutation,
		id_image, 
		active, 
		ROW_NUMBER() OVER (ORDER BY display_order_product_temp, display_order_image), 
		RANK() OVER (PARTITION BY id_product, id_permutation ORDER BY display_order_product_temp, display_order_image)
	FROM (
		SELECT t_P.id_product, 
			I.id_permutation,
			I.id_image, 
			I.active, 
			I.display_order AS display_order_image,
            t_P.rank_permutation AS display_order_product_temp
		FROM Shop_Image I
		INNER JOIN tmp_Shop_Product t_P
			ON I.id_product = t_P.id_product
				AND NOT t_P.product_has_variations
		UNION
		SELECT t_P.id_product, 
			I.id_permutation,
			I.id_image, 
			I.active, 
			I.display_order AS display_order_image,
            t_P.rank_permutation AS display_order_product_temp
		FROM Shop_Image I
		INNER JOIN tmp_Shop_Product t_P
			ON I.id_permutation = t_P.id_permutation
				AND t_P.product_has_variations
		) IPP
	WHERE (a_get_all_image OR a_get_first_image_only OR FIND_IN_SET(id_image, a_ids_image) > 0)
		AND (a_get_inactive_image OR IPP.active)
	;
    
    IF a_get_first_image_only THEN
		DELETE FROM tmp_Shop_Image
			WHERE rank_in_product_permutation > 1
		;
    END IF;
    
    /*
    IF v_has_filter_image THEN
		DELETE FROM tmp_Shop_Product
			WHERE id_product NOT IN (SELECT DISTINCT id_product FROM tmp_Shop_Image);
		DELETE FROM tmp_Shop_Product_Category
			WHERE id_category NOT IN (SELECT DISTINCT id_category FROM tmp_Shop_Product);
    END IF;
    */
    
    # Delivery Regions
    INSERT INTO tmp_Delivery_Region (
		id_region,
        active,
        display_order,
		requires_delivery_option
    )
    WITH RECURSIVE Recursive_CTE_Delivery_Region AS (
		SELECT 
			DR.id_region AS id_region_parent,
            NULL AS id_region_child,
            CASE WHEN FIND_IN_SET(DR.id_region, a_ids_delivery_region) > 0 THEN 1 ELSE 0 END AS requires_delivery_option
		FROM Shop_Product_Currency_Region_Link PCRL
		INNER JOIN Shop_Currency C ON PCRL.id_currency = C.id_currency
		INNER JOIN tmp_Shop_Product t_P 
			ON PCRL.id_product <=> t_P.id_product
			AND PCRL.id_permutation <=> t_P.id_permutation
		INNER JOIN Shop_Region DR ON PCRL.id_region_purchase = DR.id_region
		WHERE 
			(
				a_get_all_delivery_region
				OR FIND_IN_SET(DR.id_region, a_ids_delivery_region) > 0
			)
			AND (
				a_get_inactive_delivery_region
				OR DR.active = 1
			)
		UNION
        SELECT 
			DRB.id_region_parent,
			DRB.id_region_child,
            0 AS requires_delivery_option
		FROM Shop_Region_Branch DRB
        INNER JOIN Recursive_CTE_Delivery_Region r_DR 
			ON DRB.id_region_parent = r_DR.id_region_child
            AND (
				a_get_inactive_delivery_region
                OR DRB.active = 1
            )
	)
    SELECT
		DR.id_region,
        DR.active,
        DR.display_order,
		requires_delivery_option
	FROM Shop_Region DR
    INNER JOIN Recursive_CTE_Delivery_Region r_DR 
		ON DR.id_region = r_DR.id_region_parent
		OR DR.id_region = r_DR.id_region_child
    ;
    /*
    select * from tmp_delivery_region;
    SELECT * 
	FROM tmp_Shop_Product t_P 
	WHERE 
		/*(
			a_get_all_category 
			OR a_get_all_product
			OR a_get_all_product_permutation
		)*
		FIND_IN_SET(t_P.id_category, a_ids_category) > 0
		OR FIND_IN_SET(t_P.id_product, a_ids_product) > 0
		OR FIND_IN_SET(t_P.id_permutation, a_ids_permutation) > 0
	;
    */
    
    IF v_has_filter_delivery_region THEN
		SET v_ids_permutation_unavailable = (
			SELECT GROUP_CONCAT(t_P.id_permutation SEPARATOR ', ')
			FROM (
				SELECT * 
				FROM tmp_Shop_Product t_P 
				WHERE
					/*(
						a_get_all_category 
						OR a_get_all_produc
						OR a_get_all_product_permutation
					)*/
					FIND_IN_SET(t_P.id_category, a_ids_category) > 0
					OR FIND_IN_SET(t_P.id_product, a_ids_product) > 0
					OR FIND_IN_SET(t_P.id_permutation, a_ids_permutation) > 0
			) t_P
			LEFT JOIN (
				SELECT *
				FROM Shop_Product_Currency_Region_Link PCRL
				WHERE 
					(
						a_get_all_delivery_region
						OR FIND_IN_SET(PCRL.id_region_purchase, a_ids_delivery_region) > 0
					)
			) PCRL
				ON t_P.id_product <=> PCRL.id_product
				AND t_P.id_permutation <=> PCRL.id_permutation
			LEFT JOIN tmp_Delivery_Region t_DR
				ON PCRL.id_region_purchase = t_DR.id_region
				AND t_DR.requires_delivery_option = 1
			WHERE 
				ISNULL(t_DR.id_region)
		);
        IF NOT ISNULL(v_ids_permutation_unavailable) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				msg
			)
			VALUES (
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'PRODUCT_AVAILABILITY' LIMIT 1),
				CONCAT('Error: The following permutation IDs are not available in this region: ', v_ids_permutation_unavailable)
			);
        END IF;
        /*
		DELETE FROM tmp_Shop_Product t_P
        WHERE t_P.id_permutation NOT IN (
			SELECT
				id_permutation
			FROM Shop_Product_Currency_Region_Link PCL
            INNER JOIN tmp_Delivery_Region t_DR
				ON PCRL.id_region_purchase = t_DR.id_region
		);
        */
    END IF;
    
    -- select * from tmp_Shop_Product;
    
    # Currencies
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid) THEN
		INSERT INTO tmp_Currency (
			id_currency,
			active,
			display_order
		)
		SELECT
			C.id_currency,
			C.active,
			C.display_order
		FROM Shop_Product_Currency_Region_Link PCRL
		INNER JOIN Shop_Currency C ON PCRL.id_currency = C.id_currency
		INNER JOIN tmp_Shop_Product t_P 
			ON PCRL.id_product <=> t_P.id_product
			AND PCRL.id_permutation <=> t_P.id_permutation
		INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
		WHERE
			(
				a_get_all_currency
				OR FIND_IN_SET(C.id_currency, a_ids_currency) > 0
			)
			AND (
				a_get_inactive_currency
				OR (
					C.active
					AND PCRL.active
				)
			)
		;
		
		-- select * from tmp_Currency;
		
		IF v_has_filter_currency THEN
			SET v_ids_permutation_unavailable = (
				SELECT GROUP_CONCAT(t_P.id_permutation SEPARATOR ', ')
				FROM (
					SELECT * 
					FROM tmp_Shop_Product t_P 
					WHERE 
						/*(
							a_get_all_category 
							OR a_get_all_product
							OR a_get_all_product_permutation
						)*/
						FIND_IN_SET(t_P.id_category, a_ids_category) > 0
						OR FIND_IN_SET(t_P.id_product, a_ids_product) > 0
						OR FIND_IN_SET(t_P.id_permutation, a_ids_permutation) > 0
				) t_P
				INNER JOIN (
					SELECT *
					FROM Shop_Product_Currency_Region_Link PCRL
					WHERE 
						(
							a_get_all_currency
							OR FIND_IN_SET(PCRL.id_currency, a_ids_currency) > 0
						)
				) PCRL
					ON t_P.id_permutation = PCRL.id_permutation
				LEFT JOIN tmp_Currency t_C
					ON PCRL.id_currency = t_C.id_currency
				WHERE ISNULL(t_C.id_currency) 
			);
			IF NOT ISNULL(v_ids_permutation_unavailable) THEN
				INSERT INTO tmp_Msg_Error (
					guid,
					id_type,
					msg
				)
				VALUES (
					v_guid,
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'PRODUCT_AVAILABILITY' LIMIT 1),
					CONCAT('Error: The following permutation IDs are not available in this currency: ', v_ids_permutation_unavailable)
				);
			END IF;
			/*
			DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.id_permutation NOT IN (
				SELECT
					id_permutation
				FROM Shop_Product_Currency_Region_Link PCL
				INNER JOIN tmp_Currency t_C
					ON PCRL.id_currency = t_C.id_currency
			);
			*/
		END IF;
    END IF;
    
    # Discounts
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid) THEN
		INSERT INTO tmp_Discount (
			id_discount,
			active,
			display_order
		)
		SELECT
			D.id_discount,
			D.active,
			D.display_order
		FROM Shop_Discount D
		INNER JOIN tmp_Shop_Product t_P
			ON D.id_product = t_P.id_product
			AND D.id_permutation <=> t_P.id_permutation
		WHERE
			(
				a_get_all_discount
				OR FIND_IN_SET(D.id_discount, a_ids_discount) > 0
			)
			AND (
				a_get_inactive_discount
				OR D.active
			)
		;
    END IF;
    # select 'pre-permission results';
    # select * from tmp_Shop_Product;
    
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Shop_Product_Category LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        -- SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Shop_Product);
        SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_permutation = UE_T.id_permutation
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin;
		
        DELETE FROM tmp_Shop_Product t_P
		WHERE 
			FIND_IN_SET(t_P.id_permutation, (SELECT GROUP_CONCAT(UET.id_permutation SEPARATOR ',') FROM Shop_User_Eval_Temp UET)) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM Shop_User_Eval_Temp), '%');
            OR (
				ISNULL(t_P.can_view)
				AND (
					NOT v_has_filter_category
                    OR FIND_IN_SET(t_P.id_category, a_ids_category) = 0
				)
                AND (
					NOT v_has_filter_product
                    OR FIND_IN_SET(t_P.id_product, a_ids_product) = 0
                )
                AND (
					NOT v_has_filter_permutation 
                    OR FIND_IN_SET(t_P.id_permutation, a_ids_permutation) = 0
				)
            )
        ;
        
        # CALL p_shop_user_eval_clear_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = v_guid
        ;
    END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    SET v_now := NOW();
    
    # Categories
    SELECT 
		DISTINCT t_C.id_category,
        C.name,
        C.description,
        C.display_order
    FROM tmp_Shop_Product_Category t_C
    INNER JOIN Shop_Product_Category C
		ON t_C.id_category = C.id_category
	INNER JOIN tmp_Shop_Product t_P
		ON t_C.id_category = t_P.id_category
	ORDER BY C.display_order
	;
    
    # Products
    SELECT 
		t_P.id_product,
		t_P.id_permutation,
        t_P.name,
        t_P.description,
        P.has_variations,
        P.id_category,
        t_P.latency_manufacture_days,
        t_P.quantity_min,
        t_P.quantity_max,
        t_P.quantity_step,
        t_P.quantity_stock,
        t_P.id_stripe_product,
        t_P.is_subscription,
        RI.name AS name_interval_recurrence,
        RI.name_plural AS name_plural_interval_recurrence,
        t_P.count_interval_recurrence,
        t_P.display_order_category,
        t_P.display_order_product,
        t_P.display_order_permutation,
        IFNULL(t_P.can_view, 0),
        IFNULL(t_P.can_edit, 0),
        IFNULL(t_P.can_admin, 0)
    FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Product P
		ON t_P.id_product = P.id_product
	LEFT JOIN Shop_Interval_Recurrence RI
		ON t_P.id_unit_measurement_interval_recurrence = RI.id_interval
	ORDER BY t_P.rank_permutation
	;
    
    # Variations
    SELECT 
		V.id_variation,
        t_P.id_product,
        t_P.id_permutation,
        t_P.id_category,
        VT.code AS code_variation_type,
        VT.name AS name_variation_type,
        V.code AS code_variation,
        V.name AS name_variation,
        RANK() OVER (ORDER BY t_P.rank_permutation, PPVL.display_order) AS display_order
    FROM Shop_Variation V
	INNER JOIN Shop_Variation_Type VT
		ON V.id_type = VT.id_type
    INNER JOIN Shop_Product_Permutation_Variation_Link PPVL ON V.id_variation = PPVL.id_variation
	INNER JOIN tmp_Shop_Product t_P ON PPVL.id_permutation <=> t_P.id_permutation
	WHERE V.active
		AND PPVL.active
	;
    
    /*
    # Permutation variations output
	SELECT t_P.id_permutation, 
		t_P.id_product,
		t_P.id_category,
		id_variation
	FROM Shop_Product_Permutation_Variation_Link PPVL
	INNER JOIN tmp_Shop_Product t_P
		ON t_P.id_permutation = PPVL.id_permutation
	ORDER BY t_P.display_order
	;
    */ 
    -- select * from Shop_Product_Currency_Region_Link;
    -- select * from shop_currency;
    /*
    select * from tmp_Currency;
    select * from tmp_delivery_region;
    select * from tmp_shop_product;
    */
    
    # Product Price
	SELECT 
		PCRL.id_link AS id_price,
        t_P.id_permutation, 
		t_P.id_product,
		t_P.id_category,
        t_C.id_currency,
        C.code AS code_currency,
        C.name AS name_currency,
        C.symbol AS symbol_currency,
        t_DR.id_region,
		PCRL.price_local_VAT_incl,
		PCRL.price_local_VAT_excl,
        ROW_NUMBER() OVER(ORDER BY t_P.rank_permutation, C.display_order) AS display_order
	FROM Shop_Product_Currency_Region_Link PCRL
	INNER JOIN tmp_Shop_Product t_P
		ON PCRL.id_product <=> t_P.id_product
		AND PCRL.id_permutation <=> t_P.id_permutation
	-- INNER JOIN Shop_Product P ON PCRL.id_product = P.id_product
	INNER JOIN tmp_Currency t_C ON PCRL.id_currency = t_C.id_currency
	INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
	INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
    WHERE (
        a_get_inactive_product 
        AND a_get_inactive_permutation
        AND a_get_inactive_currency
        AND a_get_inactive_delivery_region
        OR PCRL.active
	)
	ORDER BY t_P.rank_permutation
	;
    
    /*
    # Currency
	SELECT
		DISTINCT C.id_currency,
        C.code,
        C.name,
        C.factor_from_GBP,
        t_C.display_order
	FROM Shop_Currency C
    INNER JOIN tmp_Currency t_C ON C.id_currency = t_C.id_currency
    GROUP BY C.id_currency, t_C.display_order
	ORDER BY t_C.display_order
	;
    */
    
    # Images
    SELECT 
		t_I.id_image,
        t_I.id_product,
		t_I.id_permutation,
        t_P.id_category,
        I.url,
        I.active,
        I.display_order
    FROM tmp_Shop_Image t_I
    INNER JOIN Shop_Image I
		ON t_I.id_image = I.id_image
	INNER JOIN tmp_Shop_Product t_P
		ON t_I.id_product = t_P.id_product
			AND t_I.id_permutation <=> t_P.id_permutation
	ORDER BY t_P.rank_permutation, I.display_order
	;
    
    # Delivery options
    SELECT 
		_DO.id_option,
		PDOL.id_product,
		PDOL.id_permutation,
		t_P.id_category,
		_DO.code,
		_DO.name,
		_DO.latency_delivery_min,
		_DO.latency_delivery_max,
		_DO.quantity_min,
		_DO.quantity_max,
		GROUP_CONCAT(DR.code SEPARATOR ',') AS codes_region,
		GROUP_CONCAT(DR.name SEPARATOR ',') AS names_region,
		PDOL.price_local,
		PDOL.display_order
	FROM Shop_Delivery_Option _DO
    INNER JOIN Shop_Product_Delivery_Option_Link PDOL
		ON _DO.id_option = PDOL.id_delivery_option
		AND (
			a_get_inactive_delivery_region
			OR PDOL.active
		)
	INNER JOIN tmp_Shop_Product t_P
		ON PDOL.id_product = t_P.id_product
		AND PDOL.id_permutation <=> t_P.id_permutation
	INNER JOIN tmp_Delivery_Region t_DR ON PDOL.id_region = t_DR.id_region
	INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
	WHERE (
		a_get_inactive_delivery_region
		OR _DO.active
	)
	GROUP BY t_P.id_category, t_P.id_product, PDOL.id_permutation, t_P.rank_permutation, DR.id_region, _DO.id_option, PDOL.id_link
	ORDER BY t_P.rank_permutation, PDOL.display_order
	;
    
    # Discounts
    SELECT 
		D.id_discount,
		P.id_category,
		D.id_product,
		D.id_permutation,
        DR.id_region,
        C.id_currency,
		D.code AS code_discount,
		D.name AS name_discount,
		D.multiplier,
        D.subtractor,
        D.apply_multiplier_first,
		D.quantity_min,
		D.quantity_max,
		D.date_start,
		D.date_end,
        GROUP_CONCAT(DR.code) AS codes_region,
        GROUP_CONCAT(DR.name) AS names_region,
        GROUP_CONCAT(C.code) AS codes_currency,
        GROUP_CONCAT(C.name) AS names_currency,
		ROW_NUMBER() OVER(ORDER BY D.display_order) AS display_order
	FROM tmp_Discount t_D
    INNER JOIN Shop_Discount D ON t_D.id_discount = D.id_discount
    INNER JOIN Shop_Product P ON D.id_product = P.id_product
	INNER JOIN tmp_Shop_Product t_P
		ON D.id_product = t_P.id_product
		-- AND D.id_permutation <=> t_P.id_permutation
	INNER JOIN Shop_Discount_Region_Currency_Link DRCL
		ON D.id_discount = DRCL.id_discount
	INNER JOIN tmp_Delivery_Region t_DR ON DRCL.id_region = t_DR.id_region
	INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
	INNER JOIN tmp_Currency t_C ON DRCL.id_currency = t_C.id_currency
	INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
    GROUP BY D.id_discount, DR.id_region, C.id_currency
    ORDER BY D.display_order, DR.display_order, C.display_order
	;
    
    /*
    # Delivery Regions
    SELECT 
		t_DR.id_region,
		t_P.id_category,
		t_P.id_product,
		t_P.id_permutation,
		DR.code,
		DR.name
	FROM tmp_Delivery_Region t_DR
    INNER JOIN Shop_Delivery_Region DR ON t_DR.id_region = DR.id_region
	INNER JOIN Shop_Product_Region_Currency_Link PDRL 
		ON DR.id_region = PDRL.id_region 
        AND (
			a_get_inactive_delivery_region 
            OR PDRL.active
		)
	INNER JOIN tmp_Shop_Product t_P
		ON PDRL.id_product = t_P.id_product
		AND PDRL.id_permutation <=> t_P.id_permutation
	INNER JOIN tmp_Currency t_C ON PDRL.id_currency = t_C.id_currency
	ORDER BY t_DR.display_order
	;
    */
    
    # Errors
    SELECT 
		t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
    
    /*
    # Return arguments for test
    SELECT
	a_ids_category,
	a_get_inactive_category,
	a_ids_product,
	a_get_inactive_product,
    a_get_first_product_only,
    a_get_all_product,
	a_ids_image,
	a_get_inactive_image,
    a_get_first_image_only,
    a_get_all_image
    ;
    */
    
    # select 'other outputs';
    # select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Discount;
    DROP TABLE IF EXISTS tmp_Currency;
    DROP TABLE IF EXISTS tmp_Delivery_Region;
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Product_Category;
END ;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_shop_get_many_region` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_shop_get_many_region`(
	IN a_get_inactive_region BIT
)
BEGIN
	IF a_get_inactive_region IS NULL THEN
		SET a_get_inactive_region = 0;
    END IF;
    
	SELECT 
		R.id_region,
        R.code,
        R.name,
        R.active,
        R.display_order
	FROM Shop_Region R
	WHERE a_get_inactive_region
		OR R.active
	ORDER BY R.display_order
	;
END ;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_shop_get_many_stripe_price_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_shop_get_many_stripe_price_new`(
	IN a_id_user INT
)
BEGIN
    DECLARE v_has_filter_user BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid BINARY(36);
    
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	SET v_guid = UUID();
    

    
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
    
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User(
		id_user INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product_Currency_Link (
		id_link INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_link
			FOREIGN KEY (id_link)
			REFERENCES Shop_Product_Currency_Link(id_link),
        id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
        id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_currency INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BIT NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( # IF NOT EXISTS 
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		/*
        id_type INT NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		*/
		msg VARCHAR(4000) NOT NULL
    );
    
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
    
    
    
    -- User permissions
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user LIKE CONCAT('%', a_id_user, '%')
			AND active
		LIMIT 1
        ;
        
        SET v_has_filter_user = EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1);
        SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
    END IF;
    IF NOT v_has_filter_user THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			code,
            msg
		)
        VALUES (
			v_guid,
			v_code_error_data, 
            'Valid user ID not provided.'
		)
        ;
    END IF;
    
    -- Get products
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		INSERT INTO tmp_Shop_Product_Currency_Link (
			id_link,
            id_product,
            id_permutation,
            id_currency,
            active
		)
        SELECT id_link,
            id_product,
            id_permutation,
            id_currency,
            active
		FROM Shop_Product_Currency_Link
		WHERE ISNULL(id_stripe_price)
			AND active
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		# SELECT * FROM tmp_Msg_Error LIMIT 1;
		CALL p_shop_user_eval (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		# a_ids_access_level
			(SELECT GROUP_CONCAT(DISTINCT id_product SEPARATOR ',') FROM tmp_Shop_Product_Currency_Link), #  (SELECT DISTINCT id_product FROM tmp_Shop_Product_Currency_Link) calc_PCL)		# a_ids_product
            (SELECT GROUP_CONCAT(DISTINCT id_permutation SEPARATOR ',') FROM tmp_Shop_Product_Currency_Link) # a_ids_permutation
		);
		# SELECT * FROM tmp_Msg_Error LIMIT 1;
        
        IF EXISTS (SELECT can_admin FROM Shop_User_Eval_Temp WHERE guid = v_guid AND NOT can_admin LIMIT 1) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_permission, 
				'User ID does not have permission to get all new stripe prices.'
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE guid = v_guid
        ;
    END IF;
    
    
    
    -- Returns
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product_Currency_Link;
	END IF;
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    
	SELECT t_PCL.id_product,
		t_PCL.id_permutation,
		P.price_GBP_full * C.factor_from_GBP AS unit_price,
		C.code AS code_currency,
		P.id_stripe_product,
		P.is_subscription,
		LOWER(RI.code) AS name_recurring_interval,
		P.count_interval_recurrence
	FROM tmp_Shop_Product_Currency_Link t_PCL
	INNER JOIN Shop_Product P
		ON t_PCL.id_product = P.id_product
		AND P.active
	INNER JOIN Shop_Interval_Recurrence RI
		ON P.id_unit_measurement_interval_recurrence = RI.id_interval
		AND RI.active
	INNER JOIN Shop_Currency C
		ON t_PCL.id_currency = C.id_currency
		AND C.active
	WHERE t_PCL.active
	;
    
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    WHERE guid = v_guid
    ;
    
    
    /*
    # Return arguments for test
    SELECT
		a_id_user
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
END ;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_shop_get_many_stripe_product_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_shop_get_many_stripe_product_new`(
	IN a_id_user INT
)
BEGIN
    DECLARE v_has_filter_user BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid BINARY(36);
    
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	SET v_guid = UUID();
    
    
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
    
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User(
		id_user INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product (
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active BIT NOT NULL,
        display_order_product INT NOT NULL,
        display_order_permutation INT NOT NULL,
        name VARCHAR(200) NOT NULL,
        description VARCHAR(4000) NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( # IF NOT EXISTS 
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		/*
        id_type INT NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		*/
		msg VARCHAR(4000) NOT NULL
    );
    
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
    
    
    
    -- User
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user LIKE CONCAT('%', a_id_user, '%')
			AND active
		LIMIT 1
        ;
        
        SET v_has_filter_user = EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1);
        SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
    END IF;
    
    IF NOT v_has_filter_user THEN
		INSERT INTO tmp_Msg_Error (
			guid,
            code,
            msg
		)
        VALUES (
			v_guid,
			v_code_error_data, 
            'User ID not valid.'
		)
        ;
    END IF;
    
    -- Get products
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		INSERT INTO tmp_Shop_Product (
			id_product,
            id_permutation,
            active,
            display_order_product,
            display_order_permutation,
            name,
            description
		)
        SELECT id_product,
			id_permutation,
			active,
            display_order_product,
            display_order_permutation,
            name,
            description
		FROM (
			SELECT id_product,
				NULL AS id_permutation,
				active,
                display_order AS display_order_product,
                NULL AS display_order_permutation,
                name,
                description,
                id_stripe_product
			FROM Shop_Product P
			UNION
			SELECT t_PPPV.id_product,
				id_permutation,
				t_PPPV.active,
                display_order_product,
                display_order_permutation,
                CONCAT(P.name, ': ', names_variation) AS name,
                CONCAT(P.description, ' With variations: ', type_name_pairs_variation) AS description,
                t_PPPV.id_stripe_product
			FROM (
				SELECT P.id_product,
					PP.id_permutation,
					PP.active,
					P.display_order AS display_order_product,
					PP.display_order AS display_order_permutation,
					GROUP_CONCAT(V.name SEPARATOR ' ') AS names_variation,
					GROUP_CONCAT(CONCAT(VT.name, ': ', V.name) SEPARATOR ', ') AS type_name_pairs_variation,
					PP.id_stripe_product
                FROM Shop_Product_Permutation PP
				INNER JOIN Shop_Product P
					ON PP.id_product = P.id_product
						AND P.active
				INNER JOIN Shop_Product_Permutation_Variation_Link PPVL
					ON PP.id_permutation = PPVL.id_permutation
						AND PPVL.active
				INNER JOIN Shop_Variation V
					ON PPVL.id_variation = V.id_variation
						AND V.active
				INNER JOIN Shop_Variation_Type VT
					ON V.id_type = VT.id_type
						AND VT.active
				GROUP BY id_product, id_permutation -- , VT.id_type, V.id_variation
			) t_PPPV
			INNER JOIN Shop_Product P
				ON t_PPPV.id_product = P.id_product
		) t_PPP
		WHERE ISNULL(id_stripe_product)
			AND active
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_shop_user_eval (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		# a_ids_access_level
			(SELECT GROUP_CONCAT(id_product SEPARATOR ',') From tmp_Shop_Product),		# a_ids_product
			(SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') From tmp_Shop_Product)		# a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
		);
        
        IF EXISTS (SELECT can_admin FROM Shop_User_Eval_Temp WHERE guid = v_guid AND NOT can_admin) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_permission, 
				'User ID does not have permission to get all new stripe products.'
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE guid = v_guid
        ;
    END IF;
    
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product;
	END IF;
    
	SELECT id_product,
		id_permutation,
		name,
		description
	FROM tmp_Shop_Product
	ORDER BY display_order_product, display_order_permutation
	;
	SELECT PP.id_permutation,
		V.id_variation,
		V.name AS name_variation,
		VT.id_type AS id_type_variation,
		VT.name as name_variation_type
	FROM tmp_Shop_Product t_P
	INNER JOIN Shop_Product_Permutation PP
		ON t_P.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product_Permutation_Variation_Link PPVL
		ON PP.id_permutation = PPVL.id_permutation
			AND PPVL.active
	INNER JOIN Shop_Variation V
		ON PPVL.id_variation = V.id_variation
			AND V.active
	INNER JOIN Shop_Variation_Type VT
		ON V.id_type = VT.id_type
			AND VT.active
	;
    
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    WHERE guid = v_guid
    ;
    
    
    /*
    # Return arguments for test
    SELECT
		a_id_user
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
END ;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_shop_get_many_user_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_shop_get_many_user_order`(
	IN a_id_user INT,
    IN a_ids_order VARCHAR(4000),
    IN a_n_order_max INT,
	IN a_id_checkout_session VARCHAR(200)
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_session BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid BINARY(36);
    
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	SET v_guid = UUID();
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_ids_order IS NULL THEN
		SET a_ids_order = '';
	ELSE
		SET a_ids_order = TRIM(a_ids_order);
    END IF;
	IF a_n_order_max IS NULL THEN
		SET a_n_order_max = 1;
    END IF;
	IF a_id_checkout_session IS NULL THEN
		SET a_id_checkout_session = '';
	ELSE
		SET a_id_checkout_session = TRIM(a_id_checkout_session);
    END IF;
    
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Order;
    
    CREATE TABLE tmp_Shop_User(
		id_user INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Order (
		id_order INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Order_id_order
			FOREIGN KEY (id_order)
			REFERENCES Shop_User_Order(id_order),
        active BIT NOT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		# id_type INT NOT NULL,
		# CONSTRAINT FK_tmp_Msg_Error_id_type FOREIGN KEY (id_type)
		# 	REFERENCES Shop_Msg_Error_Type (id_type),
		code VARCHAR(50),
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
	SET a_ids_order = REPLACE(a_ids_order, '|', ',');
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_session = CASE WHEN a_id_checkout_session = '' THEN 0 ELSE 1 END;
    
    -- User
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF v_has_filter_user THEN
			INSERT INTO tmp_Shop_User (
				id_user,
				active
			)
			SELECT id_user,
				active
			FROM Shop_User
			WHERE id_user LIKE CONCAT('%', a_id_user, '%')
				AND active
			LIMIT 1
			;
			
			SET v_has_filter_user = EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1);
			SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
		END IF;
    END IF;
	IF NOT v_has_filter_user THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			code,
			msg
		)
		VALUES (
			v_guid,
			v_code_error_data, 
			'User ID not valid.'
		)
		;
	END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_shop_user_eval (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_USER' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' AND active),		# a_ids_access_level
			'',		# a_ids_product
            ''		# a_ids_permutation
		);
        
        IF NOT (SELECT can_edit FROM Shop_User_Eval_Temp WHERE guid = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_permission, 
				'User ID does not have permission to access orders.'
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE guid = v_guid
        ;
    END IF;
    
    -- Invalid Orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		# Invalid Order IDs
		IF EXISTS (SELECT * FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND v_has_filter_order AND FIND_IN_SET(id_order, a_ids_order) > 0) THEN  # id_order LIKE CONCAT('%', a_ids_order, '%') LIMIT 1) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
                msg
            )
            VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('You do not have access to the following order IDs: ', (SELECT GROUP_CONCAT(id_order SEPARATOR ', ') FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND FIND_IN_SET(id_order, a_ids_order) > 0)) # id_order LIKE CONCAT('%', a_ids_order, '%'))) # AND v_has_filter_order  # filtered by parent condition
			)
            ;
        END IF;
        # Invalid Checkout Session IDs
		IF EXISTS (SELECT * FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND v_has_filter_session AND id_checkout_session = a_id_checkout_session) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
                msg
            )
            VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('You do not have access to the following checkout session IDs: ', (SELECT GROUP_CONCAT(id_order SEPARATOR ', ') FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND id_checkout_session = a_id_checkout_session)) # AND v_has_filter_order  # filtered by parent condition
			)
            ;
        END IF;
    END IF;
    
    -- Valid Orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
    
		INSERT INTO tmp_Shop_Order (
			id_order, 
			active
		)
		SELECT UO.id_order,
			UO.active
		FROM Shop_User_Order UO
		INNER JOIN tmp_Shop_User t_U
			ON UO.id_user = t_U.id_user
				AND t_U.active
		WHERE ((NOT v_has_filter_order OR FIND_IN_SET(UO.id_order, a_ids_order) > 0) # UO.id_order LIKE CONCAT('%', a_ids_order, '%'))
			OR (NOT v_has_filter_session OR UO.id_checkout_session = a_id_checkout_session))
			AND UO.active
		;
    END IF;
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    SELECT t_O.id_order,
		UOPL.id_product,
		UOPL.id_permutation,
        UOPL.quantity
	FROM tmp_Shop_Order t_O
	INNER JOIN Shop_User_Order UO
		ON t_O.id_order = UO.id_order
	INNER JOIN Shop_User_Order_Product_Link UOPL
		ON UO.id_order = UOPL.id_order
	WHERE t_O.active
    ;
    
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    WHERE guid = v_guid
    ;
    
    
    /*
    # Return arguments for test
    SELECT
		a_id_user,
		a_ids_order,
		a_n_order_max,
		a_id_checkout_session
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Order;
END ;;
DELIMITER ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_shop_user_eval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_shop_user_eval`(
	IN a_guid BINARY(36),
    IN a_id_user INT,
    IN a_get_inactive_users BIT,
    IN a_ids_permission VARCHAR(500),
    IN a_ids_access_level VARCHAR(100),
    IN a_ids_permutation VARCHAR(4000)
)
BEGIN
	-- Variable declaration
    DECLARE v_has_filter_permission BIT;
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_access_level BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_id_permission_product INT;
    DECLARE v_id_permission INT;
    -- DECLARE v_ids_product VARCHAR(500);
    DECLARE v_id_access_level_view INT;
    # DECLARE v_id_access_level_product_required INT;
    DECLARE v_priority_access_level_view INT;
    DECLARE v_priority_access_level_edit INT;
    DECLARE v_priority_access_level_admin INT;
    DECLARE v_id_access_level INT;
    DECLARE v_priority_access_level INT;
    DECLARE v_now DATETIME;
	DECLARE v_ids_row_delete VARCHAR(500);
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_id_error_data INT;
    DECLARE v_code_error_permission VARCHAR(200);
    
    SET v_id_error_data = 1;
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = v_id_error_data);
    
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
    
	-- Clear previous proc results
	# DROP TABLE IF EXISTS tmp_User_Role_Link;
	# DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
	DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
	# DROP TABLE IF EXISTS Shop_User_Eval_Temp;
    
    
	-- Parse arguments + get default values
    /*
	IF a_guid IS NULL THEN
		SET a_guid = UUID();
	END IF;
    */
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_inactive_users IS NULL THEN
		SET a_get_inactive_users = 0;
    END IF;
    /*
	IF a_get_user_permissions IS NULL THEN
		SET a_get_user_permissions = 0;
    END IF;
    */
	IF a_ids_permission IS NULL THEN
		SET a_ids_permission = '';
	ELSE
		SET a_ids_permission = TRIM(a_ids_permission);
    END IF;
	IF a_ids_access_level IS NULL THEN
		SET a_ids_access_level = '';
	ELSE
		SET a_ids_access_level = TRIM(a_ids_access_level);
    END IF;
    IF a_ids_permutation IS NULL THEN
		SET a_ids_permutation = '';
	ELSE
		SET a_ids_permutation = TRIM(a_ids_permutation);
    END IF;
    
    -- Permanent Table
	CREATE TABLE IF NOT EXISTS Shop_User_Eval_Temp (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		guid BINARY(36) NOT NULL,
		id_user INT,
		id_permission_required INT NOT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_permission_required
			FOREIGN KEY (id_permission_required)
			REFERENCES Shop_Permission (id_permission),
		/*
		id_access_level_required INT NOT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_access_level_required
			FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		*/
		priority_access_level_required INT NOT NULL,
        /*
		CONSTRAINT FK_Shop_User_Eval_Temp_priority_access_level_required
			FOREIGN KEY (priority_access_level_required)
			REFERENCES Shop_Access_Level (priority),
		*/
		id_product INT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_product
			FOREIGN KEY (id_product)
			REFERENCES partsltd_prod.Shop_Product (id_product),
		id_permutation INT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES partsltd_prod.Shop_Product_Permutation (id_permutation),
		is_super_user BIT NULL,
		priority_access_level_user INT NULL,
        /*
		CONSTRAINT FK_Shop_User_Eval_Temp_priority_access_level_minimum
			FOREIGN KEY (priority_access_level_minimum)
			REFERENCES Shop_Access_Level (priority)
		*/
		can_view BIT,
		can_edit BIT,
		can_admin BIT -- DEFAULT 0
	);
		
	CREATE TABLE IF NOT EXISTS tmp_Shop_Product_p_Shop_User_Eval (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		id_product INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_product FOREIGN KEY (id_product)
			REFERENCES partsltd_prod.Shop_Product (id_product),
		id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_permutation FOREIGN KEY (id_permutation)
			REFERENCES partsltd_prod.Shop_Product_Permutation (id_permutation),
		id_access_level_required INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_access_level_required FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		guid BINARY(36) NOT NULL,
        rank_permutation INT NOT NULL
	);
		
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
		code VARCHAR(50),
        msg VARCHAR(4000) NOT NULL
	);
		
    # select * from Shop_Msg_Error_Type;
    
    -- Parse filters
	IF a_guid IS NULL OR EXISTS (SELECT * FROM Shop_User_Eval_Temp WHERE a_guid = guid) THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			code,
            msg
		)
        VALUES (
			a_guid,
			v_code_error_data, 
            'Invalid guid argument.'
		)
        ;
	END IF;
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
	SET a_ids_permission = REPLACE(a_ids_permission, '|', ',');
    SET v_has_filter_permission = CASE WHEN a_ids_permission = '' THEN 0 ELSE 1 END;
	SET a_ids_access_level = REPLACE(a_ids_access_level, '|', ',');
    SET v_has_filter_access_level = CASE WHEN a_ids_access_level = '' THEN 0 ELSE 1 END;
	SET a_ids_permutation = REPLACE(a_ids_permutation, '|', ',');
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_id_access_level_view = (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_priority_access_level_view = (SELECT priority FROM Shop_Access_Level WHERE id_access_level = v_id_access_level_view);
    SET v_priority_access_level_edit = (SELECT priority FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    SET v_priority_access_level_admin = (SELECT priority FROM Shop_Access_Level WHERE code = 'ADMIN' LIMIT 1);
    
    /*
    select v_priority_access_level_view,
		v_priority_access_level_edit,
        v_priority_access_level_admin
	;
    */
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_access_level THEN
			CALL p_split(a_ids_access_level, ',');
			SET v_id_access_level := (
				SELECT AL.id_access_level 
				FROM Split_Temp ST 
				INNER JOIN Shop_Access_Level AL 
					ON CONVERT(ST.substring, DECIMAL(10,0)) = AL.id_access_level
						AND AL.active 
				ORDER BY AL.priority ASC 
				LIMIT 1
			);
			DROP TABLE Split_Temp;
			IF 0 = v_id_access_level OR v_id_access_level <=> NULL THEN
				# SET v_has_filter_access_level = 0;
                INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				VALUES (
					a_guid,	
					v_code_error_data, 
					'Access level ID not found.'
				)
				;
			END IF;
        /*
		END IF;
		IF NOT v_has_filter_access_level THEN
		*/
        ELSE
			SET v_id_access_level = v_id_access_level_view;
		END IF;
	END IF;
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_permutation THEN
			INSERT INTO tmp_Shop_Product_p_Shop_User_Eval (
				id_product,
                id_permutation,
				id_access_level_required,
				guid,
                rank_permutation
			)
			SELECT 
				PP.id_product,
                PP.id_permutation,
				PP.id_access_level_required,
				a_guid,
				RANK() OVER (ORDER BY PP.id_product, PP.id_permutation, AL.priority) AS rank_permutation
			FROM Shop_Product_Permutation PP
            INNER JOIN Shop_Access_Level AL
				ON PP.id_access_level_required = AL.id_access_level
					AND AL.active
			WHERE FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
				# AND P.active # not worried as we want users to be able to see their order history
			;
            /*
            DELETE FROM tmp_Shop_Product_p_Shop_User_Eval
            WHERE rank_permutation > 1
            ;
            */
			SET v_has_filter_permutation = EXISTS (SELECT * FROM tmp_Shop_Product_p_Shop_User_Eval WHERE a_guid = guid);
		END IF;
        
		IF v_has_filter_permission THEN
            # Invalid permission IDs
            IF EXISTS (SELECT id_permission FROM Shop_Permission WHERE FIND_IN_SET(id_permission, a_ids_permission) > 0 AND NOT active) THEN
				INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				VALUES (
					a_guid,
					v_code_error_data, 
					CONCAT('The following permissions are no longer active: ', (SELECT GROUP_CONCAT(name SEPARATOR ', ') FROM Shop_Permission WHERE FIND_IN_SET(id_permission, a_ids_permission) > 0 AND NOT active))
				)
				;
            END IF;
		END IF;
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_user THEN
			SET a_id_user := (SELECT id_user FROM Shop_User WHERE id_user LIKE a_id_user AND active);
            SET v_has_filter_user = NOT (a_id_user <=> NULL);
            IF NOT v_has_filter_user THEN
                INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				VALUES (
					a_guid,
					v_code_error_data, 
					'User ID not found.'
				)
				;
            END IF;
        END IF;
	END IF;
    
    -- Get users
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		INSERT INTO Shop_User_Eval_Temp (
			guid,
			id_user,
			id_permission_required,
			priority_access_level_required
            /*
            priority_access_level_user,
			is_super_user,
			can_view,
			can_edit,
			can_admin
            */
		)
		SELECT a_guid,
			a_id_user,
			P.id_permission,
			AL.priority
		FROM partsltd_prod.Shop_Permission P
		INNER JOIN Shop_Access_Level AL
			ON P.id_access_level_required = AL.id_access_level
				AND AL.active
		WHERE FIND_IN_SET(P.id_permission, a_ids_permission) > 0
		;
        
		IF v_has_filter_permutation THEN
			SET v_ids_row_delete := (SELECT GROUP_CONCAT(id_row SEPARATOR ',') FROM Shop_User_Eval_Temp WHERE a_guid = guid);
            
			INSERT INTO Shop_User_Eval_Temp (
				guid,
				id_user,
				id_permission_required,
				id_product,
                id_permutation,
				priority_access_level_required
			)
			SELECT UE_T.guid, 
				UE_T.id_user, 
                UE_T.id_permission_required, 
                t_P.id_product, 
                t_P.id_permutation, 
                CASE WHEN UE_T.priority_access_level_required < AL.priority THEN UE_T.priority_access_level_required ELSE AL.priority END -- UE_T.priority_access_level_required
			FROM tmp_Shop_Product_p_Shop_User_Eval t_P
            INNER JOIN Shop_Access_Level AL
				ON t_P.id_access_leveL_required = AL.id_access_level
					AND AL.active
			CROSS JOIN Shop_User_Eval_Temp UE_T
				ON a_id_user = UE_T.id_user
				WHERE a_guid = t_P.guid
			;
            
			DELETE FROM Shop_User_Eval_Temp 
			WHERE FIND_IN_SET(id_row, v_ids_row_delete) > 0
			;
		END IF;
        
		/*
		INSERT INTO Shop_User_Eval_Temp (
			guid,
			id_user,
			id_permission_required,
			# id_access_level_required,
			priority_access_level_required,
			priority_access_level_user,
			is_super_user
			/*
			can_view,
			can_edit,
			can_admin
			*
		)
		SELECT a_guid,
			U.id_user,
			P.id_permission,
			AL.priority,
			/*
			v_id_permission,
			v_id_access_level,
			*
			MIN(AL.priority),
			U.is_super_user
			/*
			CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_view THEN 1 ELSE 0 END END,
			CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_edit THEN 1 ELSE 0 END END,
			CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_admin THEN 1 ELSE 0 END END
			*
		FROM partsltd_prod.Shop_User U
		INNER JOIN Shop_User_Role_Link URL
			ON U.id_user = URL.id_user
				AND URL.active
		INNER JOIN Shop_Role_Permission_Link RPL
			ON URL.id_role = RPL.id_role
				AND RPL.active
		INNER JOIN Shop_Permission P
			ON RPL.id_permission = P.id_permission
				AND P.active
		INNER JOIN Shop_Access_Level AL
			ON RPL.id_access_level = AL.id_access_level
				AND AL.active
		WHERE U.id_user = a_id_user
			AND (a_get_inactive_users OR U.active)
			AND FIND_IN_SET(P.id_permission, a_ids_permission) > 0
			# AND v_id_permission = P.id_permission
			# AND v_id_access_level = AL.id_access_leveld
		GROUP BY U.id_user, P.id_permission # , is_super_user
		;
		*/
		
        IF v_has_filter_user THEN
			UPDATE Shop_User_Eval_Temp UE_T
			INNER JOIN Shop_User U
				ON UE_T.id_user = U.id_user
					AND U.active
			INNER JOIN Shop_User_Role_Link URL
				ON U.id_user = URL.id_user
					AND URL.active
			INNER JOIN Shop_Role_Permission_Link RPL
				ON URL.id_role = RPL.id_role
					AND RPL.active
			INNER JOIN Shop_Access_Level AL
				ON RPL.id_access_level = AL.id_access_level
					AND AL.active
			SET UE_T.priority_access_level_user = AL.priority,
				UE_T.is_super_user = U.is_super_user,
				UE_T.can_view = CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN ISNULL(AL.priority) THEN 1 ELSE CASE WHEN AL.priority <= v_priority_access_level_view AND AL.priority <= UE_T.priority_access_level_required THEN 1 ELSE 0 END END END,
				UE_T.can_edit = CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_edit AND AL.priority <= UE_T.priority_access_level_required THEN 1 ELSE 0 END END,
				UE_T.can_admin = CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_admin AND AL.priority <= UE_T.priority_access_level_required THEN 1 ELSE 0 END END
			WHERE UE_T.guid = a_guid
				AND UE_T.id_user = a_id_user
				AND RPL.id_permission = UE_T.id_permission_required
			# GROUP BY UE_T.id_user
			;
        ELSE
			UPDATE Shop_User_Eval_Temp UE_T
			SET UE_T.priority_access_level_user = v_priority_access_level_view,
				UE_T.is_super_user = 0,
				UE_T.can_view = (v_priority_access_level_view <= UE_T.priority_access_level_required),
				UE_T.can_edit = 0,
				UE_T.can_admin = 0
			WHERE UE_T.guid = a_guid
				AND UE_T.id_user = a_id_user
			# GROUP BY UE_T.id_user
			;
        END IF;
    END IF;
    
    -- Clean up
	DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
    # DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
    # DROP TABLE IF EXISTS tmp_Msg_Error;
END ;;
DELIMITER ;;
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

-- Dump completed on 2024-04-28 19:04:05
