-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2015 at 11:18 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `analyser`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE IF NOT EXISTS `app_users` (
`app_user_id` int(10) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_me` text COLLATE utf8_unicode_ci,
  `lga_id` int(10) unsigned NOT NULL,
  `verified` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `verification_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`app_user_id`, `email`, `password`, `first_name`, `last_name`, `gender`, `phone_no`, `dob`, `avatar`, `about_me`, `lga_id`, `verified`, `status`, `verification_code`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user@gmail.com', '$2y$10$QGtlsIGqrD5dFa258Uus6uKM3glzHu0owaVbv6sTVot4Ao74U0quy', 'Kingsley', 'Chinaka', 'Male', '08030734377', '1988-05-05', 'uploads/app_avatars/1_avatar.jpg', 'A smart joker... to the lowest level', 290, 1, 1, 'uHBSpwDMx151ItGmgWbbwiyLQ2dj4duzKT0id3l7', 'XmMLsleeVZphnfXckDu7Qg4K8RRgB5jXRPHtjlfA5stufZrbr3XF8fi8vQPd', '2015-08-18 14:00:39', '2015-08-21 12:48:06'),
(2, 'nondefyde@gmail.com', '$2y$10$EilpU2JF2NMxxxiHssMpFOFgBBA5wBMXmeiFS46OuHY1nBFfv/B6u', 'Okafor', 'Emmanuel', NULL, NULL, NULL, 'uploads/app_avatars/2_avatar.jpg', NULL, 0, 1, 1, 'kcf30y80NtA4UNnjXf0zLd6wnmH4fBhfdLJuaXMh', 'ELFAB4QJPxL9Rx5A2WCyzKnKOAKl56poUeWU0fK3OaHEaxih1Id3CIJBqXeM', '2015-08-18 14:06:58', '2015-08-24 08:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `assemblies`
--

CREATE TABLE IF NOT EXISTS `assemblies` (
`assembly_id` int(10) unsigned NOT NULL,
  `assembly` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE IF NOT EXISTS `beneficiaries` (
`beneficiary_id` int(10) unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `beneficiaries`
--

INSERT INTO `beneficiaries` (`beneficiary_id`, `name`, `address`, `project_id`, `created_at`, `updated_at`) VALUES
(1, 'Mallam Audu Sule', 'Hanwa G.R.A Zaria', 1, '2015-08-13 06:15:24', '0000-00-00 00:00:00'),
(2, 'Sir Idris Mohammed', 'University road, yaba lagos', 1, '2015-08-14 04:17:25', '0000-00-00 00:00:00'),
(4, 'Okon Ubon', 'Eket road, Calabar', 1, '2015-08-14 09:30:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `constituencies`
--

CREATE TABLE IF NOT EXISTS `constituencies` (
`constituency_id` int(10) unsigned NOT NULL,
  `constituencies` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `constituency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `senatorial_district_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contractors`
--

CREATE TABLE IF NOT EXISTS `contractors` (
`contractor_id` int(10) unsigned NOT NULL,
  `contractor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contractor_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cac_registration_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `specialization_area` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `years_experience` int(11) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contractors`
--

INSERT INTO `contractors` (`contractor_id`, `contractor`, `contractor_code`, `email`, `phone_no`, `cac_registration_no`, `tin`, `specialization_area`, `years_experience`, `address`, `created_at`, `updated_at`) VALUES
(1, 'D & G', 'RC00291', 'dandg@gmail.com', '2349044738292', '0908SE987', 'TIN97802038973', 'Commerce and Industries', 12, 'No 25 Durban Street, Off Adetokumbo Ademola Crescent, Wuse II, F.C.T Abuja.', '2015-08-10 10:25:59', '2015-08-10 11:41:29'),
(2, 'AT & T', 'RC00221', 'att@icloud.com', '08063782033', '35660908SE987', 'TIN9780279806723', 'Telecommunication', 15, 'Silicon Valley, California.', '2015-08-10 11:27:06', '2015-08-10 11:27:06'),
(3, 'Rocar Wear', 'RC04950', 'rocknation@co.za', '08063786853', '3566TY00UH89', 'TIN9000048973', 'Designers Wears', 21, 'Alaba International Market Lagos, Nigeria', '2015-08-10 11:36:06', '2015-08-10 11:36:06'),
(5, 'Capital Oil', 'RC2901', 'capital@yail.com', '0148654344', '3566TY00WQ89', 'TIN06436038973', 'Oil and Gas', 7, 'Ahmadu Bello Way, Abuja, Nigeria', '2015-08-10 12:56:22', '2015-08-10 13:02:40');

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE IF NOT EXISTS `domains` (
`domain_id` int(10) unsigned NOT NULL,
  `town` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `location_address` text COLLATE utf8_unicode_ci NOT NULL,
  `lga_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`domain_id`, `town`, `location_address`, `lga_id`, `project_id`, `created_at`, `updated_at`) VALUES
(1, 'Umuucho', 'Cadastral Zone', 43, 1, '2015-08-13 04:13:19', '0000-00-00 00:00:00'),
(2, 'Wuse II', 'Ademola Adetukumbo Crescent', 272, 1, '2015-08-13 11:28:25', '0000-00-00 00:00:00'),
(4, 'Sabon Gari', 'PZ, Samaru, Zaria', 363, 1, '2015-08-14 04:20:24', '0000-00-00 00:00:00'),
(5, 'Lere', 'District', 356, 1, '2015-08-14 07:23:32', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `federal_constituencies`
--

CREATE TABLE IF NOT EXISTS `federal_constituencies` (
`federal_constituency_id` int(10) unsigned NOT NULL,
  `federal_constituency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `federal_constituency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `federal_constituencies`
--

INSERT INTO `federal_constituencies` (`federal_constituency_id`, `federal_constituency`, `federal_constituency_code`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'Aba North/Aba South', 'FC/001/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Arochukwu/Ohafia', 'FC/002/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Bende', 'FC/003/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Isiala Ngwa North /Isiala Ngwa South', 'FC/004/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Isuikwuato/Umu-Nneochi', 'FC/005/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Obingwa/Ugwunagbo/Osisioma', 'FC/006/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Umuahia North/ Umuahia South/ Ikwuano', 'FC/007/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Ukwa East/Ukwa West', 'FC/008/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Demsa/Numan/Lamurde', 'FC/009/AD', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Furore/Song', 'FC/010/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Mayo Belwa/Ganye/Jada /Toungo', 'FC/011/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Gombi/Hong', 'FC/012/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Guyuk/Shelleng', 'FC/013/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Madagali/Michika', 'FC/014/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Maiha/Mubi North/Mubi South', 'FC/015/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Yola North/Yola South/Girei', 'FC/016/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Anambra East/Anambra West', 'FC/027/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Onitsha North/Onitsha South', 'FC/028/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Ogbaru', 'FC/029/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Aguata', 'FC/030/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Oyi/Ayamelum', 'FC/031/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Awka North/Awka South', 'FC/032/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Njikoka/Dunukofia/Anaocha', 'FC/033/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Idemili North/Idemili South', 'FC/034/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Ihiala', 'FC/035/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Nnewi North/Nnewi South/ Ekwusigo', 'FC/036/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Orumba North/Orumba South', 'FC/037/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Abak/Etim Ekpo/Ika', 'FC/017/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Eket/Onna/Esit Eket/Ibeno', 'FC/018/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Etinan/Nsit Ibom/Nsit ubium', 'FC/019/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Ikono/Ini', 'FC/020/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Ikot Abasi/Mkpat Enin/Eastern Obolo', 'FC/021/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Ikot Ekpene/Essien Udim/ Obot Akara', 'FC/022/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Itu/Ibiono Ibom', 'FC/023/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Oron/Mbo/Okobo/Udung Uko/Urue Offong/Oruko', 'FC/024/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Ukanafun/Oruk Anam', 'FC/025/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Uyo/Uruan/Nsit Atai/ Ibesikpo Asutan', 'FC/026/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Alkaleri/Kirfi', 'FC/038/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Bauchi', 'FC/039/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Bogoro/Dass/Tafawa Balewa', 'FC/040/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Toro', 'FC/041/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Ningi/Warji', 'FC/042/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Darazo/Gunjuwa', 'FC/043/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Misau/Dambam', 'FC/044/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Zaki', 'FC/045/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'Gamawa', 'FC/046/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Jama’are/Itas-Gadau', 'FC/047/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Shira/Giade', 'FC/048/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Katagum', 'FC/049/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Brass/Nembe', 'FC/050/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Ogbia', 'FC/051/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Sagbama/Ekeremor', 'FC/052/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Southern Ijaw', 'FC/053/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Yenagoa/Kolokuna/Opokuma', 'FC/054/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Ado/Obadigbo/Okpokwu', 'FC/055/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Apa/Agatu', 'FC/056/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Buruku', 'FC/057/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Gboko/Tarka', 'FC/058/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Guma/Makurdi', 'FC/059/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Gwer East/Gwer West', 'FC/060/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Katsina-Ala/Ukum/Logo', 'FC/061/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Konshisha/Vandeikya', 'FC/062/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Kwande/Ushongo', 'FC/063/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Oju/Obi', 'FC/064/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Otukpo/Ohimini', 'FC/065/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Askira-Uba/Hawul', 'FC/066/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Bama/Ngala/Kala-Balge', 'FC/067/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Biu/Kwaya-Kusar, Shani/Bayo', 'FC/068/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Dikwa/Mafa/Konduga', 'FC/069/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Damboa/Gwoza/Chibok', 'FC/070/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Kaga/Gubio/Magumeri', 'FC/071/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Monguno/Nganzai/Marte', 'FC/072/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Kukawa/Mobbar/Abadam/ Guzamali', 'FC/073/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Maiduguri (Metropolitan)', 'FC/074/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Jere', 'FC/075/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Yakurr/Abi', 'FC/076/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'Akamkpa/Biase', 'FC/077/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'Boki/Ikom', 'FC/078/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'Calabar South/Akpabuyo/ Bakassi', 'FC/079/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Calabar Municipal/Odukpani', 'FC/080/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Obanliku/Obudu/Bekwarra', 'FC/081/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Obubra/Etung', 'FC/082/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Ogoja/Yala', 'FC/083/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Aniocha North/Aniocha South/ Oshimili North & South', 'FC/084/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Bomadi/Patani', 'FC/085/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Ethiope East/Ethiope West', 'FC/086/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Ika North East/Ika South', 'FC/087/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Isoko North/Isoko South', 'FC/088/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Nkokwa East/Ndokwa West/ Ukwuani', 'FC/089/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Okpe/Sapele/Uvwie', 'FC/090/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Burutu', 'FC/091/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Ughelli North, Ughelli South/Udu', 'FC/092/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Warri North/Warri South/ Warri South West', 'FC/093/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Ebonyi/Ohaukwu', 'FC/094/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Abakaliki/Izzi', 'FC/095/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Ezza North/Ishielu', 'FC/096/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Ezza South/Ikwo', 'FC/097/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Ivo-Ohaozara/Onicha', 'FC/098/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Afikpo North/Afikpo South', 'FC/099/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Akoko-Edo', 'FC/100/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Esan Central/Esan South/ Igueben', 'FC/101/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Esan North East/Esan South East', 'FC/102/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Etsako East/Etsako West/ Etsako Central ', 'FC/103/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Egor/Ikpoba-Okha', 'FC/104/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Oredo', 'FC/105/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Orhionmwon/Uhunmwonde', 'FC/106/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Ovia North East/Ovia South West', 'FC/107/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Owan East/Owan West', 'FC/108/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Ado Ekiti/Irepodun/Ifelodun', 'FC/109/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Ekiti South West/Ikere/Orun/ Ise', 'FC/110/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Emure/Gbonyin/Ekiti East', 'FC/111/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Ido/Osi, Moba/Ilejeme', 'FC/112/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Ijero/Ekiti West/Efon', 'FC/113/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Ikole/Oye', 'FC/114/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Aninri/Awgu/Oji River', 'FC/115/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Enugu East/Isi Uzo', 'FC/116/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Enugu North/Enugu South', 'FC/117/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Ezeagu/Udi', 'FC/118/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Igbo-Etiti/Uzo-Uwani', 'FC/119/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Igbo-Eze North/Udenu', 'FC/120/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Nkanu East/Nkanu West', 'FC/121/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Nsukka/Igbo-Eze South', 'FC/122/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Akko', 'FC/123/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Yamaltu/Deba', 'FC/124/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Balanga/Billiri', 'FC/125/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Kaltungo/Shongom', 'FC/126/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Gombe/Kwami/Funakaye', 'FC/127/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Dukku/Nafada', 'FC/128/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Ehime Mbano/Ihite-Uboma/ Obowo', 'FC/129/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Isiala Mbano/Okigwe/Onuimo', 'FC/130/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'Ideato North/Ideato South', 'FC/131/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'Isu/Njaba/Nkwerre/Nwangele', 'FC/132/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Oguta/Ohaji-Egbema/Oru West', 'FC/133/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Oru East/Orsu/Orlu', 'FC/134/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Aboh Mbaise/Ngor Okpala', 'FC/135/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'Ahiazu Mbaise/Ezinihitte', 'FC/136/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'Ikeduru/Mbaitoli', 'FC/137/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Owerri Municipal/Owerri North/Owerri West', 'FC/138/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Babura/Garki', 'FC/139/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Birnin Kudu/Buji', 'FC/140/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Birniwa Guri/Kirikasamma', 'FC/141/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Dutse/Kiyawa', 'FC/142/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Gwaram', 'FC/143/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Gumel/Maigatari/Sule Tankarkar/Gagarawa', 'FC/144/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Hadejia/Kafin Hausa', 'FC/145/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Jahun/Miga', 'FC/146/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Mallam Madori/Kaugama', 'FC/147/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Kazaure/Roni/Gwiwa/Yankwashi', 'FC/148/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Ringim/Taura', 'FC/149/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Kaduna North', 'FC/150/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Zaria', 'FC/151/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Soba', 'FC/152/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Igabi', 'FC/153/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Ikara/Kubau', 'FC/154/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Makarfi/Kudan', 'FC/155/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'Lere', 'FC/156/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'Kachia/Kagarko', 'FC/157/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'Chikun/Kajuru', 'FC/158/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'Jema’a/Sanga', 'FC/159/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'Birnin Gwari/Giwa', 'FC/160/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Sabon Gari', 'FC/161/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'Kaduna South', 'FC/162/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Kaura', 'FC/163/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Kauru', 'FC/164/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Zangon Kataf/Jaba', 'FC/165/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'Alabasu/Gaya/Ajingi', 'FC/166/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Shanono/Bagwai', 'FC/167/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Bebeji/Kiru', 'FC/168/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'Bichi', 'FC/169/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Rano/Bunkure/Kibiya', 'FC/170/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Dala', 'FC/171/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Gwale', 'FC/172/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Dambatta/Makoda', 'FC/173/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Dawakin Kudu/Warawa', 'FC/174/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Dawakin Tofa/Tofa/Rimin Gado', 'FC/175/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Doguwa/Tudun Wada', 'FC/176/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Gezawa/Gabasawa', 'FC/177/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Gwarzo/Ikabo', 'FC/178/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Municipal', 'FC/179/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Tarauni', 'FC/180/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Karaye/Rogo', 'FC/181/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Kumbotso', 'FC/182/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Kura/Madobi/Garun Mallam', 'FC/183/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Nassarawa', 'FC/184/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Fagge', 'FC/185/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Sumaila/Takai', 'FC/186/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Minjibir/Ungogo', 'FC/187/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'Tsanyawa/Kunchi', 'FC/188/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Wudil/Garko', 'FC/189/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Bakori/Danja', 'FC/190/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Batagarawa/Charanchi/Rimi', 'FC/191/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Batsari/Safana/Danmusa', 'FC/192/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'Bindawa/Mani', 'FC/193/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'Daura/Sandamu/Mai’adua', 'FC/194/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Dutsin-ma/Kurfi', 'FC/195/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Faskari/Kankara/Sabuwa', 'FC/196/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Funtua/Dandume', 'FC/197/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Ingawa/Kankia/Kusada', 'FC/198/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Jibia/Kaita', 'FC/199/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Malumfashi/Kafur', 'FC/200/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'Katsina', 'FC/201/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Mashi/Dutsi', 'FC/202/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Matazu/Musawa', 'FC/203/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Zango/Baure', 'FC/204/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Arewa/Dandi', 'FC/205/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'Argungu/Augie', 'FC/206/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'Bagudo/Suru', 'FC/207/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'Bunza/Birnin Kebbi/Kalgo', 'FC/208/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'Aleiro/Gwandu/Jega', 'FC/209/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Koko-Besse/Maiyama', 'FC/210/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Fakai/Sakaba/Wasagu/Danko/ Zuru', 'FC/211/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Ngaski/Shanga/Yauri', 'FC/212/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Adavi/Okehi', 'FC/213/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Ankpa/Omala/Olamaboro', 'FC/214/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Bassa/Dekina', 'FC/215/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'Idah/Igalamela Odolu/Ibaji/ Ofu', 'FC/216/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'Ijumu/Kabba-Bunu', 'FC/217/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Ajaokuta', 'FC/218/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Kogi (Lokoja)/Kogi (K.K.)', 'FC/219/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Okene/Ogori-Magogo', 'FC/220/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Yagba East/Yagba West/ Mopamuro', 'FC/221/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Baruten/Kaiama', 'FC/222/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Edu/Moro/Pategi', 'FC/223/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Ekiti/Isin/Irepodun/Oke-Ero', 'FC/224/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Ilorin East/Ilorin South', 'FC/225/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Ilorin West/Asa', 'FC/226/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'Ifelodun/Offa/Oyun', 'FC/227/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Agege', 'FC/228/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Ifako/Ijaiye', 'FC/229/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'Alimosho', 'FC/230/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Badagry', 'FC/231/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Epe', 'FC/232/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Ibeju Lekki', 'FC/233/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'Eti-Osa', 'FC/234/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'Apapa', 'FC/235/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'Ikeja', 'FC/236/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'Ikorodu', 'FC/237/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'Lagos Island I', 'FC/238/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Lagos Island II', 'FC/239/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'Lagos Mainland', 'FC/240/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Mushin I', 'FC/241/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Mushin II', 'FC/242/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'Ojo', 'FC/243/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Amuwo-Odofin', 'FC/244/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Ajeromi/Ifelodun', 'FC/245/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'Oshodi/Isolo I', 'FC/246/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'Oshodi/Isolo II', 'FC/247/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'Shomolu', 'FC/248/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Kosofe', 'FC/249/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'Surulere I', 'FC/250/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'Surulere II', 'FC/251/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'Akwanga/Nassarawa Eggon/ Wamba', 'FC/252/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'Awe/Doma/Keana ', 'FC/253/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'Keffi/Karu/Kokona', 'FC/254/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'Lafia/Obi', 'FC/255/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'Nassarawa/Toto', 'FC/256/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'Agaie/Lapai', 'FC/257/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'Agwara/Borgu', 'FC/258/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'Bida/Gbako/Katcha', 'FC/259/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'Booso/Paikoro', 'FC/260/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'Chanchaga', 'FC/261/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'Gurara/Suleja/Tapa', 'FC/262/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'Lavun/Mokwa/Edati', 'FC/263/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'Magama/Rijau', 'FC/264/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'Kontagora/Wushishi/Mariga/ Mashegu', 'FC/265/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'Shiroro/Rafi/Munya', 'FC/266/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'Abeokuta North/ Obafemi- Owode/Odeda', 'FC/267/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'Abeokuta South', 'FC/268/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'Ado-Odo/Ota', 'FC/269/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'Egbado North/Imeko-Afon', 'FC/270/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'Egbado South/Ipokia', 'FC/271/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'Ifo/Ewekoro', 'FC/272/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'Ijebu North/Ijebu East/Ogun Waterside', 'FC/273/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'Ijebu Ode /Odogbolu /Ijebu North East', 'FC/274/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'Ikenne/Shagamu/Remo North', 'FC/275/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'Akoko North East/Akoko North West', 'FC/276/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'Akoko South East/Akoko South West', 'FC/277/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'Akure North/Akure South', 'FC/278/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'Idanre/Ifedore', 'FC/279/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'Ileoluji/Okeigbo/Odigbo', 'FC/280/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'Okitipupa/Irele', 'FC/281/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'Eseodo/Ilaje', 'FC/282/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'Ondo East/Ondo West', 'FC/283/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'Owo/Ose', 'FC/284/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'Irepodun/Olorunda/Osogbo/Orolu', 'FC/285/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'Odo-Otin/Ifelodun/Boripe', 'FC/286/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'Boluwaduro/Ifedayo/Ila', 'FC/287/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'Atakunmosa East/ Atakunmosa West/Ilesha East/Ilesha West', 'FC/288/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'Obokun/Oriade', 'FC/289/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'Ife Central/Ife North/Ife South/Ife East ', 'FC/290/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'Ayedire/Iwo/Ola-Oluwa', 'FC/291/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'Ayedaade/Irewole/Isokan', 'FC/292/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'Ede North/Ede South/ Egbedore/Ejigbo', 'FC/293/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'Afijio/Oyo East/Oyo West/ Atiba', 'FC/294/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'Akinyele/Lagelu', 'FC/295/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'Egbeda/Ona-Ara', 'FC/296/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'Ibarapa Central/Ibarapa North', 'FC/297/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'Ibarapa East/Ido', 'FC/298/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 'Saki East/Saki West/Atisbo', 'FC/299/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 'Irepo/Orelope/Olorunsogo', 'FC/300/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 'Iseyin/Itesiwaju/Kajola/ Iwajowa', 'FC/301/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 'Ogbomoso North/ Ogbomoso South/Orire', 'FC/302/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 'Ogo-Oluwa/Surulere', 'FC/303/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 'Oluyole', 'FC/304/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'Ibadan North East/Ibadan South East', 'FC/305/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 'Ibadan South West/Ibadan North West', 'FC/306/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 'Ibadan North', 'FC/307/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'Jos North/Bassa ', 'FC/308/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 'Jos South/Jos East', 'FC/309/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'Barkin Ladi/Riyom', 'FC/310/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 'Bokkos/Mangu', 'FC/311/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 'Kanke/Pankshin/Kanam', 'FC/312/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 'Wase', 'FC/313/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'Langtang North/Langtang South', 'FC/314/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 'Mikang/Qua’an/Pan/Shedam', 'FC/315/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'Abua-Odual/Ahaoda East', 'FC/316/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'Ahoada West/Ogba Egbema', 'FC/317/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'Degema/Bonny', 'FC/318/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'Akuku-Toru/Asari-Toru', 'FC/319/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 'Okrika/Ogu-Bolo', 'FC/320/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 'Opobo/Nkoro/Andoni', 'FC/321/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 'Eleme/Tai/Oyigbo', 'FC/322/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 'Khana/Gokana', 'FC/323/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 'Ikwerre/Umohua', 'FC/324/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 'Etche/Omuma', 'FC/325/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 'Obio Akpor', 'FC/326/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 'Port Harcourt I', 'FC/327/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 'Port Harcourt II', 'FC/328/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 'Isa/Sabon Birni', 'FC/329/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 'Goronyo/Gada', 'FC/330/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 'Wurno/Rabah', 'FC/331/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 'Illela/Gwadabawa', 'FC/332/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 'Tangaza/Gudu', 'FC/333/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 'Binji/Silame', 'FC/334/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 'Kware/Wamakko', 'FC/335/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 'Sokoto North/Sokoto South', 'FC/336/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 'Dange-Shuni/Bodinga/Tureta', 'FC/337/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 'Yabo/Shagari', 'FC/338/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 'Kebbe/Tambuwal', 'FC/339/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 'Bali/Gassol', 'FC/340/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 'Takum/Donga/Ussa', 'FC/341/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 'Sardauna/Kurmi/Gashaka', 'FC/342/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 'Ibi/Wukari', 'FC/343/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 'Jalingo/Yorro/Zing', 'FC/344/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 'Karim Lamido/Lau/Ardo-Kola', 'FC/345/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 'Bade/Jakusko', 'FC/346/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 'Bursari/Geidam/Yunusari', 'FC/347/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 'Damaturu/Gujba/Gulani/ Tarmuwa', 'FC/348/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 'Fika/Fune', 'FC/349/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 'Machina/Nguru/Yusufari/ Karasuwa', 'FC/350/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 'Nangere/Potiskm', 'FC/351/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 'Kaura-Namoda/Birnin Magaji', 'FC/352/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 'Shinkafi/Zurmi', 'FC/353/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 'Gusau/Tsafe', 'FC/354/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 'Bungudu/Maru', 'FC/355/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 'Anka/Talata Mafara', 'FC/356/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 'Bakura/Maradun', 'FC/357/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 'Gummi/Bukkuyum', 'FC/358/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 'Abaji/Gwagwalada/Kwali/Kuje', 'FC/359/FCT', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 'Municipal/Bwari', 'FC/360/FCT', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `federal_representatives`
--

CREATE TABLE IF NOT EXISTS `federal_representatives` (
`federal_rep_id` int(10) unsigned NOT NULL,
  `rank_id` int(10) unsigned NOT NULL,
  `federal_constituency_id` int(10) unsigned NOT NULL,
  `house_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `federal_representatives`
--

INSERT INTO `federal_representatives` (`federal_rep_id`, `rank_id`, `federal_constituency_id`, `house_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 161, 2, 4, '2015-08-25 15:21:14', '2015-08-27 08:12:00'),
(2, 2, 190, 2, 3, '2015-08-25 15:21:14', '2015-08-25 15:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `hansards`
--

CREATE TABLE IF NOT EXISTS `hansards` (
`hansard_id` int(10) unsigned NOT NULL,
  `volume` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `number` int(10) unsigned NOT NULL,
  `house_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `session` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `upload_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hansards`
--

INSERT INTO `hansards` (`hansard_id`, `volume`, `date`, `number`, `house_id`, `user_id`, `session`, `upload_url`, `created_at`, `updated_at`) VALUES
(1, 2, '2015-08-05 15:46:38', 3, 2, 2, 'Fourth Session', '2_upload.pdf', '2015-08-26 09:32:30', '2015-08-26 15:46:38'),
(2, 3, '2015-08-06 15:48:19', 5, 1, 2, 'Twelve Session', '2_upload.pdf', '2015-08-26 11:23:54', '2015-08-26 15:48:19'),
(14, 1, '2015-08-07 15:35:01', 2, 4, 1, 'Nineth Session', '14_upload.pdf', '2015-08-26 15:35:01', '2015-08-26 15:35:11'),
(15, 6, '2015-05-05 20:26:05', 6, 1, 2, 'Third Session', '15_upload.pdf', '2015-08-26 20:26:05', '2015-08-26 20:26:33');

-- --------------------------------------------------------

--
-- Table structure for table `hansard_roll_calls`
--

CREATE TABLE IF NOT EXISTS `hansard_roll_calls` (
  `hansard_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hansard_roll_calls`
--

INSERT INTO `hansard_roll_calls` (`hansard_id`, `user_id`) VALUES
(1, 4),
(14, 7),
(14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
`house_id` int(10) unsigned NOT NULL,
  `house` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_type_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`house_id`, `house`, `user_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Seventh Senate', 3, '2015-08-25 09:18:58', '2015-08-25 09:18:58'),
(2, 'Eighth House', 4, '2015-08-25 09:19:51', '2015-08-25 09:23:09'),
(4, 'Eight House', 5, '2015-08-25 15:42:45', '2015-08-25 15:42:45');

-- --------------------------------------------------------

--
-- Table structure for table `lgas`
--

CREATE TABLE IF NOT EXISTS `lgas` (
`lga_id` int(10) unsigned NOT NULL,
  `lga` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=775 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lgas`
--

INSERT INTO `lgas` (`lga_id`, `lga`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'Aba North', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Aba South', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Arochukwu', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Bende', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Ikwuano', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Isiala Ngwa North', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Isiala Ngwa South', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Isuikwuato', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Obi Ngwa', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Ohafia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Osisioma', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Ugwunagbo', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Ukwa East', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Ukwa West', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Umuahia North', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Umuahia South', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Umu Nneochi', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Demsa', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Fufure', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Ganye', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Gayuk', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Gombi', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Grie', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Hong', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Jada', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Larmurde', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Madagali', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Maiha', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Mayo Belwa', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Michika', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Mubi North', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Mubi South', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Numan', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Shelleng', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Song', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Toungo', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Yola North', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Yola South', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Abak', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Eastern Obolo', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Eket', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Esit Eket', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Essien Udim', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Etim Ekpo', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Etinan', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'Ibeno', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Ibesikpo Asutan', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Ibiono-Ibom', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Ika', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Ikono', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Ikot Abasi', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Ikot Ekpene', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Ini', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Itu', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Mbo', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Mkpat-Enin', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Nsit-Atai', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Nsit-Ibom', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Nsit-Ubium', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Obot Akara', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Okobo', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Onna', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Oron', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Oruk Anam', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Udung-Uko', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Ukanafun', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Uruan', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Urue-Offong/Oruko', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Uyo', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Aguata', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Anambra East', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Anambra West', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Anaocha', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Awka North', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Awka South', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Ayamelum', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'Dunukofia', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'Ekwusigo', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'Idemili North', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Idemili South', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Ihiala', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Njikoka', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Nnewi North', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Nnewi South', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Ogbaru', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Onitsha North', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Onitsha South', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Orumba North', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Orumba South', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Oyi', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Alkaleri', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Bauchi', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Bogoro', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Damban', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Darazo', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Dass', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Gamawa', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Ganjuwa', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Giade', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Itas/Gadau', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Jama''are', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Katagum', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Kirfi', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Misau', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Ningi', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Shira', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Tafawa Balewa', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Toro', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Warji', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Zaki', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Brass', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Ekeremor', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Kolokuma/Opokuma', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Nembe', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Ogbia', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Sagbama', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Southern Ijaw', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Yenagoa', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Agatu', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Apa', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Ado', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Buruku', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Gboko', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Guma', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Gwer East', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Gwer West', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Katsina-Ala', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Konshisha', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Kwande', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Logo', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'Makurdi', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'Obi', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Ogbadibo', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Ohimini', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Oju', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'Okpokwu', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'Oturkpo', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Tarka', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Ukum', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Ushongo', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Vandeikya', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Abadam', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Askira/Uba', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Bama', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Bayo', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Biu', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Chibok', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Damboa', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Dikwa', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Gubio', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Guzamala', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Gwoza', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Hawul', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Jere', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Kaga', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'Kala/Balge', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'Konduga', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'Kukawa', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'Kwaya Kusar', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'Mafa', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Magumeri', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'Maiduguri', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Marte', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Mobbar', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Monguno', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'Ngala', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Nganzai', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Shani', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'Abi', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Akamkpa', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Akpabuyo', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Bakassi', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Bekwarra', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Biase', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Boki', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Calabar Municipal', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Calabar South', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Etung', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Ikom', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Obanliku', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Obubra', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Obudu', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Odukpani', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Ogoja', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Yakuur', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Yala', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Aniocha North', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'Aniocha South', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Bomadi', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Burutu', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Ethiope East', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Ethiope West', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'Ika North East', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'Ika South', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Isoko North', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Isoko South', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Ndokwa East', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Ndokwa West', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Okpe', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Oshimili North', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'Oshimili South', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Patani', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Sapele, Delta', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Udu', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Ughelli North', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'Ughelli South', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'Ukwuani', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'Uvwie', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'Warri North', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Warri South', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Warri South West', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Abakaliki', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Afikpo North', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Afikpo South', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Ebonyi', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'Ezza North', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'Ezza South', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Ikwo', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Ishielu', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Ivo', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Izzi', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Ohaozara', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Ohaukwu', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Onicha', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Akoko-Edo', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Egor', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'Esan Central', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Esan North-East', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Esan South-East', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'Esan West', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Etsako Central', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Etsako East', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Etsako West', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'Igueben', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'Ikpoba Okha', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'Orhionmwon', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'Oredo', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'Ovia North-East', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Ovia South-West', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'Owan East', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Owan West', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Uhunmwonde', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'Ado Ekiti', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Efon', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Ekiti East', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'Ekiti South-West', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'Ekiti West', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'Emure', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Gbonyin', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'Ido Osi', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'Ijero', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'Ikere', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'Ikole', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'Ilejemeje', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'Irepodun/Ifelodun', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'Ise/Orun', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'Moba', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'Oye', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'Aninri', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'Awgu', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'Enugu East', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'Enugu North', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'Enugu South', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'Ezeagu', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'Igbo Etiti', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'Igbo Eze North', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'Igbo Eze South', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'Isi Uzo', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'Nkanu East', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'Nkanu West', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'Nsukka', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'Oji River', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'Udenu', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'Udi', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'Uzo Uwani', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'Abaji', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'Bwari', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'Gwagwalada', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'Kuje', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'Kwali', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'Municipal Area Council', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'Akko', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'Balanga', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'Billiri', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'Dukku', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'Funakaye', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'Gombe', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'Kaltungo', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'Kwami', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'Nafada', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'Shongom', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'Yamaltu/Deba', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'Aboh Mbaise', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'Ahiazu Mbaise', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'Ehime Mbano', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'Ezinihitte', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'Ideato North', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'Ideato South', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 'Ihitte/Uboma', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 'Ikeduru', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 'Isiala Mbano', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 'Isu', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 'Mbaitoli', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 'Ngor Okpala', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'Njaba', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 'Nkwerre', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 'Nwangele', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'Obowo', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 'Oguta', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'Ohaji/Egbema', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 'Okigwe', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 'Orlu', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 'Orsu', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'Oru East', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 'Oru West', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'Owerri Municipal', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'Owerri North', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'Owerri West', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'Unuimo', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 'Auyo', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 'Babura', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 'Biriniwa', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 'Birnin Kudu', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 'Buji', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 'Dutse', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 'Gagarawa', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 'Garki', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 'Gumel', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 'Guri', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 'Gwaram', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 'Gwiwa', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 'Hadejia', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 'Jahun', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 'Kafin Hausa', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 'Kazaure', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 'Kiri Kasama', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 'Kiyawa', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 'Kaugama', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 'Maigatari', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 'Malam Madori', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 'Miga', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 'Ringim', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 'Roni', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 'Sule Tankarkar', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 'Taura', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 'Yankwashi', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 'Birnin Gwari', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 'Chikun', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 'Giwa', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 'Igabi', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 'Ikara', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 'Jaba', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 'Jema''a', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 'Kachia', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 'Kaduna North', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 'Kaduna South', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 'Kagarko', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 'Kajuru', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 'Kaura', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 'Kauru', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 'Kubau', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 'Kudan', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 'Lere', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 'Makarfi', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 'Sabon Gari', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 'Sanga', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 'Soba', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 'Zangon Kataf', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 'Zaria', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 'Ajingi', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 'Albasu', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 'Bagwai', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 'Bebeji', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 'Bichi', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 'Bunkure', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 'Dala', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 'Dambatta', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 'Dawakin Kudu', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 'Dawakin Tofa', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 'Doguwa', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 'Fagge', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 'Gabasawa', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 'Garko', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 'Garun Mallam', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 'Gaya', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 'Gezawa', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 'Gwale', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 'Gwarzo', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 'Kabo', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 'Kano Municipal', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 'Karaye', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 'Kibiya', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 'Kiru', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 'Kumbotso', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 'Kunchi', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 'Kura', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 'Madobi', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 'Makoda', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 'Minjibir', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 'Nasarawa', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 'Rano', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 'Rimin Gado', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 'Rogo', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 'Shanono', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 'Sumaila', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 'Takai', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 'Tarauni', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 'Tofa', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 'Tsanyawa', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 'Tudun Wada', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 'Ungogo', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 'Warawa', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 'Wudil', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 'Bakori', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 'Batagarawa', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 'Batsari', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 'Baure', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 'Bindawa', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 'Charanchi', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 'Dandume', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 'Danja', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 'Dan Musa', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 'Daura', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 'Dutsi', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 'Dutsin Ma', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 'Faskari', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 'Funtua', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 'Ingawa', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 'Jibia', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 'Kafur', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 'Kaita', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 'Kankara', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 'Kankia', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 'Katsina', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 'Kurfi', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 'Kusada', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 'Mai''Adua', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 'Malumfashi', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 'Mani', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 'Mashi', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 'Matazu', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 'Musawa', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 'Rimi', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 'Sabuwa', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 'Safana', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 'Sandamu', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 'Zango', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 'Aleiro', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 'Arewa Dandi', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 'Argungu', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 'Augie', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 'Bagudo', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 'Birnin Kebbi', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 'Bunza', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 'Dandi', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 'Fakai', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 'Gwandu', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 'Jega', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 'Kalgo', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 'Koko/Besse', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 'Maiyama', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 'Ngaski', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 'Sakaba', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 'Shanga', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 'Suru', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 'Wasagu/Danko', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 'Yauri', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 'Zuru', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 'Adavi', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 'Ajaokuta', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 'Ankpa', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 'Bassa', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 'Dekina', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 'Ibaji', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 'Idah', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 'Igalamela Odolu', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 'Ijumu', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 'Kabba/Bunu', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 'Kogi', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 'Lokoja', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 'Mopa Muro', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 'Ofu', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 'Ogori/Magongo', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 'Okehi', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 'Okene', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 'Olamaboro', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 'Omala', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 'Yagba East', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 'Yagba West', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 'Asa', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 'Baruten', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 'Edu', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, 'Ekiti, Kwara State', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, 'Ifelodun', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, 'Ilorin East', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 'Ilorin South', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 'Ilorin West', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 'Irepodun', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 'Isin', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, 'Kaiama', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 'Moro', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, 'Offa', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 'Oke Ero', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 'Oyun', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, 'Pategi', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, 'Agege', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, 'Ajeromi-Ifelodun', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, 'Alimosho', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 'Amuwo-Odofin', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 'Apapa', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, 'Badagry', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, 'Epe', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, 'Eti Osa', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, 'Ibeju-Lekki', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 'Ifako-Ijaiye', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 'Ikeja', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, 'Ikorodu', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, 'Kosofe', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, 'Lagos Island', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 'Lagos Mainland', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 'Mushin', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 'Ojo', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 'Oshodi-Isolo', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 'Shomolu', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, 'Surulere, Lagos State', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, 'Akwanga', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 'Awe', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, 'Doma', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, 'Karu', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, 'Keana', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 'Keffi', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 'Kokona', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 'Lafia', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 'Nasarawa', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, 'Nasarawa Egon', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, 'Obi', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, 'Toto', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 'Wamba', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 'Agaie', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 'Agwara', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 'Bida', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 'Borgu', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 'Bosso', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 'Chanchaga', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 'Edati', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 'Gbako', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, 'Gurara', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, 'Katcha', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, 'Kontagora', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 'Lapai', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 'Lavun', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 'Magama', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, 'Mariga', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, 'Mashegu', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, 'Mokwa', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, 'Moya', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, 'Paikoro', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 'Rafi', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 'Rijau', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, 'Shiroro', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, 'Suleja', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, 'Tafa', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, 'Wushishi', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, 'Abeokuta North', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, 'Abeokuta South', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, 'Ado-Odo/Ota', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, 'Egbado North', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, 'Egbado South', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, 'Ewekoro', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, 'Ifo', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, 'Ijebu East', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, 'Ijebu North', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, 'Ijebu North East', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, 'Ijebu Ode', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, 'Ikenne', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, 'Imeko Afon', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, 'Ipokia', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, 'Obafemi Owode', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, 'Odeda', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 'Odogbolu', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, 'Ogun Waterside', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, 'Remo North', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, 'Shagamu', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, 'Akoko North-East', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, 'Akoko North-West', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, 'Akoko South-West', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 'Akoko South-East', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 'Akure North', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 'Akure South', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, 'Ese Odo', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, 'Idanre', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, 'Ifedore', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, 'Ilaje', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 'Ile Oluji/Okeigbo', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, 'Irele', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, 'Odigbo', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, 'Okitipupa', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, 'Ondo East', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, 'Ondo West', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, 'Ose', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, 'Owo', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, 'Atakunmosa East', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, 'Atakunmosa West', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, 'Aiyedaade', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, 'Aiyedire', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, 'Boluwaduro', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, 'Boripe', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, 'Ede North', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, 'Ede South', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, 'Ife Central', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, 'Ife East', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, 'Ife North', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, 'Ife South', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, 'Egbedore', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, 'Ejigbo', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, 'Ifedayo', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, 'Ifelodun', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, 'Ila', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, 'Ilesa East', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, 'Ilesa West', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(621, 'Irepodun', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, 'Irewole', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, 'Isokan', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, 'Iwo', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, 'Obokun', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, 'Odo Otin', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, 'Ola Oluwa', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, 'Olorunda', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, 'Oriade', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, 'Orolu', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, 'Osogbo', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, 'Afijio', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, 'Akinyele', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, 'Atiba', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, 'Atisbo', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, 'Egbeda', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, 'Ibadan North', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, 'Ibadan North-East', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, 'Ibadan North-West', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, 'Ibadan South-East', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, 'Ibadan South-West', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, 'Ibarapa Central', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 'Ibarapa East', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, 'Ibarapa North', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, 'Ido', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, 'Irepo', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, 'Iseyin', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, 'Itesiwaju', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, 'Iwajowa', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, 'Kajola', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, 'Lagelu', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, 'Ogbomosho North', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, 'Ogbomosho South', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, 'Ogo Oluwa', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, 'Olorunsogo', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, 'Oluyole', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, 'Ona Ara', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, 'Orelope', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, 'Ori Ire', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, 'Oyo', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 'Oyo East', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, 'Saki East', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, 'Saki West', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(664, 'Surulere, Oyo State', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, 'Bokkos', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, 'Barkin Ladi', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, 'Bassa', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, 'Jos East', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, 'Jos North', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, 'Jos South', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, 'Kanam', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, 'Kanke', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, 'Langtang South', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, 'Langtang North', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, 'Mangu', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, 'Mikang', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, 'Pankshin', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, 'Qua''an Pan', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, 'Riyom', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, 'Shendam', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, 'Wase', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, 'Abua/Odual', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, 'Ahoada East', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, 'Ahoada West', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, 'Akuku-Toru', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, 'Andoni', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, 'Asari-Toru', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, 'Bonny', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, 'Degema', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, 'Eleme', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, 'Emuoha', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, 'Etche', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, 'Gokana', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, 'Ikwerre', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 'Khana', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 'Obio/Akpor', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, 'Ogba/Egbema/Ndoni', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, 'Ogu/Bolo', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, 'Okrika', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, 'Omuma', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, 'Opobo/Nkoro', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, 'Oyigbo', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, 'Port Harcourt', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, 'Tai', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, 'Binji', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 'Bodinga', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, 'Dange Shuni', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, 'Gada', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, 'Goronyo', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, 'Gudu', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, 'Gwadabawa', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, 'Illela', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, 'Isa', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, 'Kebbe', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, 'Kware', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, 'Rabah', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, 'Sabon Birni', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, 'Shagari', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, 'Silame', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, 'Sokoto North', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, 'Sokoto South', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, 'Tambuwal', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 'Tangaza', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, 'Tureta', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, 'Wamako', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, 'Wurno', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, 'Yabo', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, 'Ardo Kola', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, 'Bali', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 'Donga', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, 'Gashaka', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, 'Gassol', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, 'Ibi', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, 'Jalingo', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, 'Karim Lamido', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, 'Kumi', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, 'Lau', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, 'Sardauna', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, 'Takum', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 'Ussa', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, 'Wukari', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, 'Yorro', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, 'Zing', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, 'Bade', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, 'Bursari', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 'Damaturu', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, 'Fika', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, 'Fune', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, 'Geidam', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, 'Gujba', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, 'Gulani', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, 'Jakusko', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 'Karasuwa', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `lgas` (`lga_id`, `lga`, `state_id`, `created_at`, `updated_at`) VALUES
(754, 'Machina', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, 'Nangere', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, 'Nguru', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, 'Potiskum', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, 'Tarmuwa', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, 'Yunusari', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, 'Yusufari', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, 'Anka', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, 'Bakura', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, 'Birnin Magaji/Kiyaw', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 'Bukkuyum', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, 'Bungudu', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 'Gummi', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 'Gusau', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, 'Kaura Namoda', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, 'Maradun', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, 'Maru', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, 'Shinkafi', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, 'Talata Mafara', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, 'Chafe', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, 'Zurmi', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
`like_id` int(10) unsigned NOT NULL,
  `like` int(10) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL,
  `app_user_id` int(10) unsigned NOT NULL,
  `object_type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `like`, `object_id`, `app_user_id`, `object_type_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 2, 2, '2015-08-19 10:59:44', '0000-00-00 00:00:00'),
(2, 2, 2, 1, 2, '2015-08-19 11:00:09', '0000-00-00 00:00:00'),
(3, 1, 2, 2, 2, '2015-08-19 11:00:20', '0000-00-00 00:00:00'),
(4, 1, 4, 1, 2, '2015-08-19 11:01:08', '0000-00-00 00:00:00'),
(5, 1, 4, 1, 2, '2015-08-19 11:01:25', '0000-00-00 00:00:00'),
(6, 2, 4, 1, 2, '2015-08-19 11:01:47', '0000-00-00 00:00:00'),
(7, 2, 2, 3, 2, '2015-08-19 13:00:26', '0000-00-00 00:00:00'),
(8, 2, 1, 2, 2, '2015-08-19 14:43:19', '0000-00-00 00:00:00'),
(9, 1, 2, 2, 1, '2015-08-19 14:44:01', '0000-00-00 00:00:00'),
(10, 2, 1, 3, 1, '2015-08-19 14:44:37', '0000-00-00 00:00:00'),
(11, 1, 1, 1, 1, '2015-08-19 14:45:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
`menu_id` int(10) unsigned NOT NULL,
  `menu` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `menu_url` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(10) unsigned NOT NULL DEFAULT '1',
  `sequence` int(10) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `menu`, `menu_url`, `active`, `sequence`, `icon`, `created_at`, `updated_at`) VALUES
(3, 'Profile', '#', 1, 1, 'fa fa-user', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Votes and Proceedings', '#', 0, 4, 'fa fa-thumbs-up', '0000-00-00 00:00:00', '2015-08-20 07:09:02'),
(8, 'Bills and Acts', '#', 0, 5, 'fa fa-money', '0000-00-00 00:00:00', '2015-08-25 06:45:08'),
(9, 'Projects', '#', 1, 2, 'fa fa-briefcase', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Instant Reports', '#', 0, 8, 'fa fa-info', '0000-00-00 00:00:00', '2015-08-25 14:19:47'),
(11, 'Supervisors', '#', 1, 6, 'fa fa-users', '0000-00-00 00:00:00', '2015-08-25 14:19:46'),
(12, 'Hansard', '#', 1, 3, 'fa fa-book', '0000-00-00 00:00:00', '2015-08-24 09:39:32'),
(13, 'Master Records', '#', 1, 20, 'fa fa-cogs', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Contractors', '#', 1, 7, 'fa fa-gears', '0000-00-00 00:00:00', '2015-08-25 14:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
`menu_item_id` int(10) unsigned NOT NULL,
  `menu_item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `menu_item_url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `menu_item_icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(10) unsigned NOT NULL DEFAULT '1',
  `sequence` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`menu_item_id`, `menu_item`, `menu_item_url`, `menu_item_icon`, `active`, `sequence`, `menu_id`, `created_at`, `updated_at`) VALUES
(6, 'View Profile', '/profiles/show', 'fa fa-eye', 1, '1', 3, '0000-00-00 00:00:00', '2015-08-20 09:34:22'),
(7, 'Edit Profile', '/profiles', 'fa fa-edit', 1, '2', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Manage Projects', '/projects', 'fa fa-table', 1, '1', 9, '0000-00-00 00:00:00', '2015-08-21 07:06:14'),
(9, 'Manage Contractors', '/contractors', 'fa fa-table', 1, '1', 14, '0000-00-00 00:00:00', '2015-08-21 06:34:38'),
(10, 'Add Contractor', '/contractors/create', 'fa fa-plus-square', 1, '2', 14, '0000-00-00 00:00:00', '2015-08-21 07:06:13'),
(12, 'Create Project', '/projects/create', 'fa fa-plus-square', 1, '2', 9, '0000-00-00 00:00:00', '2015-08-21 07:06:14'),
(13, 'Manage Supervisors', '/supervisors', 'fa fa-table', 1, '1 ', 11, '2015-08-20 07:11:14', '2015-08-20 07:22:11'),
(14, 'Add Supervisor', '/supervisors/create', 'fa fa-plus-square', 1, '2', 11, '2015-08-20 07:11:15', '2015-08-20 07:22:11'),
(15, 'My Projects', '/supervisors/projects', 'fa fa-list-alt', 1, '3', 9, '2015-08-20 17:49:24', '2015-08-20 17:49:24'),
(16, 'Upload Hansard', '/hansards/create', 'fa fa-edit', 1, '2', 12, '2015-08-24 09:40:50', '2015-08-27 07:33:36'),
(17, 'Manage Hansards', '/hansards', 'fa fa-table', 1, '3', 12, '2015-08-24 10:10:46', '2015-08-27 08:15:19'),
(21, 'Senators', '/senators', 'fa fa-list-alt', 1, '1', 8, '2015-08-25 09:12:38', '2015-08-25 14:12:35'),
(25, 'Legislatives', '#', 'fa fa-group', 1, '1', 13, '2015-08-25 14:01:08', '2015-08-25 14:31:03'),
(26, 'Manage Menus', '#', 'fa fa-tasks', 1, '7', 13, '2015-08-25 14:12:36', '2015-08-25 14:31:03'),
(27, 'User', '#', 'fa fa-user', 1, '2', 13, '2015-08-25 14:17:06', '2015-08-25 14:31:03'),
(28, 'Basic Settings', '#', 'fa fa-list-alt', 1, '3', 13, '2015-08-25 14:27:16', '2015-08-25 14:31:03'),
(29, 'List Hansards', '/hansards/view', 'fa fa-list-alt', 1, '1', 12, '2015-08-27 08:15:19', '2015-08-27 08:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_07_31_160608_create_state_table', 1),
('2015_07_31_161238_create_lga_table', 1),
('2015_08_03_073606_create_senatorial_districts_table', 1),
('2015_08_03_073951_create_projects_table', 1),
('2015_08_03_074833_create_menus_table', 1),
('2015_08_03_074909_create_menu_items_table', 1),
('2015_08_05_105309_create_user_types_table', 1),
('2015_08_09_074910_create_contractors_table', 1),
('2015_08_10_091308_create_sector_table', 1),
('2015_08_11_091118_create_beneficiary_table', 1),
('2015_08_11_096689_create_domain_table', 1),
('2015_08_12_143254_create_project_updates_table', 1),
('2015_08_12_143340_create_project_comment_table', 1),
('2015_08_14_28392_create_app_users_table', 2),
('2015_08_18_075425_create_time_line_table', 2),
('2015_08_18_154431_add_column_model_to_time_line_type', 2),
('2015_08_19_103854_create_likes_table', 2),
('2015_08_19_111823_create_object_types_table', 2),
('2015_08_20_075745_create_sub_users_table', 3),
('2015_08_20_124519_create_project_supervisors_table', 3),
('2015_08_25_081654_create_senators_table', 3),
('2015_08_25_081936_create_federal_representatives_table', 3),
('2015_08_25_082235_create_state_representatives_table', 3),
('2015_08_25_082355_create_ranks_table', 4),
('2015_08_25_094536_create_house_table', 4),
('2015_08_25_124059_create_sub_menu_item', 4),
('2015_08_25_130202_create_federal_constituencies_table', 4),
('2015_08_25_130250_create_state_constituencies_table', 4),
('2015_08_24_142858_create_assembly_table', 5),
('2015_08_26_073807_create_hansards_table', 5),
('2015_08_26_105139_create_hansard_roll_calls_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `object_types`
--

CREATE TABLE IF NOT EXISTS `object_types` (
`object_type_id` int(10) unsigned NOT NULL,
  `object_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `object_types`
--

INSERT INTO `object_types` (`object_type_id`, `object_type`, `model`, `created_at`, `updated_at`) VALUES
(1, 'Project', 'Project', '2015-08-19 09:54:45', '0000-00-00 00:00:00'),
(2, 'Project Update', 'ProjectUpdate', '2015-08-19 09:55:33', '0000-00-00 00:00:00'),
(3, 'Bills and Acts', 'BillsActs', '2015-08-19 03:10:13', '0000-00-00 00:00:00'),
(4, 'Bills and Acts Update', 'BillsActsUpdate', '2015-08-19 01:08:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
`project_id` int(10) unsigned NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `purpose` text COLLATE utf8_unicode_ci NOT NULL,
  `mou` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `award_letter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `contractor_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_id` int(10) unsigned NOT NULL DEFAULT '0',
  `started_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expected_on` timestamp NULL DEFAULT NULL,
  `completed_on` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `title`, `description`, `purpose`, `mou`, `award_letter`, `user_id`, `contractor_id`, `status_id`, `publish_id`, `started_on`, `expected_on`, `completed_on`, `created_at`, `updated_at`) VALUES
(1, 'Mobile Broad Band Networks', 'Distribution of mobile devices', 'Kudu districts', '/mou/1_mou.pdf', '/award_letter/1_award_letter.pdf', 2, 2, 1, 1, '2015-07-13 16:29:54', '2016-01-20 16:29:54', NULL, '2015-08-12 05:21:15', '2015-08-21 16:29:54'),
(2, 'Andriod Phones', 'Android Mobile Tabs', 'Tabs for all the fulani''s in Gaduwa Districts', 'bankBranch.pdf', '', 1, 2, 1, 1, '2014-10-13 23:00:00', '2016-09-19 23:00:00', NULL, '2015-08-13 05:17:22', '0000-00-00 00:00:00'),
(3, 'Designers', 'df ghghtgfv gfggdf', 'dfghmuhtgrbfg  ', '/uploads/projects/mou/3_mou.pdf', '/uploads/projects/award_letter/3_award_letter.pdf', 2, 1, 2, 1, '2015-06-01 23:00:00', '2015-12-16 23:00:00', NULL, '2015-08-14 05:18:19', '0000-00-00 00:00:00'),
(4, 'Engin Oil', 'dvfbgnhntgr rgrbdg', 'vrgthryjtnb ', '/uploads/projects/mou/4_mou.pdf', '/uploads/projects/award_letter/4_award_letter.pdf', 2, 5, 1, 1, '2015-03-08 18:34:09', '2016-03-03 18:34:09', NULL, '2015-08-14 06:24:22', '2015-08-20 18:34:09'),
(5, 'Samsung Mobile Phones', 'distribution of mobile phones to the villagers', 'free phones for all the fulani''s', '', '', 1, 2, 1, 0, '2015-08-04 08:00:00', '2015-11-26 10:26:24', NULL, '2015-08-14 06:36:43', '0000-00-00 00:00:00'),
(6, 'Distribution of Laptops', 'Supplies of laptops to all the first class graduates from ABU Zaria', 'First class graduates from ABU Zaria', '/mou/6_mou.pdf', '/award_letter/6_award_letter.pdf', 2, 1, 1, 1, '2015-06-08 13:52:23', '2016-03-16 13:52:23', '2016-07-09 13:52:23', '2015-08-20 12:47:02', '2015-08-21 06:55:40');

-- --------------------------------------------------------

--
-- Table structure for table `project_comments`
--

CREATE TABLE IF NOT EXISTS `project_comments` (
`project_comment_id` int(10) unsigned NOT NULL,
  `update_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `project_update_id` int(10) unsigned NOT NULL,
  `app_user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_comments`
--

INSERT INTO `project_comments` (`project_comment_id`, `update_comment`, `project_update_id`, `app_user_id`, `created_at`, `updated_at`) VALUES
(1, 'Second Niger bridge bull shit over 15 years same contract has been awarded to same contractors nothing to show for it... Nonsense', 2, 2, '2015-08-19 03:14:14', '0000-00-00 00:00:00'),
(2, 'Obasanjo dealt with those handling the contract for over 8 years still no positive result came out', 2, 2, '2015-08-21 03:16:12', '0000-00-00 00:00:00'),
(3, 'Benin-Ore road that Abacha killed a lot of civilians just to ensure the safety of lives ', 1, 2, '2015-08-20 04:17:32', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `project_sector`
--

CREATE TABLE IF NOT EXISTS `project_sector` (
  `project_id` int(10) unsigned NOT NULL,
  `sector_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_sector`
--

INSERT INTO `project_sector` (`project_id`, `sector_id`) VALUES
(4, 3),
(5, 1),
(5, 5),
(5, 4),
(1, 4),
(2, 1),
(2, 4),
(2, 5),
(2, 2),
(4, 1),
(4, 2),
(6, 3),
(6, 1),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `project_supervisors`
--

CREATE TABLE IF NOT EXISTS `project_supervisors` (
  `project_id` int(10) unsigned NOT NULL,
  `supervisor_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_supervisors`
--

INSERT INTO `project_supervisors` (`project_id`, `supervisor_id`) VALUES
(6, 4),
(1, 4),
(1, 5),
(4, 4),
(4, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `project_updates`
--

CREATE TABLE IF NOT EXISTS `project_updates` (
`project_update_id` int(10) unsigned NOT NULL,
  `update_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `update_description` text COLLATE utf8_unicode_ci NOT NULL,
  `likes` int(10) unsigned NOT NULL DEFAULT '0',
  `update_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_updates`
--

INSERT INTO `project_updates` (`project_update_id`, `update_title`, `update_description`, `likes`, `update_picture`, `video_url`, `project_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, ' Governor Amechi is trying to build the longest ship in africa', 'You registered a new domain! That''s great. Good job. Now there''s all this technical stuff we need to tell you. Are you ready? Take a breath. Here it comes.\r\n\r\nSERIOUS BUSINESS. If you haven''t verified your contact info before, you will receive an email soon to verify your name and email address. Check your spam and all that, just in case. You''ll need to click the link in the email to keep your domain working properly.', 0, '1_update.jpg', 'http://www.youtube.com/watch?v=pf_Qv3q0M_c', 2, 1, '2015-08-21 11:11:14', '2015-08-21 11:11:23'),
(2, 'Roofing Complete', 'The roofing for the new school constructed by AT&T has been completed', 0, '2_update.jpg', '', 1, 7, '2015-08-21 16:31:54', '2015-08-21 16:32:02');

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE IF NOT EXISTS `ranks` (
`rank_id` int(10) unsigned NOT NULL,
  `rank` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_type_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`rank_id`, `rank`, `user_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Senate President', 3, '2015-08-25 08:53:03', '2015-08-25 08:53:03'),
(2, 'Deputy Senate President', 3, '2015-08-25 08:53:03', '2015-08-25 08:53:03'),
(3, 'Senate Majority Leader', 3, '2015-08-25 08:53:03', '2015-08-25 08:53:03'),
(4, 'Speaker Federal House', 4, '2015-08-25 15:45:03', '2015-08-25 15:45:03'),
(5, 'Speaker State House', 5, '2015-08-25 15:45:03', '2015-08-25 15:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `sectors`
--

CREATE TABLE IF NOT EXISTS `sectors` (
`sector_id` int(10) unsigned NOT NULL,
  `sector` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sectors`
--

INSERT INTO `sectors` (`sector_id`, `sector`, `created_at`, `updated_at`) VALUES
(1, 'Education', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Health', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Agriculture', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Telecommunication', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Commerce', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `senatorial_districts`
--

CREATE TABLE IF NOT EXISTS `senatorial_districts` (
`senatorial_district_id` int(10) unsigned NOT NULL,
  `senatorial_district` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `senatorial_district_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `senatorial_districts`
--

INSERT INTO `senatorial_districts` (`senatorial_district_id`, `senatorial_district`, `senatorial_district_code`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'ABIA NORTH ', 'SD/001/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'ABIA CENTRAL ', 'SD/002/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'ABIA SOUTH ', 'SD/003/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'AKWA IBOM NORTH EAST', 'SD/007/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'AKWA IBOM NORTH WEST ', 'SD/008/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'AKWA IBOM SOUTH ', 'SD/009/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'ADAMAWA NORTH', 'SD/004/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'ADAMAWA SOUTH ', 'SD/005/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'ADAMAWA CENTRAL', 'SD/006/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'ANAMBRA NORTH ', 'SD/010/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'ANAMBRA CENTRAL ', 'SD/011/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'ANAMBRA SOUTH ', 'SD/012/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'BAUCHI SOUTH ', 'SD/013/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'BAUCHI CENTRAL ', 'SD/014/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'BAUCHI NORTH ', 'SD/015/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'BAYELSA EAST', 'SD/016/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'BAYELSA CENTRAL ', 'SD/017/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'BAYELSA WEST ', 'SD/018/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'BENUE NORTH  EAST ', 'SD/019/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'BENUE NORTH WEST', 'SD/020/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'BENUE SOUTH', 'SD/021/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'BORNO NORTH', 'SD/022/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'BORNO CENTRAL', 'SD/023/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'BORNO SOUTH', 'SD/024/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'CROSS RIVER NORTH', 'SD/025/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'CROSS RIVER CENTRAL', 'SD/026/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'CROSS RIVER SOUTH', 'SD/027/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'DELTA CENTRAL', 'SD/028/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'DELTA NORTH', 'SD/029/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'DELTA SOUTH', 'SD/030/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'EBONYI NORTH', 'SD/031/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'EBONYI CENTRAL', 'SD/032/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'EBONYI  SOUTH', 'SD/033/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'EDO CENTRAL', 'SD/034/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'EDO NORTH', 'SD/035/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'EDO  SOUTH', 'SD/036/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'EKITI NORTH', 'SD/037/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'EKITI CENTRAL', 'SD/038/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'EKITI  SOUTH', 'SD/039/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'ENUGU EAST', 'SD/040/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'ENUGU WEST', 'SD/041/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'ENUGU  NORTH', 'SD/042/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'GOMBE CENTRAL', 'SD/043/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'GOMBE SOUTH', 'SD/044/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'GOMBE NORTH  ', 'SD/045/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'IMO EAST', 'SD/046/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'IMO WEST', 'SD/047/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'IMO NORTH  ', 'SD/048/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'JIGAWA SOUTH – WEST', 'SD/049/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'JIGAWA NORTH – EAST', 'SD/050/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'JIGAWA NORTH - WEST ', 'SD/051/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'KADUNA NORTH', 'SD/052/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'KADUNA CENTRAL', 'SD/053/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, '  KADUNA SOUTH', 'SD/054/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'KANO CENTRAL', 'SD/055/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'KANO NORTH', 'SD/056/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'KANO  SOUTH', 'SD/057/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'KATSINA NORTH', 'SD/058/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'KATSINA SOUTH', 'SD/059/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'KATSINA CENTRAL ', 'SD/060/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'KEBBI NORTH', 'SD/061/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'KEBBI CENTRAL', 'SD/062/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'KEBBI SOUTH', 'SD/063/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'KOGI CENTRAL', 'SD/064/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'KOGI EAST', 'SD/065/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'KOGI WEST', 'SD/066/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'KWARA NORTH', 'SD/067/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'KWARA CENTRAL', 'SD/068/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'KWARA SOUTH', 'SD/069/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'LAGOS CENTRAL', 'SD/070/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'LAGOS EAST', 'SD/071/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'LAGOS  WEST', 'SD/072/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'NASSARAWA NORTH', 'SD/073/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'NASSARAWA WEST', 'SD/074/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'NASSARAWA  SOUTH', 'SD/075/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'NIGER EAST', 'SD/076/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'NIGER NORTH', 'SD/077/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'NIGER SOUTH', 'SD/078/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'OGUN CENTRAL', 'SD/079/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'OGUN EAST', 'SD/080/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'OGUN WEST', 'SD/081/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'ONDO NORTH', 'SD/082/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'ONDO CENTRAL', 'SD/083/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'ONDO SOUTH', 'SD/084/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'OSUN CENTRAL', 'SD/085/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'OSUN EAST', 'SD/086/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'OSUN WEST', 'SD/087/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'OYO CENTRAL', 'SD/088/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'OYO NORTH', 'SD/089/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'OYO SOUTH', 'SD/090/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'PLATEAU SOUTH', 'SD/091/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'PLATEAU CENTRAL', 'SD/092/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'PLATEAU NORTH', 'SD/093/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'RIVERS EAST', 'SD/094/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'RIVERS SOUTH EAST', 'SD/095/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'RIVERS WEST', 'SD/096/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'SOKOTO EAST', 'SD/097/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'SOKOTO NORTH', 'SD/098/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'SOKOTO SOUTH', 'SD/099/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'TARABA SOUTH', 'SD/100/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'TARABA CENTRAL', 'SD/101/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'TARABA NORTH', 'SD/102/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'YOBE EAST', 'SD/103/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'YOBE NORTH', 'SD/104/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'YOBE SOUTH', 'SD/105/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'ZAMFARA NORTH', 'SD/106/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'ZAMFARA CENTRAL', 'SD/107/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'ZAMFARA WEST', 'SD/108/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'FEDERAL CAPITAL TERRITORY', 'SD/109/FCT', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `senators`
--

CREATE TABLE IF NOT EXISTS `senators` (
`senator_id` int(10) unsigned NOT NULL,
  `rank_id` int(10) unsigned NOT NULL,
  `senatorial_district_id` int(10) unsigned NOT NULL,
  `house_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `senators`
--

INSERT INTO `senators` (`senator_id`, `rank_id`, `senatorial_district_id`, `house_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 46, 1, 2, '2015-08-25 13:20:49', '2015-08-25 13:20:49'),
(3, 3, 54, 1, 2, '2015-08-25 13:33:56', '2015-08-27 08:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
`state_id` int(10) unsigned NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state_id`, `state`, `state_code`, `created_at`, `updated_at`) VALUES
(1, 'Abia', 'AB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Adamawa', 'AD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Akwa Ibom', 'AK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Anambra', 'AN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Bauchi', 'BA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Bayelsa', 'BY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Benue', 'BN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Borno', 'BO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Cross River', 'CR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Delta', 'DT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Ebonyi', 'EB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Edo', 'ED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Ekiti', 'EK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Enugu', 'EN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'FCT', 'FCT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Gombe', 'GM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Imo', 'IM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Jigawa', 'JG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Kaduna', 'KD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Kano', 'KN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Katsina', 'KT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Kebbi', 'KB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Kogi', 'KG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Kwara', 'KW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Lagos', 'LA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Nasarawa', 'NW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Niger', 'NG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Ogun', 'OG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Ondo', 'OD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Osun', 'OS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Oyo', 'OY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Plateau', 'PL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Rivers', 'RV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Sokoto', 'SO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Taraba', 'TR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Yobe', 'YB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Zamfara', 'ZF', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `state_constituencies`
--

CREATE TABLE IF NOT EXISTS `state_constituencies` (
`state_constituency_id` int(10) unsigned NOT NULL,
  `state_constituency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_constituency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=991 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `state_constituencies`
--

INSERT INTO `state_constituencies` (`state_constituency_id`, `state_constituency`, `state_constituency_code`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'ABA NORTH', 'SC/01/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'ABA SOUTH', 'SC/02/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'ABA CENTRAL', 'SC/03/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'AROCHUKWU', 'SC/04/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'BENDE NORTH', 'SC/05/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'BENDE SOUTH', 'SC/06/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'IKWUANO', 'SC/07/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'ISIALA NGWA NORTH', 'SC/08/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'ISIALA NGWA SOUTH', 'SC/09/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'ISUIKWUATO', 'SC/10/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'OBINGWA EAST', 'SC/11/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'OBINGWA WEST', 'SC/12/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'OHAFIA NORTH', 'SC/13/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'OHAFIA SOUTH', 'SC/14/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'OSISIOMA NORTH', 'SC/15/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'OSISIOMA SOUTH', 'SC/16/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'UMUNNEOCHI', 'SC/17/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'UGWUNA AGBO L.G.A', 'SC/18/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'UKWA EAST', 'SC/19/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'UKWA WEST', 'SC/20/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'UMUAHIA EAST', 'SC/21/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'UMUAHIA WEST', 'SC/22/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'UMUAHIA CENTRAL', 'SC/23/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'UMUAHIA SOUTH', 'SC/24/AB', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'YOLA SOUTH', 'SC/25/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'YOLA NORTH', 'SC/26/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'MUBI NORTH', 'SC/27/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'MUBI SOUTH', 'SC/28/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'DEMSA', 'SC/29/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'NUMAN', 'SC/30/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'LAMURDE', 'SC/31/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'SONG', 'SC/32/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'GIREI', 'SC/33/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'GANYE', 'SC/34/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'TOUNGO', 'SC/35/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'KOMA/LEKO', 'SC/36/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'JADA/MBULO', 'SC/37/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'FUFORE/GURIN', 'SC/38/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'VERRE', 'SC/39/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'UBA/GAYA', 'SC/40/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'HONG', 'SC/41/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'NASSARAWA/BINYERI', 'SC/42/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'MAYO-BELWA', 'SC/43/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'GOMBI', 'SC/44/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'SHELLENG', 'SC/45/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'MADAGALI', 'SC/46/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'MAIHA', 'SC/47/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'MICHIKA', 'SC/48/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'GUYUK', 'SC/49/AD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'AGUATA I', 'SC/76/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'AGUATA II', 'SC/77/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'ANAMBRA EAST', 'SC/78/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'ANAMBRA WEST', 'SC/79/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'ANAOCHA I', 'SC/80/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'ANAOCHA II', 'SC/81/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'AWKA NORTH', 'SC/82/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'AWKA SOUTH I', 'SC/83/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'AWKA SOUTH II', 'SC/84/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'IDEMILI SOUTH', 'SC/85/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'IDEMILI NORTH', 'SC/86/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'IHIALA I', 'SC/87/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'IHIALA II', 'SC/88/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'NJIKOKA I', 'SC/89/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'NJIKOKA II', 'SC/90/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'NNEWI NORTH', 'SC/91/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'NNEWI SOUTH I', 'SC/92/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'NNEWI SOUTH II', 'SC/93/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'EKWUSIGO', 'SC/94/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'OGBARU I', 'SC/95/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'OGBARU II', 'SC/96/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'AYAMELUM', 'SC/97/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'DUNUKOFIA', 'SC/98/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'ONITSHA NORTH I', 'SC/99/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'ONITSHA NORTH II', 'SC/100/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'ONITSHA SOUTH I', 'SC/101/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'ONITSHA SOUTH II', 'SC/102/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'ORUMBA NORTH', 'SC/103/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'ORUMBA SOUTH', 'SC/104/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'OYI', 'SC/105/AN', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'ABAK', 'SC/50/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'EKET', 'SC/51/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'ESSIEN UDIM', 'SC/52/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'ESIT EKET/IBENO', 'SC/53/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'ETIM EKPO/IKA', 'SC/54/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'ETINAN', 'SC/55/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'IBESIKPO ASUTAN', 'SC/56/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'IBIONO IBOM', 'SC/57/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'IKONO', 'SC/58/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'IKOT ABASI/ EASTERN OBOLO', 'SC/59/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'IKOT EKPENE/OBOT AKARA', 'SC/60/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'INI', 'SC/61/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'ITU', 'SC/62/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'MBO', 'SC/63/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'MKPAT ENIN', 'SC/64/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'NSIT ATAI', 'SC/65/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'NSIT IBOM', 'SC/66/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'NSIT UBIUM', 'SC/67/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'OKOBO', 'SC/68/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'ONNA', 'SC/69/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'ORON/UDUNG UKO', 'SC/70/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'ORUK ANAM', 'SC/71/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'UKANAFUN', 'SC/72/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'URUAN', 'SC/73/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'URUE OFFONG/ORUKO', 'SC/74/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'UYO', 'SC/75/AK', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'PALI', 'SC/106/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'DUGURI/GWANA', 'SC/107/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'KIRFI', 'SC/108/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'BAUCHI', 'SC/109/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'ZUNGUR/GALAMBI', 'SC/110/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'DASS', 'SC/111/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'LERE/BULA', 'SC/112/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'BOGORO', 'SC/113/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'JAMA’A/TORO', 'SC/114/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'WARJI', 'SC/115/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'LAME', 'SC/116/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'NINGI', 'SC/117/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'BURRA', 'SC/118/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'CHIROMA', 'SC/119/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'HARDAWA', 'SC/120/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'DAMBAM/DAGAUDA/JALAM', 'SC/121/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'DARAZO', 'SC/122/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'SADE', 'SC/123/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'GANJUWA EAST', 'SC/124/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'GANJUWA WEST', 'SC/125/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'KATAGUM', 'SC/126/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'SAKWA', 'SC/127/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'JAMA’ARE', 'SC/128/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'ITAS/GADAU', 'SC/129/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'DISINA', 'SC/130/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'SHIRA', 'SC/131/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'GIADE', 'SC/132/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'AZARE', 'SC/133/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'MADARA/CHINADE', 'SC/134/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'UDUBO', 'SC/135/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'GAMAWA', 'SC/136/BA', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'BRASS I', 'SC/137/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'BRASS II', 'SC/138/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'BRASS III', 'SC/139/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'NEMBE I', 'SC/140/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'NEMBE II', 'SC/141/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'NEMBE III', 'SC/142/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'OGBIA I', 'SC/143/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'OGBIA II', 'SC/144/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'OGBIA III', 'SC/145/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'KOLOKUMA/OPOKUMA I', 'SC/146/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'KOLOKUMA/OPOKUMA II', 'SC/147/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'YENAGOA I', 'SC/148/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'YENAGOA II', 'SC/149/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'YENAGOA III', 'SC/150/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'EKEREMOR I', 'SC/151/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'EKEREMOR II', 'SC/152/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'EKEREMOR III', 'SC/153/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'SAGBAMA I', 'SC/154/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'SAGBAMA II', 'SC/155/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'SAGBAMA III', 'SC/156/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'SOUTHERN IJAW I', 'SC/157/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'SOUTHERN IJAW II', 'SC/158/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'SOUTHERN IJAW III', 'SC/159/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'SOUTHERN IJAW IV', 'SC/160/BY', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'ADO', 'SC/161/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'AGBATU', 'SC/162/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'APA', 'SC/163/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'BURUKU', 'SC/164/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'GBOKO I (EAST)', 'SC/165/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'GBOKO WEST', 'SC/166/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'GUMA', 'SC/167/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'GWER EAST', 'SC/168/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'GWER WEST', 'SC/169/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'KATSINA ALA EAST', 'SC/170/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'KATSINA-ALA WEST', 'SC/171/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'KONSHISHA I (GAAV)', 'SC/172/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'KWANDE EAST', 'SC/173/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'KWANDE WEST', 'SC/174/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'LOGO', 'SC/175/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'MAKURDI I (NORTH)', 'SC/176/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'MAKURDI SOUTH', 'SC/177/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'OBI', 'SC/178/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'OGBADIBO', 'SC/179/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'OHIMINI', 'SC/180/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'OJU', 'SC/181/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'OKPOKWU', 'SC/182/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'OTUKPO', 'SC/183/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'OTUKPO NORTH EAST', 'SC/184/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'TARKA', 'SC/185/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'UKUM I (NGENEV)', 'SC/186/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'USHONGO', 'SC/187/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'VANDEIKYA I', 'SC/188/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'VANDEIKYA II', 'SC/189/BN', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'ABADAM', 'SC/190/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'ASKIRA', 'SC/191/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'BAMA', 'SC/192/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'BAYO', 'SC/193/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'BIU', 'SC/194/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'CHIBOK', 'SC/195/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'DAMABOA', 'SC/196/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'DIKWA', 'SC/197/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'GUBIO', 'SC/198/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'GULUMBA', 'SC/199/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'GUZAMALA', 'SC/200/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'GWOZA', 'SC/201/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'HAWUL', 'SC/202/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'JERE', 'SC/203/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'KAGA', 'SC/204/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'KALA BALGE', 'SC/205/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'KONDUGA', 'SC/206/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'KUKAWA', 'SC/207/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'KWAYA KUSAR', 'SC/208/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'MAFA', 'SC/209/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'MAGUMERI', 'SC/210/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'MAIDUGURI M.C', 'SC/211/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'MARTE', 'SC/212/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'MOBBAR', 'SC/213/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'MONGUNO', 'SC/214/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'NGALA', 'SC/215/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'NGANZAI', 'SC/216/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'SHANI', 'SC/217/BO', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'ABI', 'SC/218/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'AKAMKPA I', 'SC/219/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'AKAMKPA II', 'SC/220/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'AKPABUYO', 'SC/221/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'BAKASSI', 'SC/222/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'BIASE', 'SC/223/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'BOKI I', 'SC/224/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'BOKI II', 'SC/225/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'BEKWARRA', 'SC/226/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'CALABAR MUNICIPAL', 'SC/227/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'CALABAR SOUTH I', 'SC/228/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'CALABAR SOUTH II', 'SC/229/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'ETUNG', 'SC/230/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'IKOM I', 'SC/231/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'IKOM II', 'SC/232/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'OBANLEKU', 'SC/233/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'OBUBRA I', 'SC/234/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'OBUBRA II', 'SC/235/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'OBUDU', 'SC/236/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'ODUKPANI', 'SC/237/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'OGOJA', 'SC/238/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'YAKURR I', 'SC/239/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'YAKURR II', 'SC/240/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'YALA I', 'SC/241/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'YALA II', 'SC/242/CR', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'ANIOCHA NORTH', 'SC/243/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'ANIOCHA SOUTH', 'SC/244/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'BOMADI', 'SC/245/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'BURUTU ', 'SC/246/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'BURUTU NORTH', 'SC/247/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'ETHIOPE EAST', 'SC/248/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'ETHIOPE WEST', 'SC/249/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'IKA NORTH EAST', 'SC/250/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'IKA SOUTH', 'SC/251/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'ISOKO NORTH', 'SC/252/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'ISOKO SOUTH I', 'SC/253/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'ISOKO SOUTH II', 'SC/254/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'NDOKWA EAST', 'SC/255/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'NDOKWA WEST', 'SC/256/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'OKPE', 'SC/257/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'OSHIMILI NORTH', 'SC/258/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'OSHIMILI SOUTH', 'SC/259/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'PATANI', 'SC/260/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'SAPELE', 'SC/261/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'UDU', 'SC/262/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'UGHELLI NORTH I', 'SC/263/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'UGHELLI NORTH II', 'SC/264/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'UGHELLI SOUTH', 'SC/265/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'UKWUANI', 'SC/266/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'UVWIE', 'SC/267/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'WARRI NORTH', 'SC/268/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'WARRI SOUTH I', 'SC/269/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'WARRI SOUTH II', 'SC/270/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'WARRI SOUTH-WEST', 'SC/271/DT', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'ABAKALIKI NORTH', 'SC/272/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'ABAKALIKI SOUTH', 'SC/273/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'AFIKPO NORTH EAST', 'SC/274/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'AFIKPO NORTH WEST', 'SC/275/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'AFIKPO SOUTH EAST', 'SC/276/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'AFIKPO SOUTH WEST', 'SC/277/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'EBONYI NORTH EAST', 'SC/278/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'EBONYI NORTH WEST', 'SC/279/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'EZZA NORTH EAST', 'SC/280/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'EZZA NORTH WEST', 'SC/281/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'EZZA SOUTH', 'SC/282/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'IKWO NORTH', 'SC/283/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'IKWO SOUTH', 'SC/284/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'ISHIELU NORTH', 'SC/285/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'ISHIELU SOUTH', 'SC/286/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'IVO', 'SC/287/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'IZZI EAST', 'SC/288/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'IZZI WEST', 'SC/289/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'OHAOZARA EAST', 'SC/290/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'OHAOZARA WEST', 'SC/291/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'ONICHA EAST', 'SC/292/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'ONICHA WEST', 'SC/293/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'OHAUKWU NORTH', 'SC/294/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'OHAUKWU SOUTH', 'SC/295/EB', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'AKOKO EDO I', 'SC/296/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'AKOKO EDO II', 'SC/297/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'ESAN CENTRAL', 'SC/298/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 'ESAN WEST', 'SC/299/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 'ESAN NORTH EAST I', 'SC/300/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 'ESAN NORTH EAST II', 'SC/301/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 'ESSAN SOUTH EAST', 'SC/302/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 'ETSAKO CENTRAL', 'SC/303/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 'ETSAKO EAST', 'SC/304/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'ETSAKO WEST I', 'SC/305/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 'ETSAKO WEST II', 'SC/306/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 'EGOR', 'SC/307/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'IKPOBA - OKHA', 'SC/308/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 'IGUEBEN', 'SC/309/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'OREDO EAST', 'SC/310/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 'OREDO WEST', 'SC/311/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 'ORHIONMWON I', 'SC/312/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 'ORHIONMWON II', 'SC/313/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'OVIA NORTH EAST I', 'SC/314/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 'OVIA NORTH EAST II', 'SC/315/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'OVIA SOUTH WEST', 'SC/316/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'OWAN EAST', 'SC/317/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'OWAN WEST', 'SC/318/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'UHUNMWODE', 'SC/319/ED', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 'ADO I', 'SC/320/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 'ADO II', 'SC/321/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 'GBONYIN', 'SC/322/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 'EFON', 'SC/323/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 'EKITI EAST I', 'SC/324/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 'EKITI EAST II', 'SC/325/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 'EKITI WEST I', 'SC/326/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 'EKITI WEST II', 'SC/327/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 'EKITI SOUTH WEST I', 'SC/328/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 'EKITI SOUTH WEST II', 'SC/329/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 'EMURE', 'SC/330/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 'IDO/OSI I', 'SC/331/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 'IDO/OSI II', 'SC/332/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 'IJERO', 'SC/333/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 'IKERE I', 'SC/334/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 'IKERE II', 'SC/335/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 'IKOLE I', 'SC/336/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 'IKOLE II', 'SC/337/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 'ILEJEMEJE', 'SC/338/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 'IREPODUN/IFELODUN I', 'SC/339/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 'IREPODUN/IFELODUN II', 'SC/340/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 'ISE/ORUN', 'SC/341/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 'MOBA I', 'SC/342/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 'MOBA II', 'SC/343/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 'OYE I', 'SC/344/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 'OYE II', 'SC/345/EK', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 'ANINIRI', 'SC/346/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 'AWGU NORTH', 'SC/347/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 'AWGU SOUTH', 'SC/348/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 'ENUGU EAST I', 'SC/349/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 'ENUGU EAST II', 'SC/350/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 'ENUGU NORTH', 'SC/351/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 'ENUGU SOUTH I', 'SC/352/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 'ENUGU SOUTH II', 'SC/353/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 'EZEAGU', 'SC/354/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 'IGBO-ETITI EAST', 'SC/355/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 'IGBO-ETITI WEST', 'SC/356/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 'IGBO-EZE NORTH I', 'SC/357/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 'IGBO-EZE NORTH II', 'SC/358/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 'IGBO-EZE SOUTH', 'SC/359/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 'ISI-UZO', 'SC/360/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 'NKANU EAST', 'SC/361/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 'NKANU WEST', 'SC/362/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 'NSUKKA EAST', 'SC/363/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 'NSUKKA WEST', 'SC/364/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 'OJI RIVER', 'SC/365/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 'UDENU', 'SC/366/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 'UDI NORTH', 'SC/367/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 'UDI SOUTH', 'SC/368/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 'UZO UWANI', 'SC/369/EN', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 'AKKO WEST', 'SC/370/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 'AKKO CENTRAL', 'SC/371/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 'AKKO NORTH', 'SC/372/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 'BALANGA NORTH', 'SC/373/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 'BALANGA SOUTH', 'SC/374/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 'BILLIRI EAST', 'SC/375/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 'BILLIRI WEST', 'SC/076GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 'DUKKU NORTH', 'SC/377/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 'DUKKU SOUTH', 'SC/378/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 'FUNAKAYE NORTH', 'SC/379/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 'FUNAKAYE SOUTH', 'SC/380/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 'GOMBE NORTH', 'SC/381/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 'GOMBE SOUTH', 'SC/382/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 'KALTUNGO WEST', 'SC/383/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 'KALTUNGO EAST', 'SC/384/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 'NAFADA NORTH', 'SC/385/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 'NAFADA SOUTH', 'SC/386/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 'SHONGOM', 'SC/387/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 'PERO CHONGE', 'SC/388/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 'DEBA', 'SC/389/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 'YAMALTU EAST', 'SC/390/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 'YAMALTU WEST', 'SC/391/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 'KWAMI EAST', 'SC/392/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 'KWAMI WEST', 'SC/393/GM', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 'ABOH MBAISE', 'SC/394/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 'AHIAZU MBAISE', 'SC/395/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 'EHIME MBANO', 'SC/396/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 'EZINIHITTE', 'SC/397/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 'IDEATO NORTH', 'SC/398/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 'IDEATO SOUTH', 'SC/399/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 'IHITE/UBOMA', 'SC/400/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 'IKEDURU', 'SC/401/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 'ISIALA MBANO', 'SC/402/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 'ISU', 'SC/403/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 'MBAITOLI', 'SC/404/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 'NGOR OKPALA', 'SC/405/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 'NJABA', 'SC/406/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 'NWANGELE', 'SC/407/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 'NKWERRE', 'SC/408/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 'OBOWO', 'SC/409/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 'OGUTA', 'SC/410/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 'OHAJI/EGBEMA', 'SC/411/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 'OKIGWE', 'SC/412/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 'ONUIMO', 'SC/413/IM ', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 'ORLU', 'SC/414/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 'ORSU', 'SC/415/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 'ORU EAST', 'SC/416/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 'ORU WEST', 'SC/417/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 'OWERRI MUNICIPAL', 'SC/418/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 'OWERRI NORTH', 'SC/419/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 'OWERRI WEST', 'SC/420/IM', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 'AUYO', 'SC/421/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 'BABURA', 'SC/422/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 'KANYA', 'SC/423/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 'BIRNIN KUDU', 'SC/424/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 'BIRNIWA', 'SC/425/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 'BUJI', 'SC/426/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 'DUTSE', 'SC/427/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 'GAGARAWA', 'SC/428/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 'GARKI', 'SC/429/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 'GUMEL', 'SC/430/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 'GURI', 'SC/431/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 'GWARAM', 'SC/432/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 'FAGAM', 'SC/433/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 'GWIWA', 'SC/434/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 'HADEJIA', 'SC/435/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 'JAHUN', 'SC/436/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 'K/HAUSA', 'SC/437/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 'BULANGU', 'SC/438/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 'K/KASAMMA', 'SC/439/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 'KAUGAMA', 'SC/440/JG ', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 'KAZAURE', 'SC/441/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 'KIYAWA', 'SC/442/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 'MAIGATAR', 'SC/443/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 'M/MADORI', 'SC/444/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 'MIGA', 'SC/445/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 'RINGIN', 'SC/446/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 'RONI', 'SC/447/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 'S/TANKARA', 'SC/448/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 'TAURA', 'SC/449/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 'YANKWASHI', 'SC/450/JG', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 'BASAWA', 'SC/476/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 'CHAWAI/KAURU', 'SC/470/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 'CHIKUN I', 'SC/454/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 'CITY', 'SC/482/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 'DOKA', 'SC/466/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 'GIWA EAST', 'SC/455/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 'GIWA WEST', 'SC/456/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 'IGABI EAST', 'SC/457/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 'IGABI WEST', 'SC/458/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 'IKARA', 'SC/459/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 'JABA', 'SC/483/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 'JEMA’A', 'SC/461/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 'KACHIA', 'SC/463/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 'KAGARKO', 'SC/464/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 'KAJURU', 'SC/453/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 'KAKANGI', 'SC/452/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 'KAURA', 'SC/484/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 'KAWO/GABASAWA', 'SC/465/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 'KEWAYE', 'SC/481/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 'KUBAU', 'SC/460/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 'KUDAN', 'SC/473/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 'LERE', 'SC/471/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 'MAGAJIN GARI', 'SC/451/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 'MAIGANA', 'SC/477/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 'MAKARFI', 'SC/474/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 'MAKERA', 'SC/468/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 'SABON GARI', 'SC/475/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 'SAMINAKA', 'SC/472/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 'SANGA', 'SC/462/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 'SOBA', 'SC/478/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 'TUDUN WADA', 'SC/467/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 'UNGUWAR SANUSI', 'SC/469/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 'ZANGON KATAF', 'SC/479/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 'ZONKWA', 'SC/480/KD', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 'ALBASU', 'SC/485/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 'SHANONO/BAGWAI', 'SC/486/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 'BEBEJI', 'SC/487/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 'BICHI', 'SC/488/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 'BUNKURE', 'SC/489/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 'DALA', 'SC/490/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 'GWALE', 'SC/491/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 'DAMBATTA', 'SC/492/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, 'MAKODA', 'SC/493/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, 'DAWAKIN KUDU', 'SC/494/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, 'DAWAKIN TOFA', 'SC/495/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 'DOGUWA', 'SC/496/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 'GABASAWA', 'SC/497/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 'GAYA', 'SC/498/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 'AJINGI', 'SC/499/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, 'GEZAWA', 'SC/500/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 'GWARZO', 'SC/501/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, 'KABO', 'SC/502/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 'MUNICIPAL', 'SC/503/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 'TARAUNI', 'SC/504/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, 'KARAYE', 'SC/505/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, 'ROGO', 'SC/506/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, 'KIRU', 'SC/507/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, 'KUMBOTSO', 'SC/508/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 'KURA/GURUN MALLAM', 'SC/509/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 'MADOBI', 'SC/510/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, 'MINJIBIR', 'SC/511/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, 'NASSARAWA', 'SC/512/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, 'FAGGE', 'SC/513/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, 'RANO', 'SC/514/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 'KIBIYA', 'SC/515/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 'RIMI GADO/TOFA', 'SC/516/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, 'SUMAILA', 'SC/517/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, 'TAKAI', 'SC/518/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, 'TSANYAWA/KUNCHI', 'SC/519/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 'TUDUNWADA', 'SC/520/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 'UNGOGO', 'SC/521/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 'WARAWA', 'SC/522/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 'WUDIL', 'SC/523/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 'GARKO', 'SC/524/KN', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, 'BAKORI', 'SC/525/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, 'BAKORI II (TSIGA)', 'SC/526/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 'BATSARI', 'SC/527/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, 'BAURE', 'SC/528/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, 'BINDAWA', 'SC/529/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, 'CHARANCHI', 'SC/530/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 'DANDUME', 'SC/531/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 'DANJA', 'SC/532/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 'DANMUSA', 'SC/533/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 'DAURA', 'SC/534/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, 'DUTSI', 'SC/535/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, 'DUTSIN-MA', 'SC/536/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, 'FASKARI', 'SC/537/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 'FUNTUA', 'SC/538/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 'INGAWA', 'SC/539/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 'JIBIA', 'SC/540/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 'KAFUR', 'SC/541/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 'KAITA', 'SC/542/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 'KANKARA', 'SC/543/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 'KANKIA', 'SC/544/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 'KATSINA', 'SC/546/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 'KURFI', 'SC/547/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, 'KUSADA', 'SC/545/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, 'MAI’ADUA', 'SC/548/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, 'MALUMFASHI EAST', 'SC/549/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 'MANI', 'SC/550/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 'MASHI', 'SC/552/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 'MATAZU', 'SC/551/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, 'MUSAWA', 'SC/553/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, 'RIMI', 'SC/554/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, 'SABUWA', 'SC/555/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, 'SAFANA', 'SC/556/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, 'SANDAMU', 'SC/557/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 'ZANGO', 'SC/558/KT', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 'ALEIRO', 'SC/559/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, 'AREWA', 'SC/560/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, 'ARGUNGU', 'SC/561KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, 'AUGIE', 'SC/562/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, 'BAGUDO EAST', 'SC/563/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, 'BAGUDO WEST', 'SC/564/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, 'BIRNIN KEBBI NORTH', 'SC/565/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, 'BIRNIN KEBBI SOUTH', 'SC/566/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, 'BUNZA', 'SC/567/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, 'DANDI', 'SC/568/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, 'FAKAI', 'SC/569/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, 'GWANDU', 'SC/570/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, 'JEGA', 'SC/571/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, 'KALGO', 'SC/572/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, 'KOKO/BESSE', 'SC/573/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, 'MAIYAMA', 'SC/574/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, 'NGASKI', 'SC/575/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, 'SAKABA', 'SC/576/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, 'SHANGA', 'SC/577/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, 'SURU', 'SC/578/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, 'WASAGU/DANKO EAST', 'SC/579/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 'WASAGU/DANKO WEST', 'SC/580/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, 'YAURI', 'SC/581/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, 'ZURU', 'SC/582/KB', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, 'ADAVI', 'SC/583/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, 'AJAOKUTA', 'SC/584/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, 'ANKPA I', 'SC/585/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, 'ANKPA II', 'SC/586/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 'BASSA', 'SC/587/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 'DEKINA/BIRAIDU', 'SC/588/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 'OKURA', 'SC/589/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, 'IBAJI', 'SC/590/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, 'IDAH', 'SC/591/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, 'IGALAMELA-ODOLU', 'SC/592/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, 'IJUMU', 'SC/593/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 'KABBA/BUNU', 'SC/594/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, 'KOGI (K.K)', 'SC/595/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, 'LOKOJA I', 'SC/596/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, 'LOKOJA II', 'SC/597/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, 'MOPAMURO', 'SC/598/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, 'OFU', 'SC/599/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, 'OGORI/MAGONGO', 'SC/600/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, 'OKEHI', 'SC/601/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, 'OKENE TOWN', 'SC/602/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, 'OKENE II (SOUTH)', 'SC/603/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, 'OLAMABORO I', 'SC/604/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, 'OMALA', 'SC/605/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, 'YAGBA EAST', 'SC/606/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, 'YAGBA WEST', 'SC/607/KG', 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, 'AFON', 'SC/608/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, 'ONIRE/OWODE', 'SC/609/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, 'ILESHA/GWANARA', 'SC/610/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, 'OKUTA/AYASHKIRA', 'SC/611/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, 'LAFIAGI', 'SC/612/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, 'PATIGI', 'SC/613/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, 'EKITI', 'SC/614/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, 'OKE-ERO', 'SC/615/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, 'OMUPO', 'SC/616/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, 'SHARE/OKE-ODE', 'SC/617/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, 'ILORIN EAST', 'SC/618/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, 'ILORIN SOUTH', 'SC/619/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, 'ILORIN CENTRAL', 'SC/620/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `state_constituencies` (`state_constituency_id`, `state_constituency`, `state_constituency_code`, `state_id`, `created_at`, `updated_at`) VALUES
(621, 'ILORIN NORTH WEST', 'SC/621/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, 'IREPODUN', 'SC/622/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, 'ISIN', 'SC/623/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, 'GWANABE/ADENA/BANNI', 'SC/624/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, 'KAIAMA/WAJIBE/KEMANJI', 'SC/625/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, 'LANWA/EJIDONGARI', 'SC/626/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, 'OLORU/MALETE/IPAIYE', 'SC/627/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, 'BALOGUN/OJUMU', 'SC/628/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, 'SHAWO/ESSA', 'SC/629/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, 'ODO-OGUN', 'SC/630/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, 'OKE-OGUN', 'SC/631/KW', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, 'AGEGE I', 'SC/632/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, ' AGEGE II', 'SC/633/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, 'AJEROMI/IFELODUN I', 'SC/634/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, 'AJEROMI/IFELODUN II', 'SC/635/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, 'ALIMOSHO I', 'SC/636/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, 'ALIMOSHO II', 'SC/637/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, 'AMUWO ODOFIN I', 'SC/638/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, 'AMUWO ODOFIN II', 'SC/639/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, 'APAPA I', 'SC/640/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, 'APAPA II', 'SC/641/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, 'BADAGRY I', 'SC/642/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 'BADAGRY II', 'SC/643/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, 'EPE I', 'SC/644/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, 'EPE II', 'SC/645/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, 'ETI-OSA I', 'SC/646/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, 'ETI-OSA II', 'SC/647/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, 'IBEJU-LEKKI I', 'SC/648/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, 'IBEJU-LEKKI II', 'SC/649/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, 'IFAKO / IJAIYE I', 'SC/650/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, 'IFAKO / IJAIYE II', 'SC/651/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, 'IKEJA I', 'SC/652/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, 'IKEJA II', 'SC/653/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, 'IKORODU I', 'SC/654/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, 'IKORODU II', 'SC/655/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, 'KOSOFE I', 'SC/656/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, 'KOSOFE II', 'SC/657/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, 'LAGOS ISLAND I', 'SC/658/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, 'LAGOS ISLAND II', 'SC/659/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, 'LAGOS MAINLAND I', 'SC/660/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 'LAGOS MAINLAND II', 'SC/661/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, 'MUSHIN I ', 'SC/662/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, 'MUSHIN II', 'SC/663/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(664, 'OJO I', 'SC/664/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, 'OJO II', 'SC/665/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, 'OSHODI/ISOLO I', 'SC/666/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, 'OSHODI/ISOLO II', 'SC/667/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, 'SHOMOLU I', 'SC/668/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, 'SHOMOLU II', 'SC/669/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, 'SURULERE I', 'SC/670/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, 'SURULERE II ', 'SC/671/LA', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, 'AKWANGA NORTH', 'SC/672/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, 'AKWANGA SOUTH', 'SC/673/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, 'AWE NORTH', 'SC/674/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, 'AWE SOUTH', 'SC/675/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, 'DOMA NORTH', 'SC/676/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, 'DOMA SOUTH', 'SC/677/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, 'KARU/GITATA', 'SC/678/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, 'KARSHI/UKE', 'SC/679/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, 'KEANA', 'SC/680/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, 'KEFFI WEST', 'SC/681/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, 'KEFFI EAST', 'SC/682/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, 'KOKONA EAST', 'SC/683/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, 'KOKONA WEST', 'SC/684/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, 'LAFIA CENTRAL', 'SC/685/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, 'LAFIA NORTH', 'SC/686/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, 'NASSARAWA', 'SC/687/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, 'LOKI/UDEGE', 'SC/688/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, 'NASS-EGGON WEST', 'SC/689/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, 'NASS-EGGON EAST', 'SC/690/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, 'OBI I', 'SC/691/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, 'OBI II', 'SC/692/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, 'GADABUKE/TOTO', 'SC/693/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, 'UMAISHA', 'SC/694/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 'WAMBA', 'SC/695/NW', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 'AGAIE', 'SC/696/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, 'AGWARA', 'SC/697/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, 'BIDA I', 'SC/698/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, 'BIDA II', 'SC/699/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, 'BORGU', 'SC/700/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, 'BOSSO', 'SC/701/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, 'CHANCHANGA', 'SC/702/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, 'EDATTI', 'SC/703/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, 'GBAKO', 'SC/704/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, 'GURARA', 'SC/705/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 'KATCHA', 'SC/706/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, 'KONTAGORA I', 'SC/707/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, 'KOTANGORA II', 'SC/708/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, 'LAPAI', 'SC/709/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, 'LAVUN', 'SC/710/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, 'MAGAMA', 'SC/711/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, 'MARIGA', 'SC/712/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, 'MASHEGU', 'SC/713/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, 'MOKWA', 'SC/714/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, 'MUNYA', 'SC/715/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, 'PAIKORO', 'SC/716/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, 'RAFI', 'SC/717/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, 'RIJAU', 'SC/718/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, 'SHIRORO', 'SC/719/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, 'SULEJA', 'SC/720/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, 'TAPA', 'SC/721/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, 'WUSHISHI', 'SC/722/NG', 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 'ABEOKUTA SOUTH I', 'SC/723/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, 'ABEOKUTA SOUTH II', 'SC/724/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, 'ODEDA AREA', 'SC/725/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, 'ABEOKUTA NORTH', 'SC/726/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, 'OBAFEMI/OWODE', 'SC/727/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, 'IFO I', 'SC/728/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, 'IFO II', 'SC/729/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 'EWEKORO/ITORI/ELERE-ADUBI', 'SC/730/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, 'IJEBU NORTH I (IJEBU-IGBO)', 'SC/731/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, 'IJEBU NORTH II (AGO-IWOYE/ ORU/AWA', 'SC/732/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, 'IJEBU EAST AREA', 'SC/733/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, 'OGUN WATERSIDE (ABIGI/IBIADE/IWOPIN/ONI)', 'SC/734/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, 'IJEBU-ODE', 'SC/735/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, 'ODOGBOLU (ALEKKUN-IFESOWAPO/LAPORU', 'SC/736/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, 'IJEBU NORTH EAST ILUGUN-ALARO', 'SC/737/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, 'SAGAMU I OFFIN', 'SC/738/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, 'SAGAMU II MAKUN', 'SC/739/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 'IKENNE (IREPODUN)', 'SC/740/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, 'REMO NORTH (IDARAPO)', 'SC/941/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, 'IMEKO-AFON', 'SC/742/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, 'EGBADO NORTH I', 'SC/743/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, 'EGBADO NORTH II', 'SC/744/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, 'IDIROKO IPOKIA', 'SC/745/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 'EGBADO SOUTH (ILARO/OWODE)', 'SC/746/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, 'ADO/ODO/OTA I', 'SC/747/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, 'ADO-ODO/OTA II', 'SC/748/OG', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, 'AKOKO NORTH EAST', 'SC/749/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, 'AKOKO NORTH WEST I', 'SC/750/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, 'AKOKO NORTH WEST II', 'SC/751/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, 'AKOKO SOUTH EAST', 'SC/752/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 'AKOKO SOUTH WEST I', 'SC/753/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, 'AKOKO SOUTH WEST II', 'SC/754/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, 'AKURE NORTH', 'SC/755/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, 'AKURE SOUTH I', 'SC/756/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, 'AKURE SOUTH II', 'SC/757/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, 'ESE ODO', 'SC/758/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, 'IDANRE', 'SC/759/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, 'IFEDORE', 'SC/760/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, 'ILAJE I', 'SC/761/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, 'ILAJE II', 'SC/762OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, 'ILEOLUJI/OKEIGBO', 'SC/763/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 'IRELE', 'SC/764/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, 'ODIGBO I', 'SC/765/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 'ODIGBO II', 'SC/766/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 'OKITIPUPA I', 'SC/767/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, 'OKITIPUPA II', 'SC/768/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, 'ONDO EAST', 'SC/769/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, 'ONDO WEST I', 'SC/770/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, 'ONDO WEST II', 'SC/771/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, 'ESE', 'SC/772/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, 'OWO I', 'SC/773/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, 'OWO II', 'SC/774/OD', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(775, 'BORIPE/BOLUWA-DURO', 'SC/775/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, 'IFELODUN', 'SC/776/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, 'ILA', 'SC/777/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(778, 'IFEDAYO', 'SC/778/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(779, 'IREPODUN/ORULU', 'SC/779/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(780, 'ODO-OTIN', 'SC/780/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(781, 'OLORUNDA', 'SC/781/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, 'OSOGBO', 'SC/782/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, 'ATAKUNMOSA EAST AND WEST', 'SC/783/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(784, 'IFE CENTRAL', 'SC/784/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(785, 'IFE EAST', 'SC/785/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(786, 'IFE NORTH', 'SC/786/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(787, 'IFE SOUTH', 'SC/787/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(788, 'ILESA EAST', 'SC/788/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(789, 'ILESA WEST', 'SC/789/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(790, 'OBOKUN', 'SC/790/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(791, 'ORIADE', 'SC/791/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, 'AYEDADE', 'SC/792/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, 'AYEDIRE', 'SC/793/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(794, 'EDE NORTH', 'SC/794/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(795, 'EDE SOUTH', 'SC/795/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(796, 'EGBEDORE', 'SC/796/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(797, 'IREWOLE/ISOKAN', 'SC/797/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(798, 'IWO', 'SC/798/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(799, 'OLA-OLUWA', 'SC/799/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(800, 'EJIGBO', 'SC/800/OS', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(801, 'AFIJIO', 'SC/801/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(802, 'AKINYELE I', 'SC/802/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(803, 'AKINYELE II', 'SC/803/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(804, 'SAKI WEST', 'SC/804/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(805, 'IBADAN NORTH WEST', 'SC/805/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(806, 'EGBEDA', 'SC/806/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, 'IBADAN NORTH I', 'SC/807/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(808, 'IBADAN NORTH II', 'SC/808/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, 'IBADAN NORTH EAST I', 'SC/809/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(810, 'IBADAN NORTH-EAST II', 'SC/810/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(811, 'IBADAN SOUTH-EAST I', 'SC/811/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(812, 'IBADAN SOUTH-EAST II', 'SC/812/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(813, 'IBADAN SOUTH-WEST I', 'SC/813/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(814, 'IBADAN SOUTH WEST II', 'SC/814/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(815, 'IBARAPA NORTH & IBARAPA CENTRAL', 'SC/815/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(816, 'IBARAPA EAST', 'SC/816/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(817, 'IDO', 'SC/817/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, 'SAKI EAST AND ATISBO', 'SC/818/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, ' IREPO & OLORUNSOGO', 'SC/819/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(820, 'ISEYIN AND ITESIWAJU', 'SC/820/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(821, 'KAJOLA', 'SC/821/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(822, 'IWAJOWA', 'SC/822/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(823, 'LAGELU', 'SC/823/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(824, 'OGBOMOSO NORTH', 'SC/824/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, 'OGBOMOSO SOUTH', 'SC/825/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, 'OLUYOLE', 'SC/826/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(827, 'ONA-ARA', 'SC/827/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(828, 'OORELOPE', 'SC/828/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(829, 'ORIIRE', 'SC/829/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(830, 'ATIBA', 'SC/830/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(831, 'OYO WEST & OYO EAST', 'SC/831/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(832, 'OGO-OLUWA AND SURULERE', 'SC/832/OY', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(833, 'BARKIN LADI', 'SC/833/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(834, 'PENGANA', 'SC/834/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(835, 'RUKUBA/IRIGWE', 'SC/835/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(836, 'BOKKOS', 'SC/836/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(837, 'JOS EAST', 'SC/837/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(838, 'JOS NORTH', 'SC/838/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(839, 'JOS WEST', 'SC/839/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(840, 'JOS SOUTH', 'SC/840/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(841, 'KANKE', 'SC/841/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(842, 'PANKSHIN NORTH', 'SC/842/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(843, 'PANKSHIN SOUTH', 'SC/843/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(844, 'KANAM', 'SC/844/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(845, 'KANTANA', 'SC/845/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(846, 'LANGTANG NORTH', 'SC/846/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(847, 'LANGTANG CENTRAL', 'SC/847/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(848, 'LANGTANG SOUTH (MABUDI)', 'SC/848/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(849, 'MANGU SOUTH', 'SC/849/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(850, 'MANGU NORTH', 'SC/850/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(851, 'MIKANG', 'SC/851/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(852, 'QUA’AN PAN NORTH', 'SC/852/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(853, 'QUA’AN PAN SOUTH', 'SC/853/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(854, 'RIYOM', 'SC/854/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(855, 'SHENDAM', 'SC/855/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(856, 'WASE', 'SC/856/PL', 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(857, 'ABUA/ODUAL', 'SC/857/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(858, 'AHOADA EAST I', 'SC/858/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(859, 'AHOADA EAST II', 'SC/859/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(860, 'AHOADA WEST', 'SC/860/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(861, 'AKUKU-TORU I', 'SC/861/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(862, 'AKUKU-TORU II', 'SC/862/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(863, 'ANDONI I', 'SC/863/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(864, 'ASARI-TORU I', 'SC/864/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(865, 'ASARI-TORU II', 'SC/865/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(866, 'BONNY', 'SC/866/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(867, 'DEGEMA', 'SC/867/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(868, 'EMOHUA', 'SC/868/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(869, 'ELEME', 'SC/869/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(870, 'ETCHE I', 'SC/870/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(871, 'ETCHE II', 'SC/871/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(872, 'GOKANA', 'SC/872/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(873, 'IKWERE I', 'SC/873/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(874, 'KHANA I', 'SC/874/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(875, 'KHANA II', 'SC/875/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(876, 'OBIO/AKPOR I', 'SC/876/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(877, 'OBIO/AKPOR II', 'SC/877/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(878, '(OGBA/EGBEMA/NDONI) ONELGA I', 'SC/878/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(879, 'ONELGA II', 'SC/879/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(880, 'OGU/BOLO', 'SC/880/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(881, 'OKRIKA', 'SC/881/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(882, 'OMUMA', 'SC/882/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(883, 'OPOBO/NKORO', 'SC/883/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(884, 'OYIGBO', 'SC/884/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(885, 'PORT-HARCOURT I', 'SC/885/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(886, 'PORT-HARCOURT II', 'SC/886/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(887, 'PORT-HARCOURT III', 'SC/887/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(888, 'TAI', 'SC/888/RV', 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(889, 'BINJI', 'SC/889/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(890, 'BODINGA NORTH', 'SC/890/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(891, 'BODINGA SOUTH', 'SC/891/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(892, 'DANGE SHUNI', 'SC/892/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(893, 'GADA EAST', 'SC/893/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(894, 'GADA WEST', 'SC/894/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(895, 'GORONYO', 'SC/895/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(896, 'GUDU', 'SC/896/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(897, 'GWADABAWA NORTH', 'SC/897/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(898, 'GWADABAWA SOUTH', 'SC/898/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(899, 'ILLELA', 'SC/899/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, 'ISA', 'SC/900/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(901, 'KWARE', 'SC/901/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(902, 'KEBBE', 'SC/902/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(903, 'RABAH', 'SC/903/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(904, 'SABON BIRIN NORTH', 'SC/904/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(905, 'SABON BIRIN SOUTH', 'SC/905/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(906, 'SHAGARI', 'SC/906/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(907, 'SILAME', 'SC/907/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(908, 'SOKOTO NORTH', 'SC/908/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(909, 'SOKOTO NORTH II', 'SC/909/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(910, 'SOKOTO SOUTH I', 'SC/910/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(911, 'SOKOTO SOUTH II', 'SC/911/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(912, 'TAMBUWAL WEST', 'SC/912/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(913, 'TAMBUWAL EAST', 'SC/913/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(914, 'TANGAZA', 'SC/914/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(915, 'TURETA', 'SC/915/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(916, 'WAMAKKO', 'SC/916/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(917, 'WURNO', 'SC/917/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(918, 'YABO', 'SC/918/SO', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(919, 'BALI I', 'SC/919/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(920, 'BALI II', 'SC/920/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(921, 'GASSOL I', 'SC/921/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(922, 'GASSOL II', 'SC/922/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(923, 'JALINGO I', 'SC/923/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(924, 'JALINGO II', 'SC/924/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(925, 'ARDO-KOLA', 'SC/925/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(926, 'TAKUM I', 'SC/926/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(927, 'KASHIMBILA', 'SC/927/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(928, 'USSA/LIKAM', 'SC/928/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(929, 'GEMBU', 'SC/929/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(930, 'NGUROJE', 'SC/930/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(931, 'MBAMNGA', 'SC/931/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(932, 'BAISSA', 'SC/932/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(933, 'ZING', 'SC/933/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(934, 'KARIM LAMIDO I', 'SC/934/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(935, 'KARIM LAMIDO II', 'SC/935/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(936, 'WUKARI I', 'SC/936/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(937, 'WUKARI II', 'SC/937/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(938, 'IBI', 'SC/938/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(939, 'DONDA', 'SC/939/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(940, 'GASHAKA', 'SC/940/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(941, 'LAU', 'SC/941/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(942, 'YORRO', 'SC/942/TR', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(943, 'BADE EAST', 'SC/943/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(944, 'BADE WEST', 'SC/944/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(945, 'BURSARI', 'SC/945/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(946, 'DAMATURU I', 'SC/946/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(947, 'DAMATURU II', 'SC/947/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(948, 'FIKA/NGALDA', 'SC/948/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(949, 'GOYA/NGEJI', 'SC/949/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(950, 'DAMAGUM', 'SC/950/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(951, 'JAJERE', 'SC/951/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(952, 'GEIDAM SOUTH', 'SC/952/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(953, 'GEIDAM NORTH', 'SC/953/YB ', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(954, 'GUJBA', 'SC/954/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(955, 'GULANI', 'SC/955/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(956, 'JAKUSKO', 'SC/956/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(957, 'KARASUWA', 'SC/957/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(958, 'MACHINA', 'SC/958/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(959, 'NANGERE', 'SC/959/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(960, 'NGURU I', 'SC/960/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(961, 'NGURU II', 'SC/961/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(962, 'POTISKUM TOWN', 'SC/962/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(963, 'MAMUDO', 'SC/963/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(964, 'TARMUWA', 'SC/964/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(965, 'YUNUSARI', 'SC/965/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(966, 'YUNUFARI', 'SC/966/YB', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(967, 'K/NAMODA NORTH', 'SC/967/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(968, 'K/NAMODA SOUTH', 'SC/968/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(969, 'BIRNIN MAGAJI', 'SC/969/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(970, 'ZURMI EAST', 'SC/970/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(971, 'ZURMI WEST', 'SC/971/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(972, 'SHINKAFI', 'SC/972/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(973, 'TSAFE EAST', 'SC/973/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(974, 'TSAFE WEST', 'SC/974/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(975, 'GUSAU I', 'SC/975/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(976, 'GUSAU II', 'SC/976/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(977, 'BUNGUDU EAST', 'SC/977/ZF ', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(978, 'BUNGUDU WEST', 'SC/978/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(979, 'MARU NORTH', 'SC/979/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(980, 'MARU SOUTH', 'SC/980/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(981, 'ANKA', 'SC/981/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(982, 'T/MAFARA NORTH', 'SC/982/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(983, 'T/MAFARA SOUTH', 'SC/983/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(984, 'BAKURA', 'SC/984/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(985, 'MARADUN I', 'SC/985/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(986, 'MARADUN II', 'SC/986/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(987, 'GUMMI I', 'SC/987/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(988, 'GUMMI II', 'SC/988/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(989, 'BUKKUYUM NORTH', 'SC/989/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(990, 'BUKKUYUM SOUTH', 'SC/990/ZF', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `state_representatives`
--

CREATE TABLE IF NOT EXISTS `state_representatives` (
`state_rep_id` int(10) unsigned NOT NULL,
  `rank_id` int(10) unsigned NOT NULL,
  `state_constituency_id` int(10) unsigned NOT NULL,
  `house_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `state_representatives`
--

INSERT INTO `state_representatives` (`state_rep_id`, `rank_id`, `state_constituency_id`, `house_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, 209, 4, 5, '2015-08-25 15:45:29', '2015-08-25 15:45:29'),
(3, 5, 612, 4, 7, '2015-08-25 15:57:55', '2015-08-25 15:57:55'),
(4, 5, 625, 4, 6, '2015-08-27 08:16:11', '2015-08-27 08:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu_items`
--

CREATE TABLE IF NOT EXISTS `sub_menu_items` (
`sub_menu_item_id` int(10) unsigned NOT NULL,
  `sub_menu_item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sub_menu_item_url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sub_menu_item_icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(10) unsigned NOT NULL DEFAULT '1',
  `sequence` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_item_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_menu_items`
--

INSERT INTO `sub_menu_items` (`sub_menu_item_id`, `sub_menu_item`, `sub_menu_item_url`, `sub_menu_item_icon`, `active`, `sequence`, `menu_item_id`, `created_at`, `updated_at`) VALUES
(1, 'Senators', '/senators', 'fa fa-list-alt', 1, '1', 25, '2015-08-25 12:33:15', '2015-08-25 14:05:52'),
(4, 'Federal Reps.', '/federal-reps', 'fa fa-group', 1, '2', 25, '2015-08-25 12:38:51', '2015-08-25 15:29:40'),
(5, 'State Reps.', '/state-reps', 'fa fa-table', 1, '3', 25, '2015-08-25 14:05:53', '2015-08-25 15:29:40'),
(6, 'Menus', '/menus', 'fa fa-list-alt', 1, '1', 26, '2015-08-25 14:15:12', '2015-08-25 14:15:12'),
(7, 'Menu Items', '/menu-items', 'fa fa-list-alt', 1, '2', 26, '2015-08-25 14:15:12', '2015-08-27 07:38:45'),
(8, 'Sub Menu Item', '/sub-menu-items', 'fa fa-list-alt', 1, '3', 26, '2015-08-25 14:15:12', '2015-08-25 14:18:30'),
(9, 'Register Users', '/users/create', 'fa fa-user', 1, '1', 27, '2015-08-25 14:18:30', '2015-08-25 14:18:30'),
(10, 'User Types', '/user-types', 'fa fa-list-alt', 1, '2', 27, '2015-08-25 14:21:10', '2015-08-25 14:21:10'),
(11, 'House', '/houses', 'fa fa-list-alt', 1, '4', 25, '2015-08-25 14:23:21', '2015-08-25 14:23:21'),
(12, 'Project Sectors', '/sectors', 'fa fa-list-alt', 1, '1', 28, '2015-08-25 14:28:05', '2015-08-25 14:28:05'),
(13, 'Ranks', '/ranks', 'fa fa-list-alt', 1, '2', 28, '2015-08-25 14:28:53', '2015-08-25 14:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `sub_users`
--

CREATE TABLE IF NOT EXISTS `sub_users` (
`sub_user_id` int(10) unsigned NOT NULL,
  `parent_user_id` int(10) unsigned NOT NULL,
  `child_user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_users`
--

INSERT INTO `sub_users` (`sub_user_id`, `parent_user_id`, `child_user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2015-08-20 07:47:55', '2015-08-20 07:47:55'),
(2, 2, 4, '2015-08-20 10:33:55', '2015-08-20 10:33:55'),
(3, 2, 5, '2015-08-20 12:06:35', '2015-08-20 12:06:35'),
(4, 2, 6, '2015-08-20 18:31:38', '2015-08-20 18:31:38'),
(5, 2, 7, '2015-08-21 16:21:18', '2015-08-21 16:21:18');

-- --------------------------------------------------------

--
-- Table structure for table `time_lines`
--

CREATE TABLE IF NOT EXISTS `time_lines` (
`time_line_id` int(10) unsigned NOT NULL,
  `object_id` int(11) NOT NULL,
  `active` int(10) unsigned NOT NULL DEFAULT '1',
  `object_type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `time_lines`
--

INSERT INTO `time_lines` (`time_line_id`, `object_id`, `active`, `object_type_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2015-08-21 11:11:14', '2015-08-21 11:11:14'),
(2, 2, 1, 2, '2015-08-21 16:31:54', '2015-08-21 16:31:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(10) unsigned NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lga_id` int(10) unsigned NOT NULL,
  `verified` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `verification_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password`, `email`, `first_name`, `last_name`, `middle_name`, `gender`, `phone_no`, `dob`, `avatar`, `lga_id`, `verified`, `status`, `verification_code`, `user_type_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '$2y$10$jnti49lTIq23Pak9Xo3jSO7RnzSo5UwSyS4NugRqIMI7oCw7PCHVW', 'admin@gmail.com', 'Emmanuel', 'Okafor', '', 'Male', '08063782033', NULL, 'uploads/avartars/1_avartar.jpg', 80, 1, 1, '', 1, 'gVgtTivNtS1ME9ueneXo6xzu5NbnkY4D5lZXNn9eJdHwyXfvD7H9YW5pAQPu', '0000-00-00 00:00:00', '2015-08-21 08:50:42'),
(2, '$2y$10$hW6o/LX6/Yl3M1jzJBVv1ebL3b0unT2Ms7pt/f0GPS4EJTjymG2iK', 'senator@gmail.com', 'Kingsley', 'Chinaka', '', 'Male', '08030734377', '1988-05-05', 'uploads/avartars/2_avartar.jpg', 295, 1, 1, '4hwUgWnofDCeuNGpG0lDUAEzijsuxA0HE58dwO39', 3, 'yBHha2iBdM36XnzqCBCN1yZafAcohL8QvhCc59rLlRQhswj2WqTaR2ysPdGu', '0000-00-00 00:00:00', '2015-08-25 11:37:47'),
(3, '$2y$10$ehWITh2QOkVoLGSB2qwi/OAbqaEW3eQbW7PD6sXLos3z1Rxku2ygC', 'john@doe.doe', 'John', 'Doe', NULL, NULL, '08392030330', NULL, NULL, 0, 1, 0, '7oP6G4kvTozZDQ4Yk5SNU9ayqZsRfjpNXLCIufGF', 4, 'N7WLgQbY5IX6pVrWIr5OJuVVjmP5IXmFbkCdA83MrVMtMCzWT1kQ0ei3Vfrt', '2015-08-20 07:47:55', '2015-08-20 10:52:14'),
(4, '$2y$10$fs6lSpm8MTvaAlhweL/vt.Iu17aKXx8qqyeprFbzb0rjXulCxZa6G', 'janet@jane.juliet', 'Jane', 'Janet ', NULL, NULL, '08030734377', NULL, NULL, 0, 1, 1, 'TNDEh1N3vBwBQzxwNDStOT7VQovgqz7rwvd4SkaK', 4, NULL, '2015-08-20 10:33:55', '2015-08-20 10:51:38'),
(5, '$2y$10$yDt8FplYfNhTdT6UOAbVCOeW7nh6KNKWjRjrfX4tjIqHmdRrEkThC', 'jackson@gmail.com', 'Jackson', 'Martinez', NULL, NULL, '01893044554', NULL, NULL, 0, 1, 1, 'Y96tQX8Qgb74506QV441A8NYfPV9P4tlEtRSFHBz', 5, 'janjI6KOjCMMbZeKqnstRqNzjYCAU6vtoZx3A1DgQ3Xq9fRxrtDCyt9QgbGX', '2015-08-20 12:06:35', '2015-08-20 18:34:54'),
(6, '$2y$10$PjQxcB3GAUV0OZCvlH4aPu5a1bqSw.peIHXDRo8M2SqYcFCIs1yF6', 'kingsley4united@yahoo.com', 'Manuel', 'Alhassan', NULL, NULL, '093846494749', NULL, NULL, 0, 1, 1, 'YbosYXzA4tU9qx1Fgx56Qy9qzDvPiaEHDSESKln5', 5, 'ZFbPbF1dOXDE9ZJOdZzv7Xn7gAiWv8pBXbdGYF5ExjsumdscwsPMzXIZmXwH', '2015-08-20 18:31:38', '2015-08-21 13:19:58'),
(7, '$2y$10$A7GAhnsd2UAbVAMGx7OSbeT3x8qDG.6mga0lQ7gx/hIsZKUYRHSqi', 'rawoseyin@yahoo.com', 'Richard', 'Awoseyin', 'Oluwatoyin', 'Male', '08037253034', '2015-08-14', NULL, 497, 1, 1, '8OvdIMRTl4btIMuk87wYLWh97PP5lmhv97tYVAKm', 5, NULL, '2015-08-21 16:21:11', '2015-08-21 16:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE IF NOT EXISTS `user_types` (
`user_type_id` int(10) unsigned NOT NULL,
  `user_type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`user_type_id`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 'President', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Governor', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Senators', '0000-00-00 00:00:00', '2015-08-25 09:20:52'),
(4, 'Federal Representatives', '0000-00-00 00:00:00', '2015-08-25 15:33:00'),
(5, 'State Representatives', '2015-08-25 09:20:52', '2015-08-25 15:33:00'),
(20, 'Supervisor', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
 ADD PRIMARY KEY (`app_user_id`), ADD UNIQUE KEY `app_users_email_unique` (`email`), ADD KEY `app_users_lga_id_index` (`lga_id`);

--
-- Indexes for table `assemblies`
--
ALTER TABLE `assemblies`
 ADD PRIMARY KEY (`assembly_id`);

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
 ADD PRIMARY KEY (`beneficiary_id`), ADD KEY `beneficiaries_project_id_index` (`project_id`);

--
-- Indexes for table `constituencies`
--
ALTER TABLE `constituencies`
 ADD PRIMARY KEY (`constituency_id`), ADD KEY `constituencies_senatorial_district_id_index` (`senatorial_district_id`);

--
-- Indexes for table `contractors`
--
ALTER TABLE `contractors`
 ADD PRIMARY KEY (`contractor_id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
 ADD PRIMARY KEY (`domain_id`), ADD KEY `domains_lga_id_index` (`lga_id`), ADD KEY `domains_project_id_index` (`project_id`);

--
-- Indexes for table `federal_constituencies`
--
ALTER TABLE `federal_constituencies`
 ADD PRIMARY KEY (`federal_constituency_id`), ADD KEY `federal_constituencies_state_id_index` (`state_id`);

--
-- Indexes for table `federal_representatives`
--
ALTER TABLE `federal_representatives`
 ADD PRIMARY KEY (`federal_rep_id`), ADD KEY `federal_representatives_rank_id_index` (`rank_id`), ADD KEY `federal_representatives_federal_constituency_id_index` (`federal_constituency_id`), ADD KEY `federal_representatives_federal_rep_house_id_index` (`house_id`), ADD KEY `federal_representatives_user_id_index` (`user_id`);

--
-- Indexes for table `hansards`
--
ALTER TABLE `hansards`
 ADD PRIMARY KEY (`hansard_id`);

--
-- Indexes for table `hansard_roll_calls`
--
ALTER TABLE `hansard_roll_calls`
 ADD KEY `hansard_roll_calls_hansard_id_index` (`hansard_id`), ADD KEY `hansard_roll_calls_user_id_index` (`user_id`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
 ADD PRIMARY KEY (`house_id`), ADD KEY `houses_user_type_id_index` (`user_type_id`);

--
-- Indexes for table `lgas`
--
ALTER TABLE `lgas`
 ADD PRIMARY KEY (`lga_id`), ADD KEY `lgas_state_id_index` (`state_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
 ADD PRIMARY KEY (`like_id`), ADD KEY `likes_object_id_index` (`object_id`), ADD KEY `likes_app_user_id_index` (`app_user_id`), ADD KEY `likes_like_type_id_index` (`object_type_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
 ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
 ADD PRIMARY KEY (`menu_item_id`), ADD KEY `menu_items_menu_id_index` (`menu_id`);

--
-- Indexes for table `object_types`
--
ALTER TABLE `object_types`
 ADD PRIMARY KEY (`object_type_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
 ADD KEY `password_resets_email_index` (`email`), ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
 ADD PRIMARY KEY (`project_id`), ADD KEY `projects_user_id_index` (`user_id`), ADD KEY `projects_contractor_id_index` (`contractor_id`);

--
-- Indexes for table `project_comments`
--
ALTER TABLE `project_comments`
 ADD PRIMARY KEY (`project_comment_id`), ADD KEY `project_comments_project_update_id_index` (`project_update_id`), ADD KEY `project_comments_user_id_index` (`app_user_id`);

--
-- Indexes for table `project_sector`
--
ALTER TABLE `project_sector`
 ADD KEY `project_sector_project_id_index` (`project_id`), ADD KEY `project_sector_sector_id_index` (`sector_id`);

--
-- Indexes for table `project_supervisors`
--
ALTER TABLE `project_supervisors`
 ADD KEY `project_supervisors_project_id_index` (`project_id`), ADD KEY `project_supervisors_supervisor_id_index` (`supervisor_id`);

--
-- Indexes for table `project_updates`
--
ALTER TABLE `project_updates`
 ADD PRIMARY KEY (`project_update_id`), ADD KEY `project_updates_project_id_index` (`project_id`), ADD KEY `project_updates_user_id_index` (`user_id`);

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
 ADD PRIMARY KEY (`rank_id`), ADD KEY `ranks_user_type_id_index` (`user_type_id`);

--
-- Indexes for table `sectors`
--
ALTER TABLE `sectors`
 ADD PRIMARY KEY (`sector_id`);

--
-- Indexes for table `senatorial_districts`
--
ALTER TABLE `senatorial_districts`
 ADD PRIMARY KEY (`senatorial_district_id`), ADD KEY `senatorial_districts_state_id_index` (`state_id`);

--
-- Indexes for table `senators`
--
ALTER TABLE `senators`
 ADD PRIMARY KEY (`senator_id`), ADD KEY `senators_rank_id_index` (`rank_id`), ADD KEY `senators_senatorial_district_id_index` (`senatorial_district_id`), ADD KEY `senators_senate_house_id_index` (`house_id`), ADD KEY `senators_user_id_index` (`user_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
 ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `state_constituencies`
--
ALTER TABLE `state_constituencies`
 ADD PRIMARY KEY (`state_constituency_id`), ADD KEY `state_constituencies_state_id_index` (`state_id`);

--
-- Indexes for table `state_representatives`
--
ALTER TABLE `state_representatives`
 ADD PRIMARY KEY (`state_rep_id`), ADD KEY `state_representatives_rank_id_index` (`rank_id`), ADD KEY `state_representatives_state_constituency_id_index` (`state_constituency_id`), ADD KEY `state_representatives_state_rep_house_id_index` (`house_id`), ADD KEY `state_representatives_user_id_index` (`user_id`);

--
-- Indexes for table `sub_menu_items`
--
ALTER TABLE `sub_menu_items`
 ADD PRIMARY KEY (`sub_menu_item_id`), ADD KEY `sub_menu_items_menu_item_id_index` (`menu_item_id`);

--
-- Indexes for table `sub_users`
--
ALTER TABLE `sub_users`
 ADD PRIMARY KEY (`sub_user_id`), ADD KEY `sub_users_parent_user_id_index` (`parent_user_id`), ADD KEY `sub_users_child_user_id_index` (`child_user_id`);

--
-- Indexes for table `time_lines`
--
ALTER TABLE `time_lines`
 ADD PRIMARY KEY (`time_line_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `users_email_unique` (`email`), ADD KEY `users_lga_id_index` (`lga_id`), ADD KEY `users_user_type_id_index` (`user_type_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
 ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
MODIFY `app_user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `assemblies`
--
ALTER TABLE `assemblies`
MODIFY `assembly_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
MODIFY `beneficiary_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `constituencies`
--
ALTER TABLE `constituencies`
MODIFY `constituency_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contractors`
--
ALTER TABLE `contractors`
MODIFY `contractor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
MODIFY `domain_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `federal_constituencies`
--
ALTER TABLE `federal_constituencies`
MODIFY `federal_constituency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=361;
--
-- AUTO_INCREMENT for table `federal_representatives`
--
ALTER TABLE `federal_representatives`
MODIFY `federal_rep_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hansards`
--
ALTER TABLE `hansards`
MODIFY `hansard_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
MODIFY `house_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lgas`
--
ALTER TABLE `lgas`
MODIFY `lga_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=775;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
MODIFY `like_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
MODIFY `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
MODIFY `menu_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `object_types`
--
ALTER TABLE `object_types`
MODIFY `object_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
MODIFY `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `project_comments`
--
ALTER TABLE `project_comments`
MODIFY `project_comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `project_updates`
--
ALTER TABLE `project_updates`
MODIFY `project_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ranks`
--
ALTER TABLE `ranks`
MODIFY `rank_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sectors`
--
ALTER TABLE `sectors`
MODIFY `sector_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `senatorial_districts`
--
ALTER TABLE `senatorial_districts`
MODIFY `senatorial_district_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `senators`
--
ALTER TABLE `senators`
MODIFY `senator_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
MODIFY `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `state_constituencies`
--
ALTER TABLE `state_constituencies`
MODIFY `state_constituency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=991;
--
-- AUTO_INCREMENT for table `state_representatives`
--
ALTER TABLE `state_representatives`
MODIFY `state_rep_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sub_menu_items`
--
ALTER TABLE `sub_menu_items`
MODIFY `sub_menu_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sub_users`
--
ALTER TABLE `sub_users`
MODIFY `sub_user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `time_lines`
--
ALTER TABLE `time_lines`
MODIFY `time_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
MODIFY `user_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `hansard_roll_calls`
--
ALTER TABLE `hansard_roll_calls`
ADD CONSTRAINT `hansard_roll_calls_hansard_id_foreign` FOREIGN KEY (`hansard_id`) REFERENCES `hansards` (`hansard_id`),
ADD CONSTRAINT `hansard_roll_calls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `project_sector`
--
ALTER TABLE `project_sector`
ADD CONSTRAINT `project_sector_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE,
ADD CONSTRAINT `project_sector_sector_id_foreign` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`sector_id`) ON DELETE CASCADE;

--
-- Constraints for table `project_supervisors`
--
ALTER TABLE `project_supervisors`
ADD CONSTRAINT `project_supervisors_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
ADD CONSTRAINT `project_supervisors_supervisor_id_foreign` FOREIGN KEY (`supervisor_id`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
