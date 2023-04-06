-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2023 at 09:28 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `contactno` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` varchar(10) NOT NULL,
  `p_id` varchar(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `status` char(10) DEFAULT NULL CHECK (`status` in ('available','unavailable'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` varchar(15) NOT NULL,
  `emp_name` varchar(20) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_profile`
--

CREATE TABLE `employee_profile` (
  `emp_id` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `mobile_no` char(10) DEFAULT NULL,
  `salary` int(10) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL CHECK (`gender` in ('m','f')),
  `aadhar_card` char(12) DEFAULT NULL,
  `account_no` char(15) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL CHECK (`status` in ('active','inactive')),
  `qualification` varchar(10) DEFAULT NULL,
  `experience` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(10) NOT NULL,
  `p_id` varchar(10) DEFAULT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `promo` char(12) DEFAULT NULL,
  `tax` char(10) DEFAULT NULL,
  `cart_id` varchar(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` varchar(10) NOT NULL,
  `order_id` varchar(10) DEFAULT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `status` char(10) DEFAULT NULL CHECK (`status` in ('successful','pending','failed'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` varchar(10) NOT NULL,
  `sc_id` varchar(10) DEFAULT NULL,
  `shop_id` varchar(10) DEFAULT NULL,
  `product_name` varchar(15) DEFAULT NULL,
  `company_name` varchar(10) DEFAULT NULL,
  `origin_country` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_cate`
--

CREATE TABLE `product_cate` (
  `c_id` varchar(15) NOT NULL,
  `c_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `pd_id` varchar(10) NOT NULL,
  `p_id` varchar(10) DEFAULT NULL,
  `model_no` varchar(10) DEFAULT NULL,
  `model_name` varchar(20) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL CHECK (`color` in ('red','grey','black','white')),
  `size` varchar(10) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(225) DEFAULT NULL,
  `stock` char(10) DEFAULT NULL,
  `status` char(10) DEFAULT NULL CHECK (`status` in ('available','not available'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_s_cate`
--

CREATE TABLE `product_s_cate` (
  `sc_id` varchar(15) NOT NULL,
  `c_id` varchar(15) DEFAULT NULL,
  `sc_name` varchar(25) DEFAULT NULL,
  `offer` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` varchar(15) NOT NULL,
  `role_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_assign`
--

CREATE TABLE `role_assign` (
  `role_id` varchar(15) NOT NULL,
  `emp_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` varchar(10) NOT NULL,
  `payment_id` varchar(10) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `shipping_address` varchar(20) DEFAULT NULL,
  `expecteddelivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `shop_id` varchar(10) NOT NULL,
  `shop_name` varchar(20) DEFAULT NULL,
  `shop_type` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopkeeper_profile`
--

CREATE TABLE `shopkeeper_profile` (
  `owner_id` varchar(10) NOT NULL,
  `email` varchar(10) NOT NULL,
  `contact_no` char(10) NOT NULL,
  `owner_img` varchar(100) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL CHECK (`gender` in ('m','f'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_profile`
--

CREATE TABLE `shop_profile` (
  `shop_id` varchar(10) DEFAULT NULL,
  `owner_id` varchar(10) DEFAULT NULL,
  `profile_id` varchar(10) NOT NULL,
  `licence` char(15) DEFAULT NULL,
  `reg_no` char(10) DEFAULT NULL,
  `gst_no` char(10) DEFAULT NULL,
  `aadhar_card` char(12) DEFAULT NULL,
  `shop_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(10) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `user_id` varchar(10) NOT NULL,
  `full_name` varchar(20) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `contact_no` char(10) NOT NULL,
  `gender` char(2) DEFAULT NULL CHECK (`gender` in ('m','f')),
  `address` varchar(30) DEFAULT NULL,
  `aadhar_card` char(12) DEFAULT NULL,
  `pincode` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `employee_profile`
--
ALTER TABLE `employee_profile`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`),
  ADD UNIQUE KEY `aadhar_card` (`aadhar_card`),
  ADD UNIQUE KEY `account_no` (`account_no`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `sc_id` (`sc_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `product_cate`
--
ALTER TABLE `product_cate`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`pd_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `product_s_cate`
--
ALTER TABLE `product_s_cate`
  ADD PRIMARY KEY (`sc_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_assign`
--
ALTER TABLE `role_assign`
  ADD PRIMARY KEY (`role_id`,`emp_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `shopkeeper_profile`
--
ALTER TABLE `shopkeeper_profile`
  ADD PRIMARY KEY (`owner_id`,`email`,`contact_no`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `contact_no` (`contact_no`);

--
-- Indexes for table `shop_profile`
--
ALTER TABLE `shop_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `licence` (`licence`),
  ADD UNIQUE KEY `reg_no` (`reg_no`),
  ADD UNIQUE KEY `gst_no` (`gst_no`),
  ADD UNIQUE KEY `aadhar_card` (`aadhar_card`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`user_id`,`email`,`contact_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`);

--
-- Constraints for table `employee_profile`
--
ALTER TABLE `employee_profile`
  ADD CONSTRAINT `employee_profile_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`user_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sc_id`) REFERENCES `product_s_cate` (`sc_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`);

--
-- Constraints for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `product_detail_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`);

--
-- Constraints for table `product_s_cate`
--
ALTER TABLE `product_s_cate`
  ADD CONSTRAINT `product_s_cate_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `product_cate` (`c_id`);

--
-- Constraints for table `role_assign`
--
ALTER TABLE `role_assign`
  ADD CONSTRAINT `role_assign_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee_profile` (`emp_id`),
  ADD CONSTRAINT `role_assign_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `shop_profile`
--
ALTER TABLE `shop_profile`
  ADD CONSTRAINT `shop_profile_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`),
  ADD CONSTRAINT `shop_profile_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `shopkeeper_profile` (`owner_id`);

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
