-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 18, 2019 at 03:09 AM
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
(18, 'Resepsionis 1', 'resepsionis', '2018-02-13 00:00:00', NULL),
(34, 'Resepsionis 3', 'resepsionis', '2019-11-13 06:37:59', '2019-11-13 06:37:59'),
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

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
(1, 'Tingkatkan Pelayanan Medis', '2019-11-17 02:55:42', '0000-00-00 00:00:00'),
(2, 'Tingkatkan Sarana Pelayanan', '2019-11-17 02:55:53', '0000-00-00 00:00:00'),
(3, 'Kesesuaian Harga', '2019-11-17 02:56:00', '0000-00-00 00:00:00'),
(4, 'Tingkatkan Waktu Pelayanan', '2019-11-17 02:56:11', '0000-00-00 00:00:00');

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
  `management_id` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_detail`
--

INSERT INTO `survey_detail` (`id`, `survey_id`, `location_id`, `jawaban`, `description`, `saran_id`, `management_id`, `status`, `created_at`, `date`) VALUES
(1, 7, 18, 'sp', 'Sangat Puas', 0, '1', 1, '2019-11-17 15:41:51', '2019-11-17'),
(2, 7, 18, 'p', 'Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(3, 8, 18, 'kp', 'Kurang Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(4, 9, 18, 'ma', 'Mahal', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(5, 10, 18, 'sp', 'Sangat Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(6, 11, 18, 'sr', 'Saran', 3, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(7, 7, 18, 'kp', 'Kurang Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(8, 7, 18, 'p', 'Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(9, 8, 18, 'tp', 'Tidak Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(10, 9, 18, 'sm', 'Sangat Mahal', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(11, 10, 18, 'sp', 'Sangat Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(12, 11, 18, 'sr', 'Saran', 3, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(13, 7, 18, 'kp', 'Kurang Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(14, 8, 18, 'tp', 'Tidak Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(15, 9, 18, 'sm', 'Sangat Mahal', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(16, 10, 18, 'p', 'Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(17, 11, 18, 'sr', 'Saran', 2, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(18, 7, 18, 'kp', 'Kurang Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(19, 7, 18, 'sp', 'Sangat Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(20, 8, 18, 'tp', 'Tidak Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(21, 9, 18, 'c', 'Cukup', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(22, 10, 18, 'p', 'Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(23, 11, 18, 'sr', 'Saran', 3, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(24, 7, 18, 'sp', 'Sangat Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(25, 8, 18, 'tp', 'Tidak Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(26, 9, 18, 'c', 'Cukup', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(27, 10, 18, 'p', 'Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(28, 11, 18, 'sr', 'Saran', 2, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(29, 7, 18, 'kp', 'Kurang Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(30, 8, 18, 'sp', 'Sangat Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(31, 9, 18, 'ma', 'Mahal', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(32, 10, 18, 'kp', 'Kurang Puas', 0, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(33, 11, 18, 'sr', 'Saran', 3, '1', 1, '2019-11-17 15:42:02', '2019-11-17'),
(45, 1, 16, 'sp', 'Sangat Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(46, 2, 16, 'p', 'Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(47, 3, 16, 'kp', 'Kurang Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(48, 5, 16, 'tp', 'Tidak Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(49, 6, 16, 'sr', 'Saran', 3, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(50, 1, 16, 'p', 'Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(51, 2, 16, 'kp', 'Kurang Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(52, 3, 16, 'p', 'Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(53, 5, 16, 'p', 'Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(54, 6, 16, 'sr', 'Saran', 3, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(55, 1, 16, 'sp', 'Sangat Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(56, 2, 16, 'kp', 'Kurang Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(57, 3, 16, 'tp', 'Tidak Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(58, 5, 16, 'kp', 'Kurang Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(59, 6, 16, 'sr', 'Saran', 3, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(60, 1, 16, 'p', 'Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(61, 2, 16, 'kp', 'Kurang Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(62, 3, 16, 'sp', 'Sangat Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(63, 5, 16, 'tp', 'Tidak Puas', 0, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(64, 6, 16, 'sr', 'Saran', 3, '2', 1, '2019-11-17 15:42:02', '2019-11-17'),
(65, 1, 16, 'sp', 'Sangat Puas', 0, '2', 1, '2019-11-17 15:48:11', '2019-11-17'),
(66, 2, 16, 'p', 'Puas', 0, '2', 1, '2019-11-17 15:48:13', '2019-11-17'),
(67, 3, 16, 'tp', 'Tidak Puas', 0, '2', 1, '2019-11-17 15:48:16', '2019-11-17'),
(68, 5, 16, 'kp', 'Kurang Puas', 0, '2', 1, '2019-11-17 15:48:17', '2019-11-17'),
(69, 6, 16, 'sr', 'Saran', 2, '2', 1, '2019-11-17 15:48:21', '2019-11-17'),
(70, 1, 16, 'p', 'Puas', 0, '2', 1, '2019-11-17 15:48:27', '2019-11-17'),
(71, 2, 16, 'sp', 'Sangat Puas', 0, '2', 1, '2019-11-17 15:48:28', '2019-11-17'),
(72, 3, 16, 'tp', 'Tidak Puas', 0, '2', 1, '2019-11-17 15:48:31', '2019-11-17'),
(73, 5, 16, 'sp', 'Sangat Puas', 0, '2', 1, '2019-11-17 15:48:32', '2019-11-17'),
(74, 6, 16, 'sr', 'Saran', 4, '2', 1, '2019-11-17 15:48:35', '2019-11-17');

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
(2, 'operator1', 'operator@gmail.com', '$2y$10$5ErGbltvoW1tar6T2Gee3eEvqBMoxp8tFTSYVD0FzosTX8PPwQw.K', '085513586940', 'operator', NULL, '2019-01-09 03:24:21', '2019-01-09 03:24:21'),
(4, 'resepsionis1', 'adnjay@gmail.com', '$2y$10$5ErGbltvoW1tar6T2Gee3eEvqBMoxp8tFTSYVD0FzosTX8PPwQw.K', '0857264544', 'resepsionis', NULL, '2019-01-16 10:34:00', '2019-01-16 10:34:00');

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=75;
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
