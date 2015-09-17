-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: zigma
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos` (
  `idArticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idTipoCont` int(11) NOT NULL,
  `valoracion` int(11) DEFAULT NULL,
  `Titulo` varchar(100) NOT NULL,
  `fecha` varchar(100) NOT NULL,
  `url` varchar(500) NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idArticulo`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idTipoCont` (`idTipoCont`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`idTipoCont`) REFERENCES `tipocontenido` (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updateArticulos after insert on articulos
for each row 
begin
	insert into weblog values 
    (0,4,concat_ws(' ',(select datos.nickname from usuarios inner join datos on usuarios.idDatos=datos.correo where new.idUsuario=usuarios.idUsuario),' publico nuevo articulo',new.titulo),null);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `avisos`
--

DROP TABLE IF EXISTS `avisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avisos` (
  `idAviso` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idIndicador` int(11) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `contenidoAviso` varchar(240) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`idAviso`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idGrupo` (`idGrupo`),
  KEY `avisos_ibfk_3_idx` (`idIndicador`),
  CONSTRAINT `avisos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `avisos_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `catgrupos` (`idGrupo`),
  CONSTRAINT `avisos_ibfk_3` FOREIGN KEY (`idIndicador`) REFERENCES `cat_indicadores` (`idIndicador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avisos`
--

LOCK TABLES `avisos` WRITE;
/*!40000 ALTER TABLE `avisos` DISABLE KEYS */;
INSERT INTO `avisos` VALUES (5,32,1,17,'Cuerpo del aviso de prueba con prioridad alta','2015-08-13 00:00:00','Aviso Alta'),(6,32,1,17,'Cuerpo del aviso de prueba con prioridad media','2015-08-13 00:00:00','AvisoMedia'),(7,32,1,17,'Cuerpo del aviso de prueba con prioridad baja','2015-08-13 00:00:00','Aviso Baja'),(8,32,2,17,'fdfddffddfdfd','2015-08-13 00:00:00','dfdf'),(9,32,3,17,'Prioridad baja','2015-08-13 13:48:42','Aviso con prioridad baja'),(10,32,2,17,'Prioridad baja','2015-08-13 13:50:46','Prioridad media'),(11,28,1,17,'Aviso','2015-08-27 12:05:59','Nuevo Aviso');
/*!40000 ALTER TABLE `avisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `palabra` varchar(50) CHARACTER SET latin1 NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_gravedad`
--

DROP TABLE IF EXISTS `cat_gravedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_gravedad` (
  `id_gravedad` int(1) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_gravedad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_gravedad`
--

LOCK TABLES `cat_gravedad` WRITE;
/*!40000 ALTER TABLE `cat_gravedad` DISABLE KEYS */;
INSERT INTO `cat_gravedad` VALUES (1,'Baja'),(2,'Media'),(3,'Alta');
/*!40000 ALTER TABLE `cat_gravedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_indicadores`
--

DROP TABLE IF EXISTS `cat_indicadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_indicadores` (
  `idIndicador` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionIndicador` varchar(100) NOT NULL,
  `colorHEX` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`idIndicador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_indicadores`
--

LOCK TABLES `cat_indicadores` WRITE;
/*!40000 ALTER TABLE `cat_indicadores` DISABLE KEYS */;
INSERT INTO `cat_indicadores` VALUES (1,'Prioridad Alta','#AD1A1A'),(2,'Prioridad Media','#F18B06'),(3,'Prioridad Baja','#ECF0F1');
/*!40000 ALTER TABLE `cat_indicadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catgrupos`
--

DROP TABLE IF EXISTS `catgrupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catgrupos` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreGrupo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idGrupo`),
  UNIQUE KEY `nombreGrupo_UNIQUE` (`nombreGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catgrupos`
--

LOCK TABLES `catgrupos` WRITE;
/*!40000 ALTER TABLE `catgrupos` DISABLE KEYS */;
INSERT INTO `catgrupos` VALUES (18,'123'),(20,'1IM7'),(21,'1IM8'),(22,'4IM6'),(17,'4IM7'),(23,'5IM7'),(19,'a'),(24,'prueba');
/*!40000 ALTER TABLE `catgrupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catinstitucion`
--

DROP TABLE IF EXISTS `catinstitucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catinstitucion` (
  `IdInstitucion` int(11) NOT NULL,
  `DescripcionInsti` varchar(80) NOT NULL,
  PRIMARY KEY (`IdInstitucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catinstitucion`
--

LOCK TABLES `catinstitucion` WRITE;
/*!40000 ALTER TABLE `catinstitucion` DISABLE KEYS */;
INSERT INTO `catinstitucion` VALUES (1,'Instituto Politecnico Nacional');
/*!40000 ALTER TABLE `catinstitucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cattipousuarios`
--

DROP TABLE IF EXISTS `cattipousuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cattipousuarios` (
  `idTipo` int(11) NOT NULL,
  `descripcionTipo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cattipousuarios`
--

LOCK TABLES `cattipousuarios` WRITE;
/*!40000 ALTER TABLE `cattipousuarios` DISABLE KEYS */;
INSERT INTO `cattipousuarios` VALUES (1,'Administrador'),(2,'Profesor'),(3,'Alumno');
/*!40000 ALTER TABLE `cattipousuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catunidadesacademicas`
--

DROP TABLE IF EXISTS `catunidadesacademicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catunidadesacademicas` (
  `IdUnidadAcademica` int(11) NOT NULL,
  `DescripcionUA` varchar(45) NOT NULL,
  PRIMARY KEY (`IdUnidadAcademica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catunidadesacademicas`
--

LOCK TABLES `catunidadesacademicas` WRITE;
/*!40000 ALTER TABLE `catunidadesacademicas` DISABLE KEYS */;
INSERT INTO `catunidadesacademicas` VALUES (1,'Fisica');
/*!40000 ALTER TABLE `catunidadesacademicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coms`
--

DROP TABLE IF EXISTS `coms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms` (
  `idCom` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `horaFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cuerpo` text,
  `idTipoContenido` int(1) NOT NULL,
  PRIMARY KEY (`idCom`),
  KEY `idTipoContenido` (`idTipoContenido`),
  CONSTRAINT `coms_ibfk_1` FOREIGN KEY (`idTipoContenido`) REFERENCES `tipocontenido` (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms`
--

LOCK TABLES `coms` WRITE;
/*!40000 ALTER TABLE `coms` DISABLE KEYS */;
/*!40000 ALTER TABLE `coms` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updateComentarios after insert on coms
for each row
begin
	insert into weblog values 
    (0,1,
    concat_ws(' ',(select datos.nickname from usuarios inner join datos on usuarios.idDatos=datos.correo where new.idUsuario=usuarios.idUsuario),
    'en articulo',(select articulos.titulo from articulos where idArticulo=new.idArticulo)),null);
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `datos`
--

DROP TABLE IF EXISTS `datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos` (
  `correo` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idInstitucion` int(11) DEFAULT NULL,
  `IdUnidadAcademica` int(11) DEFAULT NULL,
  `nickname` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `urlImage` varchar(300) DEFAULT 'default.jpg',
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
INSERT INTO `datos` VALUES ('a@a','a',1,1,'a','a','default.jpg'),('admin@hotmail.com','admin',1,1,'admin','nemesis007','default.jpg'),('ben@msdn.com','ben',1,1,'ben1','123','default.jpg'),('emma@admin.com','Emmanuel',1,1,'emma','123','default.jpg'),('honter1997@gmail.com','Octavio Ivan Hernandez Salinas',1,1,'Ivan-hdz','123','default.jpg'),('honter1997@hotmail.com','Octavio Ivan Hernandez Salinas',1,1,'Ivan-hdz','2014090332','default.jpg'),('leydi@admin.com','Leydi',1,1,'Buchuna69','Admin','default.jpg'),('matt@gy.io','matt',1,1,'matt1','123','default.jpg'),('pat@g.com','patricioEstrella',1,1,'pat','123','default.jpg'),('snl@gg.com','Sebastian',1,1,'snl','gg','default.jpg');
/*!40000 ALTER TABLE `datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examencuestionario`
--

DROP TABLE IF EXISTS `examencuestionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examencuestionario` (
  `idCuestionario` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `fechaPublicacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Contenido` longtext,
  PRIMARY KEY (`idCuestionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examencuestionario`
--

LOCK TABLES `examencuestionario` WRITE;
/*!40000 ALTER TABLE `examencuestionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `examencuestionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `idFeedback` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `contenidoFB` text,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFeedback`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,28,'asd','2015-07-08 19:44:11'),(2,28,'asd','2015-07-08 19:44:11'),(3,28,'esprero que sirva','2015-07-08 19:44:11'),(4,28,'esprero que sirva','2015-07-08 19:44:11'),(5,28,'','2015-07-08 19:44:11'),(6,28,'fgh','2015-07-08 19:44:11'),(7,29,'ffffff','2015-07-08 19:44:11'),(8,28,'esta dificil','2015-07-08 19:53:36'),(9,28,'Prueba de feedback','2015-07-13 20:24:25'),(10,28,'Prueba del feedd','2015-07-13 20:25:14'),(11,28,'Prueba del feedd','2015-07-13 20:25:16');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `getweblog`
--

DROP TABLE IF EXISTS `getweblog`;
/*!50001 DROP VIEW IF EXISTS `getweblog`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getweblog` AS SELECT 
 1 AS `ta`,
 1 AS `desc`,
 1 AS `ht`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (15,'2015-08-04 04:32:46','IMG_13245059321625.jpeg'),(16,'2015-08-04 04:34:21','2013-12-26 18.53.23.jpg'),(17,'2015-08-08 03:02:30','2013-12-26 18.41.48.jpg'),(18,'2015-08-08 03:54:10','2014-10-05 22.40.12.jpg'),(19,'2015-08-08 04:00:38','2013-12-26 18.41.48.jpg'),(20,'2015-08-08 04:06:40','2013-12-26 18.41.48.jpg'),(21,'2015-08-08 04:15:06','2013-12-26 18.41.48.jpg'),(22,'2015-08-08 04:16:08','3.jpg'),(23,'2015-08-08 23:54:39','20140220_125026.jpg'),(24,'2015-08-12 02:36:47','2013-12-26 18.41.48.jpg'),(25,'2015-08-14 05:42:14','10421294_10206268622264294_4462615000559740798_n.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mostrararticulos`
--

DROP TABLE IF EXISTS `mostrararticulos`;
/*!50001 DROP VIEW IF EXISTS `mostrararticulos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mostrararticulos` AS SELECT 
 1 AS `idArticulo`,
 1 AS `idUsuario`,
 1 AS `Titulo`,
 1 AS `fecha`,
 1 AS `valoracion`,
 1 AS `idTipoCont`,
 1 AS `url`,
 1 AS `nickname`,
 1 AS `tags`,
 1 AS `correo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `idPregunta` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idTipoContenido` int(11) DEFAULT NULL,
  `contenidoPN` longtext,
  `fechaPN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPregunta`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idTipoContenido` (`idTipoContenido`),
  CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `preguntas_ibfk_2` FOREIGN KEY (`idTipoContenido`) REFERENCES `tipocontenido` (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_reporte` varchar(100) DEFAULT NULL,
  `cuerpo` text,
  `usuario_reportado` int(11) DEFAULT NULL,
  `id_gravedad` int(1) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_gravedad` (`id_gravedad`),
  KEY `usuario_reportado` (`usuario_reportado`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`id_gravedad`) REFERENCES `cat_gravedad` (`id_gravedad`),
  CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`usuario_reportado`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,'Reporte de prueba','Me esta molestando',28,3,'2015-08-27'),(2,'otro reporte','me cuesta tanto olvidarte',28,2,'2015-09-10'),(3,'uno mas','no te soporto',28,1,'2015-09-10'),(4,'reporte de comportamiento','no te soporto',30,2,'2015-09-13');
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `idRespuesta` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `ContenidoRS` longtext,
  `fechaRS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valoracionRS` double DEFAULT NULL,
  PRIMARY KEY (`idRespuesta`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idPregunta` (`idPregunta`),
  CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultados`
--

DROP TABLE IF EXISTS `resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultados` (
  `idResultados` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idCuestionario` int(11) DEFAULT NULL,
  `aciertos` int(11) DEFAULT NULL,
  `errores` int(11) DEFAULT NULL,
  PRIMARY KEY (`idResultados`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idCuestionario` (`idCuestionario`),
  CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `resultados_ibfk_2` FOREIGN KEY (`idCuestionario`) REFERENCES `examencuestionario` (`idCuestionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados`
--

LOCK TABLES `resultados` WRITE;
/*!40000 ALTER TABLE `resultados` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simuladores`
--

DROP TABLE IF EXISTS `simuladores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simuladores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `parcial` int(1) DEFAULT NULL,
  `idUnidadA` int(11) DEFAULT NULL,
  `titulo` varchar(45) CHARACTER SET latin1 NOT NULL,
  `fecha` date DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `valoracion` int(1) DEFAULT NULL,
  `url` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUnidadA` (`idUnidadA`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `simuladores_ibfk_2` FOREIGN KEY (`idUnidadA`) REFERENCES `catunidadesacademicas` (`IdUnidadAcademica`),
  CONSTRAINT `simuladores_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simuladores`
--

LOCK TABLES `simuladores` WRITE;
/*!40000 ALTER TABLE `simuladores` DISABLE KEYS */;
/*!40000 ALTER TABLE `simuladores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoaccion`
--

DROP TABLE IF EXISTS `tipoaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoaccion` (
  `idTA` int(11) NOT NULL AUTO_INCREMENT,
  `tipoAccion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idTA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoaccion`
--

LOCK TABLES `tipoaccion` WRITE;
/*!40000 ALTER TABLE `tipoaccion` DISABLE KEYS */;
INSERT INTO `tipoaccion` VALUES (1,'Comentario'),(2,'Pregunta'),(3,'Feedback'),(4,'Articulo'),(5,'Respuesta'),(6,'Aviso'),(7,'NuevoUsuario');
/*!40000 ALTER TABLE `tipoaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontenido`
--

DROP TABLE IF EXISTS `tipocontenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocontenido` (
  `idContenido` int(11) NOT NULL,
  `descripcionCont` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontenido`
--

LOCK TABLES `tipocontenido` WRITE;
/*!40000 ALTER TABLE `tipocontenido` DISABLE KEYS */;
INSERT INTO `tipocontenido` VALUES (1,'Articulo'),(2,'Pregunta'),(3,'Examen'),(4,'Simulador');
/*!40000 ALTER TABLE `tipocontenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idDatos` varchar(100) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idTipo` (`idTipo`),
  KEY `idDatos` (`idDatos`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `cattipousuarios` (`idTipo`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idDatos`) REFERENCES `datos` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (28,'honter1997@gmail.com',2,17),(29,'leydi@admin.com',3,17),(30,'emma@admin.com',3,17),(31,'admin@hotmail.com',3,18),(32,'a@a',1,19),(33,'honter1997@hotmail.com',3,17),(34,'snl@gg.com',3,17),(36,'pat@g.com',3,21),(37,'matt@gy.io',3,22),(38,'ben@msdn.com',3,17);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updateUsuarios after insert on usuarios
for each row
begin
	insert into weblog values 
    (0,7,concat_ws(' ',(select datos.nickname from usuarios inner join datos on usuarios.idDatos=datos.correo where new.idUsuario=usuarios.idUsuario),'nuevo registro'),null);
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valoraciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valoracion` int(1) DEFAULT NULL,
  `idArticulo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idTipoContenido` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `valoraciones_ibfk_1` (`idArticulo`),
  KEY `valoraciones_ibfk_2` (`idUsuario`),
  KEY `valoraciones_ibfk_3_idx` (`idTipoContenido`),
  CONSTRAINT `valoraciones_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `valoraciones_ibfk_3` FOREIGN KEY (`idTipoContenido`) REFERENCES `tipocontenido` (`idContenido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
INSERT INTO `valoraciones` VALUES (1,5,15,28,1);
/*!40000 ALTER TABLE `valoraciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger valorar_trigger after insert on valoraciones for each row
begin
	if new.idTipoContenido = 4 then
		update simuladores set simuladores.valoracion = (select avg(valoracion) from valoraciones where valoraciones.idArticulo = new.idArticulo and valoraciones.idTipoContenido = new.idTipoContenido) where simuladores.id = new.idArticulo;
    else
	update articulos set articulos.valoracion = (select avg(valoracion) from valoraciones where valoraciones.idArticulo = new.idArticulo and valoraciones.idTipoContenido = new.idTipoContenido) where articulos.idArticulo = new.idArticulo;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ver_reportes`
--

DROP TABLE IF EXISTS `ver_reportes`;
/*!50001 DROP VIEW IF EXISTS `ver_reportes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ver_reportes` AS SELECT 
 1 AS `id`,
 1 AS `titulo_reporte`,
 1 AS `cuerpo`,
 1 AS `usuario_reportado`,
 1 AS `id_gravedad`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ver_simulador`
--

DROP TABLE IF EXISTS `ver_simulador`;
/*!50001 DROP VIEW IF EXISTS `ver_simulador`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ver_simulador` AS SELECT 
 1 AS `idSimulador`,
 1 AS `titulo`,
 1 AS `descripcion`,
 1 AS `parcial`,
 1 AS `DescripcionUA`,
 1 AS `fecha`,
 1 AS `nickname`,
 1 AS `valoracion`,
 1 AS `url`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `verblacklist`
--

DROP TABLE IF EXISTS `verblacklist`;
/*!50001 DROP VIEW IF EXISTS `verblacklist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `verblacklist` AS SELECT 
 1 AS `id`,
 1 AS `palabra`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `weblog`
--

DROP TABLE IF EXISTS `weblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weblog` (
  `idLog` int(11) NOT NULL AUTO_INCREMENT,
  `tipoAccion` int(11) NOT NULL,
  `descripcion` text,
  `horatiempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLog`),
  KEY `tipoAccion` (`tipoAccion`),
  CONSTRAINT `weblog_ibfk_1` FOREIGN KEY (`tipoAccion`) REFERENCES `tipoaccion` (`idTA`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weblog`
--

LOCK TABLES `weblog` WRITE;
/*!40000 ALTER TABLE `weblog` DISABLE KEYS */;
INSERT INTO `weblog` VALUES (1,4,'ivan  publico nuevo articulo asasdas','2015-07-27 17:25:24'),(2,4,'ivan  publico nuevo articulo Articulos','2015-07-27 17:26:04'),(3,4,'ivan  publico nuevo articulo Esto es una prueba','2015-07-28 17:22:54'),(4,4,'ivan  publico nuevo articulo sasaas','2015-07-28 17:23:35'),(5,4,'ivan  publico nuevo articulo sdds','2015-07-28 17:24:15'),(6,4,'ivan  publico nuevo articulo sadasdas','2015-07-28 17:46:52'),(7,4,'ivan  publico nuevo articulo Prueba','2015-07-28 17:50:36'),(8,4,'ivan  publico nuevo articulo prueba en preguntas','2015-07-28 17:53:20'),(9,4,'ivan  publico nuevo articulo prueba','2015-07-29 00:25:44'),(10,4,'ivan  publico nuevo articulo Prueba Con Espacios','2015-07-29 01:07:32'),(11,4,'ivan  publico nuevo articulo subirExamen','2015-07-29 01:13:34'),(12,4,'ivan  publico nuevo articulo Espero que salga','2015-07-29 01:15:24'),(13,4,'ivan  publico nuevo articulo PorDondePasa','2015-07-29 01:17:03'),(14,4,'ivan  publico nuevo articulo ','2015-07-29 01:30:24'),(15,4,'ivan  publico nuevo articulo ','2015-07-29 01:32:46'),(16,4,'ivan  publico nuevo articulo Titulo','2015-07-29 01:36:46'),(17,4,'ivan  publico nuevo articulo SubirOtroArchivo','2015-07-29 01:38:21'),(18,4,'ivan  publico nuevo articulo ','2015-07-29 01:39:27'),(19,4,'ivan  publico nuevo articulo titulo','2015-07-29 01:43:57'),(20,4,'ivan  publico nuevo articulo NuevoExamen','2015-07-29 02:59:16'),(21,4,'ivan  publico nuevo articulo Este si','2015-07-29 03:01:28'),(22,4,'ivan  publico nuevo articulo PDF','2015-07-29 03:16:04'),(23,4,'ivan  publico nuevo articulo Una Prueba','2015-07-30 17:50:10'),(24,4,'ivan  publico nuevo articulo Prueba Con Espacios','2015-07-30 18:13:45'),(25,4,'ivan  publico nuevo articulo Prueba2','2015-07-30 22:30:12'),(26,4,'ivan  publico nuevo articulo yjh','2015-07-30 22:34:11'),(27,4,'ivan  publico nuevo articulo Prueba2','2015-07-30 22:36:13'),(28,4,'ivan  publico nuevo articulo Prueba2','2015-07-30 22:36:20'),(29,4,'ivan  publico nuevo articulo Prueba Con Espacios','2015-07-30 22:37:46'),(30,4,'ivan  publico nuevo articulo Prueba2','2015-07-30 22:37:56'),(31,4,'ivan  publico nuevo articulo Prueba Con Espacios','2015-07-30 23:20:46'),(32,4,'ivan  publico nuevo articulo Prueba Con Espacios','2015-07-31 00:43:52'),(33,4,'ivan  publico nuevo articulo Prueba','2015-08-04 02:54:00'),(34,4,'ivan  publico nuevo articulo Prueba Con Espacios','2015-08-04 04:25:46'),(35,4,'ivan  publico nuevo articulo Te amooo','2015-08-04 04:34:49'),(36,4,'ivan  publico nuevo articulo Nuevo Examen','2015-08-05 02:48:16'),(37,4,'ivan  publico nuevo articulo Articulo con imagenes','2015-08-08 03:02:36'),(38,4,'ivan  publico nuevo articulo Un nuevo articulo','2015-08-08 03:25:27'),(39,4,'ivan  publico nuevo articulo Nuevo articulo','2015-08-08 03:41:19'),(40,4,'ivan  publico nuevo articulo aksj','2015-08-08 03:54:17'),(41,4,'ivan  publico nuevo articulo Pregunta que me inquiera','2015-08-08 04:05:14'),(42,4,'ivan  publico nuevo articulo ','2015-08-08 04:16:21'),(43,4,'ivan  publico nuevo articulo Esto es una pregunta','2015-08-08 04:57:18'),(44,1,'ivan en articulo Esto es una pregunta','2015-08-08 05:00:18'),(45,4,'ivan  publico nuevo articulo Esto es una pregunta','2015-08-08 05:00:59'),(46,1,'ivan en articulo Esto es una pregunta','2015-08-08 05:01:05'),(47,4,'ivan  publico nuevo articulo gfk','2015-08-08 05:27:59'),(48,1,'ivan en articulo','2015-08-08 05:30:32'),(49,1,'ivan en articulo Esto es una pregunta','2015-08-08 05:31:03'),(50,1,'ivan en articulo gfk','2015-08-08 05:31:35'),(51,4,'ivan  publico nuevo articulo Pregunta1','2015-08-08 23:55:14'),(52,4,'ivan  publico nuevo articulo Esto es una pregunta','2015-08-09 00:02:22'),(53,1,'ivan en articulo Esto es una pregunta','2015-08-09 00:02:37'),(54,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Nuevo articulo de prueba','2015-08-14 05:42:23'),(55,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo prueab','2015-08-14 05:44:02'),(56,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo ArticuloPrueba esto quiero buscar','2015-08-16 00:13:30'),(57,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Esto es una pregunta','2015-08-16 00:14:30'),(58,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo ABCD eds','2015-08-16 00:14:42'),(59,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Articulo con tags','2015-08-16 00:36:17'),(60,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Articulo con tagssss','2015-08-26 19:05:05'),(61,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Probando tags','2015-08-26 19:13:00'),(62,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Probar tags','2015-08-26 19:14:07'),(63,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Prueba','2015-08-26 19:16:40'),(64,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Articulo con tags','2015-08-26 19:37:06'),(65,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Un articulo muy bonito','2015-08-26 22:19:30'),(66,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Haver pregunta','2015-08-26 22:20:26'),(67,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Te haces mensa','2015-08-26 23:32:24'),(68,1,'Octavio Ivan Hernandez Salinas en articulo Te haces mensa','2015-08-26 23:32:32'),(69,1,'Octavio Ivan Hernandez Salinas en articulo Te haces mensa','2015-08-26 23:33:08'),(70,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Uno una pregunta','2015-08-27 00:02:54'),(71,1,'Octavio Ivan Hernandez Salinas en articulo Uno una pregunta','2015-08-27 00:03:04'),(72,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Una pregunta','2015-08-27 00:10:07'),(73,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Pregunta','2015-08-27 00:13:12'),(74,1,'Octavio Ivan Hernandez Salinas en articulo Pregunta','2015-08-27 00:16:46'),(75,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Nuevo examen','2015-08-27 00:22:41'),(76,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Examen','2015-08-27 00:25:46'),(77,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Esto es una pregunta','2015-08-27 00:27:17'),(78,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo odsnkjn','2015-08-27 00:31:04'),(79,1,'Octavio Ivan Hernandez Salinas en articulo odsnkjn','2015-08-27 00:31:43'),(80,4,'Octavio Ivan Hernandez Salinas  publico nuevo articulo Articulo','2015-08-27 00:32:10'),(81,1,'Octavio Ivan Hernandez Salinas en articulo Articulo','2015-08-27 00:32:24'),(82,4,'Ivan-hdz  publico nuevo articulo Prueba de buscador','2015-08-27 18:56:32');
/*!40000 ALTER TABLE `weblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'zigma'
--

--
-- Dumping routines for database 'zigma'
--
/*!50003 DROP PROCEDURE IF EXISTS `addComment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addComment`(in idUser int, in idArticle int, in comm text, in tipoCont int(1))
begin  
    insert into coms values(0,idUser,idArticle,null,comm, tipoCont);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrarArticulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarArticulo`(in idArticulo int, in tipoCont int(1))
begin
	delete from valoraciones where valoraciones.idArticulo = idArticulo and valoraciones.idTipoContenido = tipoCont;
	if tipoCont = 4 then
		delete from simuladores where simuladores.id = idArticulo;
    else
		delete from articulos where articulos.idArticulo = idArticulo;
		delete from coms where coms.idArticulo = idArticulo;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_articulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_articulo`(in palabra varchar(250))
begin
	select * from mostrararticulos where Titulo like concat('%', palabra,'%') or tags like concat('%', palabra,'%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cambiarDatos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiarDatos`(in EMAIL varchar(200),in NOMBRE varchar(100), in NICK varchar(45), in PASS varchar(45))
begin 
	update datos set datos.nombre = NOMBRE, datos.nickname = NICK, datos.contrasenia = PASS where datos.correo = EMAIL;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cambiar_blacklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiar_blacklist`(in ID int, in ESTADO boolean)
begin
	update blacklist set blacklist.estado = ESTADO where blacklist.id = ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearUsuario`(in correo varchar(100), in idTipoIN int, in idGrupoIN int)
begin
	insert into usuarios (idDatos, idTipo, idGrupo) values (correo, idTipoIN, idGrupoIN);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delComment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delComment`(in idCom int)
begin
	delete from coms where coms.idCom = idCom;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarReporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarReporte`(in id_reporte int)
begin
	delete from reportes where id = id_reporte;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarTodo_blacklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarTodo_blacklist`()
begin
	delete from blacklist where 1 = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_blacklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_blacklist`(in ID int)
begin
	delete from blacklist where blacklist.id = ID ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `existe_grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `existe_grupo`(in nombreDelGrupo varchar(10))
begin
	if (select nombreGrupo from catgrupos where nombregrupo = nombreDelGrupo) = nombreDelGrupo then
		select true as 'existe';
	else
		select false as 'existe';
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllFeed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllFeed`()
begin
	select * from feedback;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getComs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getComs`(in idArticulo int)
begin
	select usuarios.idUsuario as 'id' , coms.idCom as 'idCom', datos.nickname as 'usr',coms.cuerpo,coms.horaFecha from coms inner join usuarios on coms.idUsuario=usuarios.idUsuario inner join datos on usuarios.idDatos=datos.correo where coms.idArticulo=idArticulo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDatosUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDatosUser`(in email varchar(100))
begin
	select usuarios.idDatos, datos.nickname, cattipousuarios.descripcionTipo, catinstitucion.descripcionInsti, usuarios.idUsuario, datos.nombre, catunidadesacademicas.DescripcionUA, datos.urlImage
	from usuarios
	inner join datos on usuarios.idDatos = datos.correo
	inner join cattipousuarios on usuarios.idTipo = cattipousuarios.idTipo
	inner join catunidadesacademicas on datos.idUnidadAcademica = catunidadesacademicas.idUnidadAcademica
	inner join catinstitucion on datos.idInstitucion = catinstitucion.idInstitucion
	where usuarios.idDatos = email;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFeedback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFeedback`(in idFdb int)
begin
     select datos.nickname,feedback.contenidoFB,feedback.fecha from feedback inner join usuarios on feedback.idUsuario=usuarios.idUsuario inner join datos on datos.correo=usuarios.idDatos where feedback.idFeedback=idFdb;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFeedContenido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFeedContenido`(in idFeed int)
begin
	select * from feedback where idFeedback=idFeed;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGrupo`(in email varchar(100))
begin
	select catgrupos.nombreGrupo from catgrupos inner join usuarios on usuarios.idGrupo = catgrupos.idGrupo where usuarios.idDatos = email;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReporte`( in id int)
begin
	select reportes.id,reportes.titulo_reporte,reportes.cuerpo,
    datos.nickname,reportes.id_gravedad,reportes.fecha from reportes  inner join usuarios 
    on usuarios.idUsuario=reportes.usuario_reportado inner join datos on usuarios.idDatos=datos.correo where reportes.id=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReporteTODO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReporteTODO`()
begin
	select reportes.id,reportes.titulo_reporte,reportes.cuerpo,
    datos.nickname,reportes.id_gravedad,reportes.fecha from reportes  inner join usuarios 
    on usuarios.idUsuario=reportes.usuario_reportado inner join datos on usuarios.idDatos=datos.correo where reportes.id=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsername`(in idUser int)
begin
	select * from datos inner join usuarios on datos.correo=usuarios.idDatos where usuarios.idUsuario=idUser;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_IDGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_IDGrupo`(in nombreDelGrupo varchar(10))
begin
	if (select nombreGrupo from catgrupos where nombregrupo = nombreDelGrupo) = nombreDelGrupo then
		select idGrupo  from catgrupos where catgrupos.nombreGrupo = nombreDelGrupo;
	else
		select 'error' as 'isError';
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarArticulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarArticulo`(in correo varchar(100), in tipoContenido int, in valoracion int, in titulo varchar(50), in fecha varchar(100) ,in url varchar(500), in tags varchar(200))
begin
	declare idUsuario int;
	declare idArticulos int;
	set idUsuario = (select usuarios.idUsuario from usuarios inner join datos on datos.correo = usuarios.idDatos where datos.correo = correo);
	insert into articulos values (null ,idUsuario, tipoContenido, valoracion, titulo, fecha, url, tags);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarDatos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDatos`(in correo varchar(100), in nombre varchar(45),
in idInstit int, in idUnidad int, in username varchar(45), 
in contrasenia varchar(45), idTipo int, nombreDelGrupo varchar(20))
begin
	declare grupoBase int;
	declare grupoLocal varchar(20);
	insert into datos values (correo, nombre, idInstit, idUnidad, username, contrasenia);
	if (select nombreGrupo from catgrupos where nombregrupo = nombreDelGrupo) = nombreDelGrupo then
		set grupoBase = (select idGrupo from catgrupos where nombreGrupo = nombreDelGrupo);
		call crearUsuario(correo, idTipo, grupoBase);
	else
		insert into catgrupos (nombreGrupo) values (nombreDelGrupo);
		set grupoBase = (select idGrupo from catgrupos where nombreGrupo = nombreDelGrupo);
		call crearUsuario(correo, idTipo, grupoBase);
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_aviso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_aviso`(in IDUSER int, in IDINDICADOR int, in IDGRUPO int,in TITULO varchar(45), in CONTENIDO varchar(240))
begin
	insert into avisos values (null, IDUSER, IDINDICADOR, IDGRUPO, CONTENIDO, now(), TITULO);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_blacklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_blacklist`( in PALABRA varchar(50))
begin
	insert into blacklist (palabra) values (PALABRA);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_grupo`(in nombreGRUPO varchar(10))
begin
	insert into catgrupos (nombreGrupo) values (nombreGRUPO);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_indicador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_indicador`(in DESCRP varchar(100), in COLORHEX varchar(8))
begin
	insert into cat_indicadores values (null, DESCRP, COLORHEX);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_reporte`(in titulo varchar(100), in cuerpo text, idUsuario_reportado int, in id_gravedad int(1))
begin
	insert into reportes values (null, titulo, cuerpo, idUsuario_reportado, id_gravedad, current_date);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_simulador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_simulador`(in TITULO varchar(45),in DESCR varchar(300), in PARCIAL int(1), in IDUNIDAD int, in IDUSUARIO int, in URL varchar(300))
begin
	insert into simuladores values (null, DESCR, PARCIAL, IDUNIDAD, TITULO, current_date(), IDUSUARIO, 0, URL);
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginCheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginCheck`(in email varchar(100), in pass varchar(100))
begin
	declare correo varchar(100);
	declare contra varchar(100);
	set correo = (select usuarios.idDatos from usuarios inner join datos on usuarios.idDatos = datos.correo where datos.correo = email and datos.contrasenia = pass);
	set contra = (select datos.contrasenia from usuarios inner join datos on usuarios.idDatos = datos.correo where datos.correo = email and datos.contrasenia = pass);

	if email = correo AND pass = contra then
		select true as valido;
	else
		select false as valido;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `misComentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `misComentarios`(in idArt int)
begin
	select *, count(*) as 'cuantos' from coms where idArticulo = idArt and idTipoContenido = 2;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newFeed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newFeed`(in contenido text,in correo varchar(100))
begin
	declare idUser int;
	declare idFeed int;
	set idFeed = (select ifnull(max(idFeedback),0) + 1 from feedback);
	set idUser= (select idUsuario from usuarios inner join datos on datos.correo=usuarios.idDatos where datos.correo = correo);
	insert into feedback values(idFeed,idUser,contenido,current_timestamp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenDatosArt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenDatosArt`(in idUser int, in title varchar(100), in Fecha varchar(100))
begin
	select idArticulo, idTipoCont, url from articulos where articulos.idUsuario = idUser and articulos.Titulo = title and articulos.fecha=Fecha;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenDatosArtConID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenDatosArtConID`(in idArt int)
begin
	select articulos.idTipoCont, articulos.url from articulos where articulos.idArticulo=idArt;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenIdUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenIdUsuario`(in correo varchar(100))
begin
	select idUsuario from usuarios inner join datos on datos.correo=usuarios.idDatos where datos.correo = correo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePhoto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePhoto`(in EMAIL varchar(300), in URL varchar(200))
begin
	update datos set urlImage = URL where correo = EMAIL;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uploadImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uploadImage`(in url varchar(500))
begin
	insert into images values (null, current_timestamp(), url);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `valorar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `valorar`(in VALORACION int(1), in IDARTICULO int, in IDUSUARIO int, in IDTIPOCONT int)
begin
	insert into valoraciones (valoracion, idArticulo, idUsuario, idTipoContenido) values (VALORACION, IDARTICULO, IDUSUARIO, IDTIPOCONT);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verReporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verReporte`(in id_reporte int)
begin
	select * from reportes where id = id_reporte;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verTipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verTipo`(in email varchar(100))
begin
	select usuarios.idTipo, cattipousuarios.descripcionTipo from usuarios inner join cattipousuarios on usuarios.idTipo = cattipousuarios.idTipo where usuarios.idDatos = email;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_avisos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_avisos`(in IDGRUPO int)
begin
	select datos.nickname, cat_indicadores.colorHEX, avisos.titulo, avisos.contenidoAviso, avisos.fecha, catgrupos.nombreGrupo from avisos
    inner join usuarios on usuarios.idUsuario = avisos.idUsuario
    inner join datos on datos.correo = usuarios.idDatos
    inner join catgrupos on catgrupos.idGrupo = avisos.idGrupo
    inner join cat_indicadores on avisos.idIndicador = cat_indicadores.idIndicador
    where avisos.idGrupo = IDGRUPO order by avisos.fecha desc limit 5;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `getweblog`
--

/*!50001 DROP VIEW IF EXISTS `getweblog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getweblog` AS select `tipoaccion`.`tipoAccion` AS `ta`,`weblog`.`descripcion` AS `desc`,date_format(`weblog`.`horatiempo`,'%W %d %b %T') AS `ht` from (`weblog` join `tipoaccion` on((`weblog`.`tipoAccion` = `tipoaccion`.`idTA`))) order by `weblog`.`horatiempo` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrararticulos`
--

/*!50001 DROP VIEW IF EXISTS `mostrararticulos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrararticulos` AS select `articulos`.`idArticulo` AS `idArticulo`,`articulos`.`idUsuario` AS `idUsuario`,`articulos`.`Titulo` AS `Titulo`,`articulos`.`fecha` AS `fecha`,`articulos`.`valoracion` AS `valoracion`,`articulos`.`idTipoCont` AS `idTipoCont`,`articulos`.`url` AS `url`,`datos`.`nickname` AS `nickname`,`articulos`.`tags` AS `tags`,`datos`.`correo` AS `correo` from ((`articulos` join `usuarios` on((`usuarios`.`idUsuario` = `articulos`.`idUsuario`))) join `datos` on((`datos`.`correo` = `usuarios`.`idDatos`))) where (`articulos`.`idUsuario` = `usuarios`.`idUsuario`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ver_reportes`
--

/*!50001 DROP VIEW IF EXISTS `ver_reportes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ver_reportes` AS select `reportes`.`id` AS `id`,`reportes`.`titulo_reporte` AS `titulo_reporte`,`reportes`.`cuerpo` AS `cuerpo`,`reportes`.`usuario_reportado` AS `usuario_reportado`,`reportes`.`id_gravedad` AS `id_gravedad`,`reportes`.`fecha` AS `fecha` from `reportes` order by `reportes`.`fecha` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ver_simulador`
--

/*!50001 DROP VIEW IF EXISTS `ver_simulador`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ver_simulador` AS select `simuladores`.`id` AS `idSimulador`,`simuladores`.`titulo` AS `titulo`,`simuladores`.`descripcion` AS `descripcion`,`simuladores`.`parcial` AS `parcial`,`catunidadesacademicas`.`DescripcionUA` AS `DescripcionUA`,`simuladores`.`fecha` AS `fecha`,`datos`.`nickname` AS `nickname`,`simuladores`.`valoracion` AS `valoracion`,`simuladores`.`url` AS `url` from (((`simuladores` join `catunidadesacademicas` on((`simuladores`.`idUnidadA` = `catunidadesacademicas`.`IdUnidadAcademica`))) join `usuarios` on((`usuarios`.`idUsuario` = `simuladores`.`idUsuario`))) join `datos` on((`datos`.`correo` = `usuarios`.`idDatos`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `verblacklist`
--

/*!50001 DROP VIEW IF EXISTS `verblacklist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `verblacklist` AS select `blacklist`.`id` AS `id`,`blacklist`.`palabra` AS `palabra`,`blacklist`.`estado` AS `estado` from `blacklist` */;
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

-- Dump completed on 2015-09-17 16:53:42
