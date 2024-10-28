-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 05, 2024 at 09:44 PM
-- Server version: 10.6.18-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appgrand`
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
(2, 'L002', 'Physiotherapist', 2, '1', '2024-03-23 04:02:30'),
(3, 'L003', 'Front Desk Staff', 3, '1', '2024-03-23 04:03:03'),
(4, 'L004', 'Supervisor', 4, '0', '2024-04-08 21:00:50'),
(5, 'L005', 'Manager', 5, '0', '2024-04-08 21:00:57'),
(6, 'L006', 'Accountant', 6, '0', '2024-04-08 21:01:02'),
(7, 'L007', 'Medical Director:', 7, '0', '2024-04-08 21:01:07'),
(8, 'L008', 'IT Administrator', 8, '0', '2024-04-08 21:01:12'),
(9, 'L009', 'ext. agent', 9, '0', '2024-04-08 21:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `Assessments`
--

CREATE TABLE `Assessments` (
  `ASSESSMENTID` int(11) NOT NULL,
  `PATIENTID` varchar(45) DEFAULT NULL,
  `OBJECTIVEOMEASURES` varchar(156) DEFAULT NULL,
  `PROGNOSIS` varchar(100) DEFAULT NULL,
  `DIAGNOSIS` varchar(100) DEFAULT NULL,
  `SUBJECTIVE` varchar(56) DEFAULT NULL,
  `OBJECTIVE` varchar(100) DEFAULT NULL,
  `USERID` varchar(92) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `TREATMENTPLAN` text DEFAULT NULL,
  `TREATMENT` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DateOfBirth` date DEFAULT NULL,
  `TREATPLAN` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `assessStatus` enum('1','2','0') DEFAULT '1',
  `Occupation` varchar(100) DEFAULT NULL,
  `MaritalStatus` varchar(20) DEFAULT NULL,
  `BloodGroup` varchar(10) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `OTHERNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Assessments`
--

INSERT INTO `Assessments` (`ASSESSMENTID`, `PATIENTID`, `OBJECTIVEOMEASURES`, `PROGNOSIS`, `DIAGNOSIS`, `SUBJECTIVE`, `OBJECTIVE`, `USERID`, `therapist_id`, `TREATMENTPLAN`, `TREATMENT`, `created_at`, `updated_at`, `DateOfBirth`, `TREATPLAN`, `address`, `assessStatus`, `Occupation`, `MaritalStatus`, `BloodGroup`, `Gender`, `Nationality`, `FIRSTNAME`, `OTHERNAME`, `LASTNAME`) VALUES
(1, 'P210306', NULL, 'FDG                                    ', 'DF                                ', 'FDH                                ', 'HFH', NULL, NULL, NULL, NULL, '2024-04-27 14:54:21', '2024-04-27 14:54:21', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'Jane', 'Marie', 'Smith'),
(2, 'P359311', 'JFSKDHFKJ', 'SKJGH', 'KDSHKJF', 'KJFH', 'KJDGHJ', NULL, NULL, NULL, NULL, '2024-04-27 15:01:42', '2024-05-01 13:34:44', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'fdjksl', 'ldkls', 'ljdksl'),
(3, 'P587655', 'hjdlfksjkd', 'qqqqqq                                    ', 'qqqq                                ', '000011', 'qqqq                                ', NULL, NULL, NULL, NULL, '2024-04-27 16:42:43', '2024-05-01 16:13:59', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'tet', 't', 't'),
(4, 'P629253', NULL, 'ahgd                                    ', '                                asdhj', 'kjd                                ', '                                hsgldja', NULL, NULL, NULL, NULL, '2024-04-27 22:39:15', '2024-04-30 13:12:20', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'hgh', 'wordk', 'doc'),
(5, 'P210305', NULL, 'jh                                    ', 'hj                                ', 'jhsj                                ', '                                asjk', 'U202404285896-0000018', NULL, NULL, NULL, '2024-04-30 13:12:52', '2024-04-30 13:12:52', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'Yao', 'Michael', 'TG'),
(6, 'P379279', NULL, 'PROGNONSIS                                    ', 'DIAGNOSIS                                ', 'SUBJECTIV                                ', '                                OBJECTIVE', 'U202404261369-0000013', NULL, NULL, NULL, '2024-05-01 13:37:57', '2024-05-01 13:37:57', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'peter', 'n', 'you'),
(7, 'P587655', NULL, 'yhyhyh                                                                        ', 'qqqq                                                                ', '000011', 'qqqq                                                                ', 'U202404261369-0000013', NULL, NULL, NULL, '2024-05-01 23:17:02', '2024-05-01 23:17:02', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'tet', 't', 't'),
(8, 'P587655', NULL, 'yhh                                                                        ', 'qqqq                                                                ', '000011', 'qqqq                                                                ', 'U202404261369-0000013', NULL, NULL, NULL, '2024-05-01 23:17:28', '2024-05-01 23:17:28', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'tet', 't', 't'),
(9, 'P359311', NULL, 'SKJGH                                    ', '123456789                                ', 'KJFH', 'KJDGHJ                                ', 'U202404261369-0000013', NULL, NULL, NULL, '2024-05-02 00:21:41', '2024-05-02 00:21:41', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'fdjksl', 'ldkls', 'ljdksl');

-- --------------------------------------------------------

--
-- Table structure for table `Booking`
--

CREATE TABLE `Booking` (
  `BK_CODE` int(11) NOT NULL,
  `BK_LTCODE` varchar(95) DEFAULT NULL,
  `BK_HOST_CODE` varchar(50) DEFAULT NULL,
  `BK_TITLE` varchar(255) DEFAULT NULL,
  `BK_ROOM_NUM` varchar(95) NOT NULL,
  `BK_HOSTNAME` varchar(255) DEFAULT NULL,
  `BK_ADDRESS` varchar(255) DEFAULT NULL,
  `BK_CHECKIN` date DEFAULT NULL,
  `BK_CHEKOUT` date DEFAULT NULL,
  `BK_CLIENT_LASTNAME` varchar(255) DEFAULT NULL,
  `BK_REMARK` varchar(255) DEFAULT NULL,
  `BK_GUESTNO` varchar(20) DEFAULT NULL,
  `BK_CLIENT_EMAIL` varchar(255) DEFAULT NULL,
  `BK_CLIENT_PHONE` varchar(255) DEFAULT NULL,
  `BK_AMOUNT` varchar(90) DEFAULT NULL,
  `BK_PAYMENT_STATUS` enum('1','2','3') DEFAULT '1' COMMENT '“1”=>Pending, “2”=> Paid, “3”=>Cancelled',
  `BK_PAYMENT_METHOD` enum('0','1','2','3') DEFAULT NULL COMMENT '“1” => Mobile Money, “2”=> Card, “3” => Bank Transfer',
  `BK_STATUS` enum('1','2','3','4') DEFAULT '1' COMMENT '“1”=> Pending, “2”=>Booked, “3”=>Refunded, “4”=>Rejected',
  `BK_USERNAME` varchar(96) DEFAULT NULL,
  `BK_INPUTEDDATE` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `BK_DURATION` varchar(52) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Booking`
--

INSERT INTO `Booking` (`BK_CODE`, `BK_LTCODE`, `BK_HOST_CODE`, `BK_TITLE`, `BK_ROOM_NUM`, `BK_HOSTNAME`, `BK_ADDRESS`, `BK_CHECKIN`, `BK_CHEKOUT`, `BK_CLIENT_LASTNAME`, `BK_REMARK`, `BK_GUESTNO`, `BK_CLIENT_EMAIL`, `BK_CLIENT_PHONE`, `BK_AMOUNT`, `BK_PAYMENT_STATUS`, `BK_PAYMENT_METHOD`, `BK_STATUS`, `BK_USERNAME`, `BK_INPUTEDDATE`, `BK_DURATION`) VALUES
(48, 'BKL0759929', NULL, 'Special Accomodation', 'Apple Grand 001', NULL, NULL, '2024-08-03', '2024-08-07', 'yhao', 'yh', '2', NULL, '0266212420', '4', '2', NULL, '2', 'Bharani YAO', '2024-08-05 15:42:58', 'A Day');

-- --------------------------------------------------------

--
-- Table structure for table `BookingRecord`
--

CREATE TABLE `BookingRecord` (
  `BR_ID` int(11) NOT NULL,
  `CODE` varchar(59) NOT NULL,
  `BK_LTCODE` varchar(56) NOT NULL,
  `BK_USERNAME` varchar(120) NOT NULL,
  `BK_PAYMENT_STATUS` varchar(150) NOT NULL,
  `BK_CLIENT_LASTNAME` varchar(140) NOT NULL,
  `BR_AMOUNT` decimal(10,2) NOT NULL,
  `BK_ROOM_NUM` varchar(200) NOT NULL,
  `BK_TITLE` varchar(20) NOT NULL,
  `BK_CHEKOUT` varchar(56) NOT NULL,
  `BK_CHECKIN` varchar(78) NOT NULL,
  `BR_REMARK` text NOT NULL,
  `BR_DURATION` varchar(50) NOT NULL,
  `Bk_STATUS` enum('0','1') NOT NULL DEFAULT '1',
  `CREATEDDATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BookingRecord`
--

INSERT INTO `BookingRecord` (`BR_ID`, `CODE`, `BK_LTCODE`, `BK_USERNAME`, `BK_PAYMENT_STATUS`, `BK_CLIENT_LASTNAME`, `BR_AMOUNT`, `BK_ROOM_NUM`, `BK_TITLE`, `BK_CHEKOUT`, `BK_CHECKIN`, `BR_REMARK`, `BR_DURATION`, `Bk_STATUS`, `CREATEDDATE`) VALUES
(1, '32', 'BKL0883644', 'Bharani YAO', '1', 'jhdgksj', '12.00', 'Apple Grand 002', 'Special Accomodation', '2024-07-24', '2024-07-10', 'sdhfgsk', '3 Weeks', '1', '2024-07-25 10:26:42'),
(2, '33', 'BKL0516674', 'Bharani YAO', '1', 'yao', '12.00', 'Apple Grand 001', 'Normal Accomodation', '2024-07-24', '2024-07-16', 'hsdf', '6 Days', '1', '2024-07-25 10:34:54'),
(3, '34', 'BKL0932442', 'Bharani YAO', '1', 'yhao', '12.00', 'Apple Grand 016', 'Special Accomodation', '2024-07-24', '2024-07-24', 'jgkjh', '6 Days', '1', '2024-07-25 10:37:09'),
(4, '35', 'BKL0935644', 'Bharani YAO', '1', 'yhao', '12.00', 'Apple Grand 003', 'Normal Accomodation', '2024-07-24', '2024-07-24', 'oij', '1 Week', '1', '2024-07-25 10:42:49'),
(5, '18', 'BKL0773369', 'yao', '2', 'Eric', '52.00', 'Apple Grand 004', 'Normal Accomodation', '2024-07-26', '2024-07-21', 'payment', '24', '1', '2024-07-26 08:33:01'),
(6, '37', 'BKL0736434', 'Bharani YAO', '2', 'yhao today', '12.00', 'Apple Grand 005', 'Special Accomodation', '2024-07-25', '2024-07-24', 'hjdgf123', '2 Months', '1', '2024-07-26 19:37:33'),
(7, '38', 'BKL0758048', 'Bharani YAO', '1', 'PHONENUM', '12.00', 'Apple Grand 003', 'Special Accomodation', '2024-07-24', '2024-07-17', 'PHONEWORKING', '3 Days', '1', '2024-07-26 19:37:33'),
(8, '40', 'BKL0298776', 'Bharani YAO', '1', 'YHAO', '120.00', 'Apple Grand 006', 'Special Accomodation', '2024-07-25', '2024-07-17', 'hgk', 'A Day', '1', '2024-07-26 19:37:33'),
(9, '41', 'BKL0541966', 'Bharani YAO', '1', 'yao', '12.00', 'Apple Grand 016', 'Special Accomodation', '2024-07-26', '2024-07-17', 'ok', '2 Days', '1', '2024-07-26 19:54:39'),
(10, '36', 'BKL0839553', 'Bharani YAO', '2', 'working', '10.00', 'Apple Grand 002', 'Special Accomodation', '2024-07-27', '2024-07-16', 'shflh', '2 Weeks', '1', '2024-07-27 22:00:38'),
(11, '42', 'BKL0002130', 'Bharani YAO', '1', 'yao', '10.00', 'Apple Grand 001', 'Special Accomodation', '2024-07-27', '2024-07-09', 'yh', '2 Days', '1', '2024-07-27 22:00:38'),
(12, '44', 'BKL0633458', 'Bharani YAO', '1', 'cliet', '12.00', 'Apple Grand 005', 'Special Accomodation', '2024-07-27', '2024-07-18', 'sfs', '3 Days', '1', '2024-07-27 22:00:38'),
(13, '45', 'BKL0751557', 'Bharani YAO', '2', 'client', '12.00', 'Apple Grand 003', 'Normal Accomodation', '2024-07-27', '2024-07-17', 'update', '504', '1', '2024-07-27 22:00:38'),
(14, '46', 'BKL0428600', 'Bharani YAO', '1', 'yao', '12.00', 'Apple Grand 006', 'Special Accomodation', '2024-07-27', '2024-07-17', 'ad', '2 Days', '1', '2024-07-27 22:00:38'),
(15, '47', 'BKL0810916', 'Bharani YAO', '1', 'Rich', '10.00', 'Apple Grand 016', 'Normal Accomodation', '2024-07-27', '2024-07-18', 'dfsf', '3 Days', '1', '2024-07-27 22:00:38');

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `CAT_ID` int(11) NOT NULL,
  `APP_CATECODE` varchar(50) DEFAULT NULL,
  `CAT_CODE` varchar(50) NOT NULL,
  `CAT_DESC` varchar(250) NOT NULL,
  `CAT_PRIC` varchar(95) NOT NULL,
  `CAT_NUM_ROOM` varchar(56) NOT NULL,
  `CAT_NAME` varchar(100) NOT NULL,
  `CAT_STATUS` enum('0','1','-1') DEFAULT '0' COMMENT '1: Active, 0: Inactive, -1: Deleted',
  `CAT_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`CAT_ID`, `APP_CATECODE`, `CAT_CODE`, `CAT_DESC`, `CAT_PRIC`, `CAT_NUM_ROOM`, `CAT_NAME`, `CAT_STATUS`, `CAT_INPUTEDDATE`) VALUES
(1, 'G01', 'BC-0001', '', '', '', 'Accra HQ', '0', '2024-06-01 11:02:27'),
(2, 'A01', 'BC-0002', '', '', '', 'Kumasi', '0', '2024-06-01 11:02:33'),
(3, 'G02', 'BC-0003', '', '', '', 'Tema', '0', '2024-06-01 11:02:57'),
(4, 'C01', 'BC-0004', 'Special Accomodation', '900', '12', 'Special Accomodation', '1', '2024-07-21 19:02:44'),
(5, 'E01', 'BC-0005', 'Normal Accomodation (Standard)', '150', '18', 'Normal Accomodation', '1', '2024-07-13 22:33:58'),
(6, 'E02', 'BC-0006', '', '', '', 'Nkawkaw', '0', '2024-06-01 11:02:46'),
(7, 'B01', 'BC-0007', '', '', '', 'Techiman', '0', '2024-06-01 11:02:36'),
(8, 'LP', 'BC-0008', '', '', '', 'goaso', '0', '2024-06-01 11:03:04'),
(9, 'W01', 'BC-0009', '', '', '', 'Takoradi', '0', '2024-06-01 11:03:21'),
(10, 'C02', 'BC-0010', '', '', '', 'Cape Coast', '0', '2024-06-01 11:03:25'),
(11, 'N01', 'BC-0011', '', '', '', 'TAMALE/ UEST/UWST', '0', '2024-06-01 11:04:03'),
(12, 'G03', 'BC-0012', '', '', '', 'Abossey Okai / Kaneshie', '0', '2024-06-01 11:04:11'),
(13, 'C03', 'BC-0013', '', '', '', 'ASSIN FOSU', '0', '2024-06-01 11:04:31'),
(14, 'AWI', 'BC20211020-0000014', '', '', '', 'Awiani', '0', '2024-06-01 11:04:35'),
(15, 'HP1', 'BC20211021-0000015', '', '', '', ' Awoshie', '0', '2024-06-01 11:24:35'),
(16, 'P90', 'BC20211021-0000016', '', '', '', 'Kasoa', '0', '2024-06-01 11:04:51'),
(17, 'LP11999999', 'BC20211021-0000017', '', '', '', ' ', '0', '2024-06-01 11:04:48'),
(18, 'E10', 'BC20211021-0000018', '', '', '', 'Prampram', '0', '2024-06-01 11:04:44'),
(19, 'AMA234', 'BC20230207-0000019', '', '', '', 'Amasaman', '0', '2024-06-01 11:24:44'),
(20, 'LP11999999', 'BC20230213-0000020', '', '', '', 'Abokobi', '0', '2024-06-01 11:04:41'),
(21, '53434', 'BC20230213-0000021', '', '', '', 'KASOA', '0', '2024-06-01 11:24:39'),
(22, '53434', 'BC20230213-0000022', '', '', '', 'KASOA', '-1', '2023-02-23 12:26:22'),
(23, NULL, 'CC202405264621-0000023', 'hghk', '12', '12', 'zxklhg', '0', '2024-06-01 11:25:07'),
(24, NULL, 'CC202407144773-0000024', 'hdg', '95', 'yao', 'yao', '1', '2024-07-14 11:47:53');

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
-- Table structure for table `CombinedRooms`
--

CREATE TABLE `CombinedRooms` (
  `CombinedRoomID` int(11) NOT NULL,
  `RCode` varchar(25) NOT NULL,
  `RoomNumber` varchar(15) DEFAULT NULL,
  `RoomType` enum('Special','Normal') NOT NULL,
  `Status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CombinedRooms`
--

INSERT INTO `CombinedRooms` (`CombinedRoomID`, `RCode`, `RoomNumber`, `RoomType`, `Status`) VALUES
(1, '', 'AppleGrand001', 'Special', 1),
(2, '', 'AppleGrand002', 'Special', 1),
(3, '', 'AppleGrand012', 'Normal', 1),
(4, '', 'AppleGrand013', 'Normal', 1);

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

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`COM_CODE`, `COM_REGCODE`, `COM_REVIEWCODE`, `COM_NAME`, `COM_DATE`, `COM_REVIEW`, `COM_POSITION`, `COM_ADDRESS`, `COM_INPUTEDDATE`) VALUES
('CM61df18a688f6e', 'REG5fc675ff44790', 'dhf63264', 'Steve Acker', '2022-01-12', 'Thanks', NULL, NULL, '2022-01-12 18:10:58'),
('CM61df19984e29a', 'REG5fc675ff44790', '356437645', 'Steve Acker', '2022-01-12', 'Thanks for your comment', NULL, NULL, '2022-01-12 18:10:32'),
('CM61e0522270571', 'REG5fc675ff44790', 'fjhwe3642', 'Steve Acker', '2022-01-13', 'Thanks a lot', NULL, NULL, '2022-01-13 16:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `Country`
--

CREATE TABLE `Country` (
  `CN_ID` int(10) UNSIGNED NOT NULL,
  `CN_SLUG` char(2) NOT NULL,
  `CN_COUNTRY` varchar(255) NOT NULL,
  `CN_NATIONALITY` varchar(255) NOT NULL,
  `CN_PHONEPREFIX` varchar(10) DEFAULT NULL,
  `CN_STATUS` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `Country`
--

INSERT INTO `Country` (`CN_ID`, `CN_SLUG`, `CN_COUNTRY`, `CN_NATIONALITY`, `CN_PHONEPREFIX`, `CN_STATUS`) VALUES
(1, 'AF', 'Afghanistan', 'Afghan', '93', '0'),
(2, 'AL', 'Albania', 'Albanian', '355', '0'),
(3, 'DZ', 'Algeria', 'Algerian', '213', '1'),
(4, 'AS', 'American Samoa', 'American Samoan', '684', '0'),
(5, 'AD', 'Andorra', 'Andorran', '376', '0'),
(6, 'AO', 'Angola', 'Angolan', '244', '1'),
(7, 'AG', 'Antigua and Barbuda', 'Antiguans, Barbudans', '1-268', '1'),
(8, 'AR', 'Argentina', 'Argentinean', '54', '0'),
(9, 'AM', 'Armenia', 'Armenian', '374', '0'),
(10, 'AU', 'Australia', 'Australian', '61', '0'),
(11, 'AT', 'Austria', 'Austrian', '43', '0'),
(12, 'AZ', 'Azerbaijan', 'Azerbaijani', '994', '0'),
(13, 'BS', 'Bahamas', 'Bahamian', '1-242', '0'),
(14, 'BH', 'Bahrain', 'Bahraini', '973', '0'),
(15, 'BD', 'Bangladesh', 'Bangladeshi', '880', '0'),
(16, 'BB', 'Barbados', 'Barbadian', '1-246', '0'),
(17, 'BY', 'Belarus', 'Belarusian', '375', '0'),
(18, 'BE', 'Belgium', 'Belgian', '32', '0'),
(19, 'BZ', 'Belize', 'Belizean', '501', '0'),
(20, 'BJ', 'Benin', 'Beninese', '229', '1'),
(21, 'BM', 'Bermuda', 'Bermudan', '1-441', '0'),
(22, 'BT', 'Bhutan', 'Bhutanese', '975', '0'),
(23, 'BO', 'Bolivia', 'Bolivian', '591', '0'),
(24, 'BA', 'Bosnia and Herzegovina', 'Bosnian, Herzegovinian', '387', '0'),
(25, 'BW', 'Botswana', 'Motswana', '267', '1'),
(26, 'BR', 'Brazil', 'Brazilian', '55', '0'),
(27, 'BN', 'Brunei', 'Bruneian', '673', '0'),
(28, 'BG', 'Bulgaria', 'Bulgarian', '359', '0'),
(29, 'BF', 'Burkina Faso', 'Burkinabe', '226', '1'),
(30, 'BI', 'Burundi', 'Burundian', '257', '1'),
(31, 'KH', 'Cambodia', 'Cambodian', '855', '0'),
(32, 'CM', 'Cameroon', 'Cameroonian', '237', '1'),
(33, 'CA', 'Canada', 'Canadian', '1', '0'),
(34, 'CV', 'Cape Verde', 'Cape Verdian', '238', '1'),
(35, 'CF', 'Central African Republic', 'Central African', '236', '1'),
(36, 'TD', 'Chad', 'Chadian', '235', '1'),
(37, 'CL', 'Chile', 'Chilean', '56', '0'),
(38, 'CN', 'China', 'Chinese', '86', '0'),
(39, 'CO', 'Colombia', 'Colombian', '57', '0'),
(40, 'KM', 'Comoros', 'Comoran', '269', '0'),
(41, 'CG', 'Congo, Republic of the', 'Congolese', '242', '1'),
(42, 'CD', 'Congo, Democratic Republic of the', 'Congolese', '243', '1'),
(43, 'CR', 'Costa Rica', 'Costa Rican', '506', '0'),
(44, 'CI', 'Cote d\'Ivoire', 'Ivorian', '225', '1'),
(45, 'HR', 'Croatia', 'Croatian', '385', '0'),
(46, 'CU', 'Cuba', 'Cuban', '53', '0'),
(47, 'CW', 'Curacao', 'Curacan', NULL, '0'),
(48, 'CY', 'Cyprus', 'Cypriot', '357', '0'),
(49, 'CZ', 'Czech Republic', 'Czech', '420', '0'),
(50, 'DK', 'Denmark', 'Danish', '45', '0'),
(51, 'DJ', 'Djibouti', 'Djibouti', '253', '1'),
(52, 'DM', 'Dominica', 'Dominican', '1-767', '0'),
(53, 'DO', 'Dominican Republic', 'Dominican', '809', '0'),
(54, 'EC', 'Ecuador', 'Ecuadorean', '593', '0'),
(55, 'EG', 'Egypt', 'Egyptian', '20', '1'),
(56, 'SV', 'El Salvador', 'Salvadoran', '503', '0'),
(57, 'GQ', 'Equatorial Guinea', 'Equatorial Guinean', '240', '1'),
(58, 'ER', 'Eritrea', 'Eritrean', '291', '1'),
(59, 'EE', 'Estonia', 'Estonian', '372', '0'),
(60, 'ET', 'Ethiopia', 'Ethiopian', '251', '1'),
(61, 'FJ', 'Fiji', 'Fijian', '679', '0'),
(62, 'FI', 'Finland', 'Finnish', '358', '0'),
(63, 'FR', 'France', 'French', '33', '0'),
(64, 'GA', 'Gabon', 'Gabonese', '241', '1'),
(65, 'GM', 'Gambia', 'Gambian', '220', '1'),
(66, 'GE', 'Georgia', 'Georgian', '995', '0'),
(67, 'DE', 'Germany', 'German', '49', '0'),
(68, 'GH', 'Ghana', 'Ghanaian', '233', '1'),
(69, 'GR', 'Greece', 'Greek', '30', '0'),
(70, 'GD', 'Grenada', 'Grenadian', '1-473', '0'),
(71, 'GT', 'Guatemala', 'Guatemalan', '502', '0'),
(72, 'GN', 'Guinea', 'Guinean', '224', '1'),
(73, 'GW', 'Guinea-Bissau', 'Guinea-Bissauan', '245', '1'),
(74, 'GY', 'Guyana', 'Guyanese', '592', '0'),
(75, 'HT', 'Haiti', 'Haitian', '509', '0'),
(76, 'HN', 'Honduras', 'Honduran', '504', '0'),
(77, 'HU', 'Hungary', 'Hungarian', '36', '0'),
(78, 'IS', 'Iceland', 'Icelander', '354', '0'),
(79, 'IN', 'India', 'Indian', '91', '0'),
(80, 'ID', 'Indonesia', 'Indonesian', '62', '0'),
(81, 'IR', 'Iran', 'Iranian', '98', '0'),
(82, 'IQ', 'Iraq', 'Iraqi', '964', '0'),
(83, 'IE', 'Ireland', 'Irish', '353', '0'),
(84, 'IL', 'Israel', 'Israeli', '972', '0'),
(85, 'IT', 'Italy', 'Italian', '39', '0'),
(86, 'JM', 'Jamaica', 'Jamaican', '1-876', '0'),
(87, 'JP', 'Japan', 'Japanese', '81', '0'),
(88, 'JO', 'Jordan', 'Jordanian', '962', '0'),
(89, 'KZ', 'Kazakhstan', 'Kazakhstani', '7', '0'),
(90, 'KE', 'Kenya', 'Kenyan', '254', '1'),
(91, 'KI', 'Kiribati', 'I-Kiribati', '686', '0'),
(92, 'KP', 'Korea, North ', 'North Korean', '850', '0'),
(93, 'KR', 'Korea, South ', 'South Korean', '82', '0'),
(94, 'KW', 'Kuwait', 'Kuwaiti', '965', '0'),
(95, 'KG', 'Kyrgyz Republic', 'Kirghiz', '996', '0'),
(96, 'LA', 'Laos', 'Laotian', '856', '0'),
(97, 'LV', 'Latvia', 'Latvian', '371', '0'),
(98, 'LB', 'Lebanon', 'Lebanese', '961', '0'),
(99, 'LS', 'Lesotho', 'Mosotho', '266', '0'),
(100, 'LR', 'Liberia', 'Liberian', '231', '0'),
(101, 'LY', 'Libya', 'Libyan', '218', '1'),
(102, 'LI', 'Liechtenstein', 'Liechtensteiner', '423', '0'),
(103, 'LT', 'Lithuania', 'Lithuanian', '370', '0'),
(104, 'LU', 'Luxembourg', 'Luxembourger', '352', '0'),
(105, 'MK', 'Macedonia', 'Macedonian', '389', '0'),
(106, 'MG', 'Madagascar', 'Malagasy', '261', '1'),
(107, 'MW', 'Malawi', 'Malawian', '265', '1'),
(108, 'MY', 'Malaysia', 'Malaysian', '60', '0'),
(109, 'MV', 'Maldives', 'Maldivan', '960', '0'),
(110, 'ML', 'Mali', 'Malian', '223', '1'),
(111, 'MT', 'Malta', 'Maltese', '356', '0'),
(112, 'MH', 'Marshall Islands', 'Marshallese', '692', '0'),
(113, 'MR', 'Mauritania', 'Mauritanian', '222', '1'),
(114, 'MU', 'Mauritius', 'Mauritian', '230', '0'),
(115, 'MX', 'Mexico', 'Mexican', '52', '0'),
(116, 'FM', 'Micronesia Federated States of', 'Micronesian', NULL, '0'),
(117, 'MD', 'Moldova Republic of', 'Moldovan', '373', '0'),
(118, 'MC', 'Monaco', 'Monegasque', '377', '0'),
(119, 'MN', 'Mongolia', 'Mongolian', '976', '0'),
(120, 'MA', 'Morocco', 'Moroccan', '212', '1'),
(121, 'MZ', 'Mozambique', 'Mozambican', '258', '1'),
(122, 'MM', 'Myanmar (Burma)', 'Burmese', '95', '0'),
(123, 'NA', 'Namibia', 'Namibian', '264', '0'),
(124, 'NR', 'Nauru', 'Nauruan', '674', '0'),
(125, 'NP', 'Nepal', 'Nepalese', '977', '0'),
(126, 'NL', 'Netherlands', 'Dutch', '31', '0'),
(127, 'NZ', 'New Zealand', 'New Zealander', '64', '0'),
(128, 'NI', 'Nicaragua', 'Nicaraguan', '505', '0'),
(129, 'NE', 'Niger', 'Nigerien', '227', '1'),
(130, 'NG', 'Nigeria', 'Nigerian', '234', '1'),
(131, 'NO', 'Norway', 'Norwegian', '47', '0'),
(132, 'OM', 'Oman', 'Omani', '968', '0'),
(133, 'PK', 'Pakistan', 'Pakistani', '92', '0'),
(134, 'PW', 'Palau', 'Palauan', '680', '0'),
(135, 'PA', 'Panama', 'Panamanian', '507', '0'),
(136, 'PG', 'Papua New Guinea', 'Papua New Guinean', '675', '0'),
(137, 'PY', 'Paraguay', 'Paraguayan', '595', '0'),
(138, 'PE', 'Peru', 'Peruvian', '51', '0'),
(139, 'PR', 'Peurto Rico', 'Peurto Rican', '1-787', '0'),
(140, 'PH', 'Philippines', 'Filipino', '63', '0'),
(141, 'PL', 'Poland', 'Polish', '48', '0'),
(142, 'PT', 'Portugal', 'Portuguese', '351', '0'),
(143, 'QA', 'Qatar', 'Qatari', '974', '0'),
(144, 'RO', 'Romania', 'Romanian', '40', '0'),
(145, 'RU', 'Russia', 'Russian', '7', '0'),
(146, 'RW', 'Rwanda', 'Rwandan', '250', '1'),
(147, 'KN', 'Saint Kitts and Nevis', 'Kittian and Nevisian', '1-869', '0'),
(148, 'LC', 'Saint Lucia', 'Saint Lucian', '1-758', '0'),
(149, 'WS', 'Samoa', 'Samoan', '684', '0'),
(150, 'SM', 'San Marino', 'Sammarinese', '378', '0'),
(151, 'ST', 'Sao Tome and Principe', 'Sao Tomean', '239', '0'),
(152, 'SA', 'Saudi Arabia', 'Saudi Arabian', '966', '0'),
(153, 'SN', 'Senegal', 'Senegalese', '221', '1'),
(154, 'RS', 'Serbia', 'Serbian', '381', '0'),
(155, 'SC', 'Seychelles', 'Seychellois', '248', '0'),
(156, 'SL', 'Sierra Leone', 'Sierra Leonean', '232', '1'),
(157, 'SG', 'Singapore', 'Singaporean', '65', '0'),
(158, 'SK', 'Slovakia', 'Slovak', '421', '0'),
(159, 'SI', 'Slovenia', 'Slovene', '386', '0'),
(160, 'SB', 'Solomon Islands', 'Solomon Islander', '677', '0'),
(161, 'SO', 'Somalia', 'Somali', '252', '1'),
(162, 'ZA', 'South Africa', 'South African', '27', '1'),
(163, 'ES', 'Spain', 'Spanish', '34', '0'),
(164, 'LK', 'Sri Lanka', 'Sri Lankan', '94', '0'),
(165, 'SD', 'Sudan', 'Sudanese', '249', '1'),
(166, 'SR', 'Suriname', 'Surinamer', '597', '0'),
(167, 'SZ', 'Swaziland', 'Swazi', '268', '1'),
(168, 'SE', 'Sweden', 'Swedish', '46', '0'),
(169, 'CH', 'Switzerland', 'Swiss', '41', '1'),
(170, 'SY', 'Syria', 'Syrian', '963', '0'),
(171, 'TW', 'Taiwan', 'Taiwanese', '886', '0'),
(172, 'TJ', 'Tajikistan', 'Tadzhik', '992', '0'),
(173, 'TZ', 'Tanzania', 'Tanzanian', '255', '1'),
(174, 'TH', 'Thailand', 'Thai', '66', '0'),
(175, 'TG', 'Togo', 'Togolese', '228', '1'),
(176, 'TO', 'Tonga', 'Tongan', '676', '1'),
(177, 'TT', 'Trinidad and Tobago', 'Trinidadian', '1-868', '0'),
(178, 'TN', 'Tunisia', 'Tunisian', '216', '1'),
(179, 'TR', 'Turkey', 'Turkish', '90', '0'),
(180, 'TM', 'Turkmenistan', 'Turkmen', '993', '0'),
(181, 'TV', 'Tuvalu', 'Tuvaluan', '688', '0'),
(182, 'UG', 'Uganda', 'Ugandan', '256', '1'),
(183, 'UA', 'Ukraine', 'Ukrainian', '256', '0'),
(184, 'AE', 'United Arab Emirates', 'Emirian', '971', '0'),
(185, 'GB', 'United Kingdom', 'British', '44', '0'),
(186, 'US', 'United States', 'American', '1', '0'),
(187, 'UY', 'Uruguay', 'Uruguayan', '568', '0'),
(188, 'UZ', 'Uzbekistan', 'Uzbekistani', '998', '0'),
(189, 'VU', 'Vanuatu', 'Ni-Vanuatu', '678', '0'),
(190, 'VA', 'Vatican City (Holy See)', 'none', '39', '0'),
(191, 'VE', 'Venezuela', 'Venezuelan', '58', '0'),
(192, 'VN', 'Vietnam', 'Vietnamese', '84', '0'),
(193, 'YE', 'Yemen', 'Yemeni', '967', '0'),
(194, 'ZM', 'Zambia', 'Zambian', '260', '1'),
(195, 'ZW', 'Zimbabwe', 'Zimbabwean', '263', '1');

-- --------------------------------------------------------

--
-- Table structure for table `daa_menusubusers`
--

CREATE TABLE `daa_menusubusers` (
  `MENUCT_ID` int(11) NOT NULL,
  `MENUCT_USRUSERID` varchar(100) NOT NULL,
  `MENUCT_MENUDETCODE` varchar(50) DEFAULT NULL,
  `MENUCT_STATUS` enum('1','0') DEFAULT '1' COMMENT '"0"=> Revoked, "1"=> Granted',
  `MENUCT_ADDEDBY` varchar(50) DEFAULT NULL,
  `MENUCT_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `daa_menusubusers`
--

INSERT INTO `daa_menusubusers` (`MENUCT_ID`, `MENUCT_USRUSERID`, `MENUCT_MENUDETCODE`, `MENUCT_STATUS`, `MENUCT_ADDEDBY`, `MENUCT_INPUTEDDATE`) VALUES
(1524, 'U-0000001', '0001', '1', '2', '2021-10-20 10:09:51'),
(1525, 'U-0000001', '0002', '1', '2', '2021-10-12 22:56:58'),
(1526, 'U-0000001', '0003', '1', '2', '2021-10-12 22:56:58'),
(1527, 'U-0000001', '0004', '1', '2', '2021-10-12 22:56:58'),
(1528, 'U-0000001', '0005', '1', '2', '2021-10-12 22:56:58'),
(1529, 'U-0000001', '0006', '1', '2', '2021-10-12 22:56:58'),
(1530, 'U-0000001', '0007', '1', '2', '2021-10-12 22:56:58'),
(1531, 'U-0000001', '0008', '1', '2', '2021-10-12 22:56:58'),
(1532, 'U-0000001', '0009', '1', '2', '2021-10-12 22:56:58'),
(1533, 'U-0000001', '0010', '1', '2', '2021-10-12 22:56:58'),
(1534, 'U-0000001', '0089', '1', '2', '2021-10-12 22:56:58'),
(1535, 'U-0000001', '0090', '1', '2', '2021-10-12 22:56:58'),
(1536, 'U-0000001', '0011', '1', '2', '2021-10-12 22:56:58'),
(1537, 'U-0000001', '0012', '1', '2', '2021-10-12 22:56:58'),
(1538, 'U-0000001', '0013', '1', '2', '2021-10-12 22:56:58'),
(1539, 'U-0000001', '0077', '1', '2', '2021-10-12 22:56:58'),
(1540, 'U-0000001', '0078', '1', '2', '2021-10-12 22:56:58'),
(1541, 'U-0000001', '0087', '1', '2', '2021-10-12 22:56:58'),
(1542, 'U-0000001', '0088', '1', '2', '2021-10-12 22:56:58'),
(1543, 'U-0000001', '0015', '1', '2', '2021-10-12 22:56:58'),
(1544, 'U-0000001', '0016', '1', '2', '2021-10-12 22:56:58'),
(1545, 'U-0000001', '0081', '1', '2', '2021-10-12 22:56:58'),
(1546, 'U-0000001', '0017', '1', '2', '2021-10-12 22:56:58'),
(1547, 'U-0000001', '0018', '1', '2', '2021-10-12 22:56:58'),
(1548, 'U-0000001', '0019', '1', '2', '2021-10-12 22:56:58'),
(1549, 'U-0000001', '0021', '1', '2', '2021-10-12 22:56:58'),
(1550, 'U-0000001', '0023', '1', '2', '2021-10-12 22:56:58'),
(1551, 'U-0000001', '0024', '1', '2', '2021-10-12 22:56:58'),
(1552, 'U-0000001', '0032', '1', '2', '2021-10-12 22:56:58'),
(1553, 'U-0000001', '0033', '1', '2', '2021-10-12 22:56:58'),
(1554, 'U-0000001', '0034', '1', '2', '2021-10-12 22:56:58'),
(1555, 'U-0000001', '0040', '1', '2', '2021-10-12 22:56:58'),
(1556, 'U-0000001', '0041', '1', '2', '2021-10-12 22:56:58'),
(1557, 'U-0000001', '0042', '1', '2', '2021-10-12 22:56:58'),
(1558, 'U-0000001', '0043', '1', '2', '2021-10-12 22:56:58'),
(1559, 'U-0000001', '0044', '1', '2', '2021-10-12 22:56:58'),
(1560, 'U-0000001', '0049', '1', '2', '2021-10-12 22:56:58'),
(1561, 'U-0000001', '0045', '1', '2', '2021-10-12 22:56:58'),
(1562, 'U-0000001', '0046', '1', '2', '2021-10-12 22:56:58'),
(1563, 'U-0000001', '0047', '1', '2', '2021-10-12 22:56:58'),
(1564, 'U-0000001', '0048', '1', '2', '2021-10-12 22:56:58'),
(1565, 'U-0000001', '0058', '1', '2', '2021-10-12 22:56:58'),
(1566, 'U-0000001', '0104', '1', '2', '2021-10-13 12:33:58'),
(1567, 'U-0000001', '0105', '1', '2', '2021-10-13 12:45:27'),
(1580, 'U-0000001', '0101', '1', '2', '2021-10-20 09:37:43'),
(1583, 'U20211014-0000012', '0011', '1', '2', '2021-10-14 08:44:37'),
(1584, 'U20211014-0000012', '0012', '1', '2', '2021-10-14 08:44:37'),
(1585, 'U20211014-0000012', '0013', '1', '2', '2021-10-14 08:44:37'),
(1586, 'U20211014-0000012', '0077', '1', '2', '2021-10-14 08:44:37'),
(1587, 'U20211014-0000012', '0078', '1', '2', '2021-10-14 08:44:37'),
(1588, 'U20211014-0000012', '0087', '1', '2', '2021-10-14 08:44:37'),
(1589, 'U20211014-0000012', '0088', '1', '2', '2021-10-14 08:44:37'),
(1590, 'U-0000001', '0106', '1', '2', '2021-10-21 08:53:54'),
(1591, 'U-0000001', '0107', '1', '2', '2021-10-21 09:11:31'),
(1592, 'U-0000001', '0108', '1', '2', '2021-11-09 10:05:58'),
(1593, 'U-0000001', '0103', '1', '2', '2021-11-11 08:38:37'),
(1594, 'U-0000001', '0050', '1', '2', '2021-11-16 08:57:33'),
(1595, 'U-0000001', '0057', '1', '2', '2021-11-16 09:00:04'),
(1596, 'U-0000001', '0109', '1', '2', '2022-04-26 09:55:36'),
(1597, 'U-0000001', '0110', '1', '2', '2022-04-26 10:09:27'),
(1598, 'U-0000001', '0111', '1', '2', '2022-04-26 10:29:06'),
(1599, 'U-0000001', '0112', '1', '2', '2022-04-27 12:40:39'),
(1600, 'U-0000001', '0113', '1', '2', '2022-04-27 12:40:51'),
(1601, 'U-0000001', '0114', '1', '2', '2022-05-16 13:09:51'),
(1602, 'U-0000001', '0115', '1', '2', '2022-05-23 11:45:01'),
(1603, 'U-0000001', '0116', '1', '2', '2022-05-26 15:26:05'),
(1604, 'U-0000001', '0117', '1', '2', '2022-06-27 10:17:26'),
(1605, 'U-0000001', '0118', '1', '2', '2022-06-27 10:50:22'),
(1606, 'U-0000001', '0119', '1', '2', '2022-06-27 10:51:12'),
(1607, 'U-0000001', '0120', '1', '2', '2022-06-27 11:51:34'),
(1608, 'U-0000001', '0121', '1', '2', '2022-06-27 11:51:50'),
(1609, 'U-0000001', '0122', '1', '2', '2022-06-27 11:56:35'),
(1610, 'U-0000001', '0123', '1', '2', '2022-06-27 11:56:55'),
(1611, 'U-0000001', '0124', '1', '2', '2022-06-27 11:57:15'),
(1612, 'U-0000001', '0125', '1', '2', '2023-01-16 15:12:21'),
(1613, 'U-0000001', '0126', '1', '2', '2023-01-16 15:12:57'),
(1614, 'U-0000001', '0127', '1', '2', '2023-01-23 11:29:56'),
(1615, 'U-0000001', '0128', '1', '2', '2023-01-28 12:17:49'),
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
(1677, 'U-0000001', '0129', '1', 'U-0000001', '2023-01-30 15:52:59'),
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
(1921, 'U-0000001', '0130', '1', 'U-0000001', '2023-02-14 10:11:52'),
(1922, 'U-0000001', '0131', '1', 'U-0000001', '2023-02-14 10:15:52'),
(1923, 'U-0000001', '0132', '1', 'U-0000001', '2023-02-14 13:11:21'),
(1924, 'U-0000001', '0133', '1', 'U-0000001', '2023-02-14 13:35:26'),
(1974, 'U-0000001', '0134', '1', 'U-0000001', '2023-02-24 09:59:33'),
(1975, 'U-0000001', '0135', '1', 'U-0000001', '2023-02-24 16:08:30'),
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
(2198, 'U-0000001', '0136', '1', 'U-0000001', '2023-03-02 17:00:21'),
(2199, 'U-0000001', '0137', '1', 'U-0000001', '2023-03-02 21:25:35'),
(2200, 'U-0000001', '0138', '1', 'U-0000001', '2023-03-03 07:33:36'),
(2201, 'U-0000001', '0139', '1', 'U-0000001', '2023-03-03 15:44:23'),
(2202, 'U-0000001', '0140', '1', 'U-0000001', '2023-03-04 17:44:30'),
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
(2427, 'U-0000001', '0141', '1', 'U-0000001', '2023-03-08 13:13:25'),
(2428, 'U-0000001', '0142', '1', 'U-0000001', '2023-03-14 13:18:50'),
(2429, 'U-0000001', '0143', '1', 'U-0000001', '2023-03-21 14:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `discharge`
--

CREATE TABLE `discharge` (
  `discharge_id` int(11) NOT NULL,
  `PatientID` varchar(20) NOT NULL,
  `date_of_discharge` date NOT NULL,
  `discharge_reason` text DEFAULT NULL,
  `discharge_notes` text DEFAULT NULL,
  `discharge_instructions` text DEFAULT NULL,
  `discharge_summary` text DEFAULT NULL,
  `referral_to` varchar(255) DEFAULT NULL,
  `follow_up_date` date DEFAULT NULL,
  `dischargeStatus` enum('1','2','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL,
  `PatientID` varchar(20) DEFAULT NULL,
  `documents_ID` varchar(85) NOT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `document_type` enum('pdf','docx','jpg','png','other') DEFAULT NULL,
  `document_file` blob DEFAULT NULL,
  `uploaded_by` varchar(50) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `descriptions` varchar(152) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  `approved_by` varchar(50) DEFAULT NULL,
  `approval_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_archived` tinyint(1) DEFAULT 0,
  `dob` date DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `otherName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`document_id`, `PatientID`, `documents_ID`, `document_name`, `document_type`, `document_file`, `uploaded_by`, `upload_date`, `descriptions`, `is_approved`, `approved_by`, `approval_date`, `is_archived`, `dob`, `firstName`, `otherName`, `LastName`, `email`, `phoneNumber`) VALUES
(1, 'P210306', '', NULL, NULL, NULL, 'U202404261369-0000013', '2024-05-04 22:40:54', '          s      ', 0, NULL, '0000-00-00 00:00:00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL),
(2, 'P359311', 'P359311D', NULL, NULL, NULL, 'U202404261369-0000013', '2024-05-04 23:16:14', '                works', 0, NULL, '0000-00-00 00:00:00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL),
(3, 'P629253', 'P629253D', NULL, NULL, NULL, 'U202404261369-0000013', '2024-05-04 23:28:42', 'fjkhfkj', 0, NULL, '0000-00-00 00:00:00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL),
(4, 'P587655', 'P587655D', 'cert.jpeg', NULL, 0xffd8ffe000104a46494600010100000100010000ffdb00840009060712121215121212161515151717151515151518151515151515171617171515181d2920181a271b151521312125292b2e2e2e171f333a332d37282e2e2b010a0a0a0e0d0e1a1010172d251d1d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2b2d2d2d2d2d2d2d2b2b2d2d2d2b2b2d2f2d2b2b2dffc0001108010a00be03012200021101031101ffc4001b00000105010100000000000000000000000600010204050307ffc40040100001020404030507030205020700000001021100031221041322310541510623326171143352728191b142629224a1155382c1f0d1e116437383a2b2f1ffc400190101000301010000000000000000000000000103040205ffc4003611000101040706040602030100000000000001020311510421314171b1f00532336181c1135291a1122234d1e1f124621523b214ffda000c03010002110311003f00f699ab09492a2c06e4c666038b85a8a540245404b25497502941637f13a8ed6d86f68b5c4b0299c8095121885020a85c75008710332b04139a6615d32c82b0261254c99764ea0f77151d9ba8b52f5b6d9548586da2b972f186be25f9b2aea84e3526a214fb7cb75a6b0f2c02af21bfd6209e252da59ac34cf0fd52557f86c0efced03265a4a96689d4a8272f4a090439724ee2e36bf5bde20248695a2638613344b008cb524d248ea7f53dbcef1cf8cd4b512fff00c0ed122ad2fb797efe96734293c4e56bd63baf1df6d2156eb63cb9da26788ca7426b0f303a3cecff004fac09092e263266ea1dde941001404dc8f31fa5ade71d04a154b344c64835e846a240dadd7abfde08f9a96730bb3ddf997dbcbf7fb7309d5c4e504ad558641215ea03d873fa44fdba5d61150a9492a1d080cf7db988125e1b44c012ba94b250694300401a983f5f0b08ec658cc06899452aa85129ca894dc6966d3d1e23c66a5985d9eeee696fc921ef1c6c08ff00c465515d6290ba1ff75746debcfa5f68ea31b2eb28a8541216472a4bddf6e50299268f0ccaeb70590d466d6c6d53b7d1fca26248ade8994040005329ea0a37f0b35fa3fd208f9a912d501d570696f972877c4231c565529556196aa53ea4b5c72fac741c42554b4d61d00157902ff7da049187d0814aea0a054694b14bec2ceedd491fda3a8949a96685b109a6c8704151be966b8da1e3352ce41680eeb835394d21edeb6f209471294420d61a6787f8955fa6dcf9da195c4e500b358eefc57fda156f8ac7973b40dcb940097a56e9004cb275012ca74e9ea7f53dbce1952ad3004ccd4e25d93a5d094ead3d4726b79c478ed42cce5aeb5129b3dd477b2f3612d5c139e232aa426b0eb04a7cc06dcf2dff003103c5a4d2a556190693d5fc873fa40e648a90685b0aab0c97512c6da6c2dcdff3115c9250b14aea52894964b00792b4bbfa344f8cd4b50219a03baa2d2dd29ac7dbd2de4157b7cbac22a0e52562f660dcf6e6f1cffc525535561aba37bd55d1b6ecfcfa5e07b2c15d544ca6920864b95129bf859add37f28e5965bc332baddd92d466d6de1776f367f2b415fb529cc86680eea8b4b746ce71ed8750abfc425d65158a82428f462fcf6e5f888278a492942eb0cb2025dc173d46e3eb0372e58131e899404a424325c28155fc0cdaba7f68e72a490840a5752540a880188fdae977f52773e5057ad4b3094077e65ba5258fbc300abfc465d4b4d61d0015793bedd768e73389cb084cc770b00a43804bb6efb33877da07909d4b342e92134864ba48737d3e7cbce3919400960a56959012a515d2084a012db33041dfadfa82be682505ddeab74a515d5d67308f83f1113521d82d81206db0248beda858dc469981becf70c14a26a9dc0148a8d8b005c3d98d429e5cfc889516bb569594f88c54a61db0f551dd9972394e6a0d4480c5c824101b911707d203a71974cc65cc3a174b999ab513adcb1d2c6fcdc9bc19a896b33b59f67e4fe502d8833689ef97e09b98c76d6bf0dbe27df933de387e961af672c156bbd9be1d97f367337b84fb947a45c8a7c2bdccbf48b716b36185eefb58ae63bc2884d989482a51090372a2c07a93104e2a59b05a497218286e08046fd481f511d1596222de71113926e1408f23e6df9b43d63a8fbf93fe2007112111871104da3c308e3371294a4a8a830dfd7a473c2e2c2c544148aa815733b6deb6846b81dfc2b08c2a2c8851565e3935996a0525c80fb1b3d8fa18b29502ec76b1f23045890d30a96a1310a108503914308784202228509e1e040d031dab233253bf933ef4ad9db93b3f9413c0d76a9f325b36cbdf66a16fbf93c54ff70dd40e3a60d64a68702521974a94757ea2b36734915750cedcf78d65466f062ba55551e35351f31ab975768d3223b769f2a19e92b17ad577ce3aed65c5798d4977662eceecd766bbfa5e04e619744c6331a89b96f9dd4f8f9785b7e7bde0beed6676b3ecfe702f3f3699ef97eee6e637ccaf0ffa9f7e5bde2b7e91875d6bb1af67b5055aef4be1dbf761bbc2bdccbf962dc53e13ee65fca22e45ccd88637bbed62b995f1b8413534924314a814b3852085021edb8e6231e5f64a424b8330350cea4a8244b5028090a4966623cdc92e6f04308c495839ff008330ce14f36a0a0baabfd426aa6834b52d52d5666b9b3de39a3b192521933260714bb4a25b257279a3a4c51f56e8d04f0a041cf0f28210940d920246db00c3f113525c11b5b78730cf024174cf12de5cd71966b559dcb3029f88339fa7ac58e2587ce08a6b4943acb298ba4d82af7ebf831c78b61e64c98f34044b0404901c91cdcbf53b7ee3d22d6181d494bb252a75fc618b0622d6f58c8896b2b61ebab70f85eb2bf35ab5c5123ed9da9cd46c662e5d2031496053cf52439bf222d7e76fa75e0a54b52e731095598f32ee48f21b3f38cdc4e1913588532acc9f11eaa3766e56b9b79c6e707cdcb026a4248b06b06e56e51631156ab2a7c8cbb73066d5b636f49dd15b94be2251010f179e6928159dc231ee28c5d2c194f52aa53f8e922d7d540b5e9d83c14886300099e17c4c3b62d17160a7553a4817a03b122e77dc8b526c4ce1fc44a54d894a55729a6e97a25a42485209a6a1354fb871bde09225100a1c265cf4a48c42d2b5d6a20a030a09d2198336dcfd4c63f6b1ab94efcd99f7a574edcaa67f2827819ed5935cb66fd5bb335131ff00b3c54ff714dbb3d3fde9835929a1c08a19748583597ab31b734b57cd99f9bef1b04c65f06ad97550d529a90c5ea353dcf3db9c6a18eddeea19e92b17ad571eb1d61759744e2b0292eecd767766e4d77f48119d974ad9331b2e765b89d6dfde3d869b5f9ef78302ed6ddacfb3f9c0b4e4cda67be53e5cecca5275312f4ea2d7fb0def15be48c2ad6bef71af67b5055f9a15a5f09f2d5979b9c27dccbf9445c8a9c27dccbf9445c8b58dd431bee2358ae6343c28918e8ac4d0a143c4022622d689b430812a64e2572a6b154b9da7f61e61f63103ba8cb0b1a0821615bbb03e66f1b50e238f80bd1fa224112ac7f062654aa5214898490ef4732482486b75fac68617109569014187ea490e36b13bc5a685128cc0e1b7a8d241517d7f045a1a250d1d950cf0e0c3911102009c3c33c3c401a057b6245729c13becfbb29be8ed05502fdaf7cc94dfbbed4a9ffb3c52ff00714ddb397f909835ff002a68767c25974a149357ea0b0087348055cc0dc6fd6368c64f054ad955534d6a6001041a8d5ba8d89b81ca35cc58ed20c219e94b17ad2c63d557dd7496158914df66bb3bedc9af0253254ba66777300cb9d96e999a6c7c6e2cc2d7db9def05e125adbb5b9c0c621135a7ea43e54eacd2594cef40af4dc8eadcdcc56faeab5afbdc6ad9ed4157e685697c27c975558aa6e7073dc4bf9445d8a3c1bdc4bf9445e8b58dd4c0c8fb88d62b98f0e622f0a3a2a250f1185003c461e18400a1c08509e0040c34210a00610e2108422094143b43c46041284614280140976d5ab92e0917dbab163f42c7e905b029db07cc92c58eabf9317f4b387f38a5fee29bb677d4260b929a3d9d4a005d32d48bddd2406bd2013cc0b111b6632781a174aaa208a8b26929292fa9c151b13703946b18b1dee219a92b17ad2c63eab773d4aa39fe9becd7101d35129a6348581973b2dd0a3410921d41b4b6de4e01de0c52ed6e902d3d337be75a09cb9f59a0b28048708d76dd3d598eef15be48c35ad2dc6bd9ed232d2d70b2f549cb59a6f7081dccaf913f88b914b831ee657c89fc45c262d637530323fe2b58ae62262870ee312678265294520050519731085255b2a5ad6902624fc49246dd62ce2e409885cb2480b4a9048dc0524871f781bc6705c5cd93265ccc8ee1682c851089e132d72cd695ca50977525612cb62817d88e8a8279d3d2815294122c1c960e48037f3207d62b6278aca4109515395292009731474a429474a4e9008d5b3901de07711d91064ac195257328c3a65e69ad848a1465aa6143804a08a826f62459a1633b33316a5ae99414518a12af796a9d2a4225049a748065adc8d9c30bd840600b87ebeb10ac3d2f7676e6db3b748159fc2278cf693256a5a92d356b254a935ca795414b0294a6604824a5c249f129a923b3789082c139a70ea9226098ca4113a62c242800c0cb5840501a5b6da00398af3b16842908528054c7084ddd4c2ec3a0717f31d630cf0c9e306b972cad2a3312ba0ad295650988332521682c8a90998031b15ee3971e13c0e60c4ca9eb4a9294231410954d2b54a13578732e5a99442bc138b3901c07b0812134b980bb10589058bb102e0f4371f78ea0407f10e0b89519c506625c63568cb9c65bce5647b31552a0fe099bd873de258ac3e2ce768c456662752272532d586cd964a24233344ccba8554a4b856aba4c005c21c404e2256291266cd52e7a13270f8b992c2a68242aa51939a41256a4a059c9dc3b90f129671562462c492b150d0ac43e45da9248959bd398f82040690d01f87f6e4ca5ae719ca98061a5d08a4243cb9267cd4d0851510b331e907634b6f15a5cbc5973344e5297869490854b0b96568c4cc0b2b14521742a5aaecee4816b007508c05ab1d8e2a98126755de858561c65ca3ed084c8321540cd79456a375ece69da08b82e6d3313354a5944d5a52b5a52952d018a49a42527721c01b4412868c0a76cc0ae4b8717fa6f7bf4dfe9057029db27cc92c58f5fbfff008fe714d2386a6fd9df50982e4a6976792815d328a0bdc9404daec8b7c3d3ce36898c9e0495d2ba956a9a9a69293cc9049607768d8222c75530866a52c5f355e72e705f684aa81c795ef680dc42250131b0eb612e7500cb6cb21162ab599d43cab1bbc19276fa40be2a5cd69cf3124e5cfa8e590140252e102bb6e9ead49dde2a7e9144a8d5b39a834a918597af39257d725554dce0a7b895f208b86297051dc4af911f88bd1731ba9819291c56b15cc7108c343c74542889113878039b44d2987860620981286878502068509e1e0062214285003c3428500230a1184600893025db46ae4ba6a1d037dfe9bfd20b48814ed8be64865525f7bf9c5348e1a9bf66aff21305c96559a3d9ca3594ca282ec545284b8e49d27f4f4f3f38df8c3ecf85b2ea5d41d8269a4a4f326fcfa7979c6d3c58e93e4433d2d62f9ae93973fd4aa81c929b75b407e25329a681875365cea41427bb2101944726757a56377b1972812c489ddfbcd496953eb3410160212e13a986e9f4a4eef153f4a90d5b35a834a918597af39637e162a843c1fdc4af911f88b6628f053dc4af911f88ba62e77ba98218e91c56b15cc50ef11851d151d21440189401818de1588510a973e8227aa70bb8a0a0204b20836dc901bc8c521c378ae5df189cc6487094524d46b55e55accc36b9079105b0e040025c3f05c4a54c4054e0a94a9f30abc2b289454a9a08514021c84cba753098a35592dd0e1f8a5569f2c275fe942b752a96348a404d0c0d45c2aa25c10510d0200dc460b8920aa6669999466cc422a1df52ac51952d4942406285e1d360ee0ef488b78fc3f122a4aa5cd4b8928252c912ccf4cb9f5822ca2952952033b0097b1172710e2001ac32f892a6aeb0944b6c4040142aed27216b2efbe7d80d99c738a922771748072d132a5209ae84aa58cb017e09841758d86ce7782f85003c3c30842049286850f1008c08f6d9ab92e9a83edf5f3fbfd20be04bb66f992195497dfa5fca29a470d7a667a1b37ea59eb929a1d9d0806653269bb1994a12e392349e5d36bf9c6f18c5ecf856b799507b22900a6c2fe4fd36b7578d931dba4f950cd4b58be55c272e688bda554063b404e2132bbd030ea032e730cb9632c84065100da9757a668ddec6dca0431426f7ef3816973ea345a6012d2e905d81b8db6a0f531c3fb13f06ad98d41b5ae53ed57ae0952a9bdc18f732be447e22f453e0c3b895f223f1175a2c77ba98218dff0015ac5731a1da1da147454202250c21448250d15f1a1665ac4a204c295659539485b1a4a87476816c561f8a904495d00a1090662e5aa60589a85a96aa514b141988b3ec92cf720184281ec3c9c71946b98a4ccf68041024b7b3e6dc6ca1eecf405c7de84a5f150504a54a6bad27d9c024193989705c208f68cb6d4f4d7681018c340df0d5712b670964842ea0e0255304c3410a482424cb502453bcbdc0315a4e3f8a00e70e14c2e14a405a8d2a2c909b015048b9b0bbaa04858f0a040710e2a00070e924a0a6aa45a6a414d6539ac65a94a4ac006c10a04dc104bc3a6ad7290a988285a9092b41fd0b23526d62c5c4016a14210a040ef0ef1187812393021db62332469ab50d3d75c17c0876d3de486553a86ae9af78cf49e1af4ccf4365fd4b3d725d5559a3d9b09d6d298d9e6012c050649a7413b3bb6d7ea4c1018c1ece12cbef6a0e3432453a46ab01bedd2dd5e374c58e7710cd4c8f8cbd272e75f690cd6ff6808c40967380c2b689cc9a258ca21096516559ae6db6686de0dc6d01d8c133bf19eed2e754686ada5a5d2390dc0b6d416e715d212289f8ee6bd98d2a36d572f376abd704a95420e0dee257fe9a3f117e33f829ee257c88fc08bcf16bbdd4c10c548e2b78ae667633173d33425122b4143d7504d2b09985883b82532c7fee73bb53c0f14c59525333074a4a940a92ad93a8a54c47400107abdbc313e2b839ab9a0cbc5092c25909f11250a9854e8700a48587f9074882f013ca027daea53ad454e52e95492848eed49b059afe9cb78eca46c171bc429484cdc1ad15aa9a81d297cc539a802c112c17eaa0183c24f1e9c120ab0539d9ec0972e90458162e4d8f21b9bb7391c371491372f175555096a987328d480c4331202260db7537224f4ff0fc754a271496cb58432129698a20852b410406207407626f0031ed22c150f62c4129290694bdd480b6e8e02838e57f2775768d49529270788202a874a01722aa887674e917e6541844f0783c72572ebc42152d205629198b3771553b5fd4d236b931c06178824a44c9f29696d6e9d655436921290054cadb998027ff00888809ab0b3dd48cc64a1c04d6a4b125b5325db7b86786e1bda3135611ecd3d2492c5480036b624936b4b3b3ee06f15fd9b8a3b09b21825812e54491e2568e45987abbed1df068e209202d52969214e4d8821269b801dd54bdb627a5c06e1fda844c2949913d0a5a4ad20a028304155d40b05588a7771d2f111dac9203a9131c04bd002c0ac0235037dc03e6fbb1674a788d254552aa3301a69d22484a011b8351359f15ad1d27cfe22024a25c83a05492a2e26500a9955074d4e006e5bdec24e63b6184729a94e2a76413649009b72bff0062370443e1fb5d855a54a4a94e942e614d041225d1504bb05179891ea620bc47114f86449201b242c2414b1dd4556bb5c0e5b5edd65e2b1a412ac3a01a52434c4f8ab4052497f86b2f7d80f51058e1dc7e44f204a5124a6b1660430b026c4df6f58a28ed8e1c90902654a426624529152152f30104a989d92cfb9fac29d88c63850c1cb59d06954c424a0aa5813350a9d89527cc08ad3b178c0998070d96a3aa8d68a4d9294d4962fe25037164b40051859e998844c4dd2b4a5693d428023fb18ed18b86e2388cfc95619a5d4a099a1429084a5c1296eb6b1e63cdb68409140876d7c7234d771a7aebf382f812ed97bd91aa8b8d5d35ef19e93c35e999bf667d4b3d725d5559a3d9c03534a6f0f7804b015a13a74a89fddd357578df81fecdecaef6adbbbd1a742355920fede9a7abc10476e77135acca299c65e93924ebed2398da023169967380c233226b269940cb225a5965956672ab6d996bbc1ba45a03b1c14f35f12fa273f875f748d1b35ec2c7ff002fabc71484a93f1dcd5b2da546dae9e6ed57ad72aa26f7033dc4af911f81178c51e023b897f28fc08be445aef7530315238ade2b9a9938eecfc89d3b3a60529540401514801249714b17d4a06ec41da3823b2183648c9b20a941d6b2e5400254e75593cfcfac6eb428eca4c497d92c22549526590a4aab490a55940a94087f35a8c6e8850f02450f0d0f003c210a108802850a14095230a250a040d0a1e1448142850a200a04bb65ef6468aee34f5d5b5e0b604fb65ef246ba2fe2e9abce29a470d7a67cea3d0d9bf52cf5c965dab343b37fabbaa7c3de0a356846964a89fddd357578de303dd9850d5de85787ba050c9d08d56483fb7a69eaf1be63a71b89ad6667a6c7c658f29c9275f69086d0178e01e77f4ada66b25a4bcbeed3aecbe5736ff32d778351b405f10379dfd53e99b7796ebeed3a3c2d7dadf07578e291627e3b9a7662afc6b0e5e6edfb95e107011dc4bf947e04689119fc0bdc4bf953f811a24c5ac6ea6064a4715bc573224466718913d61190b4a08502ba9c029f54827adad722f663a44ffc06254c74520ea6471106f3a414b16d0a7704b151f3484bf993e50f893c44d542b0e054aa09a89a0934936d2a0187ea0f042500f48e665b5ffb9b91ff005890634a1c472d752b0d5db2b4aca7c772bd41f436cd73e57642b881dc4914cc4ec0b4d9794a2bdd44a4d652074a49b8b1dc488908030254ce224a2b448482b975d24921008cc67535c381d3cddc75c64ec6d4f2a5a6832de95d2162616b1214438f46f5e5b50a041c702b59424cd484ac8d4905c03e479c54c6cfc42661cb941681294add2926683a52e55b11e5cb78d31118120fe1389e37c333077a16aa84c432952d0864d89092a5ac80e764289891e258c4a6a385a8924e5a141d29a65b02b258a8ad4be5b27cafad366104213751bdf648f895fec39fd091ca62690559cab100d90a0e4864d212ff00a879dc5e00cbff0018c5e5123087352b4a0a6e52b79426294923c29d494b97d408db5476c1712c429684ae45214a214aa16004e55414e6c0d76a4f5ddc5f5644eab7b11f47f300dc7a1b8fef1de006894230a200a04fb63ef24b26bbf86d7d5059027db16cc93ae8db55adabce29a470d7a67e86fd9bf52cf5c9655fa565eecd3b2bba0069ef0117d28d3b93fbba6aeaf0406077b3652ea026724f740a080284ead2907f674d039c11474e7710a298907cb1e53973fd111b406710179bfd33699b6696e8ee93aeca6b6f6f8fabc1927680ce22a0f3bfa9b34d153ca759ca1a2c86bdd36f83e278e691627e3b9a76647e35872f34f955eb5caf08b817b897f2a7f022f2fd7ef143807b897f28fc08d0316b1ba9818e91c56f15cc6486ff00b5a24a0fff000c3428e8a854ddff00e7d6242226108041e14287110068710c61c44810850e22b7113dd2fcd247f2d3fef00470574e61dd7ab9d93fa079325bea4f58c891349462144332f3c8bed2e6a837a918711b988f091d593fc884ff00bc6270839935645d052951e8a519f885523a80557f30dd600d749d217e757fa5476fa063fe98b2233e48696b97f0132d3e8a032fff008a903d418d0801e1434344025027daf7cd92c9acfc3d6fb41540976d182e53af2c735d835fcede5f58a691c35e86ed9a91a4260b92cbb56697674aaee860c9d75392694e9625f6657fabac6e93039d9a28734ce75529eeea4100009054c90f6228ff004b6f782331db95f910a698907ca9094e5cfb5424c0771225e77f4e0699b674e9195e3b29bf7587ea6de0c12202f89a90f37fa97b4cd55ca751ca6cbf03b13a6d6d2de28adfad49f8ee68d9a916d6acfb7ee554422e047b897f28fc08d0319fc0bdc4bf947ff58d0262d77ba9819691c56f15cc508b433c22f1d948811d47dc449e2241f384d004a1c4343bc4019a143bc21026d1818afc4013296c1cd248039901c0fb811cb89f13952584c5945414ca624258a439b102eb4efd633a771c9085d0ac5a924a4293520070aa99b46fa156df6eb12440b7c4b1418527480662d4937a4216a0127a9a77e43cc88ad7919684b05092897b381402a25be54adbce31a66365164a312172d4b432534a5550be59a80052402961cacc0872d8ec6ad67304e9626226240043cb4e5857be58d290337f4bdd68df68037138f41c4ce04b264a64e6a8b5398a2b2940eaa65a4ff1dde35d535214124dc8240f24b39f4b8fb880cc1a1094959e2187330ccce5024196562cca3505280a491d0ddac1b484c07326a71b25e84a56a08aa8055a29199a6e58020bf99bc0808de1e05f0a154cb4a71f2522809642439b87524cc59d655b9503bb58926092421412ca55447ea6627d40b3fa30f21024e902bdb027324d290a3c926c0de0b2043b66c172895d039a9c0a6fd4c5148e1a9bf66a7f21305c9655fa572347b38a56a065b2591aea24bd08d2c43eccaf278203037d9aa2a2d3895523bba9043009054c91c8ba7c99a08cc74e562c21453520f97a4e5cff004441b40771354caa6ff4cd699fa85865115f4db57d5bc5783049b4077132879bfd4921d7ab3253d596a197e1767d3fdb7bc72fd60ca7e3b9a366b316d6a979a7fd7f72bcdee024e44bf41f88d168a1c07dc23d07e22fc5ac6ea6065a4715ac5731e118508c74523c28687801343b445a1c441368a1431842044071109b252a14a92140ee141c1f5062421e2411ca1d07dbfe79c4158641b1424dc9ba41b9773eb78eb0a00ac787ca7ab2a5bd83d01eced76fdcafb986ff000e937ee65dc524501887058dae1c08b5084014cf09c392f9129dc17cb4bba5883b7261f68bd11894401409f6c0a84c934a428f2492c0dfd0c1540976d08ae554aa473502c45e297fc35e999bb66a7f2194e4b96acacd1eceaa65c29002593aab25448968012c522d4df7b12479c6f181decdd152809a4ae94e8a810c0241530e60ba7c806822518e9cafc88534d483e5aa5397319302bc54aea987243b2ed5da9cb50af6676bff006def0458a9e5082a0852c80f4a59cfa390204667112a595105d48a49714d26e52d57858ecfb5f7b470fda482217ecf76d2aab48890c7ac2a54d586ff0004c42132500ad20b0dc80768d0f6b97fe623f98813992d2260196b48a4bcb54d98164f76ca74bed51d9dd8bb334575a5396b2c2d3080acd9ac139ad4f43a6cee0b17678e7c65448555632c0d0b4161e35f1457e65feb7aac9abaf8740d0e2a5ff988fe621bdaa5ff009a8fe6204a9466b65a9b2eaa3327bbbbd4ecff00d99aef15d284e5a0d25ccc00aeb9cc466014f4162ce092c1d9e1e3aa4bdc84d9cc2c2b6aeb92f8ff0065b215fb4437f6a97f1a7f988618a97f1a7f988114a12662c6516a53a7367ba0952c152b9b586e0016bc719694d120e59725351ae7f78f2c920016776f0955c43c75e5eff609b3995bdabae66f48f9adbb1be115434f6b97f1a3f9085ed52ffcc47f2101eb96979e283a469d73fbbd037eb73fa9af6daf092804c8eecea06a15cfd7a4edd367d2fd3ce27c75927bce12d59691fe3989b5e8cca33e98f2ac2f38c97f1a7ee217b5cbf8d3f7101ab09cb9c682082a65573bbbd00b106c6ff111bc5929026a40945a859a6b9e6b20a1942ced73b0237bed108ff0f70d6ce652f6afb99b9233d60148c5cbf8d1f710fed92fe34fde0414d428b1f78d5d73982739a8676f0db776e4f68ee948cd6cb53658345788705cea76aba726f378947cbcbd485a03291adaaa37337439df1abde013fb5cbf8d3f785ed92fe31f780f967ba94692e560155739942a6a6c587d0936da3b0033260cb5300964d73dd0e540a8f3e4370074878f197b92bb3d948d6d551b92e584f57d6158c64bf8c7de17b64bf8c7de0410014c83412e0126a9dde3cb5161c81700e9aafe51352434fd0a0c0b1aa7f75dda4dfadc93aa9fb43c75927bca3afb0ff1ccc6115f69c27ab2da82c38c97f18fbc2f6c97f18fbc0a51ae48a0ea0a715cfd7b311cfcece2f7b3471983bb9a4254e14405573bbb0ced72dfc8837f4878ea97204d9ecac2b5af924e13d635061edb2fe31f781bed44daa64a32d9479025812fccb44152c668194a6a1469ab11a8828d42d5733b022dbbb47096741ee94a65ac5752d93ae6009a54b02a0c18fdd8c72dbc5693e12d714665d348f1157ac12d8a79b95d6dd1acdce04265c1480861a8a9555494a534b140b30bdec5c46d2a04f8263a605d225a994b5549246e56b2a50a9762363673cee44161545ae5a8b079f4e76ac3d5b2bed5575ac06498a0787273735cecd4b9a5eaadff00edb3df78ba8e508c5b045b4cacb6d331f856d2065a4a829854c4057301441201e8691f688fb34ba4a684d24d443062a2aa8923ad5789c3c750423e259d9acc7ca4d55b0a9a9ab9b3bb3f478e630c8a42684b03500c18282aa703ad578eb0d082046952fd6ac18494d45548a880096b901d813cc5cfde229c2a00400848086a03064b02914f4b123eb1d04254151088aeb522064a35691afc561aacdabadad0b291a748d3e1b786cd6e96b4287808aeb5a4aac20ac3a08524a52cb72b0c194e00350e76022596970a61500402d700b1201e961f68787888131219086a690c4d5b06aaaa9dbad57f589d097a9854cced767767e8e6250a10222a721210c134864970183020b820722f12cb4b92c1cb025ae407607aee7ef138789808a9c4494009012191e00c34b029d3d2c48fac23253ab48d7e2b0d56a7575b0023ac284104567ad7bd7690ca0e0b074d816d9ec5ba431909208a432aea0c1944eee39c7489415010cb0f530700805aec5890fd2c3ed103253494d218bb86b1a892afb9263b0863100a382c1265d4c49a89512a2e58a8aa9f40ff00f58b6a89472991088889043a69a56955a696b53fffd9, 'U202404261369-0000013', '2024-05-05 00:03:05', 'hjfttgjghjfghfh', 0, NULL, '0000-00-00 00:00:00', 0, NULL, 'tet', 't', 't', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eventlog`
--

CREATE TABLE `eventlog` (
  `EVL_ID` int(11) NOT NULL,
  `EVL_EVTCODE` varchar(30) NOT NULL,
  `EVL_MOD_MEMID` int(11) NOT NULL,
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
-- Table structure for table `Facility`
--

CREATE TABLE `Facility` (
  `FACILITY_ID` int(11) NOT NULL,
  `FACILITY_NAME` varchar(255) DEFAULT NULL,
  `USR_CODE` varchar(100) DEFAULT NULL,
  `ROOM_NUM` int(11) DEFAULT NULL,
  `INI_DATE` date DEFAULT NULL,
  `ROOM_DETAILS` text DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FAC_STATUS` enum('0','1','2') DEFAULT '1',
  `FAC_AVAIL` enum('1','2','3') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Facility`
--

INSERT INTO `Facility` (`FACILITY_ID`, `FACILITY_NAME`, `USR_CODE`, `ROOM_NUM`, `INI_DATE`, `ROOM_DETAILS`, `EMAIL`, `FAC_STATUS`, `FAC_AVAIL`) VALUES
(1, 'Special Accomodation', 'U-0000001', 8, '2024-06-06', 'jhgfdd', NULL, '1', '1'),
(2, 'Special Accomodation', 'U-0000001', 8, '2024-06-05', 'kjhk', NULL, '1', '2'),
(3, 'Normal Accomodation', 'U-0000001', 9, '2024-06-01', '45', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Facilityold`
--

CREATE TABLE `Facilityold` (
  `FACILITY_ID` int(11) NOT NULL,
  `FACILITY_NAMEs` varchar(255) DEFAULT NULL,
  `USR_CODE` varchar(85) NOT NULL,
  `ROOM_NUM` varchar(255) DEFAULT NULL,
  `INI_DATE` varchar(255) DEFAULT NULL,
  `ROOM_DETAILS` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FACILITY_NAME` varchar(96) DEFAULT NULL,
  `FAC_STATUS` enum('1','2','0') DEFAULT '1' COMMENT '1=>Booked,2=>Available,0=>Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Facilityold`
--

INSERT INTO `Facilityold` (`FACILITY_ID`, `FACILITY_NAMEs`, `USR_CODE`, `ROOM_NUM`, `INI_DATE`, `ROOM_DETAILS`, `EMAIL`, `FACILITY_NAME`, `FAC_STATUS`) VALUES
(1, 'T173314', '', 'Yao ', 'bharani', 'kjdsbfhk', 'yao@way.com', '3656', '1'),
(2, 'T939823', '', 'hgks', 'ksdhfjk', 'sfkjh', 'hjdfh@hjd.com', '0266212420', '1'),
(3, 'T517332', '', 'Prince', 'otu', 'Aduamoah', 'princeaduamoah25@gmail.com', '0247161312', '1'),
(4, NULL, '', 'there', 'pist', NULL, 'dfghl@hfd.com', '00152655', '1'),
(5, 'T668483', '', 'this', 'my', NULL, 'kjfhlk', '111111', '1'),
(6, 'T23633', 'U202404285896-0000018', 'sdf', 'df', 'sdf', 'fsdf@www.c', '3154', '1'),
(7, '4', 'U-0000001', NULL, NULL, NULL, NULL, NULL, '1'),
(9, 'Special Accomodation', 'U-0000001', NULL, NULL, NULL, NULL, 'Special Accomodation', '1'),
(10, 'Normal Accomodation', 'U-0000001', '12', NULL, NULL, NULL, 'Normal Accomodation', '1');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `FEE_ID` int(11) NOT NULL,
  `FEE_CODE` varchar(50) NOT NULL,
  `FEE_NAME` varchar(40) NOT NULL,
  `FEE_AMOUNT` varchar(100) NOT NULL,
  `FEE_MEMID` varchar(100) NOT NULL,
  `FEE_CATEGORY` varchar(60) NOT NULL,
  `FEE_DESCRIPTION` varchar(30) NOT NULL,
  `FEE_STATUS` enum('0','1') DEFAULT NULL COMMENT '"0"=> Revoked, "1"=> Granted',
  `FEE_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Financial`
--

CREATE TABLE `Financial` (
  `transaction_id` int(11) NOT NULL,
  `patient_id` varchar(22) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `invoiceNumber` varchar(152) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('1','2','0') DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontDeskUsers`
--

CREATE TABLE `frontDeskUsers` (
  `ID` int(11) NOT NULL,
  `USER_COCODE` varchar(255) DEFAULT NULL,
  `USR_CODE` varchar(95) NOT NULL,
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
-- Dumping data for table `frontDeskUsers`
--

INSERT INTO `frontDeskUsers` (`ID`, `USER_COCODE`, `USR_CODE`, `FIRST_NAME`, `OTHER_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `ADDRESS`, `DATE_OF_BIRTH`, `GENDER`, `EMERGENCY_CONTACT_NAME`, `EMERGENCY_CONTACT_NUMBER`, `SPECIALIZATION`, `QUALIFICATIONS`, `CERTIFICATIONS`, `WORK_DAYS`, `WORK_HOURS_START`, `WORK_HOURS_END`, `LINKEDIN_PROFILE`, `NOTES`, `MARITAL_STATUS`, `T_STATUS`, `CREATED_AT`, `UPDATED_AT`, `NATIONALITY`, `LICENSED_BY`, `LICENSE_NO`) VALUES
(1, 'FD863807', '', 'dsk', 'frnt', NULL, 'frnt@mail.com', '0266212420', NULL, NULL, NULL, NULL, '0266212420', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2024-04-26 21:39:37', '2024-04-26 21:39:37', NULL, NULL, NULL),
(2, 'FD248478', 'U202404285614-0000017', 'ffsfd', 'dsf', NULL, 'klgjgfj@gmail.com', '123253121', NULL, NULL, NULL, NULL, '21252121213', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2024-04-28 23:56:20', '2024-04-28 23:56:20', NULL, NULL, NULL);

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
(1, '001', '003', 'Room Category', 'RoomCategory', 'fa fa-cog', '1', '2024-05-25 09:45:19'),
(2, '001', '002', 'Home', 'home', 'fa fa-info', '1', '2024-08-05 20:51:45'),
(3, '001', '001', 'New Room', 'rooms', 'fa fa-user', '1', '2024-05-25 08:56:34'),
(4, '001', '004', 'Facility', 'therapist', 'fa fa-smile-o', '0', '2024-07-15 00:22:40'),
(5, '001', '005', 'Bookings', 'assessment', 'fa fa-medkit', '1', '2024-06-09 23:28:27'),
(6, '001', '006', 'Reg Users', 'treatment', 'fa fa-file', '1', '2024-05-09 00:46:13'),
(7, '001', '007', 'Enquiry', 'discharge', 'fa fa-cog', '1', '2024-05-09 00:48:00'),
(8, '001', '008', 'MainSite', 'theweb', 'fa fa-cog', '1', '2024-07-15 00:10:05'),
(9, '001', '009', 'Reports', 'reports', 'fa fa-medkit', '1', '2024-07-05 23:32:51'),
(10, '001', '010', 'Monitoring', 'monitoring', 'fa fa-medkit', '1', '2024-05-09 00:56:29'),
(11, '001', '011', 'Utilites', 'settings', 'fa fa-spinner', '1', '2024-08-05 21:17:08'),
(12, '001', '012', 'Channel', 'settings', 'fa fa-chat', '1', '2024-08-05 21:17:14'),
(13, '001', '013', 'Reports', 'reports', 'fa fa-cog', '1', '2024-07-05 23:26:55'),
(14, '001', '014', 'Logs', 'logs', 'fa fa-pencil', '0', '2024-05-09 00:48:05'),
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
(2, '001', '005', '0005', '', 'All Bookings', 'allbooking', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:02', NULL, NULL),
(3, '001', '008', '0008', '', 'Manage Facility', 'managefacilities', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:23:45', NULL, NULL),
(4, '001', '005', '0005', '', 'Approved booking', 'approved', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2021-08-03 11:48:25', NULL, NULL),
(5, '001', '003', '0003', '', 'Manage Category', 'managecate', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:25:42', NULL, NULL),
(6, '001', '006', '0006', '', 'Treatment', 'treatment', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:21:17', NULL, NULL),
(7, '001', '006', '0006', '', 'TreatmentPlan', 'treatmentPlan', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:20:36', NULL, NULL),
(8, '001', '012', '0012', '', 'home', 'setup', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:45', NULL, NULL),
(9, '001', '005', '0005', '', 'Cancelled Booking', 'cancelled', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:14', NULL, NULL),
(10, '001', '001', '0001', '', 'Manage Room', 'managerooms', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 01:39:23', NULL, NULL),
(11, '001', '008', '0008', '', 'Facility', 'facility', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:26', NULL, NULL),
(12, '001', '008', '0008', '', 'About', 'PageCont', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:21:32', NULL, NULL),
(13, '001', '001', '0001', '', 'Rooms', 'room', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:26', NULL, NULL),
(14, '001', '007', '0007', '', 'Enquiry', 'user logs', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:52', NULL, NULL),
(15, '001', '009', '0009', '', 'Reports', 'reports', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:25:04', NULL, NULL),
(16, '001', '007', '0007', '', 'Enquiry New', 'channel', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:19:23', NULL, NULL),
(17, '001', '003', '0003', '', 'Category', 'category', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:25:42', NULL, NULL),
(18, '001', '015', '0015', 'fa fa-user', 'Manage Therapist', 'setup', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2021-08-03 11:48:34', NULL, NULL),
(19, '001', '011', '0011', '', 'Monitoring', 'setup', '', '1', '0', '1', '0', '1', NULL, NULL, NULL, '1', '2024-03-23 02:24:02', NULL, NULL),
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
(2540, 'U202404113834-0000003', '0001', '1', 'U-0000001', '2024-04-11 17:38:30'),
(2541, 'U202404113834-0000003', '0016', '1', 'U-0000001', '2024-04-11 17:38:30'),
(2548, 'U202404122044-0000006', '0004', '1', 'U-0000001', '2024-04-12 13:20:57'),
(2549, 'U202404122044-0000006', '0005', '1', 'U-0000001', '2024-04-12 13:20:57'),
(2550, 'U202404122044-0000006', '0006', '1', 'U-0000001', '2024-04-12 13:20:57'),
(2551, 'U202404124613-0000007', '0003', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2552, 'U202404124613-0000007', '0001', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2553, 'U202404124613-0000007', '0016', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2554, 'U202404124613-0000007', '0004', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2555, 'U202404124613-0000007', '0005', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2556, 'U202404124613-0000007', '0006', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2557, 'U202404124613-0000007', '0007', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2558, 'U202404124613-0000007', '0008', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2559, 'U202404124613-0000007', '0009', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2560, 'U202404124613-0000007', '0010', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2561, 'U202404124613-0000007', '0011', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2562, 'U202404124613-0000007', '0012', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2563, 'U202404124613-0000007', '0013', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2564, 'U202404124613-0000007', '0014', '1', 'U-0000001', '2024-04-12 13:46:46'),
(2565, 'U202404124613-0000007', '0015', '1', 'U-0000001', '2024-04-12 13:46:46'),
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
(2636, 'U202404261112-0000012', '0003', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2637, 'U202404261112-0000012', '0001', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2638, 'U202404261112-0000012', '0004', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2639, 'U202404261112-0000012', '0005', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2640, 'U202404261112-0000012', '0006', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2641, 'U202404261112-0000012', '0008', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2642, 'U202404261112-0000012', '0009', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2643, 'U202404261112-0000012', '0010', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2644, 'U202404261112-0000012', '0012', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2645, 'U202404261112-0000012', '0013', '1', 'U-0000001', '2024-04-26 21:37:04'),
(2646, 'U202404261112-0000012', '0015', '1', 'U-0000001', '2024-04-26 21:37:04'),
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
(2788, 'U-0000001', '0015', '1', 'U-0000001', '2024-05-09 02:03:13');

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

--
-- Dumping data for table `menusubusersold`
--

INSERT INTO `menusubusersold` (`MENUCT_ID`, `MENUCT_USRUSERID`, `MENUCT_MENUDETCODE`, `MENUCT_STATUS`, `MENUCT_ADDEDBY`, `MENUCT_INPUTEDDATE`) VALUES
(1, 'U-0000001', '0001', '1', '2', '2024-04-02 07:13:45'),
(2, 'U-0000001', '0002', '1', '2', '2024-04-02 07:13:52'),
(3, 'U-0000001', '0003', '1', '2', '2024-04-02 07:13:56'),
(4, 'U-0000001', '0004', '1', '2', '2024-04-02 07:14:00'),
(5, 'U-0000001', '0005', '1', '2', '2024-04-02 07:14:04'),
(6, 'U-0000001', '0006', '1', '2', '2024-04-02 07:14:09'),
(7, 'U-0000001', '0007', '1', '2', '2024-04-02 07:14:13'),
(8, 'U-0000001', '0008', '1', '2', '2024-04-02 07:14:16'),
(9, 'U-0000001', '0009', '1', '2', '2024-04-02 07:14:19'),
(10, 'U-0000001', '0010', '1', '2', '2024-04-02 07:14:23'),
(11, 'U-0000001', '0014', '1', '2', '2024-04-02 07:14:26'),
(12, 'U-0000001', '0015', '1', '2', '2024-04-02 07:14:29'),
(13, 'U-0000001', '0011', '1', '2', '2024-04-02 07:14:32'),
(14, 'U-0000001', '0012', '1', '2', '2024-04-02 07:14:38'),
(15, 'U-0000001', '0013', '1', '2', '2024-04-02 07:14:42'),
(16, 'U-0000001', '0016', '1', '2', '2024-04-04 23:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msgId` int(11) NOT NULL,
  `inComingId` int(11) NOT NULL,
  `outGoingId` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monitoring`
--

CREATE TABLE `monitoring` (
  `monitoringID` int(11) NOT NULL,
  `moni_status` enum('1','2','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NormalRooms`
--

CREATE TABLE `NormalRooms` (
  `RoomID` int(11) NOT NULL,
  `RoomNumber` varchar(15) DEFAULT NULL,
  `RoomDetails` varchar(255) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `NormalRooms`
--

INSERT INTO `NormalRooms` (`RoomID`, `RoomNumber`, `RoomDetails`, `Status`) VALUES
(1, 'AppleGrand013', 'Normal Room 13', 1),
(2, 'AppleGrand001', 'Normal Room 1', 1),
(3, 'AppleGrand002', 'Normal Room 2', 1),
(4, 'AppleGrand004', 'Normal Room 4', 1),
(5, 'AppleGrand005', 'Normal Room 5', 1),
(6, 'AppleGrand016', 'Normal Room 16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PageCont`
--

CREATE TABLE `PageCont` (
  `ID` int(11) NOT NULL,
  `AboutUs` varchar(255) NOT NULL,
  `OurMission` text DEFAULT NULL,
  `OurVision` text DEFAULT NULL,
  `PageContStatus` enum('1','2') NOT NULL DEFAULT '1',
  `YearsExperience` text DEFAULT NULL,
  `Events` text DEFAULT NULL,
  `HappyChildren` text DEFAULT NULL,
  `FundRaised` text DEFAULT NULL,
  `Testimonial` text DEFAULT NULL,
  `imag_url` longblob DEFAULT NULL,
  `ContentBody` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PageCont`
--

INSERT INTO `PageCont` (`ID`, `AboutUs`, `OurMission`, `OurVision`, `PageContStatus`, `YearsExperience`, `Events`, `HappyChildren`, `FundRaised`, `Testimonial`, `imag_url`, `ContentBody`) VALUES
(1, 'About Us\nOur History\nMission & Vision', 'Welcome to Apple Grand, where luxury and comfort blend seamlessly. Established in 2012, our hotel has grown into a symbol of excellence, prioritizing guest satisfaction and quality service. Our mission is to provide unparalleled hospitality and memorable experiences, with a vision to be a leading hotel known for quality, innovation, and sustainability.', '<p>vision</p>', '1', '0', '0', '0', '0', 'good', NULL, NULL),
(2, 'fjhj', '<p>dfjhsjk</p>', '<p>sdf</p>', '1', '54', '545', '45', '45', 'great', NULL, NULL),
(3, 'about', '21', '1', '1', '21', '21', '21', '21', 'j;sdk', NULL, 'buud'),
(4, 'imag_url', '12', '12', '1', '21', '12', '21', '12', 'imag_url', NULL, 'imag_url');
INSERT INTO `PageCont` (`ID`, `AboutUs`, `OurMission`, `OurVision`, `PageContStatus`, `YearsExperience`, `Events`, `HappyChildren`, `FundRaised`, `Testimonial`, `imag_url`, `ContentBody`) VALUES
(5, 'gymgymgym', '12', '2', '1', '12', '121', '12', '12', '212gym', 0x89504e470d0a1a0a0000000d494844520000075c000001110806000000df65d5dd0000000473424954080808087c0864880000001974455874536f66747761726500676e6f6d652d73637265656e73686f74ef03bf3e00000026744558744372656174696f6e2054696d650042656e20303220412d4b20323032342031313a33363a33366535cac70000200049444154789cecdd777c14d5dac0f1df6ccda6774825014291de7bef5205a43705c55e1050040b82a078ed60454591228a8a084807050191167a4f21219090deb6cefd639325216d538060cef7fdbcde64e7eccc49787672e63ca7485e5e5e3215c0a1cf12f6bcefcae7bdc6f3654cde230aaa4ff9855dcf5ee58d6e535999e042b3d9eb5935269b6d1f2fe6a7230918dc8270895ac7e63346fa7e728ac50db6f2d61b2b392905e39bf807eb8e05f3d86fbf3066f7203a2f3a937b459abeb28335a3dd3127aee6f19e73d9952d81b24181b2f69dd385e6afac67e56803bb3f59c2ea7fe3c876f4a79efb257efae5186941bd18dfcec2b9d357c9d004d2fe8905ccf05b4658bfc515f1ebab702d5ab4a06eddbac8b2f59f5796652c168bed6b2727277af6ec89939393edb5f5ebd7f3cd37df147fe2ea8379fb877718a63bcadaaf57b1fd641ce90a0f1a4d98c7f4daab09ebf20ea0a3c1f4dff87142161bde799f9fcea9a83d74062f0dcce2fbd1c379fb98d1be3292279d176de6ab1e9758b56809bf5f54e0df6d2a331f69c0d1279bf0c41699716b2e3047f1094f4dff8c6d11cae2ff0d6f8df4ea8378fb87ff31ccf118bf2cfb81ed27e3c8507a10785f2b6a467dca9bebaef2d886738cd93d88ee8bce60026497117cf2cfeba89f6fc0a37fc8058e5bd9f3f353e0bd52df2f38f981ccfcb65359990c28eb32e597f53cb46f281d169ea0c418ad904fb220088220088220945fbf4f4ff1a1fb3c7a8c5d45b425ff3139682aabb63e8be6cdce0c5f9e50e0bd43bfbdc0a2aca768f2d81f64e4bee8dc9ee93f2e634ad622868dfa929306c97a2e4d6f161cf88cd16eb79cc47486a543ef67c1093b2bace9cdbc7d1f52e77f6d19b92aa5f4c701d9b31bcf2e9ac6d066b5f07791c84eb8c4d16dcbf9e883d5fc9b985348e947dbc75f67d6980ed4f334137fec5716bfb680d567f47656d43e972f5f2e55f9d0d0d00abdbe20088220088250716459c66c360360b158b8fffefba95fbf3e512b3633cfa52dd22de5638ca90cbdb896340d2895cadb5e3fdfbad07c3438b896ee7d19f1b075e1eda953aef30d0bb67325a512b45ae4cc4cebf78e8ea0d723e7fc8ef30a3b51ba7675c52939175052ee0254d49bb999f7321ee6fe259177e9e728bd55ab56d1a64d1b00fef9e71f468d1a75dbaed5b8716356af5e8d4ea7cbf74c2449123ffdf4139b366d62e9d2a5769f4f555115eb36a41baec7e6f1c7d55b8f58b8ba792387a73fcbd07e3eac5c9ec09145e37838f965a68d59c027d3b458122fb275c14e369fb9c1d645afb0e29d17787a493fd4e997f9fbfd83ac3b56d815b339fac38f9c18fb18ae3fad604ff6adb7959bec3b671a87df1acbe4a4593cffe05c163fe3889416cb853f16b0f957c8f2b98f5e8f4ce0a56037b4a614ae1cdfc28217bf2ed7efec760a0f0fc7d7d71737376bcf83c5624196655b02b65ebd7a383b3b03d61b764444046bd6ac29f9c471eb7869d8558e3c319551635e6540352754a6346ec45c66eff6f09c42599c7c7f220f67cd61e6631ff1ad974ce2e9ed7c31653e9fe4241bed2a2327f2e7eb9378317b36539e59c208f74c228fc561922d98733a6d7e5ffc0d7de68d67cea82d6c7beb44b1ff8605129271bff1d2b038ebcf327236f7577342694ce1fa8523fcf9ad43d97ff976fdfc65517c8c8a84ab20088220088250596c7afc3e3615714c8afe9c31f53e2ff2bd3f4faccdcfb7be98fe37ffeb5787ff59cf70f35c862dcc6e5693d9e5ab2e18b6f04a8bfa653f0e48893bf968ca4e3e2aae90f92afb174f65f06d1eb72b12a8822008822008ff1d9224a15259533926930993c9449f3e7d98faf3cfbc7f750f537d9ba1418945b670dd94c923519bb98101074579fab8ed177f1e4eae9768385846eb040532c085301b2162df6daf5aa164b3197292ad802df15ab954dd5cc0e4c993f9ebafbf9024892953a6dcd66b858787f3f4d34ff3f9e7f99f4f655966d6ac599c3b77ae54e7932a6a86ab50f9a8d56a1a3468405858982dd16ab15870717161d8b0618035707efbed3756af5e4d46464671a7ab1c6a3fc72feb0772744c4fe61e11a12b08822008822008825092bffffe1b3f3f3f0092939369debcb9ed1951100441100441b877582c16542a1553a64c61cd9a35c4c5c4d2dccd8fba4a3792f4191cc8ba462246b45a2d0a85e28ed54b5240b5fa12a1ed2df88449288a99ea6736c295c3706a23e8d36e6fbd0a9be15a1a776f866bd556b76e5d00ce9e3d7b47aef7f0c30ff3f5d7e59f602912ae5580939313f5ebd7c7cdcd0d5757573a75ea84abab2bfbf7ef67fffefd9c3861ef3a5b779a8a5a7d27d25a7181cbd75231b9d4a5fbd4994cf65aceb881ef71506fc750194110044110044110842aae5bb76ebcfdf6db28140a5e79e515366d2a6afeb120088220088250d9592c162c160b922421491246a3118bc58242a140a552a1502890a4bbd0772e599715f608029f3070f29651a824cc7a70f503ad2b64275b67b6461dbafdc956100957e1ce120957a1f2923ce9f4d217cc19588b004f471499715cd8ff2b9fbdbd988d91e5599a57100441100441100441100441100441100441102a8648b80a822008822008822008822008822008822008822094d19d5bc45b1004411004411004411004411004411004411004e13f46245c054110044110044110044110044110044110044110ca48245c054110044110044110044110044110044110044110ca48245c054110044110044110044110044110044110044110ca48a57497ef761d044110044110044110044110044110044110044110ee496286ab200882200882200882200882200882200882200842198984ab200882200882200882200882200882200882200842198984ab200882200882200882200882200882200882200842198984ab200882200882200882200882200882200882200842198984ab20088220088220088220088220088220088220084219a94afb06ad83035a8d1a955a8d46a346a954165bde6c3263301a31198de80d46f4d9d965ae6c5e322001b26cfd4a922ae4b482506eb20c202321214bd638ad90f322625ea89c44cc0b558d8879a1aa11312f5435b72be61d1cb468349a9c67690d4aa518ff2c540e66b30583c120fa6d842a43b46d84aa44c4bb5095dcae78bf790190253927f6c9897bc97630f73519906e4b0584ca4ef2ade529db5350a954e1e1e98e56ab29d705f57a034989c998cda6b29dc01aad886815ee1d32e5bac38b9817ee3922e685aa46c4bc50d5889817aa9af2c5bc52a9c2d3d31d4d399fa505e14eb1f6db2461369bcb7602719f17ee39a26d23542522de85aaa49cf19ee73448b6ffb1fb2d203e2e558d5d0957474747dc3c5c5148153302d7225b48494e253323b354efcb193023e253b8e75843b7f4775711f3c2bd4ac4bc50d5889817aa1a11f3425553d698777472c4cddd0d8598f621dc6344bf8d50d588b68d5095887817aa92b2c67bdef7639bcd5a86f7cb3957161f9c2aa1c425859d9c9c70f770abd08b2a24051e1eee4848646464d8fd3ef18c2adcaba43cff2dd5fb44cc0bf72811f3425523625ea86a44cc0b554d5962dec9d90977f78a7d9616843b25b7df062855d255dce7857b9568db0855898877a12a296bbc43c54ce89624eb89645946121fa2ffbc62a7ac2a952a5cdd5d6fdbc55ddd5d512aedd846d6ae458f05e11e614f3c8b9817fe4b44cc0b558d8879a1aa11312f543576c4b352a9c2cdedf63d4b0bc29de2e6ee8652a92cb9a0b8cf0bff25a26d23542522de85aaa454b12ce7999e5a4e52192e2fdc938a4db87a78badfd6a58f14928487a71d237e25118ac27f876ccfad55c4bcf01f22625ea86a44cc0b558d8879a1aab127e63dbd3cc40876e13fc1da6fe35e7241719f17fe4344db46a84a44bc0b55895df16e2b2c55687b5e9224eb47497c9cfed38a9c5eaad6a8d16a35b7bd025aad16b5468dd1602cf4b82c231e5485ff14499272e2dafa7d75bfea00c45d8d034a1ff346bd33387be311aac33dc0ba227d4a8c4cf2e52ce4f404d4daf48afe1104a154ca1bf38e8e4ecc7d791e43070cc5d1d1094992b0582c28140adbd737af636db5646767f1fd9ae52c7c6f019999f62f5d2f0815a1a2eff37929553a64c062caaa88aa0a4285b89d319f4b593b04a74727805643e637ab301d3d59aef3094279dc1af3b7d268346834ea3b5b2941b88db45a2d6ab51aa3b16cfd36ee6eee746bfc20a9573460bea55ccec668b7f63d4a4a19d740033b8fff44724a72b9ea2f08a555d16d9b460d1a337ed4443ab6ed48a07f1000d13151ecd9bf87ef562de3e4e91315fb030842295464bce7decda522a60496745c106eb75be3ddcbdb0b801b09370a297c3b2ac0cdcd9085ffa42213ae1acded4fb6e6bd565109d7d22e92ad73746640afe1848684e1e4e40c4046463a9723cef3fbd69fc8ca14c9a7aa4aa3d1a05428c8cacebedb55c917d74aa5a2c863c5916530a903a9dddb8da6830df8d54f43adb1365dcc0689d8d33a8eacabc1c5eda9a84c5162e08270779523e65f7e613613464db425536559b62d6b96999989a3a3a3ad6c6e199dce9147273d86cec191e9739eafb89fe32ee8daad3326a3893d7bfebedb55114aa302eef3857176aa8e45b690961a59befa094245bb4d310f204b120e0ff447ddba1900ba9143483b751e0c86329fb33c826b043374f8603e5df225fa3bd4ae542a953c306c10470e1fe3e2854b77e49a42098a89ebd2265bb55a1ded5bf424d0bf063a472700b23233b8121bc9df87b6a1d7977e90cd98e1a3494a4e62d3b63f4afdded272d03af0f8e4c7f863fb164e9f3d854aa562f4f051fcf3ef3f9cbd70eeb65fbf28a1c1a1b469d59adf36fec6b4279f67c3964d1c093f5221e7f6f1f66140effefcbae157928a4806860487503334941dbb771638e6eee6815fb5ea9c397fc6d67eadec345a4d9109d792eef3dd1a0d27e9a20a59b6dc72244fa255b6fdc7fa5f23249c57d2a5e150d6edfdba3c552f172f6f2ffaf6ebc5efeb3792929c7ad7ea21dc0515d0b6d139e878f3d5858c1d31bec0b1da35c3a85d338c49631ee2db55cb7875fe6cb2f595a0bf4aa89a2aa29f121909095905d9cdb4189a3a60f694902509e50d33daa37ab447f448a69b6505e1aec813d30e0edabb707d11fbff65452e29acd5deb960d3565072b769c3364c7bfc359a346e899393334989095c8f8fc3c5c595268d5b32edf1d768dab04d855c2baff90be7f2f0e409157ede5c6ddbb566f1a71fe01fe07fdbae713b5596fa6b341ad4777020c1ed22cbb275208c4b2dee7fc38511ef2452af6b2a0e8e16144a19a55246eb68a16ea754462c4aa4df5c6770ae8d2c73cf3ccc0b425ee3474dc462b120cb322693098542c18e1d3b183b762ce3c68de3d5575fe5d4a953a4a4a4a05028502814c8b28cd96c66d8e0e1155a975beff761756a131252a342af71ab9ebdba53b75ed86dbd8650f9c9390f03d5023be013d42edf6bf79a366d5bb1f893f7ec6e17f856f365f127efd1b153fbdb5c33a1b292944a1439238f01145e9e487771f660f5ead568d5aa054a85f533a8522969d2b4116eee762cb959462ab59a07860ec6d7c7fbb65d43a838a579e6a81dd280310f3c4ebdba8dd0393a919292c48dc4789c9c5da857b711631e789cda210d4a5d87b6addae0ef77679ebf341a2d5d3a74c6cdc50500b54acdb08143f1f5f1bd6dd7ac1756979a35428b2d33b8ff409a356a8a2c43cb662d717672aab0ebfb57f76370ff4138e8744596a9532b8c260d9a147aac6e9d3af8faf8de53cf67e519949f1ca1b63ec7e6fe9f7cf3ffc9fdfa96d7adaf5948ba5ce43c813bc2cfaf3af7f7ef8bcea1e87febaaa0b4cf3d4aa592a0e0201c1dabeeef4de7a063d5d76b183b623cb2c140d6da95243d318184fe9d88efdb81a4a963c95cb31cd96060e2e849acfcea071cb40e77bbdac5aa56ad1a8b3ffd40b4cb85027213a8c6402589af7892faa83bfa566a9ceaba61aea541dfca81d447dd487cc5136390ca9a9815ebaa56299e1e1ef9264c545af21d5af35784ff7f562599e15a748789bd03e29b366cc3f007c663349ad8b8792dfb0eee4296654243c2983cfe5900748e3a863f601d5576f4c401bbeb171018c08891c3a853270cad83961b37123977e62c5f2dfd168bc5c2d59858e20b9b765e41d2d2d2b81a1b873e5b7fdbae91ebf9694fd3bc4533a64f9bc5b56bd72ae49cf6d67fc4c861f41f743f468301bdde80d168fd5f83c18841af67fbb69dfcbd777f85d4e96e2b2eae4b8a794992304881f49ba1a5c5900452afab498955e359c38c94b3a7826c9148bca2c1c1c54ccb076e209bbdd93437088d25ba54f554a9557cf0d13b18f4065e98f612b225ff5f83e9339f43ebe0c09b6fbc55e8fbbf5af6191b7fff83b53ffd5a61d77c68ca443a77ee609d196f34929292cae993a759b76e035763afda552fe1ce2b4fcc3b681d9065198bc5825aade6c89123bcf1c61bbcfbeebbf8fafa3262c408366dda44eddab5f1f4f464fefcf9b8e7747a3beaec6fcca9d56afadedf9b0e1dda51bd7a35cc1633d7e2ae73f8d0117efaf1178002f7fb679e7b925d3b761311917fb6e1f499cfe3a0d3327f6efe180c0a0ae4ad77e6b3e8adf7387634dceeba95464060002fcf9e81bb873bb22c939595c5952b31fcb97b2fbb76ecbeab1d7b5dba7664f4d851a8544ab2b2b3494e4ae1e2854bfcb9fb2f2e5dbc7cd7ea753b9427e60b27832ce11fd29d2ca5854b275797af8258efb77dfbf5a643476bcc5bcc66ae5d8be7df4387f9f947fbefdba59596964eecd538b2b3ed9bb1a5d71b88898d232535edb6d54928bf8a8e7959929014d6a5e2154a65b90701e76d3f188c469212933977e62c5bb7ee28f78c512f6f2f66bef402f3df788b94e4fc33dd8a6a0bf5ead383490f8d67d2f8478a9e3126546ac5c5b583837dcfd2b5431ad0abdb608c46137bf66fe1c49943c8b28cbf5f0d06f71d6b3d97ce815edd06c34eb8102196d2ce35e3d9196cddb1954b9185b71f345a0dad5bb4e1fb35dfdfe19a954ca55211e817c891e31533dbf64e29ae8fa8a4fbbcd974b3f352069e7d6d04c135abe52b633498397f2a8a355f6f272529c356de6cb4afed3ae9e1f174e8d80e9d4e87c96822353d8d7367cef3fb6f1b0bb4d5ff2be62f9c4b40803f1a8d9aacac6c929393391e7e92b53ffd4a7a5ac5b69b8a7aee298a8b8b337dfbf562fdba0d6466de9b5b6194b76df3e6ab0b69d7ba3d96f86ba4cc7a0e53c4c57cc74d17cf63ba781ee3a17f707bfb633ab4edc8dcd9f379f1d5e91552ffdbc160d07335e62aa955ac5d1e1252835e7d7a105c2318a5524172720a919723d9bdfb2fe2ae564cdfe9dd569e78b7255b8355244ff740d6496032e2a576e561bf912c8afa024956232363f657913cd303f7ff25a18e34d93dd375facce7f1f6f6e28dd71790999999efd8fc05af131d1dc3e79f7e09c0e42913e9d4b9236a8d1a93c9444a720aa74e9d61fdbadf8989b96a7799a27878b83378e8409a356d82bba73b5999595cbc7899f5eb3670e6f4d99c321e0c1a328066cd9ae0e1e54e465a26a74e9e62ddba0d4447ddec9bed3fa01f0f0c1bc4fcb96f15b8bf8e1d3f8ad6ad5bf2ecd3f9ef096ddbb6a6679fee848484a0522a494c4ae4f4c933ac5ef51369696974e9da917113c6e0e8e888c56c213d3d838b172fb171c31f9c3a79da769eafbffdbcc0843b93d9cc579f7fcd9f7feec5d1d1915e7d7a1016560b8d464352621231b157d9b97d3769696968b51a1a366a88afaf0f0a85445a7a3a4989499c3b7b01bdbe600ec0643661319b8bfdddde29c5c6b44431070b377fc1ebc8c8bcf2f2dc525402ac6d9d7b7320fd7f55f8bef3451e6bdccebec93045265c0b2c1f701b2955c58c58b4a37745e7e8cc80bec3311a8d7cfcf9021293e201e8db73284d1ab52850be7f9fe19cbd74d2aee585b55a0d2fcf9e416666163facfe91d4d4347c7cbc707777b7ed1bb864f1e7259ea73c4e9e38cdc913a74b2e584e018101346fd98cd49454060ceccb574bbfad90f3da5bff5d3bffe478f84964d94235bfea3c307420bffebc9e6b7171582c3249494915529fb21a38a83f6eeeae7cffddaa7caf8f9b309a94e454d6ffb6c1fe931517d725c4bcd1e048ddc1ae341d944476aa926d1fba61ca9618f06ad2cdd1310a991d4b5c7170b6d0fbf9649a0e4ce2e23e4fceaf7342adb57f3fcb2e5d3aa152aa70f672a66d9b56ecdbf78fddef2dab92aee9e5e9c1d5d838bef9fa3b940a053ebebedcdfbf0ff3df7c959767bdceb5b8ff4663b732a82c316fb158902409a552c9f7df7fcfc2850bf9e8a38f301a8d3cf9e4934c993285ae5dbb121010c08a152b78e69967f8e69b6f502814b6fb7449345a0db366cfa076ad5aecd8be8bf5eb37225b2c54af5e0d1757575bb9db7dbfaf085aad06770f77967fbb824b1723707271a26993c64c796412d5abf9b26ae59abb5637676717748e3ade9cfb16668b195737575ab468ca430f4fe0bb6f5770fedc85bb5637a83c315fb0b802640bb5ea0cc4cd270c342a7cea0d24fecc7a644981546079be9269d46a66bd32935ab56ab273fb2e7e5fb7018b2c53bd7a755c5d9d4b7dbed23875f274be07bd92a42427b370fea2db58a3aaab52c6bcce016df78ea89b37b6cd629525096558f133d94a92db7e58f6cd72542a255e5ede74e8d896b9f35ee187553f95ee6715ee59772ae6150a65896fd76a75746ad71ba3d1c89a754b494db33eebb46fd583dab50ace68edd4b60fd1572f956979e1aaa855d3963868b5ec3bb0ef6e57a58040ff00542a25b1b1b1b7fd5ac3060ec5cdcd8dafbfff26dfeb0f8f7b88949414d6aeffd9ee73a954c5c47509f77959ce9f70ad1ee0458d5a7e2426a492999e8d5aa32230c49ddaf503a9e6efc9bc695fdff2de92797b7b732dee3acbbe598e5aa5c6b79a0f7dfaf6e295d767316be6ab5cbf7eddaef3dc4bfcfdabf3f79ebfd9b9f34fb40e5a426a043370707feebbaf2eb35e7cd5ee67a1ff92cad2b669d4a0b16d666bf24bcf608ebc8ca4d1a01b36064debf6a0506038b017fdee6d383f3dc3f6be49631eaad47bba262525f3e6fcb7ef7635eea8d66d5a32f9914944455f61fbd69d2424c4e3e8e8484060c05ddfbaabb2c4bb8484ac84b4892ec83a09a55981594e638cff783a79b66651c487a8348e986533b2c982ec209136c9158ff98948b7eeeb5d8ca0e040a6cd7886b7de7c1793a9e8018b1e9e9ec4c65ee5db6fbe47a150e05bcd9bbefdfaf0c69baf3167d66b5cbd7acdae3285f1f3afce2bafbe8c52a564ebe66d44475d41ad5653b77e1d5bf23220c08f39afcd0259e2f7f51bb97a350e4f2f4ffaf5ebcdbcf9aff2debb1f117eecb8ed9c3a9d8e192f4de3b557e691109f50ecef60dc84d1f4bbbf0f470e1f63d58a1f484b4bc3dbdb9b7af5ebda9624777676c1d1d19179731722cb321e1e1e74edd68959b367f0deff3ee2c8e1a3b6f3eddef517bb77fd65fb5e96212eceba77ef98b123080ea9c1e64d5bb97efd3a8e3a1dbed57c6d5bf5b5efd01e2f2f4fc28f85939292864aadc2c5d90993d15468ddcb3b50e34ec5fb1d5dec5ae45bff93cabd364bb78e5d387ff9225762aee47b3d382898d0e05076efdd5dde4b946840afe138e8746cdcbcd6966c0df4af41c776dd0b2daf73d431a0d7707e5cb7acc473070405e0eee1ce574bbfe5f0a1c247a0ce5ff03a972f5db62528552a35431f1c4297ce1d707671262d2d9db8ab717cf1d9d75cbf7e9d90901a4c7c781cbe3e3e38bb38939dade7f0a1a37cb7ec7bb2b20a3e40376bd194e9339ee3c9c79f253929858e9dda737fffbe787a79a073d4919292caf62d3b58f7ebef76fec60ad77f405f4e9f3ac3de3dfb7878f2047e5cf30ba9a9f9f728e9d8a93d43860ec2c7d79baccc2c12e26ff0f3da751c3e7404954acd634f4ca176584ddcdcdc31eaf57cf0c112b40eda7cf507a81d568bf113c61012128c3e5bcfaedd7fb1f2fb1fb87eddfaef6734596fce3131b1444546d9ae2f49120d1b35a07efdbaa8d42ae2af2770e4c8b17c7f905c5c5c080c0c40a551919d95cd8d1b8924de480440a190707070c06434622ae5a81a8d464dbffbfb00d86eeeb97fe87e2ec50ccef252ba78d362980149b29095aa26fea28641afdf40a10493410219545a99f613d358ff862759694a5c7c8cb418aee7e24e6fd0db9770952489fe03faf2c71f5ba85ead1afd07de7fdb13aef65e332333d396983973e61ce1e127f8e4b30fe8d4b93d3fadf9e5b6d6b12aa92c316fb15850a954ac58b1825f7ef98566cd9aa1d7ebd9b56b172fbcf002a9a9a9bcf7de7b646565317bf66cf6eeddcb99336768d8b0a1dd9d0c43860ea64e9db012679ede7abf07183a7c0843870f0160e5f73fb0e1f74d76ff6cddba7761caa30f3176d4a43c751944efde3d79e2b1676cafd5a95787856fcfc3cfaf3a49c949acfdf157f6fc55fc9eae9191d19c3b671d9975e4d0519c5d9ce8d1abbb2de1eae0e0c0832387d1ba4d4bb46a35a7cf9ce3bb6f57702367066f874eede9dfbf2f5ede9e38e81c48884f64d3c6cd6cdfba235fc757d76e9d1934a43f5e5e5e5c8d8d63e58a1ff23d3c1426b75e00c78e84337de6f3346fd1d4f6b9566bd4b46cd582c0007fcc160bb1b157093f1a9e6f74bcb3b313bed5aba156a93064ebc9cace2223239bb434ebdf2d955279cfdee7c1dab9a890945864336021a07a6b9ab4788274b301a3d94c4097e96466dd2023f26febbf874209168bdd79ad21c30651a74e186f2ffc1fe1c78aefd0e9d9bb077dfaf6c0d3c383e8e85856adfc81b367ac7bf205d708e6a1c9e3f1ab5e1d474747925292d9b56d376aad9ab66d5be3e9e5c9f56bd759feed4a8e1fb7cecc6ad6bc09d3673ecf13539f2525e566bbc6c3d30347471d29c9a96cdbb683df72da355a0707be5ef6198b3ffce48e0cfca94a2a53cc8335b1ea3472080ee3862315d7b15f461999999c3b7bf3fef3d79f7b1835e641468d7990b367cfd98ea9d42a1e1c31944e5d3ae2a0d572f6f439962d5bceb5b8e23bebe7bcfad2cdaf5f7e9dcb9722ecaedbe34f3e8aa79767bed53966cd9e415a7a3a8b3ffcd4f65acfde3d7870d4837878ba131519c5b2af9797ea3a555d658af9f62d7ae2e0a063cffe2db664abafb71f4d8ad802c741e740fb163dd9f9f7fa325fb367d71e0c1f340c2f4f6f62e36258b6f2bb027b9af6e8dc8d618387e1e3e54b4a5a0adfac58c6defd7be9d6a91b63868fc2ddcd83acec4c76fcb993efd7acc0642abc530d60d4b0513cf6f063a8552ace9e3fc3e7cb967225f666bf81a7a7178f4e984cd3c64d31194dec3df037dfaefa8ecc2cebcc955a2135993c7e32354343319b2d1c3f19ce5b1f2cca73fe918c1a361280652bbfe5d70deb6cc73ab5ef4cf8c9e324a52417580ad6d3d38b4573dfe268f851167fb90449929314f4310000200049444154787bee5bf857f343ab7520222a822fbf5dcab98b37f79f0d0a08e4b1871ea34eaddaa4a4a57235ae60b2b459e3660ce93f18171767ae5ebb466646e1cf5da13542b976fd3ad9fa6c140a054d1a3645a35261c182d16024293599ab71b1180cd6ce64a552895aadc66834622e65db46ad5633a8df40005bd2f5e1710f31a8df4056affda154e72a0f198b6d7070def4e98acffe60c78643804cbbee8d98f9e6786adf17646b6b9676b9c9cccc4c2e9cb7ce223c7dfa0cd157ae306ffe6bd4ac15624bb84e7a783c6ddab4c6d15947d28d647e5efb2b7feede633b877f803f0f3f3291da356b92969656e8ecb59ab543193f610ca12121184d46929392d9b3671feb7eb17e3e2549a257afeef4eadb0b4f4f77ae44c7b06ae51adbcca7909010c64f1c4d68cd10cc6633274f9ce683f73e2ed5cf9a2b3ee186ed673e79fc1492a460f4d811b8b8389392626d1787d5a9cdf80963a8512388d4d434366ddcc2a68d9bf3b5e9ed2993fbdc63329b59b57c357ffcb195662d9ad2bd47175c9c5d484d4de3ef3dfbd8bfff667bad77df5e180c060c06033bb6ef2435358d7af5eaa2d33920cba0d7eb89b81c416666163edede589031198d6465656330184abd3a4f65b9cf8f1f351100f3a9cf91932341a9c4ed9d25a8f32c33ae6ed018a7495341917fc2cbf8911378e9f599255e63ecf8d1346bde04575757b40e1ae262e3f861f55a5bdf658d9060263d3c1e5f5f5f9c5d9cc848cb64dfdffbf9f187b564e7cc3eb3a74c5e0e0e0e7cb5ec33167ff419fbfede6febdff4f7f7b3f64f26a5b063c72ed41a2d6ddbb6c4cbcb8bebd7aef3ddb72b381e6e7d16902489b9f35ea15af56a383868898a8ce6db6fbee7c2859b33802bcb67ccc5c585c98f4ce2c2f98bbcffde624c79572539f06fbeb24e4e4eb46add021f1f1fb2b3b3898c88e4d4a933f9fe4eaad56a7cabf9a251ab30180ca4a6a6939e9e5ee655a82a4bbc03e89b6b3105ab91cc3266a505a5c29519351ee5dfb49360316031675a9f6d2509cc5a4c812af42db5381cb07f35c7a8c868fcaa5767e24363f9eacb65c596cdcccae4ec59ebdff1d3a721fcd8899ce5b03bf2e39ab57697b9d5d4c7a7a0504acc9a3987c4c49b1383f6ecb9d93ff3d8138f62365b78f9c557f3f5abefd9bd8739afcde2b1c71f61dab3336c9f3193c9446ccc55a64d7f9ad75f7d1383de50e8b51b376e48bffbfbf0dbbadff961d54ff98e6ddcf04781f2b99f078083fffccb878bdfa547cf2ef912ae37126ed89eed6f55a75e1dfedcbd97bd7b0aef7bf20fa8cea953673867e7c0794f0f0fb2f57a3233339124a912dfdfef5c16549644beb532c89dd59a77066bdeaf8b9bf55a9872255c5d9c5d78f29127c9cccae0a5d767139bf3d011e017c0fcd973d139387224fc30a915bc94c9ad4243c2309bcdec3bb8cbf69a5aade17abc754486a787172a95bac07bec117f2d0193d148c74eed3975f234d9d9256f60ffd4338f715f83fafcb4e667626262a851a30663c78fc2d5cd85ebd7afe3e1e5419d3a617cfee9526edcb84150701023460e273d3d9d15cb579578fe1a21c1b8b9b9f2d9922fb1c8324d9b3666c4a8e14447c71499142e898b8b0beddbb7e5bdff7dc8a9536719316a38dd7b76e5d79f7fb395e9d3b727e3268c61e3863f3871fc245aad96279e9a4a6050404ec25549bbf66dd8b2793bff1c388893932357a263a8155633dfb56ad60ce1d5b92f73e8e011d6fdfa3b92040643e17f4c6ed5a255739a366dccdebff691989844adb09ab4efd0962d9bb692add7e3e2e242c3c60db87eed3a31b1b1582c3216f3cdc68d2ccb988c262c65980d94bb145c6e6205b0ddd44bb3646e79b904eaf00ecdc4629650eb2c18b3259cbdcd687416942aeb6d5aa192f1f037812ca3d65ab09815f884ea710b7422fd620917c8d1b45913dcdcddd8ba65075e9e1e2c5c349f3a75c3f2755456b4b25e53afd7e72c377b17363aff0fab2c31af542a319bcdfcfaebaf2c59b284254b9660341ad16ab5ecdebd9b43870ef1c8238fa0d168983e7d3a172f5ec4c9c9e9e6be50259024896e5d3b73f4c8b1322df3bb6dcb0eb66ddd01405272cacdf322a1be65c9fc6267061443e7e0c06fbf6de4467c024d9a37e6f127ad0df87d7fdbbfcc7a7a5a062aa5d2d6b07dfad9c7f1f1f161d9d7df61341819356604cf4f7b9a5766cf459665424282717377e3b34f97229b2dd46f508f0993c6e0eee66a5b62b9effdbd19336e24bffdf23b17ce5fa4798ba6cc7c691a8bde7aafc4a46b2e8bc542b63e1b95f26693a44f9f5e38e81c38b0ff2046a391fb1ade47cb96cdf9eb2f6b72d1d9c5997a75eb909898486c6c1c6693119d4e8746ab867234392a4bcc83352e65acb3bb1b860ea671f3a96428551825191332b24a43f541ff236ecf47641c590db2a5542df52edd3a73e4c8b11293adfd07f663f09001ac5eb9869898abf4ecdd9d992f4d63dab32f92929282574e9be6938f3fe34662120d1bddc7f09143b970e1226b7ffc858ccc4c060eeacfe34f4fe5e9c79f2fb4a3382838185737173efbe40b2c323469d29091a386131d7525dfc3a050f12a53cc0328bd3dd1f4e8785b92ad4559fbe3aff4e8d99daedd3adbda1b4f3df33875ea86f1e3ea9f484d4da34fbf5ecc7bf335664c9b65ebbc2ecce79f7ec5a58bd6e589af5dbb999c552814a8d5f9ff1e28ed980159184992f8f1879f301a4df4eadd9d57e7ce66e6b497888fbf7ddb9bfc9754a6980ff0af81d96ce6c49943b6d7542a0d49c9d681a4ae2eee2895f91fd703fdcbbe6ffcc0be03983466223fad5bcbb98be768d5bc15afce9cc31b8be6db92aeb9657eddb88e13a74ee2eae24c54b47579bb4b1117f97cd9976464645033349487c64ce27afc75366e2d7aa0d9e933a7d873602f4e8e4e8c1f398e694f3cc7b439d665f1740e3a16bdbe9094d4143efcec23b41a07c63c388a1a41c1cc7a6336b22c33e399e9c4c4c5f2e63b0b90917176cebf02c3a66d7ff0c7366b076362d2cde5bc9d1c1d69dea4199f7ffd59813a39393af2ea8cd9444647f269ce71599659b7f13752535250aa940c1f3c9c179f9fc9d4e71ec36432e1eae2c65bafbfc5959868defff423248544cf2ef90777376ed098671f7b8a5d7bfee4e0e17f717672a27d9b0edcba419746a321c02f80bd07ac9d970a85022f2f4f2e455ce2c68d04140a15de5e9e54f3a94e744c744e1925924251a60ef9d53f5b93aab98969c0966ccd3d7627d812a832e4fd9d58f76db53e9be7aeb2167de99a6d4f57f217b79b2449787a7ad2ab574fb2b3b3397ffee643f0c1838738f4ef614c46336ddab7e2d1c72673f95204d1d15770717161eebc39c4c4c4f2e9922f9014125dba76ca77eed0d01abc367736470f87f3d1879f60319b19f6e050ead5ab436eca7fc0c0fb1938b83fab57ae2136f62a3d7be5b49f9e9b4972520acf3cff3857af5ee39db7df4792c1c9a5fcfb0b2b954a02830268dbae35911151b69944356b86f0ea6b2f7360ff3ffcf2f36f0404f8f3e0c86138bbbab066d58f7697819bcf3d32909c9c8c979727e3278c61fbb69d841f3b8146a32eb095d4df7bf6919090804596c948cb405228f0f5f5212a2a9af8eb09281412d97a6b62353d231da3c9842c8352a140a950947a006565b9cf776cdb1100c9b01c97492731a73e942fd96aa328b8ba60879cf796a47efdbadc484864d9d7cbd16834f4eed383679e7d82679eb20e4af6f4f2a44e9d30befcfc6b12126e101814c0900706522334d8b6f58d3d658a93dbbff9c9922f484a48a441a3060c7f7028172f5c62ed4febc8ccc864c0c07e3cf1d4549e7e7c1a26b3095996d9b8e10f52525251a9940c7e6020cf4e7b8ae79f9e81c96caa549fb1b6ed5ae3a0d3f1d39a9ff3275b6fa1d6a81934640069a969ecdf770049a1a04e9d5ae8743afef9e75f645946a950523bac36595959c4c7c723cb325a071d4e4ece6464942de95a59e21dc0d0c8baecbc42a1c26c4a6442c07802b5d5d9997400675d1061ba1a98643399966c2ea64722a140dfa87409d7e4e464befcf26b5e7bed652e5dbcccce1df64ff2caed37d4688bded6b0a4328141018485d566c5f2d5f992ad7905050552b35628cbbf5d51601253b65ecf9a1fd6f2e2ac1768dabc09fb730713cb321fbeff31f316bcc694471ee293225656ebdabd0b1969e9fcfcd3ba428f17c76c3693959959a06d2929142895ca026501ae5fbb4efd7a75d8fbd75e92f2b4b372a524a7e2e7e7c739a77364646416385ed1ee54bc976d0ba8321219d7ffa472255cd3d2d358f8fedbcc9af622f3e7bcc14b735f0660de9c3770d439b1f0fdb76f7bb215c0c9c999a4c4847c7f9c2e479ee7a3cfe6033072d8c334baafb9ed98c160c0c9c9bee5f2d2d2d2f8f0834f78e4d187f970f1bbecfb7b3fdbb7ee243afa4aa1e56bd60aa555eb167cfcc127b6517da92985ff0ec2c38f939c94c2c913a7f1ab5e9dd6ad5bd8957005c8cccae6684e6220fcd8711a356e40abd62d0b245c2549cab721b5d1642c74a44cf7ee5db8712391e3c74f22cb323bb7efa267afeeac5fb701b3d98c52a964d88343d9be7d27ab56dc5c8eb2b03da7ce9d3dcfe953678aacfbf091c3888a88e6a30f9694aa41a152ab69d7ae35bb77fec5e9d3d6f327c427d07f503ffcfcab73f97224356b86909991c9a58b970b3db72c5bd78c2fab5b6fee77a311e3e2a742a5b160314bec58ec4670b36c628e6b309b25944a1959b6dea9254926b091816d8bdde93b3d0995c6824b7585dd09d7de7d7af0f7de0364a46790919ec1e95367e8d3a7d76d4db8da7b4d096be78456aba5ba5f35060f198042a1e0c8a1c3b7ad6e5555658879c0963c757575c56432111f1f8f56ab65ca94293839393175ea54ead6adcbc71f7fccc2850bd9be7d3b53a64cb1eb1ee3e2e282ab9b4b99f7104d4d4d2df46f42bdfa7559f6dd97653ae7ad8e1d0d67db96ed001c39720c6f4f2f060ebabfc484ab52a9c4c9c989060defa35d87b6fcf3cf416459a67efd7a346dd6849766ccb1d55daf37f0eadc970908f4e74a740c009999591c39644d781d3d1a8ed16862e0e0fe6cfe631bd9fa6c863ff8009b376db325608f1e0dc7cbc79bd1634694987055aa54b8b9bad0b479537cbcbdf973f75ec0babc7d8d1a41ac5ab9c6f61063301a69dfbe0d4e4e4ea4a7a753a3463059d9595cbe1c69fb3756a955a8d5e5df7fbe32c4bc4ad2e0eae04d9dea6da915dc1d679f7a2449260cb205b3528d45a9c068316356a970e9371bb9d570b24e6ec2727a1ba4c421998b7f68757575c1ddcd8dcb25c4bc46ad66e8f021ac5eb9861ddbad0fb3172f5ce4f3a54b68d5a6a52d26014e9c384d4a4a0a674e9fa54ddb56444544b33767dff58c8c4c5e7f630e212135b878b1f0bd32b3b2b23876d41a33c78f1da771e386b46ed342245cef80ca10f3360e0e48ce373bc42c69e9c849c9204928bcbd90740e157e49a3d148546414fe017e00d4a9539b56ad5af0bf451fd8e2efc4f153bcfff13b0c1a3280e5dfae2cf25cf1f1f15cb91253e0f52143073164e8a00aa9efd6cddb6c33bd8f1d0de7a325efd1a75fef024b6b0945ab2c31efe8e8444a4a52beb64a6c5c24ab7ff902805e5d1fa076687ddb31a3d188ceb16c1dc61a8d86d1c346f1fbe68dac5a6bdd03fcd0d1c3f878fb3071f4788e841f41a356332aa7ccf2d505f73d8d8c8e2232dabaf2d0e973a769d6a8290deadd576cc2f5d8c9708e1e3f66fd469298f1f40b54f3f1e55afc7506f4b91f57175766bc3293a494e49c9f3f864573dfa64dcbd61cf8f71f3cdc3df86bff5e8e17b1b4664a4a8aad4e79b56bdd0e80fdff1ec8f7ba83838e5766cc2133338b451fbe936f10d0defd7b6d5fa7a5a7f3eefc77f0ab569de8982bf4e9d11b8542e28d45f3c8c8d9372e3d3d8d668d9bd9de33b04f7fce5dbcc0b295375741717375a341fdfccb4387d60801e04a6cfe7b457a5a3a29391db3168b091f2f1f542a55be9951659d01756bd2f54e275b21a72d6ffd22f71500263d358051937ba1542af0f0762533239bcfde599b6f8074697eeefb1ad467f98aaf9114926d90e177df7c6f5bc105acb340739d3d7b8e0e1dda51b77e5da2a3afd0a35737140a058b16be67db23303d3d83c64d1ad9de33ecc1a1c4c5c6f1c17b1fdbead6a55b671c1cac837f355a0d0f0c1b9cd37eda05c085f397f8e2abc5b46ed592ad5b77e0eeeec1817d078bed37b1d7b0e14318366c088a9c84756666266f2f7cd756b711a31e24322a9ac51f5b07181c397c144992183ef201366fda4c4a72aa5d65a0e0738f77480d140a897367cfe7db9330aff4f47492f30c4a552a5439e74a23ed96fec2bcabd958940a1465ec85ae0cf7f940ff2000e48c53281c8da8dbf7cf77bcc7828233e0db852999ffa003c181f60faeb97eed1a27725691b974e9128b3ff98066cd1bb37bd7cd59db478f1e2339298513c74f121d15cdcb735ea4798b66f9fa0fed29539c93274e929c94c2a9d36768ddb6155151d1eccd59912933239357e7be4c8dd0602e5eb03e0beccfb36a4d467a06f316bc8e6f755f626362efd867cc9efed280207f2c660bd15105db7779356edc1007072dbffefc9b6de5c2b4d4545ab76989b7b717f1f10954abee8352a5e44af415dbbddd6030e2e4e48852a12c735f6565887700b3af0a0909b3c5884eedc1f41a8f00906ece6451ad193c1e301a80e7ce2fe0c3d44f50a8dc317b977e00e2a50b97f976d90a264e1ac7850b978abcf790b32d95addf70b0b5dff0f0bf47ed2aa352aad03adc9cd4a1cfd613181000404431abcb0404f80370f952e1fb5de7ae4c935b2e577a7a061fbcb798b96fbcc2e91e67d99913db790506061075e54aa17df14551a9d4b87bb8d1a1633bfcfcfdd8f07bfe99b00f0c1dc403799e53ae44c7f0e28cd9007cb76c2563c68de4b9179ee6c4f1531c3a78884b797ef6bffedc43db0e6de9ddb727d151578888882a7149e4f2ba23f16ec79f9ed979563602f0f3ab56e8eb79572f2a9c5853f8bfa8dc4b0a1f3a7a8805efbec5cb2fbcc4bcd973512a95b8bab8b0f0ddb73874ecce253fbc7daa31ff95c580b5419e9c7c8323e1ffb0f3af4d6cf8e34792936fe0a873e6fca5d3f4ecdc1f0f4f6fbbcf7df8d0119e796a1a4d9b37a14be78e2c78fb0db6fcb18de5df15ec700909b1368c8e1e3956aafac7c6c6d2b547e752bd27af9898ab7878b81778ddd3d3838f96bc67fb7ec7b69d05f66655281474ebd195ad5bb6d91a33dbb7ed62d0030368d6bc09ff1e3c8c6f351f9c9c1c3976c4be194bc5a953a736dbb6ec28f503a397a7072a959a0e1ddbd3b2758b9c65698c984c26748ed665a25cdd5c888e8a29f3c3e83d45024396028dce629bd8644db65a93ae92028c0609b3b1f4376edf6abe346adc9039b36f6ef6bd75cb769e786a2aaeae2ee55e77bfbcd7ac7f5f3d96afbcb9afcfb5b86b2cf9f833ce14b10c86706f339bcda8542aba77efceecd9b379e1851758ba7429b1b1b1787878101d1d4df3e6cd31180c2c5dba94b973e7f2e4934f3279f2e40223f50a93bb04abb990e5875bb769c9a48726f0d2cc3905462796242222926fbefa2edf6bbed57c79f2a9a9a53a4f614e9f3ec38851c36db37f0b9377694b8bd9c2d62ddb59bdda3a423d24d4fab76afe82d76ebe21e717e1e3e3634bb8deeac8e1a33c30741021a1c1a4a566a0d3e96c0ff8b94e849f64dc84d168b49a2297c259facda7e8f5068c46038989c9fcfedb468ee62436aa55f301ac098adcfbbcc160c09c73af4f4f4fc7c5d9992b31b155e25e6f96141815122649c2a490304bd6afcd0a09b342617bcd36fda314b77cb3a560ecb46add92871e1ecf4b33e7e0e1e9818356cbb8f1a319336e94ad8c46adc6d7a7e87654fcb5045cdd6eee7d7ce386b593d3a5147bc3c6c6583fdf42d566d8bd8faca52b40a3c279d6b3a89b352af94d659077ffad5ab56b017032cfbd4dafd773e1dc056a87d52ad3f977eef8935d3bf38fc06fd5ba150306f62dd3f972198d462e9cbf48507050b9ce23dc3d9e9ede3cfe9075d0b22ccba4a5a770f6c2710e1ddbc39e035b484b4f46a775242af6122d1b77c2cdad6cf7c520ff401c1d1d397622ff33eab1e3e13c3c6e121aad8620bf409c0a2993ab49c3c60c1f329c1a81c180759676de25774b92bb94b0878727d7e2af13562b8c88e8085bb215e0dc85f364646652b7761df61f3cc0ea5fd6307ec458ea86d561f3b6cdec3bb8dfaeed223ab7efcce1a3876dc9d15c93464f409224a63eff04fa3c4b656ab55ac63e389ad6cd5be3eaea4646463a008e3a6b477c48503011511105ce97575060105b776e2db16eb5426b11131b83d158f40a4ffa9cf69352a92c76c9e67b892d819a3b6935e77fa32ec7111b158f24498484f913563f8897de9ac473e3df252b339b5b26c496e8e2854b2cfde21b90245c5c9c69d1a219131e1a87056c03c57af7ee41d7ee5dacdb246567a3d16a70cce94f080a0e242a32da966c2d4c68680df6eedd57643bd4dfcf1fad56c3d809a3183beee6cc62955a8db7af37b22cf3cbda758c18358cda61b5d9be7507070f1e2ab44ddf7f405f1e183684b9afbd59645261eb961decdcbe0ba552898797073d7b75e7e5392f32eff537b97c3992da6135d9b66547bef71c0f3fc9a8310f121a12c2d1a3e17695294c54743427c24f3269f2788e1c3ac6febf0f143af0c81e0a8502575717144a251693996cbdbed81985f70cf996a02f86a19c1ff7e4a41432d33370772fd83798ebd4c933e8f506c2c26a15994cb5a74c71e2e3e37175bdf92c909033e021f735ad56c3832387d1bc45535c5ddd6ccbafe77e0eefd467cc9efe524996b0c872a1abe43d3c7902972e45b06be79f54ab568dc41b49f9b6894b4a4ac66832e3eae6427c7c028e4e4e646765e7bbaf1b8d46645946524850bac9dc959242526036a73225f831ee73aa6d7d0d0953ce0f7726f3225fc6ac02a51316d94259d7b4d9b17d17f5ebd7e599679f60cecbaf155aa67ebdba7cb7e22bdbf7d7ae5d63c9e2cf6d13784a2ad3b1637b1e7fea51dbb1c51f7d668b497371ab26e63c561415bfc5dd092223a2f8eedb154c983896f3e70a4e7691246bdfcead3c3cdc7973e11b7cb5f41b0efd7bf333bb62f532dbd7e9e9e92cfbe67b76edfc33df7b77eed86d1bb80037db2000d7af5fe7c3f717131c1c4cc346f7f1c0b0c144455e61ddbaf518f406525252d9b2692b5e5e9ef8fbfbd1b459136ec427703cfc64b9263bdd0beebbaf5e81d74a9308172abfd22e239c57b913ae00878f1d66de3b6ff2ca74eb088879efbcc9b1e3a54b38964746463aaeae6eb6ef2549c2c3c39bee5dee2731f90647c30fb079fb3adbb107874cb43d44d9cb683472f0c0bf1c3cf02f9dbb7464eae3533879f27481c6874ea74396e5e26fbe8530188cf996532c2d83c18073214b64a4a4a4f1c6eb0b6cdfe7eea19a5793268df0f1f566ccb851f93a5401baf5e8cabf070fa3d3591b3ea5dd33a63046a3b1d47bb100b6a564fefa6b0f57aec422cb16eb4859cbcd25892db25dedd8321b96b367c9fa751b50a955b611357772f4587a9c1993c19a68edf34212df4ef1a5db13a9387a9ab1186f2e299c95ac60eb7b1e4c5c7acdbabfab5e41da35fbfefd7af4ec8a2449bcb9e0f502c73a75e9c886f5f6ef5169afd25cf3f2a508962e5d863e5b4f5a6a2ae9e9f6ed4b2b945e6588f9dcd1e9eddab563f1e2c5242424307efc78d2d2d2e8dfbf3f8d1b37c6c3c383a0a020222222c8cccc44a3d12049925df7acb4b474323232092ea4c35aa3d6e0e6ee8a42597816abb87b595656966d3fa55cb72eb1955bbfe2929385512895a854d611a44559fac5375cbe1441dd7a614c98348ec8c848db3572f7c99efbda9bf93a1c016edc287c691c0039a793d36030224965bfd9bef1da022c160b5dba75a26efd7a4444dc1cfd69ce7980f86ddd068c4683ed3e2fcb325939cbfa5b648bad2e15ad32c4bc4936909815cbfecb3fb3fff2cfd4ad3d84baad9ec0a2526392644c1298d56a4c12a46e5a80e190750098bdb9566bcc6710145448cc6bd4b8b9bb21490a8c466b9c7cb76c05a76e191d9e915e743bca6832d9960504309bacff562a95fded1cbdc188938b8bdde585b2ab0c315f1459afc7929c022a1572797b218ba056ab090a0ee2e03fd67db824c9bee5e8f32aa97852626281bf07a13543f27d6f369bd1688a5ee2ac284a8502b5ba421ee9aa8cca12f3999919b8b8dcec909624095717775a35eb445a5a32672f1e67ffbf3b6dc77a741a445666d9dabcb21d7f200c266b275161f1ef5fdd9fd9d367f3d7df7fb17cf572cc263393c64d2a551d729fd7d439cfbc79073a14e597f5bf70f0df7fe8d7bb1fcf3ef60c83fa0de49505af15bbafa387bb070deb37e07f1fbf57e0d8fe43ffd0ae555b9e7ef409dece33c3f5d1898fd0a2690bbe58f6253157af10125c83e79f78def63e8d46536009be5bd953c6d1d111bf6afe6cdbbdadd872b91dfb1535df61d450eb5eb76bd7ff8c5aa5be39d3f52e2c298c9cbff5bc6dfd01b6ad3f08804221f1c5cfb30908f6a16587fafcb9e5f02db3624ba6d7ebf3cdc03c75f23481418174efd1996d5bb6d3a97307263c348e95dfffc08913d66d9266cc78ce565eab5197386053e7a82bf619c390934cff6ed94ace9c3a9def58ee73ebfadf3670e8dfc3f4ecdd83a94f3c42dfc8debc39ef6d8c86fc9db5b24c89830cf2ce3a8d8888e4f8b1937cf1d5123a76eac0e5cb91d81749259729ecb9c762b6b0f4cb65d4aa5d93366d5bf3d0e409fcbd773fdbb7ed2cfd007b2f2fd46a25376e24613699ecac77e12ac37d3e3a268ada35c3c8d4d6c4941dc35fb16718ec7dbfedf8f6976ff6dfcdfb45cfaed326aabb597fe6c8e888325f576f3416dbe6b6ae1c65415fccb65ef694298ec968429167a964b3c5da86cb7d3e98f8d0789a356bcab2afbf2336f62a413582f20d4abe539f317bfa4baf5dbb8e4aa5c4cfaf1a313157f31d737272c2416b5d61c98e3f69e419225ba12a43bc0328af9b30d53283d2898d897fb2eb9f41a82415e7b322f9386c0e00ef462e25d3700395ca131366940965ef63fefaabef58b8e80d468f1d59e8f1cb9723f9facb6fd0ebf5a4a4a6935ec80a9cc595090f3f912f3e6263aee2eded09408de0a022f73dcd8d9390d01a9c2b24691a1a1a9c53aee05ef0604d26376cdc80279e7a94d3a7f25fe3dab56b848686161878af502870737745a3c9bfcddaec975e4346a6dffd7d68dda625674e179cf19d949854ec6a6fb22c13191949646424fbf7ffc3e8b12369d5baa56d06bb2ccb2424dc2021e1064e972268d9a22941c101397f7f2ade1d89773b269d8e1d3529dff7f317bc8ebb879b1d335a6f2566b7fe1755d8d3f9b1e3c758f0de42dbd777d2e588f33469dcb2d06335826a7234fce65242ed5a7545a9547239a2ec59eaa347aca3fbfcfdfd0a245c6363629124897acdb177cf0000200049444154f5ead83684bf9b4c2663917f047275edd699d3a7ce14588aac41c3fa8c1a33022f2f2fe2aec661b698a95fbfaeddfbf215e54a540c0d1b36e4077e2ab9701ec94929984c463c3d3d39916719a0bc32d2d371f77025f236dcd7736fea9b366e66759e7d4cee746326253a8b84cb5a425a1930e9d5a0809438256a9d8c496f5dfb5da59149bfa144ed2063362850a88c24446a4989ce2e71049942a1a063e70e6c58bf893d7bf6e53b3670f0fd74ebdea5c213aea5bd66567676b14b780815a3b2c43c583be5d2d3d3e9dcb933cf3fff3cf3e7cfc7c3c383a79e7a0aad56cb9e3d7bd06ab59c3b778ee9d3a7337af468bbf770b5582c1cd8ff0f5dbb76a666ed502e5db07f69e1accc2c9ccb91144a4ab226370303034ab5a47193a68d8888882c76d4605cdc35222222898888c42fc08f890f4de0fcf94bc4c6c4da46c8fbf8f870e0c041bbaf5baf7e3dcc1633b13157d11bf4646767d3b0d17df9f6be6dd0f03eae5c892936811c9573fd1f56ade589a71f65e49807f964f117988c46e2e373f7ae73ceb75c4d5e191999b8b8ba40d906d017a932c5bc2ccb2824253216ce5ef895a4ac6bd4ebfd2666a512b34289090b377e9981e1f21e6b9c2b9460b1d8f5b02fcb32fbf71fa46bd74ed4ac19caa54b85c7def5ebd7c9d6eb090c0a60fbb69d15fc130a9541658af9bb65f88861383aea6ca3bd2f5e8c4092241a34ba8f2387adcf345a8d86da756a732067f9bbdcbf2d524e676256ce4ca85bf7972c8da4a4649ab768864aa5c464b2aff3c9c9d9895a61b5f873f79e920b0b40e58af998d848ead52d7cd676f56a819cbd78f399ab61bd1628954aaec4daff9023cbd83abcafc45e212b3b8b260d1a7338cf2a548d1b3622ea4a1406bd816bd7e2d0ebf5346dd8e4ffecdd777c1475fef8f1d76c0d9b4a20740842e848975e2d481350c0820a7782a79ca7dcd91ba860bbb3dc89f715ef27a8a827786001698a58104120f40e09900492404248dd647776777e7f6c1212b2d9dd249b10c8fbf9384fd9299fcfecbc7798ddf7bc3f9fe2395d8b44b76a85c96864e997cb483feffe7b3a232383b0c27ba08b9f09ff7f343a7e228ec9e327111e16563c946e4c9b18822d168ec75f7c40e174ca193e58b2885fb7fccaeb2fbec6b59dbbb273cf2eacd63cc24a24ac8b0cee3f88029b8dd8bdb16596edd9b79b0d3f6de0c5a7e7f2a7e9f717cfe11ad3a62db1bb63d9b2ddfde3a1fd920a85b893f14cbee5361a3668587cfc973a79ea04d776eec28a555f969b206bd7260687d3c199e400dfc07851946c5db5eedb524345d774d2b5784ed6e25bf38b73ba16cde1aad31b8a1f72349af4b8348d40a4278c46032ea77b3fd7b4b986b4b434d6aeb938a4a2adc4f93e117f8af113c6d1a04183e2113a2e75e674321d3b7528b7bdb47369d86c765ab66ccec60d3f96bb5e72720a9f7cfc195bb7fcce8bf39ea74be74e652a49d7ae595faaaffe3099dc3ff31525ee4fc69fa44bd72ec0c56b5e97ae9d70ba9c242424fabd8eb7ef3df17127888f3bc1e0c1031938b83f9b7ed95cfc9085d9ecdf740066b3096b5e5ef1c3a03a9d0e9d3f37b697a82dd7f9cdbf6f26a64d3be222efe5b9039bc8ccd846aba687e819d5b9d47a47535c6c3eeafe4ed7b7adfbdc6ddefa6bb5f5eb9a6ba2090a0ae27439d3a4f9bb4e55b469730dbb76ed29fe1e7a6955584d7dc6fcf9bd74dbb61d4cbefd3626de3a9e850b3ff0585d0870ee6c1a5dbb752128288882c2878423ea876334e8c9ce723fa89a67b512d9a0017a83a1f0a1027755aea22868aeca5deb6a4bbc0398f6db2918500fd0119f1707b8d02b069c6a16618610926d67f938e52b3086e1743a40af60deeffffcad97cacfcfe7bd77ff1f735e78069bdd4ed225a3741514e497fb7b823feb6467679719e52c2f2f8fe43329dc32612c5bb66e2337a7ec43c84989499c3c71cabdce966da592b826b389dbef984c767676716ec1930f3ff898d7df788561c3079357a2c064cb6fdbe8d9ab27236fbe91756bbff37a6c40f183ed8b3ff898162d5b30fbaf0ff1dcb32f56e861ff92cea79f273b2b9bfae554d1e7e5e6925f50405061d156a0d558bc57e2ef9ecab725430ad736dd06b4abf23e02fa38f4aebd151f6a2210566f584187765d4a7da063776f21e5ec69d2d2528b5f8bac1fc54dd74f20df9acfea0dfe25fbaeb9269ad1636f66dfde03646666116cb130e286e1385d4e0e5df22415c0debdfb39117f8afbff741f9ffff70b7273f31838a87fd50fb29a848686d2a377773e5af449a90a2370ffd07afb1d9318367c305f7db992efd7ffc0e8313793959d4de2c944dab66f4b5025e6d2faf2cb6f786ece53ccfedb5ff86df316ec76158bc5c2ef5bb779ddcee974b063db4e7af5ee81dd6627a970a81a4bbd7a1c3f1e07c0a9930974eeda99b6316d484f4bc7e974a2a178adc4f197ddaeb26eed77a512d345ff6db7d7dcb001ae9c74767ed99ae85e790485ba88ee6d63dbe7218c793a139dde7d93e672c2a60fc2886aab1214e64273ead8b9dc8c2b3b05bdd9fbfe7bf6ea4e4478381b37fec4d9d473a5966dfae537060eec4fc78eed8b87ef0d090ea66bd7d25f1ad2d2cf7336f52c008d1a4595599e9090484e891b938ab6296a466d8979455170b95c0c18308077de7987eddbb7b378f1624e9e3cc9c68d1bf9eebbef98376f1e7171716cdbb68d575e79855b6fbd1597cbe5d790c2005f2cfb924e9d3b3277eeb3ac5db39e63478fa3011d3a7aff8bf644fc49faf7efcbe1438751ed2a4ea7937dfb3ccf33e6c991c3c7c8bc90c98cfbffc0aaaf5793939b4b8b4be6f20068dca4315dafed82d16464f0e00174ecd881d75e7dc3ef76fefbe9323a77eac4030fcee0a5175ee1e891631c3a70981933a713d92092a4a4d3848404034aa96b71c3860db86dd204e2e34fd2ac595326df7e1bbffcb8a978bea5af567cc3ed774d262fcf4a7c5c3c3d7bf5a447cf6ebcf5c63b7ef5cbe15059fad9fff8f35ffec4b0e143d8b8e14792cf2473faf419060d194450bd7a649ccfc06030e072b9484e763f2d9a7c2699b6316d68d1b20599999928285882eaa19678cad35589e10e6a4bcc43616537855fe8151de7ce6c45d9f62e2daf7f1697494fda86f9ee64aba243c145f1d8f27efadfd2e574eed481392f3ec3dad5eb3976ec389aa6d1be63fbe2751caa83d5dface1d6c913b0db1d1c3a7810bd5e4fe3c68dfdfa82276abfda14f335212438984e9d3ba2d7e968d8a8210306f6a74b974e2cfb7c79f17cf1478f1c6367ec6eeeffd37d2cfd7c39d9d9d98c1e3b12a3c1c0ca6f56039059f8b0ccf0e143f8e1fb1fc9c9c9e5ecd934c68e1b4d417e3e96600ba74f9fe1cc69cf4fae7bb26deb36264c1cc7037fbe9fcd9bb6e07438088b0827e7927bd8b6edda92959d4d585818b78c1f83a6697cbb727580dea1ab5f6d8af92d3b7fa075740c414117bfc31e3eb687f48cb35cc8bc98d40b0bad4fbfded753905fc0969dde2b234bcab89041d74e5d68d5a21589a713f9e2ab2fb8e7f67bc8b5e6713cfe18d7f5ba8ededd7bf1ca9beeea0dbbaab262e50aee9c74274e979303870f623018c8b75a39959880cbe5e28edba6b0f1e71f51559588f0085c8543d3e7597351ed7606f419c09163478b7f6cf666f5776bb8f9869b79eef1e758b1f24bcc2613f7dc7e0fc7e28ff17bac7b0ef089632770fcc471ec76956e5dbb019099e5ae403a7e229e81fd06b2ffd00154d58ed3e564f7be3d0c1938846db1dbcafd31f1c8b123bcf3fe029e9afd24878f1de1e7cd3f137ff204bd7bf66640dffe9c3b778e268d9b94dae6db75abb969f88dbcf8f40b2cff66051919e7e9dca1f4f79bcf572ce3d9c79fe1cf3366f1cb964d14e4e7d3a86154a975dac7b42721f154a587092e1af5a522545565d5ba6ff9f0b38f8a5f2bfaef9a1cface3d3a55f19f8ad3a8b7de3d9c2137f54051145ab46e4ca3269158f30ad8f5fb91e2446c45588283e9d0b1bd7b78ddc8fa0c18d08f0e1ddbf361e130a109a74e71d3c8eb193566a4fbbaaf506a9480756bbf67c4f5c378fad9c759f9f5b79ccfc8a063897b2380afbf5ac5634fcce68ff74d63dbd6ed44356e484cbbb6c5c9295555f976d56a6ebb6d22aaaa7270ff21747a3d8d1b372abe7f1a3b6e3427e24f62536d74bdd61d4b159dbea4485454433a746c8fc964a451e3c68c1c793d7a9dc2e6c2eaa365cb96f3e24bcf33eba13ff1dbaf5b68d6a21993a6dccaba35df71e142a6dfeb94fcde63b3d97138545253ced1b153fbe2444793a64db0dbec389d4e1c0e07d9d93974e9da099bbd0083de40565636d61243ae9664b3d9090a0ac26c36e32c7ef0e8cabd9fff64e9c7fc61ea1fe9dafe6f8427a4929e95c85f7e9ecf1dedc730a8692f748a8e9de70ef0f5ee0ba8da1db46f6262507bf777d7cfbef8c4c7de2b66caed93d919bb0b4bbd7a4cba7d22674e27173f5456917502e5e4c9047af6ecce75fdfa9076369d264d1a955a5e9b3e63e7d3cfb3f4bf5f70c75d9379f4b147f8f9a74d64656663329b301556b702ecddb79f761dda71c38d23d8b3671f8aa2d0a1433bb232b3494f77ff9d7e2e358df0f0705ab6684e5a5a1a9a0641f582506daac7a95efc515be21dc0bccb862151c5d1ca88e234a31874e8153d4ea715a362e0cdc40f7038b2d0eb1ae0d4bb309c76608ead7cc215e0d8b1e3ac5bf71d63c78d0ed05178e772b9f8e03f1ff2f4734ff0fa3f5e66f5aa35a4a49cc56436714deb684e9e4a60c7b658de5ff801735e7886bfbff132dfae5a436a722af523eb3366ec281a356ac8bfdefeb7d77ba5dcdc3c167ff0318f3ff9d75209d7ad5bb6d1a76f6fee997617d7b48966fbb6586c361b4d9b3429775fe0feccbcf7eefbbcf2fa3c264d9ac8d2cfff57bcac6154149d4a0e8fabb91f0e484e4e61daf4a91c3e7c94b47369e8141dad5bb7a4418348f6eede8b41af67f0d0c19c397386ecac1c4023b2417d2c164bf1d0f2ad5bb746af573871e25440a683aab178d7b41a4bba2a9a22f956fc1fbe3710c9d0caf4a3a2ed969b70753a5da58683ab4ece729e1002fc2ae3ceb7e6b27afd0a26df7a6ff16bc7e30f73f0b03b01ac280a03ae1bce4dd74fc06834b072f552f2adfe25e01c4e1706a3913ba7de4e685808f9d67c92124ef3e6ebfff4588de472b9f8d7dbef32ed0f77f3c719d370b95c9c4e72ffd8e269ccffcb6dd09001288a426c6cd964b9d59acfdebd07183a6c085f7fb58a2f96ad40a7e81833e6662cc1c19c3a790aa7c355ee135ee53972f828afceff0753efb983871f9985c3e964ffbe833e13ae00bfffbe9ddcbc3cba74e944bbf631e4e6e591762ead38e19a9999c581fd0769debc19ad5ab7c25660232b332b2009d76f57adf1f8faa595c17ef116d73e62de68cae3e8fa1c76f7af4fdfc9e95cff501605d93a349752f8640c682e8501f7e610dec449bd3007db9737e4c877d998cdbe87211b3a6c08a74e9e2a93f804f77c66d9d9398cb87e5871f2b355744b9e79fec952ebadfe763d4bffbb0c80c143073178e8a052cbdffcc73f4bddbc57b44d51336a4bcceb743a5c2e17068381050b163067ce1cbefbee3bf6eddb47d3a64d59b26409274e9ce09ffffc27ab56ad22262606a7d3894ea7f36bb83a80dc9c1c5e787e3ee3278ca55fffbe8c1d3f1acda9917121831ddb77622bf0fca3ddf22fbe24323292871e7e10abd5cac60d3f5528e1aaaa2aafbff616f7cd9cc69f1f760fa37421239303072eeee3d0a1c3f4eedd8bbf3efa3046839e8484245e7df91f1c3a58f6a19f72dbb1ab2cfee063e6bcf80c43870de6e79f36f1e61bffe4f63b26336efc18424283c9cecc66f3af5b4a5d8bed761b9dbb7462ccb8d1381c2adfafdfc08aff7d5dbc7ccdeaf5e4e717307ec2386e9d349ed494b3bcf5c63bec2e9c8fd51f696969fcf2f326060d1ec8ee5d7bc8389fc19a35dfd1e7ba5e74edda05740a3959d99c3a71aa38e17ae14226f1712768d4a431c1c116f2f2ac657e58adcc0d7d6d89f9b2ebbbd080d443df10de630af9b8c8dbff351a0a4a25ef2d7273f398fbfc3cc64f1c47bf017d19377e0c2e978b0b1917d8b16d0736bbfbcbefd75faf223b3787d1636e66d4e81bc9b35a493c952809d7ab446d8bf94bafd9c6ee5db03c321345a743dfba45c5fb54c2f98c0b74e9da99e7e73e8d5d55b99091c9b1234779e1f9f9c4c79f28b5eebfdf798fdbef9accd47bee2028c8ccb1a3c799fbdc3c320b7f743e7e3c9e1f7ff89909b7dec2f66d3b484b3bcffbeffd3f66deff071e7fea6f64645ce0d325ffad50c23531f1340bfef51e77dc35897efdae437538389f96ce893877a59fd3e960efee7d5cd7af0f37dc3802a7c3c1818387f9d7dbff2e35cfbdf0aec662de0f365b3ebf6efd9e9b464c287e2de9cc09e24fb9877b531485ae1d7bd3aff7f5188d067edebc069bcd73a2c2932fbefe1f0fcd98c5f851e3f8f7a2f7f866cd2aacf9f94c1a3f893b6e9d42726a32afbcf92ab17b76166fb37ce597e4e4e63271ec04268c194f9e358fafd7ac64ffb70778fbbd7f71fbc4c90c1f34020d8decec2c7edbe61e99c6e572b1e8b30fb963e2edf4ecd683addb7ff7d93fabd5ca532f3ccd9fa6cfe4b187fe86c3e964ebb62d7cf4f9c7b85c2e2c160bfdfbf4e3ce4977a0d3e939977e8e851fbe4ffc49f767e2f3e5ffa56164031e7de86f58f3adacff613d29675369dfb61dcbbef45eb5b975fbef7cffe306ee9f3e93fd87f6f1d1e71f633018f8f38c0709b68460b55a49484a289eb3d59a6fe589179ee60f774de34fd367623499c8c9cd61ffc17de4e7bbd7893f758257de78955b6fb9953f4c9d86cd66272323836327dcdf5f22c22368dcb011bfeff0fd9d3790befcf62b8faf974cc006848fcf834b2baa6e75df9fd9f2ed58f30a68d43492464ddd43343a5407db371fe093856b483f9759e17bb9f4f3e974ecd481b92f3e8bd3e5242f378f8453492cf8e7ff1557d26dfae5371a356acc9871a3b8fbee3b511d2a172e64915e38c24a7e7e3e739f770f5139ed8ff7603619c9cec9e5d081c3c57333eedab99b0f177fc2cd37dfc8906183399b7a1655b597aa6cfefacb55e4e4e4317af448468eba116b9e95845349ac5bfb1d164b3dfaf4edc5a42913d1eb749c4b3bcf878b96f8acc4f22435e52c83060d60f888a1389c0eb22e6471fc781cefbff70109a7dc95a9f171277879feebdc3b6d2a8f3df957b2b373f8facb95ac597d7104297fd629f9bd272727970ddffd80d59acfd0a18309090fa120bf80d34967f8eacb95c5efc52f3f6fa25fbfbe0c1d3e94eccc2cf6ecde536ec235e37c06111161848686e270a8d86c76d44a0c695b5bee6d0e1e3ec092a51f33fdae3fb060e873ccdef40a7159897c7a64259f1e5979714523c474cae3a5117f4551e0c34f1771e8a8e711dd2a2b22228cfb1ff82366b3997d7b0ff0d1e2256586ecf5679d40f9ef674b311af4ccbcff0f58ea59b0e6e7939478ba78c490daf41903d8f0fd465252521831621893264f044521273b97d4d4d4e24210bbcdceca95abe9dbb70f0307f5c756602331218103078f145fcb1c4e077171f1346ed488468da2b0d954f7542fd6dc4a27a36a4bbc6b68284e85d02539643e5e1fad9e82e670a2e202c5c2e60bb17c76662528a1b8f42e94028dd08fb3519c85db56e1866ac5f2afe9735daf4a6f5f51c78e1d67ceb32f30e1d65bb865fc5842c343b115d8389d748693274f01703ae90ccf3c398709136f61cc989b09af1f8e35cfcae14347f9f7bb0b8bafcfdeecdeb5872d9bb7d2bec3c5448fa669fcfb9d851cb9f10843870fe1a18767a1d3bbe3f1c0fe43a4a6a494bbbfe4e414bef96a25b74d99c82f3fff5afcdbcad06183183aece26fb60ea793c3070ff3ee3bef91939dc3e0210309b658c8cfcfe7dcb973fcf4e32fecddbb1fb3d94c417e3e1d3ab4c7683450505040665636c78fc7935c34fc7680138935771f5f731950a96fbd3a298dda467abcaa376818495050c5ab172ba3a0a080f3e9191e975524f07a5cdb97b123a750cf520fbbdd466666063a4547fdc886e8f57af2adf9acf96e057b0ed4ec979cee3dbaf1e4d38ff2c8438f953b2ccd95282828880f16bfc77fde5f54fcf4a4f04fc9b86edec25dcd56f4a39caf98d7340d343d44b4e3a62775741f7b01bd1eec565df153c38a02e650274e878e3dab22d8f0ba1d72e301cdef049410815495983fb93f09b3c98ca228c543e35db87081c4c4443efffc73e2e2e230180ccc9e3d9b810307a2aa6a7165ab5db513dda579f51cd455eeee7befa447cf1e3cf1e8d397bb2b7e090b0fc56834713ebd76fc3d5b9598f7bc3f05058dc8ebeec38593cc1d4b8a5f13a2360844cceb9a3526ec5fafa06fd4c0eb7aeaa1a3643f3e0f0a7f9813e272f016d7459f017fc4b4eec290fe3713542f08bb6a23273b0b45d1111e5e1fbd5e4f417e01bffefe1d71a72eff7435b5dd9489531877f358eefbcb8c6a4b145456ff3efde8daa9331ffef7635c151c3ad2683461301a28c8cf0f4885485594f72089afeb7c9f0677e372b893ae5af11625b6f7705c4575b03a3decceacb9f9662b63decb73494a3ac307ff597cb9bb2202a8aaf73641e6203e5ffc0583fa0fc6ee52f92aee7bd6266c223e2b1134880e6bc68d2d077257fb71d43398d9bcf557a6ceb8a3f8c1c7aaead9bb078f3ff1571e9a35dbe3fca4feae531bc867acfa5535de8b12a76a0b3dd9f787e36c6600cdfd0059b8be1e598e5c34458f3e59256c5136c624479593ade2ca12d92092fc3c2bf90505951ab52390bcc5bb7b79f5c7a6a6c96ff457ab722b5c55bb5a630957d55bd97705cab8f7ecdfced1f8438cbb6932d7b46e478306ee6129f2f2723979ea38ab37acf0bbb2b52a46de7c2369e7d2c8cec921aa614326dd7e1bc78fc75df1c9d6ebfaf54187c2f9f31958822ddc3cea466c761bfbf6fa5fcd250a798b6b1f31af280a282e5c59c759fb626be27e6d44f7f1569a762ac06072ff65e5b42b9c880d66cf2a13f11bb33138120b2fe272211797491562fecb952bb8f7ce69689a86cbe5425114ead7af4ffdfaf5e9debd3b797979040707031457c26a9a864ea7e3d3654baae36884f0ad0a31ef49516235f7c4a6e221f624d92a6a9500c4bc2bfd02cec347d1371ae8753dc7de43926c15975f80861b8b3b7590a494130cec7d232d9a451311e17ee020df9ac7e9e404b6ecfca14295ad75d9d00183f96ddb6fb52ed90ad0a17d07e24ec45738d97ac5f0f179886a0ba9472ecedbea69a8d8d273bc5ed4a49d017604a89f01d0a64d6b5ab66a496aea59748a8e9ebdbbd336a60d2b967fed7b637165a9e2bd4d81ad80a933ee60def3af30fdae3f7067fbb1dcd97eacc7753ffc74112fbe363760c9d62b997cc62e932ac6bbfb51600de3692791f333b0f53463eb61c6d9404f9e66c39ca161da938379b70dc55133092d513b98cd668c26237a9d1e476db947abc16183cb25e17fd52a3fe1aa566e5e91caf0da5605833fdf9acbf2951f57ad4355a0280a3d7b75a775ebd65882eb917921937d7bf75f153706d7b48e66c8d04184858791976be544fc095e7ee9f54acf3552a79588eb32436afb11f39aa6a1535c981c2738baba3ef13f37203c3a94f066ee6db393352e9ccc47cb4dc168cebdfc7f89085185989ffbeaf3e41758b9e7f67b090aaa57fc145cd1bf8383838b93b13a9d0e4dd3b05af3f86af557bcfad62b813d0e21fc55c5eb7c79ecd9c9951e4658886a158898b7dbb17eba1c5d83480c5d3a94d94e733851b7eea0e02bcfc3490951a302787f6db3e5f3d3966f03b6bfbae89a56d7d0b2454bdefbf03f97bb2b65348e6a4483fa0dd8f0a3ff73f05e717c7c1eb61e5dc3800e63391be74473949f5c2d496770275bb71eab5dd7fc86510d1977cb181a346c80d3e9202539957ffdf3dfecdbbbff72774d045a00ee6d0a6c053c39e731967cfe11f7de318d41fd07d3aa4534000949a7d8bcf5573efbe293800f237c2593cfd8651280782f4abae280a01d368276947d80402b1cbf4092ad754793268d515595acecec1a9d3fdeab12315d5050364e8b62b9bae254aa5baf6ee50e29aca010d5a8214693b15a3ba0aa2a69e7d228b78abce418a9425c157cdc5c48cc8bab8ec4bca86b24e6455d23312fea9af2635e41a1598ba635df25216a40f29964cfbfddc8755e5c75e4de46d42512efa22ef133e95f74bf13e8b097895baf7abaf2166868645cb8503c6c5d75d0341719e72f949f6c0550143445c1e7e38f425c118a9e8ff172659598175715897951d748cc8bba46625ed435de635e6f28f72bb610573c9dae9c41d2e43a2fae2a726f23ea1289775197f811ef45aa2129aa691a28f239bada79fd36e8501d6465e5545be3595939381cbe872e964bbab85af8fb108bc4bcb85a48cc8bba46625ed43512f3a2aef115f34663f58e1025c4e56434eacb5d26d77971b5907b1b519748bc8bbaa4c2c5a54a61923410c1af5158252ee5ad573b9f8fdfe6e5e671e14226ae0056ba3a5d2e2e645c202f37cfef6ddc6367cbc55d5c99dc17e78a8dfd2e312fae6412f3a2ae919817758dc4bca86bfc8d7993d954433d12a2e6998382bc2e97ebbcb892c9bd8da84b24de455d5299782f5234d7aad7115a7db60f28926aad2bca190fa6346b9e159bcd46fdfaf53157f10ba4cd66e7c2f90c9cae8a2770e5691a71a552a052731d48cc8b2b95c4bca86b24e6455d23312fea1a7f63de6cf69e9012e24a66369b7dae23d77971a5927b1b519748bc8bbaa4b2f15e72074a8942577ff75454512b89d6bac5af842b80d3e1243d2d1d83418fc964c61c64c66c32a23778df85d3e1c066b763b3d9b1db6c381cce2a75f862806a689ae2feac689a4cdc2d6a0f4d2b1c724041518a1e61a97c7c4acc8b5a4f625ed43512f3a2ae919817754d2563de6c366334fafd155b882b8ed168c06c3661b3d9bdae27d77951ebc9bd8da84b24de455d12e0782f5654a1aa81a668940efba2fd6bc595b0c533c54ac6b5ce511ab58d940753841042082184104288ca52a07193c618f4e5cf7129c4d5c0e1707036f5dce5ee86104208218410b58ecf395c85104208218410420851bec8c84849b68a3ac1603050bf7ec4e5ee86104208218410b58e245c8510420821841042884a0a0b0fa75e3d99bb55d41d96600be1e16197bb1b420821841042d42a32c18c104208218410420851418aa210d9a03e4141926c15754f4868087a83810b1917d03499a94a082184104208a9701542082184104208212ac06c36d3a8712349b68a3aad5ebd201a356e84d96cbedc5d114208218410e2b2930a572184104208218410a21c8aa2a0d7ebd1ebf5984c264c41268224c124040006839e86510d28b0d9b017d8b1dbed385d4e9caa130da97c15420821841075479984abc964c462b1603018309a0ce874facbd12f21841042082184104208710508329be54104218410420851a7954ab886858712960803e500002000494441541a1a7ab9fa2284104208218410420821841042082184105794e2846b5454434c66d3e5ec8b10420821841042082184104208218410425c5174006161a1926c1542082184104208218410420821841042880ad2198d0642c36418612184104208218410420821841042082184a8285d7048c8e5ee8310420821841042082184104208218410425c910c4683c1f75aa24e70b95cd86c76549b1d87cb89cba5814b4343bbdc5d13420821841042082184104208218410b59082023a059d4ec1a0d363329b3007995014dd65ed978686a281a614f6b230dde5feb356f8670594aab765d04bc2b5ce53ed2a56ab15bb5dbddc5d1142082184104208218410420821841057100d77019fd3054e9cd8ec767272c06834121c6cc16832d66467dcffa728ee4470c97caa52f25fa513ad9aa615af5f1906bdfef26697c5e5a3aa2a79b956545512ad42082184104208218410420821841022705455253333cb9d780db16034565fe2d53d5aab825258cd5a518a7bc3c2315f0b93af1520d9d63aca66b39179214b92ad420821841042082184104208218410a2daa8aa4ae6852c6c05b66ad97f71516b00f675711f159b6e5312ae7590d59a4f5666f6e5ee86104208218410420821841042082184a823b2b2b2b15af303ba4f4dd340d38a2b5403414141d3a850ce552670ad63acd67cf272f3ca0d3c053099cd98cc260c063d3a9d3b27ef72b97038dce36eab05b60ae6f57dd3dcc36917ff5b082184104208218410420821841042544c6dceb7288ae2ce5101f52cf5aabc3f2dc089d6928af7eb1ea9d82749b8d62176bb9ddc9c5c8fc1a7280a168b85208b199d52b6f059a7d3613018080a32e30a0da6c05a80d59aef7e72a0923434148a3ef4855314d7b20fbf1042082184104208218410420821c495a228cfe24eba16e570945a957fc9cdcd43afd761329b2f7757fce43beb2a09d73ac2e974929d99ed31d96a341a090b0f2dae66f545a7e8b0045b08aa17444e760e767b25e681d50014f7ff6ad1875c0821841042082184104208218410e26a509413d2d040530233c969806467e752bfbe1ebda192a94a3fab5b075f770d9ddb37a563db467468db040d381a7f8ea3f16739742c85cd3b4e78df8152f87f3e4a86959ec3ba067a7458510b655ec842554b2746354d233838184b70bd4a975c6b9a465e9e156b9eb542fba8ce326f218410420821841042082184104208715155f23241e620000a6c0581ec12269391f088f00a6fe7cf70c9cd1b87f3e2a3a3e8d6b9b93bd90c2536520aa7ce54d87ff80c2fbebd8633a9993edaf4fefef957d228ae68aaaa9649b6029883cc048758aa94f854148590906082ea5d2965df4208218410420821841042082184107550254b30870d19c6f0c14303db17c066b37bcc5f79a3a1f94cb68ebfa90b9f2db89b6b3b3507ad68d055050d054d530a070876efa46b87662c5d389309a37b55ea188ae89bb66ef46295f6206abddcdc3c9c4e67a9d70c4603e1e161e5265bafeddc9521030673cbcd63193c60084d1a35c668307036ed9cc7f54d4613aaeac0e572f9ec8fa6b564cc134f31d1b49d2da7ec153f20bfb562f4e34f966827922177fc9931e1fb894daace763d8bee7b27639abb6830ea01c618f7127bc656b51d867562f46d0388483c46b2a75d7959eeeecb790e9cc9ad5a1f44ad51d3e73460edf98ae36a114ef73177d3cf7c94a3e72a3124ba28df65399f4208218410420821841042085f1445294c5656bc08efe107fe424cdb76acffe1bb80f7c9a569040555a0a84fc3eb31dc36ea5a9e7ee8268c06038a4e412b9ae212e5e2f0c050fc67735828d9e9991852d3b0bb20e15c76b97df556e55a2d15ae37de7403a3478fac8e5d574adbd66d68ddea9acbda07bd4ecfc041fd79f2e9c7f8c79baf3267eeb3dc37733a43860e46d129dc34f206fef1e6ab016fd7a569d86d65938bf5ea791e46b8515423fefdc602e63f378f7befb88781fd0632e0ba7edc7bc73dcc7bf625feefcd7769dca87199ed149d4250bd20ff3a656c42afebfad2aebea9c2c7532197b6636cc5d071a3e8d93224c00d8510d3e77afab5f4b28aa11b63a68ea29dc5444cc7189a851babde6c781f6e1c318066960a2e2fee8bb5ea7da871169a75ed4de70697bb1f9560e8c6ac373e60fe98a6d5b2ef1a3da745ed85b4aefa31f98ae36a11459f1143b9ae698d36ea4539715d9d31e34920dabb2ce7530821841042082184104208e10fa51293b8f6ecd683268d1ad3a451637a5cdb3de07db2dbec7e15f381ef02dd164dc278e48f43a030b1ac691a8a4ec11864c460d4a3d7e930980c283a1d8a4187c16ce2fb8fbfe7b3f95f60bd90cfb45bfad0bc898f218e35cfbda8e44cb4e51b3a6c08236fbe81ad5b7e0ff4ae2b4d6f3010ddac054e9793a4d38935de7e7878387fbc6f1acd9a3725ee581c870f1dc16034d0b6cd35dc327e0cddba7725e54c4ab5b4ed29d9aa280a6673d96467586828f39f7b89c6518d59b96e156bd6afe15c7a1ae04ec44e18339eb123c730ffb9793cfefce364e7e494dade6c36915b18c0758ab107335e7a06d33b9bd9564ee5acb1e300ba5be258b92b9766636bb87fe5f625ebf276a4320c9db8eb9187312eb99f43bf5d69958956cea42763cc0a7cbf6bfa9c16b7b7270de375d5734cb559f4f0bf306b6c679a854780f514b16bfec3a20d09543add5d6e5c575fcc7856d3edf962247af803cc9ad887d6169533fb97b160e146121c35df93f09e0f3077563bf6ce7f9c4f926abe7d2184104208218410420821024143ab70d275d44da38a47511d75c348f6ecdf1bf07ea97615b31f55ae8a97c95b15055ef8ebcdd4ab6704cd9dabd2e975d8ac76e27724d0a45333920e279374e02423ee19863ec8c4c7733fa37e5438335f9d4e48c308d01cbc503f84079efccc635eb53889eba1fd80265c870e1bc2b85b46b375cbef7cfdd5aa40eeba4a8ec51d03a05d9b18801a4dbaeaf53afe78df34c223c2f87fef2f262e2ebed4f28e9d3a70efb4a94447b7aa96f6edb6b2633a9acd668fd5ad7fb9ff211a4735e6df1fbcc70f3fff0040a70e1dd1343872ec081f2c5944d2e9241ebcef01fe72ff43bcfaf6eba5b6772772cd1414789f34b92a73c65e998c74eed71d4be22a62b3617c2dea8ba8418e3856fdfd856ad8714d9fd312ed65c491562dc754bb65a61fe697e51b399eaed27cc47dcc98fa0069fb9f65696a801baab698a925edf9d26414b3a6b62379c90b2c4889e6ae47ee63e688bdccd9905e737d088be1c629f772d7e07604934ce06f258510420821841042082184a83915cdcf348a8aa27bd76e6c8bdd068a42df5ed7d1282a8a73696901ed97ddcf84abb7747197f64de8d6b1993bd98a86a6813ec8c481d5b11cd89e489bd356144547c2e1144eed89e740ec09a23bb6e4863f8c42b5e652909583a2836e9d5ad0a543330e1c49aed031042ce15a946cddbe3db656255b8b1c8b3b86a2d3d578d2b5ff80fe346bde948f3ffab44cb2f5a69137b8fb9298449bb66daaa57dc72573b7021e83b655cb56f4eddd978dbffc589c6c05983c7e123a9d9e97fe3e0f80f51bbfa353fb8e0c1b3c8ce816d1249c4e28b51f93d9e833e1ea91b115a3fffc18338677a6a9299784bdeb59f8ce7ff8f56ce9e5f70eef4cb409cea7aee78d47dee2d73ce83963212f8d8ba14108e4a4c6f1eba72ff1c6f7a978ae3535d3eeb6775835ad290dc82161ef2ade79e33f6cbbe04f3f42e837e305668feb417408e4a41ee29b5766f37ebc7bbffd9ff881df9e0038c8c2fb66f159511594218681d75a4858134b1a11a50fbbe528e63e3d09be99cbbc0d29444f7e89c74744136181bcf438b62c7f9fc5db0b930bf562183dfd3e26f46a4d04999c4ab412612c7194be9697e94b436e7cf06146776c4654783026358f334756b178d1b71cca0668c8b0071f667cd1726b26a78eac63e9926fd9ebd772c0d09461d36730feda18a22c56d2f6af73ef3fdfbd38a6dce3b5d079cc83cc18d98de6e1ee652b17bcccaa1400133d662e61d94c80e32c79fc05d665796ba72103a63dc8e45ed144850783f5382b5e7f17eb58efc75e769b175895e2fd78303464c094194c1edc89e616b06765919cb88e456faf278e1866bcf13cadbf7ffc62c2c8d09001531f646abf18a28c56ce1cd9c4274b96b1f7bcbb0fdecf8fa773eaed3d0dc0f92cd3dea5c7e4479f7dc5a99798091ff4146f4f0f67e5fc67599504840de5e9d7ee85cf1fe7f5df4a56f7fa732c26a2c7cee1fd29514450b1d8cf3ab09175857b89b36e65f4e0d144340452bdbdff97c48711325336b1f0f50fd9ab9613d7e7ab2966ca55bbcea7b1693451ea71966e4b20d991c6de94fb185d6a38767fae41de3e937ebc23631f6472d3432c5d14c7e8e9811f2e450821841042082184104288da20d86261cac4298487851316164a68681861a1a184868402b0fe87ef50d0d1af775ffef9dadbe4e4e6909d93434e4e36d9d939646667b2e29b15e4592b370ea0c3e9dfa87b0a1a949372eddabe31c5830e1756b82a061de75333d03b549a37aa8f4eaf23b75563d62df991b67d3a72c31f6e223f33139d5e41af57d00ae775ed7ab912ae2593ad2bfef7552076592d8e1c3d0cd46ca56b9feb7a9194789a43070f9759569470ad4e9ec6bd3618f4655e1bdc6f20005faff9a6d4ebefbcbf0083a1f47ca3df7eb78661838731a8ff001256944eb81a8d95999b3484214fbcc1f3d765f0f5a297d896d7841bef7d80975e35f1d883efb25b2d5a9ecbda4f5e63e1593b0deadb49c8736f9db263390b0f67906a0fa1ddb8077870f6631cdcf104dfe47a6e2d377e250b57c7911bd293db67dccd4bb30f32f9c5cde4fae8c7c14e0ff0c49dad4858f41c6f1cce25a4491372cf5edcef81650fb2e0373b904b4a894a3763db0174b724b072573a944cb8867563e6237712b1eb6d9edf90820aa4ed5ac5922356b25423cd464c63dacc19c41df93bbf64873360d6534c6f95c0dacfdfe290359876fdc633ba7867be967bea4b0cd16ddb613ab298059bd320bc3b63a6dcc563539379f8fd9d588920a6d4f2cedc3871128f3d1dccbcb9cb8873f85a6ea1cfcc39cc681bc78a257f278e68c64f9dc623d39379f4fd9d58bd1d6fc349cc9a12cda9cfdf6661bc95e086e1e495286a3bbe7c2e8bf6ab401e69e72df479d05b3b1174beb633a6f8c52cf82919d5086929118cf671ec65b7f1753c16ba4f9fc3ec5e79fcf2cdbb7c92a262e97527b3077726c2b01eca0c835ab47e261b96bf4b6c5614c326dec9638f199937f753e21c113ece8fa773ea2d86aa7a3e7dc43300befaec2b4ebdbfc759bf2d66e9e0d798367d14b12f6f227afa9db44b5cc6d3bf5d3a94b27fc79295f8039fff9480d5d29909158afd12e770ec30a21237b1e8083edeff4be30322c25592f329fe9bb8745c5f1a2f818b19ff5ddef3a9c61f268149dcd8ab21c9ea2446374de0872529a5fae7eb1a54b1cf6459714b1fe74180267796b99e0a2184104208218410420871b5c8b35ad97b602f7ffdf36ccc6677d1deaebdbbc9cccae25cda390e1f75ff00facdea95b4b9a60d2d9ab7a0558b9600141414f0aff7dea974b215c0e5f26faa4a6f15aebdba34070534c5bd96a281cbe6a063ff0e9cdab1962d3f6fe542460e911613aadec090897d7158ade874a0538a52b91a68ee846b79ca6bbfca09d7eb6f18cea8d123d1348d860d227960d6fd5ed7ffcfc20faadaa4573dbbf5f4babce88d68d726069da2909094e075fdaa8a8a6ac8aed8dd1e973df9f8b3d5da3680e629483d44438b662db0e65b397de674a9d7274d98049ac647ff5d52fc5adc89385455a545b3167eeddba7c6d773fba04876bd378b37d76400f06bbc898fdfbf9b7b46fc87dd7b2f2e7fa5707949a9fb7e2cae36db1d1fc90d9ffd912e6de11b8f633fda48d9fb23ebb6a402db4968d997a52387d0d3b8995f23bdf7e3197b0821f65c8e6fd9ceee2460df21f72e8deefde626c571f048d9bada7683fb604959456cc9044a7834773df220ddd33f65dee27d14a58bb24eec646be17f1f4a5cc7c05e93e8dc147e310e604c47d8b3e46d3ef9cd7dd18a4d89a6cfb59ddc2b37f0b1bcdcbed8c98cdf4bec8174601fc9e19d787b641fdab1b370e8ccd2cb6313e1ad793730e1da2f796bb78fe5f10318d30bb62e7897550754e030a7c2bbf3fe94017436ec24d651fef16eb18463513339be7f1f71a9c089c2950cee36f3b21248482a7ce225ec069fed809dcc2345fd0488f1efd84b6e13760333bdb56319c0847ee11cfa7c2e0b7f769f51a36534f6c16542a2707f17d75f5cb8fede1423afcf1bcf845ecb786bbb3fe7a7ec392d3786b2ab783e77abe5c4d0a5bcf4d9579c86f98a99747e58f225c3e64c62d683dd89ea98c68af91bf13c78851fc7ba7f2b5b77bb97a78577ab40ecab8091ce773dcf231d4fb1687e89246e79ef3f65e3e3d2fe968a6b4faa183387bafe85f71f1b4870991d27b372eee32cf53837e9653c9fd99b58b96b3ccfcc5a40f7acbd2c5df077d69519b6d9fb35c8db67d258a9f7430821841042082184104288abd3ee7d7b78fee5b9cc79f239c242c3703a9d7cf4e987a88e8b950bcbbefc0280c913273169fc6d646567f1ca9baf9174ba6a3fa6b99c658b073df352e1daa129688529594543d129d872f369d3bf03fdcfe7f2d6a38b31d633a3a230fa9eeb896cd90a35b7f087eea279591577135ddb37ad700faa9c70d5ebddd5928aa2b867a4f52f097d59699a86a228288aae66daf3e34de9726d17a21a36e0e79f3605b4eda2097c7dd1d0d0ebcabe1fd7445fe371fb72c7f9aec4f937b5ec42b42991b5fb4a245353f77020e341fa778a2138c3c3f28b5bd365ec633c785b5fda3509815c3b2613a49a4c7eb59d9a948a2d2492103ffac1a2e5ac4d7c837b177c4a979f97f3d957ebd996e479e0e28b3a31e05a0bc9dfc796480a99881ef930edd47dbcf3f8462e16a51b891e742fd3c77627ba613858558c46c834024da38932a6b1e348394f88f85a5e6e5f4a4b4b4fc76e09c662c073f557522c87d2c7d3b96d33f0f41c41c9e56a0ccd8c11747e6c09c34aad74880823e028ff78d5fdebf921e529a6ce7993cedbd6b16ecd26f69e2f2711d5ca573b5ede928a1cbbaf765ac5d0cc98ccda239e9269e5edef92f5530f7328eb2ebab76d06dbfde9e3a5e7d44b0c795291f3b93bc1437bbe95eab3af38f5e75ca6ae67e14f43797b6c77ce7cff8c87045ce58eb562b19f002d27316304fc30ffdf6c2d1eaed7cbfb5fd1f8f0a48a31a31e59c6bcb9df52662002d54e5a4ad96d3da9b9f3194e9f197398d53199b53fa531707014ad0b8713ee7cd7f3dc98f83e0b7ef3d066996b50f9ef7920de0f2184104208218410420821ae2649a7937876def33cfbe8d35cd7ab0fcf3ff91cf3fefe32cec2e92b753a1d4fcc7e9c9edd7a9074e634afbdf53a19173ce56e2ac6dfb965bdafe54e506985c9534dd3309a0d80c6f69d71348c0ca549030b4792ce13fb632c51f58df4b9a90f619161689a0b8aaa67153099cb8e14ebab0f554eb86ef87e2326938961c38790792193654b9757759755b27b9fe76a5270bfb91d3b742222a23e0949899c4a3c59edfd494f3b4fb366e567c28b8c1b379adc9c9cc0275c753ab44be671d55c1a5c122b6792cf30a8df201a4535e25cdab98beb6a1aca2509d7a68d9b60301848f4f0c482a7218c7df2951bf5b2dcd4ed015efaeb60ce7ff5162ffc94486ec8689e786d94ff6d97cc97faea47de21163c722f1b474ce19e3b1ee0ed915358fbca2c5ed9e165f30e03e8614966c3aef4522fa71d89456ddb87a9d30770e8fdadee0ad73677f2f8cc01a4adf990b7b625936719c0aca72f1976dad788cdde9697d39752547f1aa9483f92d9b0e02dd6954a5ea864e6e3fd781d712c7d61365bfa8e67f2c43b7966f068362c98cbe223e535e8a51d7ff975ece5b763bcf8c7ea73691f2f3da7fec49027fe9e4f7f62c8579f7db6e7eb5c36a473db28ecaa9da86b8712b3fcd31243fcfaa1bcb62b1afbc64c9277ade7979297c1cabeffd5a9e47139d24948aac0b9f3b5bf22d5713edb4c62fa60f861eedf599a64e49794a77866d61c662cfc1253af66a8fbb3283ba475e93ef9fc4c06e2fd1042082184104208218410e22a939e9ecef3f3e7b0e01fffa2658b96c5c95670e780dab5694b567636cfbf3c075b812d206d2a1e0a023d29bfbe158e9e486360ef7aa029b8340d9d414f414101fff8d3bfd8ba711f437a7740733a69de2084d4a454d67db416a3d1c0d0c94370395ca5062b3e165f7ea54f797d084889e79ad5ebf8e5e75fe9d5bb27936fbf2d10bb0cb8a2646bf326cd48484a24fe645c8db4bb73e76ea25b47d3a9738772d7e93fa01f0d1a4472e0c0a180b7efa96a5555cb6627366fdb02c02da3c6f9dce7adb74c0460ebf6dfcb2c73389c655ef3c51e7f90147b2bba748bbcf862931e748dcc21e1702279f1c7cb2e2f14d23286c8dcedfc6fd18f6c3b12c7c1bd0739efabe8b492fdb003a8191cfcfe3f3cf3e00c16c637e186717d09c18edd6ec6141c52669f9dfb75273c652bb1a53e9b76acfb97316fc146ecbd1ee099c9d118014bab68c2ad7b59fbcd560e252590109f406651a220318e64b5193d3a867beebcafe5e5f6a5821ac4d03adc4e727c399345975c9e92409ada90e6e1569253534afc938ed5d7f102602561fb32de7af6193e4f6cc8b091dd31a2a2aa26822d968babf96827607cb4a3a6249049149ddb5a7cee0a283e679ddb9638670d6268179e57fefb7b894bcfa9eff7f41215399f1edaab305f71eac7b98c1a3e83bb9a1e66f1fc7789b5dcc0ac89d1fea4497d1f6b45b73fb19eb7dedf44c9bd797dff531248bbf47c17f310d79e5431668c5dffc2e28f3e6759997fdee4ae963e372fb73fd5713e8d0da3085793399502a092b0e1efbcb63c93818f3ccc3075136b0f9413d825ce93afcf64c0df0f2184104208218410420821ae129a06164b30c78e1d45afd773cbe85bb865f42de8f57a8e1e3f464870d989baaac2532ecbb3f26b5c8f9d3a8fa61850740614bd11a74bcf8ffffb9d266d5ad17b5057ec561b06831eb5c04ee36b9af0e6f7ff64c45d37e174ea507426d019d114139a62e2d8296f55bb9efb50e50ad7226b56bb67d11c367c08002bfef755a0761d109723d90ab075ebeff4b9ae27536e9fc4d2cfffc7f16317db361a0c0c1936989b46dec0e9d367d8fcaba7f111ab466fd0a3aaa57f98565595a02073a9d7129312f97dc7efdc326a1ca7cf9ce6bb1fbf07e0e3cf3e2ab5dea81b6e66e488916cdfb99d84d365e7bf55ed7e94f7a919e4e49a891e348a9e5b56b0fbec8f7cf6db1f797de62b3cce47fc9ad7841befb89b56a9eb79e7a75c507fe47f3bee66decc37782ee4bf6c8acfc5d438848c9f7fe46052221921839938f37a727f4b25d7d48e1013e47a6ac75755bbaf7eb4bd9e7b3ada399e94813d24862ef5cde4a6e662571339986463c8b8079878762339f523b1c7aee7d7b3310cb8369ce46db1784a85588f7eca5bcba3993fe561eedaf50c9fa4249365e9c3988903b0ee4ac66e8c26d8883b3191bd9595dbc6f3ccd4a778c4f82dbf2466626cdb8ce0a24c93afe578ef4bf94c341b3c89f1d65812ac110c9c388976595b796d97ea7bb9632b6bf78f67f694a79865fc962d299918c3a38948dfc40f47ad58bd1d6f93de8cee08098959d82dd1b40b37614dc9034702c753ecf419712737a66f25d312817ac47b3b0173de473be7b7f2c3fe49cc9cfa28d38cabd86b8da0f388684c9473bdc9decada5d93787ceaa34ce34bf65aa318387112d1e99b58bacb9f32d9b2e7d4eb7b0a54e97c563a864a1fb3d738f5f51ed7ebcdb48931247cf30cbf24a5b367f93ede9e7e1fa337bfc02a75284fcfb99788cd2ff3f40a7f8ed517efdb470d7f8af9532cac7dfd055625f9f1fe9fdfe43eb6a94f31cbf2255b52548ce1463277ed242edf535c6f62efa5f3e4563166023e846e759ecff858e2b8970953ba11f7cd61f22ccd68d61054d58e3dbc13dd5b1a4948f2719e1cde3f9332a4b010420821841042082184109e7568df019d4e87a2d7f3d6cb6fd0a44913006e183a829473a9e8f57adab569c781430702d29ede50fe10bea5955fe31a7ff408ba3407e042a700aa83b12315f491ad79e29e03684e07281a06939ebc0b17b0c5adc46c51d0bbdc431a2b25e6cc8c3be46d4e5acf7d0858c2154a275d9d0e075f7fb52a90bbafb4f631ed2f4bb215c0a13af870d127dc37731af7ffe93e8e1f8f27352595888870da77688fd96c222b3b9b4f3ff92f4ebf2705f69fc964a220bfa0d46bf67292a2ef2d5e4874cb6866cd78901ed77667cdf7eb3870d8fd61e9d9ad07378d18c9c0befd493d7b967f7ff07f1ef761b7fb2e2fd5b4e37cf3c546facfba9bfbfaace2e135b9fcfac66c5e9efd183366bec2ad263b0987d7f3caabefb25b05c860e32bb331cd7e8c19773ec39810c849ddc387477e64f7befff0c6b248668f7c86b76f33833d87f3a971ecceb50371a5dbf9de57cfbcf723a471176e9c368a5991a1603f4fc2defff2c6e2edd881b58bfe43bfd97fe491974643c641be495acfafc103e8d130992d9bcbffe53e79c3fb2cedf51ad3664ee297b9cb58b83c8219231f60ee5813a87964a62770c80a6065ef92f9bc699dc15d631fe0997013766b2669f1b124fbb3bc8defbe9447a519c3a63c4cf37095b4f85816bef5217b1dfe2ccf62ebc2f998a6ce60fcc40718663161cf4a267679ac3bd972b4fce33536ecccb08943691d1e0c6a26678eac62e1f27da8c00f9f2fa3fbcc494c7b6418641d67dd824d2cf5d64ec0f8381eb2f861d1db58a6dfcb4d531fe546b2484e57293d6e7549566217cd67e1d4194c9efa28638c2a678e6c62c1924f39e4cf10b99ecea997f7b448a5cf671562a8e4317b8f636fefb14accc4bbe86eddc89c9fddc3c066fdb69495235f63c29401fcf079d9d67c1dab2f15dedeebfb6f2d3eb6c9131f669805f2d2f7b1347e2771f9591ee3ba4cc2b5aa3113f02174abf17cbebb91771644316bea83bc35320293359353f19b5832f75dac23e7f0d8ac3b899bbb15f07e0df2fa9994218585104208218410420821441da3699a5ff3a576ead01180ee5dbba13a54befef61b0c063da36f1a539c7cedd4a163c012ae2693af391f7ddbb4e702f171f1c4343580e242ef72a1376b1cfe2e9b9387d268d3ac21b9394e1c76858cf402cec51fa5494b3d9aaa6132824eef7e5f4ea4b8d8b4bb22f3d8b9293d8775d57caf5631378fba094507ebd76e08f4ae2ba56deb36a0e86a3cd95a92dea0a76fdfeb183e7c08f523eb03909797c7de3dfbd9f0fd46f2f2f2aaa55d4dd3484f2bf3ab3d61e1a198cde632af075b2c3c74ff5f18d8b7bfc7fd6dd9fe3bfff7c1bfc9b3964d641514d8c8c9cef1ab4ffe4e807c258bb9eb1d5ebe762b4f3dbb8cb2b5c057e6e0e33e0000200049444154425f6298f1c6f3b4fefe71e66cf09494f0b55c84dff412ef8e4ce0f5273e24d0038657fc9c56ed7cd6a678f6adaab129b17d65a8f879aacecfa41042082184104208218410b59dbff999f9cfbf44bbb6edd8be73079f7df119e7d2d200681415c5f4a9d3e9dda317878e1c66dedfe757b94f8aa2d0202ab2d41caae5d24053b472d78d696ae493271b63346ae0d2d0141767536c1cd89b85d9a0c7e1d040d3509d0efaf40ba341940e348aab5b5587c6d47fe47222b5e2a9d38056b816f96e7ded48b416893f75e2727701a7c3c9d62dbfb3754bd9794fab93a228984cc63255adb9b9568c26233aa5f4b8d879562bff78e71ff4ecd68391d7df4c68e1bca479d65cbeff71033bf7eef2d88e4b73919b9b5b3d0771458a6160af28ce6cdb5a0b9253b5a92f57332331836ea0b93599b42c2bc6a67d9830b61d59fb97713ce06dd5f43995181257a29afc4c0a218410420821841042087175301a8d98cd41cc7b7d3e878e1e2eb5ec5c5a1a6fbcf3265d3b7761da9df7a2d3e970b9aa367aabd164f42fd90aee917ccb1f5598b81495775766f2e8a47050407141f3e6269ac7340297d33d392d1ae8807c272ea7fbcf5ae1be17ac2cf09a6cf596b0ae9684aba85d824382b16764967acde574929b934b585898c76d76efdbc3ee7d7bfc6e23373b0fcde55fc6bf2e54b7d26600d7354c66c7b65a909eaa4d7db9aa5988ba762893af6d4694c584dd9a4cdcaef77973c961fc9d35d46f357d4e2586c415a9063f934208218410420821841042d4721ae5578696a4283a9e7ee1695c5e723e070e1de4e9179f45afd75739e11a1c6ca9d8063e0e61e9cfb9d8548dd9b785613129381d1aae6c27ee4cad86a269689a864eafe04e5729e45a9dbcf9653eab77781f4ad85b7aab5a861416b54f765636365bd9b9242d160bc121150ce64be4e55ab17a1862d89bba32acb01042082184104208218410420821c4e5e66fc2b52699cd66c2c2432bbc9da6794f7e02346da067eed408fab433a1e02aac6375ffa3d3345c6828c0cee3769eff248fb46cefe9525f792d49b8d6112ea78b0b9999b89c659f3430998c848685a2d3e93c6ce9659f2e17d95939a86ae56a85bc547d0b21841042082184104208218410428800a88df9189d4e47fdc8880ae7a680c203f2efa85a45e9e91963a2678c895e6d0ca068ec89b3b3eb84caee389584737e54e86a5a615392701580aaaa645ec8f2b84cd1e9080d0dc66c36fbb52f9bcd464e4e1e5a154ac535340ae721966a572184104208218410420821841042880072576516255c6b571e2622321ca3c158e9ed35adb062b7ba0f4b034df15d1d2c73b8d62146a3919090607273f3ca2cd30aab558dc67c8c461346a31e9d5e8f4eef7eb2c0e574e1723a515527aa6a4755bd8f63ed8f921f84a2f26f7fcac08510420821841042082184104208214459a5f32dee844b6d4bbb8484045729d90a85c7564325a5fe24ab25e15ac7d4b3d403f09874055055474092a9155594649564ab104208218410420821841042082144e5d4f67c4b68680841f58202b33385ea1d2fb902fbaec4c0c8e24a57cf528ff088b05af74483104208218410420821841042082184b8fa288a42784478e092adc53bc65dceab05b2dc557317cf5620912609d73aca643211d93092a020335a40835008218410420821841042082184104208f75cab414166221bd4c764aada30c2e552dc53586a6855ca79699a563c4c71458b166548e13a4ca7d3111a164abd7af5c8cbcbc36e572f779784104208218410420821fe3f7b771f1f6579e0fffec310c88400430898f0640202098224f529f1315474a3b5ca43b7226c770177b7b4765feada73b4f87b9d1f9bdfef77e4a73da2e56c55fa6ad5b467ad5045535725db0589ab98206a8214880824029201421843c82484e1fc71dd43269379b867324948fdbe5f2224733f5c73dfd7f375dfd725222222227f01860e1d42eaf0549292fa62383270a5d578e6193e1f300d73ec73c46ac055481a92846b948bf3e77db479db696f6ba7c3770e9fef3cf8cefb5f9c16111111111111111111111111e9621083c03108876310498ec10c491e4a72f2501c8e7e986877d085ff596fab9ee7bcf5bb41d67097f9f93c83ce9b7f9ba1da9e2dc4a90157b960d02007ce1467e2e7cf16111111111111111111111111e94bfe81d62e3ffbff1ae4ff2f21b486ab88888888888888888888888888489c34e02a2222222222222222222222222212270db88a88888888888888888888888888c44903ae222222222222222222222222222271d280ab88888888888888888888888888489c9246a7a4f77718444444444444444444444444444406a441e7cf9f3fdfdf811011111111111111111111111111198834a5b088888888888888888888888888489c34e02a2222222222222222222222222212270db88a88888888888888888888888888c44903ae222222222222222222222222222271d280ab88888888888888888888888888489c34e02a2222222222222222222222222212270db88a88888888888888888888888888c44903ae222222222222222222222222222271d280ab88888888888888888888888888489c34e02a2222222222222222222222222212270db88a88888888888888888888888888c44903ae222222222222222222222222222271d280ab88888888888888888888888888489c34e02a2222222222222222222222222212270db88a88888888888888888888888888c44903ae222222222222222222222222222271d280ab88888888888888888888888888489c34e02a2222222222222222222222222212270db88a88888888888888888888888888c44903ae222222222222222222222222222271d280ab88888888888888888888888888489c34e02a2222222222222222222222222212270db88a88888888888888888888888888c44903ae222222222222222222222222222271d280ab88888888888888888888888888489c92a26d505252d217e110111111111111111111111111111970a20eb802bcfaeaabbd1d0e111111111111111111111111119101c7d6802b40d55dbb7a331c2222222222222222222222222222038eed0157803dab7b2b18f199b1b2bf432022222222222222222222222222df648efe0e8088888888888888888888888888c840a5015711111111111111111111111111913869c05544444444444444444444444444244e1a701511111111111111111111111111895302065c1da42c9ecec407473338ca96ce1fe493bbe72e66efb989acc5c3a21e77f88333c9fcfe88a8c71511111111111111111111111111e90f3d1b701d3f86f11be79055d4cc89e74f722ed2b6c9a319fbd32c9ca31d38468f26ed91a98c4c8eb4838fd3cf1fe4ecdcab98be613a232fe951484544444444444444444444444444122efe01d74919646dbc8e740e52f74f47f1b6d9385552c08f496137ecd47686c607b7d3343c87ec8db3718d8f3bb422222222222222222222222222220917df806bf20832d75d45daa4161a9f3888b7c3c63ee79a397b28e0e783cdb4451da405dace70eca9039c9d36994b9f9f4c4ac4b7624544444444444444444444444444fa4e5c03aec37e9acf25570d81bd5fd2f4b1cd9d3ada38fdd9990b3fb67d7692b33677f5557c89671f0c2e98c5a53f1911737845444444444444444444444444447a43ec03ae978c2373d9681c405be571daecbcdd6a3953e95fe7f52c67aa9af1d9ddb1a399afabce000e52fe713a6961d673f5b8a1b41cd25743ea6a98f23b58fe262c7f1d6ef995f9ddfdfbed879716a869b1b7a9bb1ebef38c39c7c2ea18ce7191f3b8616d99f95ea9ab61e6eb50560f5e8066d8f001ccfc392caf849ad6fe0ead3d55efc1f8d590fa146c688fbc6dadbb6fc2940821e360232c7c16ae2c83ba5e3ebfb7091efead397ffa9bbd7cb2be129407546c86f16ba1e4701f86c1070f3f0be9cfc2c23258625de3d427e096d761f96b30e5e730e54f910f53f309cc7c02527f0e6b9b426cd00e1bdeb28efd3c54d9cea03bb977c395cfc0f25de6e78aad9d69ad2c86b222ac0e28ff00a6f8bf47639cdbd895806bf2172d8632b25735079453dfb0fbe43e0c0bd79aefbe64571f9e3728ad4753bb37a07cdad9bb618baa039efc1d4cf92d5405e54bbd56e677c0932fc3f817a0dc665dc9e38e506ec771bc48cadf82e57b7b7e1c5b1ae196df42edc5984e7db0f2d7b0ee04ac7dd5aacfbc1ca5fee4839ae33d3b6dcd8ecef2f9c9a063b977c2957f823f6dbdf8ca537fd8bc0908ce45e16229d37ac09f372fdcd10b07efafb4eb4f97cdd137edb5f6782fb5a7e2ca7b1351cf0d556ff2c0cadf99df8d7f27ceb0c713b63e6cabda094b3c71dc7d041e7ec9ba766fc577ea50f5a4a86db70122641f818d7a4cafe66736c5d26fd49fe2bdc6222222d23b621e704dfefe1486bb007c9cdd17c3a029e0ab3a416b1bd0769296cad86ab2ad9f59e71a3d9ef405a1e7157665c0d22b21c75a1f36ff0a78f12e7871016cf9216cb90e9cb6030bebde81374edbdb3c230b6e4fb77bf081c395010fcc860c2ba65c3b0be66559d77104dc731ddc3d157e56087929fd1952fb0a6640b68d98ef39680692074a4752a838e8714385076a0ff67e0789330d165ddabbe7e853c179800fb6d683a7052abeeadba0248f829797c3c679f0f8e556fa73c0a25be1c5efc1a7f3213bca31f22e879c48f17e28dc930bae1e84b3fa20d4b64285357d7c91cdb4665b12145f09f9918e69671bbb12704dfe62c55846f6aa11f0c0e5dfccfb943111e6a4f5fd7983d37a3439b970fbe8de0d936dcdb0a901dc6ea80a185ce9d532bf05b61e01cf71d87ad25e181f2a87fa70e576acc78ba403ca8ec01dd93d3c8e4d75fbc19b1da53cea2f47a16238148f814553ecb5196a3e8492fa9e9d366f16e485b91e15fb60ce54b8ed222c4ffd61b3ddb6ba985d4c655a0fec3d64e5cdf5e049f0b1fb2dedfad3a58d49ae7aab3dde2beda978f3de44d47343d59b5c307fa2cdfdc3853d8eb0f5655b359a78e378c6045894d5b37387aa27456dbb0d1021fb086cd4637a333fb3cb6ebf517f8bf71a27ca86d73b5fd0b8f0e75fa1ccaa54d7ed8685bf85fbdf8385bf8392a09760a27d2e222232d024c5b6f91046148db64669cfd2f6558cb5e26327397d10867b4f703ac642fffc576738073870306cee5886ac0bf38a992344c3bf036a3c505000a74ed938990f36bc038fed87076e8a21908363d8762071807f2c35254485336d280cb8a575a3549c3d8761f19b503ba96f8293304171d0351d5e9e0b7563a1b80f1a0b7f119d6e103a0f70c043c590f22514e7f76d707267417184071a5cd3606922deca7080d3117fa33667ac8903b9199dc74bb84109dac6ae1e5e93bf48f19691bd69007486fc25e996d6ed4864baec8911909b0c5549906775e0f77a99ef82a7ef84b276583121cab62db0f235d8701a9625e27851780f41653aaceea302bcfc001417f5cdb96255b30f464d310f30b96de429b59fc092f7216b6e0f4fecb0fe0437ab5ae18d46583a09e88db79b7a529e06866da0bb18cbb438155d0f6b8643762f3c84d45f6937305ddad20bedf1de684ff528ef4d4479da83ef1131ec3186adafdbaa91f47bf974b1d4937a41b7a862a31ed39bf9594c06481b239e6b9c1047e1997ac81e0b2eeb5a79be869c1b619e1370c392b7a0ee723870339497c1923721ff7e9837d4c6e722222203506c03aec92348996695a21ded9c8b750a9b8e66ce7c7a86b39ca43dc6e9b07c8d6739d7014392c0316d3429c931cce9791c2abc9097de3968e1ae8767f6429b17ca0f42d615f0ecb7cd136c659be1a15de0f5416919948f84e7ee811c0facdd010d3ea8dc07de4c78fa0e284ab51f144f3d3c5405692ea86b87476f830227d4ed83257f849a76b86701fce814fcb812b2e7c09ad4f09f6dcc07f77ef8e76dc018f07aa0f02a78649a395fc57bb0f843f038e0d97f00de374f8cfd68313c9201551fc2e22a28ba155e9c65ff7b8453f12e2cae044f123c526c3aa3b69e82e239f05c7e6745d0530f0f7d04f860fbd7b0742e3c32d97c56f509ac3f6ea646d974126ebf11d6cc36fb96ff0996ec006f0a6cfc2718f5112c7ecf748cadf911ac18618e59fe2194ec83fc7150b113ea7ce04a818716c32301e16da88325ef41f9195834079e9d0ddea3b0fcdfa1a205a8835b5e80fc4278f6f2aedfd5bd1f16bc61eecbbc39907504d6d743ca3858730778aae199cfa0ce093fbb131e9860a6585d5c051e1fe45d092f1743da11f8f19b702a0f7e7f1d547f002b0f40f660283f028ffe9db95760e2c9631f41f25868fb1a8a67c2d65df0a3855010dc18f042e99fe0fe5d401ae4ff30c436a1ee61a2ce6f53b834515509f755987b97311d7e7f3d3c5f06ee69b0fa06c87302cd50f29f509704358720ef5a78e66aab51e681922d50371cda9aa0f8dbb0742cb80fc2e237a0ca0bc537434e3d94ba217b2a3c570c794343e701ffeb5af87ffe0815ad50990a1b6777c683b0e9cf4e7af0c1ba8d50720c567d1f568c0dba400e583a3bfa755c9a1f395f0b74743f2cd9095bbf86c22be1b91b3bdf62efa6033654c02b5e70b542e66c583d3df4a6d993202b090ac235ea3cb0f22d587b121eb8197e36dbdcab48691ea07637fcf3fb503f14ae9d12fa0db468dbb8f7c1f20f60d408a83c00b973e1ed2badcf22dcc3605e37dcf707286b86826fc3db33e0e13f40e971c8b81a0edc16e6bb07a8fb1c9694418d0feeb919d20ec11b472033d7e409d90e2b6fb6f2b607e642ed0e538e155f03cf5d675d371bdb40f8340651e24c3bac7b0bd69f05e729a86887b7ef875361cac83c8799feace420642741c31878fa3ac8b08ef3f0e7e01c075be641e99bf04a3bfc7e19f05ff6ca8d2e7c50fe1eacdc05ced1501c6ae0af1d366c83cab350570fd549e6bb5fe87488f67924edb0ee4df39dc880353360fda7a63c28be191e4f8727df83f5c7ccdb6b2f1477761687bb1ff19429814e9d80951b60fd11c8cc86a76f8702ff831a61f2436f23fcf835d8d008d9d7c2966c585e0ef559b0edcef0e551d4b48e492b0fff076c6a85fc2cc83c1b629b4628d90c352930aac574aaafba162edcce30e10e17370b1ae1bed7a0ac0972f2cd80e54bb5d07609ac5960d5019360ce0478c361dec2b15be6470a4fb4f2ca5b0d8b2b4c5a754e8207d2c3e44933a0a40c7e751470c0fd2f41c664d8f2edaec1a8aa0c3a5e2aacfd23acdc0fce89f0f81458ff19ec051eba0b1e89709faabe80ec69e0f2c0f2f5262e9002ab17c103195051018bf7c373df8779aec8f975b43a27cd50761a56659869fa167c681e66299e0b6bc6c1c3af437933b826c33bf3c0b9dfe40d3fbb15def90f13366706bcfc3df06e83fbaac1eb80a5f360cd2478a20caab2e01799b0d44a4bd9b3e0ad9ba1f48ff0e461c005cf7e1fe6fbcc9223d9b7c19acb001fbc5107b7df157481ce99297f976cb3d2de5df0c038a8dd69ee419d0f1a2ae1fa5d261cf9bb61c1fbe61a3c721bd456437923e45c0e2f16c22bef41e917265d3fbb008a223c4ce539087b274051a8d65a3f96a7c1614b4899e635cbc2dcbf1b4837612edd6eaef9d26fc3ea803239529916f1fb37c2fd6f43dd303875086ab3e0c802280f57a6f9c2d47fbc11cab4c550f35694b41869ff655044847a572bacfd4f78a5050a93a1742f788742860bd62d8077de847547c1750abebad3ecd2e37a2a7449bb60ae6fb836b19d7ab6ddfa4b60baf436c2c365e658aecb6155123cf139a48c8155df817bc2bcd9dae3b6e3f720e393aeeda98c2fa2c7f970e5549155dfbe90f76223eeda4c975595b0721fe48e863a2f2c9b13705decd49bfcbce68def75b5d036dac48da501db07873d5ad8c2960ddf838ceaaed7962a58f09e692be7e4c3c662483b0e0fbd0e6eabadec0ad3368956a7f146680bc412c701931637c13347207b5ce87670b43a8e9d7a925f2c6d376f13fcf80fd675980d0f24c1baddd090020f7d178a8e41c90ea83a0377cf3169ddb30f1658fd4dce89b0712114f9a0e42dd8900c1bef825107c35f3fef7128a980da14c8f442460ea4d482738ea9f304eb568f09dac6db048f9575cdcfec943510b99fa94b18ece6439650fd46c45076054b48de1c41dc75c518dafe00554df0e2fd90e31f1c6d86e5ff61ea2500eea350db01aea480709f87369fbdcf45444406a2d8864892921972a132e4c3d716fb095bf734d3b6af25a6a98801683bd7f9ef742743ec3e0dda01a5db82d604390e8b5f852a17ac99078f8c878aedf098b50ec9bcb9509c8419e89807dbee358dee923fc0335fc3a3c5f0e25550bf0f96bf1fc3f473c761c146f04c8735b741e17158fc0eb881eccba0d89a16d0bd0f9e3f0aa7daa0e1ebc89f798f5a1db499f0c21df0682694bc012bade9cd8abed539ad4ff976d8da029e36683803f8a0620fb85be18ffb12338d5ed12cabb2eb835ae0853b21fb2c6cd80ae5fe752f1a61f146704f8117ef849c265399aff0415d352cd80cc9b3e0d9bf86a27653892db55e2f2b9e0199fe58eb8082cb21372816d77c682ac3a366c1b3c55605db012bbe0f8f040e6675984afa833743562b946e314f003ac7c1ea2bcc26ce6cd8725fe88ed78cc99dd35bd51c8315f3615596e9b85ffe3a245f09af5f0f6d8d5062752a16dddc39a0e61c693ae05d13a0280b561780eba869b0e65c032f2f8197674193d5f8f2ec873bdf80bac9f0e26df0f824d339b9e144989be184a5b14e879ac8f3db11214d1414c21aeb2100cf1918351c322f87dfcfb5065b3b4c9a5c9704cfdc09f70e830d9be11937d00e2bff00a549f0dc6db0220d1e7ecd7476644c86dbadf4547d08e62f80dfcf829a5db0e45d930e42e501b74ce93ed553d4f467273db440d941f078ccfac83db99691f2b50b7c50ef8017fe0e56659ab596967f12feb065e5f0e37df060313c37cb7446961c0db3f15898930e85e1a6737341ae0bd62c82d556e770b434ef3d028bdf82aa91b06519fcefd1b037a80089ba4d07949443fd0478e17bb0a5189cd6f58f760f833933a038601d71a70b16c5f8864ff654284cc5acfd770a1e9d0f8b52a06627acb3a6ab2e986de5dd1d50e581e7fe161e1d0565efc18f77d9df26521a8b1667eaaae1b12f60d19df0f632786474f8f491e7e8bc978537c39a5be0d4362b6e3961e90cd388f676c0ba6da693dcd30cee0e9be92448ed7658f22138bf05db96406147f7b790cbca61f96e28be0936de0e296e78f81dd35163e7f38886c2bd3956c74013344c82b7e741569b7960e3e1a3b07a312c4d81aa6a587724fafd88a74c09d4d0022b16c2eb5799b5c0166fb2ee7384fcd0990ecbac69f05a1ba164179c6a87060f3445280fa2a675af394769133cfdb7f0f2d550f775f76d1e7b0dd69e364fe0bf700d6c7ad774ca1225dce1e2a6732c2c1a6776af779b8722565d66ae6149c07a7ed76641fe049307d92df32385275a7955901734c562b83c290556dd60d57352e1d965dd075b21c4f19cb0c89adad5db086d53e1f7856650f8890fac78108acf943bf32e035cf0cccd9d1db859e980c30c3edc7bb3196c8d965f47ac7362eab00d934dc774c18db022dd848124c89e000fce30dbb559031d3919507c2ddc930dcf5c6fee97b7dd74f6cebbb97320d2990cce54c81f0fabae836997c12aeb1e3601992e78b4c0aa0fb541ca08708d85c25c78fc32eb5a344285038a833b7d4f40c550589d6fa5bdff32d7336736acb0e25a41216c5b66e2c4857aa90faadae18525b06808d454c3c2f7e0de3be17f4fb1e2644db81b636cdd0f79d3c274acf657791a226c0929d39cb0c82a2768869a51f0cedf40e119d3417c61fdc2087968b4efbf612bac3f074f2f802d7f6306beda085fa685adff442ad306db488b51cac448f5ae756fc2cadde62dbc3577c1a25420155efc3bb82dbd7b7d2421f554baa65d7ffd3b5c9bd84e3ddb56fd05baa44b677ae7b4ad9e23e0bcd6e49d7c053f2e0b5f76f7b8ed38a17b7bca4e9c0f574e015df35e1293766b77c0820ac8ba069ebd136e3f631ea229b3d66eb4536ff26bf340eecdf0ee5d907c14ee7fdd9475a1c26e276c61cb868eeed7b6a0001eb246249da34cfc748d851993e0692b1f0f974622d66922b40520b6380e50fa36acfc1ce6df055bee0267f01ac3d1ea3876ea497e31b6dd9c6970af9517341c85ec1b61e375261f2a791536a599656a72da4c5aafe8808c69b0cafff07d32e4a6022360fe7878e016c821c2f56b86fb7e0fbff2c17377c2b3d743d95b5072207c18bbd563427c87e0fccc4eba8bd4cfd42d0c76f32108db6f64bbec0a92a8bc399278eb8a31b5fd3179ea85c156a0fc7dc8bebe733aec8cb190e5300fe394b74065a3697bddedb4f7b98888c84014db806bf2601c17a6e9390731bea50a70aefa28a7aae318a9edf071deffefc10e06d998c3b676372c7c09eeffa2eb60a2f734d47540cd6153b118651dab21d29c9167a1fe0c780e417547e73e1e8f69acdb51bec374bee48c051c90ed02f701f35423744edbbb37099e5b009ffe83e95c8df459f976f32462569a35bddf68707640e98ea046540730015ebc173e5e068f5b0dc9a53799350a1f2f4ce074b00e2009e6e78273386482b97ed6f72cdf6e1a6d799700a9706f2ee4659ac6b0e76bf07440d597e6386943011fd4f91b318382a62f0e8ec13e28afb51afc56eb2ddb65be7f455dd0b649f0a3eba0e052c84db2c218ebb4acd6f9af9d61dee8cab63acb9d934ce764c648f3b3f76bf3a4340e583acb5cebaa3d56e7400b34a49bce1d6fb3799276c326f38472d1cd70bb75f34b3f30c7281c6f7daf5136a6728e2d8527fefc51444b13c5d743d150f07e659e509e736dc05b7b7b619d1bb2c798e96be6cd82bc0c98310c3c9f9b370eb3ad692fb35c4013bce41f44b3ae4bfee5e60db0226b8d9cbadd501ee9c983a0a99e6ca5bf28e98111f0e84d26fc8fce8cfb52dacfd71c5038199c4930df6a7455ed328db96e9ae017bb8131909f04ce1190e9830dbbc30422c93c455c18ea6d1c9f79c3db7d65d7b778a3a5f9f24fcc53af7959e689f08ca9dd1be851b769838656a8fbc47436a55c0e0f5a1de5b6f3d0a06b18f1671b921d66bfc25cc8180ae3ac0e847affb4f7fe6326c1fc7cc848817ba683d307e5bbac46b18d6d22a5b16871c6dd6c3a834bd6c3866678e8662bfe86e2334f74bb8798d9244885ec2150b5db8a5bfeb03641ee8db0f1efcc00c53dfe82275a3a093ad74bd69b6d4556c75af1d4104fa23703cdb0f504906c7ddedcf90056b4cfa349b6be93331dee9d681ea2f177ea16cf344f6a670e37e1adf7c7e728795ecc654a80dc2cb34f5e8ec9cfdc5fc0a616fbf9a1fb6b5871176cf97bd8360f3223940711d33ae0de0beb3de0cc843929e61a05afabe7de0da58da6532dcbd1d9b12381cd5700002000494441545af5319477440e77c4b8e91f30cc366fbd650e373f37042c29913d0d1ecd091df670a25dc748e555b7690223e449b6849a76d01f1f2f81bb332023d594d1deafcd7d0ce92bd83a126eb7ded8714d85452ea015d67f6e7eb7b5c1ac670a36ea687ea1ea9cc0a60366cd4f7f78ef9d69bd19bb17dc3ed87bc6c45def1128b7d6f4fb96d5a9ef9a0ec5a98007d61f32d7d99b66ce5ffeb91988ad4eee7ccba8f80a139f3cfb4db95ed368a5272fbc71c0ecdf3a21e0edb12f80cb4ca77220e718786036144d3069de7baa7bda0bbe0f17d6599f69cada0c2b0e5e9b0339499065a5e3ba48ed8e7678e328ccbf34c467fd599e86095b22ca34a7bf8e3f02964e07573acc9b68cef78a55ef88948746fbfe75cda6937bf19b503b0256455a1e225afd27529966272d86dbbf35c2799bad07f31ca60e4e12648f043cb0e958d071fdf73311f55482d2ae9d3671b47ab69d3a0eddd3a53fbdbab2ccec02d9d3a128d9bc5d571a6e4df144b41d43d4f3a2c5f988e55450dedbe3b4eb8375dbcd3dcdb606bb7346031e58f719b6eb4d17be5b867993d33519e6a462ca3affb5080abbad3cc32f4c7f44170e336b8f13a8f93354f98046689a640de0d84c9bc1759aec28e56e4c71bc114a0f00434dd9c050b83d6870305a1dc74e3d29f09ad86ebb599cd675c89c6ccace4cabdc6124cccfb2d2bac37cd73a7fbb7bb655061f8237ac0ca2d207f35d44acb754ed80b216c89964bdbd3bcac6baa776a64f8e23dd45ea670a7bfc28f9907f9b70fd4676caae6089ca9b238aa7ae186bdb3f88b71ed60d854703ebb413e0c1e9e0f4c0f2df415a316cbc3aa0ef31dae722222203506c530ab79de35c9b7fafc131af000be0abaa27ae17e2921c9d7586733ecedb1818cbb9dc4cfb59fe2e9407fcde39193e5c06a7869ae9535fb16a53de481d2829f0c272d3a0f0ee8292bdd6db143ef3b79db7086bacf3547d022bf782e73c148c03ef19bab404f3ad0e2067ba755c5f98cf7c50691dd3693d55966cdd13cf71f37469817fc724f396024076c0944019d3e0c508539dd812a9421d58d1ebc03c91683d21d766bd2973cf5d708f7f9b1be193cb207928ac7d172aad967be00bced1c2e21c62fddb3f426f5dbf51a1a66d0b0a7bc43860f3fc5d5815706fc0c309d933a1e803283f0eaf7c0599a720d3ea50744e328d9a520facdd085505f0fb39402b6c759be3670eb30ed40b6b14f5f5f923a68914200d1ebc1c2aaaa1b615b2036aded547ad0689158f72ae866d579b7f57b8cd67750760650bb49d81bc899016345593bf318ad5e8ac6d875a0f103cad6f28b1a43fbfe0f460292a3453c8f5443cf99acbba97fec19be08e66ef71a8e9306ff8946c86e40ec81c0f0cb6f2bf10c7cccb0af14b1f546e83d22a281c050434c2f222a5791fd45a53d73bc38deedbd92615e64d86f27d50be156e39042fdc4d7cf7b09745ba5ffece12ef0913b650b3c1056f13298d458b33793990f309d4ba61f96f61c51db0c67adaba9b56b3563a0e287d17b602a72e3153079ef2c1856831020a4698edf2c2adcb13269d743997d5099916e1a98f150b21bf09467961e5c7d040d7b047fb3ca1acef61b71e70818d32a51b278cb2ee53ddd7506d333f7465988e36e7082b2f08571e5842a675cbdee3561e911cfec19ceaa356fdc93f8598ff6f2b2e3923843b6cdc8ca04bda72c59ee746bd8e11caab6ec2e54989e4bf1ebef0339854ed83cc29017949122cbb027ef51e947f0a7559503dcc4cdd0951f2eb40a1ea9cad507eb2eb94dd39d321ef7da83a04eb0f8277322c3b052b0f4359adb9c68bfcd3370e857b2f830d3ba17c2f140d87476f86bdaf9be50eca27414ae0e0e478b83b0dd6369ac1e37c60f54cf84e256cdd03e59950784de7e6e55f40d15f85b848feba8e3590ea89238f08376b70a4fcde5b0f3563e199e078d4dfe569a4b085dab687655ab675ff6b4f98781c290f8d163fe7e5c21347cd03b9b7b8cd34e379e1c21da5fe73819d322d525a0cdadffb7984f32659f5565fe79f56eb61ce906561a2eaa9c16937863671d87af648bae9161f1c11d2a5a3f3ef8ce1268c7b1b09a86cc420d6b6631451eb5074cf7b7b9c763d50dd62be4b9affcd7feb5cd56ef0daac3785e21a0634770e687509bbcd3ce38230fd11c13272e1eef7cc94b8a507816350f82df399ddb4d9ad4e43847237c6389e6c858154abbe1542d43a8e8d7a52285dda6e2df0d226a83ddff9794eb8e95f233c2cdae64febe360d9385879044a77c38ae96679900c88586fa9b01e76c8f4a7977e588bd66be58911fb996c88582ec5d06f145c7675292e13d887d06341e5533c6dffc0703df111acb83360bb16f38631d7c3c691b0703b3cff21dcf3d7d6522bd13e17111119a0621b32ed38c3d963c06420c941526ab41dba724ccbe0929f66318c53343df5394dfb62d837753083fca13dd6d259318cba23141782276894b7d503ffbc05f2ee80a527ccfa4a51596bb1d4e5c2d3b9666d35dbfc8d621f64e584a8080754d85c116a32e13ef337aa22ad759011ef636201036bad218edfe40bdf99148aff3aec3d8e894b411aeae09f6b61d5f7a0b0d63cfd178b45d7c0ba06a86d00a69bb71a9c19f060ae8d9d7babb39d8046602a2c9d02e5bb617d8d79e3a2d83f854f8a991e0e6b8da2aa0fe1c7a36063165c7839278eb7e96cebcbf3474b1396e2ab216f27d47c05eb0ec21a7f9cb1f280dae3a613bccb430fd6672919b07a6e8ce18ae3fbd9497f7d21ae7c0d60288c0af57beb3a3a87c18ab9dd07646df3591d6c98f5a3364c837b02ca8f4869fe429e13e1dadad966e977c1fb8e992eb76e3f2cde0c9fded1f9f9c5720f6db11347ad4ed968692c529c714e34538eddf73654b59af22f331d1e09f504bebf23d967def45b1a54285cc8ff9ce13ba76c0bb847a1caa4405595f01266caac8abddda7568df67942c5500fb023ea32000e48198aedfc30cd19d49112ae3c88f456989f8d3419184effb65dbe539470878c9b761e9689978deb18b6bc0a21649e74678ccb00d811ee1ef860d341b87d41d75fe7cc82824aa8f80a4ade8739d777fddc6e1d2db8cee9d90f7b27414160cb231de66742d561585701ab16c3b567a0e43054ec30d32006767616e542c62ea8db03a505b0718a79cbaab4051eab8617ee0dd8d801f3a7c3da0fcdf476397740911372b6436d1d3c310ab6f807c89a60d35958dd9bf12746155f40eeb410f1e122284fc3862d5e91ca84a0b7f8a2e5a191be7f4e216c3c67a60575379a695273ef0bbdf662b4fa4f5c655aa86b1abc7f94f33e986fd246cd3120d3c485ec5c6b6deb087a52c70999767bd2268e76bd02defeb5952e13d02ee951db318c4875a850796f4fd3ee05d6f5e8529ec6506feac63ff86cbd751b1cf698c286cdfe08272c9b011b76c01b1f8373023ceedfcf66dba45b9d86f0e52eb1c6f144d47162bc6edd0c8551ed5073c04c09ec77ead2f0bbd8b16816941c819acfa07410cc08782a255c5baa3511eb522548b47e26dbece42b91ee9dcd7ce9a2697ffacfdf83b67fed0e935e56f9db803ef3c0e6daf3b06d22e48c81bb3f830d07e18f8df0405a94cfc3bdf12d22223200c4d644696ba6658fff51fea10c8ea5104c4a66cc53d792b9601c2317cc60d2bf4e252596e1def4219df5d5cf3db4c6322b712adc13f0c4abf7302c2c83ea71667d345b5ae1c7eba1f40c3c7a6d98c189481c30c3ea99a8a80d982aa415eae2ada43ae05b5623d4ffb68bff6fd7d8eeebd384e2de07cb5f837511d6656084990a07c0133c858907ea9da19f4a0f17e61956bca9da1db0de8ecf3c25585b65d6b8cacc87792342ef1f4d462e6cbc0d9c5fc1ca77cd1b1a5b96988e36db1cbd3b8d49f16c33d58e7b2f940f0b7882cf0de50e78f607f0ac35f570e5112015b286003e683add8b01ebcbf3db4c1335f59033d99cbbb4aa73bacf2c6b5a476f1dbc12302d9f37607a9ebafd50e56f84fa224cdfe7356fe1311472ecf6202620fdf9557c084bde840abb530485104fbee6b1ae73c60433a57530ff34585e37941deffc7d5d98f568c24a82a5c5f0b349982759b776deef88693e208e34044f5919cb363e28fb12562c80b7e75a69ef08ec25be7b98d20b6f97dbe1bf5fced1e1c3d6659ba4c8692c5a9ca9db079ea9b065b9b55661bb795322a414c84e063acc9b697edea6ae5333c79bafd67c024bcaa0cc13702ec0edcf8f42745494febb595febdeebcd349eb17e9e70bd510f0870e149fb762b3f1b01456931e487c1712a5c796083ff9c9cb6de1c0e2127c36cd3e6ef84ecb0fe4e863c57e470c71437edb051e6dbb98ee1caab6ec2e5493e7a65f68a908e43f910284e0bfabd0b964d35612c3f634d2568895a478ba07c1f144eed7e9defb6d6426e4a83e214c8ce8182a1402b145cd6755b6796358d651be44d019260d134135632ba0f9c1558d36b7b813993cc36f3c6021d66ea437f58eaf69bb5fb429583913863dcdeb60e283f04c5a13a8bfbbb3c8d14b618d929d34e59dbe48c31d73b521e1a2d7e56ec85821be0c37bcc74a978a02accf7b45bffe9695b2178ff68e72d9a0b2fcc86ea6a58b90d72be0d5bee0cd30e4b503db55bda8da74d6ca39e1d1c1feca64bcf19c001b911a6638d26216dc72061cba910796f8fd3ee08c8b71ebcb870afad01dbdc0c70daac375d10f099a71d4882c20921c26e276c712a9a6deebde720b8a674c63fdb6d93e0fb1ea1dc8d358efbc3401bb8831f3ab2ae9ddd3a4ea47a52285dda6e69f0f6ff092d2b3bff6cb9368683859031c394c53441c971ebdfd6f70ad796cab62e50430fdab11054d78f47947e269aa1a40ceedf11fea1453be5921d5dcaae10e14c541f42a2c5ddf6f798755e2fac036cfdee8d06481e6b0ddc0e856c6b8905926c7c2e22223280c5589cfbf8fa3fdc989999863064d29028db071a4a92abf3748ef46406c7d0a93478fc308658613873210c218378a102156e9a8ffa7a33458ce7083cb11dd6fba751f49aa95900d2accaa5fb6b33758efb186c6f015ae0a52a78c6bf2e6c3becf5570aad4085abc05d1864db0d8bdf85b2cfa1a48a0bb5b0484f9c86fbecee6b4c47719df556525d9399726ae9d5dda723eec607a5ff051b3e87c72a23bc2de3ef7cc34c95776150a815d66e85c2d9dd8f7be14fc01437fee3df7da509b3f7282c2f83d29d66ca929a0ed85a6fb6dbfb39acadea9c52a9a9d96ad08c346bd471161a5accda2ed5414f887af6c3e2edb06a21acfe36acb901f2424cc916f28fe5c21452ad50df64a6ff8d28f82955eb6feff9d06bfc3ab3cc5477f8a038704ae70e58b715ea9260e92d509404f919c050f3a4af7fad324f07947d11e2d8c17130d6a7257b7afe80f3da193f889626bc6e28059efb36e4259969ecd61e349f65cf84bb5d403b94bc0e6b77c2dacd50da04d9fec66223dcf78689e3eb2aa036a8f25eb3df4ca55b77086a7de62d8139d61b2fddf200e836d558d4f4e7df36427aa0199e781fca76c1137fb671d17ca1ff6d275ff3ef73d4fab9fa28789df0907f0d677f83d47fff3260d978cc144165b076376ca8843f7e6d239c41e16b73c00fadfb58b70b4aacfb182dcd175f61a695abdd07e52d50f5a9594f081f1cf5af3964639bf24af359c1b5b034c34c3596ebb0978776b92674aebfe76e066f8b990ab3dbbd89a22d38df098a5b81d770eb3e73ee8a7af03acc1bf11936b78994c6a2c6992628d90e5e173c7ebd99162dc7ea20e8963e9260e915261e956f85877798385d72d09a2a2ddab589944edae19977a16c3794d460061cae3053bb6dda653adad7edb43adfdba1a103b0ca137cb0a91a9efca473cae086e3260f8bf87994e042e7d3e85e7f1c09fe3e017ffb3f8f96e785db3f5a9902a64c04701f35eb7acdbbde0c4045cd0f03060fbb08571ed8903d038a52c0db00a547c0bd1f5eb1661a396585337ba6b55e6813d403de5366fda8826ba038294ab823c4cd70692ad2db0376cafc68d7315279152aef0f9727916cd625e72cb85ba0fc20dd852a4bfcdfef5cd0cf61d47c01cea9a1df5eb8db8aa7f367777d8b316a1d2ddc39bdf08e1b8a433cd8e11f602d9e619dcb058b26050cae06b206589d6361be75bf0b724dbdf0ee505fc41a60cd9e66bdb9e4807b6798c187f9d99d9b951f08aa8b41c8eb195c16f8e34dc369a8ab376b8b5a5fd7fc6d1dc35f6dee160703d3774079e03d025b47057dff8ba43c0d1936125ca635c3a6af8076a83882994eda7ad330521e1aedfbbb6bcddbd3199361d54c70a6429e35b8d5ad4c8b56ffb1335815292d86db3fca79abde83c7dae1f505e64dfb55f9e67e853b7e8feba9a1d2ae9d36b125523ddb7fee70f12164bab4b41d31f1d3eb86ca16b3d4ce22ff74b0c16da144b41d43dcafa8713e4c39152aefed71da4d8215579a7ad11e6b4aa27a6bfa9f07afc05ebd29f0bbb558ed1e6baae2ec5966bde85061b793afd81ddced2203964e02e738b8775cd7df474c9be1ea34842977dbe388e3195698dae1a55de06982526be6b6b65673edecd471a2d59302af51d8b65b18dea0381ef6ef6029b0d47a90a9f0b2ae758070f596db6775c6819a76a8fddca4f790fc6568b4ba7ed03e7ed1d25da47ea69a9df0e46e28ad803f060e94472b977c61fe048b5076054b481f4238e1aeb1ff9810be7c8ab3edbfe13d28bc31681ae054c84d0e088f072a3c9031c54a1bd13e17111119c006ffcbbffccbbf44daa0a2a282ddbb77f38f39c738f13e9c3fd846f2c22c86b90631e8c4311adf3e13589687e76ba7fd6412a985a318dcd2c4c9c73fe3c44ebb0b73c2f0bf9b41da1543e0d8971c79e42bdada60ec4d5db7711f857ffb04367c65eadaa73a60cc30983cba6b857478b2997ee58403a64d869f4e81ad7566cad4399743f650c849850f0e41e561983c13e666c08923b0cb0b63c7c0ff718d99fae7f059738cec2678ea13a8ef00ef2028cc8289416bf938d3e1c661b0eb387c7c08f676c03fcc81fc21e0ae83a7aae1c839e8180c859742a6359e1de9b3a491503c16aaf640d957507e1416dd0affd37a2ba0ea53f8451db49d870e27cc9900c3fd6b400c82a433b0e918145f037f7d49f8eb3f731acc3a0f7547ccf46ceb3f87b2c370d5f5b02260bf8aedf09b435687f02898ea865f1c809673c050b8351b468d823969b0f704fcd96d1ae23fb8c93c6d3e06d87c08bc43a1301fbe371436b9e15c0acc9b06a392cd5b5bef1f81f2fd668aa1737550ef03ef30f8ee24a8fe08d61e807ffb101e7f1f1eaf84dffc196a8798fbf8c14701611c0d538fc3b35f584f5e279b30668c8241c761c711a83a0b7f3f0b4605ad4712785f5a1c70eb58f8cd4750d3022d1d306b027c5c6d3d1d780e9c99503cbaf3da4ff2c22bc0335783ff613edae0975be0a9cfe1e37a389d054f5f0f631c907d298cf1c0e63df0db033035132aeba12d05965e0543be0c8a83e361f327b0f118d001ce4ba0283dca03833d38ffc453f0e447f0713374f8207b22e40f8f74b2c869a266373c500e0d23cd3a65557b61ff591367322741be0b6ebf14dcc74d5cdae181c2abe02713acfb380ebe3861d672f9f894691c2eb2aeff073550d10c7993e1cf55f07fed319d402fde065983cdfd09ce0366359afb5ddf01a71d503819b2d323a73f3be961f81038dd0095e760c5f5707584a9da6bf6c1afaa3bdfc838e583cce13075b88d7c6d9069fcad2882fd3b61731dbc750a7ef41d78c0ea34d8e01f743b07c32f81a23170c314e86882bd6eb38eefa8cbe091e9f61e3cadf0a7b5f3800be64d84da5af8f88cb9df632642f188c8693e730c142641753dfcea33489d0e992760cca5e63b658fb3b14d267cfc21fcf74fa1e608540f869fff15cc4c8e928786ba26e9903d161a8fc007f5b0b9056e4c85cdc7ac743f1972a3ccb15eb70f7ef119b87de01d0c85c360dd0e2b6e0d823953201358bf1df60f825b27c06ffe137e7d026e2f84e7aeb6cab48ee8db444a63d1e2ccb853f0c86678ed306cfe12665e63a6704c0a913ee68e84899360723bd41c870f0ec3a911f0bf0a60d459931f979d808e73e6e9edc2d19d71286a3ab90c8634c2d616f89beb618e75aeccd350f139941e805ba7c3172d70e324183118f2c6c28816d87402860f874537c0a46350e585d431306f7c94cf33a3c4f17628dd066f359ab8913e01d20ec02feba0e53c300cf23be017d570a403ce0d821ba742d625f6ea01b19429d50720af00ae380abfae83d70ec09c1b61ed6ceb3b44ca0f9be0c92aa839630673274f8099fe3c284279105532cc190b7bbf820dd5b0cb0537001da3217f1838c740f630989b0d8d5fc2bf1d346bf55df62d78fe3aab4c8c10eeb6e3a1e366c771787c3bd47acd7d28cc84d73e828f5b4cdc9b960d3387750fee701b657ea4f0442bafdaf65871c31fa72799299a43e549a4c2c476a86a808aa330ef6ac80e7abeb1eae3a0e365c0fa4a286f828eb33076121cf90cd6fbcbff0c280e7afbebb75b616a01dc10a2cc4972c10937fcf5753031e07e47aba3d55687ae737a0fc02a2ffccf99213a889d70da0d575f63ea7700e3cec117e9a6433758e610f8b3137e72a915d69170f830cc2f8489c1f76c108cf3426b36dc6ebd81336618549d81476758e9a3051effc8d443b3fddfd50b2f549935fd3acec1a44ba1e13378d95f1658d7337bb41948da7e181a32e0ef27c0c71fc32febad726f38e49f835f7e62d275db20b87134fcc64a736d1d306d0a9cde03bf3ad8590fbde4041c98007f1f30c870b194a7a78f427d50d81256a69d84a77643db48b86110fc8fff84ad83614531fcb74956748950a6458b9f273e8747fe0b3e70434523fce036f89bd184acf3cd754141b8fa4f7b8432cd0b2f7c18252d8e88b0ffa008e7f5c16fb6c05b75f0d4fb561b673bbcfc059c1b0379e7cc60ddc7a7cdda9f1327c2d5e37b564fbdc9074f06a7dd6191dbc405236dd4b3a3d55f42a54be0c8413338953a1126d7c13f6f83964be07f7c17ee1c01eefa10edf1d41eb61dd3e0dfaabab6a7b24fc22fa3c4f9b4a6d0e5d4cb5bbbe7bdd1e2ae9db43b7512140e86b29d50f525bcef83fff6ddce818ba8f5a674701f825397c14f92e197bbe1df77c3a0e9f0db6f9b357843951bcef4e8610b5736d06e668308d7569d36180e8e81bfcfec9aaf874d2391ea34e761f3b6eee5ee654742944fd1e2b80b6eb8141a8fc37fee82d79ae1ce4ca81b04451930240566a645afe344ad2739a2b4ddc2698235feeb700ef22f852a7ffdb10352c7c388803a6b470a7cf7d2ceef3f3119361c80076fed2c97c35dbf99c9307c2ce40f82cafdb0ee3368cb808e7a33d07cebb7a0a0ad7b1f41dbdea07acc641872b2b3ae5f18223f1b75347a5933714cf87ea6510ea8d80fc3a7c0c33361948d76d485b217c2f61b0db75176058bd68767ab0f21e89e47bdc676ea8a6322a4af30d1cdb30ffeefb3f0f8e541db0c861b27c0175fc096e3f06f3b20691a3c771b5c36d8c6e722222203d8a0f3e7cf471c2f2d2929e1d5575fa5eaae5dec596d7e97fc836b99fed438067f759003853bf93a96e97de391ec6262c51cc64c3ecbe9ffb6992f7e6d4e3863652f9f570624ef7158f27bf30466174361cd0f61458cd3e0f59aa3f0f0715813fc86b05dfb61fc06f0a4c1961f865983aa37f5f7f97be0c9df9af569e6dd052fcf8abebd489f6b8585ff0ae5c0ea7f30ebdcc4b58d8888487fb3535eed83f1af82271db6fcc3c0aa57f695ba5d70e75b6610a18b0cd8b62cf669b17b4bd47a769cf597aacd70cb7670e5c35777242ebc03a6ed28d2177c50f22e3c3a37ce69d3bdb0f0ffb5d2f77d17f15a9c896a477dc3cb2e773d348c83bca1d1b7151111f9a6886b76fcb6ffef530e17b9c8ba7b3ce977efe1eb3f9c8dbe530f0c2e9e8c6b329c7dfb530ebdd4dba3bb32d055ec80bacbe0cfb79929a4bc1d50ff392c7c071ace00fdd9686e81757f86395742f27133558f888888888848581d50ba03f26e838ff3cd4088b70d2ab6c1923d66760a89cf45dd7614e90b3e28df01e440b117d2b27bbe46b57c3364648559475c4444e41b2ccee5c8cfd2f45025c9e93770c94fa73372f39ff9fa6462037681cbc5b84726e1a8fa33071f3a4a5b47f45de49bade638300932ada7ec9c43216b9499b2cbbfe6577fa9ad8687df871569907306ee8d307d6c5491d6c3e90bfd7dfe9eb0c21e6e9d67917e67276e2afe8a88c84060a3bc8ab446b5006d50d3689692705a6f503953203b15b2a65d646f5545ab67f7b4fe92e0facfc5dc7614e91387e0e177c1e5058642c1d53d38562ceb8df6a704e5232abb44444424589c03ae404b330d8bdfa3edf1ab18ffd27406fde4733c8712183280f1a319ffaff9a456ede08bff7e94d6e0697e444278a0189ade87fbde84cc61908ca904affe5eff4fb595950d4535505e0945f3c115ef813cb0763778005acc9aba79b9519e446d84effc0eaac22d9d3c1856fdadcd697f6c9cbffc2d58be377c03c4950b07eeb471ae0473ef874d4de6dfd5fba0621214692a564910cf4e98f1a7f0f13ed905afdf17bd63b46a27545b1d019b6aa0b810729cb16f2371f0c1ca17e0579ef09b14df062fc73b1dbc88c8374cd4f2ca0bebf7589df3cdb07e1764cfd65b335da4c29a3ba1a41a96efef1c1c6c73c2c678a7feec0576ead9f1d45fbc8d505a6ffeed3902eb0ec38a898909f3c5dc7614e91397c0dde3a074375416c3aa787b09dba1fc93cef4bdf533b8e746f3e6f8c52621ed28955d22222212425c6bb8061b72d538d2bfd5c6f15f9f24dc584eec1c0c5f3685e4cfea69fc38f494c55ac35524063e7037436bb8a7391d9036025c09ea58f0b64243a4c75a9d909d929873895c34daa12ed2c341499039e2e2e91895d03ccdd01461468d9454c8d05a452222222222222222226289e959b3f0039c4701484be800a80ff802c6c1257f95c8e38a7c43392023ee576a63e74cd180aa7c030d856c0dc40d78ae113d988140444444444444444444be7134498e88888888888888888888888888489c6cbde17af9e597f3f3e4bfeeedb088888888888888888888888888880c28b6065c77efdecdeeddbb7b3b2c2222222222222222222222222222038aed355cabeedad59be1101111111111111111111111111119706c0fb802ec59dd5bc188cf8c95fd1d0211111111111111111111111111f92673f477004444444444444444444444444444062a0db88a88888888888888888888888888c44903ae222222222222222222222222222271d280ab88888888888888888888888888489c1230e0ea2065f174263e389ac151b674fe209fdc3d77317bcf4d642d1e16f5b8c31f9c49e6f747443dae88888888888888888888888888487fe8d980ebf8318cdf3887aca2664e3c7f927391b64d1ecdd89f66e11cedc0317a34698f4c656472a41d7c9c7efe2067e75ec5f40dd31979498f422a2222222222222222222222222292705f3c4ca40000200049444154f10fb84eca206be375a47390ba7f3a8ab7cdc6a992027e4c0abb61a7b633343eb89da6e139646f9c8d6b7cdca1151111111111111111111111111149b8f8065c934790b9ee2ad226b5d0f8c441bc1d36f639d7ccd943013f1f6ca62dea202dd07686634f1de0ecb4c95cfafc645222be152b22222222222222222222222222d277e21a701df6d37c2eb96a08ecfd92a68f6deed4d1c6e9cfce5cf8b1edb3939cb5b9abafe24b3cfb6070c12c2efdc98898c32b22222222222222222222222222d21b621f70bd641c99cb46e300da2a8fd366e7ed56cb994aff3aaf673953d58ccfee8e1dcd7c5d75067090f28fd3491b28ebb9b6c386b7207535a43e0f55d617aed80ce3d742c9e1fe39ff80e6839ae3013f37c2c267e1ca32a8ebc360949541ea5370cb6bb0fc5518ff84b9ce335f86e56570fd5a487d016a225c73f76158b8d6ecb76457986deae13bcf986d1656c71150fff5f91378006f232c7fde1ceffaf7e2385e08b57b03c2b833fe6decaad901339f80d49fc393c7a36fff4d53ebeeef101889bce7038a0756fece7ceff1eff4e17983d27a34ee23f0f04b5638dfeaedc045e7de0d573e03cb83f3c216a869e99d73c65c1647094b42cbf646b8e5b750db47e576f95bb07c6fdf9c2b56feb055bd07e3579bb277437be47d3cee9ed5092296bdd6bdf9ecf845589efa60e5af615d7362c2d3ef82eb7c03516fd653fbf17edbce337aab2dd2014fbe0ce35f80f2d6041d1370ef34e5a837c6fd1251e7e9768c76d8f00ea4af86d45fd9b87661ca8d78cafb3e6bab46136f1c6f86b5653d8b77a1ae9b9db6db4011aa3de5af8b2ddc1166a77e6a7707f236c2f25f997b70e5d67e0a841dfddd0f2422222222fd26e601d7e4ef4f61b80bc0c7d97d310c9a02beaa13b4b6016d2769a98cade5d3fa9975aed1e3495f3040e6151e0af7e4822bf0773ed85a0f9e16a8f8aa1fce3fc0d57c0825f59d3f7bdc50e181da837dd7310d80031eb917b67c0f5ebc09b2ad5f5f7b25bc380fb62d8579c3221f226322cc498bb24d16dc9e1e7f303d47adeb530f753e70a6c3fc8cf88f174a4e2edc3ebae7dbd895370bf2e25f7dfa2f9ae7202caf8cbda3b03724f29e0f282e983fb1ef4f1b9cd6a3c998008bb27a3f5c76551f84da56a8085c7ac007ebde81374ef7c209632d8ba38525c1657bdd7ef066434e5fe4751d507604eec8ee8373c52a206c053320dbcef5688687caa1be0775824865afffde5c31f6222c4f8f42c57028fe0b990c26b8ce3710f56a3db5bfee772c79466fb5455a60eb11f01c87ad271377d88a7d30672a3863dc2f11759e6ec7180af74c05bbadde70e546cce57d5fb655a389378e8f80072eef59bc0b75ddecb4dd068a50eda9bd87acba587de887f7faaddd1da037dab2bda29ffb81ea76580f6b04fe7902565a03bd5e37dcff322cfc13dcbfc1b41f03ef79b4cf4544444424bca4d8361fc288a2d1d628ed59dabe8ab1a67dec24a70fc270ef094ec7d8383effd519ce010e1c0c9b3b9621eb06c863810e703a022aa80e78a81852be84e2fc7e38ff0056fb092c791fb2e676fece351d5e9e0b7563a1b80f07e19c93e04713226ce082077363efb0096970fcbbbad220cb010d63033a607ae33a0d4ad0367638ac3f7f096f6c2790e7302c7e136a27f577480224ea9e4b5421d3fa009233d6e497b9fe4e349f79b3e7b1fdf0c04dbd70c258ca623b614970d95e7e008a8b7a7e1c3bbc87a0321d5627a4c04aac2e616b267af9d5022b5f830da761594f4f1ea6eced726f2eb2f2b4661f8c9ad2f910d84016aace3710f5663db5bfee77cc79466fb4455cf0f49d50d60e2b22d5c763d10a6f34c2d278eb5189a8f3041f23863893b072a3afdbaa11f4288e0fc0ba509f0ad19e2aba1ed60c87ec3083d5fdd5eeee66a0dcdbfeea076a87b53bc0950e39566f9ff70cb465c1cf269acf1f7b0d4a1db0e55ec8de09979743e644586de773111111118928b601d7e411a44cb36ab81ded9c6b8cf16c1dcd9cf9f40c6739497b0c531103f81acf72ae0386248163da685292bb0fb87a9be0c77f800d8d903d1b1e488275bba121051efa2e141d83921d507506ee9e03cfe583671f2cf823d4b48373226c5c08453e28790b3624c3c6bb60d44158fe018c1a01950720772ebc7da575cee3505201b52990e9858c1c48a905e71c7820c4db11ee8366cad98a56a84c858db3a37f77f7bec49ddf960ed85001af78c1d50a99b361f57470ef87e56f41450b900e2fde050dff05eb1cf0f8b7615e7ac0bea7e1d451200b9ebbcdaaec8739aeb7111e2e835237b82e875549f0c4e7903206567d07ee4987da9db0b8c2bcb9d55009d7ef82a5b783f323b87f179006f93f840207d00ea59ba1b419720743c370585504794e73bdee7b0dca9a2027df74c8be540b6d97c09a05509c622e41d587b0b80a8a6e85176775bf44761a4905f9264e3eb9031a7c50b90fbc99f0f41df0ffb377ef7151d5f9e3c75f023a83a8e31550135013f08a95172a2f9818b66978296fb999ad9b5bbb6b76f95ae6b78c6dd572bf5a6ba53fdbb26cb1cd6bb9ea26a9056a29622a6028e085c11be07554624607fcfdf13923c33857c44bdbfbf978f00066ce9cf99c733e9ff3f99cf33e9fcfa76f50d565cf9d82a9cb60e931088d80770642cf40d7ebcedc0549872122008a9ac23bf74288b38bcf10880d848296ae83bf997b607c0ae83bc0f45e90d0480da7f8ee7eb09821e530847786f9fd2a7b17998be1856f607d19740d87502713327b5ce6343cfb1f28a80be78e406e381c1baad2693e0d499b2033101a96aa9b2dd37b80d3079acb60f697aa178cbe1d1c7a04be5a07cfee57dbffc3935ef48835c3bc7fc3d483ea3c30b30d2ccd86fdc0e4c130a5a52abba3bf82743324f48128a3cab31177c2820488a9e3dd32009820e95b28a80796b390d00fc635d39272565d24bbca3369dfc3d44310e10f29c7e0e5276052058c5fab95cd02786011748d85f91dc06484c9e9d0c8000597e0e501d0530f05f930463bf78d180a7f3807cf6c878838985b17c6ac5643628fe8038d8ec057c720341a3e4f70ddcbcc9b7c91be0b969e54dbb9fe0c0cec0573bb54e64f4fefbb93fe3d0cdd0a263f98320072f740ca6988ea009fc4c2179b61f101086c0ef387425f5b1973713caa53a75449a759f58a5c980b96c6302501c6d96562a7e5f8122c5c072fe481be397c9b088bd7c01797e05f4f425f938b72e34559a70ce6ad87778f414473ed7ce9c8cdf91370791e07e779738ac173d902886805e101d053fb7ff52698bc17cc15b07835a4348005239c94e56ad657b1e79dd4c52ece49295ea4c559dd9ef61d8cde0ea60075ec737741ea3948709657ec5d80d517617a1358b852e505fc60c443b0a00b18f7c3f8f5d0371166b5767fbe7657ce5769f558fa0188680786b3305ecbeffa10f87c38987f80a7f680d90fc625c2dc56f0f66a480f8797ca61ec36752331a13fcc6d0e2f7c092917c0d01abe4e04fd41b50f5e8987afbff17eddffba5fddecbd9a36875d545400633643cacf30320ee67751f93b69357c7842edaf673f8590d6f0af3018fa95da078971107e0c961ad57960ee4360da03ef6643811e5e791826b90bded88e8d8bde35b7ac3e05a880af0a60e060efda3ab7739d9658eca4cd9708131bb9aed3d236c3e86deafc3f7f02b015920ec21f46c30893e73acddde7a784b869775540ca3648ca87aecd212d4ba5db1008938743c8ae1bd34eb53fdea0d6b9ec07d87e190a8cb02740ed9b892dbd6b677bb38ccdd5726986c529f06c0ed044d5d58b77a8b234ae1fcc6ae7bc9c14e4c0b035900b4c1a0b93ad307a05a46be7a94fa2b5e5f6c30b3f80be259ccb87b40b6abfc6c5c1736695478afdd443909382bcab6b9cd6535a79361d86fd2da1af76755c2365d7437bd6abb26ddbefe9307537ecf783717d605607bb371dcf4d1eea7b7775c30243d5fa6c417d18bacae15a1998bd0e16d756d7ca5101aecb88dbb215e0fa5ac0973c8eb67cca6698ba17f48d21c1d979da531bc79b7692c6a76bb74bb0708d569f87c0dcf6b074b7daa7097d60661398bd199696a89ea78b1220e22c8c59aace0504c1acc760523358fd1d3c6384058f41a2d5cdfe33c3c234587d01a27570b6193c5406a9cd60be936b5bf3597875352c3c01867370fc61c70560f186aae7b398d35e9eafdcdd1fb0e3759d6353aece41b37380e6303f51b5edd3b7c1e8cdeafc30a93fe4ee84343324748705f7baeef9ecaebc16e455efdac871fbaadb567455f739633a017d47c25c5b6fec0a58f8a5ba3f640030c1f652751c6d650dc0623bff787a5f0821841042b8e5dbf381013a6a5fbde0aea0c2e2fb1796edbb8025bfd4f7ce6996f2cabf9be8a9eda481a96f04a3b4a7928b4e40442f5875afbaf993b402d63782558910658165a9906685907630dd76d1a183e820a03e0c6901931e80282029058c2d61d170f83601f4b6b9c32ec053ff820f2b60c1c330ff3e58bd0e920eb9de8c90d63e0e3965add9eff7c6ea1478261f9e4b80059dd40de6a41310d2163e89d31aea3f43593dd03581cf8768c156206583f6d987d58d96f43df0fc1ef7ebd537a91cb2c9740cf43dd476721c9ed12e6ca2bac0c4e66a999eb12a88363114c63919a66cd93a753138f22198ff1bd0ef8587d6aab966f4cd60a4b61e6331f4ec07d3dbaa0bf724db3c6d1590b60f8acbe0dff9d7313cab159296c3bbe7e1e504f8e41e30e6c3f8add7aeb3a814260e832fef5173388d5e0faea6e22cd8034337416c1f98fb009cfb01c6ef72b17000c4855706319c896a0a31dde0ebc1eae63027b51b5f06989b08535a40da0e78d5365797195e58098bcfc23bbf85cfbb41c17987957ab1ccb254585a0eef0c856f1f87be7e60d13efbea4a987751f55e58d41dd67fa76ed638150889aded8217756064948fbd8bf530f2ceca60afe54ef857ac3a77bcfdbd3a1621ad61a076e1bae7080c190affea04997b61cc77ea987ab30c9760ea72581ca06e364c6ca4f655da253ce79913f0fc5688ea0e9f8f81cf3bc1d9cb2a3037abb3b62911f0ed532ad8ca497593cc1409730740ec4918fdb5da9e88b6daf1463dd4f1ff4ec0390b149d573736628350f3e79d839787c0c840c8cc8285ae86c0f2e298dbf2aeae13cc7f14fa5e52374a169bbc7bdf939e1d205abb019e7e09168d8191b5551064d86618f530bcd5462bef99da87dc1c8fead429f62c2688ee03df0d06dd0978f64bed38e3a61ceb615c7b2d2f5a61e10feac68ae902145bdd941b2fcafae2ffc0d43c183218be1d0c7a2773a2b93b7f82ebf3b8abbce94dd902a019c4358158ad2e49ec0f090180168cfb6194f30727aa5b5f39ab8b5ded5b6fd2e26c7d7d3b6937e02a546061d1c31071597d4f8a9b39488bf3a1a835f4ac0313e3a1af768331d4a0f663544be81a03d35be3f17cedae9c834adb6a2324b6051ac1bbf7a97d66bea41ef24aec53197cd0eb401f045d5bc0f47be1815e30b1895a070110d1129e6baf96b56801a7a81048e80123227c5bb7c1316df6acea26e7737d20bc0c167fab7ab91108d3ef87503f2008e63f09dff653c7c6361c6566094c1c02d3c3d57960fc97a0bb1bbebc0f2ca721699bfb5e78578f8d8bd6f3adaa4f01380d697e90d0c4bbb6ceed5ca7396df369fbd3559dd6f72ee8aa1d97941d905a0a260b14fdec5d9de6eef3eeda5d99db54f0bf6127989f00535a037e30f13115e4bb21ed5487e30dea5c383e07127ac3aa8110580c2f7caddad0deb4b3bd5906a85a2ef53052abafb800990de1ebc721f66715fc9c77d6493e0522a2ab064e425a415f879d6436c2b0d590d648055ae67753dfd3b5177cde157ac6541e2fc0bbbac6553da5493d0831edb4eda9a1b2ebb63deb6dd90628057318fce7b7907009e6add3ea5e8de3b9c9537defae6e70accf425ac32cdb03c2b66be520e8d90ca6c4aba099bb32e2ae6cb96cd3804f791c2077078cd906fabbe08731106bbdf67ceea98de34d3bc9c6976b37eac028dbb5c959286a05ff4984708b7ac0ec8513306b348c0b54d7ce0b8f018d6041afcaf3477813200012dac090fb20d1e066ff55c0bc55f0422e4c1ca41e2e0adca986852d72711346df0846baebddadbff67ce6edf9caddfd017b5ed539768c07c11c0d135b41c1e1caefecd945cb73564837c182dfc2cb0d61f56678c6d5dcbb1eca6bb5ae8d9c6d5f75da8a6eea3e670ce1906837f475f15e480b8771b6a1b90dd055079c86af4ec09e1310de0126857bf9be104208218470cbb780abce1fbfab43ac95838fbd5401caf79ce0dc9e6a446aad155cb1fdedef472d1713dae8b52d0a6d0d094110da407ba3010c09077d3ded66dc652828536f25745143309a8fc057da95d9f60a1862002c50540605bbd4455c6007784ebbb048df09ab4b21aa95f6a472432fe717f365c8a91bf1fdee9c85bfe7004da16b00e8eb4368052ccb516f87748289cd50bd0a5782291a6202ec3ebb17680cd1011013057d9b414c23cfebb505c70ce1aa57444424f4d5a927fd17dbcfe9e7c8717b4fc2bb7940a076434007e141603a088b4f54fd4c78847a3234b49efabfe85ce5fbe37aab795766c65ec7b0c097c1f833988ec01e2b34d4f2acc964773341131dae9e088f895279b1f800ac2f75b2ce0ad57ba0b836c434018220a236a4e7a88b346712ee81512e7ae3984fc30bfbe0adfe9517d0e68b506085cca3ea42ce96ee22ad6c14ef87a526d087425ca0ba49e738d79d37cb145c00f3096d18dcfa305deb6d559c038b4fab0bff703fd06bf93afd47487171ced15dc7106c8e9fd107c323211012a4e6cd329fb7bb39a12dd3b5837a8abd6f0775bc0a7220c5ecdd32a63c587c1222b42154c30dc059f8d488c73c63bea0d2b26c3d4ccd87be7d60a09b9ed0293b55e031aa994a5784018a0fa99e1400b68fee0f80054361f704157800d069438dc54643481d68aedd64309ebbf67bc0bb636e3a0f262ba417aa7537aaa3d65970c1bbf73df2d3caab1f8cec08fa0008d1ca778f287553305cab130ab4fcecf67850bd3ac54617a27a71195a435c90b6de023c97635bfe3d0bd1bd60d5132ae03042efbadc80fbb2ce69587c08a8037d5baadf031d6fac793a7fba398fbbcd9bde94ad0018d71f627d1977e37aea2bb8a62e76b76fbde2ac6ef703026048b496574095f33227cb6ad61f527308026080899140052ccd51371b8b0f42b4d6ebdbd3f91adc97738e436a0318a8f5363444aa7c8e09961e01f371303752df9f92a782a57b74da4d7d3f18d551a5236d3f1457c0fe9fb5f6d43148d1e679bbab6d35d6ed246d5705c01fee859e61aaadc165303aab2f1d8f03d0a3bdaa6b23b49b8efa56eaa6758856aecde7ddcf815ce5d838b895f52940ee01a0ad7a50d07e9b5db675ec96f96fa9d300756dd2123e19053f3e09335bab97bdaed31c3f1feee67c5d0129b95a705a3be81106b58eb482aafbefaa9a68a772edf12eba005c80d4536a9d06d4ffb66478d3cef6aa2dee502ef5b5b43946ebc3b848358465a23624e51739b814e870be0c74d84fe9796aff863650db12aa0529d20f69413457e75b5cd7356ef3db2515581812a6fead91b2eba13deb6dd9062008fa3657f5dc43ad503d06edf66f95739337f53d1eea0687fddbb7abaa3fcd46587a567d7f7a2d18521fefaf4d9c944d77f5ae4f79bc023ed5464ce8ab058512ee7478d8c153d9f372bfd9787deda6d1d9f26713187507e81b68ed4720a1231802b4b25e0146addd6b88845106a014961e50af6596a8a02bb8de7fe683f0ee1195b762f5a887a26ced57773c5d3f397bdfd3f9caddfd0137dfe1b65ed28447c2c470e8db54fdbfff4cd575100043ba4248208c88047d05a4ec751ea8f4e6fad3d76b23a7aad156f4aaee73a50c92f2e0e5bbed5eab03cff580900098b712be08811f06dbdd47f2f4be104208218470cbb76693a59cf2ab91227f9f678005a8483772ea7bdf3f47805f65fbb4bc822b9e6eaed9386ea1ddff165bf0a6393cd91c35cc500e705a0d85140210a47acf510129a9f0c02a351c1e409a76f321d476c57a23e62bbcc9df6f3e099956309f5243ea4cdd0ba12d20dc5f7baad40ffe100b063f28380b210ded3e5b0ce956ae0e3ba3bf03fe330166b5f562bd367e95bf43b48bcefd3e0c5d6d2a56376808a8bc71a40f50ebc974f9d8b1967ebb9bac21ede093a1953d2caa2510168d871f7e0b0df742d27e6d5b2bdcf49ad54343ed2957a74fb99741a6093584d27730f53b38170c3175e19c8b9bc4863b9ccfe968bea0864b5d6a543de8ae26a1356c7b127ee8af865e5baced37dbfed97f524bbf4ebbc9e68437cb246a73dce6e6c0039fc19ebaeac6c89e13eab33adb31b4fdb66dfbcd62db674e8e972d08872dd87609724dde2db3a758dd2c2c38045337c1bc6288b9031a5dc6639ed1b7d21e0429534faeff2603a2dd0c1d6ecbf3e9bbd477a55e819ecdd53c3ef6ba6ac3d01a9aa88b6b77cc2ef29937c73ca617ec7a0216dd09f3be83ed5a7d621bc0c0d3fbd5e1eadebd6d3bdc1e0f67bca9539c30d455bf8de7f0be1cd7879ef5813a9537a65c951b705dd6a1f21c8c4e3bc738e1e9fce9ee3c8e2f79d345d98a09773dcc9bbb6daa4e7de58cbb7d5b23eceb685779a50c52ce40a25d4fe5842eea2657712efcbb14be3a0723b57debe97c6dcf59394fcf87d03676c3b5d781516d516d8efd9052022ff751c34216e443ca01080cab5c6754a47613fe082c3d0ca6d6f0640bb57dab73d590bf5787d0f771ddd7a4cd9e76d3d3c6d579c925c732600b1ab97b90d0c9b1b9fafdb7b83e05b5fffaba08065749ab937df55f55a705a8a17d0122423c3f3477cdfe70fcbcbbf335a0afad7dcef654a8b6be862e2a9f9a6aa73a1eef89c3e0db27e0c9cb30f50728b24b4b15deb4b3dd2ce3b65c6a22b4329f7baafaa3c4e81ddb22dab6e802dd97832a1cea1a77f9cd6c84cc6610a71d949a28bb9edab3de966d47215a7ba2e89c167c7638377953dfdbf3aa0dd84c9bdbd60a9f66aae14d69add591deb6699c944d77f5ae4f79bc0c32b5206523173bd3db368eb7fbed2a876bb7cc9d306c85dd8f7d0f716fd9eaa23aaa17396881422ba4554082b601aef65f66a17a088ac0cafda9bf11f729dcb0951577f707dcf1a65e726471b39f6d0f4c9a4fc17e27cb5dcff5a7cf6d10779cb415bdbd9e7326652b84c4da8dcc5201ab3740929feac51d5a06cb76a8618ebd7a5f082184104278e45bc8d4fa33974b80d640801f018ebd0e3cf06b1742f08be1d4e51c67e7e47136df87cf06f953cb96da9252b737b6ab636427483a0699d9b0b816b48fa97c6fdc20307fad86912a3808a337c1ee87a0acda63cdfae6a67ebfb65ff57561627fbb9e127642a261d45658781616fea8e61102ae5e48994b544f8604fbdce5c57aaf519da7281d7a22ba7ced66d1e6632c888677a2d5cd58aff841a0e33c355019a0a88084fbd4d053d555745addc4379f84e7b7c3b77d2a6f409499e0f96f21e62118774acd83699f862abf9df16299a8585855ae86162c3ead865b8d7eca6e013701cf9bcadb8b686ff2971f57cb426008cceaef641977792610e68e04b479d6d2b7c1330d2be762744c775985fa1d1e5539cfa6fdfb36866a77e376b23e0ffbaba8009ecf85e9c3213657cd5fe5cbfb35ced3f1a829b69bf05aaf5d77e5f86a7ed75f7bd3cf55b9e9e9a936f7a5dcba3a7f7a388f7b9d371dd75d5dd7535f39e172dfdec4bac37410f6b7aa7a3cf5ad546fb3a462f87fdf42df7655831d6ecfd776ae29e715b0fe300c1c5af5e5bed110b2170af6c1e29eb0aa8deacdb6b8145edd038b46d92ddc04868442fa513557dcf4d1d0e367483a0a693bd530dc21d559b78bb4b95483373b5dd537ce8e8dcdadae4f390beb2fc3ac666e96f1d52fad4eb31b0921e43aebb42a9ff770be8ee80e0b8b20b70888844c6d9ee2e7a25dacbc26daa92e8e77fa76f81435946eda7e37c39bda787b8cedd2e955b9ac817366cfae90900d6927550f465311a087c9ddaa31f28c6dffbac96f690720da61bee8eb2ebb36aedab3beacc3095d1d15a8bde6dce4e37abd6d038eea0a4946c8dd0b53cb6162bfcaeff1f6dac4b16cbaac772ff898c7edb6b5ccd5767b2a7bd7793c6cd76ee74e438afd3d8e20988897d7be4ef4ec04313b20d3a83d181e5a59065cedbf73f60ffe54f37b6b8cbbfb03beaa89f698b7bd786ff5f5a78da7bacf0df35158087c7247e56be969f05416ccfd837a38665238bc701816e6ab07fc3cbd2f84104208213cf3b187eb054af7d9bafdd4c1dfcd53e8d708d0d1744e0f428736a7c1d0f6b47aff4e027d697037a95dd9fecd3351568d5189dd09690f0981c059483aa9fd0dea29bf42983814fed35feb65720cf603115a6f99a21bf9c4df4dfe7edb303ae662587db2f2f502bb7998ccc78010ed09da3db04cfb7e7d13ad7755197c71c06ef94bdeadd791e967c0aff2e973bd17b9d510a2a5c15a799164b2aaf5c4f8905f8bf361fc4a5878c2f3b22e95c1334b61f1cff0720f70d7b9eaea93b197b4a7c1eb435f67432d0542848eabbd87ae7efeacfb79e79c8988804fb43c9599011f6ac7c57c543d8dbda7b99ae7ce517823ede2fda2f674b913de2c93b61f7ade0fdb46683da04c907e41cdf9a7473da56c86ca63a9831857ddcdaee7e2fd7a98b5e35507a25ca5cd6119dbbe2938a83df10deaa978139ef34c31a4f8c1fcb130bf935acff663da7b7e0e3755fca0bd96a6b45cbbfc510605357107e10224ad866777aae3e3cd31cf4d5773a9867685c4fabebf7f23b83d1ed7cbeea69de9121000b12df1ba1c3bbb49e6aadc78623b07638162c720b6964e4fe74fb7e7717779f306b99efaca99eaeedb9a94920fb1775e5b9647684308a71b21b64de55b9eced76e9d8494da95f3f8d9e8c3b5e1422d10d306088091ed50f924e4da00f423dabc74671ba9b65344949a7f9632e8d9b69aeb7691368ffc3d2f525d4e8f8de656d7a70507d5fc8dcee639f6c96d54a75dd3e6bbd1759a2b1eced721d1b06a00e88fab9e7d05e1f0ed18e8eb22ca5113ed5467c77bf15a35f7e4a8fbd4f0f9de706c677b5cc6cb72794edbb0a8a6ae833d1edbf48de0f3e1907019667f078bcb61d11330e57a469e7195dfac907204125a572e5a1365d7537bd69b753863dbbfb1add4e71dcf4dded4f7d561b81346d5470de35bdf2eff5dc7b589ab7ad7e73c6e4b03507c517bcd615bbd6de378bbdf5c5dbbf54d80d2a9763f9320e17acecd76bd8bdfddae4603b171b5ff221a56f6cef4f8e0851b26a3ba1e9eeded03c34eb8bb3f8015966d80311b20d7d5c3f4ded44b5e3069075ddf18a29d1c8f6a5d7fde0cd5adfb2a60de7618779fdd832415b03e1fccf5215abbd715a1bda9f7f3e27d2184104208e1151f9b4e159cffa61835ba636d6ab7aaed61797b750830547e9d5f131dfe3edc18f36f5197da5a1a7ebe9a866b5dbdf40259800000200049444154f8f1f4db51208cd36efac5b6adfa8473ca764829859e3d605c88ba608bf683819dd45078b9f9aa1756ae36df5015155a9aec9f92741876cc931aff7e77422a87037c7b35cccb8165dbe1dfb6e16dcdf0f60178f96118d704288577332a3f3b511b2e70d937f0c24e58bc0d920e78b15e8de598da5673316c2f55176923b521b26cc3b3155d8402a39acbe49a7d180213ef445d84940116f5dbd01ac6d98601b47dc6e13858ecf2c8e22db02c0f5eddeec57eb3dbb75586322a811da56a1f7d9a0eef1ed096bb04fb1dee4014694364179f50f31d25de6777e359cbec6650f31c76d66eb0a4aa7dbc7a2f241df6613832db93c61560680bd3a3559adedaa4f28fd1a82e7a4dc7e0ed1db0d4368c9a190a4a21a23df40d0473112c3ea6e613fce2945ae69cb61dde2c539cab7a4185b486e91d411f0431f521a2238cd4e6803302e6736acead9eddb5a7a22bec7e34a1066dfb2f42d12558baaff2697bafd9962d77f8df89cc836a9ebf82236a9f4544435c1def9689b03ddc711a9efa4ae5b38569901b80e73c638585a9501000e31e80be01d055eb3e7675f8c232309e859493764391e6c0e8ef60751e24a573f5ae9ccb5e006879d97e3f3b9497cc2c989d038bd3e0df97bc3be6a946b53dfbf3605e7ae590c1672fa89b5b9edef786ad2cdaea025b7ced9a61c6b4ffdd1e0faea34e012ca5da8d2e13ec298508db9ca29ecab19b75ba2a371e85c0286de8fc4ff782e92c2cd67a60586c37e43c9d3fdd9dc7dde44d5fca96bd465a9e2e3eaf86b1bce6a6e1f5d457704d9e76b76f3da6c5c9faaefe6dfbb952f9b2d37ac50c5f174382939bfb111d553e8dea080976e71a4fe76b705dce330f80fe4e27bd6eb420a8be190cd17a17f58c5673d53de2a48b8e2dc09ad05e6b3b1960642bbbe06a35d6ed326d152e7e6c746a08692e437129a41c76f27927bfcd57ae9d5bbd4addebead8dc26f569ca214868e7625b5db575ecdcce759a7d9bcf6d9de6e1bce2a94e73f9790fe76bd34118bd03a60f8359fd60eefd10e3d043b68a1a68a75e73bcadaafea402d6ef81d9bb2a875b2d3a5935e8e5ae9ded691997e512e002ac3f0e5c82b463a821c46dbd7c1daf45fc20d4f6d0e80535c7ef5767ab6e2317e0993510f520ccef0773fb43a27d60d8d9f9d4535de322bf998f416ac3aae7ab1a29bb1edab3deace3aa9fa1481b96757bb1ea45fd72279c9f9bbca9ef71df06745a9f05c0b84ea0d7c3c88e0eafd7709bc6e73c6e4b4305acdfab02510bb3b4bc7f49db775eb471bcd96f366eafdd9cb0e56d7305d70e41eb582739bc3fa493aa5f1b85ab7ceb69ff4545abf954cdc754d9329d8054c7879c9dd5a10ee9f9629b3aa7bffd7de55cb9ae967559d7b8bb3f700c5ed905ab77c1c22355d6eabe5e724887fd39c0b117796abe7a2dcd08663f48e8e47c48748fd79f78518f38d9375edd07f2d056f4743de74cc12ed8170989f6ed303f88686cf7bf557be8a4118cbbd38bf785104208218457fcdf78e38d37dc2d909696464e4e0ebf8f2ae1d456b872d8826e5838750db5a875aa84d3fff9d9be5de85ac5252e9d092028b621fea5673933339b5359de4fcc57ef89f634ea5c1b4a0a3936e538160b34ebedb0d059989b0e993f83b91cba8641fa1eade78b15825a40fd43f04101945e016b200c0aab6cabdea1836587e0b97888b65dcc5c814d3fc0ebbb21f318ecf187bf3d081d7550af1974ad05db0fc2c26cb08480d5a81ae9f177a9a19d96d92ed2cba15e30b43f0fefee01a3152efa416c6bb8c35ddcba86bfbf6f130f9d016b41cf36603d0bfb8b21b5181ab685299170fa18cc580f4b2ec3a050d86b84f4f3505c0ca79baa75776b0df5cfc3de53b0e714d40f8737baa879635cad3700387658dd6c08ba035a17c0f33f406930fc65103cacddf08e68ac2eba761c85a210f85d3358920eab4ad4f1d56bdbd7ad0d34bd004b7e82f40370aa392c78083a05a8e1fe66ee805cb3ca03b1a1b032037e2c056b39b48b808e4110f033ac2f8184eef068b0ebdd557c0c96fc08ab8ad5a87ae7acd0b02eb46ea486b93c750cf69aa1595378a9bb1a2ef5e86568d71a7a36803d8720a627743e011f15c0ca4310d70be67551fba5d8087376a9fc62ae05b1e16a3fb6be049927e1fba370ae3efcb52734f4626e1ef3499893013fd9b6bf0d74bc048b0e41e939d8638141d15070184ef9a974bed806520bd45c65711dd4f04271cd60ff7158b607f61ae07ec0da18bad6057d5388a8e77919eb2198b205be2f86b4d33076003cde18a80dfd23e074212c39ace6706a7b17fcbf7ba11e6afe9a0f0f6b4f3beb203e0c1a3686a626483d0a29c720b6056c3282552bf7f19e7a499961d13648390bd6cbd0ac151ccb86a5b6bc1502094de0fb4c48bb0031ade1a774786d9fba01f0c9006d1e4bbc584607f1cde1c029c83c013f9e530f538c6c0c78ca3375e0836f614e1efc68848be1f0ce7dd0d40fea35845a2761e73148bf0cbfeb04a14da1575dd87b127e3c02fbad30210ebad686e20298b3078e9583d51f62c320543b1715e4c3dfb3d5fc4f667f88ad0b0b776ae7ad5a10d706a2ea40da41a8d7065ee8080d759e8ff93d7560d31130d781d8ae30bc0eac2f86f240486c0777d672ffbea73c9efe237c6004cb15a01e742d870f76a96db4d4825e8de163ad8eb058a15d1be86870733caa59a79c3a02e7dac21f75f0410eaccd815a91f0593f6d1e2ae08e562ecaf16558b20d569f52e7244333886d5c79de3e90eba2dc78520bee0f83d32761e35e5879011e0e85825ad037046a0742c7fad0d5cdf9d35dfd10607191372f7957b69ca5372a08be3f02db8f42eb8ed0bfc1b5cb54b7be7256179b0fbad8b75ea4a5f8b02a4ff6eb3bb80b3e3ea205f21ac29dc5f0f743505a0ed481f808754eb3311f82e96678b3a3937b68b5d57169d405eeb7bb79564f0799875c9faf038fb92ee79fa5c29d3dabaecf26b436fca4873f86a9ff031ac0d1a3302416ee702c877ab8580cddba57b69d9a97c38126ea21b1eaacdb59dad232ecf66763b8f324cc3f6057174440bd20b8e312a41741da0948ec56751f94fa417c33f83803324ba1d40a9d5ac28fb6725d0efa50e87aa16add7b37b0d05af5d8dc36f5695d58b207c6f65637646d69f3d8d6a97b7bd769d7b4f95a42bd26aeebb4f4ddf0f70275feb7ea21ae25d4d3f29337759a31dbf5e75d9eaf6b417a06cc3ba4cedb33b7c2ccedf0f14f905b1bfa37ba01edd46015ccb23fdef8416029ac3f05f5eac1c8fba15509a49b21a8292486aa7394a776b6a7b6b8d373c6199893039606707f2df8cb4648f587890930ad1570c9f9b548d786b0d308df1e84c3f5a1dd45b58d965a10df16ea15c0c43d90b65bdbaf3fa8fa7cd345b83f0272776975afed7c1a024bb77ba86b829ce737e36ef8a925fcceaef7aca773ab5765b7aefbf62c5eb49b222ec2267f78a313acfc1136ed87dc20f8db602d58ebacdef0a2be6f7ada75dde0ac3eb35dab863684cc3278a943d57aca6d197153369db669743033c3f73c1ed10a422f425a1e2c3e04f19170a0147ab582fafeaa17abbbb2e76d3bc9d3b59b539760f10fb0eeb42a074d5a4223bbf62375a1ab15febe078e59a1bc16f4ba1342b5f3703d03eccd864ebde061bba1025cb6090321be09ec390a9ffd087b0220e212fc7801ee8c849121d75e4ff5ae0f1fef801f2f82a51ceeb8037a0540ca71b8a7ab7a6070b1c3f92cb6423d90e0a9aee9eaeafe800e8c87e04010bc782fdc59db739d633e0d73d2edeade16b0f647d5b3d76a85f6ada1636d58ba030ed682f896f0f146f8e8140c8c8505ae8625f770fde94d3d126a9f019c9cfb9cb53dbd692b367153f73975019edf05aff485a60e6db6aeadc07a02d61d85efb3213d509d4f6cf580a7f785104208218467b5ae5cb9e2365e9a9494c48a152b481fbc977db3d46bbab13d889cd31cffe38739149bc5f91a1edef71a3a0377a4c5d1b4f5652e4edbc4818fd417b69f5ac3df530149dfc1cbfdab39df891986bd0729c0aca760922f432ed7845bfdfdd7217d133cb0030c5de1f843b73a35423837fb3335d773e260f8bc53f597114208216e35a9d3ae9ff9248cf997ea115a451d98fb344cbc4d6e527bd3ceae565b3c1f5aac005313f876420dce797d0992be80d94e86a61f31143e713547ae10ffa5966d82f07ed52f63f3fe09538f42c2c3b0ea369e8bb346ea9c3218f6be764f64024cf2757a825f38f36948c3c5038d4208218410e286abd6cc8796e4dd1ced6b20fc91163479641fe7975ff6fca1ebe09fd01a436bb8fc9fdd1cf9b486a3bb1590b21388820433348aa866b055082184104208f1ab91b6130adac24f03d4d0d8662b18f360d8d750f433709b045c7f698af3605905fc6792eac94905149f84e797dbcdd129c47fb9dc1cd81ea4863c2e32c0089947537841df04126e752284104208217ec5aa157085cb9c9dbc1d5d93fb097e3192069b7ee2fc999a4dd8550603cda7b4c22ffd270e4f3e81c55ac3eb3f022f7c07063350077a76bb8e75799a9fed46bbd5df5f133cccc125c42de5626e259f97114208216e35a9d3ae5be649a015846a730beaeb407843351cbc6d9ee2db8a37c7d18763ed74fee31a50500c457e101a08f8a99f90466ada8ebe6d6fc0170a71bbb1c25b5fc3bf9b43745735d7ec75f16a0ea8db404dd439525f0921841042885ba89a0157a0f40245a3376399790f2d3e8da4d61ff3301da9c19401b4684c8bf7bb1294be9303af9fa0cc71b8ae9a100c8f3487c539b03d01a657778f5c82945db0476be0a766c3885eea6977972a60ea22f8d0e47a918401f0b937c3fe78f3fda7e137ff84745753e7fac3f4dfdefca188cda761b151fd6d3a060b8fc2c43b6e6e1ac47fb11a2a67c50761fd59f5f79e7c486b057d1bf9be8ca89e9475307ebfeb1bbb866838f4f04d4d921042fc62499d56332625c0d9adf0d41a08ad0b3a543d356b38c4dc26bdd1bc696757ab2d6e86a5fbb4873c2fc0d2bd10d1059c4cddecb39ef7c1cc5498fa254434005d00582e41cc433051f2a0f835088021d190920f7fbf088b3a547f559939f0d569f5f79e7c486f0b3d9dccdf7eabd5549d939e55794f647d2624c442940c612684104208216e926acde1eaa8f63dcd69729785931f9dc1552ccf777ed47bb20dba6c23a77f743e64718dcfe17a0b982ec05937bd76038320a44e0d7d5905145f8032574f7dfa41a3fa60b84d6e100951536e6a39133784b90c8adc75ddd74344e04d4b8e1042082184104208218410420871954ffd395d07384f00d0a84603a015c001680ec10fd6e47a6f2f86fa60b8595fe6072137edcb84b87ddcd472266e087da0045485104208218410420821841042dc9ea42fa310420821841042082184104208218410425493573d5c3b74e8c0df748fdee8b40821841042082184104208218410420821c42f8a5701d79c9c1c7272726e745a8410420821841042082184104208218410e217c5eb395c37cd79e046a64308218410420821841042082184104208217e71640e572184104208218410420821841042082184a82609b80a21841042082184104208218410420821443549c0550821841042082184104208218410420821aac9eb395c1d990e1ee493353fb176ef79cc86ba841b74340869cea0ee06b2f6c10b8fb745e76e0565675835ff3f3cf3cd19687137eb3eea45d8de6d3c332383ad267fe2278f67c943759d7eb4242383e9ab8e606964c080157d5804bdfc2de80675213ed0b65439f9074b69d7b6417537f1aac2eda93c35238becf2ba3cf5d709ccbafbba572984104208218410420821841042082184f82f508d1eaee5642fff37bd26af63fec1063c3b7d345be70c63c9eb0ff356bf00d6ce5fcf8202abe7d5043666589fe618ec5e0a8ee9487c2b7fb71fb3ecdbc698b70e10363e914553faf3ce94789e6a5cc01b4b0a28b954b99c69d7369e597e028bef1b788db0ee77d2fdfae3b64208218410420821841042082184104288ff323e075c4b366fe4a94f0a28f1bf8357a6c631cc2e406a88ecc282a93de8ec3e665ac91f748ecb7af86cc677b9645f82407fdb82feb47b309e590f0641857ac5b43783a766ef22afdccb747899562184104208218410420821841042082184b0e7db90c2e52798ff592e85e5a0bbbb23c35b3859a66d477e777789f68f859d6b335879d88af978011b8f05113fb63f6f3dd8d8fd70c39e5c3ac9dca47fc3b3713c13db001dfec4c7b765ab1f58f276f1ec9c1d6c3d0becdac6c3cfeea2f363c378a79f8e92cc5dccdf7c1e4be94936ee2a25ac7f6fde99d096305b30f55401b316665158db4af65e0b9d87c7f15662d55eb8eafbcfb06e610acf7c6321feb1de4c1dd69676f5ae67838410420821841042082184104208218410bf44bef570cd3bc8c6e3eacfc8b68daf0d44025097610f46a0030abf4e61ccc20274f1bd7927298e5ee6137cfe5e2a4b8aab9fe0eefda2e85c072cc505cc9afe4fba4ddec4825d3f436404bd0ca08bbc9b37e21b03a0bbfb5ed6cd1fcd3bfd745090c1f8e9dbc808bd9b59af3cc2f391a56c5db59137366b830e5f3ac1acd7d7f149ed8ebcf5621c8f1aceb06a612af30f3a49441d0391a18d19fe3fc358f484045b85104208218410420821841042082184f8b5f229e06a39594a6139803fba40cf7d544d27cf63ba642223d304fe0134d403e5e7293c59bdc402e8dadfcba257bad0ad11403925fb7ee28dfffd27f1ef1dd4d2e622ed674a29bc544ef6de23941080a11e8095e2e25295d62dbbf8e420848535c2e0df9887e323e8dcb63151d74495cb29d9bc85f981dd79a78f4cec2a841042082184104208218410420821c4af994f430aeb020330f843497939a68b168fcb777efc31b6763f8f2ef03c0b3efa890c15dbc4721d73ab9a4c16c2ee8f635da78eac5ab583b96b0f927fd142f6daf53cdff2b7ac1ce63c08aabbbb379bde8bc21418c0d6255b5879a0bc4a5ab2734f62a21c2ea917da253eccc644edc376e92ddeb585316bb330f56e856990ab5ebe42082184104208218410420821841042885f03df86148ebc83ee81eacfc28233983c7ea09ce25ddb1833fb20614362e81e549d24565ddfd6af7f221fc0d08c61e31f66ebc2614cbebb2e504ec6ae236ed2e48fb9e820af4c4b25ab530fc6dce95ff5ed4b5600f2dc6d57b985bce32a6a5cb8691b6fedf21c741642082184104208218410420821841042fcf7f22de06ab893671f6c8c0eb064e6b2ee949365ca7f26bf400522f397af63cc674708f9cdbd3cdcf4fa130b40612e4bf6da75396d7a075327df4db73aa06fa0470fe00f8e031e5bf66e65cc5bbbc88eba9ba931d70e871cd65adbae5d3fb1f2ea1cb3e558caec16f2d7d17b503c6f253643577e86250b33d85976cdaa8410420821841042082184104208218410bf12be055cf1a7dbf804de886d00170b983527839d76dd412da78eb2e0bd2dacbb08f0335b324bb0504edef7bb58b0dc36a4b09573a7ce505206946b43fa965b31db56a2c552cdb850718645ef6ee4f323954157cbc99f31d569c6f8c111e80083410ba89a4a293c5ec0c60228cc3c42fe2530e5ec67eeaa5dac3ca07dcfc5b3149e85b0b8181e0e01ca8ef2d65f37b1e09b9f58b0701b4b8e973ba44b47b751bd79bc15580a327965f949a49fab10420821841042082184104208218410bf4efe6fbcf1c61bee16484b4b232727877109adb54f047157bff60c6ce187e9d021167cfe23cbb61c62f5d67c361ef0276ef47d8c69531ba84d935a6749dd7b114b6010dd07de4b62e031361dbc4c79fd501e8e814dab76b3f260195caea05e4438d1677f62fedaa3145aae60a62e3dba36a745a07d6aae90ffd329a2ee6dc9a9d42c3edf7694ef7fcc65e9ee2b243e9bc0a48eb501086ade905a878fb27bdf3132cce18c8b6f4ccb7a97c9de59cc697f1d6def8961d23de56cd97d06130de8ddb7156186c60ce8528f62e369f20b4eb2bbc88fee8fc4f2747b1d85db3258b0e92425d6cb98eb3425be6730b572f6b3ce788992dce31487dc41bf3681be4d882b84104208218410420821841042082184f8c5ab75e5ca952bee16484a4a62c58a156c9af3c0cd4a931042082184104208218410420821841042fc22f838a4b01042082184104208218410420821841042081b09b80a21841042082184104208218410420821443549c0550821841042082184104208218410420821aa4902ae4208218410420821841042082184104208514d01de2cd4a14307166c6b7ca3d3228410420821841042082184104208218410bf285e055c737272c8c9c9f16a851d3a74f07ad9dbd12f3dfdd7e3d7bced420821841042082184104208218410be90b88ab0f12ae00ab07973aa57cbcd9bf73e3939395e2f7fbbf9a5a7ff7afc9ab75d0821841042082184104208218410c217125711363287ab10420821841042082184104208218410425493045c8510420821841042082184104208218410a29a24e02a8410420821841042082184104208218410d554bd80ebee99c4f59f4b9e15b06633a3ef43ccd977ed62258b86d23cb82db1c39ee4e9678612dbaa298d1b37a579cf513cfdcc930cb9bf2d8d9b0fe5a3e340fec78cecda96d8dfafc4785d9b54734a76afe5a33ff7a3796395eec67d679265755ccac48af16dd5fb8d9b123d62262bb618b1dc8a04d7181379a9c9bc96a86d57705be29e98c8d3cf4ce4e92786121bdd92c6cd47b1c27433d364212fdb2e6758329893d881d67d5f66c3e99b990e2184104208218410420821841042087b26b2d62733e5415bbca82d09af24b36177c9ad4b5176b65dbccdc4e669fd681dfd1033b6ffb22358b7ab6a055c4bb2b330ddd59dc800a0640759a55de8deced99206fa247dcdf6559ff2e17b2fd0c7a0bddaef8f7cb8e053befaf66bdebc57bd68cadac2e6421379a95b5420f736107cd720263c358007bb754607b06f25c9db1c32e2f1356c3645121e00a0a3cfe32ff268ef70b5fc2f9681c8b8b1fc797877b51dfe610c9eba900f172ce4c3cfbe64fb8feb79b39fe1a6a6c8943a83a7e7edac0c641767b1654709a67d5bd87cf8a626450821841042082184104208218410c28e812e03c7f2c7c1912aaea2ebc263cf8e65c05dc1b72639c7d7f23f2f2663b4c5dbac856cd99a8da9248bcdbb8b6e4d9afecb5523e06a2133239f2e777551ff656593d7a10731014e1635c433e18948d7abd24532e1e9781a028641497c36e35566ffe35506385bd7ad12a0276ce8580607035623fffe7c03f61d3b8dabb3091fd2bd32c0eaffcb0eb5dad3f93b79313f9bac80ce4c98f418c137e93899b6cf65dc1fe6936b1f880f1bcbecf7ffc2b4fffb3b2f75bb39e91042082184104208218410420821847029c0c5df3753c9465efbed73ac386e9f96cefc69cebb4c7b6d1e7f7b22fc1625ecbf9b0f01570b2bc6b7a471e3968c5c6264cd9f55b7e8e6639231ae9d48f4f895d70ca31b3c7c2c0382dcaf5537702c8f06e5913c793423a7cd64ca4bef936185928d2f13d7aa298d1bb764dc3bc9bc36e63ea25bb5e4aec4d7d970288f15d3471117dd92d63d47f1c14efb6f3691b56832239f98cc94df8f62dcdfb65072bd3d661bc43376b8ca8025eb935963eb016ecd6685b1338fba8a295bf258316d1423fffc324f8f19c56b6bb5cedba5d97cf4c43dda30c52ff3d13b1349e8da92e6edee63dca26c8c5be633e937f7d0bc5507125e5a5b6588e5928d3319f79ba18c9b3c9191c3263267bded5d139b670da57570531a371f45f2a16c929fe94774bb8798b3239b0f4674d08607be87a797e461c144d6d2c9c4b67b88d752bdefd26efc6e03462be862e3e91354c28657b42197db4d6683c544c63ba3880e6e5a3954b429e3ea7737ffcdeb7cf4b78924746b4beb6ea398e378dc3e9bccc8272632aeff3dc40e7b9d358560d93d9fa7ff3487cd2560499d4942df7e4c5a79848cf7c6f1c833af33e3e5d749cee7ea7e4d9e3c9484119399f4c45046be944c96161db7ec4b665c3735ec73ece4f97c307928b1eddaaafc2443120b21841042082184104208218410e226721def514c5be6f3f49827797ac47ddc75ff93ccb91acb3191b1e875a6bcf4329386dd4374d78798b4244fc5e84e6f61c6ef27f1d16e1394ace0b9fefd4898be8592d4998c1b3d99196f4e62c657262fd250c2e6e90fd1bab18a39cd58f23ae3fa77a075bbfb78fab3bc5ff8b49a37860f01571d8fbe9fc3e1f4b7e9d362381fee3dc8e1fc1f981d17cea39fe4b0fffde1d51f46d710c9d8c4ced80f521b1c3796012d002c64e50432e193aff9dfde60dc329fa7c77f8cee778b59f6420fccf91bf9ebdce5577b9d1a3f9bc8886999f498fa2eb39306609afb244f2fbade596103e933f671bae800d316feb952adcfb27303e7ee1dac0d27ecc8c49a9746f3e79448fef87f6ff3de4803c9bf7f9219bb81a0ce3cf6b0364cf1a12c8aef9dcdbf3ffa1de1a63cd64c1bc9943dbd79f3cb77f96d9312323e9bc9473bd51a2dbb673262fc5cb2babcc087ef2ee4a5bbb299317e34af6db10006fa8c1b448c3f40311be6bfcfe6e2f3984c468a7feecc1fdf7a913e5af03ba46d243a0c7419d89b3e235ee57fe3bcecd27e7c2d731667d915a460060ce94da86dfbfd0d741f3e8068fb9eb186ee3c36300a1d60c9cfc632701eff9cd41df3a18dfcdfece5d84e0f254b9f63c4cb99f498ba900f9fef4671ea7c264d5f89f9ae677973a48a68ebe25e2525ed3be60d6f45f731b66db52961c59f463269293cf6eebbcc7b672cfaa593497c261923a06bff188fdea572a831fb1c3d923e655a3c18b77ccc8ccff2bcdb7e218410420821841042082184104288ebe43ede03e4cf67dc133328899fcd87ef3f4be4a1b5ccf8d31c365b6d71b08de846fd8579ff7a9b3ea51924bff432ff2c049af466da4b8355dc26f851febee93b52927a131cf728035aeb7c4843307d460d50f1aff22cf2f81d1fbe3f81f08b79ac78730edf94dee41df60be0db90c24106f4c66c8c1d7ad0a7850143bd42b20a3bd3a75730060f3d593d0a0874f21a808eee89c309d719086ba142b2ba7b0731384c47700b1528b41c2b54e3505b3348fe602325f562e8d20e080e27ac9e89f4152bb9ee905afbb14ce8ad032c647cb1842cab85cddf991910ef622ed3434b787f8511226388d181ae650821e5d9ac589101805e0b52ea2207f058ac015d8b7042fd01a21830bc33065d0821c13ab01a293c66014c7c33ff63b24a7584b709430744b6094367c923f91f6bab0c738ca510bacfe6c355dfb27dd3d7bc1907b47994b1f106b01a59bb620b16c0b22d9790c13d3c07cacb8bf966d693c43df024c9850eef0550f5f3ce82cf016a095d87010ceaac233838143deab81559016b36ff98b796127d24916d4077ef638ced16494c8730f4aed2e4985ff625f3feba1268124964306008232c044c1be7b7159d83000020004944415493bc1b4077356de17183e96e30101a1c025828323a6e941042082184104208218410420821c48de029de6361c307efb3b93494ce1d8221b8378f0de94c972e91840680e95821268b911d5b8ce0afa36110505e88f1b8bbefd439c46fbc8c39f903ba1e0c1e128e2e389810808b2514cac8a1d7f06104690b6b9eb98ba7bf2ac152ae23a6d5ebea550b2cefda92bf0e5a48e682413728991ac7d406a0027766edff33b96415020199244f7f9dcd9cc7d4a13b5d82c06475f2799f0433f8f141fc35752525fb5692bc2e0c837e30d35c049a2d39996459c092b79c19d332d1590a09edd61df466dfbb5a9bcd60cd63479609d0a10b6a08805eafc291a69c4cf2acc3e96e5b5e174997bb552038bcb32d206c60f0c8c104af4bc6b836996f5eeb817eb79e3effe345bf64ff101e9cfa292fb6c860ceef3ff235f5d7b21d07abb62f4a7690710808b060b1024de279f39b789f5669caca5273bcea75a850ac1ebd0eb01ac9ca36c15d2e02e380a5dcf74d104208218410420821841042082184f099a7788fb93359bb4b80602dfe15cea30bbee351dbe7ffe76bb60f28441754c807d393d9619b5af1720da6c13ee66473b5239c191953f85a3e8420753c98b494ff3d3d84cdf15f333b5e8769dd6412330691f2463cba7aa1d51f52b8065800ac16ed7708035ef80b639bd4ec7718068ee591b0957c74c8c8f2696b79e9cbb16e12a4729bae710f26cc7801c7695eaf272fda7ac79a5dce4dab27c4497c51d76f388f8425f3d1a18d242f5d4e977abd99e64b10dad09d3f3d55c8661fd3eb922dd069db0e4b1eb979c05dd55897558bbadb0f336c5bafbfe3c24208218410420821841042082184103793858c951b084e0cb9fa8af3788f45fd6f3591b7cf0871e1d7aca7e8bb194c591bcab47ffe8e1eebd692751d43fc7a8e39096ff834a4b0ae319c2b0ea347ef48c2db846339554ce45dbd896c134e78f0ad0cb76a9a441266002c19ac595772f565cb2163d52177ab4bd79b0923b5b957bb0ce2b1766e166d1349780058b237b066dfd594603c54e2fa43ee044412d3414551cd5a30d7a275ed35748821b24ae0d4c5b1d0f566ecf048c0c486594bd0f7bae6f9048f74038733c0be57afbfcb417fbdd72292c810c09ac78aa55b2a83d1162d80ee386cb113862e5d880a002c5006c0394c1620209c2e51ae7bb70a2184104208218410420821841042dc70a55b58bec542434ff11e7d18519106c042fa8a9564d902a156354a68de7be318396b0ba1e35e65700b27df53db8b789d4f3127e10ddfe6702dcd23af58cdb3092672f3cf11dece31b2ee8aa5323aee2c4a6e2d73fdd1724bd5cf69bf2d5650875febdda8ebc16f4746a2c3c48637c731e5c3b5ac593a97bfa69e773d17a8c7649b55e04e13f9f8587a06053360cc6082afa6ddaec7aa2dad9d1fe5b7dd7460c9e0ff264ce483951b59f1de0cd61ed332b0fd3638ee0fdbff5a0f50f5be81c1131f275267c1986b04c078b0108b2e92b1bf1f84c1fe736e7479742cdd7540586f0674f6b0e9b61ea8ee86dc6d1946b80eb85844718985ac956bc974ecb96ad5f689ad3bbbe3b10ee8cd8471ddd101c6459379e2cd8f59f1d95ca6ccdd821968d8447567e74c31c6431bd9b0afea3acc009d27306160309ccea3f00c6032623c0d86b86719db0dc062971e739574996dff0b218410420821841042082184104254d7d5388db9723a4c004c6c7873061b028231788cf71818fcd4e344eac0b27b0e4fff7e2ec94b3e66c6ff7e4c96a584cd5bb2b06061ffdaf7f9e03ddb90c2659c3b9e474929606888c11f282da6a4248f0da946aac448cac1ab98936d59abedc7212e23aaf02de09a9f4b6e9b18a27480358fdc83e14445798e945b0a3358f15e325bcea8ff4b523f66ceca0c8cb628656936c9abb3552fd4635b58bedec891adcbd95c08602163ed72f2f2d7b22243f5532dd9b69235d9d92c5fbd53053a8f6f61796a09a0a3fbab9ff2ded3bd09278b7fce9d49725e17fefc44e76a0d775cb23d99d76626b3fce3d7f8c096be168ff2bba7c6327680ca6e253bd7f2c1e28d1459555a372f9dc38a2d462c0191fcf1a3c5bc38301243e15afe6ff607ec081ecb84de3a28cd63f9ba6c95f6c20dacd99647d6ca0dec2f07ca73d9b03283bcd464be3964012ce4a5ac20ab1474b17f61e93f9e253c6326e3263fc98c6d61bcf88f7ff1666f1d6022c316ec2ccf62cd922d94380bc0b67b94c77a1be83268305d5c3ea160226f6332efadccd08668ce63cdc71fb366b793deb9c18f31edd54144eab7f0d7d1135913d499187fb51d6b5766603265b07c7d2e16c092bf81153bb359b17a67e5b1dea80a72e49f17f3d9ffc413d9b888cd9f7d4c726e38135e88c7000427beca4bf1e1e877bdcf9fe79b896c6722e3736d5b2d796cf9620b25d660c6beb798d9432cfcf34f9399f4e7255886bccdb27f8c251cb0ec5bce8add2ac319b7ad6173f646966f2d02c0b26b0d2bf265c0712184104208218410420821841042548789acf5c97cb0264bc5552c59bcf7a72799f4e7c94c7ae64986f4bd9b273eccc610a28613761fef015def697cf6feb3f469a7c7b8f1233e4a29a6c7b3cfd23d289801230711d9c400178be1de5799f644670c3ac8cbc8a34c07b41fcbb4a77b13ce1666fc6905bacee194a426b3e1b08a39656e5c42c6694f692861f3171b305a81f26cd6acceaeec70678bcbdc92fd7cfbaa75e5ca952bee16484a4a62c58a156cde9cead50ae7cd7bdfa7e56f37bff4f47bc3b8e865d6defb367f6c5ff5f55fc3b60b2184104208218410420821841042d40489ab081bdf7ab88a5f2cd3ce643e589a8d091359a59d19d4def36784104208218410420821c4ff67effee3a2baeec4ffbf50923b88665093816ac36de23a181fcb646d8598ecc2ea2e98d8053515635a49cc1683ad46d646235d09e6a1041a7f605215b331d06f12c76e0cf0692c746b1c76370b7d3cd2323656684d1837a697ac062641e7aac8dc38c8f70f0618901f83a8499af7f3f1f041b8e79c7bcfb9f7dc4b1ef77dcf394208218410420c4e96bdfd4a70535a904dae3399486b12daa4b9a47ede5512420821841042082184104208218410e22f808c70fd4ab090b83019d554cbee9f41ea02cbe75d2121841042082184104208218410420821fe22c808d7af08eba3af70f4d1cfbb1642082184104208218410420821841042fc6509e9e8e8e8182cc3a64d9b387efc38d3a74f0f7aa7c3cdff45f365afff487c95db2e8410420821841042082184104208311c1257111064c0b5acac2ce81d4e9f3e9de3c78f8fb8629f972f7bfd47e2abdc76218410420821841042082184104288e190b88ae812f494c2d5d56f07956fe7cedd1c3f7e3ce8fc5f345ff6fa8fc457b9ed420821841042082184104208218410c3217115d165d4e75d012184104208218410420821841042082184f8b29280ab10420821841042082184104208218410425c2509b88aa0e847cb29fa592575eeebb17783ea9cfb98f1cfe504bdfbd34ecaf6eea1acde183c5f6315f6d76aaedcef894a8a5e73067f3c218410420821841042082184104288ebc0f9936cec6ea0d1ce92bf9e43fe91abdb8ffb4839f98fcf63764ecd35addf907c3a75077790f5edfbc82c1f226ef3172ae8355c7bd1eb29db53c8eec6540ebeb808f3a0990d5cfb37b2fd3710a17860fa13e464c60e5266a8fc234d1f6efd83671c2d6175f61e1cef7988f8661a39cf6f21edce7e32b638292bafc31ba9123d792af7cc5451004e5692ff7c157a38349ff460fdfe26721e503bcbf85c14de7f1ff947fbeccb92ce81632f90ac80fbed1d3cf54c31875d0651b1492cdfbc9555b302cecc7be53cbbb306265930b5ba698e5cc4d33f4ac03254c31aed64ed856d2f2e1a3aef555150bf9944c2d7a383bf1693e248cbb450fc7816659b5e226d523f791acb59ff12accbefa7de5353587e610f4fe5e83c9d9f749dda25841042082184104208218410420831085f3dd52db13c6201f41812931288beaaa0858162b1c0c93a9a265ee33a06212ada4463bd76cd626e81f42325e496d4633283677402eb362ec2aa5c87038dc0f003ae3e37ce778e515be5a0213269c8ecee83592c79e36e0e94afc41aeac6febd856499dfe4d525fdf796a1f28f347db8f50f5a4b15db0f182c2e7885c79b1c6c7fba80d53fb692f84646af609e7e640fb9af2b2ccfcdc016d8eb5a6bc87dbc84a87ffb053953e9fc8a61ee63e4be7288bc590afca18cdac92bc95b6625520903c05b67a7f04c12894a67fea7b63660cbc82395064a771691fb888ef93f5f273d1a309c3cfb836222feedd7acbd0b40a7ecd17fe0a9fdbfe6d5a583dfb9ae0325d499375fd7a0a4ba68333b875f0a35bc86ede51a69abd5de493e17456b4ab1bef0fa80f5566664b0fcd0c33cb5df36e439104208218410420821841042082184b8e6de73d03cdd3f70cc1cc7aa17e2ae72470ae6e87862265fc3ba052bd48c253696e870d0aff5be4f9690f9831a16ffc72ba459c0f5fc3c1ecd36f3d60b49d725b87bb5863fa570a885b807d249991144337cf5bcbcb51275411ad650000ba90bac546fdb4d757f238a87ca3fd2f4e1d67f388ca93cfeec4a9267c61297f2245b57c44173334dbe803c274ac8cc6b226d539f602be02e2fc23e3a81e4a9fe0dd18b499fd3887d67296e40f325b3ebb5cdac7a349db4258b485bb288183cc4fd53320aa0bd738eb47d2fb1f6d145a43dba8103fbd61277a1868a1a7fd73ee5a4b63112b57b24a819eb548506973664d39a5aced1d4a85dfb9b64c4dc681feae89f5e3931b0bbbc8062530a8ba3072baf605b924cd3ce42aa5baf5b25851042082184104208218410420821fa5557d58c35491d3a63b0465fbb5d0d97e9eae6d51d8481636721b533d248f58f9bb32e4a25aa3c9fe2f7aef5b146e6ead770f58fb21c547d051527cd58a7f68c1e344fb7a29eaac2517f15f9479a3edcfa0fc724154b404732bc2612972ec5d6bd4da338bb10cf5d5138f356b0e4db0f92b9ad0ab73f20fbfef113787b57109bcd8af79d1a8e19a0ce8aeb3d52d3e7e4974e2ba9733ac74cab8b56921a38447c6a1c77479a3099fcbf4f8ee56e730df6d75c74c69eddd49e88e4918787fe5242552da035a2f9eb6a9c7662cf7b8cd9df2ec079a292dc87eee38ea9df62c9f34ef45617f635f39876c714663cb407677720d34df5b61564feb880dc1f3ec8ecef6cc471ba33457faf8aa2350f32eb9fede880d1584371ce63cc5eb003677d39ebbf3d9d3ba6de47e6fe3ec1615f032e0da2d4be0f228d5ffebc06cbbdf1437fdd101d477c7b192587be78e1642184104208218410420821841042fc257351734a25391a30dc38f717b0ec1fe775aee1da6b5d548dea6d8f316bea14a62d28a03a30a4e1aea170f50ad6e76c24eb87d9949eec7d04e3bd720a9fd9c8fac71f64f6df3f4cee410d7c1ad5bb1e63d6d76e65c23d2ba8380dee436b98356d1eb907bbe248017c6e9c070ac89c3b8fdcaa7aec3f9cc3b4dba730e33b0538fa8e89f33551fd93879935750a33baea1a547903e7f30f326dea7d641ef0c7837cb538aa74d43bfd4b73024c8ac56a7671b8ca35c2737f6d5d7dc03508c649171a9144de1ab0d11c49041a8d1f5c19e01a2aff48d36f14a3be84ed75c9e47d3f201078743fc5ef44101397c413cfbdc46b5b9271ef59c6fc3c2706106156e0c3061afa56d36ba07bb9d2910a6aa7a49218eeffbdef5703ad6e9a4393489ded0f392a09e4bcb014cf8eeff2e88b4eea0e1d26e247afb0eaaea1dba34e8dc11c6eeaf93221d48c5977d170d2c92f6b60f1ee373998154dedd6f53cb5b386c815aff2bbc31bb01e2d64fb9b9d778a71a880cc5723487f7603792f6e61f18512f2f7fba3e0e16668ac45ebba83c3a351dbeb69f8a086d277cc2cdff7366f3caa50f1933d54078e182602b339aa57801d00770d8e7741bd23882f424255d4682fd56f3baf7c800821841042082184104208218410425c2f27aad0a624a102f8c06cd66938ae770fd08bb29a693caae1aa2cc73d672b6fbdb5897b1a8ad8d1159034ea297c6c239ea53bd99abf999dcf25616e098876b454f26c491b8f6cdaccd6977fc11b1950fcc40f28fa502571f54bec7d3216c5eda6d9076da72171cbabe42db072c5f2a8ed0a96895eeaea356a0f3a302d7b89375e5c8aa57e07abb3cb098cb9361c2ac79dbc93b7deda84ada188a283eee0cafb34aadfacc1dde2a2e2d091ce98cd6917ae16889c1c19708408cc6670b91aafe18518b9eb1a70d55bbd80095378c0c6d0aeb42bc35b43e51f69faf567a01ddac1ea3585541cdcc8fc474b70f90384da6f9d68a65852533a3baa129bc1934ba270fdbc986a036c2969c4782b29dc51d339756fab0bc73b1a86390273f8954772feda89fa40c2802338dd9587f166ac252d60d4ab79f666f63eb7146bdd7a163c5d8507d300a5fbeceb741b7357a463f5ffae58acdc333d12ccb1cc7f34059bc5826d510a77871a442667907c9705f3d42492a77bd11a9b3bcb4c9ec9fc25c94c0b0588c01c017a8ba7b35ed171c45aa3ba8fa74c54b1aa16981847faf793b04eb410979c4094aed17826a062a1b1a467ccc4dbd8e7f389867a5cbe4822a3825931d9821a69c27bbc8ea12757164208218410420821841042082184b836b42a0d75b63ffa126ec1fa4d2b510183df2c5355a2c7829ab28ab49916cc77ce25d9069ad61917d1df2ce4e5d65416cff4c743cc09ccfd664f6cc45d5e82e3b48bd25d7b28dab587522d8ab9f79af19c3200055bd6569647d7b27ddd0af23f482267419f016e5d1433ea0c2b6a6818773fb48ab459566c299bd9f6fd58dc55a51c6ee9c91af340efbaba3ed0822b1f6ae5917f7d92b405e9e465a574067d5b753c8049e913ef0935f07abd5fa88174d77c36e5408a620274081c95e8356803a2c2af0c860d955f6164e9d79f82fac093ec7d6015ae9f2d63fe8f0bd9fd763a3b9314dc4dcd106e4519dd93f79e7b63515e6dc4d50cc9b14ff2c6cf4d3cfb7c010f3d14437c8215fd031d737c02f17daf92cfc92fdf8926f5c901c2ad2d95ec3a9ac0d6e7acbd366be51b2935af25efc50c929f7998650f3d0cbffc05cb071ae5ead3a8fe79158d9336b02da9cf4d16aa4060c05651fa7cf110d6394fb8d7ff1d466c3a5bef7253fdda0e5e6e86660fb40566ef774ef1c0fd9b5030f0fa7ae7501fddc9f283768a5fb332ffd184ce6997750f4ded0aa6202fb912ae60e81e741fd7f98e10420821841042082184104208218400d0707c1049c2e3019b42fbc65a80d1a074c72e144c26686bf70206b5bfa9418f4c42ed4e37f58ab7bc7fbc01d38c2dac5add132f5a15b86f258ea737a553f9dd2a4c993b875ea611506eeaa9a1edde782c3b6bd14e4377e13e75c5f006577e22581ed8c0de070232879b88803eb1212f5e2f98c24d579eabcfd1751de16ab65a51d1690a1c9578a6091d95e829575eb6a1f28f34fdc651b03e9ac32353759a9b3b3b92394201dd831e106e572644620e35778f60b524ac64e7fffb356fbdf102797fe7a1ee64148b1f4fb9b283ffc1d1399d707f4df2b928dbdbc8fcdcf4801b0c70db599fd78c6d8e193093b8e955f2ee6d207f4725034eb61caa72775c247afd919ee97eafd6e92ad63fb41ee7f40c729e5a45e2e411eeaf4bab0b5723a8f7da7ad6b80d051346efc0fb1094cf71116921841042082184104208218410427cc53456e19a9c8c6d0403c174dd0bc6393c03a41bed065a7d7d9f38908e1eb041d715acd6364a7f5244dd30e22a0098cd44849a88e867a6d62e6d03270d5d3ed24ab4193c67025ad8aea39f51b04e993accca5e5fd735e04a6c32c9d11aaee33d53beea0d2eb4e824e6c75e45fe91a6df48a1b71019a9628de98c8aaa331388f2d5535bdf93c5d03d705722f113fb94f5b928ceb3e35dba859c842be3f375bfaee97f3a619f1bc7ae2a2c192b89eb4a348cce21d50df5b8bc6198ba038b16167f2f01e554e380372280f9ae14964fad61f5d691ad71ea2cca669f398d276606d47ab837ee150caa0bd6537b573ac95303f61ba91239da40bf10dc3e8c5603a2542c32ba5508218410420821841042082184103780fb6d1791b34712bc52506f8fc2a8abc5d9d227c91f7fb15aad781dbbd97da427c2631c29a3f44457252ad9f56e3cbbfe7d03734f15b1f165d79047352e05fc778b1b4f641cb1d1c1d77ab0f2ee4305643eba86e2a3fefa2a09a4269b711dafef89519d72d1e0b53137490dfea037c0d5075cdb83c8131ac7ea279371bd59e15f1fd34dc5af1a99fbe413c429003a8e9c07599853d5195d1f2aff48d3875bff61304e545176a8be735a5a40af29c131792dab6776feae2464b0768e87cafd5d234a750ebfd5c8fcf54be935f1afcf8de3e97fc13e398f03cf25f51354ada7e29d685267f749f169543cbd1ec7442b1cafa1faed2a1c074bc8cd2ea1c107d8924930d552fd4ecf4dd5f4a11b754e024377c9365c871c9dfbe93e9e01040c036f07fa19556af87f6f6b6dc3385a4169bd46dda1120ebbc068d170fed6ff65453bbdca7696ebbbffde79f0d552f92b8dde83d101ab0ddbd8269a4f0f387637808e76da4bd45fdb82380f420821841042082184104208218410fd309c143e348fac035a10bfbb397cdc4c62df78abcfc0e81b6b317a622d3df93a7fc4a52f25ce5749fe8f4aa8d3c1687450eb32d04fd6e33cada32e5ace5c733d85df5d48d6f32514efca26f32548fc1b0037653b6a895f958265523a9bffc5c6b11d1b293e39407b007c4db84e74fdae535d59cbb4cc7412433b2beaf571e560bb5e719d41cafb5cecfbc90eca2aede4eeacf407581592b39ee06e6745f73ab1ae8315e84bd60ebc5ce6e7e42ac6f4e9d455965156d384a157b2fb400c8f2f8a1b7074a065c94fd97be619f2d76c2432f41cfcd34bec5dd235f9ab81ee6e44f3e9dd91e9c1f38f3c7db8f50f56d3bba56c7fba92a726c493f84d95e8e9296c7d3ea9679a5b54d25f3c80f7997cb2725cd84c1ebc7ff753f292fc81d3c61a2ade71e13ade8c69f64f79eb016bff734fd757503d792e4ff48ab7baa9f8d177c8dcaf61504971408aeda9ff262f143027b16d5f13b9db56b0fe37f1a8a6269a58c5de1f0dfdf584f69e0b6f684cf78aaac6892a5eae6cc068f4b0efe74e2c0f98a82ba9e498d144f3eb76aa27cd25e2683195c70d9a5af6633fa2b278c55a52df2920f79146163fb595c7175a711ca8a4367431ea9112ecffad755e8f43f164aa2ef6fdda857112ec079cac9b03875f77a0198d54be5a4962560a5633800945d139f65e13047ec9109e406a9299fce32e206ef0c6190dd47da092f2af43e41342082184104208218410420821841888cf4bb3a6d1d8b5b6e460bfbb6ba83327931e189b6a75e1f0c75a9af6db99afce858a526a5a0d385884c3968efa819dd2770ddc663bc5bf8d61f9ac27d9f7b297d5cf1470ffdfda495c9041bc55c536d64b930edcb5889dffee41c9de43e9d6026aee5dcad6dd195843dd387296f1f43b367679010c8c7033117a25f93fc8c6b46503e9d63ef5070835d3e6dc43ee2933265da359ddc2de4c2bf8dc54bf5c4aed1903e35745386c8b50b5f29eba1e8961f91d8394070855494c89e3e5d33a890fccec89914d5dc9deed3b78fae96c6a2718e8a6551cc8ef67c0e2e72ca4a3a3a363b00c9b366da2acac8ceaeab783dae1ce9dbb8795ff8be6cb5eff9118a8edd53ffe16cb5a36f1fecb295fa8058841c7febde9ec9efa26bfddd427607ab480d93926f6fec793bd4710f7756423b30ba278f5ffad9411ae420821841042082184104208218408da572aa6d46267c9df3c8fb5f4f7e4cdfa1cca7fc15ddf355cc55f8469d3a71239d1fc050bb6029889b4441163ed27543a632d9be36a297e7bb06985752a5e6f24755386045b851042082184104208218410420821c4559180ab189265d15a16b7d6e06cfdbc6bd2875e436d7b066bd32cfd242a24e66e21bea6888ad3fd17771f2ac1357b2b6b63bf78a1642184104208218410420821841042882f8cf6ce1fc6a5cfa9fc179c045cc5d0c2e358fb5c1a9eca4a9ceecfbb327ea79d9455192c7e6e25b681e2a5a12a69b9ab508f3bb9a2da8d4ede5733589bd25fb05608218410420821841042082184104200e076525654ce3143a3fab53d384e1a4397b996e5bf044287ce2204106e2579c9a0aba1de5893e2485b144c4633b6a4b82b3747c79178adeb248410420821841042082184104208f197c61247daa65f90b6e9732aff2510d2d1d1d13158864d9b3671fcf871a64f9f1ef44e879bff8be6cb5eff91f82ab75d0821841042082184104208218410623824ae2220c8806b595959d03b9c3e7d3ac78f1f1f71c53e2f5ff6fa8fc457b9ed420821841042082184104208218410c3217115d125e82985ababdf0e2adfce9dbb397efc78d0f9bf68beecf51f89af72db8510420821841042082184104208218643e22aa2cba8cfbb024208218410420821841042082184104208f1652501572184104208218410420821841042082184b84a1270150330a8ceb98f19ff5c8e7bc4bb72e3dc5fc0b27f9c47fe91abdb85fb4839f98fcf63764ecdf0cafdd64ef1212de8fcc6d98de49e31865bbd61717e948dfdd2753dc45533ce6e24f7d33fe268ca66e11f1fa6d87b9d0ed4e1c6f94901cbfe348ffcf357263b3fcae6ff3b5f45b1f630b38f175037e84ad3416877f5b4a9bfcb3b58baaf9cf51f3947580111b48e7a0adf9bcec28f5dd77cd737e2feeea151f4e73d8cac1506dad912d637dcc7c28f07788ef9ea29fbbf15dcffc73538baee13af9d25c7e6f47b6f0d26a867d310f76ef00c5c9fee20ffa3352cfce37d2cd42ad1467a9f5f6b81cf856bf12c6cada76c6f3975fa35d89710420821841042082184f88be2fc49367637d06867c95fcfb9e1b19411f3e9d41ddc41d6b7ef23b3fc46bd83fd62197ec0b5b192dc87eee38edb2773c7cc0759bfbf9e214f9dcf8d73ff4696fc63360e5fb00732d0aaec14bf564e45550d7581513f9f8bc27f9ccc8409b776fe9bb6828ac01798431ccf385145d10fe7b1e4c5e00371c3a5fdec61a62dd843e011dc6fef60d9df4fe76b5f9bc28cb92b28fa6defb7aec6d11232e77e8b3b6e9fc28c05d9949dbccabab73829db5b82fd6015d547b4eeeb63bc574eee0fd7909b5740fe8fd790f57ccd20c15405f59b4924c447630ebed903b298751a8eeb5cdd3b6b03c56281937534b5075fca7d6823db8fc7b3fc01f5cac4f305cc3af618f65e9dd7a0fa3cc49b95abaa65503aeaa96e8f65ee4dd7ef1057cfdffe5b2ca8a39a39f6d91077b6e142bb7c9587ea00cb689d06a39f3ee13f47ff34360e6b48230d9719fa1933a48821da3470baeea9c56c8e1b710d3e2f7a9b8b2f557c272412dbd8b9249822aff18e6fc0fd1dc85b85767312d611eec03777730000200049444154264c89c0e3d5681b30c72d583a1aa90b0c94de1443e22d09d886f39c09f6d934d8bd3b60190d579fcc86672399e7acacbbfd050e7c238d368f1dc717eeffc3867a6e0c53782c698b2c54fc7807ced66bb34b21841042082184104208f117c0574f754b2c732d803986c4a4046c96abd9d1d5c552ae95a868138df5da35789fdf8f21e282fa9112b27eb886f53f5e43664e39aecfe15d63e8b072fbea295c57829eb0969d8b3cd4fcbc90e21f3d86d7fc5fec4c19282c67a0bd53cbb1df54e1688c677950c7d1a8c87b9eba7b3790f3e895bd4aaf2aa12e2e87ad4bfc2fceef4c22b5fbf0431ccf5d4f755d2d8e4375b44d0fa63257e14409eb77d4a04f49ecd9d668e7a9ad0dd832f248a581d29d45e43ea263fecfd7498f065aaad87ec06071c12b3cdee460fbd305acfeb195c43732e83e0341d45d3fb287dcd71596e766600bbc248693677f504cc4bffd9ab57701e8943dfa0f3cb5ffd7bcbab4ff3b575db4999d233e19806241fda695a8d0abfda242c11c1d4fcce46114396de7a9bd11ac7da3ff7087e1d3686e6f460f0c1876d452dd11cfbad15759cd605c74d01cb688ab7a565e6f5dedbfd98239dc4a24838dea34a86eda43e3a41750af669cfc280b6ab89528fae9135de728c40cca350aba8db6601dac4d03a6eb385a1512265e9b6adc701df5147f5c43ea9dd66bf2e1c48d6121f9f61748bed6bbbd11f777004d771169ce18e15e142c61b1c484c2809fd884aadc3326baf7b6d171acba63981f0904fb6c1aecde1d80def23cc5a35e60aba96b8b41f5d90abca1692800639fe4adbb8757dd1b62a8e7c6d59898c0ba45952cc9a9e2d51792be44f7a510420821841042082184b86ede73d03cddff6ece1cc7aa17ae7600d055c452ae95503396d858a2c3b92e0380068d0b9e2c21f307352cfe8f5748b380ebf9793c9a6de6ad1bfcfe6d7801d7fa639856bfcece84ce06a5a65851fee141ecbf72b22d2589fec70d29a809293c72a68cdcaa600ea253fdf40f289bfe6fbcfa407faf7e354a0f2a64bcb092c47e0f38c4f12cb1242f80da9d455407539de1f2b9282a6a26718195ea3f06d4fa9d73a4ed7b89547fe0262dcec4fdff5048458d4efa5233185379fcd9242ca100b16cfdc8c1acd79b69f2e1df1644dd4f949099d7c4aa9f6fc616de27ed9493dac6481e9fd4b5c18c75aa42834b831b11fe0b5506e81fc31074a0c4a07ac7f334cdf9776c03f470e5e618d451106d0a2875be06237cd575bd01ebf466ac13fa1971fb05d0b7fda641f26a2dd9ac6f69e2894983641acaa8fefb44af73143282fdf763b036f59bde5e436d483279d7b81e37864ef54759ec6e4b25f5f3aeca17c08db8bf7bb8a9698b24f95a3c5a83e87bca35e89fc37a360d70eff6c7b86827eb5429caed2f046cf5d27c491feeff817c6e867a6e0c97323b8dd867d6b3bb3e899cd86bbc7321841042082184104208f1a55357d58c75d1358c1bdca04127fd31855e8f80eb60714103c7ce426a676ce535fffb58eba254a2fe369fe21549fe018837c6f0c6a6c5a6b32a21a035e1f1c4db1494f0a15fbe2aa3837b3d6bd414b0fe5024567d3f598f3ec8fddfcbc65e6f04a4efa1a87c0f4bee9ec3921c3bce96ab385ea882e9babce835a87b710fdef455248ced9da22e5ad91d6c05606a1c77479a3075bdc99da4f6045601c36b2271e9d22b038603d65da338bb10cf5d5138f356b0e4db0f92b9ad0a77d794ca9363b9db5c83fd35977f38b79bda13913cf270ff5f4ae8ef5551b4e64166fdb31d9dae79bfe7303ba70aad72230b674ee18e990f537434605c766b3df667b2599f934de682792cdb36c094c5ba8b8a6d0f33c3329dacb70174ea0e16b070ea6466e5d5f7e473d750b87a05eb733692f5c36c4afb4cb16cbc574ee1331b59fff883ccfefb87c93de81f03d65249c94185f87b0799cc33cc8ad514434c40a0a24ed7898f3083b78afc86e94cf8fd74969c72fadbe0c679fa3166bdb7118717f03929fa7005591f6d24ab611e0bff5cdeb9fe60bb86a3299b257f7a8ce273e564fd693ad35c76ffe83417359fa9249bc07d76230bff702b13feb4068717dce7f790f9c7c94c38f630f9673b87dcebe777b0e4d81cd6b7fc0ff60feee36bbf9fce928febd1db5d54343ec81dbf9fccec0fedd4f9800e8d8a0fe730c355425d6b25ebff349909efce23f7bc1bc35b45a1eb5b4cf8fdb7c8fcd87f4d8c1a72dffb160b3faae97ef875b73ff01cb73b29fa600ed3de9dcefd5a5567596f2576cf319a3941d947d9ac6f7a9bdf9fddc3faf7ef23f3130d67d30a661f9bc2b43fada1cc6be0f614b0e48f53f8da1fe690d532d48ac03de7e80a1d2e8ade9fc2b4f73752dc528f9bce60cefa0fd690fb5136cbde9b476673e014e706ae4f3692797223b9da0a324f3b69eaddba21d2c1d06b51c6c5a374e8d4b5ec20ebfdfbc8fc54a3fad463cc3a3a8569ef1750eda3735dcb4f0bc83c3e8fdcb3f5d84fce61dabb5398d15080e35210e95dc7bb584e61e346d67ff020b3fff430b92d5de31add54ffdf0a32b502724f3ec8ecf737064cbf6a50e7dec8fa8f0ac83d398f69efcea3c80b6ecf7eca2e36a35f72b0fdcfd9149eed3cf7dad93de46ad96436cc61d6fb6bb0b71a808eebcc9ecef67de2a4f8c47ddc51b706bba79cfc0fe6305bab423bb391857553b8a3ee618a5afd4f910be5e49f9cc76cad92ea530f32e30f73c83d6774d6b7a9805c6d0d4b8edfc7fd27f7e00c98dedd7db680ac3fefa0e8d41aee3f7a2b13defd16b3df5f83dd6ba0794ac875ddc792c0354b3b5c947d944d6ee346b25c0fb2f0cf76eafc5362b8cf0f5ec72e81fd7bc07ee3aba7e2f41a16fe690d15172b59ffde74bef6eeb7b8bfebfe1e2abdcba5c3d48526600b31d0ced9c975cd61e16927d5a71f63d6d1c9dcf1c7c7283caf036eea3eddc8c2a39399f551bdbf3d76d61f9fccd7deef3d253d1d8d383e7a981947a730e3bd35d82f0e3027c6006bac1a6d95e46bd9e46a2b5878fcc180be0581f79dd1564591f630b34ed8a93b5bc0c2bace7b37d33dd8f20103f4cf0e17159f56d1d06e50f76936eb353b75976a28faf37acada0c9acf1591f5e76c8acffbf7ecada250cb26b7319b65ef3f48e6c75dcfa7fefbe78173e5149e9cc7ac3f57a17976b0ec4fd3b9e3d83c72cfba31bc95e4beff2dee78777aafe75c2fc15e4f0678160ea37c2fa136e26d8d94bd5a737da65711420821841042082184105f222e6a4ea9244703861be7fe0296fde3bcce355c7bad8baa51bded31664d9dc2b405055407bef0ba9a588a4fa37ad763ccfadaad4cb8670515a7c17d680db3a6cd23f7a0ebcaf7563e37ce030564ce9d476e553df61fce61daed5398f19d021c7d5ffbfb9aa8fec9c3cc9a3a85195d750daabc81f3f9079936f53e320ff4bcbf1c342ee8abc551a5a3dea9f6c42927c56235bb385ce5ba8aeb71f5861770bd22d0d744738bcafc94f86b541d9d8a9f95d17ca78db9dfdbc0ce9fbdc43a4b0d4f7d6719f6d39d39bc51296c7ef105d62d8c44fbf91ae67f7b05658dd7e8f023641c2da2d897c11333fb1943d5f7dcb5ba690e4d2275f695798dfa12b6d72593f7fd617cd170743fc5ef44101397c413cfbdc46b5b9271ef59c6fc3c67e78da12490f3c2523c3bbecba32f3aa93b7498881fbdc2aa81a2fbe16668ac4533000c9449d1984ebad09c9554b62f66ef5bbf665d740ddb7756fa5f646bd87fb89eba391bd89abf85bdff1a47ddb6153c5bd5cfeb64b395d4958bb175f77e33b6054b49099c26d9a8a7f0b18d7896ee646bfe66763e9784b925605f2d953c5bd2c6239b36b3f5e55ff04606143ff1038a4e80f1ce61aabdd1c4dc31c8f90ab1126fb6d17d863b9c1cbe1c4b6228604a22475d4b6208448eb1f9c7ff5ab0de1c4dead773483681f3f4bff0ac6f2edb6edfccce294b51cee452741ee8808890666a8d7a2af5365223d3993f268a3080b62a34250915b08cdfcce65b63518846358165dc4a9e8d4cc08c4a4244e783c11c66c53a61337913ff9e74752d734719986fb6621e6d25f5f60da42b101196d019940f51519578d64667600b4f216f723a2a66624c161453126b6fcf202ee416d45b123adba3c4a08e59cae6af27748ef80b6c7fb746aa5b1a889dfc26d5df988bbb259f7d1701530a3991c9443295b4dbb7b0357206b7de04ae8b1aaef3bf420bdfc0c1989f32b7a394a7ffbc917d9792d93aed1d0e8c87d253bb710e16880838477d19ad551c336de5ad98cd2c9f188b0517c5da33b8c66e20eff62dec8d8aa1faf46e0e7705e25ab2c83c6b25e78ecde4a92fb12edcdb2be832547ad79a9f89fe353fa3c2cc345ed4709d2dc77dcb56deba6b13f7788bd8d1a2010a96d15eeabc1ab5671d986e7b8937d4a5582eee60f59fcb710f990ef82a79d6ddc623d19bd93ae517bc711b146b3fa0a80d8cb30564b644901ebd81bc3bb7b0b8a384fc4ffc1f2778ede47b54d6ddbe81bc3bdf64df6d3128802562256b2354949b9259f78d2dac1d6fc1385f40a137893c750b7b63de24e7e6c33cf5613ececba0847a69bce8a2cee324e2d695a4df72279395684c860badb592ca8ec5ec9dfe6bd6dd5cc3f6d395e81830ca8cb7ad0eed4205f561ab58353e9e98d1e0fab8809af0b5e4a92f7060da16e22fe6f3c847559dcf22ef1e32b53ae2273fc9aac92fb0372a0e85a92cffab17483741d84d0acd17353cddd741a7e2c3c7a850d69217bd999d535f20c57886873eb0a361a0dc3c581dfbb9bf07ed3791447534f03be31865673ca4441fe0b5c8a9682d59fc4bb31644babf6f79eabbd7fd0d0b0d436f73a19d2ba35e59cb6b5377921ae220ff64018e760bb65b334809ebe9759671e9a48fbbf20ed0f472ea4ccbf969f42a6c974ac9fadf8d54f7b70e430798fbaeb1eaabe2a90f2b8899b4853cf525b69a3d146bcf50d615040fb8efbca191288613cda8a4d48867f39457c81b778eb2ffcb62fb857e8ec720fd33c44adaede9c48f52b0ddba85ad6a3ab69b1258f58dada4852944deb28a9ddfd8c2f2710a5cae21f783224c962de4456fe1d52919e07e8c874ebba0a3fffe69196dc1ebad436babc4d19ec0b69837c91ba351fc5116cf9e35587cc77ff1b63a17ed9302ecfd2e821bdcf51cf0591874f9be1462ee8ca6e96d47e7073342082184104208218410e2abeb4415da14ff3b711f98cd3a0dc77bdeed4559cd341ed5705596e39eb395b7dedac43d0d45ece80a485e6d2ce54395c4d52fb1f7c95814b79b661fb49d86c42daf92b7c07ae520cb7605cb442f75f51ab5071d9896bdc41b2f2ec552bf83d5d9e5bd06df351c2ac79dbc93b7deda84ada188a283eee0cafb34aadfacc1dde2a2e2d091eea0efa071c1d32e5c2d1039397079c208cc6670b96e6cf0f06a565fec71e2573826ae65ddec114f16dbc9e7a4fa1d2fd68414e22602a11692d76770cf851af61de88c449ba72690ba289db5cfbdcefffce74ba4b657f2d433e5d7654ee8616975b2fb5513cb57c70635d5a2bbf230de8cb5a4f55a1bd2403bb483d56b0aa938b891f98f96e00af265acf65b279a29b6739a674089cde0c92551b87e5e4cb5bf579a676f66ef734bb1d6ad67c1d35578069928d11c1d47ac35caff9b82799215753228b645ac5a108b65a295e4042bde468d66802325ec6e8863f1dff903c83333d8faec06d26c039c8dd0bedbc37a0d73d7df2ce4e5d65416cff4e7332730f79b3d65dce525384ebb28ddb587a25d7b28d5a2987baf19cf2903ed840b6f68149183cd1d1a6265f9d702a6c16e75a087cded995cd99446fa3883c3671cfebee5a6a23582d4b19d252c6392583e7e6667f99008cca3743c970c0855891b6b25120b09b7a6937ceb06b67e3d090ba0e91aaab967d4ad6d422a31460515173b7fb798ac44b65750e6e9bc60baa796888884ce6384a6906656a8d6fdf5095189b9197e77f6579da3e03aea715c8a65aeff922ae63452426ba8f08f6a44b1a28e725171c6bf16a1b702ede6146c5d237cfbb61f8068122de9249acc58c6271147a33f00dff75c9a51c363b18e0675dc52d2c6a9984d29a48d35a38f8a65f96d71a8a11612cdf1987d8d6897fbd9875fdf73e4af2c6dad253cf5c92dac5317a1768f4a8ec03a368d94b1fe0b1d7a0b111d6e9a2f779e8f979baab04e58dc9ddf7a4b4240807d887480cb3554134fe2a8ce365ac254a243401dbf8ab47116cca6b9248781e675779e83715654c2b8fbd655a48db3629bb8996db7c6e23e5fcae1f621d27de06e29c1f1998bd2d37b283abd8752238ab9e1663c868172f34ce64f48665a4867bbcda3406ff78724db759a5bcbd87556c34021eeb60ce2fb1d05af53e12ea7f1b34a8a4eefa1e8f47eea46c593783334b59b51c7c5113d4a41352f256d7c3a79dfc8624e9815351494318b583531164ba895e47156bc97349a51b08c49e0ee9b81b054964f4862b9ba85f431b5147fd240f3f992cee33439212c81bb694203dce7aaf95d884ab4bf8eeab804549afd7d4bc132269e989b02aa7db184424f34c9e3fdbd3344e5114b2a5cd843f17905b332581dfd7af5ef41fa4da885b831d19850499b944e62782cc993b7b02e1c7e77e657b8864af79fe7ea8b66e68eed6a4f2cea4d601e9bceaa89b158c72e62dbe474545f19a5e70c2020dada25e4cae7a66afe116b6f4b2271e293ecbd2303abaf0cfbb97e6ec8519deb8e46056cd23e29e4b06931a9fef36ab56c66dbe474e2fccfdcc0fbce7c532c772b11109acceaa8246ce1092c5737901a524fd999fed7321db47f06c9fd6911761248ee3a1d37a5f0c48448eadc7b70740cd03fc3e3b1296032a5b07c621c96502b8bc7c7437b1489518bb02966d4f109d8d068e8efd915d4f584019f854197bf52e4a44838e5a2e1ccb04e9310420821841042082184f80ba35569a8b3fdefc4c32d58bf6925aaebfd6ea819cb5495e8b1a0a6ac226da605f39d7349b681a675befb1f492c05146c595b591e5dcbf6752bc8ff20899c0503ac93a6985167585143c3b8fba155a4cdb2624bd9ccb6efc7e2ae2ae570c0a8d398077ad7d5f581165cf9502b8ffceb93a42d48272f2ba53b7e33685cb055c70398943eef54430dbc5eef0d9d616e0413eb6ad85f6a223d7fe5b55b01b4b589661dc2c2237ab659e289b3c23ead11e81d8851ee5cc4aee76a98f5c3c3d41a8b48be4671dfe133a8de598679d59601d70ceda5a5925d4713d8fa5cdfc09282fac093ec7d6015ae9f2d63fe8f0bd9fd763a3b93866e98bba919c2ad28dd414b857bee8d4579b511573324478356be9152f35af25ecc20f9998759f6d0c3f0cb5fb07ca051aefdcdf31dd03ec564021f787de03eee421b1b8fb9fb41a0929c79b5738e1bd4fea6063d3209b5fb78a65ef579ff7803a6195b58b5bae71caef2ff743ace610431cd75a03a8f8eedb6c09e6c267562124f6b762a2ea590de5e41839242ba3f38a7deba993c9f93b2d3fb69e8d07177f45e09d7840973afcf19341cde4812023fb21893c2e2b0424acfb8583b46c5e131b0851b1c3eeb401f9f80e36204c9dd017985b9e3e7f2945641757b0aa9972aa80b4d41bd504ad9c595acbdecc0139ed153879038e647a8cc3f5381db928172a61ad32d36b4b31538bf1e87c5a3a18ecf18a4fd5d470d68d1282fdecb46afad812dee0c3ef76c091bd52790340ac2f0c280235cfb394700ed4ef23fd84f58d47f61edb556a585e4dbb7a05faca4e8a33abc1dfe690e2e03de1aaa8d08e2031fb221016b310e950e18e7aa31c6aeedddda90c0f532154c21d0d6338eb0736b40b0cc362e1ecb27fe91e2cae0e9ef5f6cc034660bab265dd9a7219dad63dc54bb77f0f267d0dc0edd03f6c217f1c42dfb597df23e2ac76690f3f5b5a4f53b2573230d5eb0defe24ab6ee9dab832201d4c21601edd4fe180f3ae8c364107783b7ab62ba3cd3de7c9a8c7d51e4d46d44a52fbf9a4c70835636af7a077950f31612212f5e62b8f05a05fa8a50153cfb30550c6cde46e4aa96f73c33865c83af6eedf83f49b9e3d04ec4f257eac155a349a3abafe0a0d92de5e45eda80452fbb44319d573dd955b12b085d8717f368c4f8502db373691f85125347ea6d3ef1adcbdd65835a8bbe8222c701ded9b1248efbecffab9ef42faec233481843085c346230671573e01c207e99f4131f8dd0527ded1c904fcf527263c16d327c7a86b83e431fdf54f05427af75765b4d2fb53a21005056390e74ed77ebafebbbfeb3dd4b37090f203acaf6b3299008de6012ea110420821841042082184f82ad0707c1049c2e3019b42fb896d8c06a5fbfda882c9046ded5e461a4be9dc5d1c4f6f4aa7f2bb5598327732d838b6ee223705bce3be371ecbce5ab4d3d05db84f5d31bcc1959f08960736b0f781418edd372e186e2282ce38550f2f5e2f98c24dc38a138dd4558e7035a8fbd97ec8c821f55abe283445603681476feed9161a49e444080befff322bf72631d020ca1bc6e7c0bea784f5f7dcca84099dff666fabc7a8d9c80ccb7de41f0dcceba26c6f23f373d3036e80be14ac8fe6f0c8549de666ef40997a314728a07bd003c2f5ca8448cca166cce180dbcefabc666c73cc8099c44daf92776f03f93b2aafcde8609f01a7ae1c0169b45eddf703baee05e31c038d9132da0db4fafa3e75d7d1bb36f88ce0bf5ce8a8c7e1b392d0a71f29e3d3993faa86b2160dd7598d98889e07927e7e074b3ea8c062d940cea414ac43dd49de2a5c3725f78c2805c04acaf8781af432ea8c4aaa47a5b1edb624d0cb70b456702cb4777ec59cc2dc902a2aceba71b668c44f5ecb62938b8a1627d51ecf15ebafc64d4841bd58c92fbd2e4a5b559e98bc9444dfaf28f5d45319b84eea00edbfe1fa3d47c0e8381eb9cdc6b1d36b28ba18986050d7f418cbdc90f2f50dac9d68ebf96370d9834e1bfa4023c4874ac7e077e70de2cdc1fc791944a899084c440cd43f02d20d0cb48bfdf4691f6054b1be613dce3119e47c7d158981234051499bf25fbca566a07a4bc86c58e85f47b52f2fde8e268eb5f699eaf4b2de19fcbc86da3aeaa9bbd867a34fc70094f16bc91be7a2e28c7f75e4d65a18bfbc7bf4655f9d77b24ef367011b474760a277f07a4057f4ef41facd00cca11110a2f43716f58a74dde35ff777b01d86747e901118841d9ece60bf39e8f25e9a0ced8a29b38dcb0c7cdff562266214980203ebbd763558ff0c528717da759a02faa2121a818209d3c8e6e218b6a1aef735291f0a60c2d4df874d42082184104208218410e2aba1b10ad7e4e4e006f20d60c4b11440d715acd6364a7f5234fc25b0cc6622424d44840f9c65d0c1194194efab575c30d24ab4193c6702ce40bb8e7e46c13a656af03bbd06aee235a681eb4011b5b655a4dfa5746f33aec5b85c259ec43868387a2c60be670ffa852812126cfd97696ec49b3097f8cf3358149a4ccee1ffe6edffe9f9f7eaf7ad28335672e03f5fe1f1aeb5497d6e1cbbaab064ac24aeeb0dbf31406030f416222355ac31c1057cd4990944f9eaa9adefd966e81eb82b91f88940433d2e6f58c0cb5d0b8bbf978072aa71c01b71382c53ad449da9c05e163053b7bb927d55038773150c7a0607b6417b4f8a7a7b14465d6defc58f01fc37bbd56ac5ebd8cdee233d67cf385246e909b07c3d1aa5b50d6f7feb1bf6e7a28366533feb868624903e41e5772dcfb0fdb3bbbba7eb0517c51f1562443cd16bcd536390a095fb9c8b4873ec15dbd58814ee312a293c558b3a310e73c462e68eaa61f74747888ae8937f540269e6081c9fe6b2ef7222a98a95b4f1361ace6ca4e8727c9ff55781f05452955a4a4fed410b4fc5aaa4b278ac875f7ebc11cd94dad3de81da7f830d748ec044ccd7b6901356c7b37fde415dd779be544afe698db8db5202a619f653a25171537ba1beefce824befa8a5e6723cc957f1872ef07e362eb9f184c6116b1a3add6ab2e2bdb09bdd1702faf4f9324adbc0d994cdbed1693c3136e079d0751ebc35547bcdd86eddcc9b7ffd266bc35cd83fadf127061c38c44acccde0fc640f8e803f9aae4fcba81d649ae76153acc48c72b1efe3c079fbdd947d5ae59f0e3b926893155a8b296adac3be8ee5bcfa8da401839e963171a8d4517b21e059e2f3e0c546e2d8209e8f7dfbf760fd6600faa566cc63e3071cadd893ae53ddaa74affb1ba8d7f3a15d47efb012efff90c8144267c0b14bc7107f50db35b4cbf1c48f0bea7b33624c56b850de6b1d53dd63a7c218e4beeb08ecab4d345f36113fb6ffbfc383f6cfeedf076b93826d8c0d8c1a6a0302eb86cf8371731cf103cf7e7f5d0c75bdaf4579ef056ff7076542082184104208218410e2abc9fdb68bc8d9fdbd130fd6c862299d95a864d7bbf1ecfaf70dcc3d55c4c697075b28cb5ffe52c07fb7b8f144c6111b1d7cad072bef3e5440e6a36b283e3ac8fbc4c0b8a092406ab219d7f1fa9ef799a75c34786dcc4dbab1518f61065c0d5caf65b3dda5a25ea8a3faed1a1c87ca295ab791d2e6214ab603be2be3d8eef235dcffd00e9c068085c5ab3350dfd94fe97bfe0c27aaa81d9bc113490aa05191974de121adf3c4b538297a5e63f1bf2ebae265fd40c7033a4763fafc3faf0905f5ae586cb13dffd4890a8c8dc21a6bc5a2003e8d8aa7d7e3986885e33554bf5d85e36009b9d92534f8c0385145d9a1faee11777a4d098ec96b593d33b8ba2b0919ac9de3a1727fd788559dc36f35327ffdd2ce29116dc924986aa97e27e015fa876ed439090307dadae9be29c13f24bbefd70d3e7f90e0de0cd2ffc64bc5d34bc8da554ed9fe1d643e51833adbd25d6f03a3a7fc6815f54e2f3507edd49da8a7e2c5121ca70c9a4fd452775a272e7d2971be4af27f54429d0e46a3835a97817eb21ee7691d75d172e69aeb29fcee42b29e2fa1785736992f41e2df803a2396281a691ca24f7671e9cda8e6fecf82edd6346c460d8c4dea99f5b1c3c0db01c73c6538bd2eaa3f29a7b61df4cf6aa9bed01962f2e20d08b0b839dc6626b1bf2f344ca9a4846b54fbe2996fa233a81a114143879594317d332bdc332189888bf5448eef5c7f569d90c63ded1a91e392af0c5885c4b238c24add05489c6001cc244f48c230146c137a86a60fd4fece09097aeb6ed32813261a69f0ba719d73e2a6732e746f6090658000747758e9b2bf4f00039ea30ee0b217b0b2fc1b9b48fcac90ac8f6a3afb78bb81818bea3335685e27f64f9d34e1a1f9620d4e5f2ae9112aae4fb2c83debc6e8d0a93b5747138dd45d70e11e3544fab91af4f07e82801dfd04d67bfdde84eb62d708529d6a4f2dd32ce924860c9dae4e58cedc51f514feef42b24e9550fc7136996e481c0b6d1d6d18172b286dd5a83b5bc261038c4b1acef3f5e8ed4e4a9afde764741ca963ada83777ce0f1b364a015f230d9734aacf7b48bd6d31eaa512321b5690df6ca7a8f131f23fb391e8ff10c3db014647ef51f5debe6dece87515bbaf65b790041e99188b7e2e8bfb5d1bd28647d500000a2949444154297297907f328b638aff1e3a5fc87add20664c0cd1374563bd095c17b49e51b65d81b9ae9f6397f2c45805c72725b8fc79dc67ab688e58457ad8d075bca27f0fd66fba9be5c2d53542b7c349e93985472c81f7d800e9ed35d48624065cef1e9ad7d5fd1599fb6c050d639fe091310016a21533daf9322a5a5d383fdd4171ab070c17ce8beeee3b44ffacd15fdea0aea91ccfad1b58ee0f4476f6c980bf77bdee2db04ecc2031a486673f788cc24fca29fb389bcc330a8961833c9b8c7adeef0ac4b7fd0a477b1acb275afaddffa0fd1333e610d00c0df7851aeada3bdbe0bd0cc6e59e7ea4deb696c5a36b296e76faf7ac53adbb88b76410e73f9f57f64fa333507dc5b5bff26f7f77a98b252c7bef318a7b8dc01efc7a0ffa2c0ca27c7fb4c666b8cb866d8483e885104208218410420821c41788e1a4f0a179641dd082f8ddcde1e36612fbc65bfbc652000c30ae88cd74fe18492c05dc94eda8257e550a9649e96cfe171bc7766ca4f8e400ed01f035e13a11f08ebbb2966999e9fe0161c6007124822bef73b1ef273b28abb493bbb3d2ff4e6ea8b8a04272d613dcedace85e47d675b0027dc9da8197d3bc4e86357ecbf5da32e6afabc2edb353f67ccf7665f6167e3b48f4da7da49c7d6f1ec16855287db992c84529d8fcef6ddb5a34344dc1e3031450123673e0c50236e6adc113178df75313abfe6d25d650803068a9e5e5c7edbc1c1dcf3df72693f1af5b489c14fcf1d05d380eda39dc68e07adb8e7d46068b67abd7791e6737153ffa0e99fb350c2a290e48b13df5dfe48582f66e29db9faee4a909f1247e53257a7a0a5b9f4feabdb4dba07557497ff100de67f2c9ca71613379f0fedd4fc94bf2bfcd3527b16d5f13b9db56b0fe37f1a8a6269a58c5de1ff5fff584fb4809f6ffd630f44a761ffa1b1e321da6e25d03b766a7b8269af9638f507cc885d108f6f27a7296c4b2f69557f1aedb48f1d6f5d47c338d9ce736936c065a5d384a2a396634e179dd8e333a9db849b13cfe543a8e75d92c389e424ee15a926baa302c06cdad26b8eb49f6bdec65f53305dcffb776121764106f55b18df5d2a403772d62e7bf7b50b2f750bab5809a7b97b2757746673f99994acaa4321a5c06440f75655d383e53491e68eec7b074164734a38e0f782b1e124b7ae4621cff57c823278fb1eef627480f3fccf6733530de84bdd981d6e1a2f4e312e227651037fa3075a392bbd77fedcdc2fc098bd14253fcd75a2171c222169bfea9df40b8322e8db4082be963bb36a492365e233aa2ff765a272c26f57202c9fe4f2bcce317b3f8824e6af79ddf4ffb7d4eec9f38d03a1a717c524ec26d33f1784aa96d3730ce94503d7625896129a48fdd4ffec91598d46dccfd6437d5ed069eb32538c2d3b1b61f66df85260c5f25c567e279644c33bffcb486a60e0f154d55244445e3725772aca309cfa7769ca3b8e21ce9ade5ec3a5b87e1f350fa891375623cf126c8ff6405cbd8404e642aab2696b1fad3152c695bced6c9e9247a7271e83ae91166e2d457d84a16db3fbc97ca31492c1fafa22a26ccedcd1062257590f43f5cd4b145058ed673e36c2ea5e6b201678a7084a7a37aed94b619b83fb3537c3e86e5610066da5af790fb911953bb46f3cd5bd81b15b856f320e9ca2276fe9507a5710fa5cd05d4842f65eb3732b0867406a3522f1490fbbf8d2c9eb495c723ac385a2aa90d594c1c15682d0f73bf914e6a9882de91c1cec99df7b5e596c5a47e92cb532714b64dd98279dc160e442bacffb88cdda78e609bb081bdb7c7a174685437dba9bd6cd0fc692165616b490b37a1794aa8e86ae3b968e68f3e42b1eec230c0def27b968cfe1f4a2f1ab829a6f04c344f4cb0a2a010f7f557d84b36f99f96f06c9b95d4a89deceaba87c212490cc9e2e55335e897f5eec09565dc0bbc654d456fb173d83070e976cacc6b490b5749bff355bc8d1bc96c68203e2c0cefa854f67e230533c61075acc4f299cafcc0fe6d1aacdfd01dababfb349bdc33668c4b1ae6afbd42ced8def7587fe9c6d95a1897d3efdf93884b55e46b759843dc689713d875e7a2eee77b62e406523f7886ccffad63f1a49ff2c8580775a36ec1eb6b03ac2c57b7e0395dc043ae68626e0ac3647a927d5ff3afa5eaad6177cb118ccb50da5c83756264f7bdd5f4a99df9a674e24ce9ecfdab736435ee66fbffd56333afe4d9e8742c3efbc0cfa6ffbfbdfb0b6db30ae338feedd6aec5a29d52cad885b1174d41b073b8ceddac22ac43b116641b4308f6c2e2745341850d662774b583e97490ad81fe8331b30b498aa8f1c265e0482fa64da76c8268ea1fded6699a756e61cbdab3d6c60b3b2dfd9336cdd6a4e9ef7313c2394f785ece9b10de87739e1516be8177e85e0183a30647e941aa5702e321fc93bfbbab1c3c9ee8fecc81dae28df822cff35ace094e165a04222edc370dd6ad4e5a86a0fafecdd873b7f07e999303fd7ba9ed5bc7ba3cc82f7c8fb6121b24b83fbd370cd11c0f2dd7cad891df87e74a2fd1f17c3ce133d88a1fc4baec25188fc2908bc03dbba91a1fc43216f629bbba675ceff9fc16268a9f559450a89f8aa76b98dac95d444444444444444496b0b111062d8bfedbbd1f13bd8f7473b1a81ac7e42adda45a4af8949b5adb56f8dc4377ccc0a72df82b1cd87e71e3f9d6102972d3f17539f59b165a4b89e07fbb8e8673151c1b013098c22256477d34bfbc8f82c3fb71d8a7e40f905bc470d0c5814b4514442d066d87697bc90e631102ed1e7afe32982f5af0576cc36675fd9f6b6f39f5a509e201726d54d554d2fe4794aaa7364c3c679d475db06c376d473ea4a1611f3d0f18a2057bf8b879f65315ef969c783c9eb07b5f6363235eaf9740e0ecbc3ed0e93c9ed4fc4cb3d4f34f45365dbbd5f61c75d67ece3657a63b15592ec6dcecbc78147bd9799aee5dc0f832616eb878f7e63334954cde756ae1ed3fc4b5b5add4a7bb97f0d55d94fe06cef5ad3c3b532172aef169427cf0c3939c5efd155fae5d1ae5b560ff63d48ebcc18f76c7a2ff29597449afe71d888f9de1f5ad6eaa3e39c1f692b9a78b8888888888888848e6caa6baca9caeb8d9f9e851ec9ef3346d4a437c865b400f5791cc67ab3bc88e81534c6e292b22e916a2e3773f6bee9bb27f7be51a6cabcab1e5a5272b91c514e9f210ddd5a862ab8888888888888888481651c155b253fe23ec395283d5ea2674a75af58a24327156c0b41eaff31d5f0ee251c2b77ae81870e18f4530713063168148339fe56ffbefe8eb7432f1691d6a931a9f511cccf8dcd332469c893eadd96f41eb9942bce9ebe2a39803e70bb3764f171111111111111111c94c7ffffb6246d3149fe132e0f1b6c85d52b285b7dedc48b8c79a7bae482a468378ffece242dc2270d9857fd82437be5ce454d250e6643b1ef686d6f3d0770ff3c4cf8708e6bd484371fa0b50d1988fe343bd98782fee4b3e4263c98d4f13b708443a396d0c3f453b715fcff42df786d05517edd7c398611fc786be27d3334e45d2eb996a7c2cc437e10dbcfacae6ec3faa594444444444444444b24b2488b7a58b0bc62270d285ffd7249f71a71abf04a887eb144b3dff542ce76b1711111111111111111111114986ea2a72db3f65a0ebb330df2e620000000049454e44ae426082, 'gymgym');
INSERT INTO `PageCont` (`ID`, `AboutUs`, `OurMission`, `OurVision`, `PageContStatus`, `YearsExperience`, `Events`, `HappyChildren`, `FundRaised`, `Testimonial`, `imag_url`, `ContentBody`) VALUES
(6, 'About Us Our History Mission & Vision', 'Indulge in a culinary journey at our on-site restaurant, offering a variety of local and international dishes. Enjoy breakfast, lunch, or dinner in an elegant ambiance, complemented by exceptional service, fine wines, and delicious desserts for a memorable dining experience.', 'Stay active at our state-of-the-art sports club, featuring tennis and squash courts, and a modern fitness center. Our facilities cater to all your fitness needs, with professional trainers and various classes like yoga and aerobics available to enhance your workout.', '1', 'Dive into relaxation at our luxurious swimming pool, perfect for a refreshing swim or a leisurely afternoon by the water. The serene atmosphere, comfortable loungers, and attentive staff ensure your comfort and enjoyment. A shallow section is available for children.', 'Explore the city with ease using our car rental service. Choose from a range of well-maintained vehicles, from compact cars to spacious SUVs. Enjoy a hassle-free rental process, flexible periods, and competitive rates for your convenience.', 'Unwind at our sophisticated bar, featuring an extensive menu of expertly crafted cocktails, premium wines, and top-shelf spirits. The chic and relaxed ambiance is perfect for socializing, enjoying a quiet drink, or meeting new people.', 'Maintain your fitness routine at our fully-equipped gymnasium, open 24/7. We offer a variety of cardio and strength-training equipment, as well as personalized training sessions with certified trainers. Group fitness classes, including yoga and HIIT.', 'The French Revolution constituted for the conscience of the dominant aristocratic class a fall from\r\n', NULL, 'Welcome to Apple Grand, where luxury and comfort blend seamlessly. Established in 2012, our hotel has grown into a symbol of excellence, prioritizing guest satisfaction and quality service. Our mission is to provide unparalleled hospitality and memorable experiences, with a vision to be a leading hotel known for quality, innovation, and sustainability.');

-- --------------------------------------------------------

--
-- Table structure for table `Patients`
--

CREATE TABLE `Patients` (
  `ID` int(11) NOT NULL,
  `PATIENTID` varchar(10) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `OTHERNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `DATEOFBIRTH` date DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `BMI` varchar(60) DEFAULT NULL,
  `HEIGHT` varchar(60) DEFAULT NULL,
  `WEIGHT` varchar(35) DEFAULT NULL,
  `P_STATUS` enum('0','1','2') DEFAULT '1',
  `CREATEDDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `PHONENUMBER` varchar(66) DEFAULT NULL,
  `CURRENTCONDITION` text DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `SYMPTOMS` text DEFAULT NULL,
  `OCCUPATION` varchar(65) DEFAULT NULL,
  `MARITALSTATUS` varchar(40) DEFAULT NULL,
  `BLOODGROUP` varchar(55) DEFAULT NULL,
  `GENDER` varchar(55) DEFAULT NULL,
  `NATIONALITY` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Patients`
--

INSERT INTO `Patients` (`ID`, `PATIENTID`, `FIRSTNAME`, `OTHERNAME`, `LASTNAME`, `DATEOFBIRTH`, `EMAIL`, `BMI`, `HEIGHT`, `WEIGHT`, `P_STATUS`, `CREATEDDATE`, `PHONENUMBER`, `CURRENTCONDITION`, `ADDRESS`, `SYMPTOMS`, `OCCUPATION`, `MARITALSTATUS`, `BLOODGROUP`, `GENDER`, `NATIONALITY`) VALUES
(1, 'P210305', 'Yao', 'Michael', 'TG', '1990-01-15', 'john.doe@example.com', NULL, NULL, NULL, '0', '2024-03-06 10:21:27', '+123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'P210306', 'Jane', 'Marie', 'Smith', '1985-08-22', 'jane.smith@example.com', NULL, NULL, NULL, '0', '2024-03-06 10:21:27', '+987654321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'P447425', 'JOHN', 'hkjfhka', 'JOHN', '2024-01-01', 'hdskh@gmil.com', '', '', '', '1', '2024-03-07 21:28:19', '0055', 'glh', 'hghj', 'hghlj', NULL, '', '', '', ''),
(4, 'P379279', 'peter', 'n', 'you', '1997-09-02', 'email@email.com', NULL, NULL, NULL, '0', '2024-03-07 21:32:20', '02451258', 'kdhf;ks', 'kkksdhflk', 'skdhlf', NULL, NULL, NULL, NULL, NULL),
(5, 'P458264', 'dfhh', 'dfhg', 'hfh', '1998-01-02', 'dfhg@dfh.com', NULL, NULL, NULL, '1', '2024-03-07 21:39:18', '02558464', 'etueyt', 'treyty', 'drdfd', NULL, NULL, NULL, NULL, NULL),
(6, 'P182723', 'test', 'd', 'tst', '2024-02-26', 'sdfshf@gmail.com', NULL, NULL, NULL, '0', '2024-03-07 22:42:17', '0255466146', 'af', 'asd', 'asd', NULL, NULL, NULL, NULL, NULL),
(7, 'P359311', 'fdjksl', 'ldkls', 'ljdksl', '2024-03-06', 'kjhgk@lfk.com', NULL, NULL, NULL, '0', '2024-03-15 22:34:37', '0264558162', 'dfg', 'kokmlemle', 'sdf', 'student', '4', 'e', '1', 'gh'),
(8, 'P587655', 'tet', 't', 't', '2024-02-29', 'yao@gmai.com', NULL, NULL, NULL, '0', '2024-03-15 23:04:11', '022315', NULL, 'sd', NULL, ';hg', '4', NULL, '1', 'ashg'),
(9, 'P237901', 'add weight', 'worked', 'height', '2024-03-07', 'kjdshf@kjf.com', NULL, '54', '654', '1', '2024-03-22 07:59:33', '0266212546', 'jksjdf', 'sdjfh;', 'dksvh', 'dsjkh;', '4', 'jfdk', '1', 'jkhfdk'),
(10, 'P629253', 'hgh', 'wordk', 'doc', '2024-01-01', 'kkkds@gmail.com', NULL, '43', '54', '0', '2024-04-12 12:15:37', '0266262626', 'kdsjfh', 'fdsjh', 'dhfj', 'studnet', '3', '0+', '1', 'gh'),
(11, 'P608774', 'doc', 'doc', 'doc', '2014-01-01', 'email@mail.com', NULL, '32', '32', '1', '2024-04-12 16:22:54', '0266262626', 'KDSHF', 'address', 'DGHF', 'doc', '3', 'o+', '1', 'gh'),
(12, 'P208296', 'Prince  t    ', 'otu', 'Aduamoah', '2000-01-30', 'princeaduamoah25@gmail.com', '12', '', '', '1', '2024-04-22 20:46:01', '0247161312', 'stable', 'Hilda', 'kwashiorkor', 'programmer', '4', 'o+', 'male', 'Ghanaian'),
(13, 'P891067', 'dfg', 'gfh', 'jgdshfgl', '2024-04-04', 'yao@way.com', NULL, '56', '56', '1', '2024-04-24 20:35:11', '0266', NULL, 'dfg', NULL, 'dhjl', '4', 'j', '1', 'gh'),
(14, 'P609580', 'TEST  22', 'SKVBH', 'DSKJF', '2024-12-31', 'FD@ME', '', '', '', '1', '2024-04-26 16:32:30', 'FAF', NULL, 'FA', NULL, 'dhjl', '1', 'DG', '1', 'DF'),
(15, 'P53456', 'new    ', 'id', 'patient', '2024-01-01', 'worjgd@mail.com', '12', '12', '12', '1', '2024-04-26 17:11:40', '0244515000', NULL, 'fg', NULL, 'dhjl', '3', 'o', '1', 'gh'),
(16, 'P686976', 'saaf  ', 'df', 'fsdf', '2024-05-02', 'dsfs', '45', '', '', '1', '2024-04-27 01:43:55', '0215425', NULL, 'tm', NULL, NULL, '4', 'h', 'm', 'gh');

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
(14, '-1', 'yao', 'test', '', NULL, NULL, 'BC-0004', 'bharaniyhao@way', 'b1399dba059fe2ec23dba77507b2746b6fb28a7bc3370891d6104e17607cefd1', 'yao@way.com', '2024-04-08', '025356232', '0266262626', 'L001', 'U-0000001', '2024-04-28 17:53:15'),
(15, '-1', 'hgfj', 'jhdsgj', '', NULL, NULL, 'BC-0004', 'ba@way', '6bdab945e5b20dd7c439c49ad40d70bab15519fdd06144355f7fe079c42abb6e', 'gslhf@gmail.com', '2024-04-08', '525022555', '125252525', 'L001', 'U-0000001', '2024-04-11 17:23:31'),
(16, '-1', 'for', 'test', 'U202404112560-0000002', NULL, NULL, 'BC-0005', 'baraniyao@way', 'e320f0e8e7bc8b5b6d494b64ac45f9070086632bcfff6cee4552129f1b15cb4f', 'gdjsf@way.com', '2024-04-11', '0266212420', '0266212420', 'L001', 'U-0000001', '2024-04-11 19:21:09'),
(17, '1', 'working', 'hds', 'U202404113834-0000003', NULL, NULL, 'BC-0005', 'ayao@way', '8c781f0980b42674b62e1fabdc90fa187ad88e14a72dfe9edb5e7aeb8f56e008', 'hdgksj@ksdhf.com', '2024-04-11', '026252', '0266232520', '1', 'U-0000001', '2024-04-11 17:38:30'),
(18, '0', 'hjgfjk', 'ok', 'U202404115362-0000004', NULL, NULL, NULL, 'frondesk@way', '69401143d5e4219f1db4eb75e03542abd473592b4dd48acabaefc3305acea31a', 'ok', '2024-04-11', '02660000', '026600000', '3', 'U202404113834-0000003', '2024-04-12 13:48:17'),
(19, '1', 'thera', 'pisty', 'U202404121754-0000005', NULL, NULL, 'BC-0005', 'therepisty@way', '883e9e7c7f5269961bad493a5439c1cea78d751959e41cf1978c626015b8be16', 'therepisty@way', '2024-04-12', '026600000', '0266232521', '2', 'U-0000001', '2024-04-30 11:23:24'),
(20, '1', 'doc', 'there', 'U202404122044-0000006', NULL, NULL, 'BC-0004', 'pisty@way', '76ae27c7463d54802753da0052964bddcb5fb050b1b664d6e61ae19f726186a2', 'em@maile.com', '2024-04-12', '02660000', '0266232520', '3', 'U-0000001', '2024-04-12 13:20:57'),
(21, '1', 'bharani', 'jhon', 'U202404124613-0000007', NULL, NULL, 'BC-0005', 'baraniy@way', 'b02fed670653f55ccb53e3c29844ec22f96922b2f0bd52e3035a20624de1f973', 'yao@way.com', '2024-04-12', '0266212420', '0266325231', '1', 'U-0000001', '2024-04-12 13:46:46'),
(22, '1', 'YAO', 'Barani', 'U202404120940-0000008', NULL, NULL, 'BC-0004', 'admins@way', '5a48fd528224d23ec7162578f62423d6aeb263fe8b97be1a2daa9ab3cfd9fc2a', 'yao@yao', '2024-04-12', '0266666666', '026666666', '1', 'U-0000001', '2024-04-12 16:09:26'),
(23, '1', 'gh', 'glkhah', 'U202404121454-0000008', NULL, NULL, '', 'frondesks@way', '0d6db30c2b168fa020838f82958a65e5a1796fa7dae17b2035633b898a7126b0', 'te@gmail.com', '2024-04-12', '0266262620', '022626262', '3', 'U202404120940-0000008', '2024-04-30 11:31:13'),
(24, '1', 'Jonathan', 'Quartey', 'U202404231698-0000008', NULL, NULL, 'BC-0006', 'Jonathan', '5ea2dba331a7066626e33962924bfcce94002e553be0e27177e2271b42a14586', 'neeayree@googlemail.com', '2024-04-23', '', '0244757461', '2', 'U-0000001', '2024-04-23 14:16:42'),
(25, '1', 'Jonathan', 'Quartey', 'U202404232333-0000009', NULL, NULL, 'BC-0004', 'neeayree@googlemail.com', 'ac1d66ef7bc514109491eda06ec714f542be6b0ccbaf8acd6c064afd1d190735', 'neeayree@googlemail.com', '2024-04-23', '', '0244757461', '2', 'U-0000001', '2024-04-23 14:23:04'),
(26, '1', 'there', 'pist', 'U202404242285-0000010', NULL, NULL, 'BC-0005', 'the@way', 'aba2811e01b9afadb17d0ab7bfb02abf3b98c33faa4be1dd083fb8fac651e0ed', 'dfghl@hfd.com', '2024-04-24', '45265885', '00152655', '2', 'U-0000001', '2024-04-24 14:22:53'),
(27, '1', 'this', 'my', 'U202404242980-0000011', NULL, NULL, 'BC-0005', 'therepe@way', 'ad009586a92297186753c340538f1f238c3fecd467bbe3914f0f8ecddf29cf33', 'kjfhlk', '2024-04-24', '22222', '111111', '2', 'U-0000001', '2024-04-24 14:29:50'),
(28, '1', 'yao', 'bharany', 'U202404261112-0000012', NULL, NULL, NULL, 'adminuser@way', 'dd155b5d29ecb14b257e58bcde78de983b80bc1107e33cec6b0352593e5c2d81', 'adim@way.com', '2024-04-26', '0266212420', '0266212420', '1', 'U-0000001', '2024-04-26 21:34:47'),
(29, '1', 'adminverse', 'yaoo', 'U202404261369-0000013', NULL, NULL, 'BC20230213-0000021', 'user@ADMIN', '7db694035dcc0f5c6ce30910046d59e2d29ebd96bc68c5eeeebc88b7cded9381', 'useradim@way.com', '2024-04-26', '0266212420', '0266212420', '1', 'U-0000001', '2024-04-26 20:13:17'),
(30, '1', 'dsk', 'frnt', 'U202404263956-0000014', NULL, NULL, 'BC-0005', 'frnt@me.com', '2d6fdf0dbf2ea8cbd119794ed8aa07e95255f5abd77b351c949c9468a08adf1c', 'frnt@mail.com', '2024-04-26', '0266212420', '0266212420', '3', 'U202404261112-0000012', '2024-04-26 21:39:37'),
(31, '1', 'Jonathan', 'Jonathan', 'U202404283256-0000015', NULL, NULL, 'BC-0006', 'Jonathan@WAY', '5b1bcb373887efc735decdda49a5dab8c8738c3915ec830297335b301022d19c', 'Jonathan@way', '2024-04-28', 'hdfjk', '0124251242', '2', 'U-0000001', '2024-04-28 17:32:44'),
(32, '1', 'prince', 'front', 'U202404285141-0000016', NULL, NULL, 'BC-0005', 'prince@WAY', 'e742ac67b8d0e8f8324e1cf297bedd621b6c5e7a290ab43d469641fed768d853', 'prince@gmail.com', '2024-04-28', '2125242625', '0266252524', '3', 'U-0000001', '2024-04-28 17:51:36'),
(33, '1', 'mary', 'last', 'U202404282544-0000017', NULL, NULL, 'BC-0005', 'fnt@WAY', 'bfee92b07bb01e80bc264eb90c8f198198dafca80c1a1f8ea5d55f6b4e85d7b9', 'jfsdf@me.com', '2024-04-28', '0266212420', '0266212420', '3', 'U202404261369-0000013', '2024-04-28 23:25:34'),
(34, '1', 'ffsfd', 'dsf', 'U202404285614-0000017', NULL, NULL, 'BC-0004', 'jkhd@WAY', 'a4aa202124c8782fdd466f3ab506361efc74cf5bb790276e931b1f68b0016283', 'klgjgfj@gmail.com', '2024-04-28', '21252121213', '123253121', '3', 'U202404261369-0000013', '2024-04-28 23:56:20'),
(35, '1', 'therapist', 'df', 'U202404285896-0000018', NULL, NULL, 'BC-0009', 'sdfsd@ME', 'bcd6722108ea38b9519191d661b0b1d8857e393997c008705de99c1525645ed1', 'fsdf@www.c', '2024-04-28', '315', '3154', '2', 'U202404261369-0000013', '2024-04-30 12:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `ProgressID` int(11) NOT NULL,
  `PatientID` varchar(50) NOT NULL,
  `AssessmentDate` date NOT NULL,
  `AssessmentData` text DEFAULT NULL,
  `TreatmentPlan` text DEFAULT NULL,
  `ProgressNotes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`ProgressID`, `PatientID`, `AssessmentDate`, `AssessmentData`, `TreatmentPlan`, `ProgressNotes`, `created_at`, `updated_at`) VALUES
(1, 'P182723', '2024-03-19', 'Assessment data details', 'Treatment plan details', 'Progress notes details', '2024-03-17 22:37:36', '2024-03-17 22:37:36');

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

--
-- Dumping data for table `Registration`
--

INSERT INTO `Registration` (`RE_ID`, `RE_CODE`, `RE_FULLNAME`, `RE_FNAME`, `RE_LNAME`, `RE_GENDER`, `RE_EMAIL`, `RE_PHONENUMBER`, `RE_USERNAME`, `RE_PASSWORD`, `RE_STATUS`, `RE_TOKENID`, `RE_SESSION_ID`, `RE_INPUTEDDATE`, `RE_REGION`, `RE_DISTRICT`, `RE_ABOUT_ME`, `RE_COUNTRY`, `RE_POSTAL_ADDRESS`, `RE_DIGITAL_ADDRESS`, `RE_DOB`, `RE_LOGIN_STATUS`, `RE_LASTLOGIN_DATE`, `RE_LOGIN_IP`, `RE_RESET_PASSWORD_TOKEN`, `RE_SMS_TOKEN`, `RE_UNAME`, `RE_PICNAME`, `RE_SIZE`, `RE_PHONE_VALIDATE_STATUS`, `RE_LEVEL`, `RE_CREATED_DATE`, `RE_FORCECHGPWD`) VALUES
(1, 'REG5e1779d365202', NULL, 'Franck', 'Robertson', NULL, 'ackerkojo22@gmail.com', '0249460220', 'ackerkojo22@gmail.com', 'db95aafa84c084bf5cc4fd4ea732e2ce4557a1c48b65d4ff06317a67446c66ea', '1', NULL, '1', '2021-10-11 13:15:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '41a98233b39c5178c81d10f0fbfaa48d', '2010', NULL, NULL, NULL, '0', NULL, NULL, '0'),
(2, 'REG5fc675ff44790', 'Steve Acker', 'Steve    ', 'Acker            ', 'F', 'ackerkojo@gmail.com            ', ' 0262022933', 'ackerkojo@gmail.com', 'db95aafa84c084bf5cc4fd4ea732e2ce4557a1c48b65d4ff06317a67446c66ea', '1', NULL, '', '2022-01-13 16:48:43', NULL, NULL, 'My name is Steve Acker and I am an opened person who is full of joy. My motivation lies in making people enjoying life and have a pleasant place to stay. \r\n\r\nI give the best experience to my guest and let them have an unforgettable experience. ', NULL, ' ', NULL, '2012-11-29', '0', '2022-01-13 16:48:43', '::1', NULL, '1360', '2022_dcb9bc6d21dba0bffe6d797cc4ba1decackerpic1.jpeg', 'ackerpic1.jpeg', '57743', '1', NULL, '2020-12-01 00:00:00', '0'),
(3, 'REG6128d9622a641', 'Nana Yaw', 'Nana', 'Yaw', 'M', NULL, '233240000000', 'stanley', '8f65583ab5f271e8e192a73b9766b4f12f4f3c1ba0cd365f284b9dcdc0367eb8', '1', NULL, NULL, '2021-08-30 11:33:37', NULL, NULL, NULL, NULL, NULL, NULL, '2000-08-10', '0', NULL, NULL, NULL, '1536', NULL, NULL, NULL, '0', NULL, '2021-08-27 00:00:00', '0'),
(4, 'REG6128db621c9a4', 'Franck Nath', 'Franck', 'Nath', 'M', NULL, '233240000000', 'franck', '8f65583ab5f271e8e192a73b9766b4f12f4f3c1ba0cd365f284b9dcdc0367eb8', '1', NULL, NULL, '2021-08-30 11:33:41', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-11', '0', NULL, NULL, NULL, '1348', NULL, NULL, NULL, '0', NULL, '2021-08-27 00:00:00', '0'),
(5, 'REG6128dd7528bcf', 'Ben Atta Amoah', 'Ben Atta', 'Amoah', 'M', NULL, '233240000000', 's', '6f47a9dbca572c493a7f3082bc8db1758180f809a313e120f51cba98d2e1edf8', '1', NULL, NULL, '2021-08-30 11:33:45', NULL, NULL, NULL, NULL, NULL, NULL, '2000-08-24', '0', NULL, NULL, NULL, '2130', NULL, NULL, NULL, '0', NULL, '2021-08-27 00:00:00', '0'),
(6, 'REG6128dff391202', 'Dada Sano Moa-Attah', 'Dada Sano', 'Moa-Attah', 'M', NULL, '23324000000', 'hr', '09852a53dfc8035f604aadb6a6cb2f72e398df4af1c76fafa9c573a7cba4e8ec', '1', NULL, NULL, '2021-08-30 11:33:48', NULL, NULL, NULL, NULL, NULL, NULL, '2000-08-10', '0', NULL, NULL, NULL, '3290', NULL, NULL, NULL, '0', NULL, '2021-08-27 00:00:00', '0'),
(7, 'REG6128e9be60d32', 'Seth Kakraba', 'Seth', 'Kakraba', 'M', NULL, '233240000000', 'franck2', '1c85a433a058172cd33783df821490dfe1bc218a7cfde93eb3ccbd6a9792b2e3', '1', NULL, NULL, '2021-08-30 11:33:52', NULL, NULL, NULL, NULL, NULL, NULL, '2000-08-19', '0', NULL, NULL, NULL, '3914', NULL, NULL, NULL, '0', NULL, '2021-08-27 00:00:00', '0'),
(8, 'REG6128efb813435', 'George Appiah', 'George', 'Appiah', 'M', NULL, '233200000000', 'george', 'dfbc92324f3dc879be26ce3fd4ab9554ba96ec9948667768d54cb48fe9b8b5eb', '3', NULL, NULL, '2021-09-17 10:01:47', NULL, NULL, NULL, NULL, NULL, NULL, '2030-08-10', '0', NULL, NULL, NULL, '1295', NULL, NULL, NULL, '0', NULL, '2021-08-27 00:00:00', '0'),
(9, 'REG6128fd664d62e', 'Bernard OO', 'Bernard', 'OO', 'M', NULL, '233240000000', 'sali', '0ec70cecab85a14ced5c88ec01ec07e0e7a4c7201750fbd2a407bb62638df030', '1', NULL, NULL, '2021-08-30 11:33:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '4537', NULL, NULL, NULL, '0', NULL, '2021-08-27 00:00:00', '0'),
(10, 'REG6128fde8312ee', 'Joseph Akorli', 'Joseph', 'Akorli', 'M', NULL, '233200000000', 'joseph', '03424d490c1f8ede1ce3124102a8d75f361c4dfe079ce6938ff2567df880cac2', '3', NULL, NULL, '2021-09-17 10:01:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2061', NULL, NULL, NULL, '0', NULL, '2021-08-27 00:00:00', '0'),
(11, 'REG6128fea40dfb8', 'Ransfold Koblan Assamoah', 'Ransfold Koblan', 'Assamoah', 'M', NULL, '233200000000', 'koblan', '8fce088fb535c04198b7a65161acd451c0d7761d6b15c20fc1729bcbeadfef8e', '1', NULL, NULL, '2021-08-30 11:33:28', NULL, NULL, NULL, NULL, NULL, NULL, '2030-09-08', '0', NULL, NULL, NULL, '1102', NULL, NULL, NULL, '0', NULL, '2021-08-27 00:00:00', '0'),
(12, 'REG6135d7967fec3', 'Yao Ke', 'Yao', 'Ke', 'M', NULL, '233262022933', 'ken', '928a61140ba338eff6ea7bb1ccb07aa141d77d88bede2c0b1b0474dfe13ee726', '2', NULL, NULL, '2021-09-06 08:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '1622', NULL, NULL, NULL, '0', NULL, '2021-09-06 00:00:00', '0'),
(13, 'REG6135df555d1c3', 'Stan Den', 'Stan', 'Den', 'M', NULL, '233262022933', 'denis', '0f0dc1572d15e23aa4318c29992887b26576d14efba40348b66755ccdd46ce0a', '2', NULL, NULL, '2021-09-06 09:28:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '9797', NULL, NULL, NULL, '0', NULL, '2021-09-06 00:00:00', '0'),
(14, 'REG6135e1a0c7973', 'ben Hui', 'ben', 'Hui', 'M', 'ackerkojo@gmail.com', '233262022933', 'nana', 'e919f325fd410c8771e62f3e955b77dd4f983bf97de17424bd45676bbf88c90b', '2', NULL, NULL, '2021-09-06 10:38:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '4355', NULL, NULL, NULL, '0', NULL, '2021-09-06 00:00:00', '0'),
(15, 'REG6135e224110c7', 'Nancy Amoah', 'Nancy', 'Amoah', 'M', NULL, '233262022933', 'benice', '8ed87d1f01d3d057e16322666d32c9b64c474dac50608df6a5bf9ac115f32dbd', '2', NULL, NULL, '2021-09-06 09:40:52', NULL, NULL, NULL, NULL, NULL, NULL, '1999-10-26', '1', NULL, NULL, NULL, '1679', NULL, NULL, NULL, '0', NULL, '2021-09-06 00:00:00', '0'),
(16, 'REG6135e73dd04f5', 'Nancy Amoah', 'Nancy', 'Amoah', 'M', NULL, '233262022933', 'gggnnn', '223a8f210c30ed69203db38f19fd8011b86b363cf97987fca05b2036f630d799', '2', NULL, NULL, '2021-09-06 10:02:37', NULL, NULL, NULL, NULL, NULL, NULL, '1998-09-21', '1', NULL, NULL, NULL, '1360', NULL, NULL, NULL, '0', NULL, '2021-09-06 00:00:00', '0'),
(154, 'REG61b8786edbe67', 'Mark John', 'Mark', 'John', NULL, 'john@gmail.com', '233262022933', 'john@gmail.com', '05a44186ee4333779867c95fa9f47b50d0a013cd24bf0428d563c90fe31db294', '1', NULL, NULL, '2021-12-14 10:56:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-12-14 00:00:00', '0'),
(155, 'REG61b88d3e6ec0f', 'Nancy Tracy', 'Nancy', 'Tracy', NULL, 'tracy@gmail.com', '2330262022933', 'tracy@gmail.com', '66f26a3f3d32d79602d5d8a7c9a0b9c6f94a19bc3d2a7bba468d67bbd391520f', '1', NULL, NULL, '2021-12-14 12:25:34', NULL, NULL, NULL, 'Ghana', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-12-14 00:00:00', '0'),
(156, 'REG61b8a4f900f24', 'Ruth Abbadey   ', 'Ruth', 'Abbadey   ', NULL, 'ruth@gmail.com', '2200262022933', 'ruth@gmail.com', '5b008aa1274fe1bf08a259163d721516341f3817a54edaa7395e9330d467051b', '1', NULL, '61b8a516db9a3', '2021-12-14 23:11:32', NULL, NULL, NULL, 'Gambia', NULL, NULL, NULL, '1', '2021-12-14 23:11:32', '::1', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-12-14 00:00:00', '0'),
(157, 'REG61bb2cd0b1e8a', 'George Kwame', 'George', 'Kwame', NULL, 'kwame@gmail.com', '2330262022933', 'kwame@gmail.com', 'd049de66fc29a1465762714f38517062fed4706b78a4df60cad8e6ade416c3f0', '1', NULL, '', '2021-12-16 15:00:33', NULL, NULL, NULL, 'Ghana', NULL, NULL, NULL, '0', '2021-12-16 15:00:33', '::1', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-12-16 00:00:00', '0');

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
-- Table structure for table `Rooms`
--

CREATE TABLE `Rooms` (
  `RoomID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  `RoomNumber` varchar(255) NOT NULL,
  `Descriptions` text DEFAULT NULL,
  `CreatData` date NOT NULL,
  `Inputeddate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Addedby` varchar(255) DEFAULT NULL,
  `RCodes` varchar(255) DEFAULT NULL,
  `RCode` varchar(32) NOT NULL,
  `RoomStatus` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Rooms`
--

INSERT INTO `Rooms` (`RoomID`, `CategoryName`, `RoomNumber`, `Descriptions`, `CreatData`, `Inputeddate`, `Addedby`, `RCodes`, `RCode`, `RoomStatus`) VALUES
(22, 'Normal Accomodation', 'Apple Grand 002', 'Special Accomodation with AC', '2024-07-10', '2024-07-21 19:27:19', 'dsds', NULL, 'BC-0005', '1'),
(25, 'Normal Accomodation', 'Apple Grand 016', 'Normal Accomodation (Standard)', '2024-07-21', '2024-07-21 19:36:10', 'setupdate', NULL, 'BC-0005', '1'),
(26, 'Special Accomodation', 'Apple Grand 001', 'Special Accomodation', '2024-07-21', '2024-07-21 19:37:29', '', NULL, 'BC-0004', '1'),
(28, 'Special Accomodation', 'Apple Grand 003', 'Special Accomodation', '2024-07-22', '2024-07-21 22:19:49', 'Bharani YAO', NULL, 'BC-0004', '1'),
(29, 'Normal Accomodation', 'Apple Grand 005', 'Normal Accomodation (Standard)', '2024-07-21', '2024-07-21 23:15:58', 'Bharani YAO', NULL, 'BC-0005', '1'),
(30, 'Special Accomodation', 'Apple Grand 006', 'Special Accomodation', '2024-07-21', '2024-07-21 23:16:23', 'Bharani YAO', NULL, 'BC-0004', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Roomss`
--

CREATE TABLE `Roomss` (
  `ID` int(11) NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  `RoomNumber` varchar(255) DEFAULT NULL,
  `Descriptions` varchar(255) DEFAULT NULL,
  `Imag` blob DEFAULT NULL,
  `RCode` varchar(255) DEFAULT NULL,
  `Addedby` varchar(192) DEFAULT NULL,
  `CreatData` date DEFAULT NULL,
  `RoomStatus` enum('1','2','3','4') DEFAULT '1' COMMENT '(''Pending'', ''Confirmed'', ''Cancelled'', ''Completed'')',
  `CRETEDDATA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Roomss`
--

INSERT INTO `Roomss` (`ID`, `CategoryName`, `RoomNumber`, `Descriptions`, `Imag`, `RCode`, `Addedby`, `CreatData`, `RoomStatus`, `CRETEDDATA`) VALUES
(1, 'P359311', 'fdjksl', 'ljdksl', 0x6c646b6c73, 'T517332', NULL, '2024-07-14', '1', '2024-04-27 13:04:52'),
(2, 'P210305', 'Yao', 'TG', 0x4d69636861656c, 'T173314', NULL, '2024-07-14', '1', '2024-04-27 15:12:02'),
(3, 'P629253', 'hgh', 'doc', 0x776f72646b, NULL, NULL, '2024-07-14', '1', '2024-04-30 12:07:43'),
(4, 'P379279', 'peter', 'you', 0x6e, 'T23633', NULL, '2024-07-14', '1', '2024-05-01 13:23:26'),
(5, 'P210306', 'Jane', 'Smith', 0x4d61726965, 'T23633', NULL, NULL, '1', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sms_region`
--

CREATE TABLE `sms_region` (
  `REG_ID` int(11) NOT NULL,
  `REG_CODE` varchar(50) DEFAULT NULL,
  `REG_NAME` varchar(150) NOT NULL,
  `REG_COUNTRY` varchar(255) DEFAULT NULL,
  `REG_STATUS` enum('0','1','2') DEFAULT '1' COMMENT '1= enebled, 0= disabled, 2=deleted',
  `REG_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sms_region`
--

INSERT INTO `sms_region` (`REG_ID`, `REG_CODE`, `REG_NAME`, `REG_COUNTRY`, `REG_STATUS`, `REG_INPUTEDDATE`) VALUES
(1, '01', 'Oti', 'GH', '1', '2021-12-19 23:31:21'),
(2, '02', 'Bono East', 'GH', '1', '2021-12-19 23:31:25'),
(3, '03', 'Ahafo', 'GH', '1', '2021-12-19 23:31:28'),
(4, '04', 'Bono', 'GH', '1', '2021-12-19 23:31:30'),
(5, '05', 'North East', 'GH', '1', '2021-12-19 23:31:34'),
(6, '06', 'Savannah', 'GH', '1', '2021-12-19 23:31:38'),
(7, '07', 'Western North', 'GH', '1', '2021-12-19 23:31:42'),
(8, '08', 'Western', 'GH', '1', '2021-12-19 23:31:45'),
(9, '09', 'Volta', 'GH', '1', '2021-12-19 23:31:48'),
(10, '10', 'Greater Accra', 'GH', '1', '2021-12-19 23:31:51'),
(11, '11', 'Eastern', 'GH', '1', '2021-12-19 23:31:54'),
(12, '12', 'Ashanti', 'GH', '1', '2021-12-19 23:32:05'),
(13, '13', 'Central', 'GH', '1', '2021-12-19 23:32:08'),
(14, '14', 'Northern', 'GH', '1', '2021-12-19 23:32:10'),
(15, '15', 'Upper East', 'GH', '1', '2021-12-19 23:32:13'),
(16, '16', 'Upper West', 'GH', '1', '2021-12-19 23:32:15'),
(17, '17', 'ho', 'GH', '1', '2021-12-19 23:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `SpecialRooms`
--

CREATE TABLE `SpecialRooms` (
  `RoomID` int(11) NOT NULL,
  `RoomNumber` varchar(15) DEFAULT NULL,
  `RoomDetails` varchar(255) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SpecialRooms`
--

INSERT INTO `SpecialRooms` (`RoomID`, `RoomNumber`, `RoomDetails`, `Status`) VALUES
(1, 'AppleGrand001', 'Special Room 1', 1),
(2, 'AppleGrand011', 'Special Room 11', 1),
(3, 'AppleGrand013', 'Special Room 13', 1),
(4, 'AppleGrand014', 'Special Room 14', 1),
(5, 'AppleGrand015', 'Special Room 15', 1),
(6, 'AppleGrand017', 'Special Room 17', 1),
(7, 'AppleGrand018', 'Special Room 18', 1),
(8, 'AppleGrand019', 'Special Room 19', 1),
(9, 'AppleGrand020', 'Special Room 20', 1),
(10, 'AppleGrand021', 'Special Room 21', 1),
(11, 'AppleGrand009', 'Special Room 9', 1),
(12, 'AppleGrand008', 'Special Room 8', 1),
(13, 'AppleGrand007', 'Special Room 7', 1),
(14, 'AppleGrand010', 'Special Room 10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `terminate_reason`
--

CREATE TABLE `terminate_reason` (
  `TERMINATE_ID` int(11) NOT NULL,
  `TERMINATE_ITEMID` varchar(100) NOT NULL,
  `TERMINATE_ITEMTYPE` varchar(100) NOT NULL,
  `TERMINATE_REASON` text DEFAULT NULL,
  `TERMINATE_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `therapistspecilization`
--

CREATE TABLE `therapistspecilization` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `therapistspecilization`
--

INSERT INTO `therapistspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(1, 'Gynecologist/Obstetrician', '2016-12-28 06:37:25', ''),
(2, 'General Physician', '2016-12-28 06:38:12', ''),
(3, 'Dermatologist', '2016-12-28 06:38:48', ''),
(4, 'Homeopath', '2016-12-28 06:39:26', ''),
(5, 'Ayurveda', '2016-12-28 06:39:51', ''),
(6, 'Dentist', '2016-12-28 06:40:08', ''),
(7, 'Ear-Nose-Throat (Ent) Specialist', '2016-12-28 06:41:18', ''),
(9, 'Demo test', '2016-12-28 07:37:39', '28-12-2016 01:28:42 PM'),
(10, 'Bones Specialist demo', '2017-01-07 08:07:53', '07-01-2017 01:38:04 PM');

-- --------------------------------------------------------

--
-- Table structure for table `treatmentList`
--

CREATE TABLE `treatmentList` (
  `treatment_id` int(11) NOT NULL,
  `patient_id` varchar(22) DEFAULT NULL,
  `treatment_date` date DEFAULT NULL,
  `treatment_time` time DEFAULT NULL,
  `treatment_name` varchar(255) DEFAULT NULL,
  `treatment_description` text DEFAULT NULL,
  `treatmentStatus` enum('1','2','0') NOT NULL DEFAULT '1',
  `firstname` varchar(255) DEFAULT NULL,
  `othername` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `UserID` varchar(255) DEFAULT NULL,
  `therapistsid` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatmentList`
--

INSERT INTO `treatmentList` (`treatment_id`, `patient_id`, `treatment_date`, `treatment_time`, `treatment_name`, `treatment_description`, `treatmentStatus`, `firstname`, `othername`, `lastname`, `email`, `phonenumber`, `UserID`, `therapistsid`) VALUES
(1, 'P237901', '2024-03-24', '10:00:00', 'Physical Therapy', 'Session focused on rehabilitation exercises for the lower back.', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'P359311', NULL, NULL, NULL, NULL, '1', 'fdjksl', 'ldkls', 'ljdksl', 'kjhgk@lfk.com', '0264558162', 'U202404261369-0000013', NULL),
(14, 'P379279', NULL, NULL, NULL, NULL, '1', 'peter', 'n', 'you', 'email@email.com', '02451258', 'U202404261369-0000013', NULL),
(15, 'P210305', NULL, NULL, NULL, NULL, '1', 'Yao', 'Michael', 'TG', 'john.doe@example.com', '+123456789', 'U202404261369-0000013', NULL),
(16, 'P379279', NULL, NULL, NULL, NULL, '1', 'peter', 'n', 'you', 'email@email.com', '02451258', 'U202404261369-0000013', NULL),
(17, 'P210306', NULL, NULL, NULL, NULL, '1', 'Jane', 'Marie', 'Smith', 'jane.smith@example.com', '+987654321', 'U202404261369-0000013', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `treatmentTable`
--

CREATE TABLE `treatmentTable` (
  `TREATMENT_ID` int(11) NOT NULL,
  `TREATMENT_CODE` varchar(10) NOT NULL,
  `TREATMENT_NAME` varchar(40) NOT NULL,
  `TREATMENT_NUMBER` int(11) NOT NULL,
  `TREATMENT_STATUS` enum('0','1') DEFAULT '0',
  `TREATMENT_INPUTEDDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `treatmentTable`
--

INSERT INTO `treatmentTable` (`TREATMENT_ID`, `TREATMENT_CODE`, `TREATMENT_NAME`, `TREATMENT_NUMBER`, `TREATMENT_STATUS`, `TREATMENT_INPUTEDDATE`) VALUES
(1, 'L001', 'Massage', 1, '1', '2024-03-26 12:42:16'),
(2, 'L002', 'Exercises', 2, '1', '2024-03-26 12:42:41'),
(3, 'L003', 'Ultrasound Therapy', 3, '1', '2024-03-26 12:42:44'),
(4, 'L004', 'Occupational Therapy', 4, '1', '2024-03-26 13:22:59'),
(5, 'L005', 'Speech Therapy', 5, '1', '2024-03-26 13:22:30'),
(6, 'L006', 'Empyt', 6, '1', '2024-03-26 12:46:13'),
(7, 'L007', 'Empyt', 7, '1', '2024-03-26 12:46:18'),
(8, 'L008', 'Empyt', 8, '1', '2024-03-26 12:46:24'),
(9, 'L009', 'ext. agent', 9, '1', '2021-08-04 18:04:37');

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
(4, 'st3211009', '0024', '1', '2', '2021-10-09 14:15:57'),
(5, 's4211009', '0001', '1', '2', '2021-10-09 17:04:01'),
(6, 's4211009', '0002', '1', '2', '2021-10-09 17:04:01'),
(7, 's4211009', '0003', '1', '2', '2021-10-09 17:04:01'),
(8, 's4211009', '0004', '1', '2', '2021-10-09 17:04:01'),
(9, 's4211009', '0006', '1', '2', '2021-10-09 17:04:01'),
(10, 's4211009', '0009', '1', '2', '2021-10-09 17:04:01'),
(11, 's4211009', '0010', '1', '2', '2021-10-09 17:04:01'),
(12, 's4211009', '0089', '1', '2', '2021-10-09 17:04:01'),
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
(951, 'U202404232333-0000009', '0003', '1', 'U-0000001', '2024-04-23 14:23:05'),
(952, 'U202404232333-0000009', '0004', '1', 'U-0000001', '2024-04-23 14:23:05'),
(953, 'U202404232333-0000009', '0005', '1', 'U-0000001', '2024-04-23 14:23:05'),
(954, 'U202404232333-0000009', '0006', '1', 'U-0000001', '2024-04-23 14:23:05'),
(955, 'U202404232333-0000009', '0007', '1', 'U-0000001', '2024-04-23 14:23:05'),
(956, 'U202404232333-0000009', '0009', '1', 'U-0000001', '2024-04-23 14:23:05'),
(957, 'U202404232333-0000009', '0010', '1', 'U-0000001', '2024-04-23 14:23:05'),
(958, 'U202404232333-0000009', '0011', '1', 'U-0000001', '2024-04-23 14:23:05'),
(959, 'U202404232333-0000009', '0012', '1', 'U-0000001', '2024-04-23 14:23:05'),
(960, 'U202404232333-0000009', '0013', '1', 'U-0000001', '2024-04-23 14:23:05'),
(961, 'U202404232333-0000009', '0014', '1', 'U-0000001', '2024-04-23 14:23:05'),
(962, 'U202404232333-0000009', '0015', '1', 'U-0000001', '2024-04-23 14:23:05'),
(963, 'U202404242285-0000010', '0003', '1', 'U-0000001', '2024-04-24 14:22:53'),
(964, 'U202404242285-0000010', '0001', '1', 'U-0000001', '2024-04-24 14:22:53'),
(965, 'U202404242285-0000010', '0004', '1', 'U-0000001', '2024-04-24 14:22:53'),
(966, 'U202404242285-0000010', '0005', '1', 'U-0000001', '2024-04-24 14:22:53'),
(967, 'U202404242285-0000010', '0006', '1', 'U-0000001', '2024-04-24 14:22:53'),
(968, 'U202404242285-0000010', '0008', '1', 'U-0000001', '2024-04-24 14:22:53'),
(969, 'U202404242285-0000010', '0009', '1', 'U-0000001', '2024-04-24 14:22:53'),
(970, 'U202404242285-0000010', '0010', '1', 'U-0000001', '2024-04-24 14:22:53'),
(971, 'U202404242285-0000010', '0012', '1', 'U-0000001', '2024-04-24 14:22:53'),
(972, 'U202404242285-0000010', '0013', '1', 'U-0000001', '2024-04-24 14:22:53'),
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
(1105, 'U202404261369-0000013', '0003', '1', 'U-0000001', '2024-05-09 00:59:08'),
(1106, 'U202404261369-0000013', '0001', '1', 'U-0000001', '2024-05-09 00:59:08'),
(1107, 'U202404261369-0000013', '0004', '1', 'U-0000001', '2024-05-09 00:59:08'),
(1108, 'U202404261369-0000013', '0005', '1', 'U-0000001', '2024-05-09 00:59:08'),
(1109, 'U202404261369-0000013', '0006', '1', 'U-0000001', '2024-05-09 00:59:08'),
(1110, 'U202404261369-0000013', '0008', '1', 'U-0000001', '2024-05-09 00:59:08'),
(1111, 'U202404261369-0000013', '0015', '1', 'U-0000001', '2024-05-09 00:59:08'),
(1130, 'U-0000001', '0003', '1', 'U-0000001', '2024-05-09 02:03:13'),
(1131, 'U-0000001', '0002', '1', 'U-0000001', '2024-05-09 02:03:13'),
(1132, 'U-0000001', '0001', '1', 'U-0000001', '2024-05-09 02:03:13'),
(1133, 'U-0000001', '0004', '1', 'U-0000001', '2024-05-09 02:03:13'),
(1134, 'U-0000001', '0005', '1', 'U-0000001', '2024-05-09 02:03:13'),
(1135, 'U-0000001', '0006', '1', 'U-0000001', '2024-05-09 02:03:13'),
(1136, 'U-0000001', '0007', '1', 'U-0000001', '2024-05-09 02:03:13'),
(1137, 'U-0000001', '0008', '1', 'U-0000001', '2024-05-09 02:03:13'),
(1138, 'U-0000001', '0009', '1', 'U-0000001', '2024-05-09 02:03:13'),
(1139, 'U-0000001', '0015', '1', 'U-0000001', '2024-05-09 02:03:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors_level`
--
ALTER TABLE `actors_level`
  ADD PRIMARY KEY (`ACL_ID`);

--
-- Indexes for table `Assessments`
--
ALTER TABLE `Assessments`
  ADD PRIMARY KEY (`ASSESSMENTID`),
  ADD KEY `PatientID` (`PATIENTID`),
  ADD KEY `therapist_id` (`therapist_id`);

--
-- Indexes for table `Booking`
--
ALTER TABLE `Booking`
  ADD PRIMARY KEY (`BK_CODE`),
  ADD UNIQUE KEY `BK_CODE` (`BK_CODE`),
  ADD UNIQUE KEY `BK_ROOM_NUM` (`BK_ROOM_NUM`);

--
-- Indexes for table `BookingRecord`
--
ALTER TABLE `BookingRecord`
  ADD PRIMARY KEY (`BR_ID`),
  ADD UNIQUE KEY `BK_LTCODE` (`BK_LTCODE`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`CAT_ID`);

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `CombinedRooms`
--
ALTER TABLE `CombinedRooms`
  ADD PRIMARY KEY (`CombinedRoomID`),
  ADD UNIQUE KEY `RoomNumber` (`RoomNumber`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`COM_CODE`) USING BTREE,
  ADD KEY `reviewid` (`COM_REVIEWCODE`);

--
-- Indexes for table `Country`
--
ALTER TABLE `Country`
  ADD PRIMARY KEY (`CN_ID`) USING BTREE,
  ADD UNIQUE KEY `slug` (`CN_SLUG`) USING BTREE;

--
-- Indexes for table `daa_menusubusers`
--
ALTER TABLE `daa_menusubusers`
  ADD PRIMARY KEY (`MENUCT_ID`);

--
-- Indexes for table `discharge`
--
ALTER TABLE `discharge`
  ADD PRIMARY KEY (`discharge_id`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `PatientID` (`PatientID`);

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
-- Indexes for table `Facility`
--
ALTER TABLE `Facility`
  ADD PRIMARY KEY (`FACILITY_ID`);

--
-- Indexes for table `Facilityold`
--
ALTER TABLE `Facilityold`
  ADD PRIMARY KEY (`FACILITY_ID`),
  ADD UNIQUE KEY `THERAPISTS_ID` (`FACILITY_NAMEs`),
  ADD UNIQUE KEY `FIRST_NAME` (`ROOM_NUM`);

--
-- Indexes for table `Financial`
--
ALTER TABLE `Financial`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `frontDeskUsers`
--
ALTER TABLE `frontDeskUsers`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USR_CODE` (`USR_CODE`),
  ADD UNIQUE KEY `THERAPISTS_ID` (`USER_COCODE`);

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
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`msgId`);

--
-- Indexes for table `monitoring`
--
ALTER TABLE `monitoring`
  ADD PRIMARY KEY (`monitoringID`);

--
-- Indexes for table `NormalRooms`
--
ALTER TABLE `NormalRooms`
  ADD PRIMARY KEY (`RoomID`),
  ADD UNIQUE KEY `RoomNumber` (`RoomNumber`);

--
-- Indexes for table `PageCont`
--
ALTER TABLE `PageCont`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Patients`
--
ALTER TABLE `Patients`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `PatientID` (`PATIENTID`);

--
-- Indexes for table `phys_users`
--
ALTER TABLE `phys_users`
  ADD PRIMARY KEY (`USR_USERID`),
  ADD UNIQUE KEY `USR_USERNAME` (`USR_USERNAME`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`ProgressID`),
  ADD KEY `PatientID` (`PatientID`);

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
-- Indexes for table `Rooms`
--
ALTER TABLE `Rooms`
  ADD PRIMARY KEY (`RoomID`),
  ADD UNIQUE KEY `RoomNumber` (`RoomNumber`),
  ADD UNIQUE KEY `RCode` (`RCodes`);

--
-- Indexes for table `Roomss`
--
ALTER TABLE `Roomss`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `patientID` (`CategoryName`),
  ADD KEY `therapistsId` (`RCode`);

--
-- Indexes for table `sms_region`
--
ALTER TABLE `sms_region`
  ADD PRIMARY KEY (`REG_ID`) USING BTREE;

--
-- Indexes for table `SpecialRooms`
--
ALTER TABLE `SpecialRooms`
  ADD PRIMARY KEY (`RoomID`),
  ADD UNIQUE KEY `RoomNumber` (`RoomNumber`);

--
-- Indexes for table `therapistspecilization`
--
ALTER TABLE `therapistspecilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatmentList`
--
ALTER TABLE `treatmentList`
  ADD PRIMARY KEY (`treatment_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `treatmentTable`
--
ALTER TABLE `treatmentTable`
  ADD PRIMARY KEY (`TREATMENT_ID`);

--
-- Indexes for table `userspermission`
--
ALTER TABLE `userspermission`
  ADD PRIMARY KEY (`MENUCT_ID`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Assessments`
--
ALTER TABLE `Assessments`
  MODIFY `ASSESSMENTID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Booking`
--
ALTER TABLE `Booking`
  MODIFY `BK_CODE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `BookingRecord`
--
ALTER TABLE `BookingRecord`
  MODIFY `BR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `CAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `channel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CombinedRooms`
--
ALTER TABLE `CombinedRooms`
  MODIFY `CombinedRoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Country`
--
ALTER TABLE `Country`
  MODIFY `CN_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `daa_menusubusers`
--
ALTER TABLE `daa_menusubusers`
  MODIFY `MENUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2430;

--
-- AUTO_INCREMENT for table `discharge`
--
ALTER TABLE `discharge`
  MODIFY `discharge_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `Facility`
--
ALTER TABLE `Facility`
  MODIFY `FACILITY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Facilityold`
--
ALTER TABLE `Facilityold`
  MODIFY `FACILITY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Financial`
--
ALTER TABLE `Financial`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontDeskUsers`
--
ALTER TABLE `frontDeskUsers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `MENUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2789;

--
-- AUTO_INCREMENT for table `menusubusersold`
--
ALTER TABLE `menusubusersold`
  MODIFY `MENUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `msgId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `monitoring`
--
ALTER TABLE `monitoring`
  MODIFY `monitoringID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `NormalRooms`
--
ALTER TABLE `NormalRooms`
  MODIFY `RoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `PageCont`
--
ALTER TABLE `PageCont`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Patients`
--
ALTER TABLE `Patients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `phys_users`
--
ALTER TABLE `phys_users`
  MODIFY `USR_USERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `ProgressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Pysio_branch`
--
ALTER TABLE `Pysio_branch`
  MODIFY `BRCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Registration`
--
ALTER TABLE `Registration`
  MODIFY `RE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `Report`
--
ALTER TABLE `Report`
  MODIFY `reportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Rooms`
--
ALTER TABLE `Rooms`
  MODIFY `RoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `Roomss`
--
ALTER TABLE `Roomss`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sms_region`
--
ALTER TABLE `sms_region`
  MODIFY `REG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `SpecialRooms`
--
ALTER TABLE `SpecialRooms`
  MODIFY `RoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `therapistspecilization`
--
ALTER TABLE `therapistspecilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `treatmentList`
--
ALTER TABLE `treatmentList`
  MODIFY `treatment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `userspermission`
--
ALTER TABLE `userspermission`
  MODIFY `MENUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1140;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `channel`
--
ALTER TABLE `channel`
  ADD CONSTRAINT `channel_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `phys_users` (`USR_USERID`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `phys_users` (`USR_USERID`) ON DELETE CASCADE;

--
-- Constraints for table `Roomss`
--
ALTER TABLE `Roomss`
  ADD CONSTRAINT `patientID` FOREIGN KEY (`CategoryName`) REFERENCES `Patients` (`PATIENTID`),
  ADD CONSTRAINT `therapistsId` FOREIGN KEY (`RCode`) REFERENCES `Facilityold` (`FACILITY_NAMEs`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
