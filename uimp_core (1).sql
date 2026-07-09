-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2026 at 09:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uimp_core`
--

-- --------------------------------------------------------

--
-- Table structure for table `appeals`
--

CREATE TABLE `appeals` (
  `appeal_id` char(36) NOT NULL,
  `application_id` char(36) NOT NULL,
  `appellant_user_id` char(36) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING',
  `response` text DEFAULT NULL,
  `reviewed_by_user_id` char(36) DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appeals`
--

INSERT INTO `appeals` (`appeal_id`, `application_id`, `appellant_user_id`, `reason`, `status`, `response`, `reviewed_by_user_id`, `submitted_at`, `reviewed_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0ca3371c-7b9d-11f1-a78f-005056c00001', '22222222-2222-2222-2222-222222222222', '5432249b-7935-11f1-9f60-005056c00001', 'Request review of promotion decision', 'PENDING', NULL, NULL, '2026-07-09 13:49:46', NULL, '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-09 13:49:46', '2026-07-09 13:49:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `event_id` char(36) NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `actor_user_id` char(36) DEFAULT NULL,
  `actor_subsystem_id` varchar(255) DEFAULT NULL,
  `old_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_value`)),
  `new_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_value`)),
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`event_id`, `entity_type`, `entity_id`, `action`, `actor_user_id`, `actor_subsystem_id`, `old_value`, `new_value`, `ip_address`, `created_at`) VALUES
('05ec3f53-518a-46dd-a673-29afe22b5409', 'User', '4866dec3-d9f5-4cd1-b99c-d9b41902bbdc', 'INSERT', NULL, NULL, NULL, '{\"username\":\"dania_student\",\"email\":\"dania@uimp.edu.ly\",\"password\":\"[REDACTED]\",\"preferred_language\":\"ar\",\"id\":\"4866dec3-d9f5-4cd1-b99c-d9b41902bbdc\",\"updated_at\":\"2026-06-16 15:29:56\",\"created_at\":\"2026-06-16 15:29:56\"}', '127.0.0.1', '2026-06-16 15:29:57'),
('31d8009f-6f95-49d8-8b48-32f87a23c6f5', 'Student', 'a2f5fb14-165a-45b3-bfa7-a12d385b61b5', 'INSERT', NULL, NULL, NULL, '{\"user_id\":\"4866dec3-d9f5-4cd1-b99c-d9b41902bbdc\",\"student_number\":\"STU-2026-0001\",\"full_name_ar\":\"دانية تقنية المعلومات\",\"full_name_en\":\"Dania IT Student\",\"faculty_name\":\"تقنية المعلومات\",\"department_name\":\"هندسة البرمجيات\",\"academic_status\":\"active\",\"gpa\":4,\"id\":\"a2f5fb14-165a-45b3-bfa7-a12d385b61b5\",\"updated_at\":\"2026-06-16 15:29:57\",\"created_at\":\"2026-06-16 15:29:57\"}', '127.0.0.1', '2026-06-16 15:29:57'),
('672fbfc3-637d-4e49-b1af-1ae776fecf85', 'Employee', '71bf3eee-db29-4731-a8ea-5efc4937c03f', 'INSERT', NULL, NULL, NULL, '{\"user_id\":\"2eebef66-2b5c-484e-b97c-1d2db4cfefd6\",\"employee_number\":\"EMP-2026-1002\",\"full_name_ar\":\"ساجا مهندسة البرمجيات\",\"full_name_en\":\"Saja Software Engineer\",\"academic_rank\":\"أستاذ مساعد\",\"faculty_name\":\"تقنية المعلومات\",\"department_name\":\"هندسة البرمجيات\",\"id\":\"71bf3eee-db29-4731-a8ea-5efc4937c03f\",\"updated_at\":\"2026-06-16 15:29:57\",\"created_at\":\"2026-06-16 15:29:57\"}', '127.0.0.1', '2026-06-16 15:29:57'),
('a9a2d20e-0fa7-4764-9bd3-b35ae6746529', 'User', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'INSERT', NULL, NULL, NULL, '{\"username\":\"saja_faculty\",\"email\":\"saja@uimp.edu.ly\",\"password\":\"[REDACTED]\",\"preferred_language\":\"ar\",\"id\":\"2eebef66-2b5c-484e-b97c-1d2db4cfefd6\",\"updated_at\":\"2026-06-16 15:29:57\",\"created_at\":\"2026-06-16 15:29:57\"}', '127.0.0.1', '2026-06-16 15:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committee_assignments`
--

CREATE TABLE `committee_assignments` (
  `assignment_id` char(36) NOT NULL,
  `application_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `tier` enum('department','faculty','university') NOT NULL,
  `is_chair` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('ACTIVE','INACTIVE','REMOVED') NOT NULL DEFAULT 'ACTIVE',
  `assigned_at` timestamp NULL DEFAULT NULL,
  `assigned_by_user_id` char(36) NOT NULL,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `committee_assignments`
--

INSERT INTO `committee_assignments` (`assignment_id`, `application_id`, `user_id`, `tier`, `is_chair`, `status`, `assigned_at`, `assigned_by_user_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('44444444-4444-4444-4444-444444444441', '22222222-2222-2222-2222-222222222222', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'department', 1, 'ACTIVE', NULL, '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:38', '2026-07-06 00:48:38', NULL),
('44444444-4444-4444-4444-444444444442', '22222222-2222-2222-2222-222222222222', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'faculty', 1, 'ACTIVE', NULL, '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:38', '2026-07-06 00:48:38', NULL),
('8930d5b9-c988-4868-85f6-52545ca9de81', '019f442c-7b89-7178-9074-28e535e5bd3e', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'department', 0, 'ACTIVE', '2026-07-09 00:06:35', '5432249b-7935-11f1-9f60-005056c00001', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-09 00:06:35', '2026-07-09 00:06:35', NULL),
('a1f8d0f0-c869-4f35-a849-32923252b231', '019f4471-4ce7-72f1-987f-3e68d0fe700d', 'cce2d614-793f-11f1-9f60-005056c00001', 'university', 1, 'ACTIVE', '2026-07-09 00:10:19', '5432249b-7935-11f1-9f60-005056c00001', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-09 00:10:19', '2026-07-09 00:10:19', NULL),
('a570119c-910d-41fe-bf97-64ccd2d0bf67', '019f4471-4ce7-72f1-987f-3e68d0fe700d', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'department', 0, 'ACTIVE', '2026-07-09 00:07:36', '5432249b-7935-11f1-9f60-005056c00001', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-09 00:07:36', '2026-07-09 00:07:36', NULL),
('c0be83ee-4073-42a4-bedd-662da96eacfb', '019f4471-4ce7-72f1-987f-3e68d0fe700d', 'e62309da-793c-11f1-9f60-005056c00001', 'department', 0, 'ACTIVE', '2026-07-09 00:07:54', '5432249b-7935-11f1-9f60-005056c00001', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-09 00:07:54', '2026-07-09 00:07:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `employee_number` varchar(255) NOT NULL,
  `full_name_ar` varchar(255) NOT NULL,
  `full_name_en` varchar(255) NOT NULL,
  `academic_rank` varchar(255) NOT NULL,
  `faculty_name` varchar(255) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `employee_number`, `full_name_ar`, `full_name_en`, `academic_rank`, `faculty_name`, `department_name`, `created_at`, `updated_at`) VALUES
('71bf3eee-db29-4731-a8ea-5efc4937c03f', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'EMP-2026-1002', 'ساجا مهندسة البرمجيات', 'Saja Software Engineer', 'أستاذ مساعد', 'تقنية المعلومات', 'هندسة البرمجيات', '2026-06-16 13:29:57', '2026-06-16 13:29:57'),
('8c5180f4-7b33-11f1-a78f-005056c00001', '5432249b-7935-11f1-9f60-005056c00001', 'EMP001', 'مستبين كمال', 'Mustabeen Kamal', 'أستاذ مساعد', 'Faculty of Information Technology', 'Computer Science', '2026-07-09 01:14:35', '2026-07-09 01:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_15_205618_create_audit_logs_table', 1),
(5, '2026_06_15_210112_create_rbac_tables', 1),
(6, '2026_06_15_212437_create_personal_access_tokens_table', 1),
(7, '2026_06_15_212549_create_employees_table', 1),
(8, '2026_06_15_212748_create_students_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` char(36) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description_ar` varchar(255) NOT NULL,
  `description_en` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` char(36) NOT NULL,
  `permission_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', '5432249b-7935-11f1-9f60-005056c00001', 'api-token', 'ddd97d5bf09ea0310baf7f0b2ca3e23faac3929c60e236ab319c24ae0b020da7', '[\"*\"]', NULL, NULL, '2026-07-06 12:11:49', '2026-07-06 12:11:49'),
(2, 'App\\Models\\User', '5432249b-7935-11f1-9f60-005056c00001', 'api-token', '4ae3f3d456b50edc3089064e56b9b8806410fe6f72713a15568488dae9297118', '[\"*\"]', NULL, NULL, '2026-07-08 19:40:55', '2026-07-08 19:40:55'),
(3, 'App\\Models\\User', '5432249b-7935-11f1-9f60-005056c00001', 'api-token', 'f07783032e39e1fe9ec7341fbeaef316d543ca772a080a1d7d0831b59cbe4819', '[\"*\"]', NULL, NULL, '2026-07-08 19:44:37', '2026-07-08 19:44:37'),
(4, 'App\\Models\\User', '5432249b-7935-11f1-9f60-005056c00001', 'api-token', '1eb814f7b1c64afe848b8ecf608f487481d368261f07fa23a16b10b2be33d9be', '[\"*\"]', NULL, NULL, '2026-07-08 21:08:15', '2026-07-08 21:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_documents`
--

CREATE TABLE `portfolio_documents` (
  `document_id` char(36) NOT NULL,
  `application_id` char(36) NOT NULL,
  `uploaded_by_user_id` char(36) NOT NULL,
  `type` enum('research_paper','teaching_evaluation','service_certificate','thesis','other') NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `storage_path` varchar(500) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_mime_type` varchar(100) NOT NULL,
  `uploaded_at` timestamp NULL DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portfolio_documents`
--

INSERT INTO `portfolio_documents` (`document_id`, `application_id`, `uploaded_by_user_id`, `type`, `description`, `file_name`, `storage_path`, `file_size`, `file_mime_type`, `uploaded_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0cd8388f-dc65-4de4-a594-1ac40ab790fd', '019f4471-4ce7-72f1-987f-3e68d0fe700d', '5432249b-7935-11f1-9f60-005056c00001', 'teaching_evaluation', 'kkk', 'ITSE423-S2026-Lect7.pdf', 'documents/YJEfJlSbvlwKWDmNks7auBOfUg1bK1VdJ7V1Vnbo.pdf', 898597, 'application/pdf', '2026-07-08 23:32:05', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-08 23:32:05', '2026-07-08 23:32:05', NULL),
('99999999-9999-9999-9999-999999999991', '22222222-2222-2222-2222-222222222222', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'research_paper', 'بحث منشور في مجلة علمية محكمة', 'research_paper_2025.pdf', 'promotion/applications/22222222-2222-2222-2222-222222222222/documents/research_paper_2025.pdf', 2048576, 'application/pdf', '2026-07-06 00:48:38', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:38', '2026-07-06 00:48:38', NULL),
('b4ce275a-b40b-47e0-b527-909095f7bc76', '019f4471-4ce7-72f1-987f-3e68d0fe700d', '5432249b-7935-11f1-9f60-005056c00001', 'teaching_evaluation', 'kkk', 'ITSE423-S2026-Lect7.pdf', 'documents/Wx7oNH4Db63b9IRlNrRz0kO7ZHlTEMH1z2z8woDK.pdf', 898597, 'application/pdf', '2026-07-08 23:32:08', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-08 23:32:08', '2026-07-08 23:32:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotion_applications`
--

CREATE TABLE `promotion_applications` (
  `application_id` char(36) NOT NULL,
  `staff_id` char(36) NOT NULL,
  `promotion_cycle_id` char(36) NOT NULL,
  `applicant_user_id` char(36) NOT NULL,
  `current_rank` varchar(100) NOT NULL,
  `target_rank` enum('LECTURER','SENIOR_LECTURER','ASSOCIATE_PROFESSOR','PROFESSOR') NOT NULL,
  `department_id` char(36) DEFAULT NULL,
  `faculty_id` char(36) DEFAULT NULL,
  `department_name_snapshot` varchar(255) DEFAULT NULL,
  `faculty_name_snapshot` varchar(255) DEFAULT NULL,
  `submission_date` timestamp NULL DEFAULT NULL,
  `status` enum('DRAFT','SUBMITTED','DEPARTMENT_REVIEW','DEPARTMENT_APPROVED','DEPARTMENT_REJECTED','FACULTY_REVIEW','FACULTY_APPROVED','FACULTY_REJECTED','UNIVERSITY_REVIEW','APPROVED','REJECTED','CLOSED') NOT NULL DEFAULT 'DRAFT',
  `remarks` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_applications`
--

INSERT INTO `promotion_applications` (`application_id`, `staff_id`, `promotion_cycle_id`, `applicant_user_id`, `current_rank`, `target_rank`, `department_id`, `faculty_id`, `department_name_snapshot`, `faculty_name_snapshot`, `submission_date`, `status`, `remarks`, `ip_address`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('22222222-2222-2222-2222-222222222222', '71bf3eee-db29-4731-a8ea-5efc4937c03f', '11111111-1111-1111-1111-111111111111', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'أستاذ مساعد', 'ASSOCIATE_PROFESSOR', NULL, NULL, 'هندسة البرمجيات', 'تقنية المعلومات', NULL, 'DEPARTMENT_REVIEW', 'تطبيق للترقية بناءً على الأبحاث المنشورة والتقييمات التعليمية المتميزة', NULL, '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:38', '2026-07-06 00:48:38', NULL),
('81f83387-0580-4aed-8976-5b8e2272897c', '8c5180f4-7b33-11f1-a78f-005056c00001', '11111111-1111-1111-1111-111111111111', '5432249b-7935-11f1-9f60-005056c00001', 'أستاذ مساعد', 'SENIOR_LECTURER', NULL, NULL, 'Computer Science', 'Faculty of Information Technology', '2026-07-09 11:04:25', 'SUBMITTED', 'ففففففف', '127.0.0.1', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-09 11:04:25', '2026-07-09 11:04:25', NULL),
('a49b3f34-e43e-4fee-8c0f-e161fb27eb16', '8c5180f4-7b33-11f1-a78f-005056c00001', '11111111-1111-1111-1111-111111111111', '5432249b-7935-11f1-9f60-005056c00001', 'أستاذ مساعد', 'SENIOR_LECTURER', NULL, NULL, 'Computer Science', 'Faculty of Information Technology', '2026-07-09 11:05:45', 'SUBMITTED', 'اطلب ترقيتي الى استاذ', '127.0.0.1', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-09 11:05:45', '2026-07-09 11:05:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotion_audit_logs`
--

CREATE TABLE `promotion_audit_logs` (
  `id` bigint(20) NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` varchar(255) DEFAULT NULL,
  `action` enum('CREATE','UPDATE','DELETE','VIEW','DOWNLOAD','SUBMIT','APPROVE','REJECT','VOTE','RESTORE','LOGIN','LOGOUT','LOGIN_FAILED') NOT NULL,
  `actor_user_id` char(36) DEFAULT NULL,
  `actor_subsystem_id` varchar(255) DEFAULT NULL,
  `old_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_value`)),
  `new_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_value`)),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `record_hash` varchar(64) NOT NULL,
  `prev_record_hash` varchar(64) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_audit_logs`
--

INSERT INTO `promotion_audit_logs` (`id`, `event_type`, `entity_type`, `entity_id`, `action`, `actor_user_id`, `actor_subsystem_id`, `old_value`, `new_value`, `ip_address`, `user_agent`, `record_hash`, `prev_record_hash`, `created_at`) VALUES
(1, 'ENTITY_CREATED', 'promotion_application', '22222222-2222-2222-2222-222222222222', 'CREATE', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', NULL, NULL, '{\"status\": \"DRAFT\", \"target_rank\": \"ASSOCIATE_PROFESSOR\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36', '2ecac3209e2909ef96965081cdee82e694bce357a7f49954ccb9db9a676d0570', NULL, '2026-07-06 00:48:38');

--
-- Triggers `promotion_audit_logs`
--
DELIMITER $$
CREATE TRIGGER `prevent_audit_delete` BEFORE DELETE ON `promotion_audit_logs` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Audit logs are immutable and cannot be deleted';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `prevent_audit_update` BEFORE UPDATE ON `promotion_audit_logs` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Audit logs are immutable and cannot be modified';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_cycles`
--

CREATE TABLE `promotion_cycles` (
  `cycle_id` char(36) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` enum('DRAFT','ACTIVE','CLOSED','ARCHIVED') NOT NULL DEFAULT 'DRAFT',
  `research_weight` int(11) NOT NULL DEFAULT 40,
  `teaching_weight` int(11) NOT NULL DEFAULT 30,
  `service_weight` int(11) NOT NULL DEFAULT 30,
  `anonymous_voting` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_cycles`
--

INSERT INTO `promotion_cycles` (`cycle_id`, `name_en`, `name_ar`, `start_date`, `end_date`, `status`, `research_weight`, `teaching_weight`, `service_weight`, `anonymous_voting`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('11111111-1111-1111-1111-111111111111', 'Academic Year 2026 Cycle 1', 'دورة العام الأكاديمي 2026 - الدورة الأولى', '2026-08-31 22:00:00', '2026-12-31 21:59:59', 'ACTIVE', 40, 30, 30, 0, '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:37', '2026-07-06 00:48:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotion_requests`
--

CREATE TABLE `promotion_requests` (
  `request_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `cycle_id` char(36) NOT NULL,
  `academic_rank` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_requests`
--

INSERT INTO `promotion_requests` (`request_id`, `user_id`, `cycle_id`, `academic_rank`, `description`, `status`, `created_at`, `updated_at`) VALUES
('019f442c-7b89-7178-9074-28e535e5bd3e', '5432249b-7935-11f1-9f60-005056c00001', '11111111-1111-1111-1111-111111111111', '1', 'first try', 'PENDING', '2026-07-08 21:59:53', '2026-07-08 22:33:37'),
('019f442d-ec77-719f-891d-da9e07b96af7', '5432249b-7935-11f1-9f60-005056c00001', '11111111-1111-1111-1111-111111111111', '2', 'second try', 'PENDING', '2026-07-08 22:01:28', '2026-07-08 22:33:50'),
('019f4435-86b6-73d8-b10c-c515c964ac6e', '5432249b-7935-11f1-9f60-005056c00001', '11111111-1111-1111-1111-111111111111', '3', 'third try', 'PENDING', '2026-07-08 22:09:46', '2026-07-08 22:34:03'),
('019f4436-4cfd-70b8-83c8-768df97bfbd2', '5432249b-7935-11f1-9f60-005056c00001', '11111111-1111-1111-1111-111111111111', '4', 'fourth try', 'PENDING', '2026-07-08 22:10:37', '2026-07-08 22:34:56'),
('019f4439-e6f5-7265-9d82-b0410178d51b', '5432249b-7935-11f1-9f60-005056c00001', '11111111-1111-1111-1111-111111111111', '5', 'fifth try', 'PENDING', '2026-07-08 22:14:33', '2026-07-08 22:35:08'),
('019f4471-4ce7-72f1-987f-3e68d0fe700d', '5432249b-7935-11f1-9f60-005056c00001', '11111111-1111-1111-1111-111111111111', 'أستاذ مساعد', 'new thing', 'PENDING', '2026-07-08 23:15:03', '2026-07-08 23:15:03'),
('019f46f9-c8b2-72a1-8b19-197c24b747b4', '5432249b-7935-11f1-9f60-005056c00001', '11111111-1111-1111-1111-111111111111', 'أستاذ مساعد', 'ففففففف', 'PENDING', '2026-07-09 11:03:22', '2026-07-09 11:03:22'),
('019f46fa-bdf9-713c-ac5f-26d1b449a556', '5432249b-7935-11f1-9f60-005056c00001', '11111111-1111-1111-1111-111111111111', 'أستاذ مساعد', 'ففففففف', 'PENDING', '2026-07-09 11:04:25', '2026-07-09 11:04:25'),
('019f46fb-f6de-735f-99e3-0f34d64aa8f2', '5432249b-7935-11f1-9f60-005056c00001', '11111111-1111-1111-1111-111111111111', 'أستاذ مساعد', 'اطلب ترقيتي الى استاذ', 'PENDING', '2026-07-09 11:05:45', '2026-07-09 11:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_roles`
--

CREATE TABLE `promotion_roles` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name_ar` varchar(255) NOT NULL,
  `display_name_en` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_roles`
--

INSERT INTO `promotion_roles` (`id`, `name`, `display_name_ar`, `display_name_en`, `created_at`, `updated_at`) VALUES
('88888888-8888-8888-8888-888888888881', 'applicant', 'متقدم', 'Applicant', '2026-07-06 00:48:38', '2026-07-06 00:48:38'),
('88888888-8888-8888-8888-888888888882', 'department_committee', 'لجنة القسم', 'Department Committee', '2026-07-06 00:48:38', '2026-07-06 00:48:38'),
('88888888-8888-8888-8888-888888888883', 'faculty_committee', 'لجنة الكلية', 'Faculty Committee', '2026-07-06 00:48:38', '2026-07-06 00:48:38'),
('88888888-8888-8888-8888-888888888884', 'university_admin', 'إدارة الجامعة', 'University Administration', '2026-07-06 00:48:38', '2026-07-06 00:48:38'),
('88888888-8888-8888-8888-888888888885', 'promotion_admin', 'مدير نظام الترقيات', 'Promotion Administrator', '2026-07-06 00:48:38', '2026-07-06 00:48:38');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_user_roles`
--

CREATE TABLE `promotion_user_roles` (
  `user_id` char(36) NOT NULL,
  `role_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_user_roles`
--

INSERT INTO `promotion_user_roles` (`user_id`, `role_id`, `created_at`) VALUES
('2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '88888888-8888-8888-8888-888888888883', '2026-07-09 14:33:26'),
('4866dec3-d9f5-4cd1-b99c-d9b41902bbdc', '88888888-8888-8888-8888-888888888882', '2026-07-09 14:34:09'),
('5432249b-7935-11f1-9f60-005056c00001', '88888888-8888-8888-8888-888888888881', '2026-07-09 14:33:15'),
('cce2d614-793f-11f1-9f60-005056c00001', '88888888-8888-8888-8888-888888888884', '2026-07-09 14:34:19'),
('e62309da-793c-11f1-9f60-005056c00001', '88888888-8888-8888-8888-888888888885', '2026-07-09 14:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `recommendation_letters`
--

CREATE TABLE `recommendation_letters` (
  `letter_id` char(36) NOT NULL,
  `application_id` char(36) NOT NULL,
  `generated_by_user_id` char(36) NOT NULL,
  `language` enum('en','ar') NOT NULL,
  `content` longtext NOT NULL,
  `storage_path` varchar(500) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `generated_at` timestamp NULL DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recommendation_letters`
--

INSERT INTO `recommendation_letters` (`letter_id`, `application_id`, `generated_by_user_id`, `language`, `content`, `storage_path`, `version`, `generated_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('77777777-7777-7777-7777-777777777771', '22222222-2222-2222-2222-222222222222', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'ar', '<!DOCTYPE html><html><head><title>رسالة توصية بالترقية</title></head><body><h1>جامعة طرابلس</h1><h2>رسالة توصية بالترقية</h2><p>نوصي بترقية الأستاذ/ة ...</p></body></html>', 'promotion/letters/letter_22222222-2222-2222-2222-222222222222_ar_20260101.pdf', 1, '2026-07-06 00:48:38', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:38', '2026-07-06 00:48:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name_ar` varchar(255) NOT NULL,
  `display_name_en` varchar(255) NOT NULL,
  `parent_role_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` char(36) NOT NULL,
  `role_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scorecards`
--

CREATE TABLE `scorecards` (
  `scorecard_id` char(36) NOT NULL,
  `application_id` char(36) NOT NULL,
  `evaluator_user_id` char(36) NOT NULL,
  `research_score` int(11) NOT NULL CHECK (`research_score` >= 0 and `research_score` <= 100),
  `teaching_score` int(11) NOT NULL CHECK (`teaching_score` >= 0 and `teaching_score` <= 100),
  `service_score` int(11) NOT NULL CHECK (`service_score` >= 0 and `service_score` <= 100),
  `research_sub_scores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`research_sub_scores`)),
  `teaching_sub_scores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`teaching_sub_scores`)),
  `service_sub_scores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`service_sub_scores`)),
  `total_score` decimal(5,2) NOT NULL,
  `comment` text DEFAULT NULL,
  `evaluated_at` timestamp NULL DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scorecards`
--

INSERT INTO `scorecards` (`scorecard_id`, `application_id`, `evaluator_user_id`, `research_score`, `teaching_score`, `service_score`, `research_sub_scores`, `teaching_sub_scores`, `service_sub_scores`, `total_score`, `comment`, `evaluated_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('66666666-6666-6666-6666-666666666661', '22222222-2222-2222-2222-222222222222', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 85, 78, 82, '{\"publications\": 45, \"conference_papers\": 25, \"research_grants\": 15}', '{\"student_evaluations\": 35, \"curriculum_development\": 25, \"supervision\": 18}', '{\"university_service\": 35, \"community_service\": 25, \"professional_development\": 22}', 82.50, 'مرشح قوي للترقية مع نتائج بحثية ممتازة وتقييمات تعليمية جيدة', '2026-07-06 00:48:38', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:38', '2026-07-06 00:48:38', NULL),
('8a54ed25-8810-4c6d-aa34-93cf29d11434', '81f83387-0580-4aed-8976-5b8e2272897c', '5432249b-7935-11f1-9f60-005056c00001', 1, 2, 3, NULL, NULL, NULL, 6.00, 'try', '2026-07-09 11:24:27', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-09 11:24:27', '2026-07-09 11:24:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AIrv7VfyMfBwZE8KSYU30quFtp3nPX88GGI9MkjS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXVwU3FLcjRJT1FsSGJsaTVPVUJjdWQ1NjZ0RmNUbXJyeEFjNlR0YSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMDoibG9naW4uZm9ybSI7fX0=', 1783625224);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `student_number` varchar(255) NOT NULL,
  `full_name_ar` varchar(255) NOT NULL,
  `full_name_en` varchar(255) NOT NULL,
  `faculty_name` varchar(255) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `academic_status` varchar(255) NOT NULL,
  `gpa` decimal(4,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `student_number`, `full_name_ar`, `full_name_en`, `faculty_name`, `department_name`, `academic_status`, `gpa`, `created_at`, `updated_at`) VALUES
('a2f5fb14-165a-45b3-bfa7-a12d385b61b5', '4866dec3-d9f5-4cd1-b99c-d9b41902bbdc', 'STU-2026-0001', 'دانية تقنية المعلومات', 'Dania IT Student', 'تقنية المعلومات', 'هندسة البرمجيات', 'active', 4.00, '2026-06-16 13:29:57', '2026-06-16 13:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `preferred_language` enum('ar','en') NOT NULL DEFAULT 'ar',
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0,
  `lockout_until` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `preferred_language`, `is_locked`, `failed_attempts`, `lockout_until`, `remember_token`, `created_at`, `updated_at`) VALUES
('2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'saja_faculty', 'saja@uimp.edu.ly', '$2y$12$x7WiDEjb6DqNkz/mk5UziuFrMMY8Csi.6gMp.bLwyr0WIx20o.YfW', 'ar', 0, 0, NULL, NULL, '2026-06-16 13:29:57', '2026-07-09 12:21:25'),
('4866dec3-d9f5-4cd1-b99c-d9b41902bbdc', 'dania_student', 'dania@uimp.edu.ly', '$2y$12$jQSrr2Ppgv6GRaI3kkfKU.5EH9ST/trcP894lN7DP77qlp0mLoERW', 'ar', 0, 0, NULL, NULL, '2026-06-16 13:29:56', '2026-07-09 12:22:05'),
('5432249b-7935-11f1-9f60-005056c00001', 'mustabeen', 'mustabeen@uimp.edu.ly', '$2y$12$1mYAd5VwptHe0z0VgrVNfOuCS7HQulPfE.EooNpUbMbBeTVOESsry', 'ar', 0, 0, NULL, NULL, '2026-07-06 12:22:15', '2026-07-06 11:53:53'),
('cce2d614-793f-11f1-9f60-005056c00001', 'aynor', 'login@uimp.edu.ly', '$2y$12$mcfHo/rbyuMilF/6ar2anuKgYYblluJNWYJPz8bMo/yPKYvAgEitm', 'ar', 0, 0, NULL, NULL, '2026-07-06 13:37:12', '2026-07-09 17:25:02'),
('e62309da-793c-11f1-9f60-005056c00001', 'test_user', 'test@uimp.edu.ly', '$2y$12$nX7Txc5UdW98dfjbSzOAGekSMdkIcp7jaj9dXtZt9RvdQaVGnjie2', 'ar', 0, 0, NULL, NULL, '2026-07-06 13:16:26', '2026-07-09 17:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `vote_id` char(36) NOT NULL,
  `application_id` char(36) NOT NULL,
  `assignment_id` char(36) NOT NULL,
  `voter_user_id` char(36) DEFAULT NULL,
  `vote` enum('APPROVE','REJECT','ABSTAIN') NOT NULL,
  `comment` text DEFAULT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `cast_at` timestamp NULL DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`vote_id`, `application_id`, `assignment_id`, `voter_user_id`, `vote`, `comment`, `is_anonymous`, `cast_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('55555555-5555-5555-5555-555555555551', '22222222-2222-2222-2222-222222222222', '44444444-4444-4444-4444-444444444441', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', 'APPROVE', 'توصية قوية بالترقية، الأبحاث المنشورة ممتازة والتقييمات التعليمية متميزة', 0, '2026-07-06 00:48:38', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:38', '2026-07-06 00:48:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workflow_states`
--

CREATE TABLE `workflow_states` (
  `state_id` char(36) NOT NULL,
  `application_id` char(36) NOT NULL,
  `state` varchar(50) NOT NULL,
  `from_state` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `performed_by_user_id` char(36) NOT NULL,
  `performed_at` timestamp NULL DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workflow_states`
--

INSERT INTO `workflow_states` (`state_id`, `application_id`, `state`, `from_state`, `comment`, `performed_by_user_id`, `performed_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('03ea7ed1-69dd-4288-9267-c22374f82b3f', '019f4471-4ce7-72f1-987f-3e68d0fe700d', 'FACULTY_REVIEW', NULL, NULL, '5432249b-7935-11f1-9f60-005056c00001', '2026-07-08 23:45:02', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-08 23:45:02', '2026-07-08 23:45:02', NULL),
('33333333-3333-3333-3333-333333333333', '22222222-2222-2222-2222-222222222222', 'DRAFT', NULL, 'تم إنشاء الطلب', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:38', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 00:48:38', '2026-07-06 00:48:38', NULL),
('33333333-3333-3333-3333-333333333334', '22222222-2222-2222-2222-222222222222', 'SUBMITTED', 'DRAFT', 'تم تقديم الطلب للمراجعة', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 08:00:00', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 08:00:00', '2026-07-06 08:00:00', NULL),
('33333333-3333-3333-3333-333333333335', '22222222-2222-2222-2222-222222222222', 'DEPARTMENT_REVIEW', 'SUBMITTED', 'تم إحالة الطلب إلى لجنة القسم', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 09:00:00', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2eebef66-2b5c-484e-b97c-1d2db4cfefd6', '2026-07-06 09:00:00', '2026-07-06 09:00:00', NULL),
('4087a458-0c0f-47d6-a9d9-4261bcea7a9f', '019f4471-4ce7-72f1-987f-3e68d0fe700d', 'APPROVED', 'DEPARTMENT_REVIEW', 'ااا', '5432249b-7935-11f1-9f60-005056c00001', '2026-07-08 23:46:48', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-08 23:46:48', '2026-07-08 23:46:48', NULL),
('7442af12-3eeb-4880-a669-d42429e8ce17', 'a49b3f34-e43e-4fee-8c0f-e161fb27eb16', 'SUBMITTED', NULL, 'Promotion request submitted', '5432249b-7935-11f1-9f60-005056c00001', '2026-07-09 11:05:45', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-09 11:05:45', '2026-07-09 11:05:45', NULL),
('89098a04-e431-4daa-8fba-dfb50aeae741', '019f4471-4ce7-72f1-987f-3e68d0fe700d', 'DEPARTMENT_REVIEW', 'FACULTY_REVIEW', NULL, '5432249b-7935-11f1-9f60-005056c00001', '2026-07-08 23:45:30', '5432249b-7935-11f1-9f60-005056c00001', NULL, '2026-07-08 23:45:30', '2026-07-08 23:45:30', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appeals`
--
ALTER TABLE `appeals`
  ADD PRIMARY KEY (`appeal_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `committee_assignments`
--
ALTER TABLE `committee_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD UNIQUE KEY `committee_assignments_application_id_user_id_tier_unique` (`application_id`,`user_id`,`tier`),
  ADD KEY `committee_assignments_application_id_index` (`application_id`),
  ADD KEY `committee_assignments_user_id_index` (`user_id`),
  ADD KEY `committee_assignments_tier_index` (`tier`),
  ADD KEY `committee_assignments_status_index` (`status`),
  ADD KEY `committee_assignments_assigned_by_user_id_index` (`assigned_by_user_id`),
  ADD KEY `committee_assignments_created_by_foreign` (`created_by`),
  ADD KEY `committee_assignments_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_user_id_unique` (`user_id`),
  ADD UNIQUE KEY `employees_employee_number_unique` (`employee_number`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `portfolio_documents`
--
ALTER TABLE `portfolio_documents`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `portfolio_documents_application_id_index` (`application_id`),
  ADD KEY `portfolio_documents_type_index` (`type`),
  ADD KEY `portfolio_documents_uploaded_by_user_id_index` (`uploaded_by_user_id`),
  ADD KEY `portfolio_documents_created_by_foreign` (`created_by`),
  ADD KEY `portfolio_documents_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `promotion_applications`
--
ALTER TABLE `promotion_applications`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `promotion_applications_staff_id_index` (`staff_id`),
  ADD KEY `promotion_applications_promotion_cycle_id_index` (`promotion_cycle_id`),
  ADD KEY `promotion_applications_applicant_user_id_index` (`applicant_user_id`),
  ADD KEY `promotion_applications_status_index` (`status`),
  ADD KEY `promotion_applications_submission_date_index` (`submission_date`),
  ADD KEY `promotion_applications_created_by_foreign` (`created_by`),
  ADD KEY `promotion_applications_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `promotion_audit_logs`
--
ALTER TABLE `promotion_audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion_audit_logs_created_at_index` (`created_at`),
  ADD KEY `promotion_audit_logs_actor_user_id_index` (`actor_user_id`),
  ADD KEY `promotion_audit_logs_entity_type_entity_id_index` (`entity_type`,`entity_id`),
  ADD KEY `promotion_audit_logs_action_index` (`action`);

--
-- Indexes for table `promotion_cycles`
--
ALTER TABLE `promotion_cycles`
  ADD PRIMARY KEY (`cycle_id`),
  ADD KEY `promotion_cycles_status_index` (`status`),
  ADD KEY `promotion_cycles_start_date_index` (`start_date`),
  ADD KEY `promotion_cycles_end_date_index` (`end_date`),
  ADD KEY `promotion_cycles_created_by_foreign` (`created_by`),
  ADD KEY `promotion_cycles_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `promotion_requests`
--
ALTER TABLE `promotion_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `promotion_requests_user_id_index` (`user_id`),
  ADD KEY `promotion_requests_cycle_id_index` (`cycle_id`);

--
-- Indexes for table `promotion_roles`
--
ALTER TABLE `promotion_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promotion_roles_name_unique` (`name`);

--
-- Indexes for table `promotion_user_roles`
--
ALTER TABLE `promotion_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `promotion_user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `recommendation_letters`
--
ALTER TABLE `recommendation_letters`
  ADD PRIMARY KEY (`letter_id`),
  ADD UNIQUE KEY `recommendation_letters_application_id_version_unique` (`application_id`,`version`),
  ADD KEY `recommendation_letters_application_id_index` (`application_id`),
  ADD KEY `recommendation_letters_language_index` (`language`),
  ADD KEY `recommendation_letters_generated_by_user_id_index` (`generated_by_user_id`),
  ADD KEY `recommendation_letters_created_by_foreign` (`created_by`),
  ADD KEY `recommendation_letters_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `scorecards`
--
ALTER TABLE `scorecards`
  ADD PRIMARY KEY (`scorecard_id`),
  ADD UNIQUE KEY `scorecards_application_id_evaluator_user_id_unique` (`application_id`,`evaluator_user_id`),
  ADD KEY `scorecards_application_id_index` (`application_id`),
  ADD KEY `scorecards_evaluator_user_id_index` (`evaluator_user_id`),
  ADD KEY `scorecards_created_by_foreign` (`created_by`),
  ADD KEY `scorecards_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_user_id_unique` (`user_id`),
  ADD UNIQUE KEY `students_student_number_unique` (`student_number`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`vote_id`),
  ADD UNIQUE KEY `votes_application_id_assignment_id_unique` (`application_id`,`assignment_id`),
  ADD KEY `votes_application_id_index` (`application_id`),
  ADD KEY `votes_assignment_id_index` (`assignment_id`),
  ADD KEY `votes_voter_user_id_index` (`voter_user_id`),
  ADD KEY `votes_vote_index` (`vote`),
  ADD KEY `votes_created_by_foreign` (`created_by`),
  ADD KEY `votes_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `workflow_states`
--
ALTER TABLE `workflow_states`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `workflow_states_application_id_index` (`application_id`),
  ADD KEY `workflow_states_state_index` (`state`),
  ADD KEY `workflow_states_performed_by_user_id_index` (`performed_by_user_id`),
  ADD KEY `workflow_states_created_by_foreign` (`created_by`),
  ADD KEY `workflow_states_updated_by_foreign` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promotion_audit_logs`
--
ALTER TABLE `promotion_audit_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_applications`
--
ALTER TABLE `promotion_applications`
  ADD CONSTRAINT `promotion_applications_applicant_user_id_foreign` FOREIGN KEY (`applicant_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `promotion_applications_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `promotion_applications_promotion_cycle_id_foreign` FOREIGN KEY (`promotion_cycle_id`) REFERENCES `promotion_cycles` (`cycle_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotion_applications_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `promotion_applications_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `promotion_audit_logs`
--
ALTER TABLE `promotion_audit_logs`
  ADD CONSTRAINT `promotion_audit_logs_actor_user_id_foreign` FOREIGN KEY (`actor_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `promotion_cycles`
--
ALTER TABLE `promotion_cycles`
  ADD CONSTRAINT `promotion_cycles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `promotion_cycles_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `promotion_requests`
--
ALTER TABLE `promotion_requests`
  ADD CONSTRAINT `promotion_requests_cycle_id_foreign` FOREIGN KEY (`cycle_id`) REFERENCES `promotion_cycles` (`cycle_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotion_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_user_roles`
--
ALTER TABLE `promotion_user_roles`
  ADD CONSTRAINT `promotion_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `promotion_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotion_user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recommendation_letters`
--
ALTER TABLE `recommendation_letters`
  ADD CONSTRAINT `recommendation_letters_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `promotion_applications` (`application_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recommendation_letters_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `recommendation_letters_generated_by_user_id_foreign` FOREIGN KEY (`generated_by_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `recommendation_letters_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scorecards`
--
ALTER TABLE `scorecards`
  ADD CONSTRAINT `scorecards_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `promotion_applications` (`application_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `scorecards_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `scorecards_evaluator_user_id_foreign` FOREIGN KEY (`evaluator_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `scorecards_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `promotion_applications` (`application_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `committee_assignments` (`assignment_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `votes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `votes_voter_user_id_foreign` FOREIGN KEY (`voter_user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
