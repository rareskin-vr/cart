-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2022 at 02:21 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cart_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf16_swedish_ci NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `product_name`, `cost`, `quantity`) VALUES
(1, 1, 1, 'Product 1', '10.99', 2),
(2, 1, 2, 'Product 2', '19.99', 1),
(3, 2, 3, 'Product 3', '29.99', 3);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `sender` varchar(255) COLLATE utf16_swedish_ci NOT NULL,
  `recipient` varchar(255) COLLATE utf16_swedish_ci NOT NULL,
  `message` text COLLATE utf16_swedish_ci NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `sender`, `recipient`, `message`, `timestamp`) VALUES
(1, 'user1', 'admin', 'Hello, can you help me with something?', '2022-12-18 20:18:12'),
(2, 'admin', 'user1', 'Sure, what do you need help with?', '2022-12-18 20:18:12'),
(3, 'user1', 'admin', 'I need help with my account.', '2022-12-18 20:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf16_swedish_ci NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `cost`, `stock`) VALUES
(1, 'Product 1', '10.99', 100),
(2, 'Product 2', '19.99', 50),
(3, 'Product 3', '29.99', 25);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `product_id`, `cost`, `quantity`) VALUES
(1, 1, 1, '10.99', 2),
(2, 1, 2, '19.99', 1),
(3, 2, 3, '29.99', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) COLLATE utf16_swedish_ci NOT NULL,
  `password` varchar(30) COLLATE utf16_swedish_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `email` varchar(30) COLLATE utf16_swedish_ci DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `address` varchar(30) COLLATE utf16_swedish_ci DEFAULT NULL,
  `pan` varchar(30) COLLATE utf16_swedish_ci DEFAULT NULL,
  `aadhar` varchar(30) COLLATE utf16_swedish_ci DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT 0,
  `picUrl` varchar(50) COLLATE utf16_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `type`, `email`, `phone`, `address`, `pan`, `aadhar`, `block`, `picUrl`) VALUES
(1, 'superadmin', 'password123', 0, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(2, 'admin', 'password456', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(3, 'user1', 'password789', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(4, 'user2', 'password012', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(5, 'user3', 'password123', 2, 'user3@example.com', 1234567890, '123 Main St', 'ABCDE1234F', '1234567890', 0, NULL),
(6, 'user4', 'password456', 2, 'user4@example.com', 987654321, '456 Main St', 'FGHIJ5678G', '0987654321', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `balance` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`balance`, `user_id`) VALUES
('100.00', 1),
('200.00', 2),
('300.00', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
