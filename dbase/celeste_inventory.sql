-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2026 at 04:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `celeste_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action_description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action_description`, `created_at`) VALUES
(1, 1, 'Logged into the system.', '2026-03-21 02:32:54'),
(2, 1, 'Logged into the system.', '2026-03-21 03:33:11'),
(3, 1, 'Updated warehouse details: Aurum Alliance Warehouse', '2026-03-21 04:00:57'),
(4, 1, 'Updated warehouse details: Aurum Alliance Warehouse', '2026-03-21 04:01:12'),
(5, 1, 'Logged into the system.', '2026-03-21 04:52:37'),
(6, 1, 'Added new product: Diamond Studs (12 pcs)', '2026-03-20 01:00:00'),
(7, 1, 'Updated stock for Gold Hoop Earrings', '2026-03-21 00:30:00'),
(8, 1, 'Processed ORD-2026-009 as Completed', '2026-03-20 02:05:00'),
(9, 1, 'Cancelled ORD-2026-010 due to customer request', '2026-03-21 00:05:00'),
(10, 1, 'Assigned Seph Guirren to Zone 2', '2026-03-21 03:00:00'),
(11, 1, 'Hired new supervisor: Lyndolf Rodriguez', '2026-03-21 05:07:53'),
(12, 1, 'Updated profile for supervisor: Lyndolf Rodriguez', '2026-03-21 05:08:21'),
(13, 1, 'Updated details for: Diamond Tennis Necklace', '2026-03-21 05:13:20'),
(14, 1, 'Updated details for: Sapphire Engagement Ring', '2026-03-21 05:15:12'),
(15, 11, 'Logged into the system.', '2026-03-21 05:32:02'),
(16, 1, 'Logged into the system.', '2026-03-21 05:38:35'),
(17, 11, 'Logged into the system.', '2026-03-21 05:41:19'),
(18, 7, 'Logged into the system.', '2026-03-21 05:42:16'),
(19, 1, 'Logged into the system.', '2026-03-21 06:52:24'),
(20, 1, 'Updated Order ORD-2026-010 status from Cancelled to Completed', '2026-03-21 07:04:28'),
(21, 7, 'Logged into the system.', '2026-03-21 07:04:59'),
(22, 1, 'Logged into the system.', '2026-03-21 07:14:48'),
(23, 7, 'Logged into the system.', '2026-03-21 07:18:23'),
(24, 1, 'Logged into the system.', '2026-03-21 07:59:05'),
(25, 1, 'Logged into the system.', '2026-03-22 12:45:07'),
(26, 1, 'Updated Order ORD-2026-008 status from Pending to Completed', '2026-03-22 12:45:36'),
(27, 7, 'Logged into the system.', '2026-03-22 12:48:33'),
(28, 1, 'Logged into the system.', '2026-03-22 12:49:23'),
(29, 1, 'Logged into the system.', '2026-03-24 09:26:28'),
(30, 1, 'Completed sale: 23x Diamond Tennis Necklace to Gabriela Silang', '2026-03-24 09:44:55'),
(31, 6, 'Logged into the system.', '2026-03-24 09:49:32'),
(32, 1, 'Logged into the system.', '2026-03-24 10:02:10'),
(33, 1, 'Completed sale: 200x Leather Braided Bracelet to Mechora Aquino', '2026-03-24 10:26:22'),
(34, 1, 'Logged into the system.', '2026-03-24 11:19:24'),
(35, 6, 'Logged into the system.', '2026-03-24 11:30:49'),
(36, 1, 'Logged into the system.', '2026-03-24 11:32:31'),
(37, 1, 'Added new product: 24k Gold Pearl Choker (18 pcs)', '2026-03-24 12:03:55'),
(38, 1, 'Updated details for: 24k Gold Pearl Choker', '2026-03-24 12:10:24'),
(39, 1, 'Deleted product: 24k Gold Pearl Choker', '2026-03-24 12:10:30'),
(40, 1, 'Added new product: 24k Gold Pearl Choker (SKU: NK-6966)', '2026-03-24 12:11:01'),
(41, 1, 'Logged into the system.', '2026-03-24 12:14:30'),
(42, 1, 'Logged into the system.', '2026-03-24 12:20:40'),
(43, 1, 'Logged into the system.', '2026-03-25 00:34:05'),
(44, 1, 'Logged into the system.', '2026-03-25 00:47:05'),
(45, 1, 'Logged into the system.', '2026-03-25 01:11:21'),
(46, 1, 'Logged into the system.', '2026-03-25 03:22:35'),
(47, 1, 'Logged into the system.', '2026-03-25 03:41:12'),
(48, 1, 'Logged into the system.', '2026-03-25 05:20:46'),
(49, 1, 'Logged into the system.', '2026-03-26 12:01:21'),
(50, 6, 'Logged into the system.', '2026-03-27 00:28:10'),
(51, 1, 'Logged into the system.', '2026-03-27 00:55:15'),
(52, 1, 'Updated supervisor: Chai R. Guirren', '2026-03-27 02:10:07'),
(53, 11, 'Logged into the system.', '2026-03-27 02:10:36'),
(54, 6, 'Logged into the system.', '2026-03-27 02:28:28'),
(55, 11, 'Logged into the system.', '2026-03-27 02:37:25'),
(56, 6, 'Logged into the system.', '2026-03-27 02:38:00'),
(57, 6, 'Logged into the system.', '2026-03-27 02:40:36'),
(58, 6, 'Logged into the system.', '2026-03-27 02:54:22'),
(59, 1, 'Logged into the system.', '2026-03-27 03:05:00'),
(60, 1, 'Updated product: Leather Braided Bracelet', '2026-03-27 03:16:43'),
(61, 1, 'Updated product: Sterling Silver Signet', '2026-03-27 03:16:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `category` enum('Neckwear','Finger Ring','Wristwear','Earwear') NOT NULL,
  `purchase_price` decimal(15,2) NOT NULL,
  `sale_price` decimal(15,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `warehouse_id` int(11) DEFAULT NULL,
  `status` varchar(20) GENERATED ALWAYS AS (case when `stock_quantity` <= 0 then 'Out of Stock' when `stock_quantity` <= 10 then 'Low Stock' else 'In Stock' end) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `sku`, `category`, `purchase_price`, `sale_price`, `stock_quantity`, `warehouse_id`) VALUES
(1, '18k Gold Pearl Choker', 'NK-001', 'Neckwear', 5000.00, 12000.00, 45, 1),
(2, 'Silver Chain Pendant', 'NK-002', 'Neckwear', 1500.00, 4500.00, 120, 2),
(3, 'Diamond Tennis Necklace', 'NK-003', 'Neckwear', 25000.00, 55000.00, 41, 1),
(4, 'Sapphire Engagement Ring', 'RG-001', 'Finger Ring', 12000.00, 28000.00, 24, 3),
(5, 'Rose Gold Band', 'RG-002', 'Finger Ring', 3500.00, 8500.00, 50, 2),
(6, 'Sterling Silver Signet', 'RG-003', 'Finger Ring', 1200.00, 3200.00, 1230, 1),
(7, 'Platinum Cuff', 'WW-001', 'Wristwear', 18000.00, 42000.00, 8, 4),
(8, 'Leather Braided Bracelet', 'WW-002', 'Wristwear', 500.00, 1500.00, 1200, 3),
(9, 'Gold Hoop Earrings', 'EW-001', 'Earwear', 2500.00, 6500.00, 17, 2),
(10, 'Diamond Studs', 'EW-002', 'Earwear', 15000.00, 35000.00, 12, 1),
(12, '24k Gold Pearl Choker', 'NK-6966', 'Neckwear', 18000.00, 26000.00, 28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `status` enum('Completed','Pending','Cancelled') DEFAULT 'Pending',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `processed_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_number`, `customer_name`, `product_id`, `quantity`, `total_amount`, `status`, `order_date`, `processed_by_id`) VALUES
(1, 'ORD-2026-001', 'Maria Clara', 1, 1, 12000.00, 'Completed', '2026-01-10 02:30:00', 1),
(2, 'ORD-2026-002', 'Juan Dela Cruz', 5, 1, 8500.00, 'Completed', '2026-01-22 06:15:00', 1),
(3, 'ORD-2026-003', 'Leonor Rivera', 4, 1, 28000.00, 'Completed', '2026-02-05 01:45:00', 1),
(4, 'ORD-2026-004', 'Andres Bonifacio', 3, 1, 55000.00, 'Pending', '2026-02-18 08:20:00', 1),
(5, 'ORD-2026-005', 'Emilio Aguinaldo', 2, 1, 4500.00, 'Cancelled', '2026-02-28 03:10:00', 1),
(6, 'ORD-2026-006', 'Gabriela Silang', 7, 1, 42000.00, 'Completed', '2026-03-05 05:00:00', 1),
(7, 'ORD-2026-007', 'Antonio Luna', 10, 1, 35000.00, 'Completed', '2026-03-12 07:30:00', 1),
(8, 'ORD-2026-008', 'Jose Rizal', 9, 1, 6500.00, 'Completed', '2026-03-18 02:00:00', 1),
(9, 'ORD-2026-009', 'Apolinario Mabini', 8, 10, 15000.00, 'Completed', '2026-03-20 01:15:00', 1),
(10, 'ORD-2026-010', 'Melchora Aquino', 6, 1, 3200.00, 'Completed', '2026-03-21 00:00:00', 1),
(11, 'ORD-202603241744', 'Gabriela Silang', 3, 23, 1265000.00, 'Completed', '2026-03-24 09:44:55', 1),
(12, 'ORD-202603241826', 'Mechora Aquino', 8, 200, 300000.00, 'Completed', '2026-03-24 10:26:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Superadmin','Admin') DEFAULT 'Admin',
  `assigned_warehouse_id` int(11) DEFAULT NULL,
  `last_active` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `role`, `assigned_warehouse_id`, `last_active`) VALUES
(1, 'Yushiro Fe', 'superadmin', 'admin123', 'Superadmin', NULL, '2026-03-27 11:05:00'),
(6, 'Teen Tech', 'teentech', 'admin123', 'Admin', 1, '2026-03-27 10:54:22'),
(7, 'Seph Guirren', 'sephguirren', 'admin123', 'Admin', 2, '2026-03-22 20:48:33'),
(8, 'Arwin Manzano', 'arwin', 'admin123', 'Admin', 8, NULL),
(9, 'Kenneth Moises', 'kenneth', 'admin123', 'Admin', 3, NULL),
(10, 'Dave Padre', 'dave', 'admin123', 'Admin', 4, NULL),
(11, 'Chai R. Guirren', 'allie', 'admin123', 'Admin', 7, '2026-03-27 10:37:25'),
(12, 'Lyndolf Rodriguez', 'lyn', 'admin123', 'Admin', 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL,
  `warehouse_name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `warehouse_name`, `address`, `created_at`) VALUES
(1, 'Lustre Hub', 'Bangued, Abra', '2026-03-20 13:57:05'),
(2, 'The Carat Collective', 'Bangued, Abra', '2026-03-20 13:57:05'),
(3, 'Facet Flora', 'Bangued, Abra', '2026-03-20 13:57:05'),
(4, 'Precious Cargo Deput', 'Bangued, Abra', '2026-03-20 13:57:05'),
(5, 'The Refinery Works', 'Bangued, Abra', '2026-03-20 13:57:05'),
(6, 'Aurum Alliance Warehouse', 'Bangued, Abra', '2026-03-20 13:57:05'),
(7, 'The Gilded Vault', 'Bangued, Abra', '2026-03-20 13:57:05'),
(8, 'Prism Fort Logistics', 'Bangued, Abra', '2026-03-20 13:57:05'),
(9, 'The Velvet Annex', 'Bangued, Abra', '2026-03-20 13:57:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `processed_by_id` (`processed_by_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `assigned_warehouse_id` (`assigned_warehouse_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`processed_by_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`assigned_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
