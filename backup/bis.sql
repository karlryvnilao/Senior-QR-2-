-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2024 at 03:29 AM
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
-- Database: `bis`
--

-- --------------------------------------------------------

--
-- Table structure for table `qrcode`
--

CREATE TABLE `qrcode` (
  `id` int(11) NOT NULL,
  `qrtext` varchar(255) NOT NULL,
  `qrimage` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbenificiary`
--

CREATE TABLE `tblbenificiary` (
  `id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `relationship` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblblotter`
--

CREATE TABLE `tblblotter` (
  `id` int(11) NOT NULL,
  `complainant` varchar(100) DEFAULT NULL,
  `respondent` varchar(100) DEFAULT NULL,
  `victim` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `details` varchar(10000) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblblotter`
--

INSERT INTO `tblblotter` (`id`, `complainant`, `respondent`, `victim`, `type`, `location`, `date`, `time`, `details`, `status`) VALUES
(10, 'Joe Rizal', 'Nora Selos', 'Joe Rizal', 'Amicable', 'Pob 1 Catbalogan, Samar', '2020-11-02', '00:30:00', ' Sustento sa Anaak ', 'Scheduled'),
(16, 'Tiboy Tibo', 'Maria Advitos', 'Tiboy', 'Incident', 'Brgy1', '2020-11-06', '23:35:00', '  Di alam ano pinag awayan  ', 'Scheduled'),
(19, 'Girl Topak', 'Boy Topak', 'Girl Topak', 'Incident', 'Manila', '2021-01-13', '11:11:00', 'Mga Topakin na Pamilya', 'Active'),
(20, 'Kayzel', 'Mario', 'Kayzel', 'Incident', 'Quezon City', '2021-01-07', '00:12:00', 'Iwan Ko', 'Settled'),
(22, 'Juan dela Cruz', 'Peter', 'Juan', 'Amicable', 'Manila', '2021-01-01', '22:16:00', '   ayaw magbayad ng utang.. hehhheee   ', 'Active'),
(26, 'Ron', 'Cajan', 'ROn Cajan', 'Amicable', 'Looc', '2021-04-30', '13:09:00', 'Donec sollicitudin molestie malesuada. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.', 'Settled');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrgy_info`
--

CREATE TABLE `tblbrgy_info` (
  `id` int(11) NOT NULL,
  `province` varchar(100) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `brgy_name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `city_logo` varchar(100) DEFAULT NULL,
  `brgy_logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbrgy_info`
--

INSERT INTO `tblbrgy_info` (`id`, `province`, `town`, `brgy_name`, `number`, `text`, `image`, `city_logo`, `brgy_logo`) VALUES
(1, 'Samar1', 'POBLACION KALIBO', 'BRGY KALIBO AKLAN', '0919-1234567', 'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Sed porttitor lectus nibh. Curabitur aliquet quam id dui posuere blandit.', '09052021075440182970012_615550183178722_2776607156578360582_n.jpg', '03052021033434brgy-logo.png', '0905202107542630042021035316lgu-logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblchairmanship`
--

CREATE TABLE `tblchairmanship` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblchairmanship`
--

INSERT INTO `tblchairmanship` (`id`, `title`) VALUES
(2, 'Presiding Officer'),
(3, 'Committee on Appropriation'),
(4, 'Committee on Peace & Order'),
(5, 'Committee on Health'),
(6, 'Committee on Education'),
(7, 'Committee on Rules'),
(8, 'Committee on Infra'),
(9, 'Committee on Solid Waste'),
(10, 'Committee on Sports'),
(11, 'No Chairmanship');

-- --------------------------------------------------------

--
-- Table structure for table `tblofficials`
--

CREATE TABLE `tblofficials` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `chairmanship` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `termstart` date DEFAULT NULL,
  `termend` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblofficials`
--

INSERT INTO `tblofficials` (`id`, `name`, `chairmanship`, `position`, `termstart`, `termend`, `status`) VALUES
(1, 'Peter Guevarra	', '2', '4', '2021-04-29', '2021-05-01', 'Active'),
(4, 'Marlon A. Lorio', '3', '7', '2021-04-03', '2021-04-24', 'Active'),
(5, 'GARRY A. RAFEL', '4', '8', '2021-04-03', '2021-04-03', 'Active'),
(6, 'TRILLION LOWRY	', '5', '9', '2021-04-03', '2021-04-03', 'Active'),
(7, 'MELANIE M. ELBOR	', '6', '10', '2021-04-03', '2021-04-03', 'Active'),
(8, 'ERLINDA V. VITUS	', '7', '11', '2021-04-03', '2021-04-03', 'Active'),
(9, 'JOEDAVINCE', '8', '12', '2021-04-03', '2021-04-03', 'Active'),
(10, 'ALEJANDRO A. CAGAMPANG	', '9', '13', '2021-04-03', '2021-04-03', 'Active'),
(11, 'JOSEPH P. PARDOS	', '10', '14', '2021-04-03', '2021-04-03', 'Active'),
(12, 'RUTH A. BACAG	', '11', '15', '2021-04-03', '2021-04-03', 'Active'),
(13, 'DIANNE A. CURRY	', '11', '16', '2021-04-03', '2021-04-03', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblpayments`
--

CREATE TABLE `tblpayments` (
  `id` int(11) NOT NULL,
  `details` varchar(100) DEFAULT NULL,
  `amounts` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpayments`
--

INSERT INTO `tblpayments` (`id`, `details`, `amounts`, `date`, `user`, `name`) VALUES
(5, 'Business Permit Payment', 7000.00, '2021-05-19', 'admin', ' Atrium Salon & Studio'),
(6, 'Certificate of Indigency Payment', 3500.00, '2021-05-19', 'admin', ' Ronil Gonzales Cajan'),
(7, 'Barangay Clearance Payment', 2500.00, '2021-05-19', 'admin', ' Ronil Poe Cajan'),
(8, 'Business Permit Payment', 3500.00, '2021-05-18', 'admin', ' Atrium Salon & Studio'),
(9, 'Business Permit Payment', 7000.00, '2021-05-18', 'admin', ' Atrium Salon & Studio'),
(10, 'Business Permit Payment', 7500.00, '2021-05-18', 'admin', ' Atrium Salon & Studio');

-- --------------------------------------------------------

--
-- Table structure for table `tblpermit`
--

CREATE TABLE `tblpermit` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `owner1` varchar(200) DEFAULT NULL,
  `owner2` varchar(80) DEFAULT NULL,
  `nature` varchar(220) DEFAULT NULL,
  `applied` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpermit`
--

INSERT INTO `tblpermit` (`id`, `name`, `owner1`, `owner2`, `nature`, `applied`) VALUES
(4, 'SH Food Group 1', 'SH Food Group 1', 'SH Food Group 2', 'SH Food Group 1', '2021-04-30'),
(5, 'Atrium Salon & Studio', 'SH Food Group 213', '', 'Atrium Salon & Studio', '2021-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `tblposition`
--

CREATE TABLE `tblposition` (
  `id` int(11) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblposition`
--

INSERT INTO `tblposition` (`id`, `position`, `order`) VALUES
(4, 'Captain', 1),
(7, 'Councilor 1', 2),
(8, 'Councilor 2', 3),
(9, 'Councilor 3', 4),
(10, 'Councilor 4', 5),
(11, 'Councilor 5', 6),
(12, 'Councilor 6', 7),
(13, 'Councilor 7', 8),
(14, 'SK Chairman', 9),
(15, 'Secretary', 10),
(16, 'Treasurer', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tblprecinct`
--

CREATE TABLE `tblprecinct` (
  `id` int(11) NOT NULL,
  `precinct` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpurok`
--

CREATE TABLE `tblpurok` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpurok`
--

INSERT INTO `tblpurok` (`id`, `name`, `details`) VALUES
(13, 'Baranggay 1', ''),
(14, 'Baranggay 2', ''),
(15, 'Baranggay 3', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblresident`
--

CREATE TABLE `tblresident` (
  `id` int(11) NOT NULL,
  `national_id` varchar(100) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `picture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `middlename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthplace` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `civilstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `purok` int(11) DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resident_type` int(11) DEFAULT 1,
  `remarks` text DEFAULT NULL,
  `deceased` tinyint(1) DEFAULT 0,
  `pension` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'unclaimed',
  `qrimage` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblresident`
--

INSERT INTO `tblresident` (`id`, `national_id`, `citizenship`, `picture`, `firstname`, `middlename`, `lastname`, `birthplace`, `birthdate`, `age`, `civilstatus`, `gender`, `purok`, `phone`, `email`, `occupation`, `address`, `resident_type`, `remarks`, `deceased`, `pension`, `status`, `qrimage`, `created_at`) VALUES
(171, '321321321', 'Filipino', '18052021113447Screenshot2021-05-06183815.png', 'Ronil', 'Poe', 'Cajan', 'Metro  Manila', '2021-04-05', 1, 'Single', 'Male', 0, '19512659595', 'cajanr02rtrt22@gmail.com', 'IT', '310 W Las Colinas Blvd', 1, 'dasds', 0, NULL, 'unclaimed', '', '2024-08-25 02:37:11'),
(169, '', NULL, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAD6AXIDASIAAhEBAxEB/8QAHAAAAgIDAQEAAAAAAAAAAAAABAUCAwABBgcI/8QAPhAAAgEDAwIFAgMGBgICAQUAAQIRAAMhBBIxBUEGEyJRYTJxFIGRByNSobHRFSRCweHwYnIz8RYXNEOSov/EABoBAAMBAQEBAAAAAAAAAAAAAAECAwQABQb/xAAzEQACAgEDAgMHBAICAwEAAAABAgARIQMSMSJBE1GBBDJhcZGh8LHB0eFS8RRCI1Ni4v/aAAwDAQACEQMRAD8A+FdNelWLja4OJxIqjUazzD9OTkqBwfmpLbCMCxBOQDORVSMvnS7MVKkbpAkfbvUdZtxBSs/b5kTQ97gO0PtpaVVnMDdAmKJtNbZ1BnafvxQelKveIIciPjNNLWy4lwsu3H+9BHZWG5t13+VKNbCwK9TNgKLptpJRew7n3px07y524IjJPY0vU27TAztMSIo3p54LFjOSAAAPvSq24k94hDKvn+/rGWrIOkbBaQNoigx+80Sf/wAYzI2zmidZL6baZUcgrQly3+4WWb0nAmtzLiyeo/G/6+0NBjZEJ0a7VwzEj3Hb7VdeMLM9jkjj8qp0rrhiPV9xIrNTdX1AEAxiT802nZvcIQSvGBBbjh7W0g/OD/agb4Z5O2J5Wri+8OFYCPq4qq8ot3C3A4iImu8MOAL48smLfSVr87fScf463JoAgHLAHBrkF1cWTYEwTgETmvQev6BepaU22ySJk+/b+leb3dJe0+sNpvSykD3kfFYnQE7pPbsN/npGupAXTZ3AbfpAoGyhO0KAJ4BkGjdYp8nJYTxQdvKkDaJMnvUVIXuftAzbrsSy1tVhgn5iqdXqbdu3tt79wOCBE1Tqb77So+xaINAqISZ3feqBRu5zELYxLTfFtEJBNw+o+9O9JqLOqtJtkNEFYrnLkBpEz/EeaK01xrF5HUxBBJjmqEAkXKFyoBMeatLem028FiZ7iKUnqdtSQFPbtMU1644vaBbiNIMfoa5rbuQ5jNdqAXZzOZ9+R+8a2upWwCPUoJ+qTiiLHUrKkFrjYzikKqWHpJC9gKntAUCJPNcTt90x1ZmayJ6D4Z0Ddetuy3DsUxjBNHarwvdS5+6vNvUQNxkVn7NlOn6SXIjzLkgd/aus8lzvbaSxaJn5qw0QELH9aMuiqcDE4m70jqMssFhEyDmq10+qtAb7TkEkfSYkV3iaW41zcfTtPb+1FXdOFNveoZCeCvFL4ZwQ1xdtYPaeeHSaxj6bDERO0Dmr1sasx/l2YmIMfyruNLpXuFiVGxdwX4qY042oV+oGTWkICQYVUnPaee6o3dNdA1Ft7RIwOKss6tF+kmIg4qv9onVynVrVnHoWTjkmlPTNS1/LEQQYEUFARywJvtJBiCdvM6K3q9sQ8KPmrbPWkW95aNDHhiOaUoUAAZDJMgRihba7+oW2wIMwODWrqCijnvIt1ncwnYafrLgbPNdATJkwJ/KvV/2LeLG6Xrbqm4VBjMxP5V4WSt7CvmeBxNdT4P1Oq0fUgU9aQZ9+a06RGtgNKjUIUWuJ9IftT8Zf4h4U1FoXGZiuAtfLmt1m5LjMpkCAa9F6/wBcuajpdy3cLqu2SD3ryp9UTebKkT/Kn1g+kdqmUOqGgWqu7TB3KTIMf1pVq3ctKscng0w1fIyCQcEUq1IhI2gAH2mvn2J35PJiUUYgis/neDDVNH1R+VR85lTDNP0gkdq1dMFjHmEHJgRNUsWKkSy/EYpNWz25+v6SRcFvjMvMVsw0hfcUI9wW7k7jEdwauZk8sg5I7YzVF5YcLESvY80pvhmMFNYyR6yJZSdwLZ5rQRXKxuCjGaiHJYqJIjueK2i7ixYx7RUyKETUtjzJ+STnY2fkVlblv4T/AP1rKS3jb/jPQvMa16phWPpk5j86haNs3QeLaiSY4oA3nslnYk4gQAaIt603XS3t2hjlj7VdyBtG6senqPOMwPui8nnyh9nUqNQWhlXmWPajE1hvsqhSqn6jiKThit4KkMIMndNM9PqgjoWIIHKmMGq6R6CTVev819oQ9jay16XGdmLpZGUsYMDiKM0Vy3buDc7QMZHMihNMzXrxYOArDIBj9aJebOrQMy5SMH/ijpttO6xtMG0A4EcNsu27Q3Ex39qpvoGViCCPaYn5qq5ef8OoVRsHGAKru32ZeJZcQSP+mtCkLuKyu4gkNwIRYvqgb0tMQCoqWpvJbG45IXIOYobTF0gbjkgmR/KKn1Ik2mVuw4AycYqb7dpNn63/AKnaQsnEAGqDXN0kz6oMCtau6jOzcg8cVQgW3b3egGODzULqhXILLn271Jbvn7ybkr7o5gmvugooGCPtn8q5TqKWtxuEBjxERFdR1AMV3Ak4jA9q53XsUtg4g5z2NLqFG2g8wMzOa4irUsFtnJx7UOlwBsTH+1EaxmuWgNo5mcZoZrjbHY5GIqTXfEmSDxj5xVqXBcld0k9hWpAVpED4rJM7gAFqKs+5hCx7mqjq7xGBvEjcxE5q1HxkAfzmq23jMhfyqdmUXB5NOpr3hmObPMa3Li3OhKDMIwX2pS6godoOD7yKO8x00FxDBG8HNBh2ZCABE0rFrxmAg95WhRezAfIqw7BBmB71FQ24DAX4OTWyG2jCgDI9qJIAlgFJxPXvCxtWfDOkuIQ2I/ORXVWgbrKwU7GiduQTXnfhHrzP0pNKAiW7TBTB9RJ716d0S4LulWOdsiOa2pqDKmX03APuzYtrbv8AAUtwdtWXLJa3bksQrCZ7VLUpuvWDAg+kA4NGXj/lbaBhc9YwMmnDMVyahJYj5xTpFCJf3CPVxEzVKBbtgLB3LJiP5UXp1dW1fqAAYkA/aqtn4ewHAWdvM4mu03rA7zStaaZ7zxrxy/meItQc7RHHY0D0bUsbmxgRiQa34s1I1HiDV3EYZaBtNC9Idl1IBaSKwjVtyxE83cdxE6IX4YQwMnE5GKywyLfDEFmAIA/Ost3HJC8AZgx71VY3XQrs0bHPPE1o8QAUe/5zK6iFqI5lzacNeDW2KCfURxXXeCtc9i6phWAMEkCa5IXSUZd5UkT2p94a1L6W6sfTk4iuGvsWwMj4xtKnYV258v7nb+Ler210frUqCsERXleqay1w7dw3cgESK7XrusOrsjeZMHJrzzWWW3vtYoefgUg9o1GUFjX3ja2mFex3ll83URYh0HY0tfWKW9QZAcZqx7mpsrDjzFOZ/vQNy/uUnCdopPGVmsDj0mQLZ5+ok/MTYsNn2jvWnu+YrAkgDJJMf9/KoMEYSCBMcCqbwuKIRxIPLVBgG1LY5Pe45Uk5H0kbjBADJI+IzVN28MOASRgg8/yqq/curaUtIDEiYmaqL3LkLiOAo5BrmG4WxuoNQ9VXiEm7gAKB8jmtJdVCwO4z7cVBFcTIggZ3Gq9zEQGHE1PFVJkNZxL/ADR/Cn6VlVjTkid//wDmspLTygoTuGL37xRQNoyDHNSRWa6CylUXkj+lXnVG24ALEE8sJJ+1CNfe0twSQT6oGZp2JDHt+806jLlWMu3paeUlRtMCrun6gQ5dobOBMc0sVroMNuKkZnt80x0jNuAWe+GzimQlQNr3EVSygiOunXjaRgGBgfmKbWb63EbfiFneAc0jtfurQZlaSOSf+KYaZhY0wtKQQ+Z4NNvIBAOYy7QevmGWNS2wl3xwG96L0jOzFm+lBE0kuC49uGYQGEKDEinWjgW4gkRk+9U37RtYx1yQVMKS4EuGFxMzUNeWO4zmPetW7ouuVEbZP5e1U64lnJLnbHE02mb0284g2gntA0ggAyGj9RQWpuxclt0D00WVdjwdh9xFBtbK6gxuI7GoszhLY38IpONpOJTqb4KHBgYmP5Uh12FcwdkZinutusQeZ9jxSDVOdjD1gQcAUtZ2gUYoO0GxFGquQAvb+IDNBao+VYJDTjIozUKZE894E0LrCx0xIA3SIMcYzQZiTj4SdjbmrigEEQSV94rFuxgMQAeCK0CysCRuBPxUgXKgj7RFNu7QAHvNtJEYP5VhYrtG0e81tQdskRWzchgCJHH2qhLKRnMIyLJk/ML22UCQYkGstt6B2Bqu48LyCZ7CtG4SqqDEGT7UNR9xwZzndgDM2tze5xEVhcldsmRxWtpU+5OaiDtIkZjtQoVUuN7YIxHPhksepIstBUyAa9r8LXmGmy369prw/wAOXtnVbKgZJIMH3Fe2+GWM21DKwdNpI7EVXRtTmUQkcCdH1BQ2ms3NsQ47Vp7QNlBJncJCmi9Yk9I3YAEHOe9Vom9F4KzMjvVRS7vhLMbI8ov0q+ZdvGSY5xS3W3/w9q/9QRLZJJx7080thg2q3qSNxP5RXO+J7rp0zXkCQtorIGcCuVVZAD9YzkbTtng+qvl9XcJJMmfer+j3WTUxJgiKBuZYsAY94o7obkasYn8qyqgIOZ520k0vM6bTqbtzYCN57/FL+mFl89HaXW6T/aifMu2pvqdhU4g95NVaFdRqNTevvbAVzCqsZ+a0LR6SZc+XeWtdVGWIIB+00botQyMdhIkxjEULqR5Zj6TOB7/fGKlYFxjKiTBEAQPziqaaLqsBfM46gQAxvqNa7QpnA49xSDUa1NRfa2sD4PxTnqnR9d0DUDT6wqty5aS6McBhIpT1Dpv4XpnTdWBD6gOxYnmGjFX9p9kC7ipqp2prDVAoZgjseRAIExnFC31F5B6STyxgUTcuORIMd4bNC3bkqDuk/wAI714rODjmopBvnj4QNrYQsBgnNDM90rAO5vmr7gdgCTicSOagSrbS6krPvT11kniI5s4NSJVm0p3ElO33+Kru6VrM3LY2m2RK9+OaYaO22pu21AhA0kdv0plb6c2o6h1GwwgjSFwI/hz/AHrRa+DY5kVZrAOZz2lvfizcUsUYiRPBqBVkZvSGUcGeahcT8JqkIlkMEGOfenej0wvHVacIdzJKGDz8VlPJEuSioGAiHcx/1gfG41lUm7cUkHBGD6RWVcaLQ+Gn+X2H8z0XU6pTtYMQqnCHtQ2nKveVlJ9Myx7VWzHaxKgwJGO9Ss7t6ww2nnHesxZWIB5EXVZioU4uXXWyzLIDeox2q/pi77pmAsYX/oqooWgg5Ck8HmrLIC5Ebo7UFNk3WJRQWUKTHNuFRluSx/0iMVdoSH3SYVRIzEULaJxIG4jlV4qdt3tZBhSI4k1TlgxwDJAPZVbr0hqXVa4m1gD74kU1tMtlNqzBE5PNIFI8xPT+kz/tTQ3tmn3buOJXitivuo4zn7HiMtJjvM/E+XqXBBg95ioXtYrqcGDjmg3uh7yszgSfbmoXGVrhIJ2weBWIOTZr6/z3MmoLG4Rp9QrA72KgdweaHXXhtVcXkHIM0OrKFPpnMRFLtU+y4WBAI7wc1wcM1MK/PnODgCvnGeodb4JGG7r/AM0m1NwOpEHmTmtvriGJPccAfFC3tWLwgrBP5RWq1JLbvnOcEHJyIFqm9SyGP8qF1bltJcnM8AdquvrDmJgZqFqGYKSY+Vms/TwD/UBcVkznkBN36SDPtRAtOV9IIByAaY6dFu9SuFFHoH2p9Z0qhEH1H7c/FMCpM5Rusg4nJLp7m4Dy29hAo8dE1XktcFoiBxya6RNON0kADnI4ouxZZQSB6Yz70x1aArj94wXNieeXFe2+11IIxB5rCRH0mJp94uRLV+0UUAmZ/vSE5x2NI17sztp3yLHyxIwSe0GtO6kCSZ+1Yp9RByfbNQuSo7c8RToB3hLXxGfQri2+qactg7hnAr2Tw9duWblreNoneIPY98V4j09wupssYMODBEHmvXOk3L9vqemk/ub6Mi/+JGaYahXU2zRpqdvM9Wtr+J6KSRnYSI4qrSgXtMhJAJ4AOOKs8NMdX0ocSVI+1b6aIshRJgkcVYFVBo3NHuiwblGlRrf4lyGJ3mPbgVynjy+NJ0PqDEZa2ZNdpfXy0udlY5E15r+1TWC10HUAEqWZUGOf+xTbsELUg2BPErjMoYkkTk0x6HcH44BQxAA+1LnliJM+00w8PL/nyAZEe2eayKeCMmZtMFc9p0F02rtvZcwrPtECDk0Ze6Xft6+3+GgW0GC559sUFrE/zOnQna2+IIxXTOgt3yJAA96YuABZx3mi+nd3lHRPBdzrPV7KazW3P3tyCbKCRXoP/wCiF3T2g+n190EeoPctTMZzFc30TUtZ6lpzbdQ+6AWxBrq/EX7Rdb4X6dYtpe80MILNkn9aqmqqdR9KnDS/8RxUC8Z+AvEPifqX4pr2muXVspaAINuQqxNcJ4g8C9f02k6dp205unTqw2q4iSxOKj43/aZ1Lruosqmo227ay23gmMzWeDf2i9R05t6dlTUIuALwECecmi3te8OK9/n4fLAkV0tNiFGDOa1XTer6VCL/AEzUooyWCHNLLyPbh7iPaVjILKR+tfQXXP2g6fU6FrVzpunsbbW3z7LSSft3rgdZ4m0j6bzbmmtPbZobzAGO33HzWQUDY4+82HQAG6/WeZmRAZjtPH/FV3VY3AUX0j5x+ld3fPQNfor1621tLwBKIEIiuKuqouGGLg5JiJrhqWDXNzDqocKDZMYdH3KQQPSJME80ZY1Z0/jDRlm9F5fKMnJBBH+5qvpNhbenLkmO0e1Lev6g2ep6a4mChESM+9etqEf8ZVIGMzJpOV1xM8S6BdIAoU77V1rbEjtODV3SNTvvWGJ2tctwB8inXje2uq0Tam0Bct3US6WAODGa4nQ6v8PdssCSyPIHx7V442sb/UT0tUFS11nNTrW8N6S6xeGG47ole9ZSxr2susXDhQxkCeKyq2n/ALD9P/1M/h6f+JjR2LFtwI3H371dpQEMqScH0hsE1TctiS6mADjmpSVVXO2BnE1m8YE7bqPqLYvuITaJgiPS2ZJGIq/SsHV/W0yMD75NK4uM0oRsIkQDzTLSOvmBQRtIhjEZp3G47R38vyowBVaAjXz5MBm47nms0ZfeJO31SF9xWltm5lLimD2HH3q23bNtlckBx3rgrJSqcfECTzybl6DyrzushFzB7n4osub2laQUxge9VOPMthpMvywH+1ZfVQotkhJEZkj9KoSiEUf2nbKJqC7NlwAjCnkkVjOCSgwYyTjmq9SoW4AWAMjiYOMVnlbgwMmB7TUx3JPNf6ibyCKFSgsCQQW+qeeKXai8A+W3YkAZxRl0lgQrggdtsRQL2gbigiPuDSZrbAx20SJVdbYpHMiQW4+1Am4C/wDC3eKZPpyilCygA9xSvUWRMhonkxTqVVjurPwnZNlhRMhqLgZgTJ+astqFG7IJxIqFkMzEEiAD/poi2oukAkyfYc0b71A1brX+pq1Zt8i3BMAkd6aaPTtatZUkEzAPFBWFhhOecFcGmVk4I3BRERBxT6YBbOPKUsciXbFuqCVgz78VeohAR3MZ96p2zEjt3HasW8FEbxDAc11hhY5udTUJy3jG7u1dssIaK51nAQ927TTrxf69bbKngGQPvSMoSrH2NBqOTzG6zkzFYCRUSzLxLz/Ktou5ySR+QqLAHAb44zVUYLzmccSy1eKPu2yRXrnStQz9I0OpknybytIPCtivIVUSVBMqZ47V6X4bvNc8LOgbG2D8lSDUzQIbyjcDme0+D74OjK5gOyle3PNFaFSj3FgkSTHvSbwZqF1Gkusjf6twjOCKcWWKpvUid2SK0+JaA1dzTu3IQT/UlrHW2jMQRA3HM14p+1zqSjS6bRqSWLlyWxjt/WvYesXCthlSB5mAe4r58/adq0v+ITbDStlFUj2MZFNqum3aO8m6gC+ZxzEliPjtTnwzD60DH05mkrGHwZBHtTjw1C6tjO0xGTzWUEKLORM21rsTrdBbtXeqWA+54YkEmKD8U+JP8P1FyzZxd7k9v7VM6v8AAsdV9flISoGTOf7iuB1mouajUXbtyd9xpJI5oLtJocSzOQKPeNdJ1q8Lwv3L13eDIO7vVus8SavqJCX79y4qn0y3H5UiDfuwpyScQM1JW8kwe45HNAjGYgY1UOuaphgZB7TUBrriKRaOw8yDQe4zgkzWnglmkMD34pQgEIahaioxt9Z1IIa5dc9iCcVO5q11tpZvlGGBbgRSgKzZHFaWVMkxmj4Yu5xZqyMQu7usuIOZ7GmNu/YvaRfMGy4n1XA2D7YpHG4j1c1h9p/UUdpxmqiXnm53tjavTlKxu7xXL+ImjUqOcTzU+kdVK7bF5x5cyvwap6+UuaoENPp5AxFelqaobSAExrp1rm4z0l27rfDd4XL+LY2hT2Fc3YMX0zwRxTTp6236RqULeoNMUmIYcZj2rzEA6hc2OSwBh92xd8x4ZYk96yoC3qWE+YM5rK6pO3852fmEXGWARMGDxW/PFv0tklok9qHtLbvlmG2TJkcxUmsAWlLKSFyDAx96zNplTRFG/QmasA23Ms3KjBlX0oCCScUVYuhQQQYI5J/pS5kDD1KGX44otFGAo+STiKZBeCf1iAm9pzH2jvFVgnDAGRzFELqR5G4qXxyKX6eNgLABu0DtVocEbIO74FVbbp01zPvIxWOI309xBaQkBtqzHxTPT6U3wtxkEERM0t0tlb62wM7V7DvTpIS2u1NygYET/wB/4riS3vDnyllINi8RJ1OwbesChd0cCePmhk+gnBxMTTTqNiNaLxUNbjgYnNJzsK+kSDj7RTgbG+Unu6dhi/UsQzEAmRxVNlJ1Sk+oe54onq+g8m8qiWLKOIj86xAqXcRvGMRFQJJHXn7TgRwDgyvVWgGZjLHvHFKdWhRZCnic091KhlIVe+RzSXVqptqSR6RtzTgNvKKPvDtqgTkwVB5mQBgmY7mrv/iaVEn7zQ9mCpg9/eKvCCJ2gknjiqEtpZPEnYJIEIstvwV2/BxRN3WlbRG8jgjNB2SrjfgR3FZci8xUID9/60gDr1cmcuLFXLD1G5dBQCFPLLUE1LIFEE5iZ7U56H4T1nWGCaRFuvuCFWIGT96h4q8M67w5qF0+v062bpO0AEESKo66jLuOLhDG+qcb4ruzrbBAJG0yD2pKbkIePfmmXiVv8zbgD6Y5+aTtxFAC6uU55lqqV/Otlhw2J4zVdsDPP3nFSYDaO0k5NOwIEoMnaZu3G5cRPOa7zwDqlu6a7pbhMA7ufeuCRd+FyO5px4Y1o6f1W00wrGDNA2crOWsAz3X9n2o8jztIwIa0dozOMxXYC5tsMIJIPIMVw/hkN/iReMXbYkzyR7V2Odv0ndPIptNtwFc9vlLkk2LwYm8T9UGn6c90yBZttcJJmIr5t6nq312suXrktcdiWPvXsH7UusnQdLuadZFzUEoT2gV4vccFxuxSEHkSTlSa4keW4z2FOfDAnWErjHvSYj1wOY57U28Otte4/AFCsWZAHNDvDuvFl0AgECATtPauWuNuII4PzNdxf0iarp2rd8+XaB57zg1whUBjILfagnBBHEtrYqaBI4/WtlXDKQJn3qRIVcCsYhgMjHbvVSxx5RQw27jJWZgqygZ5JoxdMrDj8qDtLvuDkR35pnp7o2lYJB+ahqMe0toqt7pG3pkCiRMfyrT2FuAqUBJ/hFMNPZDiCNvcS3NX/hFKyBn781lOrRnoLpKAe9+U599CoQ7fSfvQro1ufaYroXt7A6m0YHel16y3lxsg9zMCrpq2aMyNoqpisuVMgCRV1+/+IUMYUxk1QRyazlTWo5mAgAxh0u4sXbbCQ0Rn5oK6vrYcQaI6Td26sDbunEVRq2B1l6BALk1Me8RGaitCFrqWCgbhxWUDWV1Q70nY9Eul9B2DISPafamNrTlrALZ3E/UMTSPpm7T67U6YNgPPtNdMbRW0rAyCPq3Y470hIDAGsccD+Yct1ViVppt2meVAuBeVihmV9yyGJ4knmjQfLtKiGSRuFAXw6wWJBAG3PFIHJYA8/D+Z24nFH6xlpw4LKJVSMDmjNNbubFcnaZK0uViUD5k8wcU00lq5c06lbkRPPapnaVpm54EQg8kcZ+cc6C61tlkD1QOM/enyFiFO+GVsAZmkGl07KqOWbAHAyc050zh7bBv9IkA9q1q261+nH8SpZduf3ktcrXFMfUMnbEGuf0tlzrFRl/dyWOBTrqQCWCUZeBilfSANTqLjknaqxx3oW28gtIabUaqDdVQtqrTgMBExH0/alrs5cuDkninfU23MQWk/THakt5A1xjMse0UNRukbWv0/nt94hULxxNXrcofikmqLF5htvHODTog+Xc+3AOaS3rcBhuZffJ/vRezVmWvFbYH5m2T9U/PPzV6ksGVhK4k0EQjE7mPEiitOWBWYGe9TJKAWRM5LAy+3ZBtGeVOYrdqTEqEAzPetEyjEHjuRQzboGZ+K5nQvQyPKObWz5z1j9m1y4mlvkOcOCAB8UD+1u8+p1HTj3ClpnkzXJdD8WdS6EI0rhPUGJKzW/EXXtX4j1Vm/q7is6zACxz3x816LOnghBzAiEMCBOI8So41dsFSCEHelbelD6+fim/XU8/XgtJIWJOKVtaUEwW5HFZGKsbHEcdVkSP8A68VhLBgCcVd+GBYgtAHuKibCjj+XemGbJNxjYOZWJnkjNW22cXkZTkcEc1Dy0UiQY+BVht7SDg8GOaSzfRAwrE9I8H+MB51nduDp6YnkfFerW+qW9VpBettiTK957141+zTodrqXWDf1SebatYW32J7mvUur9NsdM0W7SXXtrcJDLPH2pUBVQV7S+kdygGeKeN+q3Oq9e1Lm4XtK5VB7CudvbiQd2Pauj8ZeHL3RdYt625v6e6SQ/sfY1zV23vYEH7mhZB5kWG003eQMj3bEwBTvoKFkubSZjgmKReYCI4nGaf8AQoCXB6gfaPimJwYFVbzGnUb76bpOpRTsNy2q/l3muJLFGJmD7V6C+hTU9N1SMJcqqpHM1x+u6E+kVzu3Ac44pV1FAAJmkq7KXVcRbAIkt+QFaX1NC5asJPAJmmGis72UwfzqjOFBIkgniAVIaTT3LjAtwBMHFNLe5w07lI7ZqAtEuPUzAZmo7xacw7mMD0nisLMX45np6WmNFgSKB+UOsDyZIJJgz+tEi81wLKttOJAoXSX0J33ZQEYkU502n0eqsBUuhmOYFZnJBNmeilBiFNCKtTuYbgYkZU4pdfU7TkiR34HvTu/oBbfapwfcGleo0oVXEYOBHau03BMnrowPGfSc9qUliZke8VSRReuAVlMt7QRgUJwMGvXU2BPAei13CulXGt620VmRxI5qGuO7WXjydxMxE1PS2rgcOgYAeqeKqu3Va9cMly/JNKK3XJ2SLlYiPq/lWVlZVdxk9h/KnWaxE0fXNOxIIuCNwU+9dI6qumjcu2DIYYifaub67YYWVvRBtvM0y0+pF/Tpc43LMbo/Ss+qApDLg97lSXUAcwy1bDWiR949qrvWhteYPpBmIA+K0i70eRACkkGealcJKySJIggnj4o9RAqcSSN3eT0jHaUhWUfnTvTr5YCkkfwiO9cxZm3cK8eqc11ekJcorwMSGBobSBZFD1mcFX5GY2kfhxDBgqjO3Joq0fQ7YHAURQaqibzAmBEtVyEleRAFakYLyB8OblRk13lusUNpwBDMY7cUt6DKvqC+FWcUTduwS4QF4gk8cUu6UzJavhvSWMg7s0hI3GxzFL2LscS7qCG6hO5YGcUsUqWuN6SZ75oy/wCmy0cj3PNLVIJO0QhPvSMV3cf3ENgUDIMS63TjBMAClusSLJwJIyeaN3bbd4AkkNHPzS7Vv+6IJI7zXAn6RAGA5i+yCOOOeIoi08kMMjnK0EJLnkx2BxFXWQIJUHOBmuFA/GcVzVw22CwkuoEe01gtcGZkjJFDqwVCrcTOOasVmZY7Dg96CgF7Iz2jD5S6UYwxx7RzUlsk3re0woxmo2WDMDBaOSxogKBlUDMM4PNFrI4zKqTYIM5fxGZ1xAcYA7YpW14hCAViaZdeQXdQx2w4A70qa2uwgwPtzNO4VRUKqpF8zLV5QZZo9sVeHRieGkzPFCbQx3AhiBJlqwMS0iDPBrrBN9pxF4MMUmcQc4A/2raKC4E7T3mqA5bEDGJmrBtjPJ9jQwWxHvdeZ6V4Gf8AwrpyX52KSzFh7U71njK1qwTeup5YjYvt+Vc7p9To9L4bXT39SmluhAyi4csIFIek+X1W9eKGWsLuCyPVS6x6QsGm+yqnYdW1Wl1vTblq4p8m6pJaMowzIryW7cG/BAg4xzXovVbovdDYs24bTLDkCOK88ZFJ2qCfk/lSowogD/Urq3yamtPa36kEKI5IHaMmnHQ2D27pDAbmMGOKVaTWfg/P2ek3E8sknseaa9FVfw8jcMyTNEgsLPEiprJE6rRts073AAQCSvecUD1NAOj7zZDMzbif4fvRukdU0DDbBPEUq6jeZ7DacetSMjdx7RWTXUK4cCezo6p8IpOPu7F1DbDInimuhi2yqVBMHPNLHt77xUqQQeD/AHppp0lsTu9uarq0VmPQB3GjG9qxaIlrgXuIXig7+oe1eCpaQzgMw7UdpdOLqwBmO9Mz0q26jzgbRj0v2rBdMNwuez4Z1PdMQX+qXLds2rlm3vEgqonEnNQ0doXLqsoFvcZxR+s6aDcB3hhwSO9BMha8DuMKICg+1Pa8LjzmRtLUGp1EUDGWu1p0loKxbHzmuf1Wtu3FJ3KFJiTg0fqtQha3LbjAxOaA1yHVEEptAEcxNNpBVORD7Vqs/SpijWu7EBysniKptsquJ45zV2uSLkAkQO5oTyz3Ir01rbieM5O7M6G/1mxd01u0qopVfqAikPmAuY/WpQKpiXIGM0FUKKEUsWl2+sqkgg81lGolCeg6zTNf0rISDIIiKX9Aug2Xtsx32iYx/wB705Zi1zBIE8Ec0jQnR9b2BtqXQOCP+81NixJDR2I3VHYuLA3XCQcTHP3NTZiVIBCqoxjiqdK+1nHrKqDJAEVeXNy0+GiJ2xJoqpYHd5SVkj884FaUJrTL7lbMe9dVp3Fu2hwRyccfFc7bmzqFaGWRIkA0+0jytr6w38M02mSoGeO0II5YxmmokN/6jJFEK4NnbugzzFAooQvO5pg/lUzqDKyMDM8fatAXZTLFQo7F2hFssbFwyCInPY/nQehukFmYhjx9qJFwPbIIMnjPNVWLgAYmCBE1FrbrXk8wqu1gt9pRrCGskSASeZpXZvwzDED3maK6kwCtsHace9CW7+07gpCxkTxXf9qOP1igFhgwcXIL5HPMc4pfqry7WWRtiJjNHm6QGjjkt/0Ur1DEs+4xnB5n44pbY88/OAirxBkdi842GRI71ZacWxJ9I4n70O7y5Bxj4zVttyWHp44X5o3i2ENbjYl2dpAcsQeKskyE3CPeqrLnaSAZngxVtq5LEGYBjAodQJWdjdk49ZZZubH2cg+1HW2AB9QBj86X2WPmCCAO00YLoDtOABz80UsjdcYAFqXicn1u7/mztOCAYFLGlw0nv3pl1V9usKzmBAoG5eg7eQOZorp0QDmXFDPaUXPVMGG4Psa2xgA7jmsJmefyrJgmJGfvVRd0sXgG5KydwY5/vWOQvDEferxc2gdl+1DFy5afv70rBgYThcDmX6nWPq7iXLj7iqhQfgAD/aiugdRTpnU7d64zC1wxTkiljGV3A89q3MjnNd2zJjAFR71XxM9/T3NLYXZp95ZZyx9s0iFyTO47j2NYWO3OaqJGMGphSOIxa+TLsGTIJ9u1dB0UltEDIHq74rn1aRkfyrpOlv5eit4aOcV1mqr0gUDgxu11US0rXNq/wj+9CXNEd9y8zBUHv2FXXNRvWwDJIUTIFW3Nt3Q6lATlNoMcGk1FO3ap+fwmtNRUa8TkA3+YO0yhP1UfpSRdmZPYgUFp2iATB+BR2nU+buUszRExUHz0yyURuAxH3TGFq+CeSIn4+1djqWs9Q6Nbti1N1BhgBxXHaAb3Bk7gJg8iuu6Zf22CCYMd4mvN8QoavM9/QQlK5/ac3c0i6W1du3bgESeM1zJF7qF8lEIRW5Fdt1xEv2LlsDbI9vmkaPZ0lso1xpPEY7VUNsvuZPV0t7DPEGbw7cs6YXrgAnjM/wAqGGnm2VLAZMEDIop9aNxti61wEjOBNZqXVQQASoGOKnue+qZ2GmLYG5yfUoF+A0iKCZSTg0Vq7vmXnMznjiqWQASpJ9wa9pLCieCxDsWlIVz3I/OsX0tJq0EnkRVRBLGPemGZC7k9y+1ZUfKf/prKNR9jeU9EVGUkn0ySBiaT9dW5bNrUoCBbYDjtXQAW2vNc9YHcAjH86C1Fj8UuotkQrAwS3EDFLtYEE8nzFfvEYkAkTWlum4gKjDqQGVIq9WulGWTMZIHNJ+jX/MsG24/+MkEzmmtu4jbT6gvGCTNTYDYQ9D0/eEAhqFydn1kkIQIieab6Qk2lWCpGQYzSnR3vKY7sAjse8+1OtHqE8kPzPsaVE8Mbgb+ERhkgen5ULsXAZ9RHp7/0rGbcrbfgCTQdi5LEbZERMx/WrphjO0ey75JrRply1fSNtVcy+5qPLUicxj4qNjUxaJZQCT3j24oLeGZSVgFsmck1d6EsXCCJJiN1dp2pog2YKJIs4MC6nqHuGAVAn6RiaoCsAAqkfNEahUcbiAW+Wj+dVWSAWxE8Q1cu42CPSzJkKFvmC6jdDkrg9xiaX6hz5bScnE0fdLK9wMm5ckZpdcBAkyF/hB7UrEqRsEZhu4xFwk3DuEn2ImiUIYAlMHBEVQwVrjEYg/xVfaMLgx8k0GzyYptTUuslifYDMe9Wm9tkARnmh1vATIB/OtSRJJ+cmaAJBYQbbxLN7MyhVPP8qutsyM4b6TEqT3qmw/qBGSBxRNs5ZhhiMiZiqabELz+fSOB2Hac91hlGpJAk/rS4uTJiDMimPUrQu6lnAPbIagTaMN6c9pNCgGzLEUc4g8kBiRmpLuBXBE+9WCxLncIURGavOmUqTuLEcCqk7RZ4ir1GgZQ912XYcgewqoArwO+au2BQsYJwYNRZdh5qYwaEcntK2gLCzPzWAHkVIKDJHbtNYskDA/XNGyTEAoYkJkDuR7VkxUwihgD7+9WWtL5hyYE4APNDcO84JcoA9WAWBrpNEPL0CAsRiQOKWW+mq+4+ZsC4iczVqaq9pkIuNuVR6anzxOOOY31upOnt2rswCQDIzH2oW71+7qCw0lsW02+t3EzSi/rrmpXawILczOaqRyqMowpOSTRINZj7uQe8uQlTEY3cGDTHQ3/WAuDmIoK2JCynOZBqaEWLgYGfiaiwtRNaIQQs6fSvscSSBwTRza5rKFhJ/KRXP6bXo+ZKkiOeaPe4PIKkncO815mqgsCrnt6eodu0Ga1nV3ZdzsoJHBpWNUrOSiBjghnPFHXdJbv21IglfciaoCpY3qbUsMfarKBVEZmYjUdhfB9YBqLksFC7M8mrV8/UWPLtKz3TgKOSBWr7o5JddoHIBzQWn6qbGvs3LZICngntWhUsURxM+q4V9oOPOC6nS3bBYXbTW2HO4VSUYofgV2l3q9nV6eL9olSfilGu0OmvITZx7QaoNYEAcTK+kVOG9O/6TnHDDitpbDDjNWXkNtjNYh2tiQT7VfkYmNlNTPKcf6f5VlX+Qv8ACv61lJvi7z/lO7a6wNtiQoJgFEH5zUbwlnXdtI7wBWxe3rIYtJMY49pqF1BcMvdIJxJIn7RVmveGZgOb4/iTYGgS3PaJrbnRdXe2rQt5e2Ka2r+y+U5kcEDFJ+uAWtRp76mACVJIpit2Lw23IBESwBiqMikFWOJZWLC+4hCXYvFi3BgemmOkvi3ZVW4n24pMQBdA8yGUyAcn+VMLZOxVMtzOBFZN5RtwINyDUDTd4z0uoENnMCFgGfepfiCVyDuQnaMYoK3qFtJJhpEYxFSXULfld5JA5xWsDJ3CcSQAO0uLCULLuYdsYNZ59xVKlsbZg1XabMbjE4g1BgAz+osDiSPvSB3qlxFU7gATJvdZl5kg4IAiqrd5hcZiRtDQFA/Wt8LAYjifg0OtzbfOce+2lzYURaxzIaq8WLENk42n3oG5cm2S7mRgip6qC1yTxkDHNCugKhgSD3iibLbmMtYADEZghcoWgwDJmOKkb231Zg99tU3CGBm4YJ9xUiykDc5j2oBbNjIEk98jiTtv6WWctkVYlwwRu+IAFDi4isSM/cVsPuxMCO4mi3LBeJy4scQrTOVfOPmRRT3iJm4SSMYpfaPrEEkj3GKMkEZYiRgxNMlmjwIQwNXBHXzB9WSfpiofh02b8EE8EcVIMwJOJnkVhdgshjMcHiubduJHM52owd7Fte8z7/8A1VflKJIfbOauulmJO6B2ETVFxmZQ0T8kUub4zK0VkAikYXM88VptOWIjYfbdVg5PqO0HEAe1Vn0tIaSabcRzz9oeRKWVlY4kfzqWm096+6paG4k4gUXp9OL9xrjsImDNdD0xLWmCpaAUAkz71NmKra5ldLT8Za8oFpPBmo1YDG7tuNgLtwD96TdT6ZqelX/J1ClWXj5Fej6TqC2gGEzM/FKPGVs9Z0YvETdsiQw9qlp6g9w8z0NTQA0947TjBqDf0rruhhmhruouRBuE9vitWnCOpicRAFRuKFQZzJMVbijPKUWpm2YkgyTj7VsICvIwc/NRYqIEzIxAq3SA7mtSOQadlCixKEruB7w3T5tJtJLRERUntsDt2lSPj/ip6HAUHjuImj71lbYDAyxnEViLrheJ6dWu5TEnmNp7gJuArMjtFMNH1dCCjnJMA1XeTAwT8DmtL021dYutyAOe0UWCH3vrI6YdGtZ0Gn1dgLBZgD7UNruopJCMFWRMDmkyWmRvTfZonMfNA63UOlwolycc1BdHqsGaX9oZcAVUu6lrfNcqpEd6XMZ9XA7VsCWEtJHua2UVi2ftFblXbPLLs7EiNtx2Bg0EqPtWiLqCFG5DyKs0Lg6JCxPEe4FTuGVYKSR7kxWI4NET0LVsnvFWqLXO8kc0MDJBOCKY6khZAOY4oBQGNalOOJ52oNpuT3/J/SsqUqP/ALrK6/hL7V8p2QuKwErDBtxIP+1Re+imSQ88Y/7igl1X4QsCDk5xB+Ki1xrr5SVJ5B5rSxogkfnxmElWFY+sr66qXNMjqAGVwZ7Cmgso+nskQbjAEwBSbW3FOmujMESJpt07UF9OjjsgNJeN74P2nabEKAkqullugAT2P60ZZO1fU3eINUXFLB7ozPH5VFXZbYN0QpzjvUmNsUX8+XygK7j18w5lCk+sEkc+1Yv7tMQBIz/vVdog2XAAU8nExUUuQ0HhuK1FrO4wFS7Gu0Otubl/JB+/ats2SmARnHeh7UqYCkiYB96y837ycA+3/ftUgjo3wi2tsJeR+7EGQCC00G4CuZbdjj3qJ1EkmDI4j+1RuXEa4w3bm/2oAXR5z8oAQV24g72xuJGGGM0DcuG2HDAD2I4ou6RbubdhAPJHNLtbdLWX5OJk1xFHPHaMuwYOIHc1KDeABHxBq0EuBtHopbwT81davlSuCEPANKOkRrxmHo0pwAR371gj0gkDPMZqGnv23IVVyOxqxn9MiMYilzuNCKAt8SVv0uGUzmiid4mZP86BtAohMg5nFWHUev6Sc81ZgQBHoe9LBi3J496017aCZAj5iqhfVtxMwDJFbF9Wn5IAJpW6noGC93JliMrEw0e5iosNi5gD3ArFXapgQePv81JjiNu48ZosG7Gv6hAU5uQADktG1cj/AJqq6iqQQcTk1ciFYkR3M1XHnX8TApCbtT2lUA3CX2Le6NvB5HamWltvtC7ZHFDaa0SgXke9OtFYOxRG7NYXYtgCeoigACatAyFLR7cUamnW9bZCeVIPGakunwJVty8we1G2UYNAXMYJ9qXaSbSbQBW3vPLNbZOm1z2wSCHiarvWzySCZpt4jti34gv/APk3+1LroleDtmt48zPnm6WKmVFIiCu7sImo23KXgwjnNEFVmIhv6VReUIQQMNRzwYWAqxHltZVXQDafajrTpdENBPGORS7oGsR0bS3WCEn0N/tTEWGs3oEkd/8AmsOqvYj5T0tJrRe0jd0yeYxUg9gaEuWwsjeB3xRzWtrYQLMwTmqDYbaYyOT7VIV5ypIYdIgTFUsEnBjt96R3oe8xAnNO+ov+G08LHmPiJHFJFBfcwwB8Vv0hY3dpj1zkBuRNH6lNWpAM4zWJZ3opzM0QyhBDGTzFOzUaMmve4Voj/keylSc+9EeWoXcdoxPIoTQuRYcRtIbI+9F+XbQMWEGJwOTWTUweqagdovvAb6Iiqd3IPIiaXOIYgHE05vx5cECIweYoPS9Ov6wk21XB7mraTGZtUbqbvA8/x/zrKdDwvqSJ9P6D+9ZVJKn/AMTDNo1D7i4E42nAqwaeOJ+wxist2y14sZDk98xmjBZc+oZB4k1ZtMgMDWPzymTVGMCJtWn7u9t7KcGr+jX2/DIshhtjIyKOu9Mv37d+5btu6ohLFRgClXRAV3jMpwD3pxp4px9a+3+4f/q6jG65l9pUnsAMxVVq6blvYTxiavgksfoEYJM5qmwsSscmSZkVAjYaA+/+xFF1QvzhVsjyvVBYY+1Ss72YZHp+f51U8C2QCfaRjNWaVgbLANLHBmqEgG1z2jthjZzCBcIk4J3TJ71ot57kGAQMCqWvMtxQVMDjNQu3CMCM/OanktR49fp3xIncSSJYV24gDH8/ehrrnzGjg9+asD7wDyAcgA/pVNxg11hHqA5nvTbG0zfEcAtQHbvKnaeRIP8AqPaluruE6YyP++9H3Lha223B43H/AL8Cl98+YlyBBPzNNWSStGHpJsRcIyTBPYg8VJgARDHafitom1xuFbuQHEAe3MCgVINVHbLA3chabaZBMzzOKNt3QykYE44JoW3u2IVhiJBzVpAUqSIJzM0AtnmAg2bEKDFFkFRH5TWrmAGAJPfuKrtElIgTM54rd27MpBApn01BFzgsrKk5DcHkCpkYx3zPaaklg3O+Y4FWjThVnnIGWqQOdoh2kmiZSLpVhkbvias3MwmASDM1MWcMfSxC8H2rPw+4kY2njdNcoBBrEsha7GRIPqCQFiQcSBV+nU7iuDPtihwvqUTIAyAcCmOkXcQTBNT1ECjA9Zo0wAeqG6WAq8CYOCc/bFN9KBMET/4kT/8AVBadSoYgGQfcj/vemVnAV9wBjvyMZrIVsjvX55fvPSQBQBcsJJZTtIzEAUZaG24JBIIiIzQbqWYDaWtjuDRNq6yiAoCgQCTmuCiugUZbLWTwJ594pkeIrxmSCPqPxSy6SxkAweYGKZ+IvV4jvDvMT+VDai0VVVB+CY5raCQoBnhuWLEgY85DaGb0qIABmCZrGUOxDxkdhVpLJCQFGFieKiYRmgHaaNHbHBBFHmLityzcxKsvBArq+i9aTWAW7rfvgsCeGpFdtyksNyg8ihLgdLqsCR/CVNM+nvUWaMCaz6DDyM7xrarcGBGQRBmI4obWXbel07PcIUiJnmk/T/EVywrJqT5qRAZRkUt6n1C5r70iVt8Kv96xeEXamxN//KAW17yjVXzqr7MO5MYnFSSyLaGeSMVLR6dt0dyc/aj+p+U7oLILAATPvV2NMEHETT9n8RG1G57RaoHliRIiZjiidNpG1Nt7lsYX47VfobDtvvXB+5tifV3+K6ToOt0p6fdZ7aW+Y/iNVIUE3Jou0URYnGWiVuMoO37im1sFrQJ+3FC3yt3VXHQALOAPajRba1ZnDAiYBrLqsCKlVQNn6fD7wG/IMn29qadB/wD2jldpG/O7JpXeZu6gkCYro/DVhToWZlly5gjgUVNVizM7uC1g8GXO43H1W+f4P+aymH+H2P4D+prKxHW0weBM5TUPnOd07O+p27oyR6Rnmun6L4d1XWryhSw0yH1XIAEA8T3pF0G1audXtW77Rba4AW759q9pFuz0zT2ksqLVoGB6cH719j7N7ONZy+61HnzPNd30l23zAE6RpNF0+5ordsFLilWLYLYjmvEW0b9O6/q9M2AjGF969iv69XJZrpVhugdmNeZ+NV/D+KPxIxbeCTx8Vb2gDUUE8idpEsKu4I25CFZi0/TPaoKu15MQBI2jk1NQ24+vcxBjEVLbtUKIBIy35V4RQnH1mkpsAZoPfLAjbcJzJqNnUmyMSZPNYbRuWsCV9+CKCugw0g/Vj3ApdqhsRGbOBnzjH8SzsRImYHvWjchwoICjuRS23qD5stiOZotS77mB3DkD4oV5n7QLRFtDHYKRlh6RwKqeUfkmMQe1Q2EhcbyR3NYxJuGfVBAj4oFM0MiDqA3DmRvEsDtG2czApfdkoZeQ3aJo64CEK8+84oNrbZG4fr2qnaziUs2QRBLqzBAwORWnuIQAMGYj2oldMTc3AkDg1JNGHIO0Egwcc1x967grzgqWioUJJLcj2oi0ouW4Jh/YipppmVpX37YiprpSGLEgEcQKO/cDODDdcpUbnQg5+e1EshkGd3fgVpbQt3Fzg/rU7aQSAST+tJ0nuYAOqxIgLIJSQT9qmT5lsBRWAsScjnvzUlXBjFcEF2scAhsGRBIhcA/IqTKZBDCI7DA+KwhkluCPczVhQhMx7n2p9xC7bjk9QDHmA2xuvOZB/KKZ6MZgfTMGBSvTncWY8EkjP8qbaQQsSATmaysNpIP6TXpX2/WNLF0K5Q+oj2o4EFTugg/rQdtNgg5XvOam15p+pgmYzk/lWQ7bWjxfr8hPRW2G4cj4yVzWlWTIBBz/APdX6fVBrTGSCM8TNcz1K89t15CsYLAjP3oh+pixoXeQWgwJwe2aqexF8xC7Cw3aJtdeOp61edWwGke1V8sSwkiTIFUWQxuEkwxE1e13cIURMg54rTV4HE8wE1Zm2JYgwSKiWK3JkqIgAirVQqfpnHIM0NqHKsZMtxRUKI7Fl6hibLlyAoJioXJZoGCKkijYDx71G5MDA20MYlirBcyp7JUkkz96xU8qByZ5NWC87OByBjFSt2GZjOQOaJNQIpZwBDumWi+9yMD86qv3W8xxAjgGmWnP4XQvgAsIAilFy4WDApxgg1jW2Yme/rKNDSVLzOq0ypc6fbR4ZPLUAEQJ70TY0WjRBvshiVMRnPtXM6DW3LFlyxJtgQFPAqi91vUXNy+Z6f4YphpAtdmeTToQxxct1F0PqrxFtUUt9Kjj2qZ3WwG3RjmM0DZeFJYZPeiUuD33AjvXMvlxIhi5IBlN+6xBEz9xXV+Fgx6cGI9Bcx8D3rkL/qOWgnuK7Pw6DZ6Ra2qSeZjmqpgihciEG6qx8Iw/Cu2QVg55rKqNt5MWGI7HP9qyr+Mw/wCg+k7xVHc/acxbvkKXAAZTuyDiPmvQuoeILmv8J2tUsB7MK+0HIj7150u1Xe3tJkn1GnnSeqI3h+/p8g7xM9s5r0F1wgYAYM8zU0zQc5qEW+v661b3+UbloLMFDSjrmpHWVe6oQXlUehvjMj3ph1vrG9fIthVRR9QHNIQcBtsDbEgUninw9gcx9JBlmFY4maXUBkRjG4LHFWm9vVWAVSO+2hNHcGna7ZbLA+w/rRBeFB2ySeIxWQMiHdzOpgBjiSa4xBYkGO2aB1LwrARBOGE0ZcBaJthRHMd6q2ysFBt7nuaK6oY2Y4Via84tt3j5x3FTJySOKPtOSAAok8Y/2qFuwWYwBM4BGaLtWxuhx6vtyaFre43Yg28Cbt7SsBQSOwxNY171MroJ7girXKjDHMdh3qDqFuMTIbtIri6pgE5nFW4PHaCM+5CCBEwBFVlJmVX47VK9OIBHPHapWo2iRnuTzSlxdrxF6hjm5lpTsztJ7gg1OSCFGFMGRNbVQu+CJIwSKxDsEHkdoxTs1YUzlFXiYVbzIVFAiSQKicmGgGMR7VbZIDMGwf8A15qLlXP0iRxQG26vgRsk2wAkRG4EqCR3P9q2I8wnlQBIA/pWyxA/eLtBEqR/vUlKrblQZ5OaYDuLgQE8TS2QVYACO0irhbG0epVIMGQcVDzJSCO/3mrd828iJ7gCiws5P6QhST1DMqVJmGBn+EYNUaj91bMvLHIGT/WincAyBJPJNBa65NvaRljiF7Vy1ZJa5YghhfaU2WBuLKgKMyBTWwDAIAH3pVpBscDJieab6UqREd/aszBeFJmzTo2DD7RuIvqAECI7GrPMJSIX04BJNVSwQHOOxzUHchQApIPxWfehAUk3NBwALxFnWGVbQaV3THFKLupN1QDG0DgUb1u+jIijEzgDvSkECYJGO9bdJiFs83+ZmLV3KTLkuEscgkDFX2oyxVZ+AaHtjbkCTyTFWPdQA7gQ3sMCiNt0bgQkAHkSxrwRVkhfiqsNcGFMmoWxvJ7jtir0tC2GJ4niM1zbV7zQiO2SMTTsBEAA+0YqE7xHuDyDU0stfbaiOzcDE0f/AIDqwqM2nMsIUkDJpT7oMcW9heBF1sqhKlYPvwKYdLvi0jqUVjcG0M3tR2m8NamQ9+2iemfUwGalp9EmjZmu6myr9ipn+lQcFxQmrRQaValiA9U1EIloECBmO1AWrZ1F4IIBbvEUfd0emu3N7622xJn6eKjpbmh0moLG610nAKrwPem2bVoQ6ntGm+pvc0LgvUbu0rZWNiGJGJoMkMh/0t8CKL1VpZ3oTctdmNC3CWAAAPcxXIaoCZ9V1YlgeeJZbJ2H8piiDCY9JxgCh7bNGAp7Zq9iyoWAG7j6RVHJyLmLaQOJTfMssgARgRFd30hFs9Osjg7BLKvANcBdckj0iYifmmei8T3un2xauoLoX6SZGKCjFgkGK7byQwudyLwIG26Qvb0nisrkf/zN+1pAPtWUm7X/AM5k8LRlPmMzkTncZYGq7FxkvXbe8bTk4ic1K5i4nyW/rQtrGqufn/Wtuqx0ztH7/wAwam0iq8odfvS8FgFiM9/ioWS0ESY7QaDLE3WBJIit+Y34c+o44z9qm/QFbuZPcb2gye1k1iErhvTg1aJc4EYJ5/3oXUkrdskGDv7fcVaxP4UmTMc1PNbpYghbBhiKYE8wDzUwQCQIJn2oC2xN5ZJPFGXsW7ZHO6JpNKmNGFid3pMtFTcMcE1Isq3CCTv5MVSmPyraZ1FycwtOq9TWZAMzULloZWZSTIjiq9+QAfeSDFU2WO7k96zcTdEk/rU7xcdiUQmYxEMVMweWk1C2CCWYqW7Dg1K5yfzrWlUNyAcHmr6KB8jEoq7yKxYuWKdkq3fuRUVb1BW2+kf6a3dwt3/1qWk9VsznB5qTsUNHMm7bTU2o81DJInipKogTJz27CrQALafaqrmNPIwd9INW+2IFO5sibUqGM59hWwxVj7UN/ruHvFSk70z7f0rSCSNvrLaQBQEy1bsEARuJmrN0gk5z7c1XAmYzIrJIHPf/AHNZSwW6ElvLdUsRjBYMwnhQJ/Kluuurd1BUFh7Tz80e5ItOQYpRc/8AmP3NXNG3M3MoAVvMQ3TQu3O4/PtR+muncoZQftSvSE+/+qP5UeSRJBgx2rO3BYyqCyIyLMu9gYJGQM0NqLu2yCcD3qy0xZwCSRPc0PeUfh3MCdwFRUA6efOX1emItZcFy+TEgVSVYsIwPkVLUfR+ZrdsywrWCaueYTvJMx2EjbwO3asRPOmQYB5HFa/1Gr7XNr5Of1qm2n2d/OV0xuh+g6Zf1wLW12ogk3HwKJujp3TSwc/jLh4Cj0g0d4juPb02nVHZFK8KYFUaWzb/AMAvNsXdAMxnmu9o010lBF3c1vq6i9CmDXOv6rS29lmymmVuCF5Fb0q9W63buXVvM1u3PJj9Kl4nAF3TwI/dLR3QXZOhelis3GmD8VVGAHymUBrIBnPaZ7mrvG3ev3fqA2oJJzRo6XpTrLlnebvl2i7E8T2ig+mEjqF8zkKxBojpWbeuJyY5pEcFwpEmymxmFXug2n0ukeyBvkG4O8GM1p9Kqvct2gEDq1wRkkDtRGiuP/iN4bjHlDE1BWI0wMmfJfNT1XqyO0Y6eR8TOeN63+AW0QRd8ySQO1VA4YAbgO9QTJBOTVmn5alOMxx1Vcnaum3bMMOcGKuYNslmiRjGK3aRSjYHftURm0s5xScmXAO0E5gt3dA9+eK2lwXFAeC3uancJZEkzzzQa/WadciRI68w/wDBf+afrWUITmsoZ85PavlP/9k=', 'Ronil', 'Gonzales', 'Cajan', 'aklan', '1980-12-23', 40, 'Single', 'Male', 0, '19512659595', 'cajanr02rtrt22@gmail.com', NULL, '310 W Las Colinas Blvd', 1, NULL, 0, NULL, 'unclaimed', '', '2024-08-25 02:37:11'),
(174, '', NULL, 'data:image/jpeg;base64,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', 'Ronil', 'M', 'Cajan', 'Plaridel', '2021-04-01', 33, 'Married', 'Female', 0, '19512659595', 'cajanr02@gmail.com', NULL, '310 W Las Colinas Blvd', 1, NULL, 0, NULL, 'unclaimed', '', '2024-08-25 02:37:11'),
(180, '1212321321', 'American', '18052021113745sl9JaS.jpg', 'Ronil', '213213', 'Cajan', '321321', '2021-04-28', 33, 'Widow', 'Male', 0, '19512659595', 'cajanr0222@gmail.com', 'IT', '310 W Las Colinas Blvd', 0, 're', 0, 54.00, 'unclaimed', '', '2024-08-25 02:37:11'),
(181, '231', 'Filipino', '2308202412295241702125_2225272631056058_2728781409652047872_n.jpg', 'Ronil', 'Poe', 'Cajan', 'Metro  Manila', '2003-02-21', 21, 'Married', 'Male', 0, '19512659595', 'x@x.x', 'IT', 'dsa', 1, NULL, 0, NULL, 'unclaimed', '', '2024-08-25 02:37:11'),
(182, '23121', 'Filipino', '23082024130758170043144_483154779532679_8332420408664012150_n.jpg', 's', 'd', 'a', 'da', '2000-03-21', 23, 'Single', 'Female', 13, '1951265959532', 'dsad23@xdz', 'ds', 'sd', 1, NULL, 0, NULL, 'claimed', '', '2024-08-26 00:21:01');
INSERT INTO `tblresident` (`id`, `national_id`, `citizenship`, `picture`, `firstname`, `middlename`, `lastname`, `birthplace`, `birthdate`, `age`, `civilstatus`, `gender`, `purok`, `phone`, `email`, `occupation`, `address`, `resident_type`, `remarks`, `deceased`, `pension`, `status`, `qrimage`, `created_at`) VALUES
(183, '53', 'sda', 'data:image/jpeg;base64,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', 'df', 'fd', 'fd', 'Metro  Manila', '2000-02-04', 2, 'Single', 'Male', 0, '234', 'Sda@sxcx', '3232', 'xd', 1, NULL, 0, NULL, 'unclaimed', '', '2024-08-25 02:37:11'),
(184, '21', '5', 'data:image/jpeg;base64,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', 'bv', 'bv', 'bv', 'bv', '1921-05-12', 4, 'Single', 'Male', 13, '53', 'fd@sa.x', '53', 'd', 1, '', 0, 54.00, 'unclaimed', '', '2024-08-25 09:52:40'),
(185, '678934859759839', 'rsfdsdf', '25082024045849mouse-8938308_1280.png', 'fdmsfn', 'nkndsfn', 'dnmfns', 'dsfknk', '2000-05-21', 21, 'Single', 'Female', 15, '2222442', 'sada@dsa.hgjk', 'czczc czx', 'sdadadsadad aad ada', 1, NULL, 0, NULL, 'unclaimed', '1724554729.png', '2024-08-25 02:58:49'),
(186, '3587187329', 'Filipino', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX1BST0ZJTEUAAQEAAAHIAAAAAAQwAABtbnRyUkdCIFhZWiAH4AABAAEAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAACRyWFlaAAABFAAAABRnWFlaAAABKAAAABRiWFlaAAABPAAAABR3dHB0AAABUAAAABRyVFJDAAABZAAAAChnVFJDAAABZAAAAChiVFJDAAABZAAAAChjcHJ0AAABjAAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAAgAAAAcAHMAUgBHAEJYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9YWVogAAAAAAAA9tYAAQAAAADTLXBhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACAAAAAcAEcAbwBvAGcAbABlACAASQBuAGMALgAgADIAMAAxADb/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAD6AXIDASIAAhEBAxEB/8QAHQAAAAcBAQEAAAAAAAAAAAAAAAIDBQYHCAQBCf/EAFcQAAECBAQDBAcDBgoECwkAAAECAwAEBREGEiExB0FRCBMiYRQycYGRobEjQsEVUmKywtEWJDNDcoKSouHwCRdT0hglNWNzdIOzw9PxJzQ3REVUVaPi/8QAGwEAAgMBAQEAAAAAAAAAAAAAAwQAAQIFBgf/xAAwEQACAgEEAgIBAgQGAwAAAAAAAQIDEQQSITETQRRRIjJhBSMzcUJSgbHB0ZGh4f/aAAwDAQACEQMRAD8A+qcCBAiEBDDiPD8xVU55SeVJzCR4cyA42T5jQ/AiH6PCLiLTwYlHcikMRTE3R5hTNbkHEIVYom5E96i4529YfAx7RKtJ1hC0MzDT77Wisigbjkbbj3xY+L8MoxBK5VLUgo1SUKKSFDY3EU7iygy8yygrmH6dUW1WbqEurK6CDqknmD0MJWrkkXlEnfSWjmFgI4Kqy1PSD8q+gLZfbU2oEXuCLH6xE2sUT1IWmXn23KmyNDMS2riPNxH4j4Q4yeI0VNRRLzEu0lQujvzdZ/qAi3vN/KFJZNmCMYUJeHMQ1KmL9aVfW1qNwDofhEfISAAdDF59pzDRp2LmamFd43UGcxWEhIzosDb3Wij1t3uLaiOrCW+KY1DlCJ1Fr3Aid4Emc9MLd9UKItEFWk2B284k+BHimYfbvYEBQEEi8Mq5ZiTR64N9dIZavLelMzDBFw8ytFiN7pIh+eRmbveGub8LzSibeIRtsRXZUfACZMrjdbNwe8lHEW6kFJ/CNLtE5Re3tjMXDpJpHF6XlfVtMvMEA6WyrA+YEacZXoAd46VbTSYtqFyHtoOQgIRlJubjzg4F+Z90GtsCbwVvKE+gJsBYGw6dIIRdOm0GIsLXgvLWMGhFQKSNvhGe+NmAJ/FWJ35+nslx/Kho5n2205Ui1rKIjQ67m4AiK1DCL85NOOh1sBaioBV7i59kDsy0Gqe2WTLA4PYySkkUq4J5Tcsr5d5eON7h7iyUP/Ik+rqWJdTnzRcRqn+Bc4k3DrVvNR/dA/gpPjbu1HyXCOGvR0fPwZOVh7Fsn4lU+tS6Bsv0eYbA99oQFfxFTlACrVKXI5emvI+IvGuP4O1FkXS2b/orH74KqnVNOlnSdt7xiSyRWx9mVGOJ+LGbBGIZ5Vh955Kyf7QMdrHGXGbSv+WX1Do4wwr9m8aXXTJpZJcl1O8iXGs31ENc1hGnPhXpFCp7pO5ckWz+zGNqJ5IP0Ua1x8xhLjxuyj9v9rJ7/wBkiOpjtF4kSqzsnTHdNAGHUH9cxbExw+w2+k5sO04Da7bIb/VtDe9wmwq6NaOEH/m5p5P7cTBMwZBm+0rUEpAcoUkpXVE0tPyKTHUx2lklQD1BAtv3U8CfmgRIHuDWFnSQmXnGemSaJt/aBhsmuBWH1qBbnKk2DyKmlD9SK6KxBnrXaRpJF3KPUUde6U0v6rEdLHaKw24bOStVlx1Wwggf2XCYZJrs/wBOUfsqzMIvyclEq+ihHA/2frghiutEcu8lFJ+izEMuEGuydI48YOdABqL7RP58m8fokx2y/F7CD4ATXpZP/SpW3+sBFUO8Aaij+Tqsgf6SnU/smOGY4DYhR/JzEg95omSP1kCIUqo/ZejPEDDb4u3iKkqOwBnmgfgVR2s16RmR9hPSr/O7TyF/Qxm9/gjixsDJKNujomaZP1UIbZnhHimX1XQ31/pNJQ5+qTEKdfrJqsLKhYXIPTWCl03O4tGS/wCAuKJEhaaNVGMvNEq6PmBCCahiimLKfTatJlJ2795u3ziFeKX2a4U8Ael4Kp3/ACYyW3xExVKk2r9Q9jkyV/rXjuZ4xYyl9fyupzX+cYaVf+7EJKuRqTvBrrYGElOXN9vdvGa2+O2K2D9o9KPnn3sqB+qRHcz2h66jR2n0932JcTf+8YgHxzXo0IpY6+cFLgB0O8UW12jJsfy1DYUP+bmlJt8UmHGV7RVPXb0mizbd/wDYvoX9QmITZJei4tDr+ECKn/4QdC50+p3/AKLf+/AiGdr+j7owIECIPggQIEQgmtAUCORin+K2G0TklOI74SpeTlKxa6TyUL6X9sXGRcQ0V/D0nXZNbE2yHWzYkbXsb/hC9q4yUlhmP6RO1XAVRMlWVJmJR9OZM8EgE20ANtyAYLiWuSUlNImWHG5hiZSXXWm1WCsliF2Gu1wesabrODpCqyr0vOyzc207YZXU3AA2A6RnfH3Z6m5F2YksO+jrfqkpNNBMz4Q1fLok8z/jC6lGx4fDLKY4hVmVxrhdYaW609IHvEMkFWck2WRa4SAMugttFLrav5jyi8+B3ZqxLTsVVT8tSM1L0dqUdbcU6ytkOuKFkpQFWzakm4uNIqDENJeo9TmpF5BQ9LuqaWkjYg2h6MYw/FPIat8jEtFvO2whxw0+Zertm/hUCDHC4NbbQrTSluoy5KilPeC5G9r6xsPNZiWikhTJ8xDVPmyAehhyllfZ2OnIxwTwBQsW0vBO0c1dlNzbiaTxkl3ybIM806TsLKIv9TGlJdXU6iM08UUei4tkZvktpten6Jt+EaNlZjMu41B1Bhyl5iB1C6Y6tnbeDk667jpCSFhQMepIvppfrBxIOohXSPCUp3Pugum+8EWnMNRcxCBgQTptHpGl7QiM17DT3wqBpY6xRA2h6eyPbAX0sY8Sm28e5QdYmC8gteCqRfaFLDy2j0gERWEVyc6mBboTCZZOiecdlrjSAEgga3isJlM5FMkpv02hFUqleq0oPkoAx2K67CCEdecU4r6JlnIuRYUNWGyPNAjnXTZQjWXbHsTaHBft2hJbYUCDGXBMrc/sbHKLJL17kWHQkQgcPyKtm1D2KMOxZTl1ufZBe6CRp7hFeOP0Z8kvTGN3DMqv7zgH6JH7o53MLMpIyurHtAMSJSdYSUAD1ivFEnmn9kbVhcAGz2vmn/GOdeGXQfC4n33iTLCU9dYRJuNzbyivDEnnmRpVBmkG6Fpt1BIhJVOqTfqrXY/muRI1uX0GwhMEL0va/lFeBG1qJEXfpsy5cOtF0dHLKhmmsJ098kv0OnuHYqckG1fPLE9cAGlxfpCHekElQNhGPB+5r5EitJnh7h+YVd3Dshfq2wGz/dtHE9wpwi4bmgN3PNuZfT9HItoHNfS3mYItCVHVIUetorwfuX8plLznBfCkwFZJKclD1Ym1G39vNDU7wKw2R4ZysJ/pOskf90IvdUs2pRBbSeeqYQckZZQOZlu552inTJFrVMoP/UPRv/ys772UfvgRfP5Nljr3afnAjPikE+UfWiBAgQA6IIECBEICPFDSPYEU1lYIN85J9/qIgnEqUnpChCoyTZcmpBwTCNRlygELCiSNMpPyix1C0cVWpUtW6bMyM233stMNltxG1wRHInFxkaxkrW+NJpsOy8nJNy7lltiZcAVk3F7X1t9YxX2lsHVXDnEGZm6o2yldSSH0qY0So7KsOWovH0HwxRKhh+VVIzc/+U5NkBMq64iz4R+asjRVtLK0vzihu2hg5NXwPJ1plGZ2mv5V+HXu16H5gfGLps2W4+y1wYMWixOlo51JyrBBIAO8OM0yEqI1+kcLgtcH2R12xtcom8hU1CUbK/EopGvWEJ2qWuMu8JUBlMzS0E7glJA9v7jBqrJpbSCm/mDG0xFrkq3jIrMxSpk2uC42fLYj8YfqX2iZZmWYQujvKWhtKVqEwmxIFrjwxEuLTz/dyMuCO5KlOX53Fh+MNPD3BwxW5Oh1wJbabyjMSLLVsdOljB657VhlSqU48mjqHxUw5VJBiY/LEjLLcQFKYfmUJW2ehBMPkti6jTdizVZB3n4Jps/jGe/9RVU/mKtIkdHC4n6IMEXwJr//AN7S3L/885+LUF8yF/jJ+zSzVTYmbd0+05/QcSfxjoC1rtZJVz01jKkzwRxKzqhqTmTy7p5F/wC8EwkjhZjOU1Zp6kEa3am2foHIz5y/iN9M1gVqt6vuIjwO7RlFWGeIcioZU1tF+UtMuKHxQsx63O8SqaDlcxMmw3UJhQ+YMTzxMPST+zV/fa2g4cvsbdYyeeJPESnpAcqVRYtv6RLJP67cGb48YzlyA5VWnCDYpdlmPwSIvzRM/FsNXh0XtB0rzaRmCW7RmLGzdTFMfTyK5VX7LgjtZ7S2IEn7Sl01xPPIh1P7ZieaJXxrfo0lmEC+53jPrHahfCvt8NNueaJ5SNfe2qOxntRSalJD+Hn2hbVTc4F29xbTGlbEw6LF6LyWsWt9YTKxlt0inkdpzDRNnafVk+aUMq/8QQqjtK4TcOrFWbG3jlmz9HTF+WP2CdU16LZOuoB1gqh8orVrj1gx4JJqz8vfk9Ivae9KSI7m+M+C5geDEbAPPvGXkfrIEa3L7M+N+0Tom9he0J5rc7RE2eJ+FXzpiWlpPRyaSj9YiOlrHFAmCEsV+lPG1/BPNH6Kibk/Zlxa9D8tyEVcgPjaOWXqDE2kKYmWZhJ5tOBYPwMHBdsTkVa+nhMaTRhrHQc+LRQMJq0Og06QVxxQsCCk+y0JpdGxNvdFpmWjzLe52BhMJOp6QsXUpHSElPJvtqesXkyhPuwokkacrx6UpJ1F4MVJJvf3QmtVjFFAVa+kIrNjrbTnByre3vhJRGXnbeIQItQAuT74IVhST0+sA2V7jCarXiisAKkX5wIJbyPwgRCYPrJAgQI5R6MECBAiEBAgQIhDwi8JkQrBFCFroZWS0JKiI8ScMt4vwdV6K4Mwm5ZbSfJZHhPxtEvUISdJCdrxyJ5TyFXJ8j6zJqk5x5lxJStpZQpJ3BB2hnd+APKLp7TuEf4K8Wa2ltBRLzixONC1hlXqbexVx7opl02PsjuQlvipB4dYHvCUyEl1g7esPp+6HWrizJtYxHcOPpTU0gm10kCJFVrFlV9rbGNp5AWxxIpTiokmckUk6hC9PeIkfBKSSJCpO63LqE+ywJ/GI7xOBNaYSRezAIt5qVE/4PSndYUDlv5R9R1HkItsJ1WTppoJ+sKhFx1MGQNbamFcnivpGGwAmhu4vHoQCdoVCbXgwTfaBkEQ3bePcnMaQuhG5teBksdBGXIgkAsC6VqHsNo8W2pwWc8Y6K1HzjpCPI3gFsWNtYrdgtPAyTWGaVNqJfpVPfJ1JclW1H5iG5/h1hp8HNQpBOm7bIb/AFbRLO6FvdBSgX2i8l7n9kIc4T4VdBBorQJ5pedSfkuG57gphdxRKZR9kWtlRNOEe3VRix8gvBVIF/KJuyibmVg9wJw4tIs5PtkC3hfSb/FJhvnez7R3NZaoz7R6Od24PklMW53Y3tflBVNctIpzaZNzKVPZ2lbH/jt5J5fxRJA/viOd3s7AAluvkf0pAj6Oxd6mxCZbFo1uZTmyhnuz1UDfuq1LK/6RpaPoTDe/wAr6NU1Clr8i46L/AP6o0MWwRBCyCdhEdjRW79jNLvAvEyQSliScINvA+nrvqBCX+qDGkufsZEac2p1lP7YjSy2rcrwUsjW4ivIyvx+jNqMG8RqYCWhVWvKXqF/1XI9CuKMooJSvE+mxu+4PxEaPUyByhPuh7ItXSMOMH/hM7rxTxVlBdaq+hPV2RUR/ebhFXGHiBTzlmJpxKhuJmntA+/wCNGKaFr/SPAtadA4pPvgnml2Z8df+UzontD4taUkrVTnddAuVAv8A2VCO1rtJ4jSPtKfS3R+i24n/AMQxfLoU9fOouC2oVrHBOUaSnWsj8jKzCDul5hCh8xGlqJPow6an6KgZ7S9RQPtaDKu9SiYWj6pMdbPacGX7bDpSOjc7f6txYTmCsPuaLoFKWDufQmh+zDe9w1wu+FA0GTA2+zQUfqkRtaiQP41X0RZntL0sgd7RZ5sn8x1tf1tHS32jcOLPikqo3fn3bRH/AHkODnCLCTirmjhP9GZeH7ccT3BTCjg0kn2x+jMrNviTF/Il7K+LU+hQdoPDBAOWf97CP/MgRxHgXhW/8nPe6Z//AJgRXyZ/Rfxa/s+4ECBAihoECBAiEBAgQIhAR4RePYEU1kgkoQQi0KKBvBFRyLY4bCIyj25OH0xUqVSMRU6WXNTMuFsPpQBfu/WSfcSr4xgidrSpdSkuNLSQbEEbR9Le13TaXUMByX5SqcxSimYIZfZStSSop9VWUbG3PpHzzxNhltl1zuZ5ue1vcJIv8Yd0vNeGMwz2RyiYol0VaVKyRdwJ1Ftzb8YsupHOwoW1tFY02juIrcor0dLlnUnVF9AYs2oELTYdIb6B2rLTKR4iLLmJ3U5jZDbabe6/4xbnDaW7jB1N0AzJKyLdVGKXxY6ZrEdQVmJs+pAufzTl/CL8wfKiUw3TGrerLovbzF/xjMujTWILI9oAHn74Vv5R4lO0KpRYXtAWwGDxKfbrBsvUfCDhvW8ehHnGGyYCZCE9NdoMEWNoUCLi14BTc+cDbyTAXISLWsPbAFr7amDEWFxBRmJvFEwekXHsgpTofwgx35wCrXr7IhQmUWVoI8ye/WFL66XvBTvbWJnBBEoA5e6C201v8IWUdzCZN9NovPogmUwUp12hQjNvCZGXmYvcymJLFjteCkeXvhRSdL7iCG2sU3kyJqA9kJlNwLQqoc4KQTtyiiCJHI69YIpIve3yhYjW4ghFhppFoggoWBHnzhNSMx0sbQuscyIIq2uu8QggoAHbnCa02/8AWFlJ3HKE1i8WnggiQL+UEIBF77c4WUADCZFj+6NJg3lCJA110PlBFJBELKTc67kCE9r66fONlIR7pJ+6YEGyjrAiy+T68wIECGAgIECBEICBAgRCAgQIEQh4raEiIVOsJruIS1C9mkV1x+wsnF3CTEUmRd1mXVNtWFznb8Yt7QCPfHzNqaMq1aaR9c3GUPtLbcSFoWkpUk7EHcR8qOKOH3MK4zrlJWCkyc26yL/mhRAPvFj74xpspNDVT5IZ3hbeSobAgxJahNpTKqeuClCM9/IC8RB1ajfaOqtzymsIzK7+IMqR7SdB9YaT5DWxTSZUrjpnZxS1fyjyyo36k/4xp6msejyku2BbI2lNrdAIzRRpcv1eSa3C3kA67+IRqWWbvpY2jcngFZwkhRDdrH5Qqls31BtCjbfO1oVCANoVkxcSDeo1j1QsflHq1gDU2hNTqb7i8YyQOTYQULzHaEw6Dpe59sGzJTrsLxhssOSACDBDfa9h5R53iSf3R6HhYcgIhAZSLawVVgfOPVOgn2QmXACYsmD0nltAJ0Pn1ghcHtjwrHsiimgxIHtgqjoYLmEeXFjEMg0H/rBFb7wZR8rQRSrH5xeSjy1zvCZ+MHURppYwncEGNGTw2G0EKbecGUQmClXSIQIRrpBCL35QoTfpBCdze0QgmU7jnCZ2uRr0hUnXeCEa35dIhBEg87wkrS+sLOCwO8Iqsd9IhBMkCCXzDWDW84SKso00MWUFUMp0OnthO2lz8YOVXvBCq2sEcsIztPMp6iBBff8AKBFbv2Jg+vMCKp4b9pLCHEPuJb0r8kVVyw9CnDbMroheyvkfKLVBvHRsqnU9s1hkjOM1mLPYECBAjYIECBEICBAgRCAgixB48IvA7I7o4LQRO0fOjtYUdbPGnEy0JOVxxle3Vhs/vj6MZbRi7tCSTdR4j11S0ZrOITc+TSB+EAgvH2M0rc2Y8mWSlViCIb8WOd3g9YSogqdCbe8RZWJcIhBU42kpveKwx8w5K0mSYKRdUwo+4J/xg6kn0Nyi+mRrA8oJjFtKQbEekJOg6G/4Rp2Vl8qASNfbFD8LqMV4wp67apzG1v0TGjmKa4EgkGKmLXPDwcYTYmE3PAnpDp6CRyjim5QhJhR8C6K24g8SEYRflmEyZmlupKye8yAAG3QxEU8eEDVVGcP9GZB/ZhDjiwputyAO6pYkn+uf3RVz6SgdANbiBNZH6qoyjlluo48ymUZ6XMhXPK4k/uhZHHelqGsjPj2JbN/78Uc3PMPC6VkjqBBu/TyVp5iI44C+GLL3b44URVszM+jyLaP9+FkcbMPq9ZU2gHqwT9DFBFY3vpHhWAL5tevSKUWZ+PE0IjjNhw7zjqL7Xl3PwBhRPF/DC/8A6mU/0pd0fsRnUr945x5nBGhIisNE+PE0qnilhogf8bMi/wCchY+qYVHEnDitq3Ij2vAfWMwqUQRrHgUSYrDXJPjo1GniBh9Y0rlOt/1tv98GTjaiO+pWaev2Tbf74ywVHWytoBVb73wicmXp8+zVn8KKaQFCoSuU6A+kJ1+cLIrUq9/JvtL80rB+kZIv5j2wmUIVfwA+6JlmHpv3NfenJVqDflpHgnBfb4xj7KlvxISEnyAg/p8w36r7iSOizG+Qfxma8M6kqgqZoK5RklNfqaCCmpzrYG2WacA/WhRGKKwhV0Vmop03TOOf70RZMuiRrhKwQNYMdiYgfCavTFbwdJrmZhyZmWluMuOuKzLUQokXJ1JylO8ToEEC0aWRVrDwzxXn84IrUEXAMHVtHO4ClRt8o0ijxa9De0crroB11MevPZQSd4geJOLuFMM1Rym1Otsys62AVtFtxeW4uLlKSL2i8fRCaLeuDytCZduT7IgCON+CphPgxLJW/SzJ+oEKI4tYPmL5cTUz2KmUp+sU216ITYuiCKcBOm0RFHETDLw+yxFSV+ydb/fC7WL6K7/J1qnrvyTNtk/WKyyEn74dYEMQr8gQCKhKkHn36P3wIsgjTMYzDK0K70lQ21tG1uyl2qnajMymFMVTnepcAbk555XiQrYNrJ3B2B5bbbfPJ5D8oq9lKT7YdsO4tepU6y604WXEG6VpOoO8fRcV3wddnX+xzLK5Qe6HDPuCDcXj2MddlntaTWJajJ4YxRMiacmD3crPLPjCvupUfvA7A7368tiA3F48tqdNPSz2y6fT+xum5WrjtHsCBAhQYBAgQIhAQIEJLfCIhlyUexKYn2mXO6WrIsmwzggE9AToYxPx7xtIUHiVWZapofl3O9BSQypSVJKRYgga6RsStziltrbBKb3FxGPePnDriJOV96aodaYmqW4bty80wlS2eZTmsSReBTSkdOmMoR3JdlQ1LiJhiYSsLni1/wBJLuD9mKg4i1GTrFWpLdPeTMMlK3PDy8VtfhFmzvDjiYq/ezdLc09RbA/3YjaOEeJ1Vkz9TkWXVNpCU+jLSlPwsOsYjDa8jDm5cBOFVJP8M5NJGUBtR29kaNTTLNg2tFV8OaBOsY5bS5JoZUlkmy3hzPkD0i8102faslRl2x+ilS9P7sEksnOuf5MjLtOsdoa56QGQ6RLH6TMKB/jUyR0Shv8A3IaJ+hZ75w65fcOOnKfakaH4QCSAoy3x+DUriaUStSUZZQXzabqUYpypTaFS7pabccslWoSQPnF78cqS3K4xQ2hhtsJlW7BtFtyeUVHXZYIkJokaBpenuMB/c69P9Mq6Vnm5JxMsUuK8OZC12uR525gw5JqCVWPqjzMRXF6lS78glCrZkFRA330jvlltTEol5AsCnUXJsecPqCmhV2ut4ZIfTQUjxFI6QBMDL6xivV1WaVOlKHlBAJ0sIPMVudZR4HbKPkIz4kja1OSwDMHkswFPnSyvfEt7P/AfFHGWnzVYmHmaFhSUWoTOIZ9BTLtBI1SgDV1zohPvIGsWBiLgrgqoT9OouAa3XsUVlarvPOMNNMvD73dtgEtgDUqWsgAa2gfi5xkYhKdkXOMeEUkHlbqUDfyhsqVaRJIOZZzcgBvF3Yy4R0zCMyxKuVeUqM2Git1mSeLyGddlOaBZ65bjXcxX03w2bnGHZqbK0BxJ7mXHhUsjXXoOZ6DzIENw0TlyIWava8Iq6b4gFhYDLGYbHMq34Rwq4jzZUQWGUjTS5jsxZhJun6tqQGwLBSNj7B08+cQCYHdrKUgmx3MVLTqHDQFXzfTLIpOOZeYcQmbSphJPiW2CoD3Q91CoMMtomJV70iSX4Q+EqCQfzTfY+UU9LugWSdz0h2pNYmKbMktvrQ04MrrYPhWnoRsYyq4dNE8017LGRPF5IUmyk9RCcxNuoBOW0Rb8pqpkyFNq/ikykOJ1uB7/AG3hdGIBNuBpCyV3sLg6/KF5UuLwMwvjJcjo5VHUqI1FxzMO0q4XGG1H1ikH98R2UzTEopxXrBRBEPlNUTJtgHUXHs1hZrDGE88l78AZq9EqTBN8k2HBryUgD6oMXCg6A7iKE4BzZTV6rLX0Wy26L/oqI/bi+GjZOsUc+39bDLOkcj51JuRHWs2SeftjlmNjztFoCMVa72ZkJllhxTb7ja0NuJ3SopIBHvtGEMWz8xVK8ZqoPLmH3ikuuOnxG3h19wjeE8otkKGtjcRiDipShS8T1GWT6rM06hI/RzXT8iIZrxkg1ehUxwCykW8nD++C/kySXfKoj/tIjhaPK49keZFDQX+O0bcZembyvoeZykoCPsFXVf7yhHsvQm1Nguu3Ud8lrfSGSzqSbE+4x79rf1lfGNYZWEP38HZc/wA6r5QIYcz35yv7UCKxIvg3zO05hdwUhRIiEYgpBp7yX2knLc3tE5SC5Y31PnCc3JofaUlQCgRtHbrulWws61JDFgXFD9HqsrMMOKDjawtBHIiPsNwVx+jiVw5pFbCgp51oIfCdg4nRXx398fFt+QNIqgTshRzJO8fTD/R81czPDyryBzES0yhdyq48SSNv6kdbVxWo0Ln/AJGmv9eGcH+jqUvvg1bAgQI8kdYECBBV3ym28QpvCyGhJbIUeh6w3VSfMhLhTjigCcuYW3/xgktiJh5sIzpS+W84aWQF7X1EZlNReGxPz1zn45cMbp43WSrVW/viM1SWD2YK8Q6GJDNLzknlDFPp3N94Xm16PYUxxBIg9TobLpUe7SPdEXqVBaKD4Ab6bRYc/ZKDlBUbHTrEbeBfaCi2pskXKFWuPLSAthlBFdcPsONz3GBTBSLIlhp09YxoGf4eJWi4bt0NorLgzTQ/xqq69w0wkH4DSNOZRDkOYo89qP6jKHquCVsX8B+ERCq4aW1oU8+cadnaYzOoIUkA9bRDMQ4PDgBSgEE8oxJYAo+dfaHpJYxyU2/+Wb5eUUdieTCKPPrI2YX+rGtO1Dh1MtxHfby+rKs206oEZpxzIGXw7VFW2YVqD5Qq3ydyiP8ALRmHHKcs7TeV5YE/21Q10+oejNPMqPhV4gfOH7HrH8epn/VAdv01RFiyVE30ubXMdCt4Swc+5Jth6cyXnVr6mNhdlHsHTvFuQ/h5j1M5Q+Hkqnvmmmhkmavb7rZPqNaWLlrnZP5yZZ2E+wW7xLYpfEDH7QkcEtu99K057RyqFKiPEPus3FjfVViBYG8bE478a26apdGpyGmKZLJDSGW0gDKNLADQC2wjU5KC57L0und88el2ZW7QOL2cYUyUodB9Hw7hekIDEhRmGghtpCdLJtzJ1JINzqYi/ASuUzFPGXD+AZBtNPwwhb0zW20JPpFQQxLuP2feNitKi2E5UhKbE2A3iWf6n3+I01Mz7FUkqXJkqeQ3MElSxe90hPIX1JidcIeEtF4M1ycxJX8XSDqlyb7EtTpVBTmcdZU2FrJ1FkqUkAX9YawjXPDyz01kYqKjH16MucauMtSxJxMmzOBmWp8nduXk5VpKG0Nk3ShKAAAALaeUQCexU9UpZ9S1B1boS3ZK9AL37vN0G6upOvIRG+OlUQ5xRqKWXgllwputs6pGuo+MME9X23GwhkFuUbHdtJTsbch131PO947+ks/Dk8f/ABBbr5NHfWKi1PLcYOVSraqAsLbf55mK/rNNbbcWWjcHe0OblQM08lpJKQo2CGwVLJ/ExK6HwyqNVSl6bSZRlZ8DNrrI87bfOKvsi1yKU1zk8RRUfoq1O+FN/YId2qS8pnOps2t0i8JfhRKy4Tmbska20vfzhGs4aakpNYS2Lnl/jHKlalwdeOhsayynW2G3KURnGdleVSTfQHY+yFcPqTmWCB3g523EeT8mafVFoUBkUSlV9LgxxMPKkZnORqm4UBzgye5HNsi4SwSylosw6kWNlfCHikay6s1zZVoaaKoLU+fzglX1h4pIsp9B63jnT7Z1K+YosfgzNGXxyy1cWmWHWyPYAv8AYjRzCSUAxl/hy8ZPHNFWk+tMBs/1gU/tRqSVT9mOsZSFb1iQD4t7xyTCLA87Q4qbjjmG/DtBNrFEyP1JClpUkGxsdYxrxyotQp2OZ9U06XxMJQ+lRSE6EZRoP6No2nNoNza8Z07S1J/jFPnMt+8l3GSbfmHMB/eMGi8MieWZnee7tWXNa/lBpbK8sjvCNILMshRva5EJoZGYWBvtBzR2qlgRo5BSwQb96PhCCpdQ3vp5wQsLvz0iF4OgtOX0d+UCOTu1jr8TAi+CG6pnGEuPC224baGwtHMMSuOoCkNm9/VUN4b0T8nLrACQQLi5Ih9ptQlFN3CUaabR1FsS5DyU0cE7krTFy13b7ZCgD08jH0P/ANHtSZqV4dVaedyiXmZpKGwN7pTc3/tiMO0amsT77a0hIueVrWj6Z9lfB6MG8HaRLp1cmCuZXrfVRsP7qUw+7VHQWJe2l/z/AMHHvg3qa3/ct+BAgR5s6AI8JsI9gq/VNohTOGqNtzck4gIDhUCACLi8V/h9dalay5KVJAF2C4ooAIGthqOovp7YWxDiGvU+emg2hpmVl3EKS6Um7gN/Db6mHOlYwYxKZxthHhlygFRGpzAn8IHdXGWM9o4dE4arVR9NM9mlHIQN4Z5xwhNtYc5xeUK1hjmkmxN736wrLs+jwXA1zYJJ5Q0zTeW5h0mc2Ykm/leG14KAzKOUnbygQRcCfZ/YTMY+xTNBOiXCgG3Q5fwjQcUj2bpTXEc2NQ7Nr8R1v4iR9Yu6OhD9KPL3PNjBBVthY1AMGgRprIExN2paf3vE6dKU7Mtfqxl7iTRXH8K1NDTRW8tAShCRcqJUBYDnH0QxzwDmOIWPpyqztQRI0taW0pDKc7y7JANr6J566+yHSnYawDwaZ72SkGVVBKdZp4h2YPXxn1fYmw8oUdX5Zb4OxXetihFZZ808C/6OviZxiqNKnp9hrB2H0yiEuTlXSQ8dVE5GNFHQj1soPWNYYK7IPAbs509uaqlMZx3iJA8U3XUpebCrC+RjVtIuLi4UofnRJeKXaTdCHWZN0Mti/hQdTGTMf8X5uprdK31HMTuqCyu2rETUdK5vda/9CR8buOz3D6uP17CCjTaC8rJV6DKHLKqQdBMNtjwocTzygZhvFS4g4kqxBMJmFTIdl3AFBZXcKB1EV9jPFzczJTTcwoKQ6hSFhXQi0UbSsazVOoErJZlOLaBSMx0Ccxt8rQHMrFz2PJw0/D4TNZTfGeXo0k6tlau/UyllAB0SAQT8bW98UzjnjZU5xZUl1b7ilBtAKtComwHnFOz1cqdQzBc4Wwfutpt873+cTCXwg7SsLStVnnlvzRbVNpS6okISRlRuTruYLXQ2/wAhG7WJP+WuSvq/VX6rXphxalOPuKSgZBcmwsABGluCnYjxnxJlpepVtJw3RVgHx2MwpHQA6J06/CKe7OUrLTvHTDInEpdbEyVZV7FSUm3zAj6yYirmIJfB7LeHpWVccFy8Jh7u05QNBextBpW+J7UA02m+RmybM21TgLw34LNoZa7pU6E6zM09mWr3mIPUKlRlKUZNbTo2CmyCB8Ia+NFYx3UZ6ZenE4b7sm3oqJpTjtvaW7D4xT+HG6tM1HI7JNslWpWwUkDXbQwrJ7uTr1xjU9qRbkxU2Cgm4tziF4orNMCcrk00FanKDcx1YwpD9Ipbagpa1rSDl2JivVTFZQh1aZimyqr27gvkOjzIKCPgYClnsYss2rhELxl3Tk0l1lYUgkEkHUQwvjM6rkCb3h/xPKz78q5MzDDDaW93Gr+PXTlDRKtd82Vesd7R0Klxg8pquZ5H7DT3em99e7sb9RaJHTP/AH9aSbgpvESwue7qC2iRex384l0okpqKPMEaacoVtTUhmh5gSGjOeiVmnTB0DMy05fe2VYP4Rr6Xb0tvbSMdqR4FW0JG8bAw+96dS5OZOvfMocBv+ckH8YHDvkHqVhpnQpo29XSOZ9mw6GHYt3GhvCDrOVJtbSGDndMi822QVabRTPaHle+wpKTJbVaXmgCq2llpIPzCYvmcZBOtgDFfcW6MKpw+rDYF1NNB8ac0KCj8gY0iJ8mDZ0Bp1zQaKIjkS+Ffmgw+YmlA3UHUEWSbEC8MQk0G+lh0g66CnQlLik/dPvgv2mo09xgzcldAs4deUeKkz/tCIhAuRw65RAgvcK/PMCKIaMmX5hV1JXfXUDlD/h1My/Jul1TyVW8ARzPn5Q/vYQlnSHNidTbaOun0tmWWQlazbfpHV3xS4Q1sbfLHDAzk/JrDcyfCDooco+mfY8xb+W+HrlOcWVPSLthc7JVsB7wT74+cFIKkKynUHaNjdhqviWxPUqY4sD0mWK0JJ+8kj8L/AAg9clbRbX+2f/H/AMOfqYbJQn9P/c2vAgQI4YYECBAiEE1sIc3SLwzTNHZk3JqabbQhyYy51JFiqwIBPxh4mJluVQVuqCEjdStBDLO1xmdlx6OoLaP3xsfZF545JTCEr44/UhgnU+tz6QxzSiEkqAHQQ6VF86mGGYe1tcwhPGT1i6OZairMSYb5hQCVFY8KQTHa4u+a+0MtbdbYpM665msllarJNjokwIv1klvZpZUMDuvr9Z54qPt5xbsVzwCkTJcOJEEWKyVHzixSQkXJsI6S6PKSeZNnsIzM2zJtlbziW0jmo2iN4rx/IYblnFFxK3Eg6X0jNPEvj2/Mh5KHylvYAGBysUR2nSSs5lwi2uJnHKWojTktIODNYguX1jJXEDjDMVB5xRfKr873iA4w4iv1F1eZ42PVUVZiHE6rEle8KSk5cs69dca1tih7xTjZas63HuZ1Jim8Y45ak0qcfeA3ypGpV7BDTjfiB6EtTCFd5MkXCOSR1P7op+qz78++t+YcU64rmenQdI1GLkZtuVS47OzEGLJ3EM0G83cMKULNg3v/AEuscX5NmCdHkH+rDa2VekJyGyr6He0OiW58kWfQb8ssOxiorBwbLZWS3Nj1gzBM/i3EtOpLLreaadCVLsQEIvdRPsAMXZx1LMphadalwlDaHUyjWUW8DaSLfMGGjs6U2aYqE9UHUtuKQyoBYT6oAGxPUrHwjzja6tVDpzQVqqYeUq+oOg/whuuKwCy2VdwOnU03itQZhawkNzYOa/I7x9Z8CVpqpSCjNOJTLWzFN+UfGiQn3MO19iYQSlbDoVppz1jaVF43TAwM07LvLW8pFrJ2OkcvUR/JM738NmlGUWXLxur2DC2+lcjLTS03AU8gKPxiteCdDp3EDEM6WkydOpMgEFalkJU6pROUIFtRobmM/wCLcU1yvzLznozs1Lt/aOoSuxWOg6xIqFien1CitqqdFmGWrpbSpChnQTsAEkKF7dIXwdmU4dIu3tKSNCoypSWpUyzMuNKBuhQsNtD8YrDDNapWIM6JyRZam21FN1AKCrHkYrzG8uxLEKD9ZdbDgTlWlSbH8251v7TDLRKrOTKcklJrlJZpVu+mV2JPOw1MWo+0AlNReGP3Gr0f0RUtL5SFqSlIHtEVzTKelppAUBZY3h1xHOPztRKHVZ8iL3HI7D/PnHahhKlJASAnPZJA8462lrwss8x/EbVK38SI04hmuoINwleQ+8RNGRaaYUCfWAiEzYCKzN6Efxg6+Q/yYnCE2QlQ1tqIBqY4ZWmllYJChBJjU3C2ZVP4GorqtSJcNf2CUfsxmCXSSNCI0fwMmfSMDy7N7qln3mz71Z/24Sh2H1P6Uywu6sNvdCLjBI2hzQ3dF4SWze8M4OQ+SNzzFgbjbrDHVaazUJGaknlJSiZbWyb8gpJH4xLahLFaSYYnqYl5y5JHTyjfRR89cayvcVJIvcgFCrdQSIixyNqIJJPSLY444VTQMV1ZCAUpRPLAH6KvEn5ERUrkgtUwSlZAV0gqGGxVt5CUjnAU6k84KJCYZF0un3wFMzJJsoW6xRDy7Z+9AgvczfJYtAiiG05qoGRbPepUhPNQ1AjpknGphIW2pJCuhhGYnJSebeYQe9uCFAbRHaUp2lvqZJOm3SGFyjs7cFhSsoplAcSrX2xfnZRqJluLtCT3obCnFIVfS90kW9/SM6SFXAbtv7YuPsttCscasMsuklsP94QDuUgkfSG9LZGubz9P/Y5usjmpn1EGwj2GWfxB+SpdTrku66hNr92ATv7Y6aTX5GttlUo+lah6yDopPtB1hBwkluxwc+vUV2PanyOMCBAgYycs/KCdYU2oBSSLEGIs/T00loSzYyttiwHlEziLYmfyzKk9APpFS5WA+khGOo8nt8EVnkKWCVKPshpcyt35+2HKafKyRoBDW8oWsNT5whI9KhFxQIvDPiKXDlCnQpYbQtstlR5ZvD+MPGQr10SnmTDBj9/u8KTdjmuptI0/TTGV2VN/iyyV48oeBZFmiU77YSSA2VKItcDmeZOt4g2K+OCnmlttuBvybOkVTxME9hzPMOZx3qA/nVfxBQuD58x7ooStY/eddUM5F4POxi1GnqSzHllrY74kvzqXB35OpO8URinEzj6lkrPxhSarypxPjVfqYiNbZdmge6IzHa8LSbHMYI9WK8GSoqXc67wxVemVSZwuvEBa7qmekJl23HdO9Ub+p1AtqYVmMBzk2suTkyoj/ZtaC3mYWXSpmWpQphdeVTg4HPRe8OTMOduR84tGX1wUVxIVmxrPACwQltAt5NpiITF7nnF61/hOxiusTE9KVpmnzT5BMtUG1BF7AaOJv05iIlV+zzj6UOaWw8/WGj6rlIImwfci6h7wIehhHFti8t4KtZ1mW/6Q+sPrTyWypKtDlsDfYw4zXCbGVHdbVUMKVyQRcErmqc80n4lIjhRSHRV/R3m1KWVBCUkWJJ0t7YMlk57NL8GpP8lYEL5TZ6dbMyAFeJLVyhHs1BPwiuOMk53/AKC2kZlJccWPYRFvUukjDeEXC4D3jzSGknnkbSNR0BOaKR4gLD0wwFLGZCFqXre237odh1wUVBiRgOzDzyQLgjS3K2kSvhfjpdKWKfNnNLLPhzcojlQWFzhNrIN0lN9hDMyktzAKVWN9ITsjuymEqslVJSibKwdSaXXUrZDqWlPC+25tClQw7PYUfdTLUtc2CoK7xpWxGxtY667i0UJgnHD1L7tmaWsIBGVaT4k+wxb0vxUrBYSJaaYqTJGuchDtuhB0+Hwjm7dnB6qq6FqyxvrsjWatLNSavTS33nehM28pfi/OtYfOIdVZlvD6wy+oLWnxKBOt4mFc4pVVEutRpbLT1jleW6g5dOgiisTViYn5p5xbvevuq1UNvZ7IMknwB1Vka45iSalO/lSbM++kFDjilBIFhZAJ+ohX067vdgWLXvN49M2zISTLDSdJeWLV+pVv9PnEYlJ1SkTDma673vfeO3XiEEjyVmZyyzkm3kpqBc3uvMdb3J1J+JicUZwTUoEC5UlI33tFcPqulagTe97iJRhevMMrT3ziW8ul1KtcQhety4DUtRkWnLNlbLJGykg7Wi9+z28DT6vK/eRMIdHsUm37EUXTJhExKMqSQoEaEdIuPgC73eJajL3tnlA7vzStI/bMc+tfkdDUYdfBfbbJsABAWwEiwjqZbukEX2gymbiHcI4Tkhim2CUqH4QyuNlLgGw22iVTLRCTpEbnytokpRcgxZndwZc7UWGlt1adnLA+lyrcxcb+DwH9SM2tMozJN0ixG8a97R9OrFRl6U4wlGRbcwwoKIFxZJH1VGPppp/KoNNFxaScyU8oJDsP3FMneCsC0bFuJKdTajiyn4dk5vN3lQmSlSWCEqICgVpGpAG/OOXipwtc4dVBKZLE1BxdTHVENTtGnW3VDycaCipB+I845cLUCrTqJaZGBZusyaFIcd7l91BcQdbAgm1xzA5xajmFpXukqHZ3xc2FC901CcP/AIMPQqjZHnsWlZKEuOjPH2/5kCL4OEWbn/2C4xHl6dNf+RAgfxn9hPOvom8k8+0r7NgC0ITs8fT0qcaLd+uojhr1Qosg07KSNecmqk2VthLRKklQ2JNrW98cNKFTqsuh6bdDikGw0ttGez0CtUnwT2TWhxkKsAq20X72PGnXeOWHQ2M1lrUegAbUT8rxnalKAAzC6rW0jXXYGwwapxMm6qtJLdNlFKBt99fhHyzRiv8AU/7MBrHio+gKpcOjxWhgq2B5SfdVMMrdlJvdLzKykg9YkwTbaBFRtnB5izz0qIS5kuSEtVbEmF1ZJxj8tSSf51vR5I/H3/GJLQ8U03ECD6JMAup9dhYyuI9qTrDgpAULERGK7gOSq73pCCqUmRs8wcqgesH3U3frW1/a/wCv+ik7qf0vciXRBsQTSHZ52xuAbe2IGnidibDHEteD5tTNQk/RS8ibcSe+ToLa3sdxuD7YfH5pTySpSvEdSYR1EfD+Lecnf/h/87+YljBzT0yASlKQQDqYbXH03ubADpzjpeRmUb6+cN7zSiq9wBHMZ6FB0OKeWUtpJT1iP8QXL0mVldLuzTaSL+0/hEiDzjbYAOnlEaxOr0mo0Rg6lc4lWm+gP741BZkgV7xXJltY04WSHETAsvTJmzE22yPR5oC5bVbY9UnS4j538W+F1Y4e11+RqMsph1Fyk7pWm/rJPNJj6mSqcks0nogD5RCOM8jgaYwTNTGP1yktRWAT6VMKyLaUR/NkeLMbbC97bGHnBS4aPP1XSpeUz5NOz/cqy5rEQkKiCrU3MQTjhxLoVMx1UUYLdmZ/D6HCJd2pN9y6se6499h7BERpXGNl8gTMu7Lm2q0HOkfDX5QpOmUXjB3q9TXak28MvFM/mFusGc7pxsDQiIFRcbydVbzS8yh22hCTqPaN4e01lCkXC/hAUsBJP6F6lTWnUqIteGGTrtTw5Nj0WZdaSDplVHZOVnKFWNha0Ruo1FC13BuY020jC+2XPg3tO4ow8+005PvOMAgFKlnaLSnuK9NxtJpcqdOp9ScVY3nJVt21tb+IHURjRyoXWCDtEjomKnJJRacXZATprrcn/wBY1GbTRU64yXROOM2LJCVU0zIy7Uu2RlShA0A9l9L6bRnTGTvfrKyoHXkdTpD3xPxM5UagyvOcpIT7tL/584iUy8uqd24uyQtajp0FwPpHcqeY4OBatsmiH1hvK+6QNb32tyhhfBQVL5XteJTimXCJt0BVrWFjuTEam0gy4tzPu2gM1yAzkkuEpluebDMwguoGgUg+NP7/AHxNGsLzbTQelXy6yduR94irMKT6pGptuJVYpNyPKNP4OZZqEj6QwlKX0pBWhOzg3/fHNve3o7eiSmv7FWzVFqb7eQnTzV+6G4YQXLK7x1Kluesm4sI1FJ4WlKlLIfZaTZQva1jeGer4EzJIDdz06QtGxxY9bUp9maZ9xTSXQTY5QIY21ltp8AWJF4l2O6O5RqtMMqRlTe6fYYiDSgVLF9SkiOvCTcUecthsm0IKBcZbNyb6GG5LxQopJynmIdEp/iiz01ENc8mzhI2O5i2COyTrk9TifRp2YlxvladUkfAGJ7wt481zhtiVmphw1SVP2cxLTRKipokFQSrcK0FuWm0VhmztDqI8QrXSM4RHlrGT624OxdSsZ0mWn6XMh5mYaS8gK0VlULg2iSBm2lvO8Yq7JGOxUcMvUIvFqqUZZdYVfVUus3+CVEi3QiNe4WxK3XmVNOWbnWh42+o/OHlGMrOBeyppb10dsywCLfOI/OSw7xQtaJY81udxDLOseO4A1G8bwKlbcXKeFYWl5sAD0aaTmNtgpKk/XLGE67JJpuM6izYBAmFnTbKdR9RH0H4jtsTGAay24tIKGO+/sKCifgDGBuIU1LTOK1zUqrOhxpBPLxAZT9B8YYq7Dwb2MungbOIdw36KpWZSUlux6IUUj5WjSeBeK9NqlGbl6tWZdmrNKWhxp1YQTlVa4vv7o+e+GOK81hJ1SpIsK8SlFLqFcxrsR0gtT4qzFUqS5xbqWVrc7wobCgkHyBJjqwsguzm2UzbzE+nQrEioAipMkHW/fJgR8xkcVp9CEpTVHEpAsBdWkCCeav7A+C0tWmUuXKyUsoaSTckC2sSJDCJVCEISEpteI5TJixSc+t9xDw3MOTCwL+EbWEcGUnI+gyUUsJDxT0EalVrG8fR7sOz+HcNcOpOQccSzX63MOTCSpBJfSkABIVt4QCbeZj5stTHdBAz2Jj6K9hbE1FquA2Qqnyv5Tkn1yonQgF1KVAKAKtwDcxpW1Vwl5PZx9c2ksGsvTWPSjLd4O/CO8yc8t7X+MHQc5UcpTrz5wg3TmRPrnbEurQG/KwJP4/IR1wPj0c5ZfYUi0CDR6BFG1HJAsX8Pqc9Vl4nGdFRQ33ShmulaTlG3Iiw2iMuJsDqbCID2uu1DKcMJB2h08qVU7BbjyCCEHkkefWI12cuLs/xY4cpq9UaDc03MLl+8SModSLWVbrqR7orUVT2KyR1v4dbBN1otd1aup1jmWrW2W8cz1SSCdY5zVkpB29nSOZg7m5Dg44Bt0iPLAm8c4fZUL/alWnLVMdvp5eNzoPOK/wCIeMEYWmmZ1E8xJTIbKUvOOhBbF9xc79INTFymkhbVTSpZrfFGKqZg2hT1Wqk03LSkmyp5wqUAbAXsAdydhHxj7W/ayq/GvGbrS5tyXo8spRl5Nk3DSeQF9Mx5qtDlx24yTVZq3oTU45MtPCYK5gvFwO2yWsoE35xkmceecmXFruFFRKr9Y7cIKv8Aueaxv7DTa0vFzM0XVFVyt9WdXs1hrclUrfWtILRA/m9BHcHbmwNvMQVTajmcuVIJsddLwGccsKngRprk2zMBxhxTTqfvJNtItuhvzDzbeSqsThUkGyVjMPIjrFaSUopEu/NqQQ2lIuTtrtDQ+hxOVwXB9YEHUQvKtew9d0q+mXrMuOBOVaje3KGabeCVamOfhu/OYkpcyw8pTzssE5VnfKb2v12jsqNHebWUqSc3kIVdWGdKF+5DM/OqLuRGmu9o65yaU0pGXdQ+MEapqkuDckn4R2Vimufxaw0A1tzjO1ZCqbwyF4jmzOzacyt1KVb4R0UdhLi06GzbQNidzf8AeY4a7KhFRQjVIUlRGkO9Odbk6a7OEAJaVmuvokaD3lQjrU8ROJdL82QLFUwV1ybQd0KKD5EbxHpx3K2ABsY7JtxUzMPPLOZTjilE9bmOOZShxshNwQdbwKT5BHGhRbdStBIUDe/OLw4S8XpGkpYk6x/FloGQTf3Cn9LpaKQykKudI6+5V3aXEjw7EiATgprDD1WypluifQLAs9KVaSamJGYampdZPjaUFJ36iJ4KC3MoNk5vdHzQpFZnqK/3sjOzMi5f15V5Tar+1JBibyPGnHVJCFyWL6wlW1nptToHuXcGFPiSfTOnHXx/xI0L2iuHDctQ11tpkjuLJdI5DUA/GwjKDw7iaseRiZTfFnHPERbVJq+IpuelXnEBUvZDaFnMLZghKc2tt4i9XlVS864hQ8SVFJuLc/8ACHKqpVxxI5+ouhbPMRDKLrasQCDa0N02jvGDe+ZO8d7SlLIXexGhjhd0mnUfdP7r/jBGLHCwSlZBtBUpyrtuIMEHMCPZCqkj1ttRFEJ7wKxWrB/FCizZcCJWac9Bmb7d24QAfcrKfdG7kuOS7zc0wsszDZulQ3Bj5vyyksOyrvNDyFE+QUDH0iYSHWL3zAgG5O8J3/i1JDmnxJOL6LIwtidvEUoUrAanGx9q3yP6Q8oUqTBJFtNeUVa1Pv0aebm5YhLzWovsrqD5GLXkqkxXaYxOsCyHBqk7pPNMHrnvRy9RS6pcdEbmsLfliVm5ZzUPtrZsf0kkfjGAOKeGPyDOS5S33ZClsrT0It/j8I+lMonK8dB1jEHalogp2Iqy2EW7mf74EDcLBI/WEMR7B1POUZ+o1Dp81OOCYZz3TcDMRz1h/rWBqQhyXXLolkh1nOlozOUlVx4UgqFzry6RFVTDkrNJIuEneEKmsvIykkgG48obe1LktKWeGOSqdRmlFDjEsHEmygXF3B5/egRFy2L/AHfjAgGY/Rrxy+zTUgwlhd1hOX4w5Ln5eVuoKBNrpERZioOL9RBII0JhNx1xTl3nASfVbhRSyeoY9zFVLi9CMyjoOkau7BeO26JxCVQZqZTLytWSA2parAPIOZA9+o98ZCp8irR51Qzq+6OQ6RI6fU3qc809LrLbyCCkjQixgF1aug4N9il1Kug4s+6rk41JyhefWlttIupSjYCG2SxfIVR9TUgXJ1abZu6R4U+0mwj5k4J7WmK5aVYlJ6qvTzCEhPdTay4kAdAdovzA3bGcp8slj8nyeU62CbC/uIjUVbvS42/+zhzquTwjaydQCRbyMBaglJJNgOZjMJ7Vwncjhk2wpOoKFqHP2x1zXaEl8cybtMm6cfRXLZhLvLbUryuDe3lDSjl8sLiSTwjMHbKwdSsUVmoTSp29QM46vvW/VyFZITvrYRcHAzFuF6xgSSkMNBuSMiylD9PSnKtpdtVW+8Cb+KJ9T+AfDfE7P5QquEC+VeK8zOvqB9xXDtRuG/DjB8939CwvTaVNFOQvNZsxHS5MNarF0ElngJo99MstDUbkXV84ItSAkk2HSJ8mSobqbqZaI6AkW+cNtQTh6xCWU6c0qP4GOP4pI7itTKzxRiqRwrTFz0++G2wcqED1nFckpEYk7QnFSVr1bcdLs5KOqSEol5eecSAANCQkgXja3EbA+D8XhKp70lK20kNqZmlIyeYB0v7oyRxU7INEqgmH6Bi6ckJlVyUz7aXkq8sycpHtsYZonXU8yfIpfCyzhLgyhVJl+feTMflCZfW1eyJlfeAg7i+/xvHFTKRT6hU2XFOtWSrMtl02CiNbH4RJMXcLqjw5mQxNNOrQdEziXC424fI8vYQIq+rKZmlvqdmO6QFWGRGdSjz5jSOhuUucnN27eCysSvU1NTYYY9GqMsEpccZaYDaBb1gAANB1hmrVTmq1LOat9wTlQ23ZLTY5acrfGIJL1t6msCUklqQ0TdZyAKWfMwQpaqLveTjy2gBlHdNBRUfYSBGG0Qk9XrDdRp7NFpYQlhiy5uZOyldfibAQzOU7Oo55ha8ulgcot7BHRKKQ1KGWDpOZQNgMptsNOUNtUp8tKutmXWuWLhyqCFqJI676xbRBxp07N0V4TMlMPSr7fquNrIIie4f4wMTSkSmJJcKvoKhLp1H9NPP2j4RW8gVvMrbcJVk0CzzEc0zLXZVf1h6sLyjgLGWODRrGHWJpluek3mp2Vd1beZOZJECs0gKYBFk92rMSdLC2sUfw14nTfDuqZykzdLcWPSZJZsFDmpPRXnGtWaJS8dYZYqtHmEv06oNEIWndJIIKVDkoHeAuC7GI3tcGbcRMpnAl1pr7NpavtDpe/K0MeKJhLFGlJNsWUq7rigeQsEj43+ESys4cqNIrSpOoN902Vggg3CvMRD8RN5XnnSjwpb08gBD1SxASm90skHLVmr/pWhvQC486RsIc5khmSCr68h5xwSoIl3LW13N4XZRxrA7wi9/ZEiw/TlVOVmGkka2tfWx5QwJTdRsb30AiXcPp5qRqwaft3b1ki+wVyv8ASDUx3SwwVsnGOURtTZbcLagQpJIItsYUQst+Y6RKuJ+Hzh3FboulTM0kPIWn1Tca/wCfOI0hAJ15xuVeyTRiM90Uxyw/OLkZ5qYZVlcbUFpUBexBveHmcSajPLzG7im84J3Uq5MMUkz3ayUg3MdKKk8iuNlIJCVJFwOVtfrDEcbOQaf5cCknJqcedbtdRRmCedxDLMLy1AZkkG9rRMJXI3WWzshQXyv90xFq99lOEDkom/leE5R4HDjLWR5Q31uI9yAOrQob6wtOAImknkRBptBQ825yUkQHBH9CLyQiXJG4BBj6KYSnk1LD9PmEnMHZdtYPtSDHzvmhnSLWAI1tGyezli38u8OKe0teaYkbyjgvr4dEn4WhTURbimhjTPbPBas8zmSSN7c4cMA140uquU99WWXmvVvslwbfHb4RxvKu3vyhgqOdN3GyQ4k3Sobg8jC1U8PA7fUrYNF3PzyZUpURe4jIna0mnpjFU4CzZuakmXQojQ5fD+xGp8K1BrFFDlZy93Qe7dHMLGh/f74qftWYXaclqHO5LhTb0qq3l4h+sqOmjztS22YZgKpzi5NKShAcCr3vfSOL8uPpSD3SbAcxDrW5UoStChZTayCCPO0M5bC2gSNYZk2uhtRR5/CJ0/zTf9kwI4SixIgQLczWC/WJh5xKUhIbT1O8d8rLtpGf1l81GG9BOYi+lo75Q+E+yE+j0MjuQ4QoC5+MdqHwk23vz5w2bOm3lCzR+1EYbyZJBIuALsnS5tpE8w4h95aAgk8s0V7JaKTFn4HJyjX7w+sbggVnWSzcL4XqNWUhpoKUV6dBGm+HmDMO4BYZnK/OtOOtpCu5zAknnFG4SecaknFIWpCgkWKTYwx4iqM09MEOTLywRqFOEw5Wl2zmTk5PBo3iB2hJeczSlLs0wNE2tciIHT8evvP3ceUb+cUrKrUVKuonXmYe5BatPEfjGJTbYaEEkXYvH60NFJcJB84idZ4iOJuA5lSNNIi7q1ZB4jt1iNVckqNzfSBthoIfqpjt2YJ+0PvO0ROqYpdcUcyiRbrDdNb+6GiaNwYQs7H4jfi7usR0uYkZtGdl5JBB/DofOMe44wa7g6pKlVul1pSiWVZd0+Z6xrqd9aKr4qy7TrLOdtC7K+8kGL0s2p7fQtqq1KG/2ikMOT8jRWph6alGZiZWmzSn2+8S3vfQ6X90HpSmK7NOPP2lUoPhLMsCD/VCkgQ9hpAw7OjImyptCTpuMpsI7aBLMpBs0gackiO/tXBxm8EHq0io1ZZ7xRQR4FJT3Zy+y5t8TCAle5WQVKcWrQKWq5h3xAScWPpJJSG02HIaCG10faJ8zFOJY+CQZpNP7kvJmZ90hS0tapbFtE35nXXkLQy1Elt0JCs2UWKhtfnaHCSNwCd4aqn/ACrY5d2T84HKPBYtTKWJqZbfKUHIc5S4AUkDr5RfHZy4kPMYtTRWmpR6mzQUp1hpQbCMqSc43tYD3xQj6iKILEi67HzESfs5f/FaWHL0Kc0/7IwOEfRmX2WVxOxc1XcSzCmX0OtS5KUJb1SCTtfrFVY2qARLuoFs7gDYINr2teDJWr0pzxH+WJ38zDBiVRNSlgSSLk2MMP8AFYRXZH6w8W22mbi41IvHKwpXdqF9LWgVIkzyr9YLLaoMKmhdhiygox2tpKClQ5HQwg36gjoRqINDgDPktmt0eWxtwmkZ9h0uVyTWoqZtclsDXb/OkVBLugix0tyMaE7PTaHsMYnS4lK0iXVYKFwNooKrJCKxOJSAlIcVYDbeOjqIJRjMQpm5SlFknww2lMq+8QTmaUjwjqQBr7oY+8Uqcdy7JcIHxie4El2l4Oqrim0KcSpoBZSLjxdYSwPT5WYbeU7LMuq786rbBO56wB9B0kmMzqFpeaKQc2gSE76iIziNpxE6UqBSb2tbntG3MCUKm99LH8nyt7DXuU9PZEN4/UGmNyiXEU6US4VputLCQdzztCsn6G4tsyVNqKpptsa5QBHUXUrYykXUNLx5UUJRWXQlISAs6AW5xyjRtXtgcfo1g9LhUokmL37K1bMrWKvTFm6XUIfQL7EXB+VooRGxi1ezkojiKmxIuwqB2L8GahxNGym30rbttHJPAqSSRtpAlv5MeyPJr+RX7Y5OOTtR5R28NsTigYhXIzByyU+QEk7IdHqn37fCJL2iVSquGb8y8oBcg8iZJP3UAFKjb+sIp+tKKDmSSkg3BGljEg46urc4UT+ZalZpRGa5vfVO8dCmW6OGcHVQULlJGJsThmYqM96K4HWnXCtC0iwNzfYxHmJBzxJXZvpcw7TAs2kjQwyh5wuKutR1HOOntWDLeHweKpbhUdEH3wIRW85mPjVv1gRexGss/9k=', 'ashley', 'ilao', 'carables', 'pagolingin', '2005-04-21', 19, 'Widow', 'Female', 14, '0923187218', 'ashley@ashley.com', 'Nurse', 'pagolingin', 1, NULL, 0, 4000.00, 'unclaimed', '1724571697.png', '2024-08-25 07:41:37'),
(187, '5489273487289', 'test', 'person.png', 'test', 'test', 'test', 'test', '1980-04-21', 25, 'Single', 'Male', 14, '9348928', 'test@test.com', 'fdsj', 'test', 1, NULL, 0, 4000.00, 'unclaimed', '1724600999.png', '2024-08-25 15:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_support`
--

CREATE TABLE `tbl_support` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `user_type`, `avatar`, `created_at`) VALUES
(10, 'staff', '6ccb4b7c39a6e77f76ecfa935a855c6c46ad5611', 'staff', '03052021043218icon.png', '2021-05-03 02:32:18'),
(11, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'administrator', '09052021074950person.png', '2021-05-03 02:33:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qrcode`
--
ALTER TABLE `qrcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbenificiary`
--
ALTER TABLE `tblbenificiary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblblotter`
--
ALTER TABLE `tblblotter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrgy_info`
--
ALTER TABLE `tblbrgy_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblchairmanship`
--
ALTER TABLE `tblchairmanship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblofficials`
--
ALTER TABLE `tblofficials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpayments`
--
ALTER TABLE `tblpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpermit`
--
ALTER TABLE `tblpermit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposition`
--
ALTER TABLE `tblposition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblprecinct`
--
ALTER TABLE `tblprecinct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpurok`
--
ALTER TABLE `tblpurok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblresident`
--
ALTER TABLE `tblresident`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_purok` (`purok`);

--
-- Indexes for table `tbl_support`
--
ALTER TABLE `tbl_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `qrcode`
--
ALTER TABLE `qrcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbenificiary`
--
ALTER TABLE `tblbenificiary`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblblotter`
--
ALTER TABLE `tblblotter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblbrgy_info`
--
ALTER TABLE `tblbrgy_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblchairmanship`
--
ALTER TABLE `tblchairmanship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblofficials`
--
ALTER TABLE `tblofficials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblpayments`
--
ALTER TABLE `tblpayments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblpermit`
--
ALTER TABLE `tblpermit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblposition`
--
ALTER TABLE `tblposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblprecinct`
--
ALTER TABLE `tblprecinct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblpurok`
--
ALTER TABLE `tblpurok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblresident`
--
ALTER TABLE `tblresident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `tbl_support`
--
ALTER TABLE `tbl_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
