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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `CarID` varchar(10) NOT NULL COMMENT 'מזהה רכב',
  `Year` int NOT NULL COMMENT 'שנת ייצור',
  `CarKilometers` varchar(45) DEFAULT NULL COMMENT 'הקילומטרים שהרכב עבר',
  `models_ModelID` int NOT NULL COMMENT 'מודל הרכב',
  PRIMARY KEY (`CarID`),
  UNIQUE KEY `carId_UNIQUE` (`CarID`),
  KEY `fk_cars_models1_idx` (`models_ModelID`),
  CONSTRAINT `fk_cars_models1` FOREIGN KEY (`models_ModelID`) REFERENCES `models` (`ModelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES ('ABC123',2020,'50000',1),('BCD890',2021,'45000',10),('DEF456',2018,'70000',2),('GHI789',2019,'60000',3),('ITB521',2019,'20000',9),('JKL012',2021,'40000',4),('MNO345',2020,'55000',5),('PQR678',2019,'65000',6),('SQ4C23',2012,'86000',3),('STU901',2018,'75000',7),('VWX234',2017,'80000',8),('YZA567',2022,'30000',9);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `companyId` int NOT NULL COMMENT 'מזהה חברה',
  `companyName` varchar(45) DEFAULT NULL COMMENT 'שם החברה',
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Toyota'),(2,'Honda'),(3,'Ford'),(4,'Chevrolet'),(5,'BMW'),(6,'Mercedes-Benz'),(7,'Audi'),(8,'Volkswagen'),(9,'Tesla'),(10,'Nissan');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL COMMENT 'תעודת זהות של לקוח',
  `CustomerType` varchar(45) DEFAULT NULL COMMENT 'סוג לקוח: תייר, אזרח',
  `Name` varchar(45) DEFAULT NULL COMMENT 'שם הלקוח',
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (113632857,'Citizen','Daniel Smith'),(163498726,'Tourist','Bob Brown'),(165248991,'Citizen','Laura Brown'),(214616511,'Tourist','Global Solutions'),(244756383,'Tourist','Sarah Davis');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `DriverID` int NOT NULL COMMENT 'תעודת זהות של נהג',
  `LicenseDate` date DEFAULT NULL COMMENT 'תאריך קבלת רשיון',
  `BirthDate` date DEFAULT NULL COMMENT 'תאריך לידה',
  `LicenseID` int NOT NULL COMMENT 'מספר רשיון',
  `DriverType` varchar(45) NOT NULL COMMENT 'סוג הנהג: נהג חדש, נהג ותיק',
  `DriverName` varchar(45) DEFAULT NULL COMMENT 'שם הנהג',
  PRIMARY KEY (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (113632857,'2011-03-08','1980-08-10',90123,'Old Driver','Daniel Smith'),(165248991,'2018-01-18','1995-05-03',89012,'Old Driver','Laura Brown'),(215752198,'2009-09-05','1975-12-20',78901,'New Driver','Matthew Johnson'),(244756383,'2017-06-22','1993-04-15',1234,'Young Driver','Sarah Davis');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers_has_customers`
--

DROP TABLE IF EXISTS `drivers_has_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers_has_customers` (
  `drivers_DriverID` int NOT NULL COMMENT 'מזהה נהג',
  `customers_CustomerID` int NOT NULL COMMENT 'מזהה לקוח',
  PRIMARY KEY (`drivers_DriverID`,`customers_CustomerID`),
  KEY `fk_drivers_has_customers_customers1_idx` (`customers_CustomerID`),
  KEY `fk_drivers_has_customers_drivers1_idx` (`drivers_DriverID`),
  CONSTRAINT `fk_drivers_has_customers_customers1` FOREIGN KEY (`customers_CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `fk_drivers_has_customers_drivers1` FOREIGN KEY (`drivers_DriverID`) REFERENCES `drivers` (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers_has_customers`
--

LOCK TABLES `drivers_has_customers` WRITE;
/*!40000 ALTER TABLE `drivers_has_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers_has_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras`
--

DROP TABLE IF EXISTS `extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras` (
  `ExtraID` int NOT NULL COMMENT 'מזהה תוספת',
  `ExtraName` varchar(45) DEFAULT NULL COMMENT 'שם התוספת',
  `ExtraPrice` int DEFAULT NULL COMMENT 'מחיר התוספת',
  PRIMARY KEY (`ExtraID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras`
--

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
INSERT INTO `extras` VALUES (1,'GPS',10),(2,'Child Seat',20),(3,'Insurance',30),(4,'Roof Rack',15);
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models` (
  `ModelID` int NOT NULL COMMENT 'מזהה מודל',
  `ModelName` varchar(45) DEFAULT NULL COMMENT 'שם המודל',
  `SeatsNumber` int DEFAULT NULL COMMENT 'מספר מושבים',
  `EngineCapacity` int DEFAULT NULL COMMENT 'נפח מנוע',
  `Company_companyId` int NOT NULL COMMENT 'מזהה החברה',
  `PricePerDay` int DEFAULT NULL COMMENT 'מחיר השכרה ליום',
  PRIMARY KEY (`ModelID`),
  KEY `fk_models_Company1_idx` (`Company_companyId`),
  CONSTRAINT `fk_models_Company1` FOREIGN KEY (`Company_companyId`) REFERENCES `companies` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'Camry',5,2000,1,50),(2,'Accord',5,1800,2,55),(3,'F-150',2,3500,3,70),(4,'Corvette',2,6200,4,100),(5,'3 Series',5,2500,5,60),(6,'E-Class',5,3000,6,75),(7,'A4',5,2000,7,65),(8,'Golf',5,1600,8,45),(9,'Model S',5,0,9,90),(10,'Altima',5,2500,10,55);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `orders_has_extras`
--

DROP TABLE IF EXISTS `orders_has_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_extras` (
  `orders_OrdersID` int NOT NULL COMMENT 'מזהה הזמנה',
  `extras_ExtraID` int NOT NULL COMMENT 'מזהה תוספת',
  PRIMARY KEY (`orders_OrdersID`,`extras_ExtraID`),
  KEY `fk_orders_has_extras_extras1_idx` (`extras_ExtraID`),
  KEY `fk_orders_has_extras_orders1_idx` (`orders_OrdersID`),
  CONSTRAINT `fk_orders_has_extras_extras1` FOREIGN KEY (`extras_ExtraID`) REFERENCES `extras` (`ExtraID`),
  CONSTRAINT `fk_orders_has_extras_orders1` FOREIGN KEY (`orders_OrdersID`) REFERENCES `orders` (`OrdersID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_extras`
--

LOCK TABLES `orders_has_extras` WRITE;
/*!40000 ALTER TABLE `orders_has_extras` DISABLE KEYS */;
INSERT INTO `orders_has_extras` VALUES (4,1),(5,1),(4,2);
/*!40000 ALTER TABLE `orders_has_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentals` (
  `RentalID` int NOT NULL COMMENT 'מזהה השכרה',
  `orders_OrdersID` int NOT NULL COMMENT 'מזהה הזמנה',
  `cars_CarID` varchar(10) NOT NULL COMMENT 'מספר רכב',
  `ReturnKilometers` int DEFAULT NULL COMMENT 'קלימוטרים ברכב בהחזרה',
  `ReturnGasTank` int DEFAULT NULL COMMENT 'המיכל דלק בהחזרה',
  PRIMARY KEY (`RentalID`,`orders_OrdersID`),
  KEY `fk_rentals_orders1_idx` (`orders_OrdersID`),
  KEY `fk_rentals_cars1_idx` (`cars_CarID`),
  CONSTRAINT `fk_rentals_cars1` FOREIGN KEY (`cars_CarID`) REFERENCES `cars` (`CarID`),
  CONSTRAINT `fk_rentals_orders1` FOREIGN KEY (`orders_OrdersID`) REFERENCES `orders` (`OrdersID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentals`
--

LOCK TABLES `rentals` WRITE;
/*!40000 ALTER TABLE `rentals` DISABLE KEYS */;
INSERT INTO `rentals` VALUES (1,1,'ABC123',4500,NULL),(2,2,'DEF456',3500,NULL),(3,3,'GHI789',2800,NULL),(4,4,'JKL012',6200,NULL),(5,5,'MNO345',5000,NULL),(6,5,'MNO345',NULL,NULL);
/*!40000 ALTER TABLE `rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'carrental'
--
/*!50003 DROP FUNCTION IF EXISTS `CalculateOrderPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateOrderPrice`(
    orderId INT
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE totalDays INT;
    DECLARE totalPrice DECIMAL(10, 2) default 0;
    DECLARE youngDriverFee DECIMAL(10, 2);
    DECLARE totalExtrasPrice DECIMAL(10, 2);

    -- Get the total number of rental days for the order
    SELECT RentalDays INTO totalDays
    FROM `carrental`.`orders`
    WHERE OrdersID = orderId;

    -- Get the price per day of the car for the order
    SELECT PricePerDay INTO totalPrice
    FROM `carrental`.`models`
    WHERE ModelID = (
        SELECT models_ModelID
        FROM `carrental`.`orders`
        WHERE OrdersID = orderId
    );

    -- Calculate the total price for the order based on rental days and car price
    SET totalPrice = totalDays * totalPrice;

    -- Check if the driver of the order is young and add the young driver fee
    SET youngDriverFee = IF(
        EXISTS (
            SELECT 1
            FROM `carrental`.`drivers_has_customers`
            JOIN `carrental`.`drivers` ON drivers.DriverID = drivers_has_customers.drivers_DriverID
            WHERE customers_CustomerID = (
                SELECT customers_CustomerID
                FROM `carrental`.`orders`
                WHERE OrdersID = orderId
            ) AND DriverType = 'Young Driver'
        ), 300, 0
    );

    -- Calculate the total price of extras for the order
    SET totalExtrasPrice = COALESCE((
    SELECT SUM(ExtraPrice)
    FROM `carrental`.`extras`
    WHERE ExtraID IN (
        SELECT extras_ExtraID
        FROM `carrental`.`orders_has_extras`
        WHERE orders_OrdersID = orderId
    )
), 0);

    -- Add the young driver fee and extras price to the total price
    SET totalPrice = totalPrice + youngDriverFee + totalExtrasPrice;

    RETURN totalPrice;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CreateNewOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CreateNewOrder`(
    customerId INT,
    modelId INT,
    rentalDate DATE,
    rentalDays INT,
    extrasList TEXT
) RETURNS int
    DETERMINISTIC
BEGIN
    -- Declare variables
    DECLARE newOrderId INT;
    DECLARE currDate Date;
    DECLARE extraId INT; -- Declare variable to store extra ID
    DECLARE done INT DEFAULT FALSE;
	DECLARE extrasCursor CURSOR FOR SELECT ExtraID FROM `carrental`.`extras` WHERE FIND_IN_SET(ExtraID, extrasList);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    set currDate = current_date();
    set foreign_key_checks = 0;

    -- Create a new order
    INSERT INTO `carrental`.`orders` (`OrderDate`, `CollectionDate`, `RentalDays`, `OrderStatus`, `customers_CustomerID`, `models_ModelID`)
    VALUES (currDate ,rentalDate, rentalDays, 'pending', customerId, modelId);
    set foreign_key_checks = 1;

    
    -- Get the ID of the newly created order
    SET newOrderId = LAST_INSERT_ID();
    
    -- Add extras to the order if extrasList is not null
    IF extrasList IS NOT NULL THEN
        
        -- Open cursor to loop through extrasList
        OPEN extrasCursor;
        read_loop: LOOP
            FETCH extrasCursor INTO extraId;
            IF done THEN
                LEAVE read_loop;
            END IF;
            
            -- Insert each extra into orders_has_extras table
            INSERT INTO `carrental`.`orders_has_extras` (`orders_OrdersID`, `extras_ExtraID`)
            VALUES (newOrderId, extraId);
        END LOOP;
        CLOSE extrasCursor; -- Close the cursor
    END IF;
    
    -- Return the ID of the new order
    RETURN newOrderId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ReturnCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ReturnCar`(
    rentalId INT,
    returnKilometer INT,
    returnGasTank INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    UPDATE `carrental`.`rentals`
    SET ReturnKilometers = returnKilometer,
        ReturnGasTank = returnGasTank
    WHERE RentalID = rentalId;

    RETURN TRUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckAvailableCars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckAvailableCars`(
    IN rentalDate DATE,
    IN rentalDays INT
)
BEGIN
    SELECT
        m.ModelID,
        m.ModelName
    FROM
        `carrental`.`models` m
        -- Check if the number of orders for the model within the date 
        -- range is greater than the number of rentals for those orders
    WHERE
        (SELECT COUNT(*)
         FROM `carrental`.`orders` o
         WHERE m.ModelID = o.models_ModelID
           AND o.CollectionDate <= DATE_ADD(rentalDate, INTERVAL rentalDays DAY)
           AND DATE_ADD(o.CollectionDate, INTERVAL o.RentalDays DAY) >= rentalDate
        ) - (SELECT COUNT(*)
             FROM `carrental`.`rentals` r
             WHERE r.orders_OrdersID IN (
             -- Select orders for the model within the date range
                   SELECT o.OrdersID
                   FROM `carrental`.`orders` o
                   WHERE m.ModelID = o.models_ModelID
                     AND o.CollectionDate <= DATE_ADD(rentalDate, INTERVAL rentalDays DAY)
                     AND DATE_ADD(o.CollectionDate, INTERVAL o.RentalDays DAY) >= rentalDate
                 )
               
            ) = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateRentalFromOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateRentalFromOrder`(
    IN orderId INT
)
BEGIN
    DECLARE carId VARCHAR(10);

    -- Get the model ID and rental dates for the order
    DECLARE modelId INT;
    DECLARE collectionDate DATE;
    DECLARE rentalDays INT;
    DECLARE newRentalId INT;

    SELECT models_ModelID, CollectionDate, RentalDays
    INTO modelId, collectionDate, rentalDays
    FROM `carrental`.`orders`
    WHERE OrdersID = orderId;

    -- Select the car with the least kilometers from the model
    SELECT c.CarID
    INTO carId
    FROM `carrental`.`cars` c
    WHERE c.models_ModelID = modelId
    ORDER BY CarKilometers ASC
    LIMIT 1;
	
    select rentalid + 1 into newRentalId
    from  `carrental`.`rentals` r
    order by rentalId desc
    limit 1;
    
    -- Insert a new rental record
    INSERT INTO `carrental`.`rentals` (rentalId, orders_OrdersID, cars_CarID, ReturnKilometers)
    VALUES (newRentalId, orderId, carId, NULL);

    SELECT 'Rental created successfully' AS Message;
END ;;
DELIMITER ;
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

-- Dump completed on 2024-04-06 18:54:48
