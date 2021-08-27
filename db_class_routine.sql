-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 27, 2021 at 03:07 PM
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
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `hours` int(5) NOT NULL,
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

INSERT INTO `class_routines` (`id`, `day`, `start_time`, `end_time`, `hours`, `department_name`, `course_name`, `semister`, `batch_name`, `teacher_name`, `room`, `created_at`, `updated_at`) VALUES
(6, 'Sunday', 9, 10, 1, 'CSE', 'CSE 143 (A)', 'Spring', '2019-20 A', 'MHN', '331', '2021-08-22 13:03:18', '2021-08-22 13:03:18'),
(7, 'Sunday', 10, 11, 1, 'CSE', 'CSE 133', 'Spring', '2019-20 A', 'EH', 'Gallery 2', '2021-08-22 13:03:18', '2021-08-22 13:03:18'),
(8, 'Sunday', 11, 12, 1, 'CSE', 'CSE 143 (A)', 'Spring', '2019-20 A', 'EH', '329', '2021-08-22 13:03:18', '2021-08-22 13:03:18'),
(9, 'Monday', 8, 9, 1, 'CSE', 'EEE 109D', 'Spring', '2019-20 A', 'EEE', 'Gallery 2', '2021-08-22 13:03:18', '2021-08-22 13:03:18'),
(10, 'Monday', 9, 10, 1, 'CSE', 'MAT 102D', 'Spring', '2019-20 A', 'MAT', 'Gallery 2', '2021-08-22 13:03:18', '2021-08-22 13:03:18'),
(11, 'Monday', 10, 1, 3, 'CSE', 'CSE 134 (A)', 'Spring', '2019-20 A', 'EH', '304', '2021-08-22 13:03:18', '2021-08-22 13:03:18'),
(12, 'Tuesday', 10, 11, 1, 'CSE', 'CSE 133', 'Spring', '2019-20 A', 'EH', 'Gallery 2', '2021-08-22 13:03:18', '2021-08-22 13:03:18'),
(13, 'Tuesday', 9, 10, 1, 'CSE', 'CSE 143 (A)', 'Spring', '2019-20 A', 'MHN', '331', '2021-08-22 13:03:18', '2021-08-22 13:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` int(5) NOT NULL,
  `class_time` int(5) NOT NULL,
  `exam_time` int(5) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `name`, `credit`, `class_time`, `exam_time`, `created_at`, `updated_at`) VALUES
(2, '', 'CSE-1211', 0, 0, 0, NULL, NULL),
(4, '', 'CSE-1212', 0, 0, 0, NULL, NULL),
(5, 'CSE-3011', 'Data Structure', 3, 3, 2, '2021-08-25 13:40:19', '2021-08-25 13:40:19');

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
-- Table structure for table `dept_class_days`
--

CREATE TABLE `dept_class_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dept_class_days`
--

INSERT INTO `dept_class_days` (`id`, `name`, `day`, `created_at`, `updated_at`) VALUES
(20, 'CSE', 'Sunday', NULL, NULL),
(21, 'CSE', 'Monday', NULL, NULL),
(22, 'CSE', 'Tuesday', NULL, NULL),
(23, 'CSE', 'Wednesday', NULL, NULL),
(24, 'CSE', 'Thusday', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dept_class_times`
--

CREATE TABLE `dept_class_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dept_class_times`
--

INSERT INTO `dept_class_times` (`id`, `name`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 'CSE', '08:00:00', '17:00:00', '2021-08-27 19:04:28', '2021-08-27 19:04:28');

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
(3, 'Wednesday', '10:00AM - 11:00AM', 'CSE', 'CSE-1211', 'Spring', '38th (Section D)', 't1', '209', '2021-08-18 11:39:35', '2021-08-18 11:39:35'),
(6, 'Sunday', '10-11', 'BBA', 'CSE-1111', NULL, '38th-Section A', NULL, '201,203', '2021-08-22 08:30:08', '2021-08-22 08:30:08'),
(7, 'Sunday', '28-28', 'CSE', 'CSE-1111', NULL, '38th-Section C', NULL, '292,920', '2021-08-22 08:33:03', '2021-08-22 08:33:03'),
(8, 'Wednesday', '12-12', 'CSE', 'CSE-1111', NULL, '38th-Section E', NULL, 'rewwr', '2021-08-22 10:38:02', '2021-08-22 10:38:02'),
(9, 'Friday', 'fdfd', 'CSE', 'CSE-1211', 'fdfd', '38th-Section B', NULL, 'fdfd', '2021-08-22 13:11:30', '2021-08-22 13:11:30');

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
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `name`, `total`, `created_at`, `updated_at`) VALUES
(9, '200', 30, '2021-08-25 13:33:15', '2021-08-25 13:33:15'),
(10, '201', 50, '2021-08-25 13:33:26', '2021-08-25 13:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `semester_courses`
--

CREATE TABLE `semester_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `semester_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `semester_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semester_courses`
--

INSERT INTO `semester_courses` (`id`, `semester_id`, `course_id`, `semester_name`, `course_name`, `created_at`, `updated_at`) VALUES
(2, 29, 4, 'T2@gmail.com', 'CSE-1212', '2021-08-25 14:09:45', '2021-08-25 14:09:45'),
(3, 27, 2, 't1', 'CSE-1211', '2021-08-25 14:17:40', '2021-08-25 14:17:40'),
(4, 9, 2, '200', 'CSE-1211', '2021-08-27 12:25:29', '2021-08-27 12:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_courses`
--

CREATE TABLE `teacher_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `teacher_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_courses`
--

INSERT INTO `teacher_courses` (`id`, `teacher_id`, `course_id`, `teacher_name`, `course_name`, `created_at`, `updated_at`) VALUES
(2, 29, 4, 'T2@gmail.com', 'CSE-1212', '2021-08-25 14:09:45', '2021-08-25 14:09:45'),
(3, 27, 2, 't1', 'CSE-1211', '2021-08-25 14:17:40', '2021-08-25 14:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_exam_routines`
--

CREATE TABLE `teacher_exam_routines` (
  `id` int(11) NOT NULL,
  `routine_id` int(10) NOT NULL,
  `teacher_id` int(10) NOT NULL,
  `teacher_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_exam_routines`
--

INSERT INTO `teacher_exam_routines` (`id`, `routine_id`, `teacher_id`, `teacher_name`, `created_at`, `updated_at`) VALUES
(3, 0, 0, 't1', '2021-08-18 11:39:35', '2021-08-18 11:39:35'),
(6, 0, 27, 't1', NULL, NULL),
(7, 0, 29, 'T2@gmail.com', NULL, NULL),
(8, 7, 27, 't1', '2021-08-22 08:33:03', '2021-08-22 08:33:03'),
(9, 7, 29, 'T2@gmail.com', '2021-08-22 08:33:03', '2021-08-22 08:33:03'),
(10, 8, 29, 'T2@gmail.com', '2021-08-22 10:38:02', '2021-08-22 10:38:02'),
(11, 8, 27, 't1', '2021-08-22 10:38:02', '2021-08-22 10:38:02'),
(12, 9, 27, 't1', '2021-08-22 13:11:30', '2021-08-22 13:11:30'),
(13, 9, 29, 'T2@gmail.com', '2021-08-22 13:11:30', '2021-08-22 13:11:30');

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
(26, 'Admins', 'admin@gmail.com', '1234567', NULL, NULL, NULL, NULL, NULL, '$2y$10$n9nFgPnyIMlSjHQ2USDFnervaClpw5xO8dQ3PBueWytTHp6Y2nWna', 'Admin', '2021-02-23 22:38:51', '2021-08-22 09:15:40'),
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
-- Indexes for table `dept_class_days`
--
ALTER TABLE `dept_class_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dept_class_times`
--
ALTER TABLE `dept_class_times`
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
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semester_courses`
--
ALTER TABLE `semester_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_exam_routines`
--
ALTER TABLE `teacher_exam_routines`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dept_class_days`
--
ALTER TABLE `dept_class_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `dept_class_times`
--
ALTER TABLE `dept_class_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_routines`
--
ALTER TABLE `exam_routines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `semester_courses`
--
ALTER TABLE `semester_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teacher_exam_routines`
--
ALTER TABLE `teacher_exam_routines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
