-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 27, 2018 at 04:47 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schedular`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaign_users`
--

CREATE TABLE `campaign_users` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `sent` int(11) NOT NULL DEFAULT '0',
  `user_hash` varchar(250) NOT NULL,
  `sent_time` datetime DEFAULT NULL,
  `clicked` int(10) NOT NULL DEFAULT '0',
  `opened` int(10) NOT NULL DEFAULT '0',
  `bounced` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaign_users`
--

INSERT INTO `campaign_users` (`id`, `campaign_id`, `subscriber_id`, `email`, `sent`, `user_hash`, `sent_time`, `clicked`, `opened`, `bounced`) VALUES
(176, 15, 186, 'rakesh1@mailinator.com', 1, '5b5c2e6aacc6ceb83ee96e328e591aea', '2018-10-27 08:13:54', 0, 0, ''),
(178, 15, 184, 'rakesh2@mailinator.com', 1, '0dbd53751c00e0784799008b44471a77', '2018-10-27 08:13:54', 0, 0, ''),
(179, 15, 183, 'rakesh3@mailinator.com', 0, '', NULL, 0, 0, ''),
(177, 15, 185, 'rakesh4@mailinator.com', 0, '', NULL, 0, 0, ''),
(175, 15, 188, 'rakesh5@mailinator.com', 0, '', NULL, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `scheduler`
--

CREATE TABLE `scheduler` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheduler`
--

INSERT INTO `scheduler` (`id`, `campaign_id`, `time`, `start_time`, `end`, `end_time`) VALUES
(73, 15, '2018-10-13 17:34:34', '2018-10-27 08:13:54', NULL, '2018-10-13 17:37:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaign_users`
--
ALTER TABLE `campaign_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scheduler`
--
ALTER TABLE `scheduler`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaign_users`
--
ALTER TABLE `campaign_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `scheduler`
--
ALTER TABLE `scheduler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
