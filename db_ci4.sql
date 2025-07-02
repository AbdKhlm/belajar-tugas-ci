-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_ci4
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `diskon`
--

DROP TABLE IF EXISTS `diskon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diskon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `nominal` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tanggal` (`tanggal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diskon`
--

LOCK TABLES `diskon` WRITE;
/*!40000 ALTER TABLE `diskon` DISABLE KEYS */;
INSERT INTO `diskon` VALUES (2,'2025-07-03',41132,'2025-07-03 17:43:48','2025-07-03 17:43:48'),(3,'2025-07-04',200000,'2025-07-04 17:43:48','2025-07-02 18:43:27'),(4,'2025-07-05',48308,'2025-07-05 17:43:48','2025-07-05 17:43:48'),(5,'2025-07-06',29201,'2025-07-06 17:43:48','2025-07-06 17:43:48'),(6,'2025-07-07',41864,'2025-07-07 17:43:48','2025-07-07 17:43:48'),(7,'2025-07-08',15339,'2025-07-08 17:43:48','2025-07-08 17:43:48'),(8,'2025-07-09',16145,'2025-07-09 17:43:48','2025-07-09 17:43:48'),(9,'2025-07-10',44754,'2025-07-10 17:43:48','2025-07-10 17:43:48'),(10,'2025-07-11',23205,'2025-07-11 17:43:48','2025-07-11 17:43:48');
/*!40000 ALTER TABLE `diskon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2025-05-14-100031','App\\Database\\Migrations\\User','default','App',1747218804,1),(2,'2025-05-14-100044','App\\Database\\Migrations\\Product','default','App',1747218804,1),(3,'2025-05-14-100104','App\\Database\\Migrations\\Transaction','default','App',1747218804,1),(4,'2025-05-14-100118','App\\Database\\Migrations\\TransactionDetail','default','App',1747218805,1),(5,'2025-07-02-171646','App\\Database\\Migrations\\AddDiskonTable','default','App',1751478209,2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `jumlah` int(5) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'ASUS TUF A15 FA506NF',10899000,6,'1749800774_8e594fa7a76dffe5e84d.jpg','2025-05-14 13:09:54','2025-07-02 20:36:19'),(2,'Asus Vivobook 14 A1404ZA',6899000,7,'1749800819_16cdcceb0271d0f33f1d.jpg','2025-05-14 13:09:54','2025-06-13 07:46:59'),(3,'Lenovo IdeaPad Slim 3-14IAU7',6299000,5,'1749800845_60aabbff23039b56560d.jpg','2025-05-14 13:09:54','2025-06-13 07:47:25'),(4,'MSI TITAN 18 HX',89000000,5,'1749800873_3ef6e5209003468b8b31.jpg','2025-05-25 07:27:46','2025-06-13 07:47:53');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `total_harga` double NOT NULL,
  `alamat` text NOT NULL,
  `ongkir` double DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'Khalim',10877476,'semarang',0,0,'2025-07-02 20:34:59','2025-07-02 20:34:59');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_detail`
--

DROP TABLE IF EXISTS `transaction_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `jumlah` int(5) NOT NULL,
  `diskon` double DEFAULT NULL,
  `subtotal_harga` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_detail`
--

LOCK TABLES `transaction_detail` WRITE;
/*!40000 ALTER TABLE `transaction_detail` DISABLE KEYS */;
INSERT INTO `transaction_detail` VALUES (1,1,1,1,21524,10877476,'2025-07-02 20:35:00','2025-07-02 20:35:00');
/*!40000 ALTER TABLE `transaction_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'suwarno.harjaya','hpermadi@suryono.org','$2y$10$lHgQIPZ.hijMNl1iZtslbOP7xCJS3U1h05yD.txAjDtyOo1SdDJE2','guest','2025-05-14 13:11:26',NULL),(2,'xmahendra','tirta.mayasari@yahoo.com','$2y$10$UkMDxZ487JHdvB0ahC0MoO8muaVtE6RYzAXVrnwEEzw0/TqCFaPpS','guest','2025-05-14 13:11:27',NULL),(3,'asuartini','rmayasari@wibisono.co.id','$2y$10$GqKyXpqlp5CvC2AQYR69FegFIUlPOJGTio0HCEm0w4fACBkppGtUC','guest','2025-05-14 13:11:27',NULL),(4,'maulana.ulva','sbudiman@yahoo.co.id','$2y$10$INtPdSUBTAR61tt8FKTRtekOhR1WD0Wdt.FptBV7WtoHXc58xOLU2','guest','2025-05-14 13:11:27',NULL),(5,'pratiwi.dirja','dtampubolon@farida.biz.id','$2y$10$vFGzh7UbL/jQkN0kHZts1eZhx4qZ1uajjcHLtiTrkjen.vVCB.EbW','admin','2025-05-14 13:11:27',NULL),(6,'salimah.setiawan','grahimah@pertiwi.or.id','$2y$10$8XYlDbLREZMV65sblYLO0OzhajcosjNkn5eAgaucClgNQtzVjWzYW','admin','2025-05-14 13:11:27',NULL),(7,'esaragih','febi.astuti@napitupulu.sch.id','$2y$10$vqBW7PG./vGKdAjCVW4xs.P7IE5D8StrTygtFufNDTVJso2EZYAKG','admin','2025-05-14 13:11:28',NULL),(8,'oktaviani.zaenab','blailasari@yahoo.co.id','$2y$10$j34.O3lU.5Oc1rZVXRB03ePFM/rhtSySwVdiq77qGtjfZPXMu/zZ.','guest','2025-05-14 13:11:28',NULL),(9,'pranata.wacana','lharyanti@gmail.co.id','$2y$10$IRs/fEWhiIRss2nH1aWU4Ozmq/s9JUz7DwUkb6Rx1NVF0G4WSBzKm','guest','2025-05-14 13:11:28',NULL),(10,'Khalim','111202315327@mhs.dinus.ac.id','$2y$10$AWNu9PJw/lnu0K.tQyhz9.tVTXXngJovpwPDGJFFTMVeSXDnWzHai','admin','2025-05-25 06:38:45',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-03  4:25:10
