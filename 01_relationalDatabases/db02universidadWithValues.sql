CREATE DATABASE  IF NOT EXISTS `db02universidad` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db02universidad`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db02universidad
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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `idAlumnos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `apellidoPaterno` varchar(45) COLLATE utf8_bin NOT NULL,
  `apellidoMaterno` varchar(45) COLLATE utf8_bin NOT NULL,
  `rut` varchar(12) COLLATE utf8_bin NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `direccion` varchar(45) COLLATE utf8_bin NOT NULL,
  `Carreras_idCarrera` int NOT NULL,
  PRIMARY KEY (`idAlumnos`,`Carreras_idCarrera`),
  UNIQUE KEY `idAlumnos_UNIQUE` (`idAlumnos`),
  UNIQUE KEY `rut_UNIQUE` (`rut`),
  KEY `fk_Alumnos_Carreras1_idx` (`Carreras_idCarrera`),
  CONSTRAINT `fk_Alumnos_Carreras1` FOREIGN KEY (`Carreras_idCarrera`) REFERENCES `carreras` (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'Alejadro','Osorio','Cortes','20.325.333-9','2001-01-23','Matta 631',1),(2,'Carlos','Lema','Calle','20.362.459-8','2001-05-17','Roble 496',1),(3,'Eliana','Urrutia','Bazar','20.346.124-7','2001-11-02','Borgo??a 469',1),(4,'Edith','Miranda','Zalasar','21.654.236-4','2002-06-12','Argentina 6694',2),(5,'Rodrigo','Ramirez','Rollo','21.362.477-6','2002-08-01','Calbuco 786',2);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campus` (
  `idCampus` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcion` text COLLATE utf8_bin,
  `direccion` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idCampus`),
  UNIQUE KEY `idCampus_UNIQUE` (`idCampus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (1,'Ingenier??a de sistemas y computaci??n ','Nuestra misi??n fundamental es contribuir al desarrollo de la sociedad a trav??s de la generaci??n y difusi??n de conocimiento en el ??mbito de la gesti??n de organizaciones y las tecnolog??as de informaci??n. Este aporte se materializa mediante la realizaci??n de servicios de docencia, investigaci??n y vinculaci??n con el entorno regional.','Av. Grecia 452'),(2,'Econom??a y administraci??n','Contribuir al aprendizaje de las Ciencias de la Administraci??n en personas y organizaciones regionales, nacionales e internacionales.','Av. Rendic 4659');
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `idCarrera` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcion` text COLLATE utf8_bin,
  `Campus_idCampus` int NOT NULL,
  PRIMARY KEY (`idCarrera`,`Campus_idCampus`),
  UNIQUE KEY `idCarrera_UNIQUE` (`idCarrera`),
  KEY `fk_Carreras_Campus1_idx` (`Campus_idCampus`),
  CONSTRAINT `fk_Carreras_Campus1` FOREIGN KEY (`Campus_idCampus`) REFERENCES `campus` (`idCampus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Desarrollo Front End','Programa que busca que sus estudiantes inicien una carrera en el desarrollo de web del lado del cliente con HTML, CSS y JavaScript. Con una metodolog??a activa y en una modalidad intensiva el programa busca que se desarrollen habilidades para construir proyectos y entrar a un mercado laboral con muchas oportunidades. Busca entregar competencias para desarrollar aplicaciones Front End complejas utilizando React, que se comunican directamente con un servidor para leer y enviar datos.',1),(2,'Desarrollo Full Stack JavaScript','Durante este programa desarrollar??s varios desaf??os pr??cticos para ir generando experiencia y portafolio, hasta lograr construir aplicaciones de manera independiente. En una modalidad intensiva, el programa busca que desarrolles las competencias para entrar al mercado laboral o crees un proyecto personal.',1),(3,'Data Science','Carrera intensiva dise??ada para que los participantes adquieran las competencias para realizar an??lisis de datos sin importar su naturaleza, implementando modelos descriptivos y predictivos. El plan formativo del Data Science consta de 5 m??dulos: Introducci??n a la programaci??n con Python, Fundamentos de Data Science, Machine Learning, SQL para Data Science y Proyecto Data Science.',1),(4,'Contador Auditor','En la carrera de Contador Auditor - Contador P??blico, aprender??s c??mo planificar y desarrollar estrat??gicamente la informaci??n financiera a trav??s de decisiones de gesti??n administrativa.',2),(5,'Ingenier??a en Control de Gesti??n','En esta carrera te vas a preparar para la gesti??n organizacional y control del uso ??ptimo de los recursos de las organizaciones mediante sistemas de informaci??n y herramientas de control de gesti??n.',2);
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 14:51:01
