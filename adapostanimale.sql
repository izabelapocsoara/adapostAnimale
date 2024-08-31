-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: adapostanimale
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `adaposturi`
--

DROP TABLE IF EXISTS `adaposturi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adaposturi` (
  `AdapostID` int NOT NULL,
  `NumeAdapost` varchar(100) DEFAULT NULL,
  `Locatie` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AdapostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adoptii`
--

DROP TABLE IF EXISTS `adoptii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoptii` (
  `AdoptieID` int NOT NULL,
  `AnimalutID` int DEFAULT NULL,
  `StapanID` int DEFAULT NULL,
  `DataAdoptie` date DEFAULT NULL,
  PRIMARY KEY (`AdoptieID`),
  KEY `AnimalutID` (`AnimalutID`),
  KEY `StapanID` (`StapanID`),
  CONSTRAINT `adoptii_ibfk_1` FOREIGN KEY (`AnimalutID`) REFERENCES `animalute` (`AnimalutID`),
  CONSTRAINT `adoptii_ibfk_2` FOREIGN KEY (`StapanID`) REFERENCES `stapani` (`StapanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalute`
--

DROP TABLE IF EXISTS `animalute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animalute` (
  `AnimalutID` int NOT NULL,
  `Specie` varchar(50) DEFAULT NULL,
  `Varsta` int DEFAULT NULL,
  `Rasa` varchar(100) DEFAULT NULL,
  `Gen` varchar(10) DEFAULT NULL,
  `AdapostID` int DEFAULT NULL,
  `Nume` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AnimalutID`),
  KEY `foreignkey_adapost` (`AdapostID`),
  CONSTRAINT `foreignkey_adapost` FOREIGN KEY (`AdapostID`) REFERENCES `adaposturi` (`AdapostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orarpreluari`
--

DROP TABLE IF EXISTS `orarpreluari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orarpreluari` (
  `OrarID` int NOT NULL,
  `AdoptieID` int DEFAULT NULL,
  `DataPreluare` date DEFAULT NULL,
  PRIMARY KEY (`OrarID`),
  KEY `AdoptieID` (`AdoptieID`),
  CONSTRAINT `orarpreluari_ibfk_1` FOREIGN KEY (`AdoptieID`) REFERENCES `adoptii` (`AdoptieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stapani`
--

DROP TABLE IF EXISTS `stapani`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stapani` (
  `StapanID` int NOT NULL,
  `NumeStapan` varchar(100) DEFAULT NULL,
  `ContactInfo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StapanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01  1:14:50
