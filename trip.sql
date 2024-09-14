-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2024 at 07:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trip`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminhome_countrymodel`
--

CREATE TABLE `adminhome_countrymodel` (
  `id` bigint(20) NOT NULL,
  `Country` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminhome_countrymodel`
--

INSERT INTO `adminhome_countrymodel` (`id`, `Country`) VALUES
(3, 'United Kingdom'),
(4, 'Japan'),
(5, 'America'),
(6, 'China'),
(11, 'India'),
(14, 'Maldives'),
(16, 'United Arab Emirates'),
(19, 'France'),
(22, 'Thailand'),
(23, 'Australia'),
(24, 'Saudi Arabia');

-- --------------------------------------------------------

--
-- Table structure for table `adminhome_destinationmodel`
--

CREATE TABLE `adminhome_destinationmodel` (
  `id` bigint(20) NOT NULL,
  `Destination` varchar(50) DEFAULT NULL,
  `Category_id` bigint(20) NOT NULL,
  `District_id` bigint(20) NOT NULL,
  `Location_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminhome_destinationmodel`
--

INSERT INTO `adminhome_destinationmodel` (`id`, `Destination`, `Category_id`, `District_id`, `Location_id`, `state_id`, `image`) VALUES
(13, 'Lake', 7, 14, 13, 7, 'photos/Lake-Kumarakom.jpeg'),
(14, 'Illikkal kallu', 5, 14, 14, 7, 'photos/Ilavizhapoonjira_s0W7ZaM.webp'),
(15, 'Bird Sanctuary', 10, 14, 13, 7, 'photos/kumarakom-bird-sanctuary05-1567406172.jpg'),
(16, 'Neasden Temple', 4, 16, 15, 14, 'photos/baps-shri-swaminarayan.jpg'),
(18, 'Tajmahal', 11, 21, 16, 19, 'photos/Tajmahal.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `adminhome_destination_catmodel`
--

CREATE TABLE `adminhome_destination_catmodel` (
  `id` bigint(20) NOT NULL,
  `Destination_cat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminhome_destination_catmodel`
--

INSERT INTO `adminhome_destination_catmodel` (`id`, `Destination_cat`) VALUES
(4, 'Pilgrim Centers'),
(5, 'Adventure'),
(7, 'Culinary'),
(9, 'Health'),
(10, 'Ecotourism'),
(11, 'Cultural'),
(12, 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `adminhome_districtmodel`
--

CREATE TABLE `adminhome_districtmodel` (
  `id` bigint(20) NOT NULL,
  `District` varchar(20) DEFAULT NULL,
  `Area` varchar(20) DEFAULT NULL,
  `Population` varchar(20) DEFAULT NULL,
  `Altitude` varchar(20) DEFAULT NULL,
  `Telcode` varchar(20) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Air` varchar(20) DEFAULT NULL,
  `Rail` varchar(20) DEFAULT NULL,
  `Road` varchar(20) DEFAULT NULL,
  `Backwarter` varchar(20) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminhome_districtmodel`
--

INSERT INTO `adminhome_districtmodel` (`id`, `District`, `Area`, `Population`, `Altitude`, `Telcode`, `Description`, `Air`, `Rail`, `Road`, `Backwarter`, `state_id`) VALUES
(13, 'Manhattan', '80sq.Km', '1,694,250', '35M', '212', 'Manhattan Island, bounded by the Hudson, East and Harlem rivers.', 'airways', 'sub way', 'bus', 'boat', 16),
(14, 'Kottayam', '2208 sq km', '1973551', '3M', '0481', 'Land of Letters. Kottayam is a city in the Kottayam district of Kerala, India.', 'air India', 'Indian Railways', 'KSRTC', 'HouseBoat', 7),
(15, 'Ebisu', '2,017 sq. m', '1.4 crores', '2,017 m', '+81', 'Japan’s busy capital', 'Japan Air Lines', 'Metro', 'Uber', 'Boat', 15),
(16, 'City of London', '1,569.14 sq km', '8,908,081', '11 M', '0207', 'Capital of UK', 'airways', 'sub way', 'bus', 'boat', 14),
(17, 'Silom', '1,568.7 sq km', '11,234,000', '1.5m', '02', 'Si Lom Road is a major street in the Thai capital Bangkok.', 'airways', 'sub way', 'bus', 'boat', 17),
(18, 'Dindigul', '6266.64 Sq. Km', '2,159,775', '268m', '04542', 'Kodaikanal is a hill town in the southern Indian state of Tamil Nadu.', 'Air India', 'Kodai Road', 'Bus', 'Boat', 11),
(19, 'Beijing', '21,196 sq km', '11,234,000', '40m', '10', 'Ancient series of walls and fortifications.', 'Beijing Capital', 'Beijing\'s Railways', 'Beijing\'s extensive', 'NA', 19),
(20, 'Hulhumalé', '4.1 sq km', '50000', 'Sea level', '960', 'Artificial island developed to relieve housing pressures in Malé, featuring beaches .', 'Velana International', 'N/A', 'Extensive road', 'NA', 23),
(21, 'Paris', '7,300 Sq Km', '1,694,250', '324 m', '33', 'Iconic iron lattice tower offering panoramic views of Paris', 'Charles de Gaulle', 'Gare du Nord', 'Extensive road', 'NA', 20),
(22, 'New York City', '58,000 sq m', '2,00,4567', '93m', '1', 'Symbol of freedom and democracy, located on Liberty Island.', 'JFK International', 'Penn Station', 'Extensive road', 'NA', 16),
(23, 'Kuala Lumpur', '243 sq Km', '18 Lakh', '63 m', '32', 'Kuala Lumpur is the capital of Malaysia. It is dominated by the 451m-tall Petronas Twin Tower.', 'Air ways', 'sub way', 'bus', 'NA', 18),
(25, 'Ernakulam', '3000 sq KM', '3 lakh', '22m', '0484', 'Ernakulam district yields the highest revenue and the largest number of industries in the state.', 'airways', 'sub way', 'bus', 'Boat', 7);

-- --------------------------------------------------------

--
-- Table structure for table `adminhome_locationmodel`
--

CREATE TABLE `adminhome_locationmodel` (
  `id` bigint(20) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Description` longtext DEFAULT NULL,
  `Hw_to_reach` varchar(20) DEFAULT NULL,
  `district_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminhome_locationmodel`
--

INSERT INTO `adminhome_locationmodel` (`id`, `Location`, `Description`, `Hw_to_reach`, `district_id`) VALUES
(13, 'Kumarakam', 'Kumarakom is a village on Vembanad Lake in the backwaters of Kerala, southern India.', 'By Bus', 14),
(14, 'Illikkal Kallu', 'Illikkal Kallu is a Thalanadu located on top of the Illickal Malaa in the Kottayam district of Keral', 'By Bus', 14),
(15, 'Tower of London', 'The Tower of London is a 1,000 year old castle that protects the Crown Jewels.', 'By Bus', 16),
(16, 'Hulhumalé', 'Artificial island developed to relieve housing pressures in Malé, featuring beaches and modern infrastructure.', 'By Air', 20),
(17, 'Eiffel Tower', 'Iconic iron lattice tower offering panoramic views of Paris.', 'By Air', 21),
(18, 'Buckingham Palace', 'Official London residence of the British monarch, famous for the Changing of the Guard ceremony', 'By Air', 16),
(19, 'Statue of Liberty', 'Symbol of freedom and democracy, located on Liberty Island', 'By Air', 22),
(20, 'Great Wall of China', 'Ancient series of walls and fortifications built to protect Chinese states from invasions', 'By Air', 19),
(21, 'Petronas Twin Towers', 'Kuala Lumpur is the capital of Malaysia. Its modern skyline is dominated by the 451m-tall Petronas Twin Towers, a pair of glass-and-steel-clad skyscrapers with Islamic motifs.', 'By Air', 23),
(22, 'Kodaikkanal Lake', 'Kodaikanal is a hill town in the southern Indian state of Tamil Nadu.', 'By Bus', 18),
(24, 'Kaladi', 'Kalady was Shankara\'s birthplace.', 'By Bus', 25);

-- --------------------------------------------------------

--
-- Table structure for table `adminhome_statemodel`
--

CREATE TABLE `adminhome_statemodel` (
  `id` bigint(20) NOT NULL,
  `State` varchar(20) DEFAULT NULL,
  `country_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminhome_statemodel`
--

INSERT INTO `adminhome_statemodel` (`id`, `State`, `country_id`) VALUES
(6, 'California', 5),
(7, 'Kerala', 11),
(11, 'Tamilnadu', 11),
(14, 'London', 3),
(15, 'Tokyo', 4),
(16, 'New York', 5),
(17, 'Bangkok', 22),
(18, 'Kuala Lumpur', 23),
(19, 'Beijing', 6),
(20, 'Île-de-France', 19),
(21, 'New South Wales', 23),
(22, 'Dubai', 16),
(23, 'Kaafu Atoll', 14);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add country model', 7, 'add_countrymodel'),
(26, 'Can change country model', 7, 'change_countrymodel'),
(27, 'Can delete country model', 7, 'delete_countrymodel'),
(28, 'Can view country model', 7, 'view_countrymodel'),
(29, 'Can add state model', 8, 'add_statemodel'),
(30, 'Can change state model', 8, 'change_statemodel'),
(31, 'Can delete state model', 8, 'delete_statemodel'),
(32, 'Can view state model', 8, 'view_statemodel'),
(33, 'Can add district model', 9, 'add_districtmodel'),
(34, 'Can change district model', 9, 'change_districtmodel'),
(35, 'Can delete district model', 9, 'delete_districtmodel'),
(36, 'Can view district model', 9, 'view_districtmodel'),
(37, 'Can add location model', 10, 'add_locationmodel'),
(38, 'Can change location model', 10, 'change_locationmodel'),
(39, 'Can delete location model', 10, 'delete_locationmodel'),
(40, 'Can view location model', 10, 'view_locationmodel'),
(41, 'Can add destination_cat model', 11, 'add_destination_catmodel'),
(42, 'Can change destination_cat model', 11, 'change_destination_catmodel'),
(43, 'Can delete destination_cat model', 11, 'delete_destination_catmodel'),
(44, 'Can view destination_cat model', 11, 'view_destination_catmodel'),
(45, 'Can add destination model', 12, 'add_destinationmodel'),
(46, 'Can change destination model', 12, 'change_destinationmodel'),
(47, 'Can delete destination model', 12, 'delete_destinationmodel'),
(48, 'Can view destination model', 12, 'view_destinationmodel'),
(49, 'Can add stay_category model', 13, 'add_stay_categorymodel'),
(50, 'Can change stay_category model', 13, 'change_stay_categorymodel'),
(51, 'Can delete stay_category model', 13, 'delete_stay_categorymodel'),
(52, 'Can view stay_category model', 13, 'view_stay_categorymodel'),
(53, 'Can add stay_ details model', 14, 'add_stay_detailsmodel'),
(54, 'Can change stay_ details model', 14, 'change_stay_detailsmodel'),
(55, 'Can delete stay_ details model', 14, 'delete_stay_detailsmodel'),
(56, 'Can view stay_ details model', 14, 'view_stay_detailsmodel'),
(57, 'Can add stay_ details model', 15, 'add_stay_detailsmodel'),
(58, 'Can change stay_ details model', 15, 'change_stay_detailsmodel'),
(59, 'Can delete stay_ details model', 15, 'delete_stay_detailsmodel'),
(60, 'Can view stay_ details model', 15, 'view_stay_detailsmodel'),
(61, 'Can add event model', 16, 'add_eventmodel'),
(62, 'Can change event model', 16, 'change_eventmodel'),
(63, 'Can delete event model', 16, 'delete_eventmodel'),
(64, 'Can view event model', 16, 'view_eventmodel'),
(65, 'Can add vehicle_type model', 17, 'add_vehicle_typemodel'),
(66, 'Can change vehicle_type model', 17, 'change_vehicle_typemodel'),
(67, 'Can delete vehicle_type model', 17, 'delete_vehicle_typemodel'),
(68, 'Can view vehicle_type model', 17, 'view_vehicle_typemodel'),
(69, 'Can add vehicle_details model', 18, 'add_vehicle_detailsmodel'),
(70, 'Can change vehicle_details model', 18, 'change_vehicle_detailsmodel'),
(71, 'Can delete vehicle_details model', 18, 'delete_vehicle_detailsmodel'),
(72, 'Can view vehicle_details model', 18, 'view_vehicle_detailsmodel'),
(73, 'Can add role_ model', 19, 'add_role_model'),
(74, 'Can change role_ model', 19, 'change_role_model'),
(75, 'Can delete role_ model', 19, 'delete_role_model'),
(76, 'Can view role_ model', 19, 'view_role_model'),
(77, 'Can add company_ model', 20, 'add_company_model'),
(78, 'Can change company_ model', 20, 'change_company_model'),
(79, 'Can delete company_ model', 20, 'delete_company_model'),
(80, 'Can view company_ model', 20, 'view_company_model'),
(81, 'Can add itineraryreg_ model', 21, 'add_itineraryreg_model'),
(82, 'Can change itineraryreg_ model', 21, 'change_itineraryreg_model'),
(83, 'Can delete itineraryreg_ model', 21, 'delete_itineraryreg_model'),
(84, 'Can view itineraryreg_ model', 21, 'view_itineraryreg_model'),
(85, 'Can add itinerary_ model', 22, 'add_itinerary_model'),
(86, 'Can change itinerary_ model', 22, 'change_itinerary_model'),
(87, 'Can delete itinerary_ model', 22, 'delete_itinerary_model'),
(88, 'Can view itinerary_ model', 22, 'view_itinerary_model'),
(89, 'Can add tour_ package model', 23, 'add_tour_packagemodel'),
(90, 'Can change tour_ package model', 23, 'change_tour_packagemodel'),
(91, 'Can delete tour_ package model', 23, 'delete_tour_packagemodel'),
(92, 'Can view tour_ package model', 23, 'view_tour_packagemodel'),
(93, 'Can add pilgrimcenter model', 24, 'add_pilgrimcentermodel'),
(94, 'Can change pilgrimcenter model', 24, 'change_pilgrimcentermodel'),
(95, 'Can delete pilgrimcenter model', 24, 'delete_pilgrimcentermodel'),
(96, 'Can view pilgrimcenter model', 24, 'view_pilgrimcentermodel'),
(97, 'Can add reservation_ model', 25, 'add_reservation_model'),
(98, 'Can change reservation_ model', 25, 'change_reservation_model'),
(99, 'Can delete reservation_ model', 25, 'delete_reservation_model'),
(100, 'Can view reservation_ model', 25, 'view_reservation_model'),
(101, 'Can add itinerarychild_ model', 26, 'add_itinerarychild_model'),
(102, 'Can change itinerarychild_ model', 26, 'change_itinerarychild_model'),
(103, 'Can delete itinerarychild_ model', 26, 'delete_itinerarychild_model'),
(104, 'Can view itinerarychild_ model', 26, 'view_itinerarychild_model'),
(105, 'Can add payment_ model', 27, 'add_payment_model'),
(106, 'Can change payment_ model', 27, 'change_payment_model'),
(107, 'Can delete payment_ model', 27, 'delete_payment_model'),
(108, 'Can view payment_ model', 27, 'view_payment_model'),
(109, 'Can add feedback model', 28, 'add_feedbackmodel'),
(110, 'Can change feedback model', 28, 'change_feedbackmodel'),
(111, 'Can delete feedback model', 28, 'delete_feedbackmodel'),
(112, 'Can view feedback model', 28, 'view_feedbackmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$9W8CZpdoojNqjRhpdES2HH$SxaNhiaJ+kd9AZzXfLfs7FFkjgWWR4oBBIdy1CXpoe8=', NULL, 0, 'bindu', '', '', '', 0, 1, '2024-04-24 05:04:02.537060'),
(2, 'pbkdf2_sha256$720000$o77UqwwplSBqQI8p8jlfT9$9J5hVbG+zdUZ6QlYpsMh01FUcVpdFNq2V2SxG2u1TUk=', NULL, 0, 'bindu1', '', '', '', 0, 1, '2024-04-24 05:10:01.629067'),
(3, 'pbkdf2_sha256$720000$c6JuklTOvfbfaY5AjuxZj1$8kSUjYUDSEmfaDAsM4Btvkqh9Sp2UxlT1XjTydFP160=', NULL, 0, 'bindu12', '', '', '', 0, 1, '2024-04-24 05:22:18.197032'),
(5, 'pbkdf2_sha256$720000$NzT2wZLyeB7GcGgygKtcw7$NZMcK2YssN4U8tHsOp3S5Ohsaz7htsxTDI7SmiNcokk=', NULL, 0, 'bindu14', '', '', '', 0, 1, '2024-04-24 05:24:45.116964'),
(7, 'pbkdf2_sha256$720000$GLbuPY9F7CGydqTE2scBd4$NT640Zw+2nrxMQ+4CFV85GPmoqjzHxky2D8emEa3eWY=', NULL, 0, 'bindu123', '', '', '', 0, 1, '2024-04-24 05:31:43.743128'),
(8, 'pbkdf2_sha256$720000$TlzrvSURWp0Mzbu6f8LMXz$l3UwsnCrlNnZdnWVWZLJgEDhOz2ShpU9o0EXp1ALzmM=', NULL, 0, 'asha123', '', '', '', 0, 1, '2024-04-24 05:34:38.677120'),
(9, 'pbkdf2_sha256$720000$99TsGJtSgMzwbW9JAvj3Yo$EyltvImFqK83h2LyOig7BcsoVzcJAxpVSybzMw2/sQo=', NULL, 0, 'suni', '', '', '', 0, 1, '2024-04-24 07:40:37.556688'),
(10, 'pbkdf2_sha256$720000$TYBGxtz95P6glZ05Ky0nBH$X9GtOWAOBdZbMT25QJ33kF7jnugYR7VBXSJb6QPiZv4=', NULL, 0, 'kavitha', '', '', '', 0, 1, '2024-04-24 07:53:56.940443'),
(11, 'pbkdf2_sha256$720000$rTn2Y4x6LHg0dr3ylUu3RU$cFclHUEDLT/rzS1w4VRiw29Dl21NFHEiN3b8BWEyi/A=', NULL, 0, 'latha', '', '', '', 0, 1, '2024-04-24 08:00:58.955772'),
(13, 'pbkdf2_sha256$720000$bhHftHxKbBjB2394xjBj0c$RoFAzhrggJ50MrYpusOXhCZftVH3DZJKu45xUkQ8iYw=', NULL, 0, 'Rasiya', '', '', '', 0, 1, '2024-04-24 08:10:33.537462'),
(14, 'pbkdf2_sha256$720000$4GD5a9E82RTSIa67wsFmQh$dBMvkm931aob1pvAwgAaZ/NuG5OzM9j6ctQ/EnaZlTQ=', NULL, 0, 'amal', '', '', '', 0, 1, '2024-04-24 08:16:19.844896'),
(15, 'pbkdf2_sha256$720000$YiH08MKlV9GowwGWD7ng4f$YlbJR3SRgQuXLmzdtQAR6HHJ6Z+9ZbThrI58R4CBpFg=', NULL, 0, 'reshma', '', '', '', 0, 1, '2024-04-24 08:22:13.482336'),
(16, 'pbkdf2_sha256$720000$MZ21quQCLlVA1FOH7KytGG$NGNSa1YjNyd8KPoaQughlZiORGMy4EGF4wgoxLi0Y+o=', NULL, 0, 'mini', '', '', '', 0, 1, '2024-04-24 08:32:32.616095'),
(18, 'pbkdf2_sha256$720000$CLgLXozTS3RrOe8N6dIpGz$2z6NgYsuDKjIgR2PzVN/HAuaHI3IZDu9d14kx4K2Dec=', NULL, 0, 'mini23', '', '', '', 0, 1, '2024-04-24 08:36:41.933058'),
(19, 'pbkdf2_sha256$720000$dKr1iAUhkn446z3eHcNk0k$OlcLALfuq/FLUlIqvzBsdYCc6itzIRLjp0mWYPsJ7KA=', NULL, 0, '123', '', '', '', 0, 1, '2024-04-24 08:45:19.711006'),
(20, 'pbkdf2_sha256$720000$w3kQ5Y3E5m1TbBCT7HMU2z$seJnHRgWe3Jlwj17btSPdil+YMfg+uZ9DQB0PlHCJSU=', NULL, 1, 'bindudileep', '', '', 'ptbindudileep@gmail.com', 1, 1, '2024-04-24 10:15:59.816934'),
(21, 'pbkdf2_sha256$720000$ww97w9cWTYif751Kcsn4Hq$agwS47LeXJ96t5WEZ5zBzFD6n2D4Qh7J+zn8UmWcK3I=', NULL, 1, 'iiit', '', '', 'as@gmail.com', 1, 1, '2024-04-24 15:52:04.540395'),
(22, 'pbkdf2_sha256$720000$2mV9sXS88TXbYZ4PPZUnlw$Qmdjc7nGJ161cpID+O6XjJILtu7DJmN3xeBJU/E7e0o=', NULL, 0, 'qwert', '', '', '', 0, 1, '2024-04-24 16:09:51.704591'),
(23, 'pbkdf2_sha256$720000$6oTK1pqbhF6QQdUmzyeEnE$DEz7dFeli8U84iBbfpYfDtnLfP2Z3RRTF1QaptTkPqs=', NULL, 0, 'sanu', '', '', '', 0, 1, '2024-04-24 16:17:25.639730'),
(24, 'pbkdf2_sha256$720000$gjqKOTq34eOBlF6t8qfcAs$pZO2tWAT+6N/NFJbvv5WgRZDfZnSEC48AhHmRkhNJZc=', NULL, 0, 'vinitta', '', '', '', 0, 1, '2024-05-03 10:05:13.855147'),
(26, 'pbkdf2_sha256$720000$RCiyUoTBHEfW2txLxt3Tkq$b39cpO2EB849eEoTm2Nz/l84MHlMTmifZwGMmfWTQDw=', NULL, 0, 'bindhu', '', '', '', 0, 1, '2024-05-18 04:31:31.980234'),
(27, 'pbkdf2_sha256$720000$4uY9yYNBRsEpQIXZtYDzxp$mqspUD/5v2+2nahWHuVq0hDloJsqY6iM3bD+tlBf6nI=', NULL, 0, 'Dileep', '', '', '', 0, 1, '2024-05-22 04:41:17.889002'),
(29, 'pbkdf2_sha256$720000$Aikmq6LUakOL0Nf9MC3IwC$9RFs7dcflYEgowturY0Q/HWHMaFN63f2L2sJ+c+7NUE=', NULL, 0, 'SuniDileep', '', '', '', 0, 1, '2024-05-22 05:48:51.701858'),
(30, 'pbkdf2_sha256$720000$I2lla4BKN7rSUmCcKy3azf$vkWLysVgf1a8AhbuSupLMFpk8TmxWplF/cxpdXUHPpE=', NULL, 0, 'Friends', '', '', '', 0, 1, '2024-06-17 10:41:24.736978'),
(34, 'pbkdf2_sha256$720000$XE8KANddTHGST2dvhidAYK$PG50bVcMINItj5GYNi0lq9jZzDpwGNaFvXBdxJkSi9U=', NULL, 0, 'Ramesh', '', '', '', 0, 1, '2024-06-17 10:49:13.556639'),
(35, 'pbkdf2_sha256$720000$gsSp9iXVceKh8MOxFn8qL1$fSNvjSguka927dnC3RDCAdaLfq/3zxa8hNGAsIExqQk=', NULL, 0, 'Rama', '', '', '', 0, 1, '2024-06-27 00:01:43.980187'),
(36, 'pbkdf2_sha256$720000$HnP4eDk0YYelOWTmaGwfan$6UVQ70JeV+V7/nQCETRRHzLllm3bSQexUWPF9G7qQcs=', NULL, 0, 'maya', '', '', '', 0, 1, '2024-07-08 13:43:54.338342'),
(37, 'pbkdf2_sha256$720000$8Qdrl1LcZXxLH2VReQWWUg$5t5YawePk1c0UqxgFWiXZIE8mCHUMSAZ2Al4goloNlw=', NULL, 1, 'Admin', '', '', 'Admin@gmail.com', 1, 1, '2024-08-13 04:21:37.082114');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_pilgrimcentermodel`
--

CREATE TABLE `company_pilgrimcentermodel` (
  `id` bigint(20) NOT NULL,
  `Pilg_Name` varchar(40) NOT NULL,
  `Pilg_Address` longtext NOT NULL,
  `Pilg_Description` longtext NOT NULL,
  `Pilg_image` varchar(100) DEFAULT NULL,
  `Pilg_link` varchar(50) NOT NULL,
  `District_id` bigint(20) NOT NULL,
  `Location_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_pilgrimcentermodel`
--

INSERT INTO `company_pilgrimcentermodel` (`id`, `Pilg_Name`, `Pilg_Address`, `Pilg_Description`, `Pilg_image`, `Pilg_link`, `District_id`, `Location_id`, `country_id`, `state_id`) VALUES
(7, 'Saint Chavara Pilgrim Centre', 'Chavara Office, P.B. No.3, Mannanam, Kerala 686561', 'Pilgrimage place in Mannanam, Kerala\r\nChurch, Pilgrim Centre', 'photos/Kumaram-church.jpg', 'https://www.instagram.com/pilgrim', 14, 13, 11, 7),
(8, 'gfhjkjkjlk', 'ghjjhkjjk\r\ngghjhj', 'bvbbnmnmn\r\n  nm,,m', 'photos/Kathmandu.jpg', 'gfghjjhjk', 15, 15, 3, 17);

-- --------------------------------------------------------

--
-- Table structure for table `company_stay_detailsmodel`
--

CREATE TABLE `company_stay_detailsmodel` (
  `id` bigint(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Tarrif_range` int(11) NOT NULL,
  `Lphone` bigint(20) NOT NULL,
  `mobno` bigint(20) NOT NULL,
  `fax` bigint(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `images` varchar(100) NOT NULL,
  `link` varchar(50) NOT NULL,
  `District_id` bigint(20) NOT NULL,
  `Location_id` bigint(20) NOT NULL,
  `Stay_category_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_stay_detailsmodel`
--

INSERT INTO `company_stay_detailsmodel` (`id`, `Name`, `Address`, `Tarrif_range`, `Lphone`, `mobno`, `fax`, `email`, `images`, `link`, `District_id`, `Location_id`, `Stay_category_id`, `state_id`) VALUES
(5, 'happy home', 'dfgfhg', 2300, 12234, 67788789, 3454565, 'a@ff.gg', 'photos/villa1_KPm0ctZ.jpeg', 'ertrtr', 14, 13, 4, 7),
(6, 'binni', 'ytyuiu', 5000, 43566, 678789909, 6576879898, 'abc@as.com', 'photos/mudhouse1_TNwVR9J.jpeg', 'werettr', 14, 14, 5, 7),
(7, 'jagan', 'gklo', 10000, 4556677, 5456767889, 56767889, 'edc@gmail.com', 'photos/London-Eye-England.jpg', 'trytki', 16, 15, 7, 14),
(8, 'wellhouse', 'gfghjhjh', 3467, 546576, 54677878998, 45467778, 'uji@gh.mn', 'photos/Ilavizhapoonjira.webp', 'trytuy', 14, 14, 6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `company_tour_packagemodel`
--

CREATE TABLE `company_tour_packagemodel` (
  `id` bigint(20) NOT NULL,
  `Package_Name` varchar(50) NOT NULL,
  `Duration` varchar(20) NOT NULL,
  `No_of_Packages` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL,
  `Package_Contents` longtext NOT NULL,
  `status` varchar(50) NOT NULL,
  `Insurance_Company` varchar(50) NOT NULL,
  `Stay_Name_id` bigint(20) NOT NULL,
  `Stay_category_id` bigint(20) NOT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `Image1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_tour_packagemodel`
--

INSERT INTO `company_tour_packagemodel` (`id`, `Package_Name`, `Duration`, `No_of_Packages`, `Price`, `Package_Contents`, `status`, `Insurance_Company`, `Stay_Name_id`, `Stay_category_id`, `Image`, `Image1`) VALUES
(7, 'Individual', '3D-2N', '2', 34567, 'ghhjjkkj\r\nFOOD FREE\r\nA/C ACCOMMMODATION', '', 'GHJJKJ', 8, 4, 'photos/Lake-Kumarakom_qZVaucT.jpeg', 'photos/Pic007_HFyuHVv.gif'),
(8, 'Adventure', '5D-3N', '2', 78098, 'hghjsjkcda', '', 'bjjkk', 6, 6, 'photos/Ilavizhapoonjira_PV3dMAU.webp', 'photos/10-places-to-visit-in-South-West-England.jpg'),
(9, 'Honeymoon', '7D-5N', '3', 45789, 'gfhgjhjk', '', 'vbbbn', 7, 7, 'photos/villa2_VEwrJhh.jpeg', 'photos/homestay2_uqeH2RR.jpeg'),
(10, 'Tourist', '2D-2N', '2', 1000, 'vjkdjkdc', '', 'ghghhjjk', 6, 7, 'photos/Kathmandu_o0POW8f.jpg', 'photos/10-places-to-visit-in-South-West-England_YcODHWQ.jpg'),
(11, 'Pilgrim', '5D, 4N', '5', 5000, 'food\r\nwater', '', 'qwerrt', 7, 6, 'photos/Daibustu_of_nara_bcZTBqk.jpeg', 'photos/Burj_Khalifa-Dubai.png'),
(12, 'Coorge-Mysoor', '2D-2N', '3', 4000, 'bskacjkl', '', 'hghjj', 6, 6, 'photos/Burj_Khalifa-Dubai_LqPmxC4.png', 'photos/10-places-to-visit-in-South-West-England_mr5CBHv.jpg'),
(13, 'Kulu-Manali', '7D-5N', '2', 30000, 'Food\r\nAccommodation\r\nMedical Fecility', '', 'NewIndia Assurence', 5, 4, 'photos/maxresdefault.jpg', 'photos/Kulu_Manali.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `company_tour_packagemodel_destination`
--

CREATE TABLE `company_tour_packagemodel_destination` (
  `id` bigint(20) NOT NULL,
  `tour_packagemodel_id` bigint(20) NOT NULL,
  `destinationmodel_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_tour_packagemodel_destination`
--

INSERT INTO `company_tour_packagemodel_destination` (`id`, `tour_packagemodel_id`, `destinationmodel_id`) VALUES
(10, 8, 14),
(11, 9, 13),
(13, 10, 13),
(14, 11, 13),
(15, 11, 14),
(17, 12, 13),
(18, 13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `company_tour_packagemodel_pilgrimcenter`
--

CREATE TABLE `company_tour_packagemodel_pilgrimcenter` (
  `id` bigint(20) NOT NULL,
  `tour_packagemodel_id` bigint(20) NOT NULL,
  `pilgrimcentermodel_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_tour_packagemodel_pilgrimcenter`
--

INSERT INTO `company_tour_packagemodel_pilgrimcenter` (`id`, `tour_packagemodel_id`, `pilgrimcentermodel_id`) VALUES
(9, 7, 8),
(10, 8, 7),
(11, 9, 8),
(13, 10, 7),
(12, 10, 8),
(14, 11, 8),
(15, 12, 8),
(16, 13, 7);

-- --------------------------------------------------------

--
-- Table structure for table `company_vehicle_detailsmodel`
--

CREATE TABLE `company_vehicle_detailsmodel` (
  `id` bigint(20) NOT NULL,
  `Veh_regno` int(11) NOT NULL,
  `Reg_date` date NOT NULL,
  `Tank_capacity` varchar(20) NOT NULL,
  `Standard_mileage` varchar(50) NOT NULL,
  `Engine_no` varchar(50) NOT NULL,
  `Chasis_no` varchar(50) NOT NULL,
  `No_of_tyres` int(11) NOT NULL,
  `Fuel_Type` varchar(50) NOT NULL,
  `Seating_capacity` varchar(50) NOT NULL,
  `vehicle_type_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_vehicle_detailsmodel`
--

INSERT INTO `company_vehicle_detailsmodel` (`id`, `Veh_regno`, `Reg_date`, `Tank_capacity`, `Standard_mileage`, `Engine_no`, `Chasis_no`, `No_of_tyres`, `Fuel_Type`, `Seating_capacity`, `vehicle_type_id`) VALUES
(2, 9897656, '2023-07-04', '50', '20', '566778789', '556789098', 4, 'petrol', '4', 5),
(3, 7678879, '2023-09-05', '25', '20', '65677678', '909023', 3, 'diesal', '3', 7),
(4, 131412, '2024-04-01', '38', '34', '35786', '576876978', 4, 'petrol', '35', 4);

-- --------------------------------------------------------

--
-- Table structure for table `company_vehicle_typemodel`
--

CREATE TABLE `company_vehicle_typemodel` (
  `id` bigint(20) NOT NULL,
  `vehicle_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_vehicle_typemodel`
--

INSERT INTO `company_vehicle_typemodel` (`id`, `vehicle_type`) VALUES
(2, 'tempo'),
(3, 'bus'),
(4, 'Traveller'),
(5, 'car'),
(6, 'Mini van'),
(7, 'Autorickshaw'),
(9, 'Mini van');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'adminhome', 'countrymodel'),
(12, 'adminhome', 'destinationmodel'),
(11, 'adminhome', 'destination_catmodel'),
(9, 'adminhome', 'districtmodel'),
(16, 'adminhome', 'eventmodel'),
(10, 'adminhome', 'locationmodel'),
(8, 'adminhome', 'statemodel'),
(13, 'adminhome', 'stay_categorymodel'),
(14, 'adminhome', 'stay_detailsmodel'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(24, 'company', 'pilgrimcentermodel'),
(15, 'company', 'stay_detailsmodel'),
(23, 'company', 'tour_packagemodel'),
(18, 'company', 'vehicle_detailsmodel'),
(17, 'company', 'vehicle_typemodel'),
(5, 'contenttypes', 'contenttype'),
(28, 'Itinerary', 'feedbackmodel'),
(26, 'Itinerary', 'itinerarychild_model'),
(27, 'Itinerary', 'payment_model'),
(25, 'Itinerary', 'reservation_model'),
(20, 'registration', 'company_model'),
(21, 'registration', 'itineraryreg_model'),
(22, 'registration', 'itinerary_model'),
(19, 'registration', 'role_model'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-21 13:45:54.986633'),
(2, 'auth', '0001_initial', '2024-03-21 13:45:55.423740'),
(3, 'admin', '0001_initial', '2024-03-21 13:45:55.528352'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-21 13:45:55.541393'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-21 13:45:55.543381'),
(6, 'adminhome', '0001_initial', '2024-03-21 13:45:55.557259'),
(7, 'adminhome', '0002_remove_countrymodel_cname_countrymodel_country', '2024-03-21 13:45:55.582463'),
(8, 'contenttypes', '0002_remove_content_type_name', '2024-03-21 13:45:55.655790'),
(9, 'auth', '0002_alter_permission_name_max_length', '2024-03-21 13:45:55.732545'),
(10, 'auth', '0003_alter_user_email_max_length', '2024-03-21 13:45:55.748847'),
(11, 'auth', '0004_alter_user_username_opts', '2024-03-21 13:45:55.754640'),
(12, 'auth', '0005_alter_user_last_login_null', '2024-03-21 13:45:55.798611'),
(13, 'auth', '0006_require_contenttypes_0002', '2024-03-21 13:45:55.807836'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2024-03-21 13:45:55.812001'),
(15, 'auth', '0008_alter_user_username_max_length', '2024-03-21 13:45:55.833857'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2024-03-21 13:45:55.847895'),
(17, 'auth', '0010_alter_group_name_max_length', '2024-03-21 13:45:55.863074'),
(18, 'auth', '0011_update_proxy_permissions', '2024-03-21 13:45:55.874351'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2024-03-21 13:45:55.893085'),
(20, 'sessions', '0001_initial', '2024-03-21 13:45:55.921783'),
(21, 'adminhome', '0003_statemodel', '2024-03-23 06:06:36.590715'),
(22, 'adminhome', '0004_remove_statemodel_count_id_remove_statemodel_st_id_and_more', '2024-03-23 06:27:38.257405'),
(23, 'adminhome', '0005_districtmodel', '2024-03-26 00:25:31.997404'),
(24, 'adminhome', '0002_locationmodel', '2024-04-03 15:44:05.648674'),
(25, 'adminhome', '0003_destination_catmodel', '2024-04-06 08:15:45.994972'),
(26, 'adminhome', '0004_destinationmodel', '2024-04-06 09:30:02.410270'),
(27, 'adminhome', '0005_rename_siate_destinationmodel_state', '2024-04-06 09:36:35.662342'),
(28, 'adminhome', '0006_alter_destinationmodel_category_and_more', '2024-04-06 09:48:36.185589'),
(29, 'adminhome', '0007_stay_categorymodel', '2024-04-07 10:17:31.196572'),
(30, 'adminhome', '0008_stay_detailsmodel', '2024-04-10 17:54:35.747987'),
(31, 'adminhome', '0009_delete_stay_detailsmodel', '2024-04-22 06:09:08.361749'),
(32, 'company', '0001_initial', '2024-04-22 06:09:08.464352'),
(33, 'adminhome', '0010_eventmodel', '2024-04-22 08:15:31.655360'),
(34, 'adminhome', '0011_alter_eventmodel_country', '2024-04-22 08:17:49.713886'),
(35, 'adminhome', '0012_alter_eventmodel_description_and_more', '2024-04-22 10:17:13.381736'),
(36, 'company', '0002_vehicle_typemodel', '2024-04-22 18:06:26.387229'),
(37, 'company', '0003_vehicle_detailsmodel', '2024-04-23 05:44:28.042369'),
(38, 'registration', '0001_initial', '2024-04-23 08:19:22.245657'),
(39, 'registration', '0002_itineraryreg_model', '2024-04-24 07:36:51.525554'),
(40, 'company', '0004_alter_vehicle_detailsmodel_no_of_tyres', '2024-04-24 08:20:33.531671'),
(41, 'registration', '0003_itineraryreg_model_login', '2024-04-24 08:30:30.083599'),
(42, 'registration', '0004_itinerary_model', '2024-04-24 08:43:10.857277'),
(43, 'registration', '0005_delete_itineraryreg_model', '2024-04-24 08:46:51.016750'),
(44, 'company', '0005_tour_packagemodel', '2024-04-26 23:52:27.124670'),
(45, 'company', '0006_rename_name_tour_packagemodel_stay_name', '2024-04-27 04:59:13.867381'),
(46, 'company', '0007_remove_tour_packagemodel_notes_and_more', '2024-04-27 05:06:32.305438'),
(47, 'company', '0008_alter_tour_packagemodel_package_contents_and_more', '2024-04-27 06:11:28.735731'),
(48, 'company', '0009_rename_pilh_link_pilgrimcentermodel_pilg_link', '2024-04-27 06:15:30.658597'),
(49, 'company', '0010_tour_packagemodel_destination_and_more', '2024-04-27 07:18:13.207991'),
(50, 'adminhome', '0013_destinationmodel_image', '2024-04-29 04:39:21.736739'),
(51, 'company', '0011_tour_packagemodel_image1', '2024-04-29 05:08:38.166074'),
(52, 'company', '0012_alter_tour_packagemodel_duration', '2024-04-30 00:16:42.456735'),
(53, 'Itinerary', '0001_initial', '2024-04-30 05:54:46.374593'),
(54, 'Itinerary', '0002_alter_reservation_model_status', '2024-05-02 05:09:54.261146'),
(55, 'Itinerary', '0003_itinerarychild_model', '2024-05-02 07:20:21.837767'),
(56, 'Itinerary', '0004_reservation_model_age_reservation_model_gender', '2024-05-02 09:04:19.217887'),
(57, 'Itinerary', '0005_payment_model', '2024-05-03 05:20:41.205445'),
(58, 'Itinerary', '0006_rename_dd_chq_no_payment_model_amount', '2024-05-03 05:41:08.910729'),
(59, 'Itinerary', '0007_rename_itin_child_name_itinerarychild_model_gender_and_more', '2024-05-06 05:24:36.369413'),
(60, 'Itinerary', '0008_alter_payment_model_reservation', '2024-05-07 07:01:18.942827'),
(61, 'Itinerary', '0009_remove_payment_model_mode_payment_and_more', '2024-05-07 08:00:50.492907'),
(62, 'Itinerary', '0010_alter_payment_model_card_no_and_more', '2024-05-07 08:55:33.231183'),
(63, 'Itinerary', '0011_alter_payment_model_trans_date', '2024-05-07 09:17:45.235114'),
(64, 'Itinerary', '0012_payment_model_status_alter_payment_model_card_type', '2024-05-07 10:24:07.771843'),
(65, 'adminhome', '0014_alter_districtmodel_description', '2024-05-22 04:01:22.474623'),
(66, 'adminhome', '0015_alter_locationmodel_description', '2024-05-22 04:03:08.174207'),
(67, 'adminhome', '0016_alter_districtmodel_description_and_more', '2024-05-22 04:11:58.717533'),
(68, 'Itinerary', '0013_remove_payment_model_card_type', '2024-05-28 04:36:47.507086'),
(69, 'Itinerary', '0014_alter_reservation_model_reserv_date', '2024-05-28 07:02:07.852671'),
(70, 'Itinerary', '0015_rename_country_id_reservation_model_country_and_more', '2024-05-28 23:31:51.184788'),
(71, 'registration', '0006_alter_company_model_address_and_more', '2024-06-01 09:06:33.058951'),
(72, 'registration', '0007_alter_company_model_address_and_more', '2024-06-01 09:07:38.822907'),
(73, 'adminhome', '0017_alter_locationmodel_description', '2024-06-17 05:55:09.472739'),
(74, 'adminhome', '0018_alter_destination_catmodel_destination_cat_and_more', '2024-07-13 08:12:44.641504'),
(75, 'Itinerary', '0016_feedbackmodel', '2024-08-17 04:48:01.988422'),
(76, 'adminhome', '0019_alter_locationmodel_location', '2024-08-17 04:48:02.077161');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9jveyxir627jh6j3r75biwj2876v6de3', 'eyJpdGluZXJhcnlfaWQiOjUsIml0aW5lcmFyeV9uYW1lIjoiRGlsZWVwIn0:1sIthA:6VZqF4hD90gtJYVacgkLDRQIi96xCtQg63eQf98XT00', '2024-06-30 17:29:36.510725'),
('ag6tc2mzpjsf3vsgngdizzgxtovwqsjw', '.eJyrVkrOzy1IzKuMz0xRsjLWgXPzEnNTlayUEpOSU5R0lDJLMvNSixKL4MoQAlCFZZl5mSUliUq1AKU_HOA:1s2q1S:59SaL_0s7-Kbe-y2RZzd3kCWTYTUAU28DzbF8dP21sM', '2024-05-17 10:20:10.181349'),
('gq8qfhc7m9ah13l9uap38qwa2041m39e', '.eJyrVkrOzy1IzKuMz0xRsjLRgXPzEnNTlayUErMyS_JLi4oVEvNSSooSy1JzipV0lDJLMvNSixKLILpMkQWg-lwyc1JTC5RqAY7AInI:1sU4vI:QZxbUsvIZHSKH06wveMCFJ9unLaXXn898Zh4oy-bx6g', '2024-07-31 13:42:24.596202'),
('lixq2g0yip0wjjkkzu7wedxy4yfdqwvg', '.eJyrVsosycxLLUosqozPTFGyMtVBEshLzE1VslJyycxJTS1Q0lFKzs8tSMyDKDRBcKHKErMyS_JLi4oVEvNSSooSy1JzipVqAXbPInI:1sDa3G:jcU_Q5IHYPftHZdaterNUFzKYku5PzZdXpXIxGPmBU0', '2024-06-16 01:30:26.539848');

-- --------------------------------------------------------

--
-- Table structure for table `event_table`
--

CREATE TABLE `event_table` (
  `id` bigint(20) NOT NULL,
  `Event` varchar(20) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Importance` longtext DEFAULT NULL,
  `Date` date NOT NULL,
  `Country_id` bigint(20) NOT NULL,
  `District_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_feedbackmodel`
--

CREATE TABLE `itinerary_feedbackmodel` (
  `id` bigint(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Message` longtext DEFAULT NULL,
  `Date` date NOT NULL,
  `Itinarery_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itinerary_feedbackmodel`
--

INSERT INTO `itinerary_feedbackmodel` (`id`, `Email`, `Message`, `Date`, `Itinarery_id`) VALUES
(1, 'dili@gmail.com', 'Very good ', '2024-08-17', 5);

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_itinerarychild_model`
--

CREATE TABLE `itinerary_itinerarychild_model` (
  `id` bigint(20) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Age` int(11) NOT NULL,
  `ItineraryName` varchar(20) NOT NULL,
  `Reservation_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itinerary_itinerarychild_model`
--

INSERT INTO `itinerary_itinerarychild_model` (`id`, `Gender`, `Age`, `ItineraryName`, `Reservation_id`) VALUES
(64, 'F', 32, 'Anu', 71),
(65, 'F', 24, 'Binu', 71),
(66, 'M', 16, 'Suni', 71),
(67, 'F', 16, 'Reji', 71),
(68, 'M', 12, 'Elsamma', 71),
(69, 'M', 55, 'HGHG', 72),
(70, 'M', 77, 'JGJG', 72),
(71, 'M', 6, 'HGH', 72),
(72, 'M', 8, 'JHG', 72),
(73, 'F', 21, 'niya', 73),
(74, 'M', 26, 'sam', 73),
(75, 'M', 10, 'vinu', 73),
(76, 'F', 12, 'sani', 73),
(77, 'F', 21, 'niya', 73),
(78, 'M', 26, 'sam', 73),
(79, 'M', 10, 'vinu', 73),
(80, 'F', 12, 'sani', 73),
(81, 'F', 21, 'niya', 73),
(82, 'M', 26, 'sam', 73),
(83, 'M', 10, 'vinu', 73),
(84, 'F', 12, 'sani', 73),
(85, 'F', 21, 'niya', 73),
(86, 'M', 26, 'sam', 73),
(87, 'M', 10, 'vinu', 73),
(88, 'F', 12, 'sani', 73),
(90, 'F', 34, 'eas', 75),
(92, 'Female', 3, 'simi', 90),
(93, 'Female', 3, 'simi', 90),
(94, 'Female', 3, 'simi', 90),
(95, 'Female', 3, 'simi', 90),
(96, 'F', 15, 'Kavi', 91),
(97, 'F', 41, 'Rama', 91),
(98, 'F', 23, 'Rani', 92),
(99, 'm', 12, 'simi', 92),
(100, 'F', 23, 'Rani', 92),
(101, 'm', 12, 'simi', 92),
(102, 'F', 23, 'Rani', 92),
(103, 'm', 12, 'simi', 92),
(107, 'M', 12, 'sani', 94),
(108, 'F', 12, 'Rani', 95),
(109, 'M', 43, 'Raju', 95),
(112, 'F', 21, 'maya', 98),
(114, 'F', 23, 'ererr', 100),
(115, 'M', 10, 'gfg', 100),
(116, 'F', 34, 'sde', 101),
(117, 'M', 21, 'dff', 101),
(118, 'Female', 28, 'Maya Joseph', 102),
(119, 'Male', 20, 'Joyal Joseph', 102),
(120, 'Male', 15, 'Jikku Joseph', 102),
(121, 'Female', 8, 'Jan Joseph', 102);

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_payment_model`
--

CREATE TABLE `itinerary_payment_model` (
  `id` bigint(20) NOT NULL,
  `Trans_Date` date NOT NULL,
  `Amount` int(11) NOT NULL,
  `Card_Holder_Name` varchar(20) NOT NULL,
  `card_no` bigint(20) NOT NULL,
  `cvv_no` int(11) NOT NULL,
  `exp_date` varchar(8) NOT NULL,
  `Reservation_id` bigint(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itinerary_payment_model`
--

INSERT INTO `itinerary_payment_model` (`id`, `Trans_Date`, `Amount`, `Card_Holder_Name`, `card_no`, `cvv_no`, `exp_date`, `Reservation_id`, `status`) VALUES
(1, '2024-05-08', 53543, 'hghjg', 1233, 44, '2024-05-', NULL, 'PAID'),
(2, '2024-05-08', 53543, 'hghjg', 1233, 44, '2024-05-', NULL, 'PAID'),
(3, '2024-05-08', 53543, 'hghjg', 1233, 44, '2024-05-', NULL, 'PAID'),
(4, '2024-05-08', 53543, 'hghjg', 1233, 44, '2024-05-', NULL, 'PAID'),
(5, '2024-05-08', 53543, 'hghjg', 1233, 44, '2024-05-', NULL, 'PAID'),
(6, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(7, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(8, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(9, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(10, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(11, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(12, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(13, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(14, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(15, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(16, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(17, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(18, '2024-05-07', 78678, 'ghfhgf', 6565, 656, '2024-05-', NULL, 'PAID'),
(19, '2024-05-07', 324632, 'ghfhgf', 3457678, 123, '', NULL, 'PAID'),
(20, '2024-05-07', 545665, 'esrrhj', 1645768, 123, '', NULL, 'PAID'),
(21, '2024-05-07', 1233, 'bindu', 1234567890987654, 345, '', NULL, 'PAID'),
(22, '2024-05-07', 32344, 'hhg', 324354, 12, '', NULL, 'PAID'),
(23, '2024-05-07', 25000, 'suni', 34567, 234, '', NULL, 'PAID'),
(24, '2024-05-07', 25000, 'suni', 34567, 234, '', NULL, 'PAID'),
(25, '2024-05-07', 1234, 'ghfhgf', 3467, 123, '', NULL, 'PAID'),
(26, '2024-05-18', 54353, 'ytyt', 6546464, 444, '', NULL, 'PAID'),
(27, '2024-05-18', 352, 'sgfhf', 1233, 243, '', NULL, 'PAID'),
(28, '2024-05-22', 2300, 'Binesh', 1234567, 234, '', NULL, 'PAID'),
(29, '2024-05-22', 156196, 'ytyt', 234, 345, '', NULL, 'PAID'),
(30, '2024-05-28', 156196, 'Mani', 1234567812345678, 123, '', 94, 'PAID'),
(31, '2024-05-28', 12000, 'Mini', 1234123456785678, 98, '', 95, 'PAID'),
(32, '2024-05-28', 12000, 'Mini', 1234123456785678, 98, '', 95, 'PAID'),
(38, '2024-05-29', 156196, 'jayan', 123, 123, '', 98, 'PAID'),
(40, '2024-05-29', 103701, 'ghh', 233455778, 123, '', 100, 'PAID'),
(41, '2024-06-02', 390490, 'Binesh Joseph', 2345678912344567, 476, '', 102, 'PAID');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_reservation_model`
--

CREATE TABLE `itinerary_reservation_model` (
  `id` bigint(20) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Street_Address` longtext NOT NULL,
  `Mobile` bigint(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `Profession` varchar(50) DEFAULT NULL,
  `Organization` varchar(50) DEFAULT NULL,
  `City` varchar(20) NOT NULL,
  `ZIP` int(11) NOT NULL,
  `No_of_Persons` varchar(50) NOT NULL,
  `Adults` int(11) NOT NULL,
  `Children` int(11) NOT NULL,
  `Reserv_Date` date NOT NULL,
  `Country_id` bigint(20) NOT NULL,
  `Itinerary_id` bigint(20) NOT NULL,
  `Package_id` bigint(20) NOT NULL,
  `State_id` bigint(20) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itinerary_reservation_model`
--

INSERT INTO `itinerary_reservation_model` (`id`, `Status`, `Name`, `Street_Address`, `Mobile`, `email`, `Profession`, `Organization`, `City`, `ZIP`, `No_of_Persons`, `Adults`, `Children`, `Reserv_Date`, `Country_id`, `Itinerary_id`, `Package_id`, `State_id`, `Age`, `Gender`) VALUES
(71, 'New', 'Bineesh Joseph', 'Saritha House,\r\nPuthuppally P O,\r\nKottayam', 9445678912, 'abcd@gmail.com', 'teacher', 'IHRD', 'Ernakulam', 34567, '5', 2, 3, '2024-06-20', 11, 5, 8, 7, 34, 'M'),
(72, 'New', 'Bineesh Joseph', 'Saritha House,\r\nPuthuppally P O,\r\nKottayam', 9445678912, 'abcd@gmail.com', 'teacher', 'IHRD', 'Ernakulam', 34567, '5', 2, 3, '2024-06-20', 11, 5, 8, 7, 34, 'M'),
(73, 'New', 'rama', 'gfhkljklk', 5465678787, 'a@ff.gg', 'tyyuu', 'ghhjj', 'trytyu', 1234, '5', 2, 3, '2024-05-23', 3, 5, 7, 15, 23, 'M'),
(75, 'New', 'minim', 'gfghhg', 1234455, 'abc@as.com', 'fdfe', 'IHRD', 'Ernakulam', 2334, '2', 1, 1, '2024-05-22', 11, 5, 8, 7, 21, 'M'),
(76, 'New', 'minim', 'gfghhg', 1234455, 'abc@as.com', 'fdfe', 'IHRD', 'Ernakulam', 2334, '2', 1, 1, '2024-05-22', 11, 5, 8, 7, 21, 'M'),
(78, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(79, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(80, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(81, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(82, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(83, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(84, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(85, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(86, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(87, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(88, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(89, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '10', 5, 5, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(90, 'New', 'bjb', 'jhjh', 87878, 'jhgj@bh.jhjh', '787', '876876', 'jgjg', 86766786, '2', 1, 1, '2024-05-21', 3, 5, 7, 11, 7, 'jgyug'),
(91, 'New', 'Mekha', 'mehamalhar', 4536789123, 'src@gmail.com', 'Doctor', 'MCH Kottayam', 'Ernakulam', 686011, '3', 2, 1, '2024-05-28', 11, 5, 8, 7, 45, 'M'),
(92, 'New', 'Ravi', 'Lion Villa', 1234567890, 'ijn@gn.com', 'salesman', 'mnj', 'bngnhg', 89087, '3', 2, 1, '2024-05-29', 3, 5, 9, 14, 54, 'M'),
(94, 'New', 'Manohari', 'thamara', 1234455, 'as@gmail.com', 'tyu', 'bjhjk', 'hgkj', 12334, '2', 1, 1, '2024-05-28', 16, 5, 8, 15, 54, 'F'),
(95, 'New', 'Mini', 'Vadakkedath,\r\nMelukav,\r\nIritty,\r\nKerala', 1234567890, 'plokm@km.com', 'Head Clerk', 'hr institution', 'Lakkidi', 908766, '3', 2, 1, '2024-05-28', 19, 5, 12, 17, 23, 'F'),
(98, 'New', 'jayan', 'happy villa', 23456789, 'jhgj@bh.jhjh', 'fddddd', 'wqeq', 'Ernakulam', 465767, '2', 1, 1, '2024-05-29', 11, 5, 8, 7, 23, 'M'),
(100, 'New', 'jk', 'mnml', 123546547, 'a@ff.gg', 'jnkkl', 'njkk', 'Ernakulam', 1324, '3', 2, 1, '2024-05-29', 11, 5, 7, 7, 34, 'M'),
(101, 'New', 'lino', 'fdghhg', 23454556, 'abcd@gmail.com', 'fghgh', 'vhgh', 'fg', 2334454, '3', 2, 1, '2024-06-01', 19, 5, 7, 14, 23, 'M'),
(102, 'New', 'Bineesh Joseph', 'Puthannadayil,\r\nKanehara P O,\r\nIdukki Dt.\r\nKerala', 8767898761, 'Binesg123@gmail.com', 'Doctor', 'Welfast Hospital', 'Kottayam', 686019, '5', 3, 2, '2024-06-02', 11, 5, 8, 7, 32, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `registration_company_model`
--

CREATE TABLE `registration_company_model` (
  `id` bigint(20) NOT NULL,
  `Company_Name` varchar(50) NOT NULL,
  `Com_Regist_No` varchar(20) NOT NULL,
  `Vat_No` varchar(50) NOT NULL,
  `Tin_No` varchar(50) NOT NULL,
  `Address` longtext NOT NULL,
  `Address1` longtext NOT NULL,
  `ZIP` varchar(50) NOT NULL,
  `Phone1` bigint(20) NOT NULL,
  `Phone2` bigint(20) NOT NULL,
  `Fax` bigint(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Company_Status` varchar(10) NOT NULL,
  `Registrationdate` date NOT NULL,
  `Country_id` bigint(20) NOT NULL,
  `Location_id` bigint(20) NOT NULL,
  `Login_id` int(11) NOT NULL,
  `State_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration_company_model`
--

INSERT INTO `registration_company_model` (`id`, `Company_Name`, `Com_Regist_No`, `Vat_No`, `Tin_No`, `Address`, `Address1`, `ZIP`, `Phone1`, `Phone2`, `Fax`, `Email`, `Company_Status`, `Registrationdate`, `Country_id`, `Location_id`, `Login_id`, `State_id`) VALUES
(4, 'ajitours andtravels', '23456', '45656776', '6778889', 'cghjhj', 'ghgj', '465767', 657887899, 677887899, 65788789980, 'asd@jk.km', 'INACTIVE', '2024-05-22', 3, 15, 29, 16),
(5, 'Friends Tours and Travels', '123456789', 'AB24681232', '987654321', '123 Apartments,\r\nABC Nagar,\r\nLondon\r\n', 'Great Tower,\r\nPLM colony\r\nLondon', '345672', 1234567812, 9876543210, 9876543210, 'contact@friends.com', 'INACTIVE', '2024-06-17', 11, 22, 30, 11);

-- --------------------------------------------------------

--
-- Table structure for table `registration_itinerary_model`
--

CREATE TABLE `registration_itinerary_model` (
  `id` bigint(20) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(20) NOT NULL,
  `Itineraryreg_Date` date NOT NULL,
  `Address` longtext NOT NULL,
  `ZIP` int(11) NOT NULL,
  `Mobno` bigint(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Country_id` bigint(20) NOT NULL,
  `Location_id` bigint(20) NOT NULL,
  `Login_id` int(11) DEFAULT NULL,
  `State_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration_itinerary_model`
--

INSERT INTO `registration_itinerary_model` (`id`, `First_name`, `Last_name`, `Itineraryreg_Date`, `Address`, `ZIP`, `Mobno`, `Email`, `Status`, `Country_id`, `Location_id`, `Login_id`, `State_id`) VALUES
(5, 'Dileep', 'V P', '2024-05-22', 'Varikkattu House,\r\nManarcad P O,\r\nKottayam\r\n\r\n', 686019, 9447824129, 'dili@gmail.com', 'INACTIVE', 11, 13, 27, 7),
(6, 'Dileep', 'Purushothaman', '2024-06-17', 'ABC Bhavan,\r\nXYZ P O,\r\nQWERT', 686011, 1234567890, 'dileep@abcmail.com', 'INACTIVE', 11, 13, 34, 7),
(7, 'Rama', 'Binoy', '2024-06-27', 'Happy Villa,\r\nABC,\r\nAlappuzha', 686017, 1234567890, 'big@gmail.com', 'INACTIVE', 11, 13, 35, 7),
(8, 'Thumpy', ' gowry', '2024-07-08', 'May Flower,\r\nErattupetta,\r\nKottayam', 234567, 6754321234, 'juhy@gmail.com', 'INACTIVE', 19, 19, 36, 16);

-- --------------------------------------------------------

--
-- Table structure for table `registration_role_model`
--

CREATE TABLE `registration_role_model` (
  `id` bigint(20) NOT NULL,
  `role_type` varchar(30) NOT NULL,
  `Login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration_role_model`
--

INSERT INTO `registration_role_model` (`id`, `role_type`, `Login_id`) VALUES
(1, 'Company', 2),
(2, 'Company', 3),
(3, 'Company', 5),
(4, 'Company', 7),
(5, 'Company', 8),
(6, 'Itinerary', 9),
(7, 'Itinerary', 10),
(8, 'Company', 11),
(9, 'Itinerary', 13),
(10, 'Itinerary', 14),
(11, 'Itinerary', 15),
(12, 'Itinerary', 16),
(13, 'Itinerary', 18),
(14, 'Itinerary', 19),
(15, 'Company', 22),
(16, 'Itinerary', 23),
(17, 'Itinerary', 24),
(18, 'Itinerary', 26),
(19, 'Itinerary', 27),
(20, 'Company', 29),
(21, 'Company', 30),
(22, 'Itinerary', 34),
(23, 'Itinerary', 35),
(24, 'Itinerary', 36);

-- --------------------------------------------------------

--
-- Table structure for table `stay_cat_table`
--

CREATE TABLE `stay_cat_table` (
  `id` bigint(20) NOT NULL,
  `Stay_type` varchar(20) DEFAULT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stay_cat_table`
--

INSERT INTO `stay_cat_table` (`id`, `Stay_type`, `photo`) VALUES
(4, 'villa', 'photos/villa1.jpeg'),
(5, 'mudhouse', 'photos/villa2.jpeg'),
(6, 'homestay', 'photos/homestay3.jpeg'),
(7, 'apt', 'photos/villa3.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminhome_countrymodel`
--
ALTER TABLE `adminhome_countrymodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminhome_destinationmodel`
--
ALTER TABLE `adminhome_destinationmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminhome_destinatio_Category_id_ef3103d1_fk_adminhome` (`Category_id`),
  ADD KEY `adminhome_destinatio_District_id_0881ca93_fk_adminhome` (`District_id`),
  ADD KEY `adminhome_destinatio_Location_id_319b0dbb_fk_adminhome` (`Location_id`),
  ADD KEY `adminhome_destinatio_state_id_a32eede4_fk_adminhome` (`state_id`);

--
-- Indexes for table `adminhome_destination_catmodel`
--
ALTER TABLE `adminhome_destination_catmodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminhome_districtmodel`
--
ALTER TABLE `adminhome_districtmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminhome_districtmo_state_id_84816274_fk_adminhome` (`state_id`);

--
-- Indexes for table `adminhome_locationmodel`
--
ALTER TABLE `adminhome_locationmodel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adminhome_locationmodel_Location_d76eec6d_uniq` (`Location`),
  ADD KEY `adminhome_locationmo_district_id_5a4ddd48_fk_adminhome` (`district_id`);

--
-- Indexes for table `adminhome_statemodel`
--
ALTER TABLE `adminhome_statemodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminhome_statemodel_country_id_5249b51b_fk_adminhome` (`country_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `company_pilgrimcentermodel`
--
ALTER TABLE `company_pilgrimcentermodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_pilgrimcente_District_id_d2d6d796_fk_adminhome` (`District_id`),
  ADD KEY `company_pilgrimcente_Location_id_cb8d19a0_fk_adminhome` (`Location_id`),
  ADD KEY `company_pilgrimcente_country_id_15d10cfc_fk_adminhome` (`country_id`),
  ADD KEY `company_pilgrimcente_state_id_da41afb3_fk_adminhome` (`state_id`);

--
-- Indexes for table `company_stay_detailsmodel`
--
ALTER TABLE `company_stay_detailsmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_stay_details_District_id_83627f81_fk_adminhome` (`District_id`),
  ADD KEY `company_stay_details_Location_id_d4e01198_fk_adminhome` (`Location_id`),
  ADD KEY `company_stay_details_Stay_category_id_e16958c2_fk_stay_cat_` (`Stay_category_id`),
  ADD KEY `company_stay_details_state_id_aaa097f6_fk_adminhome` (`state_id`);

--
-- Indexes for table `company_tour_packagemodel`
--
ALTER TABLE `company_tour_packagemodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_tour_package_Stay_category_id_453ca3fd_fk_stay_cat_` (`Stay_category_id`),
  ADD KEY `company_tour_package_Stay_Name_id_0e53f087_fk_company_s` (`Stay_Name_id`);

--
-- Indexes for table `company_tour_packagemodel_destination`
--
ALTER TABLE `company_tour_packagemodel_destination`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_tour_packagemode_tour_packagemodel_id_des_166336c9_uniq` (`tour_packagemodel_id`,`destinationmodel_id`),
  ADD KEY `company_tour_package_destinationmodel_id_b288fa1a_fk_adminhome` (`destinationmodel_id`);

--
-- Indexes for table `company_tour_packagemodel_pilgrimcenter`
--
ALTER TABLE `company_tour_packagemodel_pilgrimcenter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_tour_packagemode_tour_packagemodel_id_pil_7178fea9_uniq` (`tour_packagemodel_id`,`pilgrimcentermodel_id`),
  ADD KEY `company_tour_package_pilgrimcentermodel_i_d7288a73_fk_company_p` (`pilgrimcentermodel_id`);

--
-- Indexes for table `company_vehicle_detailsmodel`
--
ALTER TABLE `company_vehicle_detailsmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_vehicle_deta_vehicle_type_id_b3f1e336_fk_company_v` (`vehicle_type_id`);

--
-- Indexes for table `company_vehicle_typemodel`
--
ALTER TABLE `company_vehicle_typemodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `event_table`
--
ALTER TABLE `event_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminhome_eventmodel_District_id_f3853c7e_fk_adminhome` (`District_id`),
  ADD KEY `adminhome_eventmodel_state_id_a43bfb07_fk_adminhome` (`state_id`),
  ADD KEY `adminhome_eventmodel_Country_id_7c7f1814_fk_adminhome` (`Country_id`);

--
-- Indexes for table `itinerary_feedbackmodel`
--
ALTER TABLE `itinerary_feedbackmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Itinerary_feedbackmo_Itinarery_id_32d194fe_fk_registrat` (`Itinarery_id`);

--
-- Indexes for table `itinerary_itinerarychild_model`
--
ALTER TABLE `itinerary_itinerarychild_model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Itinerary_itineraryc_Reservation_id_0ec3f9eb_fk_Itinerary` (`Reservation_id`);

--
-- Indexes for table `itinerary_payment_model`
--
ALTER TABLE `itinerary_payment_model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Itinerary_payment_mo_Reservation_id_9f678cc3_fk_Itinerary` (`Reservation_id`);

--
-- Indexes for table `itinerary_reservation_model`
--
ALTER TABLE `itinerary_reservation_model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Itinerary_reservatio_Itinerary_id_c191ec4b_fk_registrat` (`Itinerary_id`),
  ADD KEY `Itinerary_reservatio_Package_id_af0b6311_fk_company_t` (`Package_id`),
  ADD KEY `Itinerary_reservatio_Country_id_31c5916f_fk_adminhome` (`Country_id`),
  ADD KEY `Itinerary_reservatio_State_id_c0fc4c11_fk_adminhome` (`State_id`);

--
-- Indexes for table `registration_company_model`
--
ALTER TABLE `registration_company_model`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Login_id` (`Login_id`),
  ADD KEY `registration_company_Country_id_09644434_fk_adminhome` (`Country_id`),
  ADD KEY `registration_company_Location_id_eba91e64_fk_adminhome` (`Location_id`),
  ADD KEY `registration_company_State_id_a3103c49_fk_adminhome` (`State_id`);

--
-- Indexes for table `registration_itinerary_model`
--
ALTER TABLE `registration_itinerary_model`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Login_id` (`Login_id`),
  ADD KEY `registration_itinera_Country_id_f66f13de_fk_adminhome` (`Country_id`),
  ADD KEY `registration_itinera_Location_id_352a6673_fk_adminhome` (`Location_id`),
  ADD KEY `registration_itinera_State_id_774d25f0_fk_adminhome` (`State_id`);

--
-- Indexes for table `registration_role_model`
--
ALTER TABLE `registration_role_model`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Login_id` (`Login_id`);

--
-- Indexes for table `stay_cat_table`
--
ALTER TABLE `stay_cat_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminhome_countrymodel`
--
ALTER TABLE `adminhome_countrymodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `adminhome_destinationmodel`
--
ALTER TABLE `adminhome_destinationmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `adminhome_destination_catmodel`
--
ALTER TABLE `adminhome_destination_catmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `adminhome_districtmodel`
--
ALTER TABLE `adminhome_districtmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `adminhome_locationmodel`
--
ALTER TABLE `adminhome_locationmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `adminhome_statemodel`
--
ALTER TABLE `adminhome_statemodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_pilgrimcentermodel`
--
ALTER TABLE `company_pilgrimcentermodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `company_stay_detailsmodel`
--
ALTER TABLE `company_stay_detailsmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `company_tour_packagemodel`
--
ALTER TABLE `company_tour_packagemodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `company_tour_packagemodel_destination`
--
ALTER TABLE `company_tour_packagemodel_destination`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `company_tour_packagemodel_pilgrimcenter`
--
ALTER TABLE `company_tour_packagemodel_pilgrimcenter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `company_vehicle_detailsmodel`
--
ALTER TABLE `company_vehicle_detailsmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company_vehicle_typemodel`
--
ALTER TABLE `company_vehicle_typemodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `event_table`
--
ALTER TABLE `event_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `itinerary_feedbackmodel`
--
ALTER TABLE `itinerary_feedbackmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `itinerary_itinerarychild_model`
--
ALTER TABLE `itinerary_itinerarychild_model`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `itinerary_payment_model`
--
ALTER TABLE `itinerary_payment_model`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `itinerary_reservation_model`
--
ALTER TABLE `itinerary_reservation_model`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `registration_company_model`
--
ALTER TABLE `registration_company_model`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registration_itinerary_model`
--
ALTER TABLE `registration_itinerary_model`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registration_role_model`
--
ALTER TABLE `registration_role_model`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `stay_cat_table`
--
ALTER TABLE `stay_cat_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminhome_destinationmodel`
--
ALTER TABLE `adminhome_destinationmodel`
  ADD CONSTRAINT `adminhome_destinatio_Category_id_ef3103d1_fk_adminhome` FOREIGN KEY (`Category_id`) REFERENCES `adminhome_destination_catmodel` (`id`),
  ADD CONSTRAINT `adminhome_destinatio_District_id_0881ca93_fk_adminhome` FOREIGN KEY (`District_id`) REFERENCES `adminhome_districtmodel` (`id`),
  ADD CONSTRAINT `adminhome_destinatio_Location_id_319b0dbb_fk_adminhome` FOREIGN KEY (`Location_id`) REFERENCES `adminhome_locationmodel` (`id`),
  ADD CONSTRAINT `adminhome_destinatio_state_id_a32eede4_fk_adminhome` FOREIGN KEY (`state_id`) REFERENCES `adminhome_statemodel` (`id`);

--
-- Constraints for table `adminhome_districtmodel`
--
ALTER TABLE `adminhome_districtmodel`
  ADD CONSTRAINT `adminhome_districtmo_state_id_84816274_fk_adminhome` FOREIGN KEY (`state_id`) REFERENCES `adminhome_statemodel` (`id`);

--
-- Constraints for table `adminhome_locationmodel`
--
ALTER TABLE `adminhome_locationmodel`
  ADD CONSTRAINT `adminhome_locationmo_district_id_5a4ddd48_fk_adminhome` FOREIGN KEY (`district_id`) REFERENCES `adminhome_districtmodel` (`id`);

--
-- Constraints for table `adminhome_statemodel`
--
ALTER TABLE `adminhome_statemodel`
  ADD CONSTRAINT `adminhome_statemodel_country_id_5249b51b_fk_adminhome` FOREIGN KEY (`country_id`) REFERENCES `adminhome_countrymodel` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `company_pilgrimcentermodel`
--
ALTER TABLE `company_pilgrimcentermodel`
  ADD CONSTRAINT `company_pilgrimcente_District_id_d2d6d796_fk_adminhome` FOREIGN KEY (`District_id`) REFERENCES `adminhome_districtmodel` (`id`),
  ADD CONSTRAINT `company_pilgrimcente_Location_id_cb8d19a0_fk_adminhome` FOREIGN KEY (`Location_id`) REFERENCES `adminhome_locationmodel` (`id`),
  ADD CONSTRAINT `company_pilgrimcente_country_id_15d10cfc_fk_adminhome` FOREIGN KEY (`country_id`) REFERENCES `adminhome_countrymodel` (`id`),
  ADD CONSTRAINT `company_pilgrimcente_state_id_da41afb3_fk_adminhome` FOREIGN KEY (`state_id`) REFERENCES `adminhome_statemodel` (`id`);

--
-- Constraints for table `company_stay_detailsmodel`
--
ALTER TABLE `company_stay_detailsmodel`
  ADD CONSTRAINT `company_stay_details_District_id_83627f81_fk_adminhome` FOREIGN KEY (`District_id`) REFERENCES `adminhome_districtmodel` (`id`),
  ADD CONSTRAINT `company_stay_details_Location_id_d4e01198_fk_adminhome` FOREIGN KEY (`Location_id`) REFERENCES `adminhome_locationmodel` (`id`),
  ADD CONSTRAINT `company_stay_details_Stay_category_id_e16958c2_fk_stay_cat_` FOREIGN KEY (`Stay_category_id`) REFERENCES `stay_cat_table` (`id`),
  ADD CONSTRAINT `company_stay_details_state_id_aaa097f6_fk_adminhome` FOREIGN KEY (`state_id`) REFERENCES `adminhome_statemodel` (`id`);

--
-- Constraints for table `company_tour_packagemodel`
--
ALTER TABLE `company_tour_packagemodel`
  ADD CONSTRAINT `company_tour_package_Stay_Name_id_0e53f087_fk_company_s` FOREIGN KEY (`Stay_Name_id`) REFERENCES `company_stay_detailsmodel` (`id`),
  ADD CONSTRAINT `company_tour_package_Stay_category_id_453ca3fd_fk_stay_cat_` FOREIGN KEY (`Stay_category_id`) REFERENCES `stay_cat_table` (`id`);

--
-- Constraints for table `company_tour_packagemodel_destination`
--
ALTER TABLE `company_tour_packagemodel_destination`
  ADD CONSTRAINT `company_tour_package_destinationmodel_id_b288fa1a_fk_adminhome` FOREIGN KEY (`destinationmodel_id`) REFERENCES `adminhome_destinationmodel` (`id`),
  ADD CONSTRAINT `company_tour_package_tour_packagemodel_id_34df553b_fk_company_t` FOREIGN KEY (`tour_packagemodel_id`) REFERENCES `company_tour_packagemodel` (`id`);

--
-- Constraints for table `company_tour_packagemodel_pilgrimcenter`
--
ALTER TABLE `company_tour_packagemodel_pilgrimcenter`
  ADD CONSTRAINT `company_tour_package_pilgrimcentermodel_i_d7288a73_fk_company_p` FOREIGN KEY (`pilgrimcentermodel_id`) REFERENCES `company_pilgrimcentermodel` (`id`),
  ADD CONSTRAINT `company_tour_package_tour_packagemodel_id_f4e96031_fk_company_t` FOREIGN KEY (`tour_packagemodel_id`) REFERENCES `company_tour_packagemodel` (`id`);

--
-- Constraints for table `company_vehicle_detailsmodel`
--
ALTER TABLE `company_vehicle_detailsmodel`
  ADD CONSTRAINT `company_vehicle_deta_vehicle_type_id_b3f1e336_fk_company_v` FOREIGN KEY (`vehicle_type_id`) REFERENCES `company_vehicle_typemodel` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `event_table`
--
ALTER TABLE `event_table`
  ADD CONSTRAINT `adminhome_eventmodel_Country_id_7c7f1814_fk_adminhome` FOREIGN KEY (`Country_id`) REFERENCES `adminhome_countrymodel` (`id`),
  ADD CONSTRAINT `adminhome_eventmodel_District_id_f3853c7e_fk_adminhome` FOREIGN KEY (`District_id`) REFERENCES `adminhome_districtmodel` (`id`),
  ADD CONSTRAINT `adminhome_eventmodel_state_id_a43bfb07_fk_adminhome` FOREIGN KEY (`state_id`) REFERENCES `adminhome_statemodel` (`id`);

--
-- Constraints for table `itinerary_feedbackmodel`
--
ALTER TABLE `itinerary_feedbackmodel`
  ADD CONSTRAINT `Itinerary_feedbackmo_Itinarery_id_32d194fe_fk_registrat` FOREIGN KEY (`Itinarery_id`) REFERENCES `registration_itinerary_model` (`id`);

--
-- Constraints for table `itinerary_itinerarychild_model`
--
ALTER TABLE `itinerary_itinerarychild_model`
  ADD CONSTRAINT `Itinerary_itineraryc_Reservation_id_0ec3f9eb_fk_Itinerary` FOREIGN KEY (`Reservation_id`) REFERENCES `itinerary_reservation_model` (`id`);

--
-- Constraints for table `itinerary_payment_model`
--
ALTER TABLE `itinerary_payment_model`
  ADD CONSTRAINT `Itinerary_payment_mo_Reservation_id_9f678cc3_fk_Itinerary` FOREIGN KEY (`Reservation_id`) REFERENCES `itinerary_reservation_model` (`id`);

--
-- Constraints for table `itinerary_reservation_model`
--
ALTER TABLE `itinerary_reservation_model`
  ADD CONSTRAINT `Itinerary_reservatio_Country_id_31c5916f_fk_adminhome` FOREIGN KEY (`Country_id`) REFERENCES `adminhome_countrymodel` (`id`),
  ADD CONSTRAINT `Itinerary_reservatio_Itinerary_id_c191ec4b_fk_registrat` FOREIGN KEY (`Itinerary_id`) REFERENCES `registration_itinerary_model` (`id`),
  ADD CONSTRAINT `Itinerary_reservatio_Package_id_af0b6311_fk_company_t` FOREIGN KEY (`Package_id`) REFERENCES `company_tour_packagemodel` (`id`),
  ADD CONSTRAINT `Itinerary_reservatio_State_id_c0fc4c11_fk_adminhome` FOREIGN KEY (`State_id`) REFERENCES `adminhome_statemodel` (`id`);

--
-- Constraints for table `registration_company_model`
--
ALTER TABLE `registration_company_model`
  ADD CONSTRAINT `registration_company_Country_id_09644434_fk_adminhome` FOREIGN KEY (`Country_id`) REFERENCES `adminhome_countrymodel` (`id`),
  ADD CONSTRAINT `registration_company_Location_id_eba91e64_fk_adminhome` FOREIGN KEY (`Location_id`) REFERENCES `adminhome_locationmodel` (`id`),
  ADD CONSTRAINT `registration_company_State_id_a3103c49_fk_adminhome` FOREIGN KEY (`State_id`) REFERENCES `adminhome_statemodel` (`id`),
  ADD CONSTRAINT `registration_company_model_Login_id_f6fcbb0e_fk_auth_user_id` FOREIGN KEY (`Login_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `registration_itinerary_model`
--
ALTER TABLE `registration_itinerary_model`
  ADD CONSTRAINT `registration_itinera_Country_id_f66f13de_fk_adminhome` FOREIGN KEY (`Country_id`) REFERENCES `adminhome_countrymodel` (`id`),
  ADD CONSTRAINT `registration_itinera_Location_id_352a6673_fk_adminhome` FOREIGN KEY (`Location_id`) REFERENCES `adminhome_locationmodel` (`id`),
  ADD CONSTRAINT `registration_itinera_State_id_774d25f0_fk_adminhome` FOREIGN KEY (`State_id`) REFERENCES `adminhome_statemodel` (`id`),
  ADD CONSTRAINT `registration_itinerary_model_Login_id_c78b40d6_fk_auth_user_id` FOREIGN KEY (`Login_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `registration_role_model`
--
ALTER TABLE `registration_role_model`
  ADD CONSTRAINT `registration_role_model_Login_id_6a0ee488_fk_auth_user_id` FOREIGN KEY (`Login_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
