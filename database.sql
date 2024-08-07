-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for product
CREATE DATABASE IF NOT EXISTS `product` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `product`;

-- Dumping structure for table product.bill_transaction
CREATE TABLE IF NOT EXISTS `bill_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table product.bill_transaction: ~0 rows (approximately)
INSERT INTO `bill_transaction` (`id`, `order_number`, `create_date`) VALUES
	(1, 'TRX1723011457528435cfa7f-664a-4ee0-bbf9-0a6aa10b1ce1', '2024-08-07 13:17:37'),
	(2, 'TRX17230151034321c7cefa4-be4f-4e23-a03d-2829d7360856', '2024-08-07 14:18:23');

-- Dumping structure for table product.category_product
CREATE TABLE IF NOT EXISTS `category_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `station` varchar(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table product.category_product: ~2 rows (approximately)
INSERT INTO `category_product` (`id`, `name`, `station`, `create_date`, `update_datetime`) VALUES
	(1, 'MAKANAN', 'B', '2024-08-06 12:58:04', NULL),
	(2, 'MINUMAN', 'C', '2024-08-06 12:58:13', NULL);

-- Dumping structure for table product.list_product
CREATE TABLE IF NOT EXISTS `list_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dine` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table product.list_product: ~6 rows (approximately)
INSERT INTO `list_product` (`id`, `order_id`, `dine`, `name`, `type`, `category`, `create_date`, `update_datetime`) VALUES
	(1, 'TRX1723011457528435cfa7f-664a-4ee0-bbf9-0a6aa10b1ce1', 1, 'Es Jeruk', 1, 2, '2024-08-07 13:17:37', NULL),
	(2, 'TRX1723011457528435cfa7f-664a-4ee0-bbf9-0a6aa10b1ce1', 1, 'Kopi', 2, 2, '2024-08-07 13:18:33', NULL),
	(3, 'TRX1723011457528435cfa7f-664a-4ee0-bbf9-0a6aa10b1ce1', 1, 'Teh Manis', 3, 2, '2024-08-07 13:19:43', NULL),
	(4, 'TRX1723011457528435cfa7f-664a-4ee0-bbf9-0a6aa10b1ce1', 1, 'Mie Goreng', 5, 1, '2024-08-07 13:20:55', NULL),
	(5, 'TRX1723011457528435cfa7f-664a-4ee0-bbf9-0a6aa10b1ce1', 1, 'Nasi Goreng + Jeruk Dingin', 7, 1, '2024-08-07 13:38:10', NULL),
	(6, 'TRX17230151034321c7cefa4-be4f-4e23-a03d-2829d7360856', 2, 'Teh Hangat', 2, 2, '2024-08-07 14:18:23', NULL);

-- Dumping structure for table product.station_printer
CREATE TABLE IF NOT EXISTS `station_printer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `station` varchar(1) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table product.station_printer: ~2 rows (approximately)
INSERT INTO `station_printer` (`id`, `station`, `name`, `create_date`, `update_datetime`) VALUES
	(1, 'A', 'Printer Kasir', '2024-08-06 13:20:24', NULL),
	(2, 'B', 'Printer Dapur (Makanan)', '2024-08-06 13:20:41', NULL),
	(3, 'C', 'Printer Bar (Minuman)', '2024-08-06 13:20:56', NULL);

-- Dumping structure for table product.table_customer
CREATE TABLE IF NOT EXISTS `table_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_dine` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table product.table_customer: ~2 rows (approximately)
INSERT INTO `table_customer` (`id`, `table_dine`, `create_date`, `update_datetime`) VALUES
	(1, 'MEJA NO 1', '2024-08-06 14:18:46', NULL),
	(2, 'MEJA NO 2', '2024-08-06 14:18:58', NULL),
	(3, 'MEJA NO 3', '2024-08-06 14:19:01', NULL);

-- Dumping structure for table product.type_product
CREATE TABLE IF NOT EXISTS `type_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table product.type_product: ~7 rows (approximately)
INSERT INTO `type_product` (`id`, `name`, `price`, `diskon`, `create_date`, `update_datetime`) VALUES
	(1, 'DINGIN', 12000, NULL, '2024-08-06 10:15:42', NULL),
	(2, 'PANAS', 10000, NULL, '2024-08-06 10:16:15', NULL),
	(3, 'MANIS', 8000, NULL, '2024-08-06 10:16:16', NULL),
	(4, 'TAWAR', 5000, NULL, '2024-08-06 10:16:17', NULL),
	(5, 'GORENG', 15000, NULL, '2024-08-06 10:20:10', NULL),
	(6, 'KUAH', 15000, NULL, '2024-08-06 10:20:20', NULL),
	(7, 'NASI GORENG + JERUK DINGIN ( PROMO )', 27000, 4000, '2024-08-07 13:31:17', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
