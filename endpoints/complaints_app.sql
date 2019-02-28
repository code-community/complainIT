-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2019 at 11:09 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `complaints_app`
--
CREATE DATABASE IF NOT EXISTS `complaints_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `complaints_app`;

-- --------------------------------------------------------

--
-- Table structure for table `categories_defined`
--

CREATE TABLE `categories_defined` (
  `id_categories_defined` int(11) NOT NULL,
  `categories_defined_name` varchar(45) DEFAULT NULL,
  `categories_defined_verbose` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id_comments` int(11) NOT NULL,
  `comments_desc` varchar(45) NOT NULL,
  `comments_date_posted` varchar(45) DEFAULT NULL,
  `threads_id_threads` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE `complain` (
  `id_complain` int(11) NOT NULL,
  `complain_title` varchar(100) DEFAULT NULL,
  `complain_verbose` varchar(1000) NOT NULL,
  `complain_time_posted` datetime NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `complain_state` varchar(45) DEFAULT NULL,
  `categories_defined_id_categories_defined` int(11) NOT NULL,
  `complain_publicity` varchar(45) DEFAULT NULL,
  `complain_or_suggestion` varchar(45) DEFAULT NULL,
  `complain_status` varchar(45) DEFAULT NULL,
  `complain_anonymous` varchar(45) DEFAULT NULL,
  `complain_lastupdate` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id_departments` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `contacts` varchar(45) DEFAULT NULL,
  `description` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id_departments`, `name`, `contacts`, `description`) VALUES
(1, 'hr', '0703756325', 'this is the hr department');

-- --------------------------------------------------------

--
-- Table structure for table `downvotes`
--

CREATE TABLE `downvotes` (
  `id_downvotes` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `complain_id_complain` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `permissions_id_permissions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id_notifications` int(11) NOT NULL,
  `notification_description` varchar(45) DEFAULT NULL,
  `complain_id_complain` int(11) NOT NULL,
  `notifications_date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id_permissions` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `edit_main` varchar(45) DEFAULT NULL,
  `add_users` varchar(45) DEFAULT NULL,
  `view_all` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id_threads` int(11) NOT NULL,
  `thread_description` varchar(45) NOT NULL,
  `complain_id_complain` int(11) NOT NULL,
  `threads_date_created` datetime NOT NULL,
  `threads_locked` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upvotes`
--

CREATE TABLE `upvotes` (
  `id` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `complain_id_complain` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `secret` varchar(45) DEFAULT NULL,
  `userscol` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `user_type_id_user_type` int(11) NOT NULL,
  `user_date_joined` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id_user_type` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `levels_id` int(11) NOT NULL,
  `departments_id_departments` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories_defined`
--
ALTER TABLE `categories_defined`
  ADD PRIMARY KEY (`id_categories_defined`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comments`),
  ADD KEY `fk_comments_threads1_idx` (`threads_id_threads`),
  ADD KEY `fk_comments_users1_idx` (`users_id_users`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`id_complain`),
  ADD KEY `fk_complain_users1_idx` (`users_id_users`),
  ADD KEY `fk_complain_categories_defined1_idx` (`categories_defined_id_categories_defined`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id_departments`);

--
-- Indexes for table `downvotes`
--
ALTER TABLE `downvotes`
  ADD PRIMARY KEY (`id_downvotes`),
  ADD KEY `fk_downvotes_users1_idx` (`users_id_users`),
  ADD KEY `fk_downvotes_complain1_idx` (`complain_id_complain`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_levels_permissions1_idx` (`permissions_id_permissions`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id_notifications`),
  ADD KEY `fk_notifications_complain1_idx` (`complain_id_complain`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id_permissions`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id_threads`),
  ADD KEY `fk_threads_complain1_idx` (`complain_id_complain`);

--
-- Indexes for table `upvotes`
--
ALTER TABLE `upvotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Upvotes_users1_idx` (`users_id_users`),
  ADD KEY `fk_Upvotes_complain1_idx` (`complain_id_complain`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD KEY `fk_users_user_type_idx` (`user_type_id_user_type`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id_user_type`),
  ADD KEY `fk_user_type_levels1_idx` (`levels_id`),
  ADD KEY `fk_user_type_departments1_idx` (`departments_id_departments`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comments` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `id_complain` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id_departments` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `downvotes`
--
ALTER TABLE `downvotes`
  MODIFY `id_downvotes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id_notifications` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id_permissions` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id_threads` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upvotes`
--
ALTER TABLE `upvotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id_user_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_threads1` FOREIGN KEY (`threads_id_threads`) REFERENCES `threads` (`id_threads`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `complain`
--
ALTER TABLE `complain`
  ADD CONSTRAINT `fk_complain_categories_defined1` FOREIGN KEY (`categories_defined_id_categories_defined`) REFERENCES `categories_defined` (`id_categories_defined`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_complain_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `downvotes`
--
ALTER TABLE `downvotes`
  ADD CONSTRAINT `fk_downvotes_complain1` FOREIGN KEY (`complain_id_complain`) REFERENCES `complain` (`id_complain`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_downvotes_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `fk_levels_permissions1` FOREIGN KEY (`permissions_id_permissions`) REFERENCES `permissions` (`id_permissions`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_complain1` FOREIGN KEY (`complain_id_complain`) REFERENCES `complain` (`id_complain`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `fk_threads_complain1` FOREIGN KEY (`complain_id_complain`) REFERENCES `complain` (`id_complain`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `upvotes`
--
ALTER TABLE `upvotes`
  ADD CONSTRAINT `fk_Upvotes_complain1` FOREIGN KEY (`complain_id_complain`) REFERENCES `complain` (`id_complain`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Upvotes_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_user_type` FOREIGN KEY (`user_type_id_user_type`) REFERENCES `user_type` (`id_user_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_type`
--
ALTER TABLE `user_type`
  ADD CONSTRAINT `fk_user_type_departments1` FOREIGN KEY (`departments_id_departments`) REFERENCES `departments` (`id_departments`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_type_levels1` FOREIGN KEY (`levels_id`) REFERENCES `levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
