-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2022 at 04:44 PM
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
-- Database: `parking_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `rate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `rate`) VALUES
(1, 'Tesla Model Y', 0.7),
(2, 'Tesla Model 3 ', 0.5),
(3, 'Ford Mustang Mach-E', 0.3),
(4, 'Chevrolet Bolt EUV', 0.4);

-- --------------------------------------------------------

--
-- Table structure for table `parked_list`
--

CREATE TABLE `parked_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `location_id` int(30) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `vehicle_brand` varchar(200) NOT NULL,
  `vehicle_registration` varchar(15) NOT NULL,
  `owner` text NOT NULL,
  `vehicle_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=in, 2= out',
  `amount_due` double NOT NULL,
  `amount_tendered` double NOT NULL,
  `amount_change` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parked_list`
--

INSERT INTO `parked_list` (`id`, `category_id`, `location_id`, `ref_no`, `vehicle_brand`, `vehicle_registration`, `owner`, `vehicle_description`, `status`, `amount_due`, `amount_tendered`, `amount_change`, `date_created`) VALUES
(25, 2, 2, '2503513193', 'Tesla 1', '001', 'Mahfuz', 'everything is fine!', 2, 0.041666666666667, 1, 0.96, '2022-07-26 13:32:32'),
(26, 3, 3, '3529754766', 'Ford Mustang', '002', 'Shanto', 'Nothing!', 1, 0, 0, 0, '2022-07-26 13:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `parking_locations`
--

CREATE TABLE `parking_locations` (
  `id` int(30) NOT NULL,
  `location` text NOT NULL,
  `capacity` int(11) NOT NULL,
  `category_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parking_locations`
--

INSERT INTO `parking_locations` (`id`, `location`, `capacity`, `category_id`) VALUES
(1, 'Area Block 1', 10, 1),
(2, 'Area Block 2', 30, 2),
(3, 'Area Block 3', 20, 3),
(4, 'Area Block 4', 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `parking_movement`
--

CREATE TABLE `parking_movement` (
  `id` int(30) NOT NULL,
  `pl_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = in ,2 = out',
  `created_timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parking_movement`
--

INSERT INTO `parking_movement` (`id`, `pl_id`, `status`, `created_timestamp`) VALUES
(29, 18, 1, '2022-07-24 23:53:58'),
(30, 19, 1, '2022-07-24 23:56:04'),
(31, 20, 1, '2022-07-24 23:57:36'),
(32, 21, 1, '2022-07-24 23:59:22'),
(33, 22, 1, '2022-07-25 00:04:18'),
(34, 23, 1, '2022-07-25 00:06:58'),
(35, 23, 2, '2022-07-25 00:31:00'),
(36, 22, 2, '2022-07-25 00:44:00'),
(37, 24, 1, '2022-07-25 11:56:11'),
(38, 21, 2, '2022-07-25 12:28:00'),
(39, 25, 1, '2022-07-26 13:32:32'),
(40, 26, 1, '2022-07-26 13:37:14'),
(41, 25, 2, '2022-07-26 13:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1 = Admin, 2= staff',
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `type`, `username`, `password`) VALUES
(1, 'Admin', 1, 'admin', '0192023a7bbd73250516f069df18b500');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parked_list`
--
ALTER TABLE `parked_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parking_locations`
--
ALTER TABLE `parking_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parking_movement`
--
ALTER TABLE `parking_movement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parked_list`
--
ALTER TABLE `parked_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `parking_locations`
--
ALTER TABLE `parking_locations`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parking_movement`
--
ALTER TABLE `parking_movement`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
