CREATE DATABASE  IF NOT EXISTS `db01restaurante` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db01restaurante`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db01restaurante
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idClientes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `apellido` varchar(45) COLLATE utf8_bin NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  PRIMARY KEY (`idClientes`),
  UNIQUE KEY `idClientes_UNIQUE` (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Fabiola','Bustamante','1990-11-23'),(2,'Javiera','Ferrada','1985-01-12'),(3,'Rogelio','Ferrada','1983-05-07'),(4,'Dominique','Herrera','2000-10-16'),(5,'Lorenzo','Hernadez','2001-09-15');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `idMesas` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcion` text COLLATE utf8_bin,
  `Meseros_idMeseros` int NOT NULL,
  PRIMARY KEY (`idMesas`,`Meseros_idMeseros`),
  UNIQUE KEY `idMesas_UNIQUE` (`idMesas`),
  KEY `fk_Mesas_Meseros1_idx` (`Meseros_idMeseros`),
  CONSTRAINT `fk_Mesas_Meseros1` FOREIGN KEY (`Meseros_idMeseros`) REFERENCES `meseros` (`idMeseros`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'1','Exterior',1),(2,'2','Exterior',2),(3,'3','Interior',3),(4,'4','Interior',4),(5,'5','Interior',5);
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meseros`
--

DROP TABLE IF EXISTS `meseros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meseros` (
  `idMeseros` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `apellido` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idMeseros`),
  UNIQUE KEY `idMeseros_UNIQUE` (`idMeseros`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meseros`
--

LOCK TABLES `meseros` WRITE;
/*!40000 ALTER TABLE `meseros` DISABLE KEYS */;
INSERT INTO `meseros` VALUES (1,'Marco','Saez'),(2,'Fabio','Urrutia'),(3,'Miguel','Lara'),(4,'Sara','Zepeda'),(5,'Samanta','Gomez');
/*!40000 ALTER TABLE `meseros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `idOrdenes` int NOT NULL AUTO_INCREMENT,
  `fechaOrdenes` datetime NOT NULL,
  `totalCuenta` int NOT NULL,
  `Clientes_idClientes` int NOT NULL,
  `Mesas_idMesas` int NOT NULL,
  PRIMARY KEY (`idOrdenes`,`Clientes_idClientes`,`Mesas_idMesas`),
  UNIQUE KEY `idOrdenes_UNIQUE` (`idOrdenes`),
  KEY `fk_Ordenes_Clientes_idx` (`Clientes_idClientes`),
  KEY `fk_Ordenes_Mesas1_idx` (`Mesas_idMesas`),
  CONSTRAINT `fk_Ordenes_Clientes` FOREIGN KEY (`Clientes_idClientes`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `fk_Ordenes_Mesas1` FOREIGN KEY (`Mesas_idMesas`) REFERENCES `mesas` (`idMesas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (1,'2022-06-23 16:22:15',8990,1,1),(2,'2022-06-23 17:33:56',7990,2,2),(3,'2022-06-24 12:24:12',7990,3,3),(4,'2022-06-24 16:37:48',8990,4,4),(5,'2022-06-24 18:45:02',7990,5,5);
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platos`
--

DROP TABLE IF EXISTS `platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos` (
  `idPlatos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcion` text COLLATE utf8_bin,
  `precio` int NOT NULL,
  `Ordenes_idOrdenes` int NOT NULL,
  `Ordenes_Clientes_idClientes` int NOT NULL,
  `Ordenes_Mesas_idMesas` int NOT NULL,
  PRIMARY KEY (`idPlatos`,`Ordenes_idOrdenes`,`Ordenes_Clientes_idClientes`,`Ordenes_Mesas_idMesas`),
  UNIQUE KEY `idPlatos_UNIQUE` (`idPlatos`),
  KEY `fk_Platos_Ordenes1_idx` (`Ordenes_idOrdenes`,`Ordenes_Clientes_idClientes`,`Ordenes_Mesas_idMesas`),
  CONSTRAINT `fk_Platos_Ordenes1` FOREIGN KEY (`Ordenes_idOrdenes`, `Ordenes_Clientes_idClientes`, `Ordenes_Mesas_idMesas`) REFERENCES `ordenes` (`idOrdenes`, `Clientes_idClientes`, `Mesas_idMesas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos`
--

LOCK TABLES `platos` WRITE;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
INSERT INTO `platos` VALUES (1,'Doomsday','4 Slider Burger, 4 Quesos Cheddar,Cebolla Marinada en Jack Daniels.',8990,1,1,1),(2,'Holey moley','Hamburguesa grillada de 250 gr, queso chedar, champiñón, cebolla caramelizada y rucula.',7990,2,2,2),(3,'Pepi\'s','Doble burger de 250 gr cada una, doble queso cheddar, mayonesa y pepinillos apanados crispy.',7990,3,3,3),(4,'Queen of the fries','Doble burger grillada de 250gr cada una, acompañada de doble queso cheddar, doble queso gauda, tocino, bañado en cheddar liquido y tocino crispy, sobre una cama de papas fritas.',8990,4,4,4),(5,'Sinaloa','Jalapeños, hot chili, sour cheese, doble burger (250gr cada una), doble cheedar, salsa lady.',7990,5,5,5);
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 13:07:37
