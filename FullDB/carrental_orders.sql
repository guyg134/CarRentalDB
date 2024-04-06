-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: carrental
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrdersID` int NOT NULL AUTO_INCREMENT COMMENT 'מזהה הזמנה',
  `OrderDate` date DEFAULT NULL COMMENT 'תאריך הזמנה',
  `CollectionDate` date NOT NULL COMMENT 'תאריך איסוף',
  `RentalDays` int DEFAULT NULL COMMENT 'מספר ימים של השכרה',
  `OrderStatus` varchar(45) DEFAULT NULL COMMENT 'סטטוס ההזמנה',
  `customers_CustomerID` int NOT NULL COMMENT 'תעודת הזהות של הלקוח',
  `models_ModelID` int NOT NULL COMMENT 'מזהה המודל',
  PRIMARY KEY (`OrdersID`),
  KEY `fk_orders_customers1_idx` (`customers_CustomerID`),
  KEY `fk_orders_models1_idx` (`models_ModelID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-03-01','2024-03-10',5,'Pending',163498726,1),(2,'2024-02-25','2024-03-05',3,'Completed',165248991,2),(3,'2024-02-28','2024-03-07',2,'Pending',214616511,3),(4,'2024-02-27','2024-03-08',7,'Completed',244756383,4),(5,'2024-03-02','2024-03-09',4,'Pending',113632857,5),(8,NULL,'2024-05-08',4,NULL,2,163498726),(9,'2024-03-13','2024-05-03',4,NULL,244756383,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-06 17:52:27
