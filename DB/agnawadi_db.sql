-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2023 at 08:32 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agnawadi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `agnawadi`
--

CREATE TABLE `agnawadi` (
  `A_ID` int(5) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `District` varchar(100) NOT NULL,
  `Taluka` varchar(100) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `P_number1` varchar(10) NOT NULL,
  `P_number2` varchar(10) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `agna_inventory`
--

CREATE TABLE `agna_inventory` (
  `inv_ID` int(5) NOT NULL,
  `A_ID` int(5) NOT NULL,
  `P_ID` int(5) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `quantity` int(255) NOT NULL,
  `P_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `agna_request`
--

CREATE TABLE `agna_request` (
  `R_ID` int(5) NOT NULL,
  `A_ID` int(5) NOT NULL,
  `P_ID` int(5) NOT NULL,
  `quantity` int(50) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `head`
--

CREATE TABLE `head` (
  `H_ID` int(5) NOT NULL,
  `H_name` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `H_number1` varchar(10) NOT NULL,
  `H_number2` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `history table`
--

CREATE TABLE `history table` (
  `P_ID` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `A_ID` int(5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_ID` int(5) NOT NULL,
  `A_ID` int(5) NOT NULL,
  `P_ID` int(5) NOT NULL,
  `H_ID` int(5) NOT NULL,
  `S_ID` int(5) NOT NULL,
  `quantity` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `P_ID` int(5) NOT NULL,
  `P_name` varchar(100) NOT NULL,
  `P_cat` varchar(100) NOT NULL,
  `unit` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `S_ID` int(5) NOT NULL,
  `S_name` varchar(100) NOT NULL,
  `S_cat` varchar(50) NOT NULL,
  `S_number1` varchar(10) NOT NULL,
  `S_number2` varchar(10) NOT NULL,
  `district` varchar(100) NOT NULL,
  `taluka` varchar(100) NOT NULL,
  `pincode` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_history`
--

CREATE TABLE `supplier_history` (
  `SH_IS` int(5) NOT NULL,
  `S_ID` int(5) NOT NULL,
  `order_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agnawadi`
--
ALTER TABLE `agnawadi`
  ADD PRIMARY KEY (`A_ID`);

--
-- Indexes for table `agna_inventory`
--
ALTER TABLE `agna_inventory`
  ADD PRIMARY KEY (`inv_ID`),
  ADD KEY `foreignkey1` (`A_ID`),
  ADD KEY `foreignkey2` (`P_ID`);

--
-- Indexes for table `agna_request`
--
ALTER TABLE `agna_request`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `foreignkey9` (`A_ID`),
  ADD KEY `foreignkey10` (`P_ID`);

--
-- Indexes for table `head`
--
ALTER TABLE `head`
  ADD PRIMARY KEY (`H_ID`),
  ADD UNIQUE KEY `pwd` (`pwd`);

--
-- Indexes for table `history table`
--
ALTER TABLE `history table`
  ADD KEY `foreign_key_1` (`P_ID`),
  ADD KEY `foreign_key_2` (`A_ID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_ID`),
  ADD KEY `foreignkey3` (`P_ID`),
  ADD KEY `foreignkey4` (`S_ID`),
  ADD KEY `foreignkey5` (`A_ID`),
  ADD KEY `foreignkey6` (`H_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`P_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`S_ID`);

--
-- Indexes for table `supplier_history`
--
ALTER TABLE `supplier_history`
  ADD PRIMARY KEY (`SH_IS`),
  ADD KEY `foreignkey7` (`order_ID`),
  ADD KEY `foreignkey8` (`S_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agnawadi`
--
ALTER TABLE `agnawadi`
  MODIFY `A_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agna_inventory`
--
ALTER TABLE `agna_inventory`
  MODIFY `inv_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agna_request`
--
ALTER TABLE `agna_request`
  MODIFY `R_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `head`
--
ALTER TABLE `head`
  MODIFY `H_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `P_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `S_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_history`
--
ALTER TABLE `supplier_history`
  MODIFY `SH_IS` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agna_inventory`
--
ALTER TABLE `agna_inventory`
  ADD CONSTRAINT `foreignkey1` FOREIGN KEY (`A_ID`) REFERENCES `agnawadi` (`A_ID`),
  ADD CONSTRAINT `foreignkey2` FOREIGN KEY (`P_ID`) REFERENCES `product` (`P_ID`);

--
-- Constraints for table `agna_request`
--
ALTER TABLE `agna_request`
  ADD CONSTRAINT `foreignkey10` FOREIGN KEY (`P_ID`) REFERENCES `product` (`P_ID`),
  ADD CONSTRAINT `foreignkey9` FOREIGN KEY (`A_ID`) REFERENCES `agnawadi` (`A_ID`);

--
-- Constraints for table `history table`
--
ALTER TABLE `history table`
  ADD CONSTRAINT `foreign_key_1` FOREIGN KEY (`P_ID`) REFERENCES `product` (`P_ID`),
  ADD CONSTRAINT `foreign_key_2` FOREIGN KEY (`A_ID`) REFERENCES `agnawadi` (`A_ID`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `foreignkey3` FOREIGN KEY (`P_ID`) REFERENCES `product` (`P_ID`),
  ADD CONSTRAINT `foreignkey4` FOREIGN KEY (`S_ID`) REFERENCES `supplier` (`S_ID`),
  ADD CONSTRAINT `foreignkey5` FOREIGN KEY (`A_ID`) REFERENCES `agnawadi` (`A_ID`),
  ADD CONSTRAINT `foreignkey6` FOREIGN KEY (`H_ID`) REFERENCES `head` (`H_ID`);

--
-- Constraints for table `supplier_history`
--
ALTER TABLE `supplier_history`
  ADD CONSTRAINT `foreignkey7` FOREIGN KEY (`order_ID`) REFERENCES `order_details` (`order_ID`),
  ADD CONSTRAINT `foreignkey8` FOREIGN KEY (`S_ID`) REFERENCES `supplier` (`S_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
