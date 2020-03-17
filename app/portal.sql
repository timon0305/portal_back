-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2020 at 01:25 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_no` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pre_contract` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pre_contract_date` date NOT NULL,
  `purchase_contract` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_no`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `customer_type`, `pre_contract`, `pre_contract_date`, `purchase_contract`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'alex', 'alex@user.com', NULL, '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 'Normal', '2.PNG', '2020-03-23', 'admin@admin.com', NULL, NULL, NULL),
(3, 123, 'my Birthday.', 'LKJ2@cl.com', NULL, '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 'VIP', '5 issue.PNG', '2020-03-09', 'admin@admin.com', NULL, NULL, NULL),
(4, 123, 'asf', 'kadsfj@com.com', NULL, '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 'Normal', '123123.PNG', '2020-03-03', 'admin@admin.com', NULL, NULL, NULL),
(6, 123, 'asf', 'kadsfj@123com.com', NULL, '4297f44b13955235245b2497399d7a93', NULL, 'Normal', '123123.PNG', '2020-03-03', '123', NULL, NULL, NULL),
(7, 12, 'kkk', 'kkk@kkk.com', NULL, 'cf673f7ee88828c9fb8f6acf2cb08403', NULL, 'Normal', '5 issue.PNG', '2020-03-08', 'kkk', NULL, NULL, NULL),
(8, 123, 'birthday', 'birthday@user.com', NULL, 'cf673f7ee88828c9fb8f6acf2cb08403', NULL, 'Normal', '2.PNG', '2020-03-22', 'Today is my birthday', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_property`
--

CREATE TABLE `customer_property` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_property`
--

INSERT INTO `customer_property` (`id`, `customer_id`, `property_id`, `created_at`, `updated_at`) VALUES
(24, '3', '3', NULL, NULL),
(25, '4', '3', NULL, NULL),
(26, '6', '3', NULL, NULL),
(27, '7', '3', NULL, NULL),
(37, '1', '4', NULL, NULL),
(38, '6', '4', NULL, NULL),
(39, '8', '4', NULL, NULL),
(40, '10', '4', NULL, NULL),
(46, '1', '1', NULL, NULL),
(47, '3', '1', NULL, NULL),
(48, '8', '1', NULL, NULL),
(49, '10', '1', NULL, NULL),
(50, '4', '2', NULL, NULL),
(51, '6', '2', NULL, NULL),
(52, '8', '2', NULL, NULL),
(53, '10', '2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `legal_info`
--

CREATE TABLE `legal_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pre_contract` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pre_contract_date` date NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `legal_info`
--

INSERT INTO `legal_info` (`id`, `pre_contract`, `pre_contract_date`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, '1 (6) (1).txt', '2020-03-22', '1', '2020-03-04 23:00:00', NULL),
(2, 'data.PNG', '2020-03-10', '3', '2020-03-04 23:00:00', NULL),
(3, 'desktop.PNG', '2020-03-30', '4', '2020-03-04 23:00:00', NULL),
(4, 'date.PNG', '2020-03-30', '6', '2020-03-04 23:00:00', NULL),
(5, 'C:\\fakepath\\12321.txt', '2020-03-10', '0', NULL, '2020-03-04 23:00:00'),
(6, 'C:\\fakepath\\12321.txt', '2020-03-10', '0', NULL, '2020-03-04 23:00:00'),
(7, 'C:\\fakepath\\12321.txt', '2020-03-10', '0', NULL, '2020-03-04 23:00:00'),
(8, 'C:\\fakepath\\12321.txt', '2020-03-10', '0', NULL, '2020-03-04 23:00:00'),
(9, 'C:\\fakepath\\12321.txt', '2020-03-10', '0', NULL, '2020-03-04 23:00:00'),
(11, 'C:\\fakepath\\6 issue.PNG', '2020-03-10', '0', NULL, '2020-03-04 23:00:00'),
(12, 'C:\\fakepath\\data.PNG', '2020-03-10', '0', NULL, '2020-03-04 23:00:00'),
(13, 'C:\\fakepath\\desktop.PNG', '2020-03-25', '8', '2020-03-04 23:00:00', NULL),
(14, '123123.PNG', '2020-03-25', '10', '2020-03-04 23:00:00', NULL),
(15, 'C:\\fakepath\\1 (6) (1).txt', '2020-03-22', '0', NULL, '2020-03-04 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_11_09_000001_create_permissions_table', 1),
(8, '2019_11_09_000002_create_roles_table', 1),
(9, '2019_11_09_000003_create_users_table', 1),
(10, '2019_11_09_000004_create_statuses_table', 1),
(11, '2019_11_09_000005_create_priorities_table', 1),
(12, '2019_11_09_000006_create_categories_table', 1),
(13, '2019_11_09_000007_create_tickets_table', 1),
(14, '2019_11_09_000008_create_comments_table', 1),
(15, '2019_11_09_000009_create_permission_role_pivot_table', 1),
(16, '2019_11_09_000010_create_role_user_pivot_table', 1),
(17, '2019_11_09_000011_add_relationship_fields_to_tickets_table', 1),
(18, '2019_11_09_000012_add_relationship_fields_to_comments_table', 1),
(19, '2019_11_09_000013_create_audit_logs_table', 1),
(20, '2019_11_10_000001_create_media_table', 1),
(21, '2020_02_28_035837_create_property_table', 1),
(22, '2020_02_29_003900_create_customer_table', 1),
(23, '2020_02_29_020813_create_customer_property_table', 1),
(24, '2020_02_29_025231_create_legal_info_table', 1),
(25, '2020_03_03_182340_create_property_table', 2),
(26, '2020_03_03_200838_create_legal_info_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0d6c151b0ab93b017ee97f8f8266a9a4f30cf9c84afff8fbbe72eed87a683928701124788a3e1a15', 1, 7, 'MyApp', '[]', 0, '2020-03-05 07:29:35', '2020-03-05 07:29:35', '2021-03-05 08:29:35'),
('11130db77f7322ecf2d8524a1359a114582a21273982731d73599aba19624b8d1f26ddcf916131b6', 1, 7, 'MyApp', '[]', 0, '2020-03-03 07:06:13', '2020-03-03 07:06:13', '2021-03-03 08:06:13'),
('21b434f5db5d3403640cafb6d8920c02bdd543272f4d48174c9b3bf029e81957eb2d08abcbe5d76c', 1, 7, 'MyApp', '[]', 0, '2020-03-05 10:13:16', '2020-03-05 10:13:16', '2021-03-05 11:13:16'),
('47605d41837dfe4a7e499138f9471419dce020050372cf69fc16d745650044b8a21232d0b7ca836f', 1, 1, 'MyApp', '[]', 0, '2020-03-03 02:49:10', '2020-03-03 02:49:10', '2021-03-03 03:49:10'),
('557c42fa082b9615fd8b46c5803ea3273b80a4f4355fd6deef812deb75b0f8d107e4287210d790df', 1, 7, 'MyApp', '[]', 0, '2020-03-03 18:19:28', '2020-03-03 18:19:28', '2021-03-03 19:19:28'),
('79b88f76b2afc2a6044c268d4762936e1cb3ae828e0b23e7ccb4c58e10436f855add6d4596179902', 1, 7, 'MyApp', '[]', 0, '2020-03-03 07:50:47', '2020-03-03 07:50:47', '2021-03-03 08:50:47'),
('83e5a96206b3a41659d687c3a5e9fb2b4ae23101bc12260c25f4fbf3eb6fcd045b45c763ead4b633', 1, 7, 'MyApp', '[]', 0, '2020-03-05 08:45:06', '2020-03-05 08:45:06', '2021-03-05 09:45:06'),
('8af4035d2ebae62e5b86f09ab57713720f2ea8fa504bb2b87a728e5d4f39aa0ed725e6536a8d9e3a', 1, 7, 'MyApp', '[]', 0, '2020-03-05 10:05:30', '2020-03-05 10:05:30', '2021-03-05 11:05:30'),
('8b4dbd8c4aea4c8e49449714be92b43ca522a7d3cbfb93903bae8cbce99bfa93ee4963722bc21065', 1, 7, 'MyApp', '[]', 0, '2020-03-05 08:46:21', '2020-03-05 08:46:21', '2021-03-05 09:46:21'),
('a5a98e5cbf5d2961c1b874054b80e350f427e0bb1d1daaf9e110dc63c08cd1f17b53f7b7efa96583', 1, 7, 'MyApp', '[]', 0, '2020-03-03 18:10:09', '2020-03-03 18:10:09', '2021-03-03 19:10:09'),
('bde63896a0e44a12a8fb05acd247fe5e4246af3d2af0eb3353ff1d71dbb24b448cc328b91043098d', 1, 7, 'MyApp', '[]', 0, '2020-03-03 16:55:11', '2020-03-03 16:55:11', '2021-03-03 17:55:11'),
('c491ac81dfe7f29cd39d1af18e68429dcea2027a89da981bbcf35dc800295225c4c2d91653270d95', 1, 7, 'MyApp', '[]', 0, '2020-03-05 10:33:09', '2020-03-05 10:33:09', '2021-03-05 11:33:09'),
('e49c77585d9a863099a1bba2b40622c64c7e199949e2f2cf0eff3ef722f02aaa646c13138989e0d8', 1, 7, 'MyApp', '[]', 0, '2020-03-03 17:09:41', '2020-03-03 17:09:41', '2021-03-03 18:09:41'),
('e9a2aab7e42263a2810f14f5899b8e25f3edea532b478e8d291e08561a9dee2e1cdf1eab2edb3940', 1, 7, 'MyApp', '[]', 0, '2020-03-05 05:11:42', '2020-03-05 05:11:42', '2021-03-05 06:11:42'),
('f7df7ae1672814fbeb3419497e18823aab1109ca6b04ec4c2f1e26ff767d90ee9759231d38008681', 1, 1, 'MyApp', '[]', 0, '2020-03-03 02:50:11', '2020-03-03 02:50:11', '2021-03-03 03:50:11'),
('fe793896129713a960ef1576200d330c3b774c92017a96ce41b8d2771735361270f899bfc8874e46', 1, 7, 'MyApp', '[]', 0, '2020-03-03 08:12:45', '2020-03-03 08:12:45', '2021-03-03 09:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'd7KyS3SRzC38Ro5qobM9OcLMO2pQOgjP5I6F1nAB', 'http://localhost', 1, 0, 0, '2020-03-03 02:48:55', '2020-03-03 02:48:55'),
(2, NULL, 'Laravel Password Grant Client', 'dQqR3Eat2AZpsDhGw9Cdr6u3B0gIqSNwv6KQnqQS', 'http://localhost', 0, 1, 0, '2020-03-03 02:48:55', '2020-03-03 02:48:55'),
(3, NULL, 'Laravel Personal Access Client', 'CIfgelrfjekap2zn7HoIzhpjAmVLxku1ecitzww7', 'http://localhost', 1, 0, 0, '2020-03-03 06:19:43', '2020-03-03 06:19:43'),
(4, NULL, 'Laravel Password Grant Client', 'f3uhkoetHbRzjm0SXP5o8oqGFu63cYpMm3ugYhsE', 'http://localhost', 0, 1, 0, '2020-03-03 06:19:43', '2020-03-03 06:19:43'),
(5, NULL, 'Laravel Personal Access Client', 'D8uDXbqceyBPGd7DpX0aR5QtitxyTWT8Z6qLUyib', 'http://localhost', 1, 0, 0, '2020-03-03 06:23:01', '2020-03-03 06:23:01'),
(6, NULL, 'Laravel Password Grant Client', 'ZI8tpBfgHLr3UNtdojqs6m5Ev6tQ79Tqp06oxLqd', 'http://localhost', 0, 1, 0, '2020-03-03 06:23:01', '2020-03-03 06:23:01'),
(7, NULL, 'Laravel Personal Access Client', 'T9Ib0POtAqc1op2jRu2DPfXypJvmvhXF5xs4mSUM', 'http://localhost', 1, 0, 0, '2020-03-03 06:23:12', '2020-03-03 06:23:12'),
(8, NULL, 'Laravel Password Grant Client', '5CS2dSuefwvthV2uBfndNUC9rp5kB1uzXSdKM0xm', 'http://localhost', 0, 1, 0, '2020-03-03 06:23:12', '2020-03-03 06:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-03-03 02:48:55', '2020-03-03 02:48:55'),
(2, 3, '2020-03-03 06:19:43', '2020-03-03 06:19:43'),
(3, 5, '2020-03-03 06:23:01', '2020-03-03 06:23:01'),
(4, 7, '2020-03-03 06:23:12', '2020-03-03 06:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', NULL, NULL, NULL),
(2, 'permission_create', NULL, NULL, NULL),
(3, 'permission_edit', NULL, NULL, NULL),
(4, 'permission_show', NULL, NULL, NULL),
(5, 'permission_delete', NULL, NULL, NULL),
(6, 'permission_access', NULL, NULL, NULL),
(7, 'role_create', NULL, NULL, NULL),
(8, 'role_edit', NULL, NULL, NULL),
(9, 'role_show', NULL, NULL, NULL),
(10, 'role_delete', NULL, NULL, NULL),
(11, 'role_access', NULL, NULL, NULL),
(12, 'user_create', NULL, NULL, NULL),
(13, 'user_edit', NULL, NULL, NULL),
(14, 'user_show', NULL, NULL, NULL),
(15, 'user_delete', NULL, NULL, NULL),
(16, 'user_access', NULL, NULL, NULL),
(17, 'status_create', NULL, NULL, NULL),
(18, 'status_edit', NULL, NULL, NULL),
(19, 'status_show', NULL, NULL, NULL),
(20, 'status_delete', NULL, NULL, NULL),
(21, 'status_access', NULL, NULL, NULL),
(22, 'priority_create', NULL, NULL, NULL),
(23, 'priority_edit', NULL, NULL, NULL),
(24, 'priority_show', NULL, NULL, NULL),
(25, 'priority_delete', NULL, NULL, NULL),
(26, 'priority_access', NULL, NULL, NULL),
(27, 'category_create', NULL, NULL, NULL),
(28, 'category_edit', NULL, NULL, NULL),
(29, 'category_show', NULL, NULL, NULL),
(30, 'category_delete', NULL, NULL, NULL),
(31, 'category_access', NULL, NULL, NULL),
(32, 'ticket_create', NULL, NULL, NULL),
(33, 'ticket_edit', NULL, NULL, NULL),
(34, 'ticket_show', NULL, NULL, NULL),
(35, 'ticket_delete', NULL, NULL, NULL),
(36, 'ticket_access', NULL, NULL, NULL),
(37, 'comment_create', NULL, NULL, NULL),
(38, 'comment_edit', NULL, NULL, NULL),
(39, 'comment_show', NULL, NULL, NULL),
(40, 'comment_delete', NULL, NULL, NULL),
(41, 'comment_access', NULL, NULL, NULL),
(42, 'audit_log_show', NULL, NULL, NULL),
(43, 'audit_log_access', NULL, NULL, NULL),
(44, 'dashboard_access', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(2, 33),
(2, 34),
(2, 36);

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_date` date NOT NULL,
  `pea_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keys` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `contract_date`, `pea_file`, `keys`, `created_at`, `updated_at`) VALUES
(1, '0122-12-31', '123123.PNG', '4', NULL, NULL),
(2, '2020-03-11', '5 issue.PNG', '3', NULL, NULL),
(3, '2020-03-10', '12321.txt', '4', NULL, NULL),
(4, '2020-03-05', '5 issue.PNG', '4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, NULL, NULL),
(2, 'Manager', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `priority_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `assigned_to_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$UnLIBQB1uZZC1r5msFWTPuZCZsMBUpZINpJ48G5FmMxz6yVGP83rO', NULL, NULL, NULL, NULL),
(2, 'Manager', 'Manager@manager.com', NULL, '$2y$10$Mr1UEgxhSSaSx2cH3fRNzucuVMcP2L6YDRZLW1GmLW401hi7Lt93y', NULL, NULL, NULL, NULL),
(3, 'user', 'user@kkk.com', NULL, '$2y$10$Xn17WK7ACwwNE8yx5.9phuZQatM1F40kkxYiTWPZN1S80fD2YlPeG', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_fk_583774` (`ticket_id`),
  ADD KEY `user_fk_583777` (`user_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_email_unique` (`email`);

--
-- Indexes for table `customer_property`
--
ALTER TABLE `customer_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legal_info`
--
ALTER TABLE `legal_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_583549` (`role_id`),
  ADD KEY `permission_id_fk_583549` (`permission_id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_583558` (`user_id`),
  ADD KEY `role_id_fk_583558` (`role_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_fk_583763` (`status_id`),
  ADD KEY `priority_fk_583764` (`priority_id`),
  ADD KEY `category_fk_583765` (`category_id`),
  ADD KEY `assigned_to_user_fk_583768` (`assigned_to_user_id`);

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
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer_property`
--
ALTER TABLE `customer_property`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `legal_info`
--
ALTER TABLE `legal_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `ticket_fk_583774` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `user_fk_583777` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_id_fk_583549` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_583549` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_id_fk_583558` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_583558` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `assigned_to_user_fk_583768` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `category_fk_583765` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `priority_fk_583764` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`),
  ADD CONSTRAINT `status_fk_583763` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
