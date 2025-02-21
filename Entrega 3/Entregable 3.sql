-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: cerveceria
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_cat` varchar(30) NOT NULL,
  `detalle` varchar(30) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cerveza`
--

DROP TABLE IF EXISTS `cerveza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cerveza` (
  `id_cerveza` int NOT NULL AUTO_INCREMENT,
  `nombre_cer` varchar(30) NOT NULL,
  `color_cer` varchar(30) NOT NULL,
  `sabor_cer` varchar(30) NOT NULL,
  `textura_cer` varchar(30) NOT NULL,
  `aroma_cer` varchar(30) NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_cerveza`,`id_categoria`),
  KEY `id_categoria _idx` (`id_categoria`),
  CONSTRAINT `id_categoria ` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cerveza`
--

LOCK TABLES `cerveza` WRITE;
/*!40000 ALTER TABLE `cerveza` DISABLE KEYS */;
/*!40000 ALTER TABLE `cerveza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cerveza_matprima`
--

DROP TABLE IF EXISTS `cerveza_matprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cerveza_matprima` (
  `id_cer_matprima` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `unidad` int NOT NULL,
  `id_materiap` int NOT NULL,
  `id_cerveza` int NOT NULL,
  PRIMARY KEY (`id_cer_matprima`,`id_materiap`,`id_cerveza`),
  KEY ` id_materiap_idx` (`id_materiap`),
  KEY `id_cerveza_idx` (`id_cerveza`),
  CONSTRAINT ` id_materiap` FOREIGN KEY (`id_materiap`) REFERENCES `materia_prima` (`id_materiap`),
  CONSTRAINT `id_cerveza` FOREIGN KEY (`id_cerveza`) REFERENCES `cerveza` (`id_cerveza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cerveza_matprima`
--

LOCK TABLES `cerveza_matprima` WRITE;
/*!40000 ALTER TABLE `cerveza_matprima` DISABLE KEYS */;
/*!40000 ALTER TABLE `cerveza_matprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_prima`
--

DROP TABLE IF EXISTS `materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima` (
  `id_materiap` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `sabor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_materiap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

LOCK TABLES `materia_prima` WRITE;
/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_categoria`
--

DROP TABLE IF EXISTS `tipo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_categoria` (
  `id_tipo_cat` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_cat` varchar(30) NOT NULL,
  `categoria_id_categoria` int NOT NULL,
  `id_tipo` int NOT NULL,
  PRIMARY KEY (`id_tipo_cat`,`categoria_id_categoria`,`id_tipo`),
  KEY `id_categoria_idx` (`categoria_id_categoria`),
  KEY `id_tipo_idx` (`id_tipo`),
  CONSTRAINT `categoria_id_categoria` FOREIGN KEY (`categoria_id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `id_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_categoria`
--

LOCK TABLES `tipo_categoria` WRITE;
/*!40000 ALTER TABLE `tipo_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-11 21:19:42
