-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 22, 2021 at 03:23 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_class_routine`
--

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `department`, `name`, `created_at`, `updated_at`) VALUES
(1, 'BBA', '38th-Section A', '2021-08-18 23:23:05', '2021-08-18 23:23:18'),
(2, 'CSE', '38th-Section B', '2021-08-18 23:23:05', '2021-08-18 23:23:18'),
(3, 'CSE', '38th-Section C', '2021-08-18 23:23:05', '2021-08-18 23:23:18'),
(4, 'CSE', '38th-Section D', '2021-08-18 23:23:05', '2021-08-18 23:23:18'),
(6, 'CSE', '38th-Section E', '2021-08-18 23:23:05', '2021-08-18 23:23:18'),
(7, 'EEE', '1', '2021-08-22 01:02:12', '2021-08-22 01:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `class_routines`
--

CREATE TABLE `class_routines` (
  `id` int(11) NOT NULL,
  `day` varchar(191) NOT NULL,
  `time` varchar(191) NOT NULL,
  `department_name` varchar(191) NOT NULL,
  `course_name` varchar(191) NOT NULL,
  `semister` varchar(191) DEFAULT NULL,
  `batch_name` varchar(191) NOT NULL,
  `teacher_name` varchar(191) NOT NULL,
  `room` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class_routines`
--

INSERT INTO `class_routines` (`id`, `day`, `time`, `department_name`, `course_name`, `semister`, `batch_name`, `teacher_name`, `room`, `created_at`, `updated_at`) VALUES
(1, 'Saturday', '10:00AM - 11:00AM', 'CSE', 'Eng-1111', 'Spring', '38th (Section D)', 'Mr Abdul', '302', '2021-08-18 14:02:07', '2021-08-18 14:02:07'),
(3, 'Wednesday', '10:00AM - 11:00AM', 'CSE', 'CSE-1211', 'Spring', '38th-Section C', 't1', '209', '2021-08-18 11:39:35', '2021-08-18 11:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CSE-1111', 'CSE-1111', NULL, NULL),
(2, '', 'CSE-1211', NULL, NULL),
(4, '', 'CSE-1212', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CSE', '2021-08-18 23:21:19', '2021-08-18 23:21:19'),
(3, 'BBA', '2021-08-18 23:21:19', '2021-08-18 23:21:19'),
(5, 'EEE', '2021-08-18 23:21:19', '2021-08-18 23:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `exam_routines`
--

CREATE TABLE `exam_routines` (
  `id` int(11) NOT NULL,
  `day` varchar(191) NOT NULL,
  `time` varchar(191) NOT NULL,
  `department_name` varchar(191) NOT NULL,
  `course_name` varchar(191) NOT NULL,
  `semister` varchar(191) DEFAULT NULL,
  `batch_name` varchar(191) NOT NULL,
  `teacher_name` varchar(191) DEFAULT NULL,
  `room` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_routines`
--

INSERT INTO `exam_routines` (`id`, `day`, `time`, `department_name`, `course_name`, `semister`, `batch_name`, `teacher_name`, `room`, `created_at`, `updated_at`) VALUES
(3, 'Wednesday', '10:00AM - 11:00AM', 'CSE', 'CSE-1211', 'Spring', '38th (Section D)', 't1', '209', '2021-08-18 11:39:35', '2021-08-18 11:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2020_06_17_060708_create_categories_table', 1),
(3, '2020_06_17_060812_create_products_table', 1),
(4, '2020_06_17_060847_create_product_images_table', 1),
(5, '2020_06_17_060938_create_wishlists_table', 1),
(6, '2020_06_17_060951_create_comments_table', 1),
(7, '2020_06_17_061010_create_notifications_table', 1),
(8, '2020_06_17_061032_create_messages_table', 1),
(9, '2020_06_17_061054_create_reports_table', 1),
(10, '2019_05_03_000001_create_customer_columns', 2),
(11, '2019_05_03_000002_create_subscriptions_table', 2),
(12, '2019_05_03_000003_create_subscription_items_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `note`, `created_at`, `updated_at`) VALUES
(2, 'Title Two', 'Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two Notice Two ', '2021-08-21 20:10:35', '2021-08-21 20:10:35'),
(3, 'Ttile 3', 'Note #', '2021-08-21 14:30:23', '2021-08-21 14:30:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`) VALUES
(4, 'sadek.hkm@gmail.com', '495210'),
(8, 'nazmulchowdhury4@gmail.com', '608179'),
(9, 'vmrwrienjlzbikojxn@niwghx.com', '535916');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `designation`, `department`, `studentId`, `batch`, `session`, `password`, `userType`, `created_at`, `updated_at`) VALUES
(26, 'Admin', 'admin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, '$2y$10$4LQuPN4SI0VquyzCblIUouaB6zpmdmuc1vkDWJDF5yWFlKFe.mhr6', 'Admin', '2021-02-23 22:38:51', '2021-02-23 22:38:51'),
(27, 't1', 't1@gmail.com', '123', 'Lecturer', 'CSE', NULL, NULL, NULL, '$2y$10$4LQuPN4SI0VquyzCblIUouaB6zpmdmuc1vkDWJDF5yWFlKFe.mhr6', 'Teacher', '2021-08-16 08:48:45', '2021-08-16 08:48:45'),
(28, 's2', 's2@gmail.com', '345689', NULL, 'cse', '1213030', '38th (Section D)', 'spring', '$2y$10$4LQuPN4SI0VquyzCblIUouaB6zpmdmuc1vkDWJDF5yWFlKFe.mhr6', 'Student', '2021-08-16 11:32:33', '2021-08-16 11:32:33'),
(29, 'T2@gmail.com', 't2@gmail.com', '0158119898989', 'Senior', 'EEE', NULL, NULL, NULL, '$2y$10$9mrYwpP9KhtBsVK5ix.bR.EFWQzpt7HIoo/Bkfmzn7M..OoYTnGU2', 'Teacher', '2021-08-21 19:07:02', '2021-08-21 19:07:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_routines`
--
ALTER TABLE `class_routines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_routines`
--
ALTER TABLE `exam_routines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
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
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `class_routines`
--
ALTER TABLE `class_routines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exam_routines`
--
ALTER TABLE `exam_routines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
