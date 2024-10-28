-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 28, 2024 at 12:23 PM
-- Server version: 10.6.18-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `archiesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `CP_ID` int(11) NOT NULL,
  `CP_CODE` varchar(50) DEFAULT NULL,
  `CP_SCHID` int(11) NOT NULL,
  `CP_SCHNAME` varchar(255) DEFAULT NULL,
  `CP_CGCODE` varchar(100) NOT NULL,
  `CP_CGNAME` varchar(255) DEFAULT NULL,
  `CP_NAME` text NOT NULL,
  `CP_ACCOUNTNO` varchar(150) DEFAULT NULL,
  `CP_ADDRESS` text DEFAULT NULL,
  `CP_BOX` varchar(40) DEFAULT NULL,
  `CP_TOWN` varchar(40) DEFAULT NULL,
  `CP_EMAIL` varchar(40) DEFAULT NULL,
  `CP_FAX` varchar(40) DEFAULT NULL,
  `CP_CONTACTNAME` varchar(150) DEFAULT NULL,
  `CP_CONTACTNO` varchar(40) DEFAULT NULL,
  `CP_CONTACTROLE` varchar(100) NOT NULL,
  `CP_SSNITNO` varchar(40) DEFAULT NULL,
  `CP_DIRECTORNAME` varchar(100) NOT NULL,
  `CP_DIRECTOR_NO` varchar(100) NOT NULL,
  `CP_DIRECTOR_EMAIL` varchar(100) NOT NULL,
  `CP_DIRECTOR_ADDRESS` varchar(100) NOT NULL,
  `CP_DIRECTOR_ID_NO` varchar(30) NOT NULL,
  `CP_DIRECTOR_GHCARD` varchar(30) NOT NULL,
  `CP_STARTDATE` date NOT NULL,
  `CP_ENABLED` enum('1','0') NOT NULL DEFAULT '1' COMMENT 'ZERO IS DISABLED AND ONE IS ENABLED',
  `CP_WORKSECTOR` enum('1','2') NOT NULL COMMENT 'ONE IS FORMAL AND TWO IS INFORMAL SECTOR',
  `CP_COMP_TYPE` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'zero means general companies and one means fund account or company',
  `CP_ACC_TYPE` enum('1','2') NOT NULL,
  `CP_AUTHORIZED` enum('1','0') NOT NULL DEFAULT '0',
  `CP_AUTHORIZED_BY` int(11) DEFAULT NULL,
  `CP_ACTORID` varchar(50) NOT NULL,
  `CP_FLAG` enum('1','0') NOT NULL DEFAULT '0',
  `CP_SCHEMETIER` int(11) DEFAULT NULL,
  `CP_STATES` enum('0','1','2','30') NOT NULL DEFAULT '0' COMMENT 'zero is new,one is active ,two is closed, thirty is suspense account',
  `CP_EDIT_STATUS` enum('1','0') DEFAULT '0' COMMENT '0=>not edited,edited',
  `CP_EDIT_ACTOR_ID` int(11) DEFAULT NULL,
  `CP_EDIT_DATE` datetime DEFAULT NULL,
  `CP_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CP_ACCOUNT_STATUS` enum('0','1') DEFAULT NULL COMMENT '0=> Ceased , 1=> Suspended Operations'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `actors_level`
--

CREATE TABLE `actors_level` (
  `ACL_ID` int(11) NOT NULL,
  `ACL_CODE` varchar(10) NOT NULL,
  `ACL_NAME` varchar(40) NOT NULL,
  `ACL_NUMBER` int(11) NOT NULL,
  `ACL_STATUS` enum('0','1') DEFAULT '0',
  `ACL_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `actors_level`
--

INSERT INTO `actors_level` (`ACL_ID`, `ACL_CODE`, `ACL_NAME`, `ACL_NUMBER`, `ACL_STATUS`, `ACL_INPUTEDDATE`) VALUES
(1, 'L001', 'Administrator', 1, '1', '2024-03-23 04:02:46'),
(2, 'L002', 'Front Desk', 2, '1', '2024-08-06 02:11:57'),
(3, 'L003', 'Front Desk Staff', 3, '0', '2024-08-06 02:12:06'),
(4, 'L004', 'Supervisor', 4, '0', '2024-04-08 21:00:50'),
(5, 'L005', 'Manager', 5, '0', '2024-04-08 21:00:57'),
(6, 'L006', 'Accountant', 6, '0', '2024-04-08 21:01:02'),
(7, 'L007', 'Medical Director:', 7, '0', '2024-04-08 21:01:07'),
(8, 'L008', 'IT Administrator', 8, '0', '2024-04-08 21:01:12'),
(9, 'L009', 'ext. agent', 9, '0', '2024-04-08 21:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `channel_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0,
  `is_archived` tinyint(1) DEFAULT 0,
  `channel_status` enum('1','0') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `COM_CODE` varchar(50) NOT NULL,
  `COM_REGCODE` varchar(255) DEFAULT NULL,
  `COM_REVIEWCODE` varchar(100) NOT NULL,
  `COM_NAME` varchar(100) NOT NULL,
  `COM_DATE` date NOT NULL,
  `COM_REVIEW` varchar(255) NOT NULL,
  `COM_POSITION` varchar(100) DEFAULT NULL,
  `COM_ADDRESS` varchar(100) DEFAULT NULL,
  `COM_INPUTEDDATE` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Estimate`
--

CREATE TABLE `Estimate` (
  `id` int(11) NOT NULL,
  `estimateCode` varchar(255) DEFAULT NULL,
  `invoiceNumber` varchar(255) DEFAULT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `tax` decimal(5,2) DEFAULT NULL,
  `CategoryName` varchar(240) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  `estimateNotes` text DEFAULT NULL,
  `userid` varchar(65) NOT NULL,
  `inputedDate` datetime DEFAULT current_timestamp(),
  `Estimatestatus` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Estimate`
--

INSERT INTO `Estimate` (`id`, `estimateCode`, `invoiceNumber`, `totalAmount`, `tax`, `CategoryName`, `phoneNumber`, `customerName`, `estimateNotes`, `userid`, `inputedDate`, `Estimatestatus`) VALUES
(5, 'LPW575', 'INV20241020070417768', '25.00', '2.00', NULL, 'Check', 'yao ', 'notes', 'Bharani YAO', '2024-10-17 00:00:00', '2'),
(34, 'LPW443', 'INV20241026004728646', '1.00', '2.00', NULL, 'Credit Card', 'Description', 'Description', 'Bharani YAO', '2024-10-23 00:00:00', '1'),
(37, 'LPW815', 'INV20241026010418638', '120.00', '5.00', NULL, 'Check', 'Customer', 'Session Customer', 'Bharani YAO', '2024-10-09 00:00:00', '1'),
(38, 'LPW064', 'INV20241026010836145', '740.00', '5.00', NULL, 'Cash', 'Session', 'note, isowrking', 'Bharani YAO', '2024-10-24 00:00:00', '1'),
(41, 'EST816539', 'INV20241027203754769', '2.00', NULL, 'PLUMBING WORKS', '02662121', 'YHAO', '', 'Bharani YAO', NULL, '1'),
(42, 'EST272320', 'INV20241027232624611', '67800.00', NULL, 'BLOCK WORK/CONCRETE WORK', '0266212420', 'yao', 'okay', 'Bharani YAO', '2024-10-27 23:28:42', '1');

-- --------------------------------------------------------

--
-- Table structure for table `EstimateCat`
--

CREATE TABLE `EstimateCat` (
  `CAT_ID` int(11) NOT NULL,
  `CAT_CODE` varchar(30) NOT NULL,
  `CAT_NAME` varchar(210) NOT NULL,
  `CAT_NUMBER` int(11) NOT NULL,
  `CAT_STATUS` enum('0','1') DEFAULT '0',
  `CAT_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `EstimateCat`
--

INSERT INTO `EstimateCat` (`CAT_ID`, `CAT_CODE`, `CAT_NAME`, `CAT_NUMBER`, `CAT_STATUS`, `CAT_INPUTEDDATE`) VALUES
(1, 'L001', 'CARPENTRY WORK', 1, '1', '2024-10-27 17:58:21'),
(2, 'L002', 'PLUMBING WORKS', 2, '1', '2024-10-27 17:58:17'),
(3, 'L003', 'OVERSITE CONCRETE', 3, '1', '2024-10-27 19:02:27'),
(4, 'L004', 'BLOCKWORK AND PILLARS', 4, '1', '2024-10-27 19:02:30'),
(5, 'L005', 'FORMWORK (CONTINUOUS PILLARS )', 5, '1', '2024-10-27 19:02:16'),
(6, 'L006', 'SUSPENDED FLOWING\nCARPENTRY WORK', 6, '1', '2024-10-27 19:02:19'),
(7, 'L007', 'ELECTRICAL WORKS SUSPENDED/FLOWING(FIRST FLOOR)', 7, '1', '2024-10-27 19:02:33'),
(8, 'L008', 'PLUMBING WORKS SUSPENDED / FLOWING \n (FIRST FLOOR SETTINGS)', 8, '1', '2024-10-27 19:02:22'),
(9, 'L009', 'CONCRETE IN CONTINUOUS PILLARS AND SUSPENDED/ FLOWING (FIRST FLOOR)', 9, '1', '2024-10-27 19:02:13'),
(10, 'L0010', 'BLOCK WORK/CONCRETE WORK', 10, '1', '2024-10-27 19:02:09'),
(11, 'L0011', 'OTHER', 11, '1', '2024-10-27 19:02:09');

-- --------------------------------------------------------

--
-- Table structure for table `Estimateold`
--

CREATE TABLE `Estimateold` (
  `id` int(11) NOT NULL,
  `estimateCode` varchar(60) NOT NULL,
  `estimator_name` varchar(245) NOT NULL,
  `estimator_category` varchar(245) NOT NULL,
  `item_description` varchar(245) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) GENERATED ALWAYS AS (`qty` * `unit_price` * `rate`) STORED,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `estimater_status` enum('0','1','2','3') NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Estimateold`
--

INSERT INTO `Estimateold` (`id`, `estimateCode`, `estimator_name`, `estimator_category`, `item_description`, `qty`, `unit_price`, `rate`, `created_at`, `estimater_status`) VALUES
(1, 'EC202409221045-0000001', 'hhhjdsgkf', 'hjsgjh', 'kjfhdsl', 12, '12.00', '21.00', '2024-09-22 14:10:13', '3'),
(2, 'EC202409222832-0000001', 'HJS', 'SDFH', 'SDF', 12, '12.00', '12.00', '2024-09-22 17:28:46', '3'),
(3, 'EC202409222894-0000001', 'HJS', 'SDFH', 'KHkh', 20, '1.00', '5.00', '2024-09-22 17:28:46', '3');

-- --------------------------------------------------------

--
-- Table structure for table `eventlog`
--

CREATE TABLE `eventlog` (
  `EVL_ID` int(11) NOT NULL,
  `EVL_EVTCODE` varchar(30) NOT NULL,
  `EVL_ACTID` varchar(32) NOT NULL,
  `EVL_MON_NAME` varchar(255) DEFAULT NULL,
  `EVL_ACTIVITIES` text NOT NULL,
  `EVL_IP` varchar(15) DEFAULT NULL,
  `EVL_SESSION_ID` varchar(50) DEFAULT NULL,
  `EVL_BROWSER` varchar(255) DEFAULT NULL,
  `EVL_RAW` varchar(220) NOT NULL,
  `EVL_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventtype`
--

CREATE TABLE `eventtype` (
  `EVT_ID` int(206) NOT NULL,
  `EVT_CODE` varchar(209) DEFAULT NULL,
  `EVT_NAME` varchar(210) DEFAULT NULL,
  `EVT_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `eventtype`
--

INSERT INTO `eventtype` (`EVT_ID`, `EVT_CODE`, `EVT_NAME`, `EVT_INPUTEDDATE`) VALUES
(1, '001', 'login', '2024-07-21 16:58:54'),
(2, '002', 'logout', '2024-07-21 16:58:54'),
(3, '003', 'Category', '2024-07-21 16:58:54'),
(4, '004', 'Category', '2024-07-21 16:58:54'),
(5, '005', 'Category update', '2024-07-21 16:58:54'),
(6, '006', 'Category Delet', '2024-07-21 16:58:54'),
(7, '007', 'add new booking', '2024-07-21 16:58:54'),
(8, '008', 'Payment', '2024-07-21 18:17:28'),
(9, '009', 'Bookupdate', '2024-07-21 18:50:21'),
(10, '010', 'user update', '2024-07-21 21:45:01'),
(11, '011', 'Add user', '2024-07-21 21:45:01'),
(12, '012', 'Password reset', '2024-07-21 21:45:01'),
(13, '013', 'sys user deleted', '2024-07-26 19:45:00'),
(14, '014', 'move bookings to records table', '2024-07-26 20:08:38'),
(15, '015', 'delet moving records after move', '2024-07-26 20:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `InvoiceItems`
--

CREATE TABLE `InvoiceItems` (
  `id` int(11) NOT NULL,
  `financialID` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `qty` varchar(240) DEFAULT NULL,
  `unit` varchar(185) DEFAULT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `InvoiceItems`
--

INSERT INTO `InvoiceItems` (`id`, `financialID`, `description`, `qty`, `unit`, `unitPrice`, `total`) VALUES
(11, 34, 'Description', 'Session', '00:00:01', '1.00', '1.00'),
(12, 37, 'Description', 'Session', '00:00:02', '12.00', '24.00'),
(13, 37, 'Description2', 'Session1', '00:00:03', '32.00', '96.00'),
(14, 38, 'DescriptionSession', 'Session', '00:00:12', '50.00', '600.00'),
(15, 38, 'DescriptionSession1', 'Session1', '00:00:01', '20.00', '20.00'),
(16, 38, 'DescriptionSession2', 'Session2', '00:00:06', '20.00', '120.00'),
(17, 41, 'unit', '1', 'unit', '2.00', '2.00'),
(18, 42, 'Blocks (6”)', '3200', 'Psc', '8.00', '25600.00'),
(19, 42, 'Cement', '300', 'Bags', '120.00', '36000.00'),
(20, 42, 'Sand', '2', 'Trip', '2500.00', '5000.00'),
(21, 42, 'Stones', '2', 'Trips', '600.00', '1200.00');

-- --------------------------------------------------------

--
-- Table structure for table `menugroup`
--

CREATE TABLE `menugroup` (
  `MENUGP_ID` int(11) NOT NULL,
  `MENUGP_CODE` varchar(10) DEFAULT NULL,
  `MENUGP_NAME` varchar(50) DEFAULT NULL,
  `MENUGP_DESCRIPTION` varchar(200) DEFAULT NULL,
  `MENUGP_STATUS` enum('1','0') DEFAULT '1' COMMENT '"0"=>Disable, "1"=>Enable',
  `MENUGP_INPUTEDDATE` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `menugroup`
--

INSERT INTO `menugroup` (`MENUGP_ID`, `MENUGP_CODE`, `MENUGP_NAME`, `MENUGP_DESCRIPTION`, `MENUGP_STATUS`, `MENUGP_INPUTEDDATE`) VALUES
(1, '001', 'Backend', NULL, '1', '2020-02-25 04:52:03'),
(2, '002', 'Client Portal', NULL, '1', '2020-02-25 04:52:19'),
(3, '003', 'Agent Portal', NULL, '1', '2021-08-02 23:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `menusubgroup`
--

CREATE TABLE `menusubgroup` (
  `MENUCAT_ID` int(11) NOT NULL,
  `MENUCAT_MENUGPCODE` varchar(50) DEFAULT NULL,
  `MENUCAT_CODE` varchar(50) DEFAULT NULL,
  `MENUCAT_NAME` varchar(100) DEFAULT NULL,
  `MENUCAT_NAMESPACE` varchar(255) DEFAULT NULL,
  `MENUCAT_ICONS` varchar(150) DEFAULT NULL,
  `MENUCAT_STATUS` enum('1','0') DEFAULT '1' COMMENT '"0"=>Disable, "1"=>Enable',
  `MENUCAT_INPUTEDDATE` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `menusubgroup`
--

INSERT INTO `menusubgroup` (`MENUCAT_ID`, `MENUCAT_MENUGPCODE`, `MENUCAT_CODE`, `MENUCAT_NAME`, `MENUCAT_NAMESPACE`, `MENUCAT_ICONS`, `MENUCAT_STATUS`, `MENUCAT_INPUTEDDATE`) VALUES
(1, '001', '003', 'Estimate', 'estimate', 'fa fa-cog', '1', '2024-09-16 22:53:15'),
(2, '001', '002', 'Home', 'home', 'fa fa-info', '0', '2024-08-06 22:26:25'),
(3, '001', '001', 'New Room', 'rooms', 'fa fa-user', '0', '2024-09-16 23:15:00'),
(4, '001', '004', 'Facility', 'therapist', 'fa fa-smile-o', '0', '2024-09-16 22:42:50'),
(5, '001', '005', 'Estimate Management', 'assessment', 'fa fa-medkit', '0', '2024-09-16 23:23:53'),
(6, '001', '006', 'User Management', 'treatment', 'fa fa-file', '0', '2024-09-16 23:15:06'),
(7, '001', '007', 'Utilities', 'discharge', 'fa fa-cog', '1', '2024-08-06 22:28:07'),
(8, '001', '008', 'MainSite', 'theweb', 'fa fa-cog', '0', '2024-09-16 22:43:00'),
(9, '001', '009', 'Reports', 'reports', 'fa fa-medkit', '1', '2024-07-05 23:32:51'),
(10, '001', '010', 'Monitoring', 'monitoring', 'fa fa-medkit', '0', '2024-09-16 22:42:55'),
(11, '001', '011', 'Home', 'home', 'fa fa-spinner', '0', '2024-08-06 22:01:34'),
(12, '001', '012', 'Channel', 'settings', 'fa fa-chat', '0', '2024-08-06 22:01:23'),
(13, '001', '013', 'Reports', 'reports', 'fa fa-cog', '1', '2024-07-05 23:26:55'),
(14, '001', '014', 'Logs', 'logs', 'fa fa-pencil', '1', '2024-08-06 21:50:23'),
(15, '001', '015', 'Settings', 'settings', 'fa fa-flag', '1', '2024-04-24 13:02:40');

-- --------------------------------------------------------

--
-- Table structure for table `menusubgroupdetail`
--

CREATE TABLE `menusubgroupdetail` (
  `MENUDET_ID` int(11) NOT NULL,
  `MENUDET_MENUGPCODE` varchar(20) DEFAULT NULL,
  `MENUDET_MENUCATCODE` varchar(20) DEFAULT NULL,
  `MENUDET_CODE` varchar(20) DEFAULT NULL,
  `MENUDET_ICONS` varchar(255) DEFAULT NULL,
  `MENUDET_NAME` varchar(255) DEFAULT NULL,
  `MENUDET_NAMESPACE` varchar(255) DEFAULT NULL,
  `MENUDET_IMAGEUNINAME` varchar(255) DEFAULT NULL,
  `MENUDET_STATUS` enum('1','0') DEFAULT '1',
  `MENUDET_NOTIFICATION` enum('1','0') DEFAULT '0',
  `MENUDET_SIDEBAR` enum('1','0') DEFAULT '1',
  `MENUDET_DASHBOARD` enum('1','0') DEFAULT '1',
  `MENUDET_WINDVIEW` enum('1','0') DEFAULT '0',
  `MENUDET_WINDVIEWGENERALREPORT` enum('1','0') DEFAULT NULL,
  `MENUDET_WINDVIEWFINANCIALREPORT` enum('1','0') DEFAULT NULL,
  `MENUDET_WINDVIEWSTATISTICALREPORT` enum('1','0') DEFAULT NULL,
  `MENUDET_ADMIN_ACCESSRIGHT` enum('2','1') DEFAULT '1' COMMENT '"1"=> General user,\r\n"2"=>admin',
  `MENUDET_INPUTEDDATE` timestamp NULL DEFAULT current_timestamp(),
  `MENUDET_TARGETED` varchar(255) DEFAULT NULL,
  `MENUDET_VIEWER` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menusubgroupdetail`
--

INSERT INTO `menusubgroupdetail` (`MENUDET_ID`, `MENUDET_MENUGPCODE`, `MENUDET_MENUCATCODE`, `MENUDET_CODE`, `MENUDET_ICONS`, `MENUDET_NAME`, `MENUDET_NAMESPACE`, `MENUDET_IMAGEUNINAME`, `MENUDET_STATUS`, `MENUDET_NOTIFICATION`, `MENUDET_SIDEBAR`, `MENUDET_DASHBOARD`, `MENUDET_WINDVIEW`, `MENUDET_WINDVIEWGENERALREPORT`, `MENUDET_WINDVIEWFINANCIALREPORT`, `MENUDET_WINDVIEWSTATISTICALREPORT`, `MENUDET_ADMIN_ACCESSRIGHT`, `MENUDET_INPUTEDDATE`, `MENUDET_TARGETED`, `MENUDET_VIEWER`) VALUES
(1, '001', '015', '0015', 'fa fa-user', 'Manage Users', 'manageusers', '', '1', '0', '1', '0', '1', NULL, '1', '1', '1', '2021-08-03 11:48:34', NULL, NULL),
(2, '001', '005', '0005', '', 'Approve Estimate', 'allbooking', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:02', NULL, NULL),
(3, '001', '008', '0008', '', 'Manage Facility', 'managefacilities', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:23:45', NULL, NULL),
(4, '001', '005', '0005', '', 'Pending Estimates', 'approved', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2021-08-03 11:48:25', NULL, NULL),
(5, '001', '003', '0003', '', 'New Estimate', 'addestimate', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:25:42', NULL, NULL),
(6, '001', '006', '0006', '', 'Registered list', 'treatment', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:21:17', NULL, NULL),
(7, '001', '006', '0006', '', 'Enquiry', 'treatmentPlan', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:20:36', NULL, NULL),
(8, '001', '007', '0007', '', 'Room Amenities', 'setup', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:45', NULL, NULL),
(9, '001', '005', '0005', '', 'Reject Estimate', 'cancelled', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:14', NULL, NULL),
(10, '001', '001', '0001', '', 'Manage Room', 'managerooms', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 01:39:23', NULL, NULL),
(11, '001', '008', '0008', '', 'Facility', 'facility', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:26', NULL, NULL),
(12, '001', '008', '0008', '', 'About', 'PageCont', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:21:32', NULL, NULL),
(13, '001', '001', '0001', '', 'Rooms', 'room', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:26', NULL, NULL),
(14, '001', '015', '0015', '', 'Cleaning Supplies', 'user logs', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:52', NULL, NULL),
(15, '001', '009', '0009', '', 'Reports', 'reports', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:25:04', NULL, NULL),
(16, '001', '007', '0007', '', 'Enquiry New', 'channel', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:19:23', NULL, NULL),
(17, '001', '003', '0003', '', 'Approved Estimate', 'category', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:25:42', NULL, NULL),
(18, '001', '015', '0015', 'fa fa-user', 'Manage Therapist', 'setup', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2021-08-03 11:48:34', NULL, NULL),
(19, '001', '007', '0007', '', 'Food Supplies', 'setup', '', '0', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:02', NULL, NULL),
(20, '001', '009', '0009', '', 'Enquiry', 'reportold', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:02', NULL, NULL),
(21, '001', '009', '0009', '', 'Books', 'booksrecords', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menusubusers`
--

CREATE TABLE `menusubusers` (
  `MENUCT_ID` int(11) NOT NULL,
  `MENUCT_USRUSERID` varchar(100) NOT NULL,
  `MENUCT_MENUDETCODE` varchar(50) DEFAULT NULL,
  `MENUCT_STATUS` enum('1','0') DEFAULT '1' COMMENT '"0"=> Revoked, "1"=> Granted',
  `MENUCT_ADDEDBY` varchar(50) DEFAULT NULL,
  `MENUCT_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `menusubusers`
--

INSERT INTO `menusubusers` (`MENUCT_ID`, `MENUCT_USRUSERID`, `MENUCT_MENUDETCODE`, `MENUCT_STATUS`, `MENUCT_ADDEDBY`, `MENUCT_INPUTEDDATE`) VALUES
(1583, 'U20211014-0000012', '0011', '1', '2', '2021-10-14 08:44:37'),
(1584, 'U20211014-0000012', '0012', '1', '2', '2021-10-14 08:44:37'),
(1585, 'U20211014-0000012', '0013', '1', '2', '2021-10-14 08:44:37'),
(1586, 'U20211014-0000012', '0077', '1', '2', '2021-10-14 08:44:37'),
(1587, 'U20211014-0000012', '0078', '1', '2', '2021-10-14 08:44:37'),
(1588, 'U20211014-0000012', '0087', '1', '2', '2021-10-14 08:44:37'),
(1589, 'U20211014-0000012', '0088', '1', '2', '2021-10-14 08:44:37'),
(1616, 'U-0000008', '0002', '1', 'U-0000001', '2023-01-26 15:10:18'),
(1617, 'U-0000008', '0003', '1', 'U-0000001', '2023-01-26 15:10:18'),
(1618, 'U-0000008', '0004', '1', 'U-0000001', '2023-01-26 15:10:19'),
(1619, 'U-0000008', '0005', '1', 'U-0000001', '2023-01-26 15:10:19'),
(1620, 'U-0000008', '0006', '1', 'U-0000001', '2023-01-26 15:10:19'),
(1621, 'U-0000008', '0007', '1', 'U-0000001', '2023-01-26 15:10:19'),
(1622, 'U-0000008', '0008', '1', 'U-0000001', '2023-01-26 15:10:20'),
(1623, 'U-0000008', '0009', '1', 'U-0000001', '2023-01-26 15:10:20'),
(1624, 'U-0000008', '0089', '1', 'U-0000001', '2023-01-26 15:10:20'),
(1625, 'U-0000008', '0090', '1', 'U-0000001', '2023-01-26 15:10:20'),
(1626, 'U-0000008', '0101', '1', 'U-0000001', '2023-01-26 15:10:21'),
(1627, 'U-0000008', '0103', '1', 'U-0000001', '2023-01-26 15:10:21'),
(1628, 'U-0000008', '0118', '1', 'U-0000001', '2023-01-26 15:10:21'),
(1629, 'U-0000008', '0119', '1', 'U-0000001', '2023-01-26 15:10:21'),
(1630, 'U-0000008', '0125', '1', 'U-0000001', '2023-01-26 15:10:22'),
(1631, 'U-0000008', '0126', '1', 'U-0000001', '2023-01-26 15:10:22'),
(1632, 'U-0000008', '0011', '1', 'U-0000001', '2023-01-26 15:10:22'),
(1633, 'U-0000008', '0013', '1', 'U-0000001', '2023-01-26 15:10:22'),
(1634, 'U-0000008', '0077', '1', 'U-0000001', '2023-01-26 15:10:22'),
(1635, 'U-0000008', '0078', '1', 'U-0000001', '2023-01-26 15:10:23'),
(1636, 'U-0000008', '0087', '1', 'U-0000001', '2023-01-26 15:10:23'),
(1637, 'U-0000008', '0088', '1', 'U-0000001', '2023-01-26 15:10:23'),
(1638, 'U-0000008', '0104', '1', 'U-0000001', '2023-01-26 15:10:23'),
(1639, 'U-0000008', '0105', '1', 'U-0000001', '2023-01-26 15:10:24'),
(1640, 'U-0000008', '0106', '1', 'U-0000001', '2023-01-26 15:10:24'),
(1641, 'U-0000008', '0109', '1', 'U-0000001', '2023-01-26 15:10:24'),
(1642, 'U-0000008', '0110', '1', 'U-0000001', '2023-01-26 15:10:24'),
(1643, 'U-0000008', '0111', '1', 'U-0000001', '2023-01-26 15:10:25'),
(1644, 'U-0000008', '0112', '1', 'U-0000001', '2023-01-26 15:10:25'),
(1645, 'U-0000008', '0113', '1', 'U-0000001', '2023-01-26 15:10:25'),
(1646, 'U-0000008', '0114', '1', 'U-0000001', '2023-01-26 15:10:25'),
(1647, 'U-0000008', '0117', '1', 'U-0000001', '2023-01-26 15:10:26'),
(1648, 'U-0000008', '0015', '1', 'U-0000001', '2023-01-26 15:10:26'),
(1649, 'U-0000008', '0016', '1', 'U-0000001', '2023-01-26 15:10:26'),
(1650, 'U-0000008', '0081', '1', 'U-0000001', '2023-01-26 15:10:26'),
(1651, 'U-0000008', '0107', '1', 'U-0000001', '2023-01-26 15:10:27'),
(1652, 'U-0000008', '0108', '1', 'U-0000001', '2023-01-26 15:10:27'),
(1653, 'U-0000008', '0116', '1', 'U-0000001', '2023-01-26 15:10:27'),
(1654, 'U-0000008', '0017', '1', 'U-0000001', '2023-01-26 15:10:27'),
(1655, 'U-0000008', '0018', '1', 'U-0000001', '2023-01-26 15:10:28'),
(1656, 'U-0000008', '0019', '1', 'U-0000001', '2023-01-26 15:10:28'),
(1657, 'U-0000008', '0021', '1', 'U-0000001', '2023-01-26 15:10:28'),
(1658, 'U-0000008', '0115', '1', 'U-0000001', '2023-01-26 15:10:28'),
(1659, 'U-0000008', '0120', '1', 'U-0000001', '2023-01-26 15:10:29'),
(1660, 'U-0000008', '0122', '1', 'U-0000001', '2023-01-26 15:10:29'),
(1661, 'U-0000008', '0123', '1', 'U-0000001', '2023-01-26 15:10:29'),
(1662, 'U-0000008', '0124', '1', 'U-0000001', '2023-01-26 15:10:29'),
(1663, 'U-0000008', '0127', '1', 'U-0000001', '2023-01-26 15:10:30'),
(1664, 'U-0000008', '0040', '1', 'U-0000001', '2023-01-26 15:10:30'),
(1665, 'U-0000008', '0041', '1', 'U-0000001', '2023-01-26 15:10:30'),
(1666, 'U-0000008', '0042', '1', 'U-0000001', '2023-01-26 15:10:30'),
(1667, 'U-0000008', '0043', '1', 'U-0000001', '2023-01-26 15:10:31'),
(1668, 'U-0000008', '0044', '1', 'U-0000001', '2023-01-26 15:10:31'),
(1669, 'U-0000008', '0049', '1', 'U-0000001', '2023-01-26 15:10:31'),
(1670, 'U-0000008', '0050', '1', 'U-0000001', '2023-01-26 15:10:31'),
(1671, 'U-0000008', '0045', '1', 'U-0000001', '2023-01-26 15:10:32'),
(1672, 'U-0000008', '0046', '1', 'U-0000001', '2023-01-26 15:10:32'),
(1673, 'U-0000008', '0047', '1', 'U-0000001', '2023-01-26 15:10:32'),
(1674, 'U-0000008', '0048', '1', 'U-0000001', '2023-01-26 15:10:32'),
(1675, 'U-0000008', '0057', '1', 'U-0000001', '2023-01-26 15:10:32'),
(1676, 'U-0000008', '0058', '1', 'U-0000001', '2023-01-26 15:10:33'),
(1846, 'U20230213-0000013', '0001', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1847, 'U20230213-0000013', '0002', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1848, 'U20230213-0000013', '0004', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1849, 'U20230213-0000013', '0007', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1850, 'U20230213-0000013', '0008', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1851, 'U20230213-0000013', '0009', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1852, 'U20230213-0000013', '0089', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1853, 'U20230213-0000013', '0090', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1854, 'U20230213-0000013', '0103', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1855, 'U20230213-0000013', '0119', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1856, 'U20230213-0000013', '0125', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1857, 'U20230213-0000013', '0126', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1858, 'U20230213-0000013', '0011', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1859, 'U20230213-0000013', '0013', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1860, 'U20230213-0000013', '0077', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1861, 'U20230213-0000013', '0078', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1862, 'U20230213-0000013', '0087', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1863, 'U20230213-0000013', '0088', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1864, 'U20230213-0000013', '0104', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1865, 'U20230213-0000013', '0105', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1866, 'U20230213-0000013', '0106', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1867, 'U20230213-0000013', '0109', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1868, 'U20230213-0000013', '0110', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1869, 'U20230213-0000013', '0111', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1870, 'U20230213-0000013', '0112', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1871, 'U20230213-0000013', '0113', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1872, 'U20230213-0000013', '0114', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1873, 'U20230213-0000013', '0117', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1874, 'U20230213-0000013', '0107', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1875, 'U20230213-0000013', '0108', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1876, 'U20230213-0000013', '0116', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1877, 'U20230213-0000013', '0017', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1878, 'U20230213-0000013', '0018', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1879, 'U20230213-0000013', '0019', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1880, 'U20230213-0000013', '0021', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1881, 'U20230213-0000013', '0115', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1882, 'U20230213-0000013', '0120', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1883, 'U20230213-0000013', '0122', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1884, 'U20230213-0000013', '0123', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1885, 'U20230213-0000013', '0124', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1886, 'U20230213-0000013', '0127', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1887, 'U20230213-0000013', '0128', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1888, 'U20230213-0000013', '0040', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1889, 'U20230213-0000013', '0041', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1890, 'U20230213-0000013', '0042', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1891, 'U20230213-0000013', '0043', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1892, 'U20230213-0000013', '0044', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1893, 'U20230213-0000013', '0049', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1894, 'U20230213-0000013', '0050', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1895, 'U20230213-0000013', '0045', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1896, 'U20230213-0000013', '0046', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1897, 'U20230213-0000013', '0047', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1898, 'U20230213-0000013', '0048', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1899, 'U20230213-0000013', '0057', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1900, 'U20230213-0000013', '0058', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1901, 'U20230213-0000013', '0129', '1', 'U-0000001', '2023-02-13 12:19:27'),
(1919, 'U20230213-0000013', '0130', '1', 'U-0000001', '2023-02-13 13:59:59'),
(1920, 'U20230213-0000013', '0131', '1', 'U-0000001', '2023-02-13 15:17:30'),
(2023, 'U20230223-0000015', '0001', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2024, 'U20230223-0000015', '0002', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2025, 'U20230223-0000015', '0007', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2026, 'U20230223-0000015', '0008', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2027, 'U20230223-0000015', '0009', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2028, 'U20230223-0000015', '0089', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2029, 'U20230223-0000015', '0090', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2030, 'U20230223-0000015', '0103', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2031, 'U20230223-0000015', '0119', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2032, 'U20230223-0000015', '0125', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2033, 'U20230223-0000015', '0126', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2034, 'U20230223-0000015', '0132', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2035, 'U20230223-0000015', '0011', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2036, 'U20230223-0000015', '0013', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2037, 'U20230223-0000015', '0077', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2038, 'U20230223-0000015', '0078', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2039, 'U20230223-0000015', '0087', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2040, 'U20230223-0000015', '0088', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2041, 'U20230223-0000015', '0104', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2042, 'U20230223-0000015', '0105', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2043, 'U20230223-0000015', '0106', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2044, 'U20230223-0000015', '0109', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2045, 'U20230223-0000015', '0110', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2046, 'U20230223-0000015', '0111', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2047, 'U20230223-0000015', '0112', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2048, 'U20230223-0000015', '0113', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2049, 'U20230223-0000015', '0114', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2050, 'U20230223-0000015', '0117', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2051, 'U20230223-0000015', '0134', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2052, 'U20230223-0000015', '0107', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2053, 'U20230223-0000015', '0108', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2054, 'U20230223-0000015', '0116', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2055, 'U20230223-0000015', '0017', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2056, 'U20230223-0000015', '0018', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2057, 'U20230223-0000015', '0005', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2058, 'U20230223-0000015', '0021', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2059, 'U20230223-0000015', '0115', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2060, 'U20230223-0000015', '0120', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2061, 'U20230223-0000015', '0122', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2062, 'U20230223-0000015', '0123', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2063, 'U20230223-0000015', '0124', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2064, 'U20230223-0000015', '0127', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2065, 'U20230223-0000015', '0128', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2066, 'U20230223-0000015', '0130', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2067, 'U20230223-0000015', '0131', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2068, 'U20230223-0000015', '0133', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2069, 'U20230223-0000015', '0129', '1', 'U-0000001', '2023-03-01 11:59:42'),
(2070, 'U20230213-0000014', '0001', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2071, 'U20230213-0000014', '0002', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2072, 'U20230213-0000014', '0007', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2073, 'U20230213-0000014', '0008', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2074, 'U20230213-0000014', '0009', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2075, 'U20230213-0000014', '0089', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2076, 'U20230213-0000014', '0090', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2077, 'U20230213-0000014', '0103', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2078, 'U20230213-0000014', '0119', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2079, 'U20230213-0000014', '0125', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2080, 'U20230213-0000014', '0126', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2081, 'U20230213-0000014', '0011', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2082, 'U20230213-0000014', '0013', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2083, 'U20230213-0000014', '0106', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2084, 'U20230213-0000014', '0109', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2085, 'U20230213-0000014', '0110', '1', 'U-0000001', '2023-03-01 12:00:26'),
(2095, 'U-0000003', '0001', '1', 'U-0000001', '2023-03-01 12:21:33'),
(2096, 'U-0000003', '0002', '1', 'U-0000001', '2023-03-01 12:21:33'),
(2097, 'U-0000003', '0007', '1', 'U-0000001', '2023-03-01 12:21:33'),
(2098, 'U-0000003', '0008', '1', 'U-0000001', '2023-03-01 12:21:33'),
(2099, 'U-0000003', '0009', '1', 'U-0000001', '2023-03-01 12:21:33'),
(2100, 'U-0000003', '0089', '1', 'U-0000001', '2023-03-01 12:21:33'),
(2101, 'U-0000003', '0090', '1', 'U-0000001', '2023-03-01 12:21:33'),
(2102, 'U-0000003', '0103', '1', 'U-0000001', '2023-03-01 12:21:33'),
(2103, 'U-0000003', '0005', '1', 'U-0000001', '2023-03-01 12:21:33'),
(2151, 'U20230301-0000016', '0001', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2152, 'U20230301-0000016', '0002', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2153, 'U20230301-0000016', '0007', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2154, 'U20230301-0000016', '0008', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2155, 'U20230301-0000016', '0009', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2156, 'U20230301-0000016', '0089', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2157, 'U20230301-0000016', '0090', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2158, 'U20230301-0000016', '0103', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2159, 'U20230301-0000016', '0119', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2160, 'U20230301-0000016', '0125', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2161, 'U20230301-0000016', '0126', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2162, 'U20230301-0000016', '0132', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2163, 'U20230301-0000016', '0135', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2164, 'U20230301-0000016', '0011', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2165, 'U20230301-0000016', '0013', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2166, 'U20230301-0000016', '0077', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2167, 'U20230301-0000016', '0078', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2168, 'U20230301-0000016', '0087', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2169, 'U20230301-0000016', '0088', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2170, 'U20230301-0000016', '0104', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2171, 'U20230301-0000016', '0105', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2172, 'U20230301-0000016', '0106', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2173, 'U20230301-0000016', '0109', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2174, 'U20230301-0000016', '0110', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2175, 'U20230301-0000016', '0111', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2176, 'U20230301-0000016', '0112', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2177, 'U20230301-0000016', '0113', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2178, 'U20230301-0000016', '0114', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2179, 'U20230301-0000016', '0117', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2180, 'U20230301-0000016', '0134', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2181, 'U20230301-0000016', '0107', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2182, 'U20230301-0000016', '0108', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2183, 'U20230301-0000016', '0116', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2184, 'U20230301-0000016', '0017', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2185, 'U20230301-0000016', '0018', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2186, 'U20230301-0000016', '0005', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2187, 'U20230301-0000016', '0021', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2188, 'U20230301-0000016', '0115', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2189, 'U20230301-0000016', '0120', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2190, 'U20230301-0000016', '0122', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2191, 'U20230301-0000016', '0123', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2192, 'U20230301-0000016', '0124', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2193, 'U20230301-0000016', '0127', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2194, 'U20230301-0000016', '0128', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2195, 'U20230301-0000016', '0130', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2196, 'U20230301-0000016', '0131', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2197, 'U20230301-0000016', '0133', '1', 'U-0000001', '2023-03-01 12:27:48'),
(2365, 'U20230306-0000017', '0001', '1', 'U20230306-0000017', '2023-03-06 11:56:34'),
(2366, 'U20230306-0000017', '0002', '1', 'U20230306-0000017', '2023-03-06 11:56:34'),
(2367, 'U20230306-0000017', '0007', '1', 'U20230306-0000017', '2023-03-06 11:56:34'),
(2368, 'U20230306-0000017', '0008', '1', 'U20230306-0000017', '2023-03-06 11:56:35'),
(2369, 'U20230306-0000017', '0009', '1', 'U20230306-0000017', '2023-03-06 11:56:35'),
(2370, 'U20230306-0000017', '0089', '1', 'U20230306-0000017', '2023-03-06 11:56:35'),
(2371, 'U20230306-0000017', '0090', '1', 'U20230306-0000017', '2023-03-06 11:56:35'),
(2372, 'U20230306-0000017', '0103', '1', 'U20230306-0000017', '2023-03-06 11:56:36'),
(2373, 'U20230306-0000017', '0119', '1', 'U20230306-0000017', '2023-03-06 11:56:36'),
(2374, 'U20230306-0000017', '0125', '1', 'U20230306-0000017', '2023-03-06 11:56:36'),
(2375, 'U20230306-0000017', '0126', '1', 'U20230306-0000017', '2023-03-06 11:56:36'),
(2376, 'U20230306-0000017', '0132', '1', 'U20230306-0000017', '2023-03-06 11:56:37'),
(2377, 'U20230306-0000017', '0135', '1', 'U20230306-0000017', '2023-03-06 11:56:37'),
(2378, 'U20230306-0000017', '0011', '1', 'U20230306-0000017', '2023-03-06 11:56:37'),
(2379, 'U20230306-0000017', '0077', '1', 'U20230306-0000017', '2023-03-06 11:56:38'),
(2380, 'U20230306-0000017', '0078', '1', 'U20230306-0000017', '2023-03-06 11:56:38'),
(2381, 'U20230306-0000017', '0087', '1', 'U20230306-0000017', '2023-03-06 11:56:38'),
(2382, 'U20230306-0000017', '0088', '1', 'U20230306-0000017', '2023-03-06 11:56:38'),
(2383, 'U20230306-0000017', '0104', '1', 'U20230306-0000017', '2023-03-06 11:56:39'),
(2384, 'U20230306-0000017', '0105', '1', 'U20230306-0000017', '2023-03-06 11:56:39'),
(2385, 'U20230306-0000017', '0106', '1', 'U20230306-0000017', '2023-03-06 11:56:39'),
(2386, 'U20230306-0000017', '0109', '1', 'U20230306-0000017', '2023-03-06 11:56:39'),
(2387, 'U20230306-0000017', '0110', '1', 'U20230306-0000017', '2023-03-06 11:56:40'),
(2388, 'U20230306-0000017', '0111', '1', 'U20230306-0000017', '2023-03-06 11:56:40'),
(2389, 'U20230306-0000017', '0112', '1', 'U20230306-0000017', '2023-03-06 11:56:40'),
(2390, 'U20230306-0000017', '0113', '1', 'U20230306-0000017', '2023-03-06 11:56:41'),
(2391, 'U20230306-0000017', '0114', '1', 'U20230306-0000017', '2023-03-06 11:56:41'),
(2392, 'U20230306-0000017', '0117', '1', 'U20230306-0000017', '2023-03-06 11:56:41'),
(2393, 'U20230306-0000017', '0134', '1', 'U20230306-0000017', '2023-03-06 11:56:41'),
(2394, 'U20230306-0000017', '0136', '1', 'U20230306-0000017', '2023-03-06 11:56:42'),
(2395, 'U20230306-0000017', '0107', '1', 'U20230306-0000017', '2023-03-06 11:56:42'),
(2396, 'U20230306-0000017', '0116', '1', 'U20230306-0000017', '2023-03-06 11:56:42'),
(2397, 'U20230306-0000017', '0017', '1', 'U20230306-0000017', '2023-03-06 11:56:42'),
(2398, 'U20230306-0000017', '0018', '1', 'U20230306-0000017', '2023-03-06 11:56:43'),
(2399, 'U20230306-0000017', '0005', '1', 'U20230306-0000017', '2023-03-06 11:56:43'),
(2400, 'U20230306-0000017', '0021', '1', 'U20230306-0000017', '2023-03-06 11:56:43'),
(2401, 'U20230306-0000017', '0115', '1', 'U20230306-0000017', '2023-03-06 11:56:44'),
(2402, 'U20230306-0000017', '0120', '1', 'U20230306-0000017', '2023-03-06 11:56:44'),
(2403, 'U20230306-0000017', '0122', '1', 'U20230306-0000017', '2023-03-06 11:56:44'),
(2404, 'U20230306-0000017', '0123', '1', 'U20230306-0000017', '2023-03-06 11:56:45'),
(2405, 'U20230306-0000017', '0124', '1', 'U20230306-0000017', '2023-03-06 11:56:45'),
(2406, 'U20230306-0000017', '0127', '1', 'U20230306-0000017', '2023-03-06 11:56:45'),
(2407, 'U20230306-0000017', '0128', '1', 'U20230306-0000017', '2023-03-06 11:56:46'),
(2408, 'U20230306-0000017', '0130', '1', 'U20230306-0000017', '2023-03-06 11:56:46'),
(2409, 'U20230306-0000017', '0131', '1', 'U20230306-0000017', '2023-03-06 11:56:46'),
(2410, 'U20230306-0000017', '0133', '1', 'U20230306-0000017', '2023-03-06 11:56:46'),
(2411, 'U20230306-0000017', '0040', '1', 'U20230306-0000017', '2023-03-06 11:56:47'),
(2412, 'U20230306-0000017', '0041', '1', 'U20230306-0000017', '2023-03-06 11:56:47'),
(2413, 'U20230306-0000017', '0042', '1', 'U20230306-0000017', '2023-03-06 11:56:47'),
(2414, 'U20230306-0000017', '0043', '1', 'U20230306-0000017', '2023-03-06 11:56:47'),
(2415, 'U20230306-0000017', '0044', '1', 'U20230306-0000017', '2023-03-06 11:56:48'),
(2416, 'U20230306-0000017', '0049', '1', 'U20230306-0000017', '2023-03-06 11:56:48'),
(2417, 'U20230306-0000017', '0050', '1', 'U20230306-0000017', '2023-03-06 11:56:48'),
(2418, 'U20230306-0000017', '0137', '1', 'U20230306-0000017', '2023-03-06 11:56:49'),
(2419, 'U20230306-0000017', '0138', '1', 'U20230306-0000017', '2023-03-06 11:56:49'),
(2420, 'U20230306-0000017', '0139', '1', 'U20230306-0000017', '2023-03-06 11:56:49'),
(2421, 'U20230306-0000017', '0140', '1', 'U20230306-0000017', '2023-03-06 11:56:50'),
(2422, 'U20230306-0000017', '0045', '1', 'U20230306-0000017', '2023-03-06 11:56:50'),
(2423, 'U20230306-0000017', '0046', '1', 'U20230306-0000017', '2023-03-06 11:56:50'),
(2424, 'U20230306-0000017', '0047', '1', 'U20230306-0000017', '2023-03-06 11:56:50'),
(2425, 'U20230306-0000017', '0048', '1', 'U20230306-0000017', '2023-03-06 11:56:51'),
(2426, 'U20230306-0000017', '0057', '1', 'U20230306-0000017', '2023-03-06 11:56:51'),
(2437, 'U202404073851-0000009', '0001', '1', 'U-0000001', '2024-04-11 16:25:41'),
(2438, 'U202404073851-0000009', '0016', '1', 'U-0000001', '2024-04-11 16:25:41'),
(2439, 'U202404073851-0000009', '0004', '1', 'U-0000001', '2024-04-11 16:25:41'),
(2448, 'U202404041037-0000005', '0001', '1', 'U-0000001', '2024-04-11 16:40:36'),
(2449, 'U202404041037-0000005', '0016', '1', 'U-0000001', '2024-04-11 16:40:36'),
(2450, 'U202404041037-0000005', '0004', '1', 'U-0000001', '2024-04-11 16:40:36'),
(2536, 'U202404112560-0000002', '0003', '1', 'U-0000001', '2024-04-11 17:25:24'),
(2537, 'U202404112560-0000002', '0001', '1', 'U-0000001', '2024-04-11 17:25:24'),
(2538, 'U202404112560-0000002', '0016', '1', 'U-0000001', '2024-04-11 17:25:24'),
(2539, 'U202404112560-0000002', '0004', '1', 'U-0000001', '2024-04-11 17:25:24'),
(2548, 'U202404122044-0000006', '0004', '1', 'U-0000001', '2024-04-12 13:20:57'),
(2549, 'U202404122044-0000006', '0005', '1', 'U-0000001', '2024-04-12 13:20:57'),
(2550, 'U202404122044-0000006', '0006', '1', 'U-0000001', '2024-04-12 13:20:57'),
(2567, 'U202404115362-0000004', '0003', '1', 'U202404124613-0000007', '2024-04-12 13:48:23'),
(2568, 'U202404120940-0000008', '0003', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2569, 'U202404120940-0000008', '0001', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2570, 'U202404120940-0000008', '0016', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2571, 'U202404120940-0000008', '0004', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2572, 'U202404120940-0000008', '0005', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2573, 'U202404120940-0000008', '0006', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2574, 'U202404120940-0000008', '0007', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2575, 'U202404120940-0000008', '0008', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2576, 'U202404120940-0000008', '0009', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2577, 'U202404120940-0000008', '0010', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2578, 'U202404120940-0000008', '0011', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2579, 'U202404120940-0000008', '0012', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2580, 'U202404120940-0000008', '0013', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2581, 'U202404120940-0000008', '0014', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2582, 'U202404120940-0000008', '0015', '1', 'U-0000001', '2024-04-12 16:09:26'),
(2589, 'U202404231698-0000008', '0003', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2590, 'U202404231698-0000008', '0004', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2591, 'U202404231698-0000008', '0005', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2592, 'U202404231698-0000008', '0006', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2593, 'U202404231698-0000008', '0009', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2594, 'U202404231698-0000008', '0010', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2595, 'U202404231698-0000008', '0011', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2596, 'U202404231698-0000008', '0012', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2597, 'U202404231698-0000008', '0013', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2598, 'U202404231698-0000008', '0014', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2599, 'U202404231698-0000008', '0015', '1', 'U-0000001', '2024-04-23 14:16:42'),
(2600, 'U202404232333-0000009', '0003', '1', 'U-0000001', '2024-04-23 14:23:04'),
(2601, 'U202404232333-0000009', '0004', '1', 'U-0000001', '2024-04-23 14:23:04'),
(2602, 'U202404232333-0000009', '0005', '1', 'U-0000001', '2024-04-23 14:23:04'),
(2603, 'U202404232333-0000009', '0006', '1', 'U-0000001', '2024-04-23 14:23:04'),
(2604, 'U202404232333-0000009', '0007', '1', 'U-0000001', '2024-04-23 14:23:04'),
(2605, 'U202404232333-0000009', '0009', '1', 'U-0000001', '2024-04-23 14:23:05'),
(2606, 'U202404232333-0000009', '0010', '1', 'U-0000001', '2024-04-23 14:23:05'),
(2607, 'U202404232333-0000009', '0011', '1', 'U-0000001', '2024-04-23 14:23:05'),
(2608, 'U202404232333-0000009', '0012', '1', 'U-0000001', '2024-04-23 14:23:05'),
(2609, 'U202404232333-0000009', '0013', '1', 'U-0000001', '2024-04-23 14:23:05'),
(2610, 'U202404232333-0000009', '0014', '1', 'U-0000001', '2024-04-23 14:23:05'),
(2611, 'U202404232333-0000009', '0015', '1', 'U-0000001', '2024-04-23 14:23:05'),
(2612, 'U202404242285-0000010', '0003', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2613, 'U202404242285-0000010', '0001', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2614, 'U202404242285-0000010', '0004', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2615, 'U202404242285-0000010', '0005', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2616, 'U202404242285-0000010', '0006', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2617, 'U202404242285-0000010', '0008', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2618, 'U202404242285-0000010', '0009', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2619, 'U202404242285-0000010', '0010', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2620, 'U202404242285-0000010', '0012', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2621, 'U202404242285-0000010', '0013', '1', 'U-0000001', '2024-04-24 14:22:53'),
(2622, 'U202404242980-0000011', '0003', '1', 'U-0000001', '2024-04-24 14:29:50'),
(2623, 'U202404242980-0000011', '0001', '1', 'U-0000001', '2024-04-24 14:29:50'),
(2624, 'U202404242980-0000011', '0009', '1', 'U-0000001', '2024-04-24 14:29:50'),
(2647, 'U202404263956-0000014', '0001', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(2648, 'U202404263956-0000014', '0004', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(2649, 'U202404263956-0000014', '0005', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(2650, 'U202404263956-0000014', '0006', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(2651, 'U202404263956-0000014', '0008', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(2652, 'U202404263956-0000014', '0009', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(2653, 'U202404263956-0000014', '0010', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(2654, 'U202404263956-0000014', '0012', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(2655, 'U202404263956-0000014', '0013', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(2656, 'U202404283256-0000015', '0003', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2657, 'U202404283256-0000015', '0001', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2658, 'U202404283256-0000015', '0004', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2659, 'U202404283256-0000015', '0005', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2660, 'U202404283256-0000015', '0006', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2661, 'U202404283256-0000015', '0008', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2662, 'U202404283256-0000015', '0009', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2663, 'U202404283256-0000015', '0010', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2664, 'U202404283256-0000015', '0012', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2665, 'U202404283256-0000015', '0013', '1', 'U-0000001', '2024-04-28 17:32:44'),
(2666, 'U202404285141-0000016', '0003', '1', 'U-0000001', '2024-04-28 17:51:36'),
(2667, 'U202404285141-0000016', '0001', '1', 'U-0000001', '2024-04-28 17:51:36'),
(2668, 'U202404285141-0000016', '0005', '1', 'U-0000001', '2024-04-28 17:51:36'),
(2669, 'U202404285141-0000016', '0006', '1', 'U-0000001', '2024-04-28 17:51:36'),
(2670, 'U202404285141-0000016', '0008', '1', 'U-0000001', '2024-04-28 17:51:36'),
(2671, 'U202404285141-0000016', '0009', '1', 'U-0000001', '2024-04-28 17:51:36'),
(2672, 'U202404285141-0000016', '0010', '1', 'U-0000001', '2024-04-28 17:51:36'),
(2673, 'U202404285141-0000016', '0012', '1', 'U-0000001', '2024-04-28 17:51:36'),
(2674, 'U202404285141-0000016', '0013', '1', 'U-0000001', '2024-04-28 17:51:36'),
(2686, 'U202404282544-0000017', '0003', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(2687, 'U202404282544-0000017', '0001', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(2688, 'U202404282544-0000017', '0004', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(2689, 'U202404282544-0000017', '0005', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(2690, 'U202404282544-0000017', '0008', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(2691, 'U202404285614-0000017', '0001', '1', 'U202404261369-0000013', '2024-04-28 23:56:20'),
(2693, 'U202404121754-0000005', '0003', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2694, 'U202404121754-0000005', '0001', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2695, 'U202404121754-0000005', '0004', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2696, 'U202404121754-0000005', '0005', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2697, 'U202404121754-0000005', '0006', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2698, 'U202404121754-0000005', '0008', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2699, 'U202404121754-0000005', '0009', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2700, 'U202404121754-0000005', '0010', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2701, 'U202404121754-0000005', '0012', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2702, 'U202404121754-0000005', '0013', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(2703, 'U202404121454-0000008', '0003', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(2704, 'U202404121454-0000008', '0001', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(2705, 'U202404121454-0000008', '0005', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(2706, 'U202404121454-0000008', '0006', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(2707, 'U202404121454-0000008', '0009', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(2708, 'U202404121454-0000008', '0010', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(2709, 'U202404121454-0000008', '0012', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(2710, 'U202404121454-0000008', '0013', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(2711, 'U202404285896-0000018', '0001', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(2712, 'U202404285896-0000018', '0004', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(2713, 'U202404285896-0000018', '0005', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(2714, 'U202404285896-0000018', '0006', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(2715, 'U202404285896-0000018', '0008', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(2716, 'U202404285896-0000018', '0009', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(2717, 'U202404285896-0000018', '0010', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(2754, 'U202404261369-0000013', '0003', '1', 'U-0000001', '2024-05-09 00:59:08'),
(2755, 'U202404261369-0000013', '0001', '1', 'U-0000001', '2024-05-09 00:59:08'),
(2756, 'U202404261369-0000013', '0004', '1', 'U-0000001', '2024-05-09 00:59:08'),
(2757, 'U202404261369-0000013', '0005', '1', 'U-0000001', '2024-05-09 00:59:08'),
(2758, 'U202404261369-0000013', '0006', '1', 'U-0000001', '2024-05-09 00:59:08'),
(2759, 'U202404261369-0000013', '0008', '1', 'U-0000001', '2024-05-09 00:59:08'),
(2760, 'U202404261369-0000013', '0015', '1', 'U-0000001', '2024-05-09 00:59:08'),
(2779, 'U-0000001', '0003', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2780, 'U-0000001', '0002', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2781, 'U-0000001', '0001', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2782, 'U-0000001', '0004', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2783, 'U-0000001', '0005', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2784, 'U-0000001', '0006', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2785, 'U-0000001', '0007', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2786, 'U-0000001', '0008', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2787, 'U-0000001', '0009', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2788, 'U-0000001', '0015', '1', 'U-0000001', '2024-05-09 02:03:13'),
(2789, 'U202404113834-0000003', '0001', '1', 'U-0000001', '2024-08-06 02:24:05'),
(2807, 'U202408062916-0000020', '0005', '1', 'U-0000001', '2024-08-06 21:18:54'),
(2808, 'U202404124613-0000007', '0003', '1', 'U-0000001', '2024-08-10 17:12:31'),
(2809, 'U202404124613-0000007', '0001', '1', 'U-0000001', '2024-08-10 17:12:31'),
(2810, 'U202404124613-0000007', '0005', '1', 'U-0000001', '2024-08-10 17:12:31'),
(2811, 'U202404124613-0000007', '0006', '1', 'U-0000001', '2024-08-10 17:12:31'),
(2812, 'U202404124613-0000007', '0007', '1', 'U-0000001', '2024-08-10 17:12:31'),
(2813, 'U202404124613-0000007', '0008', '1', 'U-0000001', '2024-08-10 17:12:31'),
(2814, 'U202404124613-0000007', '0009', '1', 'U-0000001', '2024-08-10 17:12:31'),
(2815, 'U202404124613-0000007', '0015', '1', 'U-0000001', '2024-08-10 17:12:31'),
(2823, 'U202404261112-0000012', '0003', '1', 'U-0000001', '2024-08-10 17:15:25'),
(2824, 'U202404261112-0000012', '0001', '1', 'U-0000001', '2024-08-10 17:15:25'),
(2825, 'U202404261112-0000012', '0005', '1', 'U-0000001', '2024-08-10 17:15:25'),
(2826, 'U202404261112-0000012', '0006', '1', 'U-0000001', '2024-08-10 17:15:25'),
(2827, 'U202404261112-0000012', '0008', '1', 'U-0000001', '2024-08-10 17:15:25'),
(2828, 'U202404261112-0000012', '0009', '1', 'U-0000001', '2024-08-10 17:15:25'),
(2829, 'U202404261112-0000012', '0015', '1', 'U-0000001', '2024-08-10 17:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `menusubusersold`
--

CREATE TABLE `menusubusersold` (
  `MENUCT_ID` int(11) NOT NULL,
  `MENUCT_USRUSERID` varchar(100) NOT NULL,
  `MENUCT_MENUDETCODE` varchar(50) DEFAULT NULL,
  `MENUCT_STATUS` enum('1','0') DEFAULT '1' COMMENT '"0"=> Revoked, "1"=> Granted',
  `MENUCT_ADDEDBY` varchar(50) DEFAULT NULL,
  `MENUCT_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `phys_users`
--

CREATE TABLE `phys_users` (
  `USR_USERID` int(11) NOT NULL,
  `USR_STATUS` enum('1','-1','0') DEFAULT '1' COMMENT '''"1"=>Enabled, "0"=>Disabled,"-1"=>Deleted'',',
  `USR_OTHERNAME` varchar(255) NOT NULL,
  `USR_SURNAME` varchar(255) NOT NULL,
  `USR_CODE` varchar(70) NOT NULL,
  `USR_FIRSTNAME` varchar(50) DEFAULT NULL,
  `USR_LASTNAME` varchar(52) DEFAULT NULL,
  `USR_BRCHID` varchar(50) DEFAULT NULL,
  `USR_USERNAME` varchar(255) NOT NULL,
  `USR_PASSWORD` varchar(255) NOT NULL,
  `USR_EMAIL` varchar(45) DEFAULT NULL,
  `USR_STARTDATE` date NOT NULL,
  `USR_EMERGENCYPHONE` varchar(255) DEFAULT NULL,
  `USR_PHONENO` varchar(100) DEFAULT NULL,
  `USR_LEVEL` varchar(50) NOT NULL DEFAULT '2' COMMENT '"2"=>frontdesk, "1"=>administrator,"3"=>Manager',
  `USR_ACTORID` varchar(120) DEFAULT NULL,
  `USR_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phys_users`
--

INSERT INTO `phys_users` (`USR_USERID`, `USR_STATUS`, `USR_OTHERNAME`, `USR_SURNAME`, `USR_CODE`, `USR_FIRSTNAME`, `USR_LASTNAME`, `USR_BRCHID`, `USR_USERNAME`, `USR_PASSWORD`, `USR_EMAIL`, `USR_STARTDATE`, `USR_EMERGENCYPHONE`, `USR_PHONENO`, `USR_LEVEL`, `USR_ACTORID`, `USR_INPUTEDDATE`) VALUES
(1, '1', 'Bharani', 'YAO', 'U-0000001', 'YAO', 'Bharani', '', 'yao@ADMIN', 'd375c72ac51d6da9b0cc20fb46017810adc58fbc70fe1d236062b0525331f42b', 'adzikahyao@waystudio.com', '0000-00-00', '+233266212420', '+233266212420', '1', 'U-0000001', '2024-05-05 12:57:31'),
(17, '-1', 'working', 'hds', 'U202404113834-0000003', NULL, NULL, 'BC-0005', 'ayao@way', '3c61e69eec64088e5f8ff9b500b9c5677e5f95aa453a213051357763603af15f', 'hdgksj@ksdhf.com', '2024-04-11', '026252', '0266232520', '1', 'U-0000001', '2024-08-10 17:23:26'),
(18, '0', 'hjgfjk', 'ok', 'U202404115362-0000004', NULL, NULL, NULL, 'frondesk@way', '69401143d5e4219f1db4eb75e03542abd473592b4dd48acabaefc3305acea31a', 'ok', '2024-04-11', '02660000', '026600000', '3', 'U202404113834-0000003', '2024-04-12 13:48:17'),
(19, '1', 'thera', 'pisty', 'U202404121754-0000005', NULL, NULL, 'BC-0005', 'therepisty@way', '883e9e7c7f5269961bad493a5439c1cea78d751959e41cf1978c626015b8be16', 'therepisty@way', '2024-04-12', '026600000', '0266232521', '2', 'U-0000001', '2024-04-30 11:23:24'),
(21, '1', 'bharani', 'jhon', 'U202404124613-0000007', NULL, NULL, 'BC-0005', 'baraniy@way', '9c83340850b2d40736a0b00be12cd2033ad8341291259ac986718834227a6b14', 'yao@way.com', '2024-04-12', '0266212420', '0266325231', '1', 'U-0000001', '2024-08-10 17:12:15'),
(22, '1', 'YAO', 'Barani', 'U202404120940-0000008', NULL, NULL, 'BC-0004', 'admins@way', '5a48fd528224d23ec7162578f62423d6aeb263fe8b97be1a2daa9ab3cfd9fc2a', 'yao@yao', '2024-04-12', '0266666666', '026666666', '1', 'U-0000001', '2024-04-12 16:09:26'),
(28, '1', 'yao', 'bharany', 'U202404261112-0000012', NULL, NULL, '', 'adminuser@way', '29f6e114d704085cd95ab5c11ee2f4a11729fd062ee6e4ef2ef5b9a8b274abf7', 'adim@way.com', '2024-04-26', '0266212420', '0266212420', '2', 'U-0000001', '2024-08-06 02:27:16'),
(29, '1', 'adminverse', 'yaoo', 'U202404261369-0000013', NULL, NULL, 'BC20230213-0000021', 'user@ADMIN', '7db694035dcc0f5c6ce30910046d59e2d29ebd96bc68c5eeeebc88b7cded9381', 'useradim@way.com', '2024-04-26', '0266212420', '0266212420', '1', 'U-0000001', '2024-04-26 20:13:17'),
(37, '1', 'ok', 'ok', 'U202408062916-0000020', NULL, NULL, 'BC-0005', 'booker@apple.com', 'a0774f4dfa98d8ef65358afb983b37875f53499a0cfb0fe669683b2f9abb3a04', 'bookin@gmail.com', '2024-08-06', 'ok', 'ok', '1', 'U202404261112-0000012', '2024-08-06 21:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `Pysio_branch`
--

CREATE TABLE `Pysio_branch` (
  `BRCH_ID` int(11) NOT NULL,
  `BRCH_BRCHCODE` varchar(50) DEFAULT NULL,
  `BRCH_CODE` varchar(50) NOT NULL,
  `BRCH_NAME` varchar(100) NOT NULL,
  `BRCH_STATUS` enum('0','1','-1') DEFAULT '0' COMMENT '1: Active, 0: Inactive, -1: Deleted',
  `BRCH_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Pysio_branch`
--

INSERT INTO `Pysio_branch` (`BRCH_ID`, `BRCH_BRCHCODE`, `BRCH_CODE`, `BRCH_NAME`, `BRCH_STATUS`, `BRCH_INPUTEDDATE`) VALUES
(1, 'G01', 'BC-0001', 'Accra HQ', NULL, '2021-10-21 22:48:29'),
(2, 'A01', 'BC-0002', 'Kumasi', NULL, '2021-10-21 22:50:14'),
(3, 'G02', 'BC-0003', 'Tema', NULL, '2021-10-21 22:50:52'),
(4, 'C01', 'BC-0004', 'Swedru', '1', '2021-10-22 17:35:53'),
(5, 'E01', 'BC-0005', 'Koforidua', '1', '2021-10-20 15:28:56'),
(6, 'E02', 'BC-0006', 'Nkawkaw', '1', '2021-10-20 15:29:00'),
(7, 'B01', 'BC-0007', 'Techiman', '1', '2021-10-20 15:29:04'),
(8, 'LP', 'BC-0008', 'goaso', '-1', '2023-03-01 16:27:08'),
(9, 'W01', 'BC-0009', 'Takoradi', '1', '2021-10-20 15:29:17'),
(10, 'C02', 'BC-0010', 'Cape Coast', '1', '2021-10-20 15:29:22'),
(11, 'N01', 'BC-0011', 'TAMALE/ UEST/UWST', '-1', '2023-03-01 16:52:57'),
(12, 'G03', 'BC-0012', 'Abossey Okai / Kaneshie', '-1', '2023-03-01 16:52:41'),
(13, 'C03', 'BC-0013', 'ASSIN FOSU', '1', '2021-10-20 15:29:38'),
(14, 'AWI', 'BC20211020-0000014', 'Awiani', '-1', '2021-10-20 15:34:58'),
(15, 'HP1', 'BC20211021-0000015', ' Awoshie', '1', '2021-10-21 18:18:01'),
(16, 'P90', 'BC20211021-0000016', 'Kasoa', '1', '2021-10-21 22:49:03'),
(17, 'LP11999999', 'BC20211021-0000017', ' ', '-1', '2021-10-21 22:50:03'),
(18, 'E10', 'BC20211021-0000018', 'Prampram', '1', '2021-10-21 22:52:11'),
(19, 'AMA234', 'BC20230207-0000019', 'Amasaman', '1', '2023-02-07 13:06:44'),
(20, 'LP11999999', 'BC20230213-0000020', 'Abokobi', '1', '2023-02-13 09:02:28'),
(21, '53434', 'BC20230213-0000021', 'KASOA', '1', '2023-02-13 15:38:18'),
(22, '53434', 'BC20230213-0000022', 'KASOA', '-1', '2023-02-23 12:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `Registration`
--

CREATE TABLE `Registration` (
  `RE_ID` int(11) NOT NULL,
  `RE_CODE` varchar(80) DEFAULT NULL,
  `RE_FULLNAME` varchar(255) DEFAULT NULL,
  `RE_FNAME` varchar(100) DEFAULT NULL,
  `RE_LNAME` varchar(100) DEFAULT NULL,
  `RE_GENDER` varchar(50) DEFAULT NULL,
  `RE_EMAIL` varchar(150) DEFAULT NULL,
  `RE_PHONENUMBER` varchar(20) DEFAULT NULL,
  `RE_USERNAME` varchar(50) DEFAULT NULL,
  `RE_PASSWORD` varchar(150) DEFAULT NULL,
  `RE_STATUS` enum('0','1','2','3') NOT NULL DEFAULT '1' COMMENT '0 = Deleted,\r\n1 = Active\n2 = Pending\n3 = Expired\r\n',
  `RE_TOKENID` varchar(255) DEFAULT NULL,
  `RE_SESSION_ID` varchar(255) DEFAULT NULL,
  `RE_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `RE_REGION` varchar(50) DEFAULT NULL,
  `RE_DISTRICT` varchar(100) DEFAULT NULL,
  `RE_ABOUT_ME` text DEFAULT NULL,
  `RE_COUNTRY` varchar(70) DEFAULT NULL,
  `RE_POSTAL_ADDRESS` varchar(255) DEFAULT NULL,
  `RE_DIGITAL_ADDRESS` varchar(255) DEFAULT NULL,
  `RE_DOB` date DEFAULT NULL,
  `RE_LOGIN_STATUS` enum('0','1','2','3') DEFAULT '1' COMMENT '"0"=>logout, ""',
  `RE_LASTLOGIN_DATE` datetime DEFAULT NULL,
  `RE_LOGIN_IP` varchar(20) DEFAULT NULL,
  `RE_RESET_PASSWORD_TOKEN` varchar(255) DEFAULT NULL,
  `RE_SMS_TOKEN` varchar(5) DEFAULT NULL,
  `RE_UNAME` varchar(200) DEFAULT NULL,
  `RE_PICNAME` varchar(200) DEFAULT NULL,
  `RE_SIZE` varchar(50) DEFAULT NULL,
  `RE_PHONE_VALIDATE_STATUS` enum('0','1') DEFAULT '0' COMMENT '0=>Not Validate, 1=>Validated',
  `RE_LEVEL` varchar(255) DEFAULT NULL,
  `RE_CREATED_DATE` datetime DEFAULT NULL,
  `RE_FORCECHGPWD` enum('0','1') DEFAULT '0' COMMENT '0=> should not change password, 1=> should update password'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Report`
--

CREATE TABLE `Report` (
  `reportID` int(11) NOT NULL,
  `report_status` enum('1','2','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `therapists`
--

CREATE TABLE `therapists` (
  `THERAPIST_ID` int(11) NOT NULL,
  `THERAPISTS_ID` varchar(255) DEFAULT NULL,
  `USR_CODE` varchar(85) NOT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `OTHER_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `GENDER` enum('Male','Female','Other') DEFAULT NULL,
  `EMERGENCY_CONTACT_NAME` varchar(255) DEFAULT NULL,
  `EMERGENCY_CONTACT_NUMBER` varchar(20) DEFAULT NULL,
  `SPECIALIZATION` varchar(255) DEFAULT NULL,
  `QUALIFICATIONS` text DEFAULT NULL,
  `CERTIFICATIONS` text DEFAULT NULL,
  `WORK_DAYS` varchar(50) DEFAULT NULL,
  `WORK_HOURS_START` time DEFAULT NULL,
  `WORK_HOURS_END` time DEFAULT NULL,
  `LINKEDIN_PROFILE` varchar(255) DEFAULT NULL,
  `NOTES` text DEFAULT NULL,
  `MARITAL_STATUS` varchar(55) DEFAULT NULL,
  `T_STATUS` enum('1','2','0') DEFAULT '1',
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `NATIONALITY` varchar(255) DEFAULT NULL,
  `LICENSED_BY` varchar(65) DEFAULT NULL,
  `LICENSE_NO` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `therapists`
--

INSERT INTO `therapists` (`THERAPIST_ID`, `THERAPISTS_ID`, `USR_CODE`, `FIRST_NAME`, `OTHER_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `ADDRESS`, `DATE_OF_BIRTH`, `GENDER`, `EMERGENCY_CONTACT_NAME`, `EMERGENCY_CONTACT_NUMBER`, `SPECIALIZATION`, `QUALIFICATIONS`, `CERTIFICATIONS`, `WORK_DAYS`, `WORK_HOURS_START`, `WORK_HOURS_END`, `LINKEDIN_PROFILE`, `NOTES`, `MARITAL_STATUS`, `T_STATUS`, `CREATED_AT`, `UPDATED_AT`, `NATIONALITY`, `LICENSED_BY`, `LICENSE_NO`) VALUES
(1, 'T173314', '', 'Yao ', 'bharani', 'kjdsbfhk', 'yao@way.com', '3656', 'jklfk', '2024-02-28', 'Male', '', 'dsgj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Never Married/Single', '1', '2024-03-24 22:59:35', '2024-03-26 14:10:13', 'Ghana', NULL, NULL),
(2, 'T939823', '', 'hgks', 'ksdhfjk', 'sfkjh', 'hjdfh@hjd.com', '0266212420', 'hfdh', '2024-01-01', 'Male', 'hf', 'hfh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Married', '1', '2024-04-12 12:18:28', '2024-04-12 12:18:28', 'gh', NULL, NULL),
(3, 'T517332', '', 'Prince', 'otu', 'Aduamoah', 'princeaduamoah25@gmail.com', '0247161312', 'Hilda', '2024-04-18', 'Male', '0247161312', 'Prince Aduamoah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Never Married/Single', '1', '2024-04-22 20:52:01', '2024-04-22 20:52:01', 'Ghanaian', NULL, NULL),
(4, NULL, '', 'there', 'pist', NULL, 'dfghl@hfd.com', '00152655', NULL, NULL, NULL, NULL, '45265885', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-04-24 14:22:53', '2024-05-10 23:39:35', NULL, NULL, NULL),
(5, 'T668483', '', 'this', 'my', NULL, 'kjfhlk', '111111', NULL, NULL, NULL, NULL, '22222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2024-04-24 14:29:50', '2024-04-24 14:29:50', NULL, NULL, NULL),
(6, 'T23633', 'U202404285896-0000018', 'sdf', 'df', 'sdf', 'fsdf@www.c', '3154', 'accra', '2024-05-08', 'Male', '32444', '315', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Never Married/Single', '1', '2024-04-28 23:58:34', '2024-05-05 14:27:12', 'gh', 'gta', '12354');

-- --------------------------------------------------------

--
-- Table structure for table `userspermission`
--

CREATE TABLE `userspermission` (
  `MENUCT_ID` int(11) NOT NULL,
  `MENUCT_USRUSERID` varchar(100) NOT NULL,
  `MENUCT_MENUDETCODE` varchar(50) DEFAULT NULL,
  `MENUCT_STATUS` enum('1','0') DEFAULT '0' COMMENT '"0"=> Revoked, "1"=> Granted',
  `MENUCT_ADDEDBY` varchar(50) DEFAULT NULL,
  `MENUCT_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userspermission`
--

INSERT INTO `userspermission` (`MENUCT_ID`, `MENUCT_USRUSERID`, `MENUCT_MENUDETCODE`, `MENUCT_STATUS`, `MENUCT_ADDEDBY`, `MENUCT_INPUTEDDATE`) VALUES
(1, 'rtin211008', '0017', '1', '2', '2021-10-09 04:21:19'),
(2, 'st3211009', '0019', '1', '2', '2021-10-09 14:15:57'),
(3, 'st3211009', '0021', '1', '2', '2021-10-09 14:15:57'),
(13, 's4211009', '0090', '1', '2', '2021-10-09 17:04:01'),
(14, 's4211009', '0015', '1', '2', '2021-10-09 17:04:01'),
(15, 's4211009', '0016', '1', '2', '2021-10-09 17:04:01'),
(16, 's4211009', '0081', '1', '2', '2021-10-09 17:04:01'),
(33, 'U20211009-0000010', '0011', '1', '2', '2021-10-09 18:40:29'),
(34, 'U20211009-0000010', '0012', '1', '2', '2021-10-09 18:40:29'),
(35, 'U20211009-0000010', '0013', '1', '2', '2021-10-09 18:40:29'),
(36, 'U20211009-0000010', '0077', '1', '2', '2021-10-09 18:40:29'),
(37, 'U20211009-0000010', '0078', '1', '2', '2021-10-09 18:40:29'),
(38, 'U20211009-0000010', '0087', '1', '2', '2021-10-09 18:40:29'),
(39, 'U20211009-0000010', '0088', '1', '2', '2021-10-09 18:40:29'),
(40, 'U20211009-0000010', '0019', '1', '2', '2021-10-09 18:40:29'),
(41, 'U20211009-0000010', '0021', '1', '2', '2021-10-09 18:40:29'),
(42, 'U20211009-0000010', '0024', '1', '2', '2021-10-09 18:40:29'),
(43, 'U20211009-0000011', '0015', '1', '2', '2021-10-09 22:15:28'),
(44, 'U20211009-0000011', '0016', '1', '2', '2021-10-09 22:15:28'),
(45, 'U20211009-0000011', '0081', '1', '2', '2021-10-09 22:15:28'),
(103, 'U20211014-0000012', '0011', '1', '2', '2021-10-14 14:44:37'),
(104, 'U20211014-0000012', '0012', '1', '2', '2021-10-14 14:44:37'),
(105, 'U20211014-0000012', '0013', '1', '2', '2021-10-14 14:44:37'),
(106, 'U20211014-0000012', '0077', '1', '2', '2021-10-14 14:44:37'),
(107, 'U20211014-0000012', '0078', '1', '2', '2021-10-14 14:44:37'),
(108, 'U20211014-0000012', '0087', '1', '2', '2021-10-14 14:44:37'),
(109, 'U20211014-0000012', '0088', '1', '2', '2021-10-14 14:44:37'),
(110, 'U-0000008', '0001', '1', 'U-0000001', '2023-01-26 15:10:33'),
(111, 'U-0000008', '0002', '1', 'U-0000001', '2023-01-26 15:10:33'),
(112, 'U-0000008', '0003', '1', 'U-0000001', '2023-01-26 15:10:34'),
(113, 'U-0000008', '0004', '1', 'U-0000001', '2023-01-26 15:10:34'),
(114, 'U-0000008', '0005', '1', 'U-0000001', '2023-01-26 15:10:34'),
(115, 'U-0000008', '0006', '1', 'U-0000001', '2023-01-26 15:10:34'),
(116, 'U-0000008', '0007', '1', 'U-0000001', '2023-01-26 15:10:35'),
(117, 'U-0000008', '0008', '1', 'U-0000001', '2023-01-26 15:10:35'),
(118, 'U-0000008', '0009', '1', 'U-0000001', '2023-01-26 15:10:35'),
(119, 'U-0000008', '0089', '1', 'U-0000001', '2023-01-26 15:10:35'),
(120, 'U-0000008', '0090', '1', 'U-0000001', '2023-01-26 15:10:36'),
(121, 'U-0000008', '0101', '1', 'U-0000001', '2023-01-26 15:10:36'),
(122, 'U-0000008', '0103', '1', 'U-0000001', '2023-01-26 15:10:36'),
(123, 'U-0000008', '0118', '1', 'U-0000001', '2023-01-26 15:10:36'),
(124, 'U-0000008', '0119', '1', 'U-0000001', '2023-01-26 15:10:37'),
(125, 'U-0000008', '0125', '1', 'U-0000001', '2023-01-26 15:10:37'),
(126, 'U-0000008', '0126', '1', 'U-0000001', '2023-01-26 15:10:37'),
(127, 'U-0000008', '0011', '1', 'U-0000001', '2023-01-26 15:10:37'),
(128, 'U-0000008', '0013', '1', 'U-0000001', '2023-01-26 15:10:38'),
(129, 'U-0000008', '0077', '1', 'U-0000001', '2023-01-26 15:10:38'),
(130, 'U-0000008', '0078', '1', 'U-0000001', '2023-01-26 15:10:38'),
(131, 'U-0000008', '0087', '1', 'U-0000001', '2023-01-26 15:10:38'),
(132, 'U-0000008', '0088', '1', 'U-0000001', '2023-01-26 15:10:39'),
(133, 'U-0000008', '0104', '1', 'U-0000001', '2023-01-26 15:10:39'),
(134, 'U-0000008', '0105', '1', 'U-0000001', '2023-01-26 15:10:39'),
(135, 'U-0000008', '0106', '1', 'U-0000001', '2023-01-26 15:10:39'),
(136, 'U-0000008', '0109', '1', 'U-0000001', '2023-01-26 15:10:40'),
(137, 'U-0000008', '0110', '1', 'U-0000001', '2023-01-26 15:10:40'),
(138, 'U-0000008', '0111', '1', 'U-0000001', '2023-01-26 15:10:40'),
(139, 'U-0000008', '0112', '1', 'U-0000001', '2023-01-26 15:10:40'),
(140, 'U-0000008', '0113', '1', 'U-0000001', '2023-01-26 15:10:41'),
(141, 'U-0000008', '0114', '1', 'U-0000001', '2023-01-26 15:10:41'),
(142, 'U-0000008', '0117', '1', 'U-0000001', '2023-01-26 15:10:41'),
(143, 'U-0000008', '0015', '1', 'U-0000001', '2023-01-26 15:10:41'),
(144, 'U-0000008', '0016', '1', 'U-0000001', '2023-01-26 15:10:41'),
(145, 'U-0000008', '0081', '1', 'U-0000001', '2023-01-26 15:10:42'),
(146, 'U-0000008', '0107', '1', 'U-0000001', '2023-01-26 15:10:42'),
(147, 'U-0000008', '0108', '1', 'U-0000001', '2023-01-26 15:10:42'),
(148, 'U-0000008', '0116', '1', 'U-0000001', '2023-01-26 15:10:42'),
(149, 'U-0000008', '0017', '1', 'U-0000001', '2023-01-26 15:10:43'),
(150, 'U-0000008', '0018', '1', 'U-0000001', '2023-01-26 15:10:43'),
(151, 'U-0000008', '0019', '1', 'U-0000001', '2023-01-26 15:10:43'),
(152, 'U-0000008', '0021', '1', 'U-0000001', '2023-01-26 15:10:43'),
(153, 'U-0000008', '0115', '1', 'U-0000001', '2023-01-26 15:10:44'),
(154, 'U-0000008', '0120', '1', 'U-0000001', '2023-01-26 15:10:44'),
(155, 'U-0000008', '0122', '1', 'U-0000001', '2023-01-26 15:10:44'),
(156, 'U-0000008', '0123', '1', 'U-0000001', '2023-01-26 15:10:44'),
(157, 'U-0000008', '0124', '1', 'U-0000001', '2023-01-26 15:10:45'),
(158, 'U-0000008', '0127', '1', 'U-0000001', '2023-01-26 15:10:45'),
(159, 'U-0000008', '0040', '1', 'U-0000001', '2023-01-26 15:10:45'),
(160, 'U-0000008', '0041', '1', 'U-0000001', '2023-01-26 15:10:45'),
(161, 'U-0000008', '0042', '1', 'U-0000001', '2023-01-26 15:10:46'),
(162, 'U-0000008', '0043', '1', 'U-0000001', '2023-01-26 15:10:46'),
(163, 'U-0000008', '0044', '1', 'U-0000001', '2023-01-26 15:10:46'),
(164, 'U-0000008', '0049', '1', 'U-0000001', '2023-01-26 15:10:46'),
(165, 'U-0000008', '0050', '1', 'U-0000001', '2023-01-26 15:10:47'),
(166, 'U-0000008', '0045', '1', 'U-0000001', '2023-01-26 15:10:47'),
(167, 'U-0000008', '0046', '1', 'U-0000001', '2023-01-26 15:10:47'),
(168, 'U-0000008', '0047', '1', 'U-0000001', '2023-01-26 15:10:47'),
(169, 'U-0000008', '0048', '1', 'U-0000001', '2023-01-26 15:10:48'),
(170, 'U-0000008', '0057', '1', 'U-0000001', '2023-01-26 15:10:48'),
(171, 'U-0000008', '0058', '1', 'U-0000001', '2023-01-26 15:10:48'),
(340, 'U20230213-0000013', '0001', '1', 'U-0000001', '2023-02-13 12:19:27'),
(341, 'U20230213-0000013', '0002', '1', 'U-0000001', '2023-02-13 12:19:27'),
(342, 'U20230213-0000013', '0004', '1', 'U-0000001', '2023-02-13 12:19:27'),
(343, 'U20230213-0000013', '0007', '1', 'U-0000001', '2023-02-13 12:19:27'),
(344, 'U20230213-0000013', '0008', '1', 'U-0000001', '2023-02-13 12:19:27'),
(345, 'U20230213-0000013', '0009', '1', 'U-0000001', '2023-02-13 12:19:27'),
(346, 'U20230213-0000013', '0089', '1', 'U-0000001', '2023-02-13 12:19:27'),
(347, 'U20230213-0000013', '0090', '1', 'U-0000001', '2023-02-13 12:19:27'),
(348, 'U20230213-0000013', '0103', '1', 'U-0000001', '2023-02-13 12:19:27'),
(349, 'U20230213-0000013', '0119', '1', 'U-0000001', '2023-02-13 12:19:27'),
(350, 'U20230213-0000013', '0125', '1', 'U-0000001', '2023-02-13 12:19:27'),
(351, 'U20230213-0000013', '0126', '1', 'U-0000001', '2023-02-13 12:19:27'),
(352, 'U20230213-0000013', '0011', '1', 'U-0000001', '2023-02-13 12:19:27'),
(353, 'U20230213-0000013', '0013', '1', 'U-0000001', '2023-02-13 12:19:27'),
(354, 'U20230213-0000013', '0077', '1', 'U-0000001', '2023-02-13 12:19:27'),
(355, 'U20230213-0000013', '0078', '1', 'U-0000001', '2023-02-13 12:19:27'),
(356, 'U20230213-0000013', '0087', '1', 'U-0000001', '2023-02-13 12:19:27'),
(357, 'U20230213-0000013', '0088', '1', 'U-0000001', '2023-02-13 12:19:27'),
(358, 'U20230213-0000013', '0104', '1', 'U-0000001', '2023-02-13 12:19:27'),
(359, 'U20230213-0000013', '0105', '1', 'U-0000001', '2023-02-13 12:19:27'),
(360, 'U20230213-0000013', '0106', '1', 'U-0000001', '2023-02-13 12:19:27'),
(361, 'U20230213-0000013', '0109', '1', 'U-0000001', '2023-02-13 12:19:27'),
(362, 'U20230213-0000013', '0110', '1', 'U-0000001', '2023-02-13 12:19:27'),
(363, 'U20230213-0000013', '0111', '1', 'U-0000001', '2023-02-13 12:19:27'),
(364, 'U20230213-0000013', '0112', '1', 'U-0000001', '2023-02-13 12:19:27'),
(365, 'U20230213-0000013', '0113', '1', 'U-0000001', '2023-02-13 12:19:27'),
(366, 'U20230213-0000013', '0114', '1', 'U-0000001', '2023-02-13 12:19:27'),
(367, 'U20230213-0000013', '0117', '1', 'U-0000001', '2023-02-13 12:19:27'),
(368, 'U20230213-0000013', '0107', '1', 'U-0000001', '2023-02-13 12:19:27'),
(369, 'U20230213-0000013', '0108', '1', 'U-0000001', '2023-02-13 12:19:27'),
(370, 'U20230213-0000013', '0116', '1', 'U-0000001', '2023-02-13 12:19:27'),
(371, 'U20230213-0000013', '0017', '1', 'U-0000001', '2023-02-13 12:19:27'),
(372, 'U20230213-0000013', '0018', '1', 'U-0000001', '2023-02-13 12:19:27'),
(373, 'U20230213-0000013', '0019', '1', 'U-0000001', '2023-02-13 12:19:27'),
(374, 'U20230213-0000013', '0021', '1', 'U-0000001', '2023-02-13 12:19:27'),
(375, 'U20230213-0000013', '0115', '1', 'U-0000001', '2023-02-13 12:19:27'),
(376, 'U20230213-0000013', '0120', '1', 'U-0000001', '2023-02-13 12:19:27'),
(377, 'U20230213-0000013', '0122', '1', 'U-0000001', '2023-02-13 12:19:27'),
(378, 'U20230213-0000013', '0123', '1', 'U-0000001', '2023-02-13 12:19:27'),
(379, 'U20230213-0000013', '0124', '1', 'U-0000001', '2023-02-13 12:19:27'),
(380, 'U20230213-0000013', '0127', '1', 'U-0000001', '2023-02-13 12:19:27'),
(381, 'U20230213-0000013', '0128', '1', 'U-0000001', '2023-02-13 12:19:27'),
(382, 'U20230213-0000013', '0040', '1', 'U-0000001', '2023-02-13 12:19:27'),
(383, 'U20230213-0000013', '0041', '1', 'U-0000001', '2023-02-13 12:19:27'),
(384, 'U20230213-0000013', '0042', '1', 'U-0000001', '2023-02-13 12:19:27'),
(385, 'U20230213-0000013', '0043', '1', 'U-0000001', '2023-02-13 12:19:27'),
(386, 'U20230213-0000013', '0044', '1', 'U-0000001', '2023-02-13 12:19:27'),
(387, 'U20230213-0000013', '0049', '1', 'U-0000001', '2023-02-13 12:19:27'),
(388, 'U20230213-0000013', '0050', '1', 'U-0000001', '2023-02-13 12:19:27'),
(389, 'U20230213-0000013', '0045', '1', 'U-0000001', '2023-02-13 12:19:27'),
(390, 'U20230213-0000013', '0046', '1', 'U-0000001', '2023-02-13 12:19:27'),
(391, 'U20230213-0000013', '0047', '1', 'U-0000001', '2023-02-13 12:19:27'),
(392, 'U20230213-0000013', '0048', '1', 'U-0000001', '2023-02-13 12:19:27'),
(393, 'U20230213-0000013', '0057', '1', 'U-0000001', '2023-02-13 12:19:27'),
(394, 'U20230213-0000013', '0058', '1', 'U-0000001', '2023-02-13 12:19:27'),
(395, 'U20230213-0000013', '0129', '1', 'U-0000001', '2023-02-13 12:19:27'),
(511, 'U20230223-0000015', '0001', '1', 'U-0000001', '2023-03-01 11:59:42'),
(512, 'U20230223-0000015', '0002', '1', 'U-0000001', '2023-03-01 11:59:42'),
(513, 'U20230223-0000015', '0007', '1', 'U-0000001', '2023-03-01 11:59:42'),
(514, 'U20230223-0000015', '0008', '1', 'U-0000001', '2023-03-01 11:59:42'),
(515, 'U20230223-0000015', '0009', '1', 'U-0000001', '2023-03-01 11:59:42'),
(516, 'U20230223-0000015', '0089', '1', 'U-0000001', '2023-03-01 11:59:42'),
(517, 'U20230223-0000015', '0090', '1', 'U-0000001', '2023-03-01 11:59:42'),
(518, 'U20230223-0000015', '0103', '1', 'U-0000001', '2023-03-01 11:59:42'),
(519, 'U20230223-0000015', '0119', '1', 'U-0000001', '2023-03-01 11:59:42'),
(520, 'U20230223-0000015', '0125', '1', 'U-0000001', '2023-03-01 11:59:42'),
(521, 'U20230223-0000015', '0126', '1', 'U-0000001', '2023-03-01 11:59:42'),
(522, 'U20230223-0000015', '0132', '1', 'U-0000001', '2023-03-01 11:59:42'),
(523, 'U20230223-0000015', '0011', '1', 'U-0000001', '2023-03-01 11:59:42'),
(524, 'U20230223-0000015', '0013', '1', 'U-0000001', '2023-03-01 11:59:42'),
(525, 'U20230223-0000015', '0077', '1', 'U-0000001', '2023-03-01 11:59:42'),
(526, 'U20230223-0000015', '0078', '1', 'U-0000001', '2023-03-01 11:59:42'),
(527, 'U20230223-0000015', '0087', '1', 'U-0000001', '2023-03-01 11:59:42'),
(528, 'U20230223-0000015', '0088', '1', 'U-0000001', '2023-03-01 11:59:42'),
(529, 'U20230223-0000015', '0104', '1', 'U-0000001', '2023-03-01 11:59:42'),
(530, 'U20230223-0000015', '0105', '1', 'U-0000001', '2023-03-01 11:59:42'),
(531, 'U20230223-0000015', '0106', '1', 'U-0000001', '2023-03-01 11:59:42'),
(532, 'U20230223-0000015', '0109', '1', 'U-0000001', '2023-03-01 11:59:42'),
(533, 'U20230223-0000015', '0110', '1', 'U-0000001', '2023-03-01 11:59:42'),
(534, 'U20230223-0000015', '0111', '1', 'U-0000001', '2023-03-01 11:59:42'),
(535, 'U20230223-0000015', '0112', '1', 'U-0000001', '2023-03-01 11:59:42'),
(536, 'U20230223-0000015', '0113', '1', 'U-0000001', '2023-03-01 11:59:42'),
(537, 'U20230223-0000015', '0114', '1', 'U-0000001', '2023-03-01 11:59:42'),
(538, 'U20230223-0000015', '0117', '1', 'U-0000001', '2023-03-01 11:59:42'),
(539, 'U20230223-0000015', '0134', '1', 'U-0000001', '2023-03-01 11:59:42'),
(540, 'U20230223-0000015', '0107', '1', 'U-0000001', '2023-03-01 11:59:42'),
(541, 'U20230223-0000015', '0108', '1', 'U-0000001', '2023-03-01 11:59:42'),
(542, 'U20230223-0000015', '0116', '1', 'U-0000001', '2023-03-01 11:59:42'),
(543, 'U20230223-0000015', '0017', '1', 'U-0000001', '2023-03-01 11:59:42'),
(544, 'U20230223-0000015', '0018', '1', 'U-0000001', '2023-03-01 11:59:42'),
(545, 'U20230223-0000015', '0005', '1', 'U-0000001', '2023-03-01 11:59:42'),
(546, 'U20230223-0000015', '0021', '1', 'U-0000001', '2023-03-01 11:59:42'),
(547, 'U20230223-0000015', '0115', '1', 'U-0000001', '2023-03-01 11:59:42'),
(548, 'U20230223-0000015', '0120', '1', 'U-0000001', '2023-03-01 11:59:42'),
(549, 'U20230223-0000015', '0122', '1', 'U-0000001', '2023-03-01 11:59:42'),
(550, 'U20230223-0000015', '0123', '1', 'U-0000001', '2023-03-01 11:59:42'),
(551, 'U20230223-0000015', '0124', '1', 'U-0000001', '2023-03-01 11:59:42'),
(552, 'U20230223-0000015', '0127', '1', 'U-0000001', '2023-03-01 11:59:42'),
(553, 'U20230223-0000015', '0128', '1', 'U-0000001', '2023-03-01 11:59:42'),
(554, 'U20230223-0000015', '0130', '1', 'U-0000001', '2023-03-01 11:59:42'),
(555, 'U20230223-0000015', '0131', '1', 'U-0000001', '2023-03-01 11:59:42'),
(556, 'U20230223-0000015', '0133', '1', 'U-0000001', '2023-03-01 11:59:42'),
(557, 'U20230223-0000015', '0129', '1', 'U-0000001', '2023-03-01 11:59:42'),
(558, 'U20230213-0000014', '0001', '1', 'U-0000001', '2023-03-01 12:00:26'),
(559, 'U20230213-0000014', '0002', '1', 'U-0000001', '2023-03-01 12:00:26'),
(560, 'U20230213-0000014', '0007', '1', 'U-0000001', '2023-03-01 12:00:26'),
(561, 'U20230213-0000014', '0008', '1', 'U-0000001', '2023-03-01 12:00:26'),
(562, 'U20230213-0000014', '0009', '1', 'U-0000001', '2023-03-01 12:00:26'),
(563, 'U20230213-0000014', '0089', '1', 'U-0000001', '2023-03-01 12:00:26'),
(564, 'U20230213-0000014', '0090', '1', 'U-0000001', '2023-03-01 12:00:26'),
(565, 'U20230213-0000014', '0103', '1', 'U-0000001', '2023-03-01 12:00:26'),
(566, 'U20230213-0000014', '0119', '1', 'U-0000001', '2023-03-01 12:00:26'),
(567, 'U20230213-0000014', '0125', '1', 'U-0000001', '2023-03-01 12:00:26'),
(568, 'U20230213-0000014', '0126', '1', 'U-0000001', '2023-03-01 12:00:26'),
(569, 'U20230213-0000014', '0011', '1', 'U-0000001', '2023-03-01 12:00:26'),
(570, 'U20230213-0000014', '0013', '1', 'U-0000001', '2023-03-01 12:00:26'),
(571, 'U20230213-0000014', '0088', '1', 'U-0000001', '2023-03-01 12:00:26'),
(572, 'U20230213-0000014', '0104', '1', 'U-0000001', '2023-03-01 12:00:26'),
(573, 'U20230213-0000014', '0105', '1', 'U-0000001', '2023-03-01 12:00:26'),
(574, 'U20230213-0000014', '0106', '1', 'U-0000001', '2023-03-01 12:00:26'),
(575, 'U20230213-0000014', '0109', '1', 'U-0000001', '2023-03-01 12:00:26'),
(576, 'U20230213-0000014', '0110', '1', 'U-0000001', '2023-03-01 12:00:26'),
(586, 'U-0000003', '0001', '1', 'U-0000001', '2023-03-01 12:21:33'),
(587, 'U-0000003', '0002', '1', 'U-0000001', '2023-03-01 12:21:33'),
(588, 'U-0000003', '0007', '1', 'U-0000001', '2023-03-01 12:21:33'),
(589, 'U-0000003', '0008', '1', 'U-0000001', '2023-03-01 12:21:33'),
(590, 'U-0000003', '0009', '1', 'U-0000001', '2023-03-01 12:21:33'),
(591, 'U-0000003', '0089', '1', 'U-0000001', '2023-03-01 12:21:33'),
(592, 'U-0000003', '0090', '1', 'U-0000001', '2023-03-01 12:21:33'),
(593, 'U-0000003', '0103', '1', 'U-0000001', '2023-03-01 12:21:33'),
(594, 'U-0000003', '0005', '1', 'U-0000001', '2023-03-01 12:21:33'),
(642, 'U20230301-0000016', '0001', '1', 'U-0000001', '2023-03-01 12:27:48'),
(643, 'U20230301-0000016', '0002', '1', 'U-0000001', '2023-03-01 12:27:48'),
(644, 'U20230301-0000016', '0007', '1', 'U-0000001', '2023-03-01 12:27:48'),
(645, 'U20230301-0000016', '0008', '1', 'U-0000001', '2023-03-01 12:27:48'),
(646, 'U20230301-0000016', '0009', '1', 'U-0000001', '2023-03-01 12:27:48'),
(647, 'U20230301-0000016', '0089', '1', 'U-0000001', '2023-03-01 12:27:48'),
(648, 'U20230301-0000016', '0090', '1', 'U-0000001', '2023-03-01 12:27:48'),
(649, 'U20230301-0000016', '0103', '1', 'U-0000001', '2023-03-01 12:27:48'),
(650, 'U20230301-0000016', '0119', '1', 'U-0000001', '2023-03-01 12:27:48'),
(651, 'U20230301-0000016', '0125', '1', 'U-0000001', '2023-03-01 12:27:48'),
(652, 'U20230301-0000016', '0126', '1', 'U-0000001', '2023-03-01 12:27:48'),
(653, 'U20230301-0000016', '0132', '1', 'U-0000001', '2023-03-01 12:27:48'),
(654, 'U20230301-0000016', '0135', '1', 'U-0000001', '2023-03-01 12:27:48'),
(655, 'U20230301-0000016', '0011', '1', 'U-0000001', '2023-03-01 12:27:48'),
(656, 'U20230301-0000016', '0013', '1', 'U-0000001', '2023-03-01 12:27:48'),
(657, 'U20230301-0000016', '0077', '1', 'U-0000001', '2023-03-01 12:27:48'),
(658, 'U20230301-0000016', '0078', '1', 'U-0000001', '2023-03-01 12:27:48'),
(659, 'U20230301-0000016', '0087', '1', 'U-0000001', '2023-03-01 12:27:48'),
(660, 'U20230301-0000016', '0088', '1', 'U-0000001', '2023-03-01 12:27:48'),
(661, 'U20230301-0000016', '0104', '1', 'U-0000001', '2023-03-01 12:27:48'),
(662, 'U20230301-0000016', '0105', '1', 'U-0000001', '2023-03-01 12:27:48'),
(663, 'U20230301-0000016', '0106', '1', 'U-0000001', '2023-03-01 12:27:48'),
(664, 'U20230301-0000016', '0109', '1', 'U-0000001', '2023-03-01 12:27:48'),
(665, 'U20230301-0000016', '0110', '1', 'U-0000001', '2023-03-01 12:27:48'),
(666, 'U20230301-0000016', '0111', '1', 'U-0000001', '2023-03-01 12:27:48'),
(667, 'U20230301-0000016', '0112', '1', 'U-0000001', '2023-03-01 12:27:48'),
(668, 'U20230301-0000016', '0113', '1', 'U-0000001', '2023-03-01 12:27:48'),
(669, 'U20230301-0000016', '0114', '1', 'U-0000001', '2023-03-01 12:27:48'),
(670, 'U20230301-0000016', '0117', '1', 'U-0000001', '2023-03-01 12:27:48'),
(671, 'U20230301-0000016', '0134', '1', 'U-0000001', '2023-03-01 12:27:48'),
(672, 'U20230301-0000016', '0107', '1', 'U-0000001', '2023-03-01 12:27:48'),
(673, 'U20230301-0000016', '0108', '1', 'U-0000001', '2023-03-01 12:27:48'),
(674, 'U20230301-0000016', '0116', '1', 'U-0000001', '2023-03-01 12:27:48'),
(675, 'U20230301-0000016', '0017', '1', 'U-0000001', '2023-03-01 12:27:48'),
(676, 'U20230301-0000016', '0018', '1', 'U-0000001', '2023-03-01 12:27:48'),
(677, 'U20230301-0000016', '0005', '1', 'U-0000001', '2023-03-01 12:27:48'),
(678, 'U20230301-0000016', '0021', '1', 'U-0000001', '2023-03-01 12:27:48'),
(679, 'U20230301-0000016', '0115', '1', 'U-0000001', '2023-03-01 12:27:48'),
(680, 'U20230301-0000016', '0120', '1', 'U-0000001', '2023-03-01 12:27:48'),
(681, 'U20230301-0000016', '0122', '1', 'U-0000001', '2023-03-01 12:27:48'),
(682, 'U20230301-0000016', '0123', '1', 'U-0000001', '2023-03-01 12:27:48'),
(683, 'U20230301-0000016', '0124', '1', 'U-0000001', '2023-03-01 12:27:48'),
(684, 'U20230301-0000016', '0127', '1', 'U-0000001', '2023-03-01 12:27:48'),
(685, 'U20230301-0000016', '0128', '1', 'U-0000001', '2023-03-01 12:27:48'),
(686, 'U20230301-0000016', '0130', '1', 'U-0000001', '2023-03-01 12:27:48'),
(687, 'U20230301-0000016', '0131', '1', 'U-0000001', '2023-03-01 12:27:48'),
(688, 'U20230301-0000016', '0133', '1', 'U-0000001', '2023-03-01 12:27:48'),
(855, 'U20230306-0000017', '0001', '1', 'U20230306-0000017', '2023-03-06 11:56:52'),
(856, 'U20230306-0000017', '0002', '1', 'U20230306-0000017', '2023-03-06 11:56:52'),
(857, 'U20230306-0000017', '0007', '1', 'U20230306-0000017', '2023-03-06 11:56:52'),
(858, 'U20230306-0000017', '0008', '1', 'U20230306-0000017', '2023-03-06 11:56:52'),
(859, 'U20230306-0000017', '0009', '1', 'U20230306-0000017', '2023-03-06 11:56:53'),
(860, 'U20230306-0000017', '0089', '1', 'U20230306-0000017', '2023-03-06 11:56:53'),
(861, 'U20230306-0000017', '0090', '1', 'U20230306-0000017', '2023-03-06 11:56:53'),
(862, 'U20230306-0000017', '0103', '1', 'U20230306-0000017', '2023-03-06 11:56:54'),
(863, 'U20230306-0000017', '0119', '1', 'U20230306-0000017', '2023-03-06 11:56:54'),
(864, 'U20230306-0000017', '0125', '1', 'U20230306-0000017', '2023-03-06 11:56:54'),
(865, 'U20230306-0000017', '0126', '1', 'U20230306-0000017', '2023-03-06 11:56:55'),
(866, 'U20230306-0000017', '0132', '1', 'U20230306-0000017', '2023-03-06 11:56:55'),
(867, 'U20230306-0000017', '0135', '1', 'U20230306-0000017', '2023-03-06 11:56:55'),
(868, 'U20230306-0000017', '0011', '1', 'U20230306-0000017', '2023-03-06 11:56:55'),
(869, 'U20230306-0000017', '0013', '1', 'U20230306-0000017', '2023-03-06 11:56:56'),
(870, 'U20230306-0000017', '0077', '1', 'U20230306-0000017', '2023-03-06 11:56:56'),
(871, 'U20230306-0000017', '0078', '1', 'U20230306-0000017', '2023-03-06 11:56:56'),
(872, 'U20230306-0000017', '0087', '1', 'U20230306-0000017', '2023-03-06 11:56:57'),
(873, 'U20230306-0000017', '0088', '1', 'U20230306-0000017', '2023-03-06 11:56:57'),
(874, 'U20230306-0000017', '0104', '1', 'U20230306-0000017', '2023-03-06 11:56:57'),
(875, 'U20230306-0000017', '0105', '1', 'U20230306-0000017', '2023-03-06 11:56:57'),
(876, 'U20230306-0000017', '0106', '1', 'U20230306-0000017', '2023-03-06 11:56:58'),
(877, 'U20230306-0000017', '0109', '1', 'U20230306-0000017', '2023-03-06 11:56:58'),
(878, 'U20230306-0000017', '0110', '1', 'U20230306-0000017', '2023-03-06 11:56:58'),
(879, 'U20230306-0000017', '0111', '1', 'U20230306-0000017', '2023-03-06 11:56:59'),
(880, 'U20230306-0000017', '0112', '1', 'U20230306-0000017', '2023-03-06 11:56:59'),
(881, 'U20230306-0000017', '0113', '1', 'U20230306-0000017', '2023-03-06 11:56:59'),
(882, 'U20230306-0000017', '0114', '1', 'U20230306-0000017', '2023-03-06 11:56:59'),
(883, 'U20230306-0000017', '0117', '1', 'U20230306-0000017', '2023-03-06 11:57:00'),
(884, 'U20230306-0000017', '0134', '1', 'U20230306-0000017', '2023-03-06 11:57:00'),
(885, 'U20230306-0000017', '0136', '1', 'U20230306-0000017', '2023-03-06 11:57:00'),
(886, 'U20230306-0000017', '0107', '1', 'U20230306-0000017', '2023-03-06 11:57:01'),
(887, 'U20230306-0000017', '0108', '1', 'U20230306-0000017', '2023-03-06 11:57:01'),
(888, 'U20230306-0000017', '0116', '1', 'U20230306-0000017', '2023-03-06 11:57:01'),
(889, 'U20230306-0000017', '0017', '1', 'U20230306-0000017', '2023-03-06 11:57:01'),
(890, 'U20230306-0000017', '0018', '1', 'U20230306-0000017', '2023-03-06 11:57:02'),
(891, 'U20230306-0000017', '0005', '1', 'U20230306-0000017', '2023-03-06 11:57:02'),
(892, 'U20230306-0000017', '0021', '1', 'U20230306-0000017', '2023-03-06 11:57:02'),
(893, 'U20230306-0000017', '0115', '1', 'U20230306-0000017', '2023-03-06 11:57:03'),
(894, 'U20230306-0000017', '0120', '1', 'U20230306-0000017', '2023-03-06 11:57:03'),
(895, 'U20230306-0000017', '0122', '1', 'U20230306-0000017', '2023-03-06 11:57:03'),
(896, 'U20230306-0000017', '0123', '1', 'U20230306-0000017', '2023-03-06 11:57:03'),
(897, 'U20230306-0000017', '0124', '1', 'U20230306-0000017', '2023-03-06 11:57:04'),
(898, 'U20230306-0000017', '0127', '1', 'U20230306-0000017', '2023-03-06 11:57:04'),
(899, 'U20230306-0000017', '0128', '1', 'U20230306-0000017', '2023-03-06 11:57:04'),
(900, 'U20230306-0000017', '0130', '1', 'U20230306-0000017', '2023-03-06 11:57:04'),
(901, 'U20230306-0000017', '0131', '1', 'U20230306-0000017', '2023-03-06 11:57:05'),
(902, 'U20230306-0000017', '0133', '1', 'U20230306-0000017', '2023-03-06 11:57:05'),
(903, 'U20230306-0000017', '0040', '1', 'U20230306-0000017', '2023-03-06 11:57:05'),
(904, 'U20230306-0000017', '0041', '1', 'U20230306-0000017', '2023-03-06 11:57:06'),
(905, 'U20230306-0000017', '0042', '1', 'U20230306-0000017', '2023-03-06 11:57:06'),
(906, 'U20230306-0000017', '0043', '1', 'U20230306-0000017', '2023-03-06 11:57:06'),
(907, 'U20230306-0000017', '0044', '1', 'U20230306-0000017', '2023-03-06 11:57:06'),
(908, 'U20230306-0000017', '0049', '1', 'U20230306-0000017', '2023-03-06 11:57:07'),
(909, 'U20230306-0000017', '0050', '1', 'U20230306-0000017', '2023-03-06 11:57:07'),
(910, 'U20230306-0000017', '0137', '1', 'U20230306-0000017', '2023-03-06 11:57:07'),
(911, 'U20230306-0000017', '0138', '1', 'U20230306-0000017', '2023-03-06 11:57:08'),
(912, 'U20230306-0000017', '0139', '1', 'U20230306-0000017', '2023-03-06 11:57:08'),
(913, 'U20230306-0000017', '0140', '1', 'U20230306-0000017', '2023-03-06 11:57:08'),
(914, 'U20230306-0000017', '0045', '1', 'U20230306-0000017', '2023-03-06 11:57:08'),
(915, 'U20230306-0000017', '0046', '1', 'U20230306-0000017', '2023-03-06 11:57:09'),
(916, 'U20230306-0000017', '0047', '1', 'U20230306-0000017', '2023-03-06 11:57:09'),
(917, 'U20230306-0000017', '0048', '1', 'U20230306-0000017', '2023-03-06 11:57:09'),
(918, 'U20230306-0000017', '0057', '1', 'U20230306-0000017', '2023-03-06 11:57:09'),
(919, 'U202404120940-0000008', '0003', '1', 'U-0000001', '2024-04-12 16:09:26'),
(920, 'U202404120940-0000008', '0001', '1', 'U-0000001', '2024-04-12 16:09:26'),
(921, 'U202404120940-0000008', '0016', '1', 'U-0000001', '2024-04-12 16:09:26'),
(922, 'U202404120940-0000008', '0004', '1', 'U-0000001', '2024-04-12 16:09:26'),
(923, 'U202404120940-0000008', '0005', '1', 'U-0000001', '2024-04-12 16:09:26'),
(924, 'U202404120940-0000008', '0006', '1', 'U-0000001', '2024-04-12 16:09:26'),
(925, 'U202404120940-0000008', '0007', '1', 'U-0000001', '2024-04-12 16:09:26'),
(926, 'U202404120940-0000008', '0008', '1', 'U-0000001', '2024-04-12 16:09:26'),
(927, 'U202404120940-0000008', '0009', '1', 'U-0000001', '2024-04-12 16:09:26'),
(928, 'U202404120940-0000008', '0010', '1', 'U-0000001', '2024-04-12 16:09:26'),
(929, 'U202404120940-0000008', '0011', '1', 'U-0000001', '2024-04-12 16:09:26'),
(930, 'U202404120940-0000008', '0012', '1', 'U-0000001', '2024-04-12 16:09:26'),
(931, 'U202404120940-0000008', '0013', '1', 'U-0000001', '2024-04-12 16:09:26'),
(932, 'U202404120940-0000008', '0014', '1', 'U-0000001', '2024-04-12 16:09:26'),
(933, 'U202404120940-0000008', '0015', '1', 'U-0000001', '2024-04-12 16:09:26'),
(940, 'U202404231698-0000008', '0003', '1', 'U-0000001', '2024-04-23 14:16:42'),
(941, 'U202404231698-0000008', '0004', '1', 'U-0000001', '2024-04-23 14:16:42'),
(942, 'U202404231698-0000008', '0005', '1', 'U-0000001', '2024-04-23 14:16:42'),
(943, 'U202404231698-0000008', '0006', '1', 'U-0000001', '2024-04-23 14:16:42'),
(944, 'U202404231698-0000008', '0009', '1', 'U-0000001', '2024-04-23 14:16:42'),
(945, 'U202404231698-0000008', '0010', '1', 'U-0000001', '2024-04-23 14:16:42'),
(946, 'U202404231698-0000008', '0011', '1', 'U-0000001', '2024-04-23 14:16:42'),
(947, 'U202404231698-0000008', '0012', '1', 'U-0000001', '2024-04-23 14:16:42'),
(948, 'U202404231698-0000008', '0013', '1', 'U-0000001', '2024-04-23 14:16:42'),
(949, 'U202404231698-0000008', '0014', '1', 'U-0000001', '2024-04-23 14:16:42'),
(950, 'U202404231698-0000008', '0015', '1', 'U-0000001', '2024-04-23 14:16:42'),
(973, 'U202404242980-0000011', '0003', '1', 'U-0000001', '2024-04-24 14:29:50'),
(974, 'U202404242980-0000011', '0001', '1', 'U-0000001', '2024-04-24 14:29:50'),
(975, 'U202404242980-0000011', '0009', '1', 'U-0000001', '2024-04-24 14:29:50'),
(987, 'U202404261112-0000012', '0003', '1', 'U-0000001', '2024-04-26 21:37:04'),
(988, 'U202404261112-0000012', '0001', '1', 'U-0000001', '2024-04-26 21:37:04'),
(989, 'U202404261112-0000012', '0004', '1', 'U-0000001', '2024-04-26 21:37:04'),
(990, 'U202404261112-0000012', '0005', '1', 'U-0000001', '2024-04-26 21:37:04'),
(991, 'U202404261112-0000012', '0006', '1', 'U-0000001', '2024-04-26 21:37:04'),
(992, 'U202404261112-0000012', '0008', '1', 'U-0000001', '2024-04-26 21:37:04'),
(993, 'U202404261112-0000012', '0009', '1', 'U-0000001', '2024-04-26 21:37:04'),
(994, 'U202404261112-0000012', '0010', '1', 'U-0000001', '2024-04-26 21:37:04'),
(995, 'U202404261112-0000012', '0012', '1', 'U-0000001', '2024-04-26 21:37:04'),
(996, 'U202404261112-0000012', '0013', '1', 'U-0000001', '2024-04-26 21:37:04'),
(997, 'U202404261112-0000012', '0015', '1', 'U-0000001', '2024-04-26 21:37:04'),
(998, 'U202404263956-0000014', '0001', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(999, 'U202404263956-0000014', '0004', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(1000, 'U202404263956-0000014', '0005', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(1001, 'U202404263956-0000014', '0006', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(1002, 'U202404263956-0000014', '0008', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(1003, 'U202404263956-0000014', '0009', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(1004, 'U202404263956-0000014', '0010', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(1005, 'U202404263956-0000014', '0012', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(1006, 'U202404263956-0000014', '0013', '1', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(1007, 'U202404283256-0000015', '0003', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1008, 'U202404283256-0000015', '0001', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1009, 'U202404283256-0000015', '0004', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1010, 'U202404283256-0000015', '0005', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1011, 'U202404283256-0000015', '0006', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1012, 'U202404283256-0000015', '0008', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1013, 'U202404283256-0000015', '0009', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1014, 'U202404283256-0000015', '0010', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1015, 'U202404283256-0000015', '0012', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1016, 'U202404283256-0000015', '0013', '1', 'U-0000001', '2024-04-28 17:32:44'),
(1017, 'U202404285141-0000016', '0003', '1', 'U-0000001', '2024-04-28 17:51:36'),
(1018, 'U202404285141-0000016', '0001', '1', 'U-0000001', '2024-04-28 17:51:36'),
(1019, 'U202404285141-0000016', '0005', '1', 'U-0000001', '2024-04-28 17:51:36'),
(1020, 'U202404285141-0000016', '0006', '1', 'U-0000001', '2024-04-28 17:51:36'),
(1021, 'U202404285141-0000016', '0008', '1', 'U-0000001', '2024-04-28 17:51:36'),
(1022, 'U202404285141-0000016', '0009', '1', 'U-0000001', '2024-04-28 17:51:36'),
(1023, 'U202404285141-0000016', '0010', '1', 'U-0000001', '2024-04-28 17:51:36'),
(1024, 'U202404285141-0000016', '0012', '1', 'U-0000001', '2024-04-28 17:51:36'),
(1025, 'U202404285141-0000016', '0013', '1', 'U-0000001', '2024-04-28 17:51:36'),
(1037, 'U202404282544-0000017', '0003', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(1038, 'U202404282544-0000017', '0001', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(1039, 'U202404282544-0000017', '0004', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(1040, 'U202404282544-0000017', '0005', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(1041, 'U202404282544-0000017', '0008', '1', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(1042, 'U202404285614-0000017', '0001', '1', 'U202404261369-0000013', '2024-04-28 23:56:20'),
(1044, 'U202404121754-0000005', '0003', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1045, 'U202404121754-0000005', '0001', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1046, 'U202404121754-0000005', '0004', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1047, 'U202404121754-0000005', '0005', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1048, 'U202404121754-0000005', '0006', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1049, 'U202404121754-0000005', '0008', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1050, 'U202404121754-0000005', '0009', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1051, 'U202404121754-0000005', '0010', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1052, 'U202404121754-0000005', '0012', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1053, 'U202404121754-0000005', '0013', '1', 'U202404261369-0000013', '2024-04-30 11:22:26'),
(1054, 'U202404121454-0000008', '0003', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(1055, 'U202404121454-0000008', '0001', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(1056, 'U202404121454-0000008', '0005', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(1057, 'U202404121454-0000008', '0006', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(1058, 'U202404121454-0000008', '0009', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(1059, 'U202404121454-0000008', '0010', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(1060, 'U202404121454-0000008', '0012', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(1061, 'U202404121454-0000008', '0013', '1', 'U202404261369-0000013', '2024-04-30 11:31:13'),
(1062, 'U202404285896-0000018', '0001', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(1063, 'U202404285896-0000018', '0004', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(1064, 'U202404285896-0000018', '0005', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(1065, 'U202404285896-0000018', '0006', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(1066, 'U202404285896-0000018', '0008', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(1067, 'U202404285896-0000018', '0009', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(1068, 'U202404285896-0000018', '0010', '1', 'U202404261369-0000013', '2024-04-30 12:16:11'),
(1081, 'U-0000001', '0003', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1082, 'U-0000001', '0001', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1083, 'U-0000001', '0004', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1084, 'U-0000001', '0005', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1085, 'U-0000001', '0006', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1086, 'U-0000001', '0008', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1087, 'U-0000001', '0009', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1088, 'U-0000001', '0010', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1089, 'U-0000001', '0012', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1090, 'U-0000001', '0013', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1091, 'U-0000001', '0014', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1092, 'U-0000001', '0015', '1', 'U-0000001', '2024-05-05 12:57:31'),
(1093, 'U202404261369-0000013', '0003', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1094, 'U202404261369-0000013', '0001', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1095, 'U202404261369-0000013', '0004', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1096, 'U202404261369-0000013', '0005', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1097, 'U202404261369-0000013', '0006', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1098, 'U202404261369-0000013', '0008', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1099, 'U202404261369-0000013', '0009', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1100, 'U202404261369-0000013', '0010', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1101, 'U202404261369-0000013', '0012', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1102, 'U202404261369-0000013', '0013', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1103, 'U202404261369-0000013', '0014', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1104, 'U202404261369-0000013', '0015', '1', 'U-0000001', '2024-05-05 13:05:18'),
(1105, 'U202404242285-0000010', '0003', '1', 'U-0000001', '2024-08-06 02:21:50'),
(1106, 'U202404242285-0000010', '0001', '1', 'U-0000001', '2024-08-06 02:21:50'),
(1107, 'U202404242285-0000010', '0005', '1', 'U-0000001', '2024-08-06 02:21:50'),
(1108, 'U202404242285-0000010', '0008', '1', 'U-0000001', '2024-08-06 02:21:50'),
(1109, 'U202404242285-0000010', '0010', '1', 'U-0000001', '2024-08-06 02:21:50'),
(1110, 'U202404242285-0000010', '0012', '1', 'U-0000001', '2024-08-06 02:21:50'),
(1111, 'U202404242285-0000010', '0013', '1', 'U-0000001', '2024-08-06 02:21:50'),
(1126, 'U202404232333-0000009', '0003', '1', 'U-0000001', '2024-08-06 21:04:12'),
(1127, 'U202404232333-0000009', '0005', '1', 'U-0000001', '2024-08-06 21:04:12'),
(1128, 'U202404232333-0000009', '0010', '1', 'U-0000001', '2024-08-06 21:04:12'),
(1129, 'U202404232333-0000009', '0012', '1', 'U-0000001', '2024-08-06 21:04:12'),
(1130, 'U202404232333-0000009', '0013', '1', 'U-0000001', '2024-08-06 21:04:12'),
(1131, 'U202404232333-0000009', '0014', '1', 'U-0000001', '2024-08-06 21:04:12'),
(1132, 'U202404232333-0000009', '0015', '1', 'U-0000001', '2024-08-06 21:04:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors_level`
--
ALTER TABLE `actors_level`
  ADD PRIMARY KEY (`ACL_ID`);

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`COM_CODE`) USING BTREE,
  ADD KEY `reviewid` (`COM_REVIEWCODE`);

--
-- Indexes for table `Estimate`
--
ALTER TABLE `Estimate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientID` (`estimateCode`);

--
-- Indexes for table `EstimateCat`
--
ALTER TABLE `EstimateCat`
  ADD PRIMARY KEY (`CAT_ID`);

--
-- Indexes for table `Estimateold`
--
ALTER TABLE `Estimateold`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estimateCode` (`estimateCode`);

--
-- Indexes for table `eventlog`
--
ALTER TABLE `eventlog`
  ADD PRIMARY KEY (`EVL_ID`);

--
-- Indexes for table `eventtype`
--
ALTER TABLE `eventtype`
  ADD PRIMARY KEY (`EVT_ID`) USING BTREE;
ALTER TABLE `eventtype` ADD FULLTEXT KEY `EVT_CODE` (`EVT_CODE`);

--
-- Indexes for table `InvoiceItems`
--
ALTER TABLE `InvoiceItems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financialID` (`financialID`);

--
-- Indexes for table `menugroup`
--
ALTER TABLE `menugroup`
  ADD PRIMARY KEY (`MENUGP_ID`),
  ADD UNIQUE KEY `MENUGP_CODE` (`MENUGP_CODE`);

--
-- Indexes for table `menusubgroup`
--
ALTER TABLE `menusubgroup`
  ADD PRIMARY KEY (`MENUCAT_ID`),
  ADD UNIQUE KEY `MENUCAT_CODE` (`MENUCAT_CODE`);

--
-- Indexes for table `menusubgroupdetail`
--
ALTER TABLE `menusubgroupdetail`
  ADD PRIMARY KEY (`MENUDET_ID`);

--
-- Indexes for table `menusubusers`
--
ALTER TABLE `menusubusers`
  ADD PRIMARY KEY (`MENUCT_ID`);

--
-- Indexes for table `menusubusersold`
--
ALTER TABLE `menusubusersold`
  ADD PRIMARY KEY (`MENUCT_ID`),
  ADD UNIQUE KEY `MENUCT_MENUDETCODE` (`MENUCT_MENUDETCODE`);

--
-- Indexes for table `phys_users`
--
ALTER TABLE `phys_users`
  ADD PRIMARY KEY (`USR_USERID`),
  ADD UNIQUE KEY `USR_USERNAME` (`USR_USERNAME`);

--
-- Indexes for table `Pysio_branch`
--
ALTER TABLE `Pysio_branch`
  ADD PRIMARY KEY (`BRCH_ID`);

--
-- Indexes for table `Registration`
--
ALTER TABLE `Registration`
  ADD PRIMARY KEY (`RE_ID`) USING BTREE;

--
-- Indexes for table `Report`
--
ALTER TABLE `Report`
  ADD PRIMARY KEY (`reportID`);

--
-- Indexes for table `therapists`
--
ALTER TABLE `therapists`
  ADD PRIMARY KEY (`THERAPIST_ID`),
  ADD UNIQUE KEY `THERAPISTS_ID` (`THERAPISTS_ID`),
  ADD UNIQUE KEY `FIRST_NAME` (`FIRST_NAME`);

--
-- Indexes for table `userspermission`
--
ALTER TABLE `userspermission`
  ADD PRIMARY KEY (`MENUCT_ID`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `channel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Estimate`
--
ALTER TABLE `Estimate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `Estimateold`
--
ALTER TABLE `Estimateold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eventlog`
--
ALTER TABLE `eventlog`
  MODIFY `EVL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eventtype`
--
ALTER TABLE `eventtype`
  MODIFY `EVT_ID` int(206) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `InvoiceItems`
--
ALTER TABLE `InvoiceItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `menugroup`
--
ALTER TABLE `menugroup`
  MODIFY `MENUGP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menusubgroup`
--
ALTER TABLE `menusubgroup`
  MODIFY `MENUCAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `menusubgroupdetail`
--
ALTER TABLE `menusubgroupdetail`
  MODIFY `MENUDET_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `menusubusers`
--
ALTER TABLE `menusubusers`
  MODIFY `MENUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2830;

--
-- AUTO_INCREMENT for table `menusubusersold`
--
ALTER TABLE `menusubusersold`
  MODIFY `MENUCT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phys_users`
--
ALTER TABLE `phys_users`
  MODIFY `USR_USERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `Pysio_branch`
--
ALTER TABLE `Pysio_branch`
  MODIFY `BRCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Registration`
--
ALTER TABLE `Registration`
  MODIFY `RE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Report`
--
ALTER TABLE `Report`
  MODIFY `reportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `therapists`
--
ALTER TABLE `therapists`
  MODIFY `THERAPIST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userspermission`
--
ALTER TABLE `userspermission`
  MODIFY `MENUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1133;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
