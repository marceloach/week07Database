CREATE DATABASE  IF NOT EXISTS `db03agencia` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db03agencia`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db03agencia
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `apellidoPaterno` varchar(45) COLLATE utf8_bin NOT NULL,
  `apellidoMaterno` varchar(45) COLLATE utf8_bin NOT NULL,
  `rut` varchar(12) COLLATE utf8_bin NOT NULL,
  `telefono` varchar(9) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`),
  UNIQUE KEY `rut_UNIQUE` (`rut`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Emilio','Ortiz','Hoyos','12.236.456-5','956234578','emilio@gmail.com'),(2,'Susana','Marinez','Jorquera','11.263.495-7','945654218','jmartinez@gmail.com'),(3,'Miriam','Cuevas','Fernandez','15.236.489-9','956321784','miriamc@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encargado`
--

DROP TABLE IF EXISTS `encargado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encargado` (
  `idEncargado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `apellidoPaterno` varchar(45) COLLATE utf8_bin NOT NULL,
  `apellidoMaterno` varchar(45) COLLATE utf8_bin NOT NULL,
  `rut` varchar(12) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idEncargado`),
  UNIQUE KEY `idEncargado_UNIQUE` (`idEncargado`),
  UNIQUE KEY `rut_UNIQUE` (`rut`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encargado`
--

LOCK TABLES `encargado` WRITE;
/*!40000 ALTER TABLE `encargado` DISABLE KEYS */;
INSERT INTO `encargado` VALUES (1,'Horacio','Limari','Pedraza','13.236.596-8');
/*!40000 ALTER TABLE `encargado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `idEventos` int NOT NULL AUTO_INCREMENT,
  `nombreEvento` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcion` text COLLATE utf8_bin,
  PRIMARY KEY (`idEventos`),
  UNIQUE KEY `idEventos_UNIQUE` (`idEventos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Coldplay','Concierto de Coldplay'),(2,'Avengers','Cumpleaños con tematica de avengers');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventosproximos`
--

DROP TABLE IF EXISTS `eventosproximos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventosproximos` (
  `idEventosProximos` int NOT NULL AUTO_INCREMENT,
  `fechaEvento` date NOT NULL,
  `horaInicio` time NOT NULL,
  `costoFinal` int NOT NULL,
  `Eventos_idEventos` int NOT NULL,
  `Salon_idSalon` int NOT NULL,
  `Encargado_idEncargado` int NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idEventosProximos`,`Eventos_idEventos`,`Salon_idSalon`,`Encargado_idEncargado`,`Cliente_idCliente`),
  UNIQUE KEY `idEventosProximos_UNIQUE` (`idEventosProximos`),
  KEY `fk_EventosProximos_Eventos_idx` (`Eventos_idEventos`),
  KEY `fk_EventosProximos_Salon1_idx` (`Salon_idSalon`),
  KEY `fk_EventosProximos_Encargado1_idx` (`Encargado_idEncargado`),
  KEY `fk_EventosProximos_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_EventosProximos_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `fk_EventosProximos_Encargado1` FOREIGN KEY (`Encargado_idEncargado`) REFERENCES `encargado` (`idEncargado`),
  CONSTRAINT `fk_EventosProximos_Eventos` FOREIGN KEY (`Eventos_idEventos`) REFERENCES `eventos` (`idEventos`),
  CONSTRAINT `fk_EventosProximos_Salon1` FOREIGN KEY (`Salon_idSalon`) REFERENCES `salon` (`idSalon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventosproximos`
--

LOCK TABLES `eventosproximos` WRITE;
/*!40000 ALTER TABLE `eventosproximos` DISABLE KEYS */;
INSERT INTO `eventosproximos` VALUES (1,'2022-09-21','17:00:00',120,1,1,1,1),(2,'2022-09-23','17:00:00',80,1,1,1,2),(3,'2022-07-05','12:30:00',40,2,2,1,3);
/*!40000 ALTER TABLE `eventosproximos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salon`
--

DROP TABLE IF EXISTS `salon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salon` (
  `idSalon` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcion` text COLLATE utf8_bin,
  `direccion` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idSalon`),
  UNIQUE KEY `idSalon_UNIQUE` (`idSalon`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salon`
--

LOCK TABLES `salon` WRITE;
/*!40000 ALTER TABLE `salon` DISABLE KEYS */;
INSERT INTO `salon` VALUES (1,'Nacional','Estadio nacional.','Av. Grecia 2001'),(2,'Astore','Salon de eventos','Angamos 6933');
/*!40000 ALTER TABLE `salon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 15:08:31
