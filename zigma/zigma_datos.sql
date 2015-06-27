-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zigma
-- ------------------------------------------------------
-- Server version	5.7.7-rc-log

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
-- Table structure for table `datos`
--

DROP TABLE IF EXISTS `datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos` (
  `correo` varchar(100) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `idInstitucion` int(11) DEFAULT NULL,
  `IdUnidadAcademica` int(11) DEFAULT NULL,
  `nickname` varchar(45) NOT NULL,
  ` contrasenia` varchar(45) NOT NULL,
  PRIMARY KEY (`correo`),
  KEY `IdUnidadAcademica_idx` (`IdUnidadAcademica`),
  KEY `idInstitucion` (`idInstitucion`),
  CONSTRAINT `IdUnidadAcademica` FOREIGN KEY (`IdUnidadAcademica`) REFERENCES `catunidadesacademicas` (`IdUnidadAcademica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `datos_ibfk_1` FOREIGN KEY (`idInstitucion`) REFERENCES `catinstitucion` (`IdInstitucion`),
  CONSTRAINT `datos_ibfk_2` FOREIGN KEY (`idInstitucion`) REFERENCES `catinstitucion` (`IdInstitucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='¿?';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos`
--

LOCK TABLES `datos` WRITE;
/*!40000 ALTER TABLE `datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-16 17:22:27
