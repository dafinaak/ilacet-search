-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 27, 2025 at 11:15 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ilacet_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ndc_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generic_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labeler_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `ndc_code`, `brand_name`, `generic_name`, `labeler_name`, `product_type`, `created_at`, `updated_at`) VALUES
(1, '59762-3722', 'Alprazolam', 'alprazolam', 'Mylan Pharmaceuticals Inc.', 'HUMAN PRESCRIPTION DRUG', '2025-05-24 22:02:10', '2025-05-24 22:02:10'),
(2, '0002-0800', 'Sterile Diluent', 'diluent', 'Eli Lilly and Company', 'HUMAN PRESCRIPTION DRUG', '2025-05-25 07:30:51', '2025-05-25 07:30:51'),
(3, '12345-0001', 'Brand 1', 'GenericName 1', 'Labeler 1', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(4, '12345-0002', 'Brand 2', 'GenericName 2', 'Labeler 2', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(6, '12345-0004', 'Brand 4', 'GenericName 4', 'Labeler 4', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(10, '12345-0008', 'Brand 8', 'GenericName 8', 'Labeler 8', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(11, '12345-0009', 'Brand 9', 'GenericName 9', 'Labeler 9', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(12, '12345-0010', 'Brand 10', 'GenericName 10', 'Labeler 10', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(13, '12345-0011', 'Brand 11', 'GenericName 11', 'Labeler 11', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(16, '12345-0014', 'Brand 14', 'GenericName 14', 'Labeler 14', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(17, '12345-0015', 'Brand 15', 'GenericName 15', 'Labeler 15', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(18, '12345-0016', 'Brand 16', 'GenericName 16', 'Labeler 16', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(19, '12345-0017', 'Brand 17', 'GenericName 17', 'Labeler 17', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(20, '12345-0018', 'Brand 18', 'GenericName 18', 'Labeler 18', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(21, '12345-0019', 'Brand 19', 'GenericName 19', 'Labeler 19', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(22, '12345-0020', 'Brand 20', 'GenericName 20', 'Labeler 20', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(23, '12345-0021', 'Brand 21', 'GenericName 21', 'Labeler 21', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(24, '12345-0022', 'Brand 22', 'GenericName 22', 'Labeler 22', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(25, '12345-0023', 'Brand 23', 'GenericName 23', 'Labeler 23', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(26, '12345-0024', 'Brand 24', 'GenericName 24', 'Labeler 24', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(27, '12345-0025', 'Brand 25', 'GenericName 25', 'Labeler 25', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(28, '12345-0026', 'Brand 26', 'GenericName 26', 'Labeler 26', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(29, '12345-0027', 'Brand 27', 'GenericName 27', 'Labeler 27', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(30, '12345-0028', 'Brand 28', 'GenericName 28', 'Labeler 28', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(31, '12345-0029', 'Brand 29', 'GenericName 29', 'Labeler 29', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(32, '12345-0030', 'Brand 30', 'GenericName 30', 'Labeler 30', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(33, '12345-0031', 'Brand 31', 'GenericName 31', 'Labeler 31', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(34, '12345-0032', 'Brand 32', 'GenericName 32', 'Labeler 32', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(35, '12345-0033', 'Brand 33', 'GenericName 33', 'Labeler 33', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(36, '12345-0034', 'Brand 34', 'GenericName 34', 'Labeler 34', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(37, '12345-0035', 'Brand 35', 'GenericName 35', 'Labeler 35', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(38, '12345-0036', 'Brand 36', 'GenericName 36', 'Labeler 36', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(39, '12345-0037', 'Brand 37', 'GenericName 37', 'Labeler 37', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(40, '12345-0038', 'Brand 38', 'GenericName 38', 'Labeler 38', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(41, '12345-0039', 'Brand 39', 'GenericName 39', 'Labeler 39', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(42, '12345-0040', 'Brand 40', 'GenericName 40', 'Labeler 40', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(43, '12345-0041', 'Brand 41', 'GenericName 41', 'Labeler 41', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(44, '12345-0042', 'Brand 42', 'GenericName 42', 'Labeler 42', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(45, '12345-0043', 'Brand 43', 'GenericName 43', 'Labeler 43', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(46, '12345-0044', 'Brand 44', 'GenericName 44', 'Labeler 44', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(47, '12345-0045', 'Brand 45', 'GenericName 45', 'Labeler 45', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(48, '12345-0046', 'Brand 46', 'GenericName 46', 'Labeler 46', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(49, '12345-0047', 'Brand 47', 'GenericName 47', 'Labeler 47', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(50, '12345-0048', 'Brand 48', 'GenericName 48', 'Labeler 48', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(51, '12345-0049', 'Brand 49', 'GenericName 49', 'Labeler 49', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07'),
(52, '12345-0050', 'Brand 50', 'GenericName 50', 'Labeler 50', 'Human Prescription Drug', '2025-05-25 08:55:07', '2025-05-25 08:55:07');

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
(5, '2025_05_24_190052_create_drugs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dafina', 'dafinakeqmezi@gmail.com', NULL, '$2y$12$prKqf1tqu8IO7ymGvP3Yd.Tp.9cUMjmB4UH6CEADa02lb5KpT4qAi', 'ofC90nvjBAL3ZLoohUyp9cAYlIRdImRNvj6TSP96YwumUJFe90qZ3Vxd4KJF', '2025-05-24 18:32:54', '2025-05-24 18:32:54'),
(2, 'Rozi', 'rozi@gmail.com', NULL, '$2y$12$ch1KeQ1s1uvnGiCt39bhqeIV2vrl./tba7NvBatMm3WWA7u3j7UkO', NULL, '2025-05-26 11:19:55', '2025-05-26 11:19:55'),
(3, 'Test', 'test@gmail.com', NULL, '$2y$12$gu5OelasYQAenVbbki0JSeX30QRb4FYNhEFSYD7qsTg9CYRia251y', NULL, '2025-05-26 11:54:58', '2025-05-26 11:54:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drugs_ndc_code_unique` (`ndc_code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
