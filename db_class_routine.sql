-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 29, 2021 at 10:37 PM
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
  `department_name` varchar(191) DEFAULT NULL,
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
(506, 'Sunday', 8, 9, 1, 'CSE', 'CSE 143', 'Spring', 'Session: 2019-20, Section A', 'MHN', '331', NULL, NULL),
(507, 'Sunday', 9, 10, 1, 'CSE', 'CSE-132', 'Spring', 'Session: 2019-20, Section A', 'EH', 'Gallery 2', NULL, NULL),
(508, 'Sunday', 10, 11, 1, 'CSE', 'CSE 133', 'Spring', 'Session: 2019-20, Section A', 'EH', '329', NULL, NULL),
(509, 'Sunday', 2, 5, 3, 'CSE', 'CSE 134', 'Spring', 'Session: 2019-20, Section A', 'EH', '304', NULL, NULL),
(510, 'Monday', 8, 9, 1, 'CSE', 'EEE 109D', 'Spring', 'Session: 2019-20, Section A', 'EEE', 'Gallery 2', NULL, NULL),
(511, 'Monday', 9, 10, 1, 'CSE', 'MAT 102D', 'Spring', 'Session: 2019-20, Section A', 'MAT', 'Gallery 2', NULL, NULL),
(512, 'Monday', 10, 11, 1, 'CSE', 'ENG 101D', 'Spring', 'Session: 2019-20, Section A', 'ENG', 'Gallery 2', NULL, NULL),
(513, 'Monday', 11, 12, 1, 'CSE', 'ENG 102D', 'Spring', 'Session: 2019-20, Section A', 'ENG', 'Gallery 2', NULL, NULL),
(514, 'Tuesday', 8, 11, 3, 'CSE', 'EEE 110D', 'Spring', 'Session: 2019-20, Section A', 'EEE', 'EEE Lab', NULL, NULL),
(515, 'Tuesday', 11, 12, 1, 'CSE', 'CSE 143', 'Spring', 'Session: 2019-20, Section A', 'MHN', '331', NULL, NULL),
(516, 'Tuesday', 12, 1, 1, 'CSE', 'CSE 133', 'Spring', 'Session: 2019-20, Section A', 'EH', '329', NULL, NULL),
(517, 'Wednesday', 8, 11, 3, 'CSE', 'CSE 134', 'Spring', 'Session: 2019-20, Section A', 'EH', '304', NULL, NULL),
(518, 'Wednesday', 11, 12, 1, 'CSE', 'EEE 109D', 'Spring', 'Session: 2019-20, Section A', 'EEE', 'Gallery 2', NULL, NULL),
(519, 'Wednesday', 12, 1, 1, 'CSE', 'MAT 102D', 'Spring', 'Session: 2019-20, Section A', 'MAT', 'Gallery 2', NULL, NULL),
(520, 'Wednesday', 2, 3, 1, 'CSE', 'ENG 101D', 'Spring', 'Session: 2019-20, Section A', 'ENG', 'Gallery 2', NULL, NULL),
(521, 'Thusday', 8, 9, 1, 'CSE', 'ENG 102D', 'Spring', 'Session: 2019-20, Section A', 'ENG', 'Gallery 2', NULL, NULL),
(522, 'Thusday', 9, 10, 1, 'CSE', 'CSE 143', 'Spring', 'Session: 2019-20, Section A', 'MHN', '331', NULL, NULL),
(523, 'Thusday', 10, 11, 1, 'CSE', 'CSE 133', 'Spring', 'Session: 2019-20, Section A', 'EH', '329', NULL, NULL),
(524, 'Thusday', 11, 12, 1, 'CSE', 'EEE 109D', 'Spring', 'Session: 2019-20, Section A', 'EEE', 'Gallery 2', NULL, NULL),
(525, 'Thusday', 12, 1, 1, 'CSE', 'MAT 102D', 'Spring', 'Session: 2019-20, Section A', 'MAT', 'Gallery 2', NULL, NULL),
(530, 'Sunday', 8, 9, 1, 'CSE', 'CSE 143', 'Spring', 'Session: 2019-20, Section B', 'MHN', '331', NULL, NULL),
(531, 'Sunday', 9, 10, 1, 'CSE', 'CSE-132', 'Spring', 'Session: 2019-20, Section B', 'EH', '329', NULL, NULL),
(532, 'Monday', 8, 9, 1, 'CSE', 'CSE 143', 'Spring', 'Session: 2019-20, Section B', 'MHN', '331', NULL, NULL),
(533, 'Tuesday', 8, 9, 1, 'CSE', 'CSE 143', 'Spring', 'Session: 2019-20, Section B', 'MHN', '331', NULL, NULL);

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
(1, 'CSE 143', 'CSE 143', 3, 1, 1, '2021-08-29 22:20:48', '2021-08-29 22:20:48'),
(2, 'CSE-132', 'CSE-132', 1, 1, 1, '2021-08-29 22:20:48', '2021-08-29 22:20:48'),
(3, 'CSE 133', 'CSE 133', 3, 1, 1, '2021-08-29 22:20:48', '2021-08-29 22:20:48'),
(4, 'CSE 134', 'CSE 134', 2, 3, 3, '2021-08-29 22:20:48', '2021-08-29 22:20:48'),
(5, 'EEE 109D', 'EEE 109D', 3, 1, 1, '2021-08-29 22:20:48', '2021-08-29 22:20:48'),
(6, 'MAT 102D', 'MAT 102D', 3, 1, 1, '2021-08-29 22:20:48', '2021-08-29 22:20:48'),
(7, 'ENG 101D', 'ENG 101D', 2, 1, 1, '2021-08-29 22:20:48', '2021-08-29 22:20:48'),
(8, 'ENG 102D', 'ENG 102D', 2, 1, 1, '2021-08-29 22:20:48', '2021-08-29 22:20:48'),
(9, 'EEE 110D', 'EEE 110D', 1, 3, 3, '2021-08-29 22:20:48', '2021-08-29 22:20:48');

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
(1, 'CSE', '2021-08-18 23:21:19', '2021-08-18 23:21:19');

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
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `total`, `created_at`, `updated_at`) VALUES
(9, '331', 30, '2021-08-25 13:33:15', '2021-08-25 13:33:15'),
(10, '329', 30, '2021-08-25 13:33:26', '2021-08-25 13:33:26'),
(11, 'Gallery 2', 100, '2021-08-25 13:33:26', '2021-08-25 13:33:26'),
(12, '304', 30, '2021-08-25 13:33:26', '2021-08-25 13:33:26'),
(13, 'EEE Lab', 30, '2021-08-25 13:33:26', '2021-08-25 13:33:26');

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
(1, 'Session: 2019-20, Section A', 25, '2021-08-29 22:19:18', '2021-08-29 22:19:18'),
(2, 'Session: 2019-20, Section B', 25, '2021-08-29 22:19:18', '2021-08-29 22:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `semester_courses`
--

CREATE TABLE `semester_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `semester_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `teacher_id` int(10) NOT NULL,
  `room_id` int(10) NOT NULL,
  `semester_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semester_courses`
--

INSERT INTO `semester_courses` (`id`, `semester_id`, `course_id`, `teacher_id`, `room_id`, `semester_name`, `course_name`, `teacher_name`, `room_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 31, 9, 'Session: 2019-20, Section A', 'CSE 143', 'MHN', '331', '2021-08-29 16:34:34', '2021-08-29 16:34:34'),
(2, 1, 2, 30, 11, 'Session: 2019-20, Section A', 'CSE-132', 'EH', 'Gallery 2', '2021-08-29 16:34:51', '2021-08-29 16:34:51'),
(3, 1, 3, 30, 10, 'Session: 2019-20, Section A', 'CSE 133', 'EH', '329', '2021-08-29 16:35:04', '2021-08-29 16:35:04'),
(4, 1, 4, 30, 12, 'Session: 2019-20, Section A', 'CSE 134', 'EH', '304', '2021-08-29 16:35:19', '2021-08-29 16:35:19'),
(5, 1, 5, 32, 11, 'Session: 2019-20, Section A', 'EEE 109D', 'EEE', 'Gallery 2', '2021-08-29 16:35:33', '2021-08-29 16:35:33'),
(6, 1, 6, 33, 11, 'Session: 2019-20, Section A', 'MAT 102D', 'MAT', 'Gallery 2', '2021-08-29 16:35:54', '2021-08-29 16:35:54'),
(7, 1, 7, 34, 11, 'Session: 2019-20, Section A', 'ENG 101D', 'ENG', 'Gallery 2', '2021-08-29 16:36:19', '2021-08-29 16:36:19'),
(8, 1, 8, 34, 11, 'Session: 2019-20, Section A', 'ENG 102D', 'ENG', 'Gallery 2', '2021-08-29 16:36:29', '2021-08-29 16:36:29'),
(9, 1, 9, 32, 13, 'Session: 2019-20, Section A', 'EEE 110D', 'EEE', 'EEE Lab', '2021-08-29 16:36:39', '2021-08-29 16:36:39'),
(10, 2, 1, 31, 9, 'Session: 2019-20, Section B', 'CSE 143', 'MHN', '331', '2021-08-29 20:31:39', '2021-08-29 20:31:39'),
(11, 2, 2, 30, 10, 'Session: 2019-20, Section B', 'CSE-132', 'EH', '329', '2021-08-29 20:31:53', '2021-08-29 20:31:53');

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
(1, 30, 2, 'EH', 'CSE-132', '2021-08-29 16:32:43', '2021-08-29 16:32:43'),
(2, 30, 3, 'EH', 'CSE 133', '2021-08-29 16:32:49', '2021-08-29 16:32:49'),
(3, 31, 1, 'MHN', 'CSE 143', '2021-08-29 16:33:12', '2021-08-29 16:33:12'),
(4, 30, 4, 'EH', 'CSE 134', '2021-08-29 16:33:29', '2021-08-29 16:33:29'),
(5, 32, 5, 'EEE', 'EEE 109D', '2021-08-29 16:33:35', '2021-08-29 16:33:35'),
(6, 32, 9, 'EEE', 'EEE 110D', '2021-08-29 16:33:43', '2021-08-29 16:33:43'),
(7, 33, 6, 'MAT', 'MAT 102D', '2021-08-29 16:33:50', '2021-08-29 16:33:50'),
(8, 34, 7, 'ENG', 'ENG 101D', '2021-08-29 16:34:01', '2021-08-29 16:34:01'),
(9, 34, 8, 'ENG', 'ENG 102D', '2021-08-29 16:34:07', '2021-08-29 16:34:07');

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `users` (`id`, `name`, `nick_name`, `email`, `mobile`, `designation`, `department`, `studentId`, `batch`, `session`, `password`, `userType`, `created_at`, `updated_at`) VALUES
(26, 'Admins', '', 'admin@gmail.com', '1234567', NULL, NULL, NULL, NULL, NULL, '$2y$10$n9nFgPnyIMlSjHQ2USDFnervaClpw5xO8dQ3PBueWytTHp6Y2nWna', 'Admin', '2021-02-23 22:38:51', '2021-08-22 09:15:40'),
(28, 's2', '', 's2@gmail.com', '345689', NULL, 'cse', '1213030', '38th (Section D)', 'spring', '$2y$10$4LQuPN4SI0VquyzCblIUouaB6zpmdmuc1vkDWJDF5yWFlKFe.mhr6', 'Student', '2021-08-16 11:32:33', '2021-08-16 11:32:33'),
(30, 'EH', 'EH', 'eh@gmail.com', '123', 'Lecturer', 'CSE', NULL, NULL, NULL, '$2y$10$4LQuPN4SI0VquyzCblIUouaB6zpmdmuc1vkDWJDF5yWFlKFe.mhr6', 'Teacher', '2021-08-16 08:48:45', '2021-08-16 08:48:45'),
(31, 'MHN', 'MHN', 'mhn@gmail.com', '123', 'Lecturer', 'CSE', NULL, NULL, NULL, '$2y$10$4LQuPN4SI0VquyzCblIUouaB6zpmdmuc1vkDWJDF5yWFlKFe.mhr6', 'Teacher', '2021-08-16 08:48:45', '2021-08-16 08:48:45'),
(32, 'EEE', 'EEE', 'eee@gmail.com', '123', 'Lecturer', 'CSE', NULL, NULL, NULL, '$2y$10$4LQuPN4SI0VquyzCblIUouaB6zpmdmuc1vkDWJDF5yWFlKFe.mhr6', 'Teacher', '2021-08-16 08:48:45', '2021-08-16 08:48:45'),
(33, 'MAT', 'MAT', 'mat@gmail.com', '123', 'Lecturer', 'CSE', NULL, NULL, NULL, '$2y$10$4LQuPN4SI0VquyzCblIUouaB6zpmdmuc1vkDWJDF5yWFlKFe.mhr6', 'Teacher', '2021-08-16 08:48:45', '2021-08-16 08:48:45'),
(34, 'ENG', 'ENG', 'eng@gmail.com', '123', 'Lecturer', 'CSE', NULL, NULL, NULL, '$2y$10$4LQuPN4SI0VquyzCblIUouaB6zpmdmuc1vkDWJDF5yWFlKFe.mhr6', 'Teacher', '2021-08-16 08:48:45', '2021-08-16 08:48:45');

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
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_routines`
--
ALTER TABLE `class_routines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `semester_courses`
--
ALTER TABLE `semester_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `teacher_exam_routines`
--
ALTER TABLE `teacher_exam_routines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
