-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 14, 2019 at 03:35 AM
-- Server version: 5.5.60-0+deb8u1
-- PHP Version: 5.6.36-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rsugm`
--

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(2, 'Resepsionis 2', 'resepsionis', '2019-11-13 04:49:32', NULL),
(13, 'Klinik UPU', 'gedung', '2019-01-27 18:14:29', '2019-01-27 18:14:29'),
(14, 'Klinik Residen', 'gedung', '2019-01-27 18:14:36', '2019-01-27 18:14:36'),
(15, 'Klinik Gigi Anak', 'gedung', '2019-01-27 18:14:46', '2019-01-27 18:14:46'),
(16, 'Klinik Spesialis', 'gedung', '2019-01-27 18:14:54', '2019-01-27 18:14:54'),
(17, 'Klinik Koas', 'gedung', '2019-02-06 20:25:29', '2019-02-06 20:25:29'),
(18, 'Resepsinis 1', 'resepsionis', '2018-02-13 00:00:00', NULL),
(34, 'Resepsinis 3', 'resepsionis', '2019-11-13 06:37:59', '2019-11-13 06:37:59'),
(35, 'Resepsionis 4', 'resepsionis', '2019-11-13 06:40:02', '2019-11-13 06:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `login_session`
--

CREATE TABLE IF NOT EXISTS `login_session` (
`id` int(11) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `location_id` int(11) unsigned NOT NULL,
  `management_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE IF NOT EXISTS `management` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Resepsionis', '2018-02-13 00:00:00', NULL),
(2, 'Ruang', '2018-02-13 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
`id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_01_08_000000_create_location_table', 1),
(2, '2019_01_08_000001_create_management_table', 1),
(3, '2019_01_08_000002_create_users_table', 1),
(4, '2019_01_08_000005_create_survey_table', 1),
(5, '2019_01_08_100003_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saran`
--

CREATE TABLE IF NOT EXISTS `saran` (
`id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saran`
--

INSERT INTO `saran` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Saran 4', '2019-02-12 09:39:53', '0000-00-00 00:00:00'),
(2, 'Saran 3', '2019-01-18 21:09:57', '0000-00-00 00:00:00'),
(3, 'Saran 2', '2019-01-18 21:04:29', '0000-00-00 00:00:00'),
(4, 'Saran 1', '2019-01-18 21:10:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE IF NOT EXISTS `survey` (
`id` int(10) unsigned NOT NULL,
  `management_id` int(10) unsigned NOT NULL,
  `pertanyaan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fungsi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `management_id`, `pertanyaan`, `fungsi`, `sub`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Apakah Anda Puas Dengan Waktu Tunggu Pelayanan Kami?', 'primary', 'Waktu', 1, '2019-01-09 00:00:00', NULL),
(2, 2, 'Apakah Anda Puas Dengan Fasilitas Kami?', 'primary', 'Fasilitas', 1, '2018-02-13 00:00:00', NULL),
(3, 2, 'Apakah Anda Puas Dengan Kualitas Perawatan Kami?', 'primary', 'Kualitas', 1, '2018-02-13 00:00:00', NULL),
(5, 2, 'Apakah Anda Puas Dengan Keramahan Pelayanan Kami?', 'primary', 'Keramahan', 1, '2018-02-13 00:00:00', NULL),
(6, 2, 'Saran Dan Perbaikan', 'selection', 'Saran', 1, '2018-02-13 00:00:00', NULL),
(7, 1, 'Apakah Anda Puas Dengan Keramahan Pelayanan Kami?', 'primary', 'Keramahan', 1, '2018-02-13 00:00:00', NULL),
(8, 1, 'Apakah Anda Puas Dengan Informasi Yang Kami Berikan?', 'primary', 'Informasi', 1, '2018-02-13 00:00:00', NULL),
(9, 1, 'Apakah Anda Puas Dengan Tarif Perawatan Yang Kami Berikan?', 'secondary', 'Tarif', 1, '2018-02-13 00:00:00', NULL),
(10, 1, 'Apakah Anda Puas Dengan Waktu Tunggu Pendaftaran Kami?', 'primary', 'Waktu', 1, '2018-02-13 00:00:00', NULL),
(11, 1, 'Saran Dan Perbaikan', 'selection', 'Saran', 1, '2018-02-13 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `survey_detail`
--

CREATE TABLE IF NOT EXISTS `survey_detail` (
`id` int(11) NOT NULL,
  `survey_id` int(10) unsigned NOT NULL,
  `location_id` int(11) NOT NULL,
  `jawaban` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `saran_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_detail`
--

INSERT INTO `survey_detail` (`id`, `survey_id`, `location_id`, `jawaban`, `description`, `saran_id`, `status`, `created_at`) VALUES
(1, 1, 1, 'p', 'Puas', 0, 1, '2019-01-21 19:41:55'),
(2, 1, 1, 'p', 'Puas', 0, 1, '2019-01-21 19:42:03'),
(7, 1, 1, 'p', 'Puas', 0, 1, '2019-01-21 19:45:11'),
(8, 2, 1, 'kp', 'Kurang Puas', 0, 1, '2019-01-21 19:45:15'),
(9, 3, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-21 19:45:16'),
(10, 5, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-21 19:45:19'),
(11, 6, 1, 'sr', 'Saran', 3, 1, '2019-01-21 19:45:22'),
(12, 1, 1, 'kp', 'Kurang Puas', 0, 1, '2019-01-21 19:45:27'),
(13, 2, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-21 19:45:28'),
(14, 3, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-21 19:45:30'),
(15, 5, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-21 19:45:33'),
(16, 6, 1, 'sr', 'Saran', 4, 1, '2019-01-21 19:45:36'),
(17, 1, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-21 19:45:40'),
(18, 2, 1, 'kp', 'Kurang Puas', 0, 1, '2019-01-21 19:45:41'),
(19, 3, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-21 19:45:44'),
(20, 5, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-21 19:45:45'),
(21, 6, 1, 'sr', 'Saran', 2, 1, '2019-01-21 19:45:47'),
(22, 1, 1, 'p', 'Puas', 0, 1, '2019-01-21 19:45:56'),
(23, 2, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-21 19:45:56'),
(24, 3, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-21 19:46:00'),
(25, 5, 1, 'p', 'Puas', 0, 1, '2019-01-21 19:46:00'),
(26, 6, 1, 'sr', 'Saran', 4, 1, '2019-01-21 19:46:07'),
(27, 7, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-21 20:37:01'),
(28, 8, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-21 20:37:03'),
(29, 9, 0, 'ma', 'Mahal', 0, 1, '2019-01-21 20:37:06'),
(30, 10, 0, 'kp', 'Kurang Puas', 0, 1, '2019-01-21 20:37:10'),
(31, 11, 0, 'sr', 'Saran', 4, 1, '2019-01-21 20:37:14'),
(32, 7, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-21 20:37:18'),
(33, 8, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-21 20:37:19'),
(34, 9, 0, 'ma', 'Mahal', 0, 1, '2019-01-21 20:37:22'),
(35, 10, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-21 20:37:23'),
(36, 11, 0, 'sr', 'Saran', 1, 1, '2019-01-21 20:37:26'),
(37, 7, 6, 'sp', 'Sangat Puas', 0, 1, '2019-01-22 18:42:34'),
(38, 7, 6, 'sp', 'Sangat Puas', 0, 1, '2019-01-22 18:42:56'),
(39, 8, 6, 'sp', 'Sangat Puas', 0, 1, '2019-01-22 18:43:05'),
(40, 7, 6, 'sp', 'Sangat Puas', 0, 1, '2019-01-22 18:47:13'),
(41, 8, 6, 'p', 'Puas', 0, 1, '2019-01-22 18:47:15'),
(42, 7, 6, 'p', 'Puas', 0, 1, '2019-01-22 18:48:10'),
(43, 8, 6, 'kp', 'Kurang Puas', 0, 1, '2019-01-22 18:48:11'),
(44, 7, 6, 'tp', 'Tidak Puas', 0, 1, '2019-01-22 18:48:28'),
(45, 8, 6, 'kp', 'Kurang Puas', 0, 1, '2019-01-22 18:48:29'),
(46, 7, 6, 'sp', 'Sangat Puas', 0, 1, '2019-01-22 18:48:46'),
(47, 8, 6, 'p', 'Puas', 0, 1, '2019-01-22 18:48:49'),
(48, 7, 6, 'p', 'Puas', 0, 1, '2019-01-22 18:50:19'),
(49, 8, 6, 'kp', 'Kurang Puas', 0, 1, '2019-01-22 18:50:19'),
(50, 9, 6, 'c', 'Cukup', 0, 1, '2019-01-22 18:50:23'),
(51, 10, 6, 'p', 'Puas', 0, 1, '2019-01-22 18:50:25'),
(52, 11, 6, 'sr', 'Saran', 4, 1, '2019-01-22 18:50:40'),
(53, 1, 6, 'sp', 'Sangat Puas', 0, 1, '2019-01-22 18:51:50'),
(54, 2, 6, 'p', 'Puas', 0, 1, '2019-01-22 18:51:52'),
(55, 3, 6, 'kp', 'Kurang Puas', 0, 1, '2019-01-22 18:51:55'),
(56, 5, 6, 'tp', 'Tidak Puas', 0, 1, '2019-01-22 18:51:56'),
(57, 6, 6, 'sr', 'Saran', 4, 1, '2019-01-22 18:52:03'),
(88, 1, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-23 02:43:34'),
(89, 1, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-23 02:43:34'),
(90, 2, 1, 'p', 'Puas', 0, 1, '2019-01-23 02:43:37'),
(91, 3, 1, 'kp', 'Kurang Puas', 0, 1, '2019-01-23 02:43:39'),
(92, 3, 1, 'kp', 'Kurang Puas', 0, 1, '2019-01-23 02:43:40'),
(93, 5, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-23 02:43:41'),
(94, 6, 1, 'sr', 'Saran', 3, 1, '2019-01-23 02:43:43'),
(95, 6, 1, 'sr', 'Saran', 3, 1, '2019-01-23 02:43:44'),
(96, 1, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-23 02:51:57'),
(97, 1, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-23 02:51:57'),
(98, 1, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-23 06:09:25'),
(99, 2, 0, 'kp', 'Kurang Puas', 0, 1, '2019-01-23 06:09:28'),
(100, 3, 0, 'p', 'Puas', 0, 1, '2019-01-23 06:09:33'),
(101, 5, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-23 06:09:36'),
(102, 6, 0, 'sr', 'Saran', 4, 1, '2019-01-23 06:09:40'),
(103, 1, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-23 06:10:10'),
(104, 2, 0, 'p', 'Puas', 0, 1, '2019-01-23 06:10:11'),
(105, 3, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-23 06:10:14'),
(106, 5, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-23 06:10:17'),
(107, 1, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-24 04:32:26'),
(108, 2, 1, 'p', 'Puas', 0, 1, '2019-01-24 04:32:35'),
(109, 3, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-24 04:32:36'),
(110, 5, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-24 04:32:40'),
(111, 2, 1, 'p', 'Puas', 0, 1, '2019-01-24 04:33:01'),
(112, 2, 1, 'p', 'Puas', 0, 1, '2019-01-24 04:33:01'),
(113, 1, 1, 'kp', 'Kurang Puas', 0, 1, '2019-01-24 04:33:01'),
(114, 1, 1, 'kp', 'Kurang Puas', 0, 1, '2019-01-24 04:33:01'),
(115, 3, 1, 'tp', 'Tidak Puas', 0, 1, '2019-01-24 04:33:04'),
(116, 3, 1, 'sp', 'Sangat Puas', 0, 1, '2019-01-24 04:33:04'),
(117, 5, 1, 'p', 'Puas', 0, 1, '2019-01-24 04:33:06'),
(118, 5, 1, 'p', 'Puas', 0, 1, '2019-01-24 04:33:06'),
(119, 5, 1, 'p', 'Puas', 0, 1, '2019-01-24 04:33:07'),
(120, 5, 1, 'p', 'Puas', 0, 1, '2019-01-24 04:33:07'),
(121, 6, 1, 'sr', 'Saran', 2, 1, '2019-01-24 04:33:08'),
(122, 6, 1, 'sr', 'Saran', 2, 1, '2019-01-24 04:33:12'),
(123, 7, 0, 'p', 'Puas', 0, 1, '2019-01-24 09:25:44'),
(124, 8, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-24 09:25:45'),
(125, 9, 0, 'ma', 'Mahal', 0, 1, '2019-01-24 09:25:54'),
(126, 10, 0, 'p', 'Puas', 0, 1, '2019-01-24 09:25:59'),
(127, 7, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-25 02:31:29'),
(128, 8, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-25 02:31:40'),
(129, 9, 0, 'sm', 'Sangat Mahal', 0, 1, '2019-01-25 02:31:41'),
(130, 10, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-25 02:31:43'),
(131, 7, 0, 'p', 'Puas', 0, 1, '2019-01-25 02:35:45'),
(132, 7, 0, 'p', 'Puas', 0, 1, '2019-01-25 02:35:47'),
(133, 8, 0, 'kp', 'Kurang Puas', 0, 1, '2019-01-25 02:35:55'),
(134, 9, 0, 'sm', 'Sangat Mahal', 0, 1, '2019-01-25 02:35:58'),
(135, 10, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-25 02:36:05'),
(136, 11, 0, 'sr', 'Saran', 1, 1, '2019-01-25 02:36:08'),
(137, 7, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-25 02:36:13'),
(138, 8, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-25 02:36:17'),
(139, 9, 0, 'c', 'Cukup', 0, 1, '2019-01-25 02:36:19'),
(140, 10, 0, 'p', 'Puas', 0, 1, '2019-01-25 02:36:25'),
(141, 7, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-25 02:37:00'),
(142, 8, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-25 02:37:04'),
(143, 9, 0, 'c', 'Cukup', 0, 1, '2019-01-25 02:37:07'),
(144, 10, 0, 'p', 'Puas', 0, 1, '2019-01-25 02:37:12'),
(145, 7, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-25 04:16:38'),
(146, 8, 0, 'p', 'Puas', 0, 1, '2019-01-25 04:16:42'),
(147, 9, 0, 'ma', 'Mahal', 0, 1, '2019-01-25 04:16:46'),
(148, 10, 0, 'p', 'Puas', 0, 1, '2019-01-25 04:16:52'),
(149, 11, 0, 'sr', 'Saran', 1, 1, '2019-01-25 04:17:31'),
(150, 7, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-25 04:17:39'),
(151, 8, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-25 04:17:41'),
(152, 9, 0, 'ma', 'Mahal', 0, 1, '2019-01-25 04:17:43'),
(153, 10, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-25 04:17:45'),
(154, 11, 0, 'sr', 'Saran', 3, 1, '2019-01-25 04:17:47'),
(155, 7, 0, 'kp', 'Kurang Puas', 0, 1, '2019-01-25 04:17:59'),
(156, 8, 0, 'kp', 'Kurang Puas', 0, 1, '2019-01-25 04:18:01'),
(157, 9, 0, 'c', 'Cukup', 0, 1, '2019-01-25 04:18:02'),
(158, 10, 0, 'kp', 'Kurang Puas', 0, 1, '2019-01-25 04:18:04'),
(159, 11, 0, 'sr', 'Saran', 3, 1, '2019-01-25 04:18:06'),
(160, 7, 0, 'kp', 'Kurang Puas', 0, 1, '2019-01-25 04:18:19'),
(161, 8, 0, 'kp', 'Kurang Puas', 0, 1, '2019-01-25 04:18:21'),
(162, 9, 0, 'ma', 'Mahal', 0, 1, '2019-01-25 04:18:43'),
(163, 10, 0, 'tp', 'Tidak Puas', 0, 1, '2019-01-25 04:18:47'),
(164, 11, 0, 'sr', 'Saran', 2, 1, '2019-01-25 04:18:50'),
(165, 7, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-25 10:54:34'),
(166, 7, 0, 'sp', 'Sangat Puas', 0, 1, '2019-01-25 10:54:34'),
(167, 8, 0, 'kp', 'Kurang Puas', 0, 1, '2019-01-25 10:54:37'),
(168, 9, 0, 'c', 'Cukup', 0, 1, '2019-01-25 10:54:39'),
(169, 10, 0, 'p', 'Puas', 0, 1, '2019-01-25 10:54:41'),
(170, 10, 0, 'p', 'Puas', 0, 1, '2019-01-25 10:54:41'),
(171, 11, 0, 'sr', 'Saran', 1, 1, '2019-01-25 10:54:44'),
(172, 11, 0, 'sr', 'Saran', 1, 1, '2019-01-25 10:54:44'),
(173, 7, 9, 'p', 'Puas', 0, 1, '2019-02-01 07:53:10'),
(174, 7, 9, 'kp', 'Kurang Puas', 0, 1, '2019-02-01 07:53:10'),
(175, 8, 9, 'tp', 'Tidak Puas', 0, 1, '2019-02-01 07:53:14'),
(176, 9, 9, 'ma', 'Mahal', 0, 1, '2019-02-01 07:53:16'),
(177, 10, 9, 'tp', 'Tidak Puas', 0, 1, '2019-02-01 07:53:18'),
(178, 7, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-03 04:52:04'),
(179, 8, 0, 'kp', 'Kurang Puas', 0, 1, '2019-02-03 04:52:06'),
(180, 9, 0, 'ma', 'Mahal', 0, 1, '2019-02-03 04:52:12'),
(181, 10, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-03 04:52:13'),
(182, 1, 0, 'sp', 'Sangat Puas', 0, 1, '2019-02-04 09:28:24'),
(183, 1, 0, 'sp', 'Sangat Puas', 0, 1, '2019-02-04 09:28:24'),
(184, 2, 0, 'p', 'Puas', 0, 1, '2019-02-04 09:28:26'),
(185, 3, 0, 'kp', 'Kurang Puas', 0, 1, '2019-02-04 09:28:29'),
(186, 5, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-04 09:28:31'),
(187, 5, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-04 09:28:31'),
(188, 6, 0, 'sr', 'Saran', 3, 1, '2019-02-04 09:28:33'),
(189, 6, 0, 'sr', 'Saran', 3, 1, '2019-02-04 09:28:33'),
(190, 1, 14, 'p', 'Puas', 0, 1, '2019-02-04 09:36:35'),
(191, 1, 14, 'p', 'Puas', 0, 1, '2019-02-04 09:36:36'),
(192, 1, 0, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 19:57:08'),
(193, 1, 0, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 19:57:08'),
(194, 2, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 19:57:10'),
(195, 3, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 19:57:12'),
(196, 5, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 19:57:15'),
(197, 5, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 19:57:15'),
(198, 6, 0, 'sr', 'Saran', 3, 1, '2019-02-06 19:57:18'),
(199, 6, 0, 'sr', 'Saran', 3, 1, '2019-02-06 19:57:18'),
(200, 1, 0, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 19:57:23'),
(201, 1, 0, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 19:57:23'),
(202, 2, 0, 'p', 'Puas', 0, 1, '2019-02-06 19:57:27'),
(203, 3, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 19:57:27'),
(204, 5, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 19:57:30'),
(205, 5, 0, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 19:57:30'),
(206, 6, 0, 'sr', 'Saran', 3, 1, '2019-02-06 19:57:32'),
(207, 6, 0, 'sr', 'Saran', 3, 1, '2019-02-06 19:57:32'),
(208, 1, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:06:08'),
(209, 1, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:06:08'),
(210, 2, 14, 'p', 'Puas', 0, 1, '2019-02-06 20:06:11'),
(211, 3, 14, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 20:06:14'),
(212, 3, 14, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 20:06:14'),
(213, 5, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:06:16'),
(214, 6, 14, 'sr', 'Saran', 3, 1, '2019-02-06 20:06:18'),
(215, 6, 14, 'sr', 'Saran', 3, 1, '2019-02-06 20:06:18'),
(216, 1, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:06:23'),
(217, 1, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:06:23'),
(218, 2, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:06:24'),
(219, 3, 14, 'p', 'Puas', 0, 1, '2019-02-06 20:06:26'),
(220, 5, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:06:28'),
(221, 5, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:06:28'),
(222, 6, 14, 'sr', 'Saran', 1, 1, '2019-02-06 20:06:32'),
(223, 6, 14, 'sr', 'Saran', 1, 1, '2019-02-06 20:06:32'),
(224, 1, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:17:32'),
(225, 1, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:17:33'),
(226, 2, 14, 'p', 'Puas', 0, 1, '2019-02-06 20:17:35'),
(227, 3, 14, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 20:17:37'),
(228, 5, 14, 'p', 'Puas', 0, 1, '2019-02-06 20:17:39'),
(229, 5, 14, 'p', 'Puas', 0, 1, '2019-02-06 20:17:39'),
(230, 6, 14, 'sr', 'Saran', 3, 1, '2019-02-06 20:17:42'),
(231, 6, 14, 'sr', 'Saran', 3, 1, '2019-02-06 20:17:42'),
(232, 1, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:36:59'),
(233, 1, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:00'),
(234, 2, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:01'),
(235, 3, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:03'),
(236, 5, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:06'),
(237, 5, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:06'),
(238, 6, 14, 'sr', 'Saran', 2, 1, '2019-02-06 20:37:09'),
(239, 6, 14, 'sr', 'Saran', 2, 1, '2019-02-06 20:37:10'),
(240, 1, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:23'),
(241, 1, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:23'),
(242, 2, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:25'),
(243, 3, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:27'),
(244, 5, 14, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 20:37:29'),
(245, 5, 14, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 20:37:29'),
(246, 6, 14, 'sr', 'Saran', 3, 1, '2019-02-06 20:37:31'),
(247, 6, 14, 'sr', 'Saran', 3, 1, '2019-02-06 20:37:31'),
(248, 1, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:37:36'),
(249, 1, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:37:36'),
(250, 2, 14, 'sp', 'Sangat Puas', 0, 1, '2019-02-06 20:37:38'),
(251, 3, 14, 'kp', 'Kurang Puas', 0, 1, '2019-02-06 20:37:40'),
(252, 5, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:44'),
(253, 5, 14, 'tp', 'Tidak Puas', 0, 1, '2019-02-06 20:37:44'),
(254, 6, 14, 'sr', 'Saran', 3, 1, '2019-02-06 20:37:49'),
(255, 6, 14, 'sr', 'Saran', 3, 1, '2019-02-06 20:37:50'),
(256, 1, 9, 'sp', 'Sangat Puas', 0, 1, '2019-02-12 11:05:20'),
(257, 1, 9, 'sp', 'Sangat Puas', 0, 1, '2019-02-12 11:05:20'),
(258, 2, 9, 'p', 'Puas', 0, 1, '2019-02-12 11:05:22'),
(259, 3, 9, 'kp', 'Kurang Puas', 0, 1, '2019-02-12 11:05:24'),
(260, 5, 9, 'tp', 'Tidak Puas', 0, 1, '2019-02-12 11:05:26'),
(261, 5, 9, 'tp', 'Tidak Puas', 0, 1, '2019-02-12 11:05:26'),
(262, 6, 9, 'sr', 'Saran', 3, 1, '2019-02-12 11:05:28'),
(263, 6, 9, 'sr', 'Saran', 3, 1, '2019-02-12 11:05:28'),
(264, 1, 9, 'p', 'Puas', 0, 1, '2019-02-12 11:07:41'),
(265, 1, 9, 'p', 'Puas', 0, 1, '2019-02-12 11:07:41'),
(266, 2, 9, 'kp', 'Kurang Puas', 0, 1, '2019-02-12 11:07:44'),
(267, 3, 9, 'sp', 'Sangat Puas', 0, 1, '2019-02-12 11:07:46'),
(268, 5, 9, 'tp', 'Tidak Puas', 0, 1, '2019-02-12 11:07:47'),
(269, 5, 9, 'tp', 'Tidak Puas', 0, 1, '2019-02-12 11:07:48'),
(270, 6, 9, 'sr', 'Saran', 3, 1, '2019-02-12 11:07:49'),
(271, 6, 9, 'sr', 'Saran', 3, 1, '2019-02-12 11:07:49'),
(272, 1, 15, 'sp', 'Sangat Puas', 0, 1, '2019-02-12 11:14:06'),
(273, 2, 15, 'p', 'Puas', 0, 1, '2019-02-12 11:14:08'),
(274, 3, 15, 'kp', 'Kurang Puas', 0, 1, '2019-02-12 11:14:10'),
(275, 5, 15, 'tp', 'Tidak Puas', 0, 1, '2019-02-12 11:14:12'),
(276, 6, 15, 'sr', 'Saran', 3, 1, '2019-02-12 11:14:14'),
(277, 1, 15, 'tp', 'Tidak Puas', 0, 1, '2019-02-12 11:14:49'),
(278, 1, 15, 'p', 'Puas', 0, 1, '2019-02-12 11:15:06'),
(279, 2, 15, 'kp', 'Kurang Puas', 0, 1, '2019-02-12 11:15:08'),
(280, 3, 15, 'tp', 'Tidak Puas', 0, 1, '2019-02-12 11:15:08'),
(281, 5, 15, 'p', 'Puas', 0, 1, '2019-02-12 11:15:11'),
(282, 6, 15, 'sr', 'Saran', 3, 1, '2019-02-12 11:15:24'),
(283, 1, 15, 'sp', 'Sangat Puas', 0, 1, '2019-02-12 22:56:58'),
(284, 2, 15, 'p', 'Puas', 0, 1, '2019-02-12 22:57:06'),
(285, 3, 15, 'kp', 'Kurang Puas', 0, 1, '2019-02-12 22:57:18'),
(286, 5, 15, 'tp', 'Tidak Puas', 0, 1, '2019-02-12 22:57:22'),
(287, 6, 15, 'sr', 'Saran', 3, 1, '2019-02-12 22:57:25'),
(288, 1, 15, 'sp', 'Sangat Puas', 0, 1, '2019-02-12 23:24:47'),
(289, 2, 15, 'p', 'Puas', 0, 1, '2019-02-12 23:24:49'),
(290, 3, 15, 'kp', 'Kurang Puas', 0, 1, '2019-02-12 23:24:52'),
(291, 5, 15, 'p', 'Puas', 0, 1, '2019-02-12 23:25:03'),
(292, 6, 15, 'sr', 'Saran', 3, 1, '2019-02-12 23:25:05'),
(293, 1, 9, 'sp', 'Sangat Puas', 0, 1, '2019-02-13 00:06:34'),
(294, 1, 9, 'sp', 'Sangat Puas', 0, 1, '2019-02-13 00:07:23'),
(295, 2, 9, 'p', 'Puas', 0, 1, '2019-02-13 00:07:25'),
(296, 3, 9, 'kp', 'Kurang Puas', 0, 1, '2019-02-13 00:07:28'),
(297, 5, 9, 'tp', 'Tidak Puas', 0, 1, '2019-02-13 00:07:30'),
(298, 6, 9, 'sr', 'Saran', 3, 1, '2019-02-13 00:07:39'),
(299, 1, 9, 'sp', 'Sangat Puas', 0, 1, '2019-02-13 00:13:12'),
(300, 2, 9, 'p', 'Puas', 0, 1, '2019-02-13 00:13:15'),
(301, 3, 9, 'sp', 'Sangat Puas', 0, 1, '2019-02-13 00:13:17'),
(302, 5, 9, 'tp', 'Tidak Puas', 0, 1, '2019-02-13 00:13:20'),
(303, 6, 9, 'sr', 'Saran', 2, 1, '2019-02-13 00:13:22'),
(304, 1, 9, 'sp', 'Sangat Puas', 0, 1, '2019-02-13 00:17:01'),
(305, 2, 9, 'p', 'Puas', 0, 1, '2019-02-13 00:17:03'),
(306, 3, 9, 'kp', 'Kurang Puas', 0, 1, '2019-02-13 00:17:05'),
(307, 5, 9, 'tp', 'Tidak Puas', 0, 1, '2019-02-13 00:17:07'),
(308, 6, 9, 'sr', 'Saran', 2, 1, '2019-02-13 00:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$9x9uX.ws/myAFAE0c0Wn0O9GvT8/odsliTlsQ5fipcQ7JWkMYVweC', '085726242220', 'admin', '6Bk5jz6YCcsXbTWm9G8seaszxYT5Jtve7fhvLqRtbOLCaDk2QGwQgJhrLdNO', '2019-01-09 02:35:57', '2019-01-09 02:35:57'),
(2, 'rizal', 'operator@gmail.com', '$2y$10$5ErGbltvoW1tar6T2Gee3eEvqBMoxp8tFTSYVD0FzosTX8PPwQw.K', '085513586940', 'operator', NULL, '2019-01-09 03:24:21', '2019-01-09 03:24:21'),
(4, 'adnjay', 'adnjay@gmail.com', '$2y$10$G/kr.p0lJmuNTHsnJB9UK.qs21307bUUprciEmROJLeXTxbaXrTw.', '0857264544', 'operator', NULL, '2019-01-16 10:34:00', '2019-01-16 10:34:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `location`
--
ALTER TABLE `location`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_session`
--
ALTER TABLE `login_session`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
 ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `saran`
--
ALTER TABLE `saran`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
 ADD PRIMARY KEY (`id`), ADD KEY `survey_management_id_foreign` (`management_id`);

--
-- Indexes for table `survey_detail`
--
ALTER TABLE `survey_detail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `login_session`
--
ALTER TABLE `login_session`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `management`
--
ALTER TABLE `management`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `saran`
--
ALTER TABLE `saran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `survey_detail`
--
ALTER TABLE `survey_detail`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=309;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `survey`
--
ALTER TABLE `survey`
ADD CONSTRAINT `survey_management_id_foreign` FOREIGN KEY (`management_id`) REFERENCES `management` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
