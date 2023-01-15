-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2023 at 08:53 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hippocampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(8);

-- --------------------------------------------------------

--
-- Table structure for table `tb_cart`
--

CREATE TABLE `tb_cart` (
  `id_cart` int(5) UNSIGNED NOT NULL,
  `kode_cart` varchar(50) NOT NULL,
  `id_user` int(5) NOT NULL,
  `id_course` int(5) NOT NULL,
  `status_cart` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_cart`
--

INSERT INTO `tb_cart` (`id_cart`, `kode_cart`, `id_user`, `id_course`, `status_cart`, `created_at`, `updated_at`) VALUES
(1, 'CART-0120232', 2, 1, 'non-active', '2023-01-13 21:00:48', '2023-01-13 21:00:53'),
(2, 'CART-0120232', 2, 1, 'non-active', '2023-01-13 21:58:45', '2023-01-14 17:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `id_category` int(5) UNSIGNED NOT NULL,
  `nama_category` varchar(50) NOT NULL,
  `parent_category` int(5) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`id_category`, `nama_category`, `parent_category`, `created_at`, `updated_at`) VALUES
(1, 'Saintek', 0, '2023-01-13 20:42:01', '2023-01-13 20:42:01'),
(2, 'Soshum', 0, '2023-01-13 20:42:07', '2023-01-13 20:42:07'),
(3, 'Fisika', 1, '2023-01-13 20:42:52', '2023-01-13 20:42:52'),
(4, 'Matematika', 1, '2023-01-13 20:42:59', '2023-01-13 20:42:59'),
(5, 'Biologi', 1, '2023-01-13 20:43:05', '2023-01-13 20:43:05'),
(6, 'Kimia', 1, '2023-01-13 20:43:12', '2023-01-13 20:43:12'),
(7, 'Geografi', 2, '2023-01-13 20:43:24', '2023-01-13 20:43:24'),
(8, 'Sejarah', 2, '2023-01-13 20:43:38', '2023-01-13 20:43:38'),
(9, 'Ekonomi', 2, '2023-01-13 20:43:45', '2023-01-13 20:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `tb_course`
--

CREATE TABLE `tb_course` (
  `id_course` int(5) UNSIGNED NOT NULL,
  `nama_course` varchar(50) NOT NULL,
  `desc_course` text NOT NULL,
  `harga_course` double NOT NULL,
  `thumb_course` varchar(50) NOT NULL DEFAULT 'def-course-thumb.png',
  `id_category` int(5) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_course`
--

INSERT INTO `tb_course` (`id_course`, `nama_course`, `desc_course`, `harga_course`, `thumb_course`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 'Kimia Lingkungan', '&lt;p&gt;&lt;iframe frameborder=&quot;0&quot; src=&quot;//www.youtube.com/embed/Y9LNXXCEK3Y&quot; width=&quot;640&quot; height=&quot;360&quot; class=&quot;note-video-clip&quot;&gt;&lt;/iframe&gt;&lt;br&gt;&lt;/p&gt;', 100, '13012023145838.png', 6, '2023-01-13 20:58:38', '2023-01-13 20:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lesson`
--

CREATE TABLE `tb_lesson` (
  `id_lesson` int(5) UNSIGNED NOT NULL,
  `nama_lesson` varchar(50) NOT NULL,
  `desc_lesson` text NOT NULL,
  `type_lesson` varchar(20) NOT NULL,
  `attr_lesson` varchar(50) NOT NULL,
  `id_section` int(5) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_role`
--

CREATE TABLE `tb_role` (
  `id_role` int(5) UNSIGNED NOT NULL,
  `nama_role` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_role`
--

INSERT INTO `tb_role` (`id_role`, `nama_role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-01-11 23:03:38', '2023-01-13 12:55:05'),
(2, 'User', '2023-01-11 23:08:46', '2023-01-13 12:55:15');

-- --------------------------------------------------------

--
-- Table structure for table `tb_section`
--

CREATE TABLE `tb_section` (
  `id_section` int(5) UNSIGNED NOT NULL,
  `nama_section` varchar(50) NOT NULL,
  `desc_section` text NOT NULL,
  `id_course` int(5) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_trans`
--

CREATE TABLE `tb_trans` (
  `id_trans` int(5) UNSIGNED NOT NULL,
  `kode_trans` varchar(50) NOT NULL,
  `id_user` int(5) NOT NULL,
  `id_course` int(5) NOT NULL,
  `status_trans` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_trans`
--

INSERT INTO `tb_trans` (`id_trans`, `kode_trans`, `id_user`, `id_course`, `status_trans`, `created_at`, `updated_at`) VALUES
(1, 'CART-0120232', 2, 1, 'success', '2023-01-13 21:00:53', '2023-01-14 16:15:05'),
(2, 'CART-0120232', 2, 1, 'success', '2023-01-14 17:04:48', '2023-01-15 10:08:39'),
(3, 'CART-0120232', 2, 1, 'success', '2023-01-14 17:04:48', '2023-01-15 10:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(5) UNSIGNED NOT NULL,
  `firstname_user` varchar(50) NOT NULL,
  `lastname_user` varchar(50) NOT NULL,
  `email_user` varchar(50) NOT NULL,
  `password_user` varchar(50) NOT NULL,
  `foto_user` varchar(50) NOT NULL DEFAULT '-',
  `bio_user` text NOT NULL,
  `id_role` int(5) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `firstname_user`, `lastname_user`, `email_user`, `password_user`, `foto_user`, `bio_user`, `id_role`, `created_at`, `updated_at`) VALUES
(1, 'nanda', 'nan', 'nandasit86@gmail.com', '922d3a729a6f1cef090ec1aef8c7593a', '-', '-', 2, '2023-01-11 22:51:31', '2023-01-11 22:51:31'),
(2, 'quanxi', 'cassa', 'quanxicassa@gmail.com', 'c485c3a324a874514c90168258fbb4c8', '-', '-', 2, '2023-01-11 22:52:25', '2023-01-11 22:52:25'),
(3, 'nanda', 'cassa', 'nandacassa@example.com', '10cc10fa31535347184aa85bb2ac3e1e', '-', 'no bio yet', 1, '2023-01-11 22:54:42', '2023-01-13 10:31:03'),
(6, 'admin', 'admin', 'admin@example.com', '21232f297a57a5a743894a0e4a801fc3', '-', '-', 1, '2023-01-13 10:28:28', '2023-01-13 10:29:52'),
(7, 'zulfa mutirara', 'ramadhani ', 'zulfamut@gmail.com', '2ae15d26473a85e8e5f4a055b32827f6', '-', 'student senior high school ', 2, '2023-01-15 09:59:23', '2023-01-15 10:03:15'),
(8, 'hippocampus', 'admin', 'hippoadmin@gmail.com', 'c1f2315f63d67e3aa990983e1e1e3e4c', '-', '-', 1, '2023-01-15 10:04:31', '2023-01-15 10:04:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_cart`
--
ALTER TABLE `tb_cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `tb_course`
--
ALTER TABLE `tb_course`
  ADD PRIMARY KEY (`id_course`);

--
-- Indexes for table `tb_lesson`
--
ALTER TABLE `tb_lesson`
  ADD PRIMARY KEY (`id_lesson`);

--
-- Indexes for table `tb_role`
--
ALTER TABLE `tb_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `tb_section`
--
ALTER TABLE `tb_section`
  ADD PRIMARY KEY (`id_section`);

--
-- Indexes for table `tb_trans`
--
ALTER TABLE `tb_trans`
  ADD PRIMARY KEY (`id_trans`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_cart`
--
ALTER TABLE `tb_cart`
  MODIFY `id_cart` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id_category` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_course`
--
ALTER TABLE `tb_course`
  MODIFY `id_course` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_lesson`
--
ALTER TABLE `tb_lesson`
  MODIFY `id_lesson` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_role`
--
ALTER TABLE `tb_role`
  MODIFY `id_role` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_section`
--
ALTER TABLE `tb_section`
  MODIFY `id_section` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_trans`
--
ALTER TABLE `tb_trans`
  MODIFY `id_trans` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
