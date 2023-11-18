-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: familia
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `filhos`
--

DROP TABLE IF EXISTS `filhos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filhos` (
  `filho_id` int(11) NOT NULL AUTO_INCREMENT,
  `filho_nome` varchar(20) NOT NULL,
  `pai` int(11) DEFAULT NULL,
  PRIMARY KEY (`filho_id`),
  KEY `fk_pai` (`pai`),
  CONSTRAINT `fk_pai` FOREIGN KEY (`pai`) REFERENCES `pais` (`pai_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filhos`
--

LOCK TABLES `filhos` WRITE;
/*!40000 ALTER TABLE `filhos` DISABLE KEYS */;
INSERT  IGNORE INTO `filhos` VALUES (1,'Zezinho',1),(2,'Zefinha',1),(3,'Joãozinho',2),(4,'Joaninha',2),(5,'Chiquinho',3),(6,'Chiquinha',3);
/*!40000 ALTER TABLE `filhos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `pai_id` int(11) NOT NULL AUTO_INCREMENT,
  `pai_nome` varchar(20) NOT NULL,
  PRIMARY KEY (`pai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT  IGNORE INTO `pais` VALUES (1,'José'),(2,'João'),(3,'Francisco');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'familia'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alterafilho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`rute`@`localhost` PROCEDURE `alterafilho`(in nome varchar(20),in papi int, in id int)
begin
update filhos set filho_nome=nome,pai=papi where filho_id=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alterapai` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`rute`@`localhost` PROCEDURE `alterapai`(in nome varchar(20), in id int)
begin
update pais set pai_nome=nome where pai_id=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `criafilho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`rute`@`localhost` PROCEDURE `criafilho`(in nome varchar(20),in papi int)
begin
insert into filhos(filho_nome,pai)values(nome,papi);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `criapai` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`rute`@`localhost` PROCEDURE `criapai`(in nome varchar(20))
begin
insert into pais(pai_nome)values(nome);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `excluifilho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`rute`@`localhost` PROCEDURE `excluifilho`(in id int)
begin delete from filhos where filho_id=id; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `excluipai` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`rute`@`localhost` PROCEDURE `excluipai`(in id int)
begin
delete from pais where pai_id=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrafilhos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`rute`@`localhost` PROCEDURE `mostrafilhos`()
begin
select * from filhos;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrapais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`rute`@`localhost` PROCEDURE `mostrapais`()
begin
select * from pais;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
CREATE USER IF NOT EXISTS `rute`@`localhost` IDENTIFIED BY PASSWORD 'ruterute';
CREATE USER IF NOT EXISTS `mostrador`@`localhost` IDENTIFIED BY PASSWORD '123456';
CREATE USER IF NOT EXISTS `alterador`@`localhost` IDENTIFIED BY PASSWORD '123456';
CREATE USER IF NOT EXISTS `criador`@`localhost` IDENTIFIED BY PASSWORD '123456';
CREATE USER IF NOT EXISTS `destruidor`@`localhost` IDENTIFIED BY PASSWORD '123456';
CREATE USER IF NOT EXISTS `excluidor`@`localhost` IDENTIFIED BY PASSWORD '123456';
SELECT COALESCE(CURRENT_ROLE(),'NONE') into @current_role;
CREATE ROLE IF NOT EXISTS mariadb_dump_import_role;
GRANT mariadb_dump_import_role TO CURRENT_USER();
SET ROLE mariadb_dump_import_role;
GRANT USAGE ON *.* TO `mariadb.sys`@`localhost`;
GRANT SELECT, DELETE ON `mysql`.`global_priv` TO `mariadb.sys`@`localhost`;
/*M!100005 SET DEFAULT ROLE NONE FOR 'mariadb.sys'@'localhost' */;
/*!80001 ALTER USER 'mariadb.sys'@'localhost' DEFAULT ROLE NONE */;

/*M!100005 SET DEFAULT ROLE NONE FOR 'root'@'localhost' */;
/*!80001 ALTER USER 'root'@'localhost' DEFAULT ROLE NONE */;
GRANT ALL PRIVILEGES ON *.* TO `mysql`@`localhost` IDENTIFIED VIA mysql_native_password USING 'invalid' OR unix_socket WITH GRANT OPTION;
/*M!100005 SET DEFAULT ROLE NONE FOR 'mysql'@'localhost' */;
/*!80001 ALTER USER 'mysql'@'localhost' DEFAULT ROLE NONE */;

/*M!100005 SET DEFAULT ROLE NONE FOR 'gobira'@'localhost' */;
/*!80001 ALTER USER 'gobira'@'localhost' DEFAULT ROLE NONE */;


/*M!100005 SET DEFAULT ROLE NONE FOR 'zeruela'@'%' */;
/*!80001 ALTER USER 'zeruela'@'%' DEFAULT ROLE NONE */;


/*M!100005 SET DEFAULT ROLE NONE FOR 'estagiario'@'%' */;
/*!80001 ALTER USER 'estagiario'@'%' DEFAULT ROLE NONE */;


/*M!100005 SET DEFAULT ROLE NONE FOR 'apenasve'@'localhost' */;
/*!80001 ALTER USER 'apenasve'@'localhost' DEFAULT ROLE NONE */;

/*M!100005 SET DEFAULT ROLE NONE FOR 'apenascria'@'localhost' */;
/*!80001 ALTER USER 'apenascria'@'localhost' DEFAULT ROLE NONE */;

/*M!100005 SET DEFAULT ROLE NONE FOR 'apenasmuda'@'localhost' */;
/*!80001 ALTER USER 'apenasmuda'@'localhost' DEFAULT ROLE NONE */;

/*M!100005 SET DEFAULT ROLE NONE FOR 'apenasapaga'@'localhost' */;
/*!80001 ALTER USER 'apenasapaga'@'localhost' DEFAULT ROLE NONE */;
GRANT ALL PRIVILEGES ON *.* TO `rute`@`localhost` IDENTIFIED BY PASSWORD 'ruterute' WITH GRANT OPTION;
/*M!100005 SET DEFAULT ROLE NONE FOR 'rute'@'localhost' */;
/*!80001 ALTER USER 'rute'@'localhost' DEFAULT ROLE NONE */;
GRANT USAGE ON *.* TO `mostrador`@`localhost` IDENTIFIED BY PASSWORD '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9';
GRANT EXECUTE ON PROCEDURE `familia`.`mostrafilhos` TO `mostrador`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`mostrapais` TO `mostrador`@`localhost`;
/*M!100005 SET DEFAULT ROLE NONE FOR 'mostrador'@'localhost' */;
/*!80001 ALTER USER 'mostrador'@'localhost' DEFAULT ROLE NONE */;
GRANT USAGE ON *.* TO `alterador`@`localhost` IDENTIFIED BY PASSWORD '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9';
GRANT EXECUTE ON PROCEDURE `familia`.`alterapai` TO `alterador`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`mostrapais` TO `alterador`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`alterafilho` TO `alterador`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`mostrafilhos` TO `alterador`@`localhost`;
/*M!100005 SET DEFAULT ROLE NONE FOR 'alterador'@'localhost' */;
/*!80001 ALTER USER 'alterador'@'localhost' DEFAULT ROLE NONE */;
GRANT USAGE ON *.* TO `criador`@`localhost` IDENTIFIED BY PASSWORD '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9';
GRANT EXECUTE ON PROCEDURE `familia`.`criafilho` TO `criador`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`criapai` TO `criador`@`localhost`;
/*M!100005 SET DEFAULT ROLE NONE FOR 'criador'@'localhost' */;
/*!80001 ALTER USER 'criador'@'localhost' DEFAULT ROLE NONE */;
GRANT USAGE ON *.* TO `destruidor`@`localhost` IDENTIFIED BY PASSWORD '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9';
GRANT EXECUTE ON PROCEDURE `familia`.`excluifilho` TO `destruidor`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`excluipai` TO `destruidor`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`mostrapais` TO `destruidor`@`localhost`;
/*M!100005 SET DEFAULT ROLE NONE FOR 'destruidor'@'localhost' */;
/*!80001 ALTER USER 'destruidor'@'localhost' DEFAULT ROLE NONE */;
GRANT USAGE ON *.* TO `excluidor`@`localhost` IDENTIFIED BY PASSWORD '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9';
GRANT EXECUTE ON PROCEDURE `familia`.`mostrapais` TO `excluidor`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`excluipai` TO `excluidor`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`mostrafilhos` TO `excluidor`@`localhost`;
GRANT EXECUTE ON PROCEDURE `familia`.`excluifilho` TO `excluidor`@`localhost`;
/*M!100005 SET DEFAULT ROLE NONE FOR 'excluidor'@'localhost' */;
/*!80001 ALTER USER 'excluidor'@'localhost' DEFAULT ROLE NONE */;
SET ROLE NONE;
DROP ROLE mariadb_dump_import_role;
/*M!100203 EXECUTE IMMEDIATE CONCAT('SET ROLE ', @current_role) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-17 22:08:07
