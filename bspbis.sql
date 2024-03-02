-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Mar 02, 2024 at 08:40 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bspbis`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangays`
--

CREATE TABLE `tbl_barangays` (
  `barangay_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barangays`
--

INSERT INTO `tbl_barangays` (`barangay_id`, `name`) VALUES
(1, 'Imelda'),
(2, 'Consuelo'),
(3, 'Libertad'),
(4, 'Mambalili'),
(5, 'Nueva Era'),
(6, 'Poblacion'),
(7, 'San Andres'),
(8, 'San Marcos'),
(9, 'San Teodoro'),
(10, 'Bunawan Brook');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangay_activities`
--

CREATE TABLE `tbl_barangay_activities` (
  `activity_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `activity_desc` text DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `barangay_id` int(11) DEFAULT NULL,
  `photo` varchar(80) NOT NULL,
  `date_activity` varchar(50) NOT NULL,
  `date_inserted` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barangay_activities`
--

INSERT INTO `tbl_barangay_activities` (`activity_id`, `title`, `activity_desc`, `purpose`, `barangay_id`, `photo`, `date_activity`, `date_inserted`) VALUES
(5, 'smileyy', '<ol id=\"result\">\n<li>\n<div><strong><span class=\"support-sentence\">I may struggle with geography, but I\'m sure I\'m somewhere around here.</span></strong></div>\n</li>\n<li>\n<div><strong><span class=\"support-sentence\">It must be easy to commit crimes as a snake because you don\'t have to worry about leaving fingerprints.</span></strong></div>\n</li>\n<li>\n<div><strong><span class=\"support-sentence\">It was always dangerous to drive with him since he insisted the safety cones were a slalom course.</span></strong></div>\n</li>\n<li>\n<div><strong><span class=\"support-sentence\">He was disappointed when he found the beach to be so sandy and the sun so sunny.</span></strong></div>\n</li>\n<li>\n<div><strong><span class=\"support-sentence\">She looked at the masterpiece hanging in the museum but all she could think is that her five-year-old could do better.</span></strong></div>\n</li>\n<li>\n<div><strong><span class=\"support-sentence\">Homesickness became contagious in the young campers\' cabin.</span></strong></div>\n</li>\n</ol>', 'Release of Money', NULL, '4a47a0db6e60853dedfcfdf08a5ca249.png', '2024-03-22', '2024-03-03 03:14:48'),
(11, 'Tuli Day on March 6, 2024', '<p><strong>If you\'re visiting this page, you\'re likely here because you\'re searching for a random sentence. Sometimes a random word just isn\'t enough, and that is where the random sentence generator comes into play. By inputting the desired number, you can make a list of as many random sentences as you want or need. Producing random sentences can be helpful in a number of different ways.</strong></p>\n<ol>\n<li><strong>For writers, a random sentence can help them get their creative juices flowing. Since the topic of the sentence is completely unknown, it forces the writer to be creative when the sentence appears. There are a number of different ways a writer can use the random sentence for creativity. The most common way to use the sentence is to begin a story. Another option is to include it somewhere in the story. A much more difficult challenge is to use it to end a story. In any of these cases, it forces the writer to think creatively since they have no idea what sentence will appear from the tool.</strong></li>\n<li><strong>For those writers who have writers\' block, this can be an excellent way to take a step to crumbling those walls. By taking the writer away from the subject matter that is causing the block, a random sentence may allow them to see the project they\'re working on in a different light and perspective. Sometimes all it takes is to get that first sentence down to help break the block.</strong></li>\n<li><strong>It can also be successfully used as a daily exercise to get writers to begin writing. Being shown a random sentence and using it to complete a paragraph each day can be an excellent way to begin any writing session.<img src=\"../../assets/tinymce/plugins/emoticons/img/smiley-cool.gif\" alt=\"cool\" /></strong></li>\n</ol>', 'awdasd', NULL, '65e3fed76b37dc7eca60e2df8f35257e.jpg', '2024-03-06', '2024-03-03 03:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_benefits`
--

CREATE TABLE `tbl_benefits` (
  `benefit_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cash_assistance`
--

CREATE TABLE `tbl_cash_assistance` (
  `cash_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL COMMENT '1 = deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cash_assistance`
--

INSERT INTO `tbl_cash_assistance` (`cash_id`, `parent_id`, `purpose`, `amount`, `date_inserted`, `status`) VALUES
(24, 4, NULL, '100', '2024-03-02 04:09:32', 0),
(25, 6, NULL, '1000', '2024-02-26 00:00:00', 0),
(26, 4, NULL, '1000', '2024-03-02 02:06:32', 0),
(27, 4, NULL, '2000', '2024-03-02 04:29:34', 1),
(28, 6, NULL, '2000', '2024-02-27 00:00:00', 0),
(29, 4, NULL, '10000', '2024-03-07 00:00:00', 0),
(30, 6, NULL, '5000', '2024-03-07 00:00:00', 0),
(31, 7, NULL, '2000', '2024-03-13 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_child`
--

CREATE TABLE `tbl_child` (
  `child_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `c_name` varchar(70) DEFAULT NULL,
  `bday` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `education_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 = deleted',
  `date_inserted` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_child`
--

INSERT INTO `tbl_child` (`child_id`, `parent_id`, `c_name`, `bday`, `age`, `gender`, `education_id`, `status`, `date_inserted`) VALUES
(5, 4, 'haha', NULL, 12, NULL, '7', 0, '2024-01-06 01:43:14'),
(6, 4, 'hehe', NULL, 122, NULL, '1', 1, '2024-01-07 02:32:52'),
(13, 4, 'hatdog', NULL, 12, NULL, '5', 0, '2024-01-07 02:34:29'),
(14, 4, 'hatdoga', NULL, 23, NULL, '6', 0, '2024-01-07 02:34:29'),
(15, 6, 'HEHEH', NULL, 12, NULL, '6', 0, '2024-01-07 04:02:11'),
(16, 7, 'Juani Juanto', NULL, 12, NULL, '1', 0, '2024-03-02 01:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_educational_level`
--

CREATE TABLE `tbl_educational_level` (
  `education_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_educational_level`
--

INSERT INTO `tbl_educational_level` (`education_id`, `description`) VALUES
(1, 'Elementary Undergraduate'),
(2, 'Elementary Graduate'),
(3, 'High School Undergraduate'),
(4, 'High School Graduate'),
(5, 'College Undergraduate'),
(6, 'College Graduate'),
(7, 'Vocational'),
(8, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_income_per_month`
--

CREATE TABLE `tbl_income_per_month` (
  `income_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_income_per_month`
--

INSERT INTO `tbl_income_per_month` (`income_id`, `description`) VALUES
(1, '₱10,000 below'),
(2, '₱10,000 - ₱30,000'),
(3, '₱30,000 - ₱50,000'),
(4, '₱50,000 above');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_solo_parent`
--

CREATE TABLE `tbl_solo_parent` (
  `parent_id` int(11) NOT NULL,
  `username` varchar(70) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `fname` varchar(70) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `bday` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(90) NOT NULL,
  `religion` varchar(50) NOT NULL,
  `education_id` int(11) NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `income_id` int(11) NOT NULL,
  `barangay_id` int(50) DEFAULT NULL,
  `control_no` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 = pending 1 = accepted',
  `on_status` int(11) NOT NULL COMMENT ' 1 = deleted',
  `date_inserted` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_solo_parent`
--

INSERT INTO `tbl_solo_parent` (`parent_id`, `username`, `password`, `fname`, `mname`, `lname`, `bday`, `age`, `gender`, `phone`, `email`, `religion`, `education_id`, `occupation`, `income_id`, `barangay_id`, `control_no`, `status`, `on_status`, `date_inserted`) VALUES
(4, 'parent1', '202cb962ac59075b964b07152d234b70', 'Beas', 'Benene', 'Alonza', '2024-01-03', 25, 'M', '09098271222', 'ronald@gmail.com', 'catholic', 4, 'Engineer', 4, 10, 33617, 0, 0, '2024-03-03 03:36:17'),
(6, 'parent2', '202cb962ac59075b964b07152d234b70', 'solo2', 'haha', 'parent2', '2024-01-10', 25, 'F', '09098747261', 'ronaldd@gmail.com', 'Catholic', 1, 'engineer', 1, 3, 40314, 1, 0, '2024-03-02 01:04:40'),
(7, 'parent4', '202cb962ac59075b964b07152d234b70', 'Maryjane', 'Frizzy', 'Juanto', '2024-03-05', 26, 'M', '09098774621', 'rririr@gmail.com', 'Catholic', 4, 'Dishwasher', 1, 4, 12028, 1, 0, '2024-03-02 04:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(70) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `user_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `username`, `password`, `fname`, `mname`, `lname`, `gender`, `phone`, `email`, `user_type_id`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'Ronald', 'Daan', 'Besinga', 'Male', '09090697390', 'ronaldbesinga287@gmail.com', 1),
(2, 'admin2', 'c84258e9c39059a89ab77d846ddab909', 'qwdss', NULL, 'wdaw', 'Male ', NULL, 'awdaw@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_types`
--

CREATE TABLE `tbl_user_types` (
  `user_type_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_types`
--

INSERT INTO `tbl_user_types` (`user_type_id`, `name`) VALUES
(1, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barangays`
--
ALTER TABLE `tbl_barangays`
  ADD PRIMARY KEY (`barangay_id`);

--
-- Indexes for table `tbl_barangay_activities`
--
ALTER TABLE `tbl_barangay_activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `tbl_benefits`
--
ALTER TABLE `tbl_benefits`
  ADD PRIMARY KEY (`benefit_id`);

--
-- Indexes for table `tbl_cash_assistance`
--
ALTER TABLE `tbl_cash_assistance`
  ADD PRIMARY KEY (`cash_id`);

--
-- Indexes for table `tbl_child`
--
ALTER TABLE `tbl_child`
  ADD PRIMARY KEY (`child_id`);

--
-- Indexes for table `tbl_educational_level`
--
ALTER TABLE `tbl_educational_level`
  ADD PRIMARY KEY (`education_id`);

--
-- Indexes for table `tbl_income_per_month`
--
ALTER TABLE `tbl_income_per_month`
  ADD PRIMARY KEY (`income_id`);

--
-- Indexes for table `tbl_solo_parent`
--
ALTER TABLE `tbl_solo_parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_user_types`
--
ALTER TABLE `tbl_user_types`
  ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_barangays`
--
ALTER TABLE `tbl_barangays`
  MODIFY `barangay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_barangay_activities`
--
ALTER TABLE `tbl_barangay_activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_benefits`
--
ALTER TABLE `tbl_benefits`
  MODIFY `benefit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cash_assistance`
--
ALTER TABLE `tbl_cash_assistance`
  MODIFY `cash_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_child`
--
ALTER TABLE `tbl_child`
  MODIFY `child_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_educational_level`
--
ALTER TABLE `tbl_educational_level`
  MODIFY `education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_income_per_month`
--
ALTER TABLE `tbl_income_per_month`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_solo_parent`
--
ALTER TABLE `tbl_solo_parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user_types`
--
ALTER TABLE `tbl_user_types`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
