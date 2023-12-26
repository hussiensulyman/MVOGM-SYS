-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2023 at 11:36 PM
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
-- Database: `mvogms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `client_id`, `product_id`, `quantity`) VALUES
(15, 1, 7, 6),
(16, 1, 4, 11),
(17, 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(2, 2, 'Sample 101', 'This is a sample Category Only.', 1, 0, '2022-02-09 11:03:40', '2022-02-09 11:05:03'),
(3, 2, 'Sample 102', 'This is a sample Category 102', 1, 0, '2022-02-09 11:05:57', NULL),
(4, 2, 'Category 103', 'Sample Category 103', 1, 0, '2022-02-09 11:06:10', NULL),
(5, 2, 'test', 'test', 0, 1, '2022-02-09 11:06:17', '2022-02-09 11:06:20'),
(6, 1, 'Category 101', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut semper leo vitae dui rutrum ultricies. Etiam sit amet odio lorem. In sit amet cursus justo', 1, 0, '2022-02-09 11:09:36', NULL),
(7, 1, 'Category 102', 'Morbi pellentesque, dolor in sodales pretium, libero leo finibus arcu, vitae pharetra ligula quam quis enim. Quisque suscipit venenatis finibus.', 1, 0, '2022-02-09 11:09:45', NULL),
(8, 1, 'Category 103', 'Curabitur fermentum, diam ut dictum molestie, eros dolor luctus dolor, in hendrerit dui sapien vel lorem. Nulla ultrices gravida nisl, id feugiat turpis varius a. In iaculis lorem nisi. Aliquam nec aliquam ipsum, vitae fermentum dui.', 1, 0, '2022-02-09 11:10:19', NULL),
(9, 1, 'Category 104', 'Phasellus luctus ultricies dui, non euismod massa congue id. Fusce ut nisi convallis, aliquam dolor consectetur, varius enim. Phasellus dignissim, erat ac ullamcorper lacinia, nibh est auctor risus, eget ornare est felis et orci.', 1, 0, '2022-02-09 11:10:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 'John', 'D', 'Smith', 'Male', '09123456789', 'This is only my sample address', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'uploads/clients/1.png?v=1644386016', 1, 0, '2022-02-09 13:53:36', '2022-02-10 13:42:53'),
(2, '202202-00002', 'test', 'test', 'test', 'Male', '094564654', 'test', 'test@sample.com', 'test@sample.com', 'uploads/clients/2.png?v=1644471867', 1, 1, '2022-02-10 13:44:26', '2023-12-25 10:26:59'),
(15, '202312-00001', 'test', '', 'test', 'Male', '123', '123', 'test@test.com', '202cb962ac59075b964b07152d234b70', 'uploads/clients/15.png?v=1703493997', 1, 0, '2023-12-25 10:46:37', '2023-12-25 10:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(1, 1, 3, 1500, '2022-02-10 09:56:49'),
(2, 7, 10, 285.99, '2022-02-10 09:56:49'),
(3, 4, 5, 50, '2022-02-10 10:29:01'),
(3, 3, 5, 125, '2022-02-10 10:29:01'),
(3, 5, 3, 150, '2022-02-10 10:29:01'),
(4, 6, 3, 45.88, '2022-02-10 10:29:01'),
(4, 7, 3, 285.99, '2022-02-10 10:29:01'),
(1, 1, 3, 1500, '2022-02-10 09:56:49'),
(2, 7, 10, 285.99, '2022-02-10 09:56:49'),
(3, 4, 5, 50, '2022-02-10 10:29:01'),
(3, 3, 5, 125, '2022-02-10 10:29:01'),
(3, 5, 3, 150, '2022-02-10 10:29:01'),
(4, 6, 3, 45.88, '2022-02-10 10:29:01'),
(4, 7, 3, 285.99, '2022-02-10 10:29:01'),
(5, 3, 2, 125, '2023-12-25 11:16:24'),
(6, 3, 1, 125, '2023-12-25 11:17:21'),
(7, 2, 1, 85, '2023-12-25 20:17:09'),
(8, 8, 3, 195.75, '2023-12-25 20:31:09'),
(9, 5, 1, 150, '2023-12-25 21:03:07'),
(10, 7, 1, 285.99, '2023-12-25 22:31:03'),
(11, 1, 1, 1500, '2023-12-25 22:56:47'),
(12, 7, 1, 285.99, '2023-12-25 23:06:45'),
(13, 8, 1, 195.75, '2023-12-25 23:08:45'),
(14, 3, 1, 125, '2023-12-25 23:13:30'),
(15, 6, 1, 45.88, '2023-12-25 23:15:22'),
(16, 5, 1, 150, '2023-12-25 23:17:45'),
(17, 5, 1, 150, '2023-12-25 23:17:47'),
(18, 5, 1, 150, '2023-12-25 23:17:47'),
(19, 5, 1, 150, '2023-12-25 23:18:15'),
(20, 5, 1, 150, '2023-12-25 23:19:49'),
(21, 3, 1, 125, '2023-12-25 23:20:09'),
(22, 3, 1, 125, '2023-12-25 23:20:57'),
(23, 2, 1, 85, '2023-12-25 23:24:11'),
(24, 3, 1, 125, '2023-12-25 23:25:55'),
(25, 5, 1, 150, '2023-12-25 23:27:06'),
(26, 8, 1, 195.75, '2023-12-25 23:45:41'),
(27, 3, 1, 125, '2023-12-25 23:49:59'),
(28, 7, 1, 285.99, '2023-12-25 23:59:59'),
(29, 6, 1, 45.88, '2023-12-26 00:12:03'),
(30, 1, 1, 1500, '2023-12-26 00:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `final_total` decimal(10,2) DEFAULT NULL,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `final_total`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 1, 1, 4500, NULL, 'This is only my sample address', 5, '2022-02-10 09:56:49', '2022-02-10 11:52:53'),
(2, '202202-00002', 1, 2, 7359.9, NULL, 'This is only my sample address', 0, '2022-02-10 09:56:49', '2022-02-10 09:56:49'),
(3, '202202-00003', 1, 1, 1325, NULL, 'This is only my sample address', 1, '2022-02-10 10:29:00', '2022-02-10 12:09:59'),
(4, '202202-00004', 1, 2, 2320.61, NULL, 'This is only my sample address', 0, '2022-02-10 10:29:01', '2022-02-10 10:29:01'),
(5, '202312-00001', 15, 1, 250, NULL, '123', 0, '2023-12-25 11:16:24', '2023-12-25 11:16:24'),
(6, '202312-00002', 15, 1, 125, NULL, '123', 0, '2023-12-25 11:17:21', '2023-12-25 11:17:21'),
(7, '202312-00003', 15, 1, 85, NULL, '123', 0, '2023-12-25 20:17:09', '2023-12-25 20:17:09'),
(8, '202312-00004', 15, 2, 587.25, NULL, '123', 0, '2023-12-25 20:31:09', '2023-12-25 20:31:09'),
(9, '202312-00005', 15, 1, 150, NULL, '123', 0, '2023-12-25 21:03:07', '2023-12-25 21:03:07'),
(10, '202312-00006', 15, 2, 285.99, NULL, '123', 0, '2023-12-25 22:31:03', '2023-12-25 22:31:03'),
(11, '202312-00007', 15, 1, 0, 1350.00, '123', 0, '2023-12-25 22:56:47', NULL),
(12, '202312-00008', 15, 2, 285.99, NULL, '123', 0, '2023-12-25 23:06:45', '2023-12-25 23:06:45'),
(13, '202312-00009', 15, 2, 195.75, NULL, '123', 0, '2023-12-25 23:08:45', '2023-12-25 23:08:45'),
(14, '202312-00010', 15, 1, 125, NULL, '123', 0, '2023-12-25 23:13:30', '2023-12-25 23:13:30'),
(15, '202312-00011', 15, 2, 45.88, NULL, '123', 0, '2023-12-25 23:15:22', '2023-12-25 23:15:22'),
(16, '202312-00012', 15, 1, 0, NULL, '123', 0, '2023-12-25 23:17:45', NULL),
(17, '202312-00013', 15, 1, 0, NULL, '123', 0, '2023-12-25 23:17:47', NULL),
(18, '202312-00014', 15, 1, 0, NULL, '123', 0, '2023-12-25 23:17:47', NULL),
(19, '202312-00015', 15, 1, 0, NULL, '123', 0, '2023-12-25 23:18:15', NULL),
(20, '202312-00016', 15, 1, 150, 150.00, '123', 0, '2023-12-25 23:19:49', '2023-12-25 23:19:49'),
(21, '202312-00017', 15, 1, 125, 125.00, '123', 0, '2023-12-25 23:20:09', '2023-12-25 23:20:09'),
(22, '202312-00018', 15, 1, 125, 125.00, '123', 0, '2023-12-25 23:20:57', '2023-12-25 23:20:57'),
(23, '202312-00019', 15, 1, 76.5, 76.50, '123', 0, '2023-12-25 23:24:11', '2023-12-25 23:24:11'),
(24, '202312-00020', 15, 1, 100, 100.00, '123', 0, '2023-12-25 23:25:55', '2023-12-25 23:25:55'),
(25, '202312-00021', 15, 1, 135, 135.00, '123', 0, '2023-12-25 23:27:06', '2023-12-25 23:27:06'),
(26, '202312-00022', 15, 2, 0, 0.00, '123', 0, '2023-12-25 23:45:41', '2023-12-25 23:45:41'),
(27, '202312-00023', 15, 1, 0, 0.00, '123', 0, '2023-12-25 23:49:59', '2023-12-25 23:49:59'),
(28, '202312-00024', 15, 2, 0, 0.00, '123', 0, '2023-12-25 23:59:59', '2023-12-25 23:59:59'),
(29, '202312-00025', 15, 2, 0, 0.00, '123', 0, '2023-12-26 00:12:03', '2023-12-26 00:12:03'),
(30, '202312-00026', 15, 1, 0, 0.00, '123', 0, '2023-12-26 00:31:49', '2023-12-26 00:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `is_100_percent_egyptian` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `expiry_date` date DEFAULT NULL,
  `discount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `is_100_percent_egyptian`, `date_created`, `date_updated`, `expiry_date`, `discount`) VALUES
(1, 1, 9, 'Product 101', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut semper leo vitae dui rutrum ultricies. Etiam sit amet odio lorem. In sit amet cursus justo. Morbi pellentesque, dolor in sodales pretium, libero leo finibus arcu, vitae pharetra ligula quam quis enim. Quisque suscipit venenatis finibus. Curabitur fermentum, diam ut dictum molestie, eros dolor luctus dolor, in hendrerit dui sapien vel lorem. Nulla ultrices gravida nisl, id feugiat turpis varius a. In iaculis lorem nisi. Aliquam nec aliquam ipsum, vitae fermentum dui.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Phasellus luctus ultricies dui, non euismod massa congue id. Fusce ut nisi convallis, aliquam dolor consectetur, varius enim. Phasellus dignissim, erat ac ullamcorper lacinia, nibh est auctor risus, eget ornare est felis et orci. Pellentesque aliquam, lectus sed porttitor consequat, sem orci fringilla nisi, a pellentesque metus tellus nec tellus. Nullam metus tortor, mattis in tristique et, tincidunt ac dui. Praesent id viverra diam, vel cursus nulla. Vestibulum ut lobortis velit, a euismod eros. Integer dignissim finibus rhoncus. Praesent non neque ac ipsum lobortis commodo sed ac massa. Mauris justo tortor, dapibus sit amet dui sed, congue vehicula urna.</p>', 1500, 'uploads/products/1.png?v=1644379549', 1, 0, 0, '2022-03-30 12:05:49', '2023-12-18 11:00:57', '2024-02-12', 17),
(2, 1, 9, 'Loaf Bread', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Nullam nisi metus, convallis quis consectetur vitae, laoreet ac nulla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin ligula augue, vestibulum in auctor pharetra, posuere id lacus. Aenean aliquam felis quis condimentum congue. Donec porttitor ultricies mi eget vestibulum. Nullam in magna tortor. Suspendisse ullamcorper ultricies accumsan. Duis ultrices sollicitudin velit sed auctor. Vivamus semper placerat porttitor. Praesent diam lorem, luctus sit amet viverra non, consequat ac elit. Suspendisse eleifend massa sit amet nisl porta, eu rutrum massa blandit. Integer congue lacus non fringilla suscipit.</span><br></p>', 85, 'uploads/products/2.png?v=1644382715', 1, 0, 1, '2022-03-25 12:58:35', '2023-12-18 11:00:57', '2024-02-11', 18),
(3, 1, 7, 'Canned Soda', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Aliquam erat volutpat. Fusce scelerisque pulvinar bibendum. Proin convallis elit at molestie egestas. Cras ornare ornare dolor quis mattis. Suspendisse in egestas odio. Fusce nibh ante, ultrices nec elit at, auctor elementum nunc. Curabitur facilisis mauris at congue maximus. Integer a facilisis nisl, sed laoreet odio. Nulla facilisi. Vivamus sed tincidunt eros, non convallis metus. Nullam vestibulum nisi at est euismod, et molestie ligula dapibus. Integer ligula felis, volutpat a accumsan id, egestas nec dolor. Duis dignissim condimentum lectus, eget pharetra ex laoreet vitae. Nam enim mauris, pharetra sit amet leo eget, condimentum lacinia neque.</span><br></p>', 125, 'uploads/products/3.png?v=1644382753', 1, 0, 0, '2022-02-13 12:59:13', '2023-12-20 17:19:02', '2023-12-23', 10),
(4, 1, 6, 'Canned Sardines', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Praesent id pretium neque. Nullam nec scelerisque quam. Donec faucibus erat enim, sit amet aliquet ipsum suscipit at. Suspendisse interdum euismod libero, eu tincidunt ligula elementum a. Nulla id velit vestibulum nisl scelerisque pretium sed at neque. In dignissim purus ut nibh rutrum, at placerat ex elementum. Nam eleifend, sapien ac luctus eleifend, orci purus pulvinar nisl, et scelerisque erat turpis ac tellus. Duis a libero sit amet massa posuere molestie.</span><br></p>', 50, 'uploads/products/4.png?v=1644382779', 1, 0, 1, '2022-02-12 12:59:38', '2023-12-18 11:00:57', '2023-12-24', 19),
(5, 1, 7, 'Dry 101', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Nam vel velit eget libero scelerisque varius. Morbi sodales consectetur eros sed lacinia. Phasellus lobortis, neque sed consequat commodo, felis elit tempor sapien, eu blandit ante ex eu magna. Maecenas pulvinar lectus sed augue pharetra porttitor et sed ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent mattis ante est, sed fringilla nisi posuere non.</span><br></p>', 150, 'uploads/products/5.png?v=1644382802', 1, 0, 1, '2022-02-16 13:00:02', '2023-12-18 10:59:31', '2023-12-24', 6),
(6, 2, 4, 'Bottled Juice', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Quisque commodo tincidunt rhoncus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas molestie lacus lacus. Pellentesque velit quam, cursus sit amet congue sed, facilisis et risus. Duis ac consequat eros, id venenatis tortor. Nulla vitae iaculis ante. Morbi id felis non ipsum facilisis sagittis. Integer sed quam et metus pretium tempor sit amet non neque. Praesent eu ante a mauris auctor tempor. Pellentesque luctus erat eget metus vulputate iaculis. Sed rhoncus malesuada ipsum, sed imperdiet leo consequat et. In eu mauris eu felis lacinia semper sit amet nec nisi. Aliquam convallis, neque eget dignissim aliquam, sem enim laoreet arcu, vitae maximus nisi nisl vitae tellus.</span><br></p>', 45.88, 'uploads/products/6.png?v=1644382977', 1, 0, 0, '2022-03-23 13:02:57', '2024-01-26 17:19:02', '2024-01-24', 9),
(7, 2, 2, 'Chicken Wings', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Quisque aliquet tellus sed nulla vulputate pharetra et nec mauris. Nulla placerat magna sed enim ullamcorper, ac tempor turpis varius. Sed in ipsum id odio varius pellentesque. In hac habitasse platea dictumst. Nunc eget nisi sed nisl pellentesque posuere. Nulla quis nibh nec neque ornare mollis sed vitae eros. Nulla nulla turpis, bibendum euismod purus sit amet, semper aliquam enim. Proin dignissim ac nisl in lobortis. Aenean at justo vel ipsum pretium dapibus. Aliquam lorem mi, laoreet eu leo ac, congue blandit orci. Sed vulputate suscipit nibh, at ultrices ipsum sagittis nec.</span><br></p>', 285.99, 'uploads/products/7.png?v=1644383066', 1, 0, 0, '2022-02-12 13:04:25', '2023-12-24 17:19:02', '2023-12-24', 5),
(8, 2, 4, 'Chicken Fillet Raw', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Ut viverra maximus orci et tincidunt. Aliquam erat volutpat. Morbi convallis nibh nec libero ultrices, id suscipit nisl facilisis. Maecenas sed consectetur leo, id tempus nisl. Maecenas tincidunt ultrices ex sed feugiat. Nunc sit amet arcu enim. Nunc tristique faucibus elit sed mollis. Cras commodo tincidunt porttitor.</span><br></p>', 195.75, 'uploads/products/8.png?v=1644383112', 1, 0, 1, '2022-02-16 13:05:12', '2023-12-18 11:00:57', '2023-12-22', 10);

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dry Goods', 1, 0, '2022-02-09 08:49:34', NULL),
(2, 'Cosmetics', 1, 0, '2022-02-09 08:49:46', NULL),
(3, 'Produce', 1, 0, '2022-02-09 08:50:31', NULL),
(4, 'Anyy', 1, 0, '2022-02-09 08:50:36', '2022-02-09 08:50:57'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

=======
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
>>>>>>> origin/master
--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Multi-Vendor Online Grocery Management System'),
(6, 'short_name', 'MVOGMS - PHP'),
(11, 'logo', 'uploads/logo-1644367440.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1644367404.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-02-10 13:57:15'),
(11, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-11.png?v=1644472553', NULL, 2, '2022-02-10 13:55:52', '2023-12-22 01:38:19');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 4, 'Shop101', 'Shop 101 Owner', '09123456788', 'shop101', 'ee6c4d4ba80f29dd389f0deb8863de69', 'uploads/vendors/1.png?v=1644375053', 1, 0, '2022-02-09 10:50:53', '2022-02-10 13:43:21'),
(2, '202202-00002', 1, 'Shop102', 'John Miller', '09123456789', 'shop102', '90be022251077e3488c998613214df74', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2022-02-09 10:52:09', '2022-02-09 17:02:54'),
(34, '202312-00001', 2, 'test', 'test', 'test', 'test', '16d7a4fca7442dda3ad93c9a726597e4', 'uploads/vendors/34.png?v=1703223330', 1, 0, '2023-12-22 07:35:30', '2023-12-22 07:35:30'),
(35, '202312-00002', 2, 'test', 'test', 'test', 'tesst', '098f6bcd4621d373cade4e832627b4f6', 'uploads/vendors/35.png?v=1703531449', 1, 0, '2023-12-25 21:10:49', '2023-12-25 21:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `voucher_code` varchar(50) NOT NULL,
  `discount_percentage` decimal(5,2) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `user_id` int(30) DEFAULT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `usage_limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `voucher_code`, `discount_percentage`, `expiry_date`, `user_id`, `is_used`, `usage_limit`) VALUES
(1, 'VOUCHER10', 10.00, '2024-12-31', NULL, 16, 100),
(2, 'VOUCHER20', 20.00, '2023-12-31', NULL, 3, 50),
(3, 'VOUCHER30', 30.00, '2025-12-31', NULL, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voucher_code_UNIQUE` (`voucher_code`),
  ADD KEY `vouchers_ibfk_1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `vouchers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `client_list` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
