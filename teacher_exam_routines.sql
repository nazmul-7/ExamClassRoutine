-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 22, 2021 at 05:17 PM
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
(9, 7, 29, 'T2@gmail.com', '2021-08-22 08:33:03', '2021-08-22 08:33:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teacher_exam_routines`
--
ALTER TABLE `teacher_exam_routines`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teacher_exam_routines`
--
ALTER TABLE `teacher_exam_routines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
