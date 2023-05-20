-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 20, 2023 lúc 11:43 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ivymoda`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nữ', 0, 'nu', '2023-05-17 08:11:59', '2023-05-17 08:11:59', NULL),
(2, 'Giày dép', 1, 'giay-dep', '2023-05-17 08:14:08', '2023-05-17 08:14:08', NULL),
(3, 'Sandal', 2, 'sandal', '2023-05-17 08:17:32', '2023-05-17 08:17:32', NULL),
(4, 'Nam', 0, 'nam', '2023-05-17 08:26:55', '2023-05-17 08:26:55', NULL),
(5, 'Trẻ em', 0, 'tre-em', '2023-05-17 08:27:06', '2023-05-17 08:27:06', NULL),
(6, 'Áo', 1, 'ao', '2023-05-17 08:27:53', '2023-05-17 08:27:53', NULL),
(7, 'Quần', 1, 'quan', '2023-05-17 08:28:00', '2023-05-17 08:28:00', NULL),
(8, 'Chân váy', 1, 'chan-vay', '2023-05-17 08:28:09', '2023-05-17 08:28:09', NULL),
(9, 'Đầm', 1, 'dam', '2023-05-17 08:28:32', '2023-05-17 08:28:32', NULL),
(10, 'Áo', 4, 'ao', '2023-05-17 08:30:35', '2023-05-17 08:30:35', NULL),
(11, 'Quần', 4, 'quan', '2023-05-17 08:30:45', '2023-05-18 06:53:24', '2023-05-18 06:53:24'),
(12, 'Giày dép', 4, 'giay-dep', '2023-05-17 08:30:53', '2023-05-17 08:30:53', NULL),
(13, 'Phụ Kiện', 4, 'phu-kien', '2023-05-17 08:31:12', '2023-05-17 08:31:12', NULL),
(15, 'Bé trai', 5, 'be-trai', '2023-05-17 08:31:55', '2023-05-17 08:31:55', NULL),
(20, 'Giày cao gót', 2, 'giay-cao-got', '2023-05-18 06:26:59', '2023-05-18 06:26:59', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Trắng', 'trang', '2023-05-18 09:04:04', '2023-05-18 09:05:30', NULL),
(2, 'Trắng tinh', 'trang-tinh', '2023-05-18 09:04:14', '2023-05-18 09:04:20', '2023-05-18 09:04:20'),
(3, 'Đen', 'den', '2023-05-18 09:05:35', '2023-05-18 09:05:35', NULL),
(4, 'Nâu Tây', 'nau-tay', '2023-05-18 09:05:42', '2023-05-18 09:05:42', NULL),
(5, 'Nude', 'nude', '2023-05-19 19:03:55', '2023-05-19 19:03:55', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_parameters`
--

CREATE TABLE `detail_parameters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_17_121110_create_categories_table', 1),
(6, '2023_05_18_133940_add_column_deleted_at_table_categoties', 2),
(7, '2023_05_18_140016_create_sizes_table', 3),
(8, '2023_05_18_140027_create_colors_table', 3),
(9, '2023_05_18_140111_create_vouchers_table', 3),
(10, '2023_05_18_140940_create_news_table', 3),
(11, '2023_05_19_030918_create_tin_tucs_table', 4),
(12, '2023_05_20_061158_create_slides_table', 5),
(13, '2023_05_20_072752_create_stocks_table', 6),
(15, '2023_05_20_083604_create_parameters_table', 7),
(16, '2023_05_20_090328_create_products_table', 8),
(17, '2023_05_20_092733_create_detail_parameters_table', 9),
(18, '2023_05_20_093119_create_product_details_table', 9),
(19, '2023_05_20_093530_create_stock_details_table', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nội bộ IVY', 'noi-bo-ivy', '2023-05-18 19:56:34', '2023-05-18 19:56:51', '2023-05-18 19:56:51'),
(2, 'Tips hay', 'tips-hay', '2023-05-19 01:00:47', '2023-05-19 01:00:47', NULL),
(3, 'Chương trình khuyến mãi', 'chuong-trinh-khuyen-mai', '2023-05-19 01:01:05', '2023-05-19 01:01:05', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `parameters`
--

CREATE TABLE `parameters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `parameters`
--

INSERT INTO `parameters` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Độ cao gót: 3p', '2023-05-20 02:00:27', '2023-05-20 02:00:51', '2023-05-20 02:00:51'),
(2, 'Đế cao: 5p', '2023-05-20 02:01:08', '2023-05-20 02:01:08', NULL),
(3, 'Xuất sứ: Việt Nam', '2023-05-20 02:01:30', '2023-05-20 02:01:30', NULL),
(4, 'Chất liệu: Da PU', '2023-05-20 02:02:02', '2023-05-20 02:02:02', NULL),
(5, 'Họa Tiết: Trơn', '2023-05-20 02:02:18', '2023-05-20 02:02:18', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `import_price` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `cate_id` bigint(20) UNSIGNED NOT NULL,
  `seo_des` varchar(191) DEFAULT NULL,
  `seo_key` varchar(191) DEFAULT NULL,
  `seo_title` varchar(191) DEFAULT NULL,
  `vitri` int(11) NOT NULL DEFAULT 100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'S', 's', '2023-05-18 08:53:01', '2023-05-18 08:55:54', NULL),
(2, 'ss', 'ss', '2023-05-18 08:53:18', '2023-05-18 08:53:38', '2023-05-18 08:53:38'),
(3, 'M', 'm', '2023-05-18 08:57:40', '2023-05-18 08:57:40', NULL),
(4, 'L', 'l', '2023-05-18 08:57:44', '2023-05-18 08:57:44', NULL),
(5, 'XL', 'xl', '2023-05-18 08:57:49', '2023-05-18 08:57:49', NULL),
(6, 'XXL', 'xxl', '2023-05-18 08:57:54', '2023-05-18 08:57:54', NULL),
(7, '34', '34', '2023-05-19 19:02:53', '2023-05-19 19:02:53', NULL),
(8, '35', '35', '2023-05-19 19:02:58', '2023-05-19 19:02:58', NULL),
(9, '36', '36', '2023-05-19 19:03:03', '2023-05-19 19:03:03', NULL),
(10, '37', '37', '2023-05-19 19:03:07', '2023-05-19 19:03:07', NULL),
(11, '38', '38', '2023-05-19 19:03:12', '2023-05-19 19:03:12', NULL),
(12, '39', '39', '2023-05-19 19:03:21', '2023-05-19 19:03:21', NULL),
(13, '40', '40', '2023-05-19 19:03:29', '2023-05-19 19:03:29', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`id`, `image`, `url`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '/storage/uploads/slides/T-L baby shop.png', NULL, 'Sale hè', '2023-05-20 00:06:12', '2023-05-20 00:09:19', '2023-05-20 00:09:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `stocks`
--

INSERT INTO `stocks` (`id`, `name`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IVY01', 'TT. Phủ, Bình Giang, Hải Dương', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_details`
--

CREATE TABLE `stock_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `product_detail_id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tin_tucs`
--

CREATE TABLE `tin_tucs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `news_id` int(11) NOT NULL,
  `seo_title` varchar(191) DEFAULT NULL,
  `seo_des` varchar(191) DEFAULT NULL,
  `seo_key` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tin_tucs`
--

INSERT INTO `tin_tucs` (`id`, `title`, `slug`, `image`, `content`, `news_id`, `seo_title`, `seo_des`, `seo_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tips hay', 'tips-hay', 'C:\\xampp\\tmp\\phpEC26.tmp', '<p>fsda</p>', 2, 'fdsa', 'dsa', 'fdsa', '2023-05-19 01:14:38', '2023-05-19 23:07:40', '2023-05-19 23:07:40'),
(2, 'Khuyến mãi siêu khủng', 'khuyen-mai-sieu-khung', 'Rose Boutique (1).png', '<p>fsa</p>', 3, 'dsa', 'fas', 'dsa', '2023-05-19 01:22:53', '2023-05-19 23:07:33', '2023-05-19 23:07:33'),
(3, 'fdsa', 'fdsa', '20200206112730-7208.jpg', '<p>fdsa</p>', 2, 'fdas', 'fdsa', 'fdsa', '2023-05-19 01:56:57', '2023-05-19 23:07:24', '2023-05-19 23:07:24'),
(4, 'fdas', 'fdas', 'Gợi ý phối đồ với giày lolita đơn giản mà cực đẹp, link ở cmt - Thảo Piu Review #shorts.mp4', '<p>fdsa</p>', 2, 'fdsa', 'fdsa', 'fdas', '2023-05-19 02:02:20', '2023-05-19 23:06:23', '2023-05-19 23:06:23'),
(5, 'gdsa', 'gdsa', '/storage/uploads/news/Rose Boutique (1).png', '<p>gsa</p>', 2, 'gá', 'gá', 'gsa', '2023-05-19 19:29:25', '2023-05-19 23:07:28', '2023-05-19 23:07:28'),
(6, '11111dâdsa', '11111dadsa', '/storage/uploads/news/Rose Boutique.png', '<p>fsda</p>', 2, 'fdsa', 'fsda', 'fdsa', '2023-05-19 20:11:41', '2023-05-19 23:06:20', '2023-05-19 23:06:20'),
(7, 'fdsa', 'fdsa', '/storage/uploads/news/1.jpg', '<table class=\"table table-bordered\"><tbody><tr><td>gfds</td><td>hfsd</td><td>hdfs</td><td>hds</td><td>hfds</td></tr><tr><td><br></td><td><br></td><td><br></td><td><br></td><td><br></td></tr></tbody></table>', 2, 'fdsa', 'fdsa', 'fdas', '2023-05-19 20:21:46', '2023-05-19 20:21:46', NULL),
(8, 'Test img', 'test-img', '/storage/uploads/news/20200206112730-7208.jpg', '<p><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAAH0CAYAAADL1t+KAAAAAXNSR0IArs4c6QAAAARzQklUCAgICHwIZIgAAAAJcEhZcwAADsQAAA7EAZUrDhsAAARwaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49J++7vycgaWQ9J1c1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCc/Pgo8eDp4bXBtZXRhIHhtbG5zOng9J2Fkb2JlOm5zOm1ldGEvJz4KPHJkZjpSREYgeG1sbnM6cmRmPSdodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjJz4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogIHhtbG5zOkF0dHJpYj0naHR0cDovL25zLmF0dHJpYnV0aW9uLmNvbS9hZHMvMS4wLyc+CiAgPEF0dHJpYjpBZHM+CiAgIDxyZGY6U2VxPgogICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSdSZXNvdXJjZSc+CiAgICAgPEF0dHJpYjpDcmVhdGVkPjIwMjMtMDQtMDg8L0F0dHJpYjpDcmVhdGVkPgogICAgIDxBdHRyaWI6RXh0SWQ+MTc0ZGQyYmQtZmRiMC00Zjk2LWJmNWYtM2U2YTc0ZTdjZGQyPC9BdHRyaWI6RXh0SWQ+CiAgICAgPEF0dHJpYjpGYklkPjUyNTI2NTkxNDE3OTU4MDwvQXR0cmliOkZiSWQ+CiAgICAgPEF0dHJpYjpUb3VjaFR5cGU+MjwvQXR0cmliOlRvdWNoVHlwZT4KICAgIDwvcmRmOmxpPgogICA8L3JkZjpTZXE+CiAgPC9BdHRyaWI6QWRzPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9JycKICB4bWxuczpkYz0naHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8nPgogIDxkYzp0aXRsZT4KICAgPHJkZjpBbHQ+CiAgICA8cmRmOmxpIHhtbDpsYW5nPSd4LWRlZmF1bHQnPlNob3AgWGluaCAtIDE8L3JkZjpsaT4KICAgPC9yZGY6QWx0PgogIDwvZGM6dGl0bGU+CiA8L3JkZjpEZXNjcmlwdGlvbj4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogIHhtbG5zOnBkZj0naHR0cDovL25zLmFkb2JlLmNvbS9wZGYvMS4zLyc+CiAgPHBkZjpBdXRob3I+VGjDoG5oIE5ndXnhu4VuPC9wZGY6QXV0aG9yPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9JycKICB4bWxuczp4bXA9J2h0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8nPgogIDx4bXA6Q3JlYXRvclRvb2w+Q2FudmE8L3htcDpDcmVhdG9yVG9vbD4KIDwvcmRmOkRlc2NyaXB0aW9uPgo8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSdyJz8+/rFtdAAAIABJREFUeJzs3Xl8XGW9P/DP98ySNN1b2mYmy4RNUQQVFVxQiiCyilugzUyxgD8U8aqoeN3wVsV7r1y5LlcRUbDSmRSsgoiAyr6I7CiiyGYzk2QmaWlLS5csM+fz+yNJSZM5ZyZttjaf98vXS3Kec57nSXs63znPeZ7vA4iIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiI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IiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIqK9yP8HYij43zxZavIAAAAASUVORK5CYII=\" data-filename=\"ShopXinh.png\" style=\"width: 500px;\"><br></p>', 2, 'fds', 'fsda', 'fdsa', '2023-05-19 20:30:44', '2023-05-19 20:30:44', NULL);
INSERT INTO `tin_tucs` (`id`, `title`, `slug`, `image`, `content`, `news_id`, `seo_title`, `seo_des`, `seo_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 'Test img', 'test-img', '/storage/uploads/news/1.jpg', '<p><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAAH0CAYAAADL1t+KAAAAAXNSR0IArs4c6QAAAARzQklUCAgICHwIZIgAAAAJcEhZcwAADsQAAA7EAZUrDhsAAARwaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49J++7vycgaWQ9J1c1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCc/Pgo8eDp4bXBtZXRhIHhtbG5zOng9J2Fkb2JlOm5zOm1ldGEvJz4KPHJkZjpSREYgeG1sbnM6cmRmPSdodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjJz4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogIHhtbG5zOkF0dHJpYj0naHR0cDovL25zLmF0dHJpYnV0aW9uLmNvbS9hZHMvMS4wLyc+CiAgPEF0dHJpYjpBZHM+CiAgIDxyZGY6U2VxPgogICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSdSZXNvdXJjZSc+CiAgICAgPEF0dHJpYjpDcmVhdGVkPjIwMjMtMDQtMDg8L0F0dHJpYjpDcmVhdGVkPgogICAgIDxBdHRyaWI6RXh0SWQ+MTc0ZGQyYmQtZmRiMC00Zjk2LWJmNWYtM2U2YTc0ZTdjZGQyPC9BdHRyaWI6RXh0SWQ+CiAgICAgPEF0dHJpYjpGYklkPjUyNTI2NTkxNDE3OTU4MDwvQXR0cmliOkZiSWQ+CiAgICAgPEF0dHJpYjpUb3VjaFR5cGU+MjwvQXR0cmliOlRvdWNoVHlwZT4KICAgIDwvcmRmOmxpPgogICA8L3JkZjpTZXE+CiAgPC9BdHRyaWI6QWRzPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9JycKICB4bWxuczpkYz0naHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8nPgogIDxkYzp0aXRsZT4KICAgPHJkZjpBbHQ+CiAgICA8cmRmOmxpIHhtbDpsYW5nPSd4LWRlZmF1bHQnPlNob3AgWGluaCAtIDE8L3JkZjpsaT4KICAgPC9yZGY6QWx0PgogIDwvZGM6dGl0bGU+CiA8L3JkZjpEZXNjcmlwdGlvbj4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogIHhtbG5zOnBkZj0naHR0cDovL25zLmFkb2JlLmNvbS9wZGYvMS4zLyc+CiAgPHBkZjpBdXRob3I+VGjDoG5oIE5ndXnhu4VuPC9wZGY6QXV0aG9yPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9JycKICB4bWxuczp4bXA9J2h0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8nPgogIDx4bXA6Q3JlYXRvclRvb2w+Q2FudmE8L3htcDpDcmVhdG9yVG9vbD4KIDwvcmRmOkRlc2NyaXB0aW9uPgo8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSdyJz8+/rFtdAAAIABJREFUeJzs3Xl8XGW9P/DP98ySNN1b2mYmy4RNUQQVFVxQiiCyilugzUyxgD8U8aqoeN3wVsV7r1y5LlcRUbDSmRSsgoiAyr6I7CiiyGYzk2QmaWlLS5csM+fz+yNJSZM5ZyZttjaf98vXS3Kec57nSXs63znPeZ7vA4iIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiI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IiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIqK9yP8HYij43zxZavIAAAAASUVORK5CYII=\" data-filename=\"ShopXinh.png\" style=\"width: 500px;\"><br></p>', 2, 'fds', 'fsda', 'fdsa', '2023-05-19 21:44:51', '2023-05-19 23:06:31', '2023-05-19 23:06:31');
INSERT INTO `tin_tucs` (`id`, `title`, `slug`, `image`, `content`, `news_id`, `seo_title`, `seo_des`, `seo_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(10, 'Test img 11', 'test-img-11', '/storage/uploads/news/1.1.png', '<p><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAAH0CAYAAADL1t+KAAAAAXNSR0IArs4c6QAAAARzQklUCAgICHwIZIgAAAAJcEhZcwAADsQAAA7EAZUrDhsAAARwaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49J++7vycgaWQ9J1c1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCc/Pgo8eDp4bXBtZXRhIHhtbG5zOng9J2Fkb2JlOm5zOm1ldGEvJz4KPHJkZjpSREYgeG1sbnM6cmRmPSdodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjJz4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogIHhtbG5zOkF0dHJpYj0naHR0cDovL25zLmF0dHJpYnV0aW9uLmNvbS9hZHMvMS4wLyc+CiAgPEF0dHJpYjpBZHM+CiAgIDxyZGY6U2VxPgogICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSdSZXNvdXJjZSc+CiAgICAgPEF0dHJpYjpDcmVhdGVkPjIwMjMtMDQtMDg8L0F0dHJpYjpDcmVhdGVkPgogICAgIDxBdHRyaWI6RXh0SWQ+MTc0ZGQyYmQtZmRiMC00Zjk2LWJmNWYtM2U2YTc0ZTdjZGQyPC9BdHRyaWI6RXh0SWQ+CiAgICAgPEF0dHJpYjpGYklkPjUyNTI2NTkxNDE3OTU4MDwvQXR0cmliOkZiSWQ+CiAgICAgPEF0dHJpYjpUb3VjaFR5cGU+MjwvQXR0cmliOlRvdWNoVHlwZT4KICAgIDwvcmRmOmxpPgogICA8L3JkZjpTZXE+CiAgPC9BdHRyaWI6QWRzPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9JycKICB4bWxuczpkYz0naHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8nPgogIDxkYzp0aXRsZT4KICAgPHJkZjpBbHQ+CiAgICA8cmRmOmxpIHhtbDpsYW5nPSd4LWRlZmF1bHQnPlNob3AgWGluaCAtIDE8L3JkZjpsaT4KICAgPC9yZGY6QWx0PgogIDwvZGM6dGl0bGU+CiA8L3JkZjpEZXNjcmlwdGlvbj4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogIHhtbG5zOnBkZj0naHR0cDovL25zLmFkb2JlLmNvbS9wZGYvMS4zLyc+CiAgPHBkZjpBdXRob3I+VGjDoG5oIE5ndXnhu4VuPC9wZGY6QXV0aG9yPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9JycKICB4bWxuczp4bXA9J2h0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8nPgogIDx4bXA6Q3JlYXRvclRvb2w+Q2FudmE8L3htcDpDcmVhdG9yVG9vbD4KIDwvcmRmOkRlc2NyaXB0aW9uPgo8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSdyJz8+/rFtdAAAIABJREFUeJzs3Xl8XGW9P/DP98ySNN1b2mYmy4RNUQQVFVxQiiCyilugzUyxgD8U8aqoeN3wVsV7r1y5LlcRUbDSmRSsgoiAyr6I7CiiyGYzk2QmaWlLS5csM+fz+yNJSZM5ZyZttjaf98vXS3Kec57nSXs63znPeZ7vA4iIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiI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IiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIqK9yP8HYij43zxZavIAAAAASUVORK5CYII=\" data-filename=\"ShopXinh.png\" style=\"width: 500px;\"><br></p>', 2, 'fds', 'fsda', 'fdsa', '2023-05-19 21:47:35', '2023-05-19 23:05:48', '2023-05-19 23:05:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Thành', 'soict.nguyenthanh@gmail.com', NULL, '$2y$10$s577OvMXC00WQen37AdgsuI9SDAVjIzK.8FB3FLx2bzi/NUd8WM22', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `sale_off` double NOT NULL,
  `max_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `detail_parameters`
--
ALTER TABLE `detail_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_parameters_product_id_foreign` (`product_id`),
  ADD KEY `detail_parameters_parameter_id_foreign` (`parameter_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `parameters`
--
ALTER TABLE `parameters`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_cate_id_foreign` (`cate_id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_details_code_unique` (`code`),
  ADD KEY `product_details_product_id_foreign` (`product_id`),
  ADD KEY `product_details_color_id_foreign` (`color_id`),
  ADD KEY `product_details_size_id_foreign` (`size_id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stocks_name_unique` (`name`);

--
-- Chỉ mục cho bảng `stock_details`
--
ALTER TABLE `stock_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_details_code_unique` (`code`),
  ADD KEY `stock_details_product_detail_id_foreign` (`product_detail_id`),
  ADD KEY `stock_details_stock_id_foreign` (`stock_id`);

--
-- Chỉ mục cho bảng `tin_tucs`
--
ALTER TABLE `tin_tucs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `detail_parameters`
--
ALTER TABLE `detail_parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `parameters`
--
ALTER TABLE `parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `stock_details`
--
ALTER TABLE `stock_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tin_tucs`
--
ALTER TABLE `tin_tucs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `detail_parameters`
--
ALTER TABLE `detail_parameters`
  ADD CONSTRAINT `detail_parameters_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_parameters_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_details_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `stock_details`
--
ALTER TABLE `stock_details`
  ADD CONSTRAINT `stock_details_product_detail_id_foreign` FOREIGN KEY (`product_detail_id`) REFERENCES `product_details` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_details_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
