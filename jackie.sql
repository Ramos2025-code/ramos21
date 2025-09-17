-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2025 at 03:58 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jackie`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` int NOT NULL,
  `address` varchar(30) NOT NULL,
  `password` int NOT NULL,
  UNIQUE KEY `CustomerID` (`CustomerID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `name`, `email`, `mobile`, `address`, `password`) VALUES
(1234, 'dennis', 'dennis@gmail.com', 2147483647, 'alimodian', 12345678),
(1235, 'kyle', 'kyle@gmail.com', 2147483647, 'pototan', 12345679),
(1236, 'james', 'james@gmail.com', 2147483647, 'jaro', 12345670);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` int NOT NULL,
  `customerID` int NOT NULL,
  `orderDate` int NOT NULL,
  `totalAmount` int NOT NULL,
  `status` varchar(30) NOT NULL,
  UNIQUE KEY `customerID` (`customerID`),
  UNIQUE KEY `orderID` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `customerID`, `orderDate`, `totalAmount`, `status`) VALUES
(2345, 1234, 9, 70, 'paldo'),
(2346, 1235, 9, 65, 'paldo'),
(2347, 1236, 9, 350, 'paldo');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `paymentID` int NOT NULL,
  `orderID` int NOT NULL,
  `paymentDate` int NOT NULL,
  `amount` int NOT NULL,
  `PaymentMethod` varchar(30) NOT NULL,
  UNIQUE KEY `orderID` (`orderID`),
  UNIQUE KEY `amount` (`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentID`, `orderID`, `paymentDate`, `amount`, `PaymentMethod`) VALUES
(3456, 2345, 9, 50, 'Gcash'),
(3457, 2346, 9, 45, 'Gcash'),
(3458, 2347, 9, 250, 'Gcash');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productID` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(25) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `price` (`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `name`, `price`, `category`, `stock`) VALUES
(123, 'Redhorse', 50, 'Drinks', 50),
(124, 'San Mig', 45, 'Drinks', 30),
(125, 'Sisig', 250, 'Food', 10);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `orders` (`customerID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `payments` (`orderID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`price`) REFERENCES `payments` (`amount`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
