-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 13, 2020 at 05:42 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cseku`
--

-- --------------------------------------------------------

--
-- Table structure for table `ams_asset`
--

DROP TABLE IF EXISTS `ams_asset`;
CREATE TABLE IF NOT EXISTS `ams_asset` (
  `id` varchar(40) NOT NULL,
  `type_id` int(11) NOT NULL,
  `serialNo` varchar(256) NOT NULL,
  `modelNo` varchar(256) NOT NULL,
  `brand` varchar(256) NOT NULL,
  `purchaseDate` date NOT NULL,
  `status` varchar(256) NOT NULL,
  `configuration` text NOT NULL,
  `stuff_id` varchar(40) NOT NULL,
  `purchasedFrom` varchar(256) NOT NULL,
  `cost` double NOT NULL,
  `warrantyLimit` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serialNo` (`serialNo`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`stuff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ams_asset_type`
--

DROP TABLE IF EXISTS `ams_asset_type`;
CREATE TABLE IF NOT EXISTS `ams_asset_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ams_repair`
--

DROP TABLE IF EXISTS `ams_repair`;
CREATE TABLE IF NOT EXISTS `ams_repair` (
  `id` varchar(40) NOT NULL,
  `asset_id` varchar(40) NOT NULL,
  `problem` text NOT NULL,
  `sendingDate` date NOT NULL,
  `receivingDate` date DEFAULT NULL,
  `status` varchar(256) DEFAULT NULL,
  `sent_by` varchar(40) NOT NULL,
  `received_by` varchar(40) DEFAULT NULL,
  `repaired_from` varchar(256) NOT NULL,
  `cost` double DEFAULT NULL,
  `onWarranty` tinyint(1) NOT NULL,
  `isReceived` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sent_by` (`sent_by`),
  KEY `received_by` (`received_by`),
  KEY `asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ams_user_asset`
--

DROP TABLE IF EXISTS `ams_user_asset`;
CREATE TABLE IF NOT EXISTS `ams_user_asset` (
  `id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `asset_id` varchar(40) NOT NULL,
  `lendingDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

DROP TABLE IF EXISTS `blood`;
CREATE TABLE IF NOT EXISTS `blood` (
  `bloodID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(40) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `blood_donate_date` date DEFAULT NULL,
  PRIMARY KEY (`bloodID`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood`
--

INSERT INTO `blood` (`bloodID`, `userID`, `expire_date`, `blood_donate_date`) VALUES
(25, 'monir150227@gmail.com', '2019-01-24', '2018-10-26'),
(21, 'monir150227@gmail.com', '2018-09-11', '2018-06-13'),
(20, 'monir150227@gmail.com', '2018-09-10', '2018-06-12'),
(23, 'monir150227@gmail.com', '2019-01-23', '2018-10-25'),
(26, 'mehadi.cse16@gmail.com', '2018-09-12', '2018-06-14'),
(27, 'mehadi.cse16@gmail.com', '2019-01-24', '2018-10-26'),
(28, 'mkazi078@uottawa.ca', '2019-01-25', '2018-10-27'),
(29, 'abir@gmail.com', '2018-10-02', '2018-07-04'),
(30, 'abir@gmail.com', '2018-01-26', '2017-10-28'),
(31, 'naim16@gmail.com', '2010-10-13', '2010-07-15'),
(32, 'naim16@gmail.com', '2019-01-27', '2018-10-29'),
(33, 'mefahimrahman@gmail.com', '2019-07-09', '2019-04-10'),
(34, 'mkazi078@uottawa.ca', '2019-07-14', '2019-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `bsms_book`
--

DROP TABLE IF EXISTS `bsms_book`;
CREATE TABLE IF NOT EXISTS `bsms_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(1000) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `edition` varchar(1000) NOT NULL,
  `writter` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `ammount` double NOT NULL,
  `contact_number` varchar(11) NOT NULL,
  `date` date NOT NULL,
  `img_name` varchar(1000) NOT NULL,
  `img` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bsms_book`
--

INSERT INTO `bsms_book` (`id`, `user_name`, `name`, `edition`, `writter`, `description`, `user_id`, `ammount`, `contact_number`, `date`, `img_name`, `img`) VALUES
(1, 'Aysha  Akther', 'House Of Dead', '2nd', 'Mrittunjoy Gain', 'Normal', 'aysha@gmail.com', 120, '01521323232', '2018-09-28', '', ''),
(2, 'Aysha  Akther', 'Mathematical Method', '1st', 'Mrittunjoy Gain', 'Total new. Just read once.', 'aysha@gmail.com', 330, '01711548789', '2018-09-28', '', ''),
(15, 'Aysha  Akther', 'Debi', '6th', 'humayan Ahmed', 'New', 'aysha@gmail.com', 500, '01521369845', '2018-10-29', '', ''),
(5, 'Kashif Nizam  Khan', 'Math', '2nd', 'Wizz Jenson', 'New', 'kashif@gmail.com', 80, '01925865642', '2018-10-02', '', ''),
(6, 'Kashif Nizam  Khan', 'American Pie', '2nd', 'Robert Willson', 'Total new. Just read once.', 'kashif@gmail.com', 380, '01711456525', '2018-10-02', '', ''),
(9, 'Zahidul  Islam', 'House Of Dead', '2nd', 'Mrittunjoy Gain', 'Normal', 'zahid@gmail.com', 480, '01838562634', '2018-10-02', '', ''),
(11, 'Zahidul  Islam', 'The Amazing Spider-Man', '1st', 'Antor Ali', 'Used for 6 months', 'zahid@gmail.com', 350, '01521323232', '2018-10-10', '', ''),
(13, 'Kashif Nizam  Khan', 'Dead Pool', '2nd', 'Anam Bravo', 'New', 'kashif@gmail.com', 200, '01521369845', '2018-10-23', '', ''),
(14, 'Kashif Nizam  Khan', 'Dead Man', '2nd', 'Anon Ajax', 'Good', 'kashif@gmail.com', 120, '01711485269', '2018-10-23', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `budget_sector`
--

DROP TABLE IF EXISTS `budget_sector`;
CREATE TABLE IF NOT EXISTS `budget_sector` (
  `budget_sector_id` int(11) NOT NULL,
  `budget_sector_name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `budget_sector`
--

INSERT INTO `budget_sector` (`budget_sector_id`, `budget_sector_name`) VALUES
(41, 'Mosque'),
(40, 'Sports Section'),
(39, 'Academic Building Development'),
(38, 'Teacher Salary'),
(37, 'Organization'),
(36, 'Transport'),
(34, 'Pharmacy'),
(53, 'Library'),
(42, 'Study Instruments'),
(43, 'Saminer');

-- --------------------------------------------------------

--
-- Table structure for table `budget_subsector`
--

DROP TABLE IF EXISTS `budget_subsector`;
CREATE TABLE IF NOT EXISTS `budget_subsector` (
  `budget_subsector_id` int(11) NOT NULL,
  `budget_sector_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `budget_progress` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `amount` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `budget_subsector`
--

INSERT INTO `budget_subsector` (`budget_subsector_id`, `budget_sector_id`, `start_date`, `end_date`, `budget_progress`, `description`, `amount`) VALUES
(9, 31, '2018-10-16', '2018-10-23', '33', 'dsdsaad', 0),
(8, 31, '2018-10-16', '2018-10-23', '33', 'dsdsaad', 0),
(7, 30, '2018-10-02', '2018-10-04', '44', 'ssssssssssss', 0),
(6, 29, '2018-10-10', '2018-10-25', '78', 'fnbfg', 0),
(10, 32, '2018-10-01', '2018-10-31', '10', 'description', 10000),
(11, 32, '2018-10-01', '2018-10-31', '15', 'Description', 210000),
(12, 41, '2015-06-15', '2020-02-03', '90', '							This is the Budget of University mosque.Contraction almost 70 parcent complete.probably mosque construction will done a few month.						', 500000),
(13, 40, '2018-10-02', '2019-06-17', '55', 'This the sports section.every year contribute 50,000 amount in section.', 50000),
(17, 39, '2018-10-01', '2019-01-01', '45', 'This is the Section of Academic building contraction of university.Every year allotment of amount.', 200000),
(18, 38, '2018-10-01', '2019-10-01', '100', 'This is the Sector of Teacher Salry.Every year contribute to admisastration.', 600000),
(19, 37, '2018-10-01', '2019-10-01', '100', 'This is the cultural section.Every year organize various cultural event Such that Rag Day,Pitha Uthsob,Pohela Boishak etc.\r\nAt the beginning of the year.Is determined ammount.', 500000),
(20, 35, '2018-10-01', '2020-10-04', '67', 'uu', 50000),
(21, 35, '2018-10-03', '2018-10-04', '49', 'ffff', 555555),
(22, 53, '2018-02-02', '2014-11-01', '66', '							This Is the Library unit.						', 10000),
(23, 53, '2018-02-02', '2014-11-01', '88', 'This Is the Library unit.', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `ems_email`
--

DROP TABLE IF EXISTS `ems_email`;
CREATE TABLE IF NOT EXISTS `ems_email` (
  `id` varchar(40) NOT NULL,
  `firstName` varchar(256) NOT NULL,
  `lastName` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `contact` varchar(256) NOT NULL,
  `contactEmail` varchar(256) NOT NULL,
  `address` text NOT NULL,
  `created_at` date NOT NULL,
  `expire_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_event` datetime NOT NULL,
  `end_event` datetime NOT NULL,
  `discipline` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `start_event`, `end_event`, `discipline`) VALUES
(1, 'ttt', '2019-04-15 13:00:00', '2019-04-25 12:00:00', '{ffdb1cb8-af34-4381-8971-9784dcb516c5}');

-- --------------------------------------------------------

--
-- Table structure for table `fms_file`
--

DROP TABLE IF EXISTS `fms_file`;
CREATE TABLE IF NOT EXISTS `fms_file` (
  `ID` varchar(50) NOT NULL,
  `Link` varchar(200) NOT NULL,
  `CreatorID` varchar(50) NOT NULL,
  `CurrentUser` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fms_file`
--

INSERT INTO `fms_file` (`ID`, `Link`, `CreatorID`, `CurrentUser`) VALUES
('{5DF79745-8FAE-4DAB-904E-B62517B0F2D0}', 'uploads/file/o8tbncfj1m.cpp', 'ryhan1630@cseku.ac.bd', 'rokeya@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `fms_fileassign`
--

DROP TABLE IF EXISTS `fms_fileassign`;
CREATE TABLE IF NOT EXISTS `fms_fileassign` (
  `ID` varchar(100) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `disciplineID` varchar(50) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `timestamp` timestamp NOT NULL,
  `links` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fms_fileassign`
--

INSERT INTO `fms_fileassign` (`ID`, `sender`, `receiver`, `disciplineID`, `comment`, `timestamp`, `links`) VALUES
('{5DF79745-8FAE-4DAB-904E-B62517B0F2D0}', 'ryhan1630@cseku.ac.bd', 'rokeya@gmail.com', '', 'Hello World', '2019-07-11 07:25:04', 'uploads/file/o8tbncfj1m.cpp ryhan1630@cseku.ac.bd 1562829904');

-- --------------------------------------------------------

--
-- Table structure for table `jms_applicant`
--

DROP TABLE IF EXISTS `jms_applicant`;
CREATE TABLE IF NOT EXISTS `jms_applicant` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `applicantID` varchar(40) NOT NULL,
  `JobID` varchar(40) NOT NULL,
  `cvID` varchar(100) NOT NULL,
  `SubmissionDate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jms_applicant`
--

INSERT INTO `jms_applicant` (`ID`, `applicantID`, `JobID`, `cvID`, `SubmissionDate`) VALUES
(9, 'hbappy79@gmail.com', '2', '7', '2018-08-13 05:03:17'),
(11, 'mkazi078@uottawa.ca', '2', '8', '2018-10-09 11:22:29'),
(12, 'hbappy79@gmail.com', '3', '9', '2018-10-22 07:48:25'),
(13, 'mkazi078@uottawa.ca', '3', '8', '2018-10-23 01:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `jms_cv`
--

DROP TABLE IF EXISTS `jms_cv`;
CREATE TABLE IF NOT EXISTS `jms_cv` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `applicantID` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `sector` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `profile` varchar(500) NOT NULL,
  `technical_skill` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jms_cv`
--

INSERT INTO `jms_cv` (`ID`, `applicantID`, `Name`, `sector`, `email`, `phone`, `profile`, `technical_skill`) VALUES
(9, 'hbappy79@gmail.com', 'Hadiuzzaman Bappy', 'Android Developer', 'hbappy79@gmail.com', '01325645897', 'Designing and developing advanced applications for the Android platform.', 'css,html,java,c,cpp'),
(17, 'mkazi078@uottawa.ca', 'Kazi Masudul Alam', 'Web Designer', 'mkazi078@uottawa.ca', '(+880) 1965-259846', 'Progressively evolve cross-platform ideas before impactful infomediaries. Energistically visualize tactical initiatives before cross-media catalysts for change.', 'XHTML,CSS,Javascript,Jquery,PHP,CVS / Subversion,OS X,Linux,Windows');

-- --------------------------------------------------------

--
-- Table structure for table `jms_cv_education`
--

DROP TABLE IF EXISTS `jms_cv_education`;
CREATE TABLE IF NOT EXISTS `jms_cv_education` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cvID` int(11) NOT NULL,
  `instituition` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `cgpa` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jms_cv_education`
--

INSERT INTO `jms_cv_education` (`ID`, `cvID`, `instituition`, `subject`, `cgpa`) VALUES
(29, 17, 'Khulna University - Khulna', 'Computer Science and Engineering Displine', '4.0'),
(11, 9, 'Khulna University - Khulna', 'Computer Science and Engineering Displine', '4.0'),
(30, 17, 'Khulna University - Khulna', 'Computer Science and Engineering Displine', '4.0');

-- --------------------------------------------------------

--
-- Table structure for table `jms_cv_experience`
--

DROP TABLE IF EXISTS `jms_cv_experience`;
CREATE TABLE IF NOT EXISTS `jms_cv_experience` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cvID` int(11) NOT NULL,
  `jobname` varchar(45) NOT NULL,
  `jobposition` varchar(45) NOT NULL,
  `workingyear` varchar(45) NOT NULL,
  `workdetails` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jms_cv_experience`
--

INSERT INTO `jms_cv_experience` (`ID`, `cvID`, `jobname`, `jobposition`, `workingyear`, `workdetails`) VALUES
(11, 9, 'Data Scientist', 'Coder', '2015-016', 'Created machine learning models with Python and scikit-learn to predict energy usage of commercial buildings with 98% accuracy'),
(25, 17, 'Samsung Inc.', 'Senior Interface Designer', '2005-2007', 'Progressively reconceptualize multifunctional \"outside the box\" thinking through inexpensive methods of empowerment. Compellingly morph extensive niche markets with mission-critical ideas. Phosfluorescently deliver bricks-and-clicks strategic theme areas rather than scalable benefits.'),
(12, 9, 'Data Scientist', 'Coder', '2015-016', 'Created machine learning models with Python and scikit-learn to predict energy usage of commercial buildings with 98% accuracy');

-- --------------------------------------------------------

--
-- Table structure for table `jms_cv_skills`
--

DROP TABLE IF EXISTS `jms_cv_skills`;
CREATE TABLE IF NOT EXISTS `jms_cv_skills` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cvID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jms_cv_skills`
--

INSERT INTO `jms_cv_skills` (`ID`, `cvID`, `name`, `details`) VALUES
(31, 17, 'Interface Design', 'Credibly streamline mission-critical value with multifunctional functionalities.'),
(30, 17, 'Interface Design', 'Credibly streamline mission-critical value with multifunctional functionalities.'),
(11, 9, 'UI maker', 'Strong knowledge of Android UI design principles, patterns, and best practices'),
(12, 9, 'UI maker', 'Strong knowledge of Android UI design principles, patterns, and best practices');

-- --------------------------------------------------------

--
-- Table structure for table `jms_job`
--

DROP TABLE IF EXISTS `jms_job`;
CREATE TABLE IF NOT EXISTS `jms_job` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `Subtitle` varchar(100) NOT NULL,
  `PublishDate` date NOT NULL,
  `Organization` varchar(45) NOT NULL,
  `Qualification` varchar(500) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `AgeLimit` varchar(45) NOT NULL,
  `EmploymentType` varchar(45) NOT NULL,
  `NumberOfVacancy` int(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `ContactNumber` varchar(45) NOT NULL,
  `Salary` varchar(45) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `JobExperience` varchar(45) DEFAULT NULL,
  `LastDateOfApplication` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jms_job`
--

INSERT INTO `jms_job` (`ID`, `Title`, `Subtitle`, `PublishDate`, `Organization`, `Qualification`, `Gender`, `AgeLimit`, `EmploymentType`, `NumberOfVacancy`, `Email`, `ContactNumber`, `Salary`, `Location`, `JobExperience`, `LastDateOfApplication`) VALUES
(2, 'Lecturer', 'This job position is experience, talented of to the University authority', '2018-08-10', 'Khulna University', 'H.S.C 5.0 + S.S.C 4.0', 'Male', '32', 'Permanent', 2, 'hbappy79@gmail.com', '01325659875', '65000', 'Khulna, Bangladesh', '2 years of teaching', '2018-08-23'),
(3, 'Librarian', 'a job post for seminar library,cse corridor', '2018-10-22', 'Khulna University', 'Honors pass', 'Anyone', '30', 'Full Time', 2, 'mkazi078@uottawa.ca', '01932056403', '25000', 'CSE,Khulna University', '-', '2018-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `mytable`
--

DROP TABLE IF EXISTS `mytable`;
CREATE TABLE IF NOT EXISTS `mytable` (
  `serial` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(20) DEFAULT NULL,
  `actName` varchar(45) DEFAULT NULL,
  `Organizer` varchar(100) DEFAULT NULL,
  `venu` varchar(200) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`serial`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification_for_blood`
--

DROP TABLE IF EXISTS `notification_for_blood`;
CREATE TABLE IF NOT EXISTS `notification_for_blood` (
  `notificationID` int(11) NOT NULL AUTO_INCREMENT,
  `fromuserID` varchar(40) DEFAULT NULL,
  `touserID` varchar(40) DEFAULT NULL,
  `notification` varchar(1000) DEFAULT NULL,
  `read_unread` tinyint(1) DEFAULT NULL,
  `ndate` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `status_message` varchar(1000) DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  PRIMARY KEY (`notificationID`)
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_for_blood`
--

INSERT INTO `notification_for_blood` (`notificationID`, `fromuserID`, `touserID`, `notification`, `read_unread`, `ndate`, `status`, `status_message`, `status_date`) VALUES
(171, 'shish150225@gmail.com', 'rumon@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:19:51', 0, NULL, NULL),
(170, 'shish150225@gmail.com', 'monir150227@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:19:51', 0, NULL, NULL),
(169, 'shish150225@gmail.com', 'mkazi078@uottawa.ca', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:19:51', 0, NULL, NULL),
(167, 'shish150225@gmail.com', 'rumon@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:19:29', 0, NULL, NULL),
(168, 'shish150225@gmail.com', 'abir@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:19:51', 0, NULL, NULL),
(166, 'shish150225@gmail.com', 'rumon@gmail.com', 'BLOOD NEEDED!!! ', 0, '2018-10-29 11:19:10', 0, NULL, NULL),
(165, 'monir150227@gmail.com', 'shish150225@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-28 22:29:23', 0, NULL, NULL),
(164, 'monir150227@gmail.com', 'rumon@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-28 22:29:23', 0, NULL, NULL),
(163, 'monir150227@gmail.com', 'mkazi078@uottawa.ca', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-28 22:29:23', 0, NULL, NULL),
(162, 'monir150227@gmail.com', 'abir@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-28 22:29:23', 2, NULL, '2018-10-29 11:13:05'),
(161, 'shish150225@gmail.com', 'rumon@gmail.com', 'BLOOD NEEDED!!! \r\n', 0, '2018-10-28 20:15:12', 0, NULL, NULL),
(160, 'khalid@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-28 19:00:18', 0, NULL, NULL),
(159, 'shish150225@gmail.com', 'abir@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-28 18:50:22', 2, NULL, '2018-10-29 00:21:41'),
(158, 'abir@gmail.com', 'shish150225@gmail.com', 'BLOOD NEEDED!!!O+ Blood need argent', 0, '2018-10-28 18:38:21', 2, NULL, '2018-10-29 00:23:55'),
(157, 'mehadi.cse16@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-27 17:25:36', 1, 'ok\r\n', '2018-10-27 17:26:23'),
(156, 'mehadi.cse16@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-27 17:11:04', 2, NULL, '2018-10-27 17:26:26'),
(155, 'mehadi.cse16@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-27 17:09:27', 2, NULL, '2018-10-27 17:26:29'),
(154, 'mehadi.cse16@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-27 16:49:44', 1, 'cccc', '2018-10-27 16:52:13'),
(172, 'shish150225@gmail.com', 'abir@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:20:21', 0, NULL, NULL),
(173, 'shish150225@gmail.com', 'mkazi078@uottawa.ca', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:20:21', 0, NULL, NULL),
(174, 'shish150225@gmail.com', 'monir150227@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:20:21', 0, NULL, NULL),
(175, 'shish150225@gmail.com', 'rumon@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:20:21', 0, NULL, NULL),
(176, 'shish150225@gmail.com', 'abir@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:25:56', 1, 'yes', '2018-10-29 11:27:31'),
(177, 'shish150225@gmail.com', 'mkazi078@uottawa.ca', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:25:56', 0, NULL, NULL),
(178, 'shish150225@gmail.com', 'monir150227@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:25:56', 0, NULL, NULL),
(179, 'shish150225@gmail.com', 'rumon@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:25:56', 0, NULL, NULL),
(180, 'shish150225@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:31:16', 0, NULL, NULL),
(181, 'shish150225@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:32:01', 0, NULL, NULL),
(182, 'shish150225@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:35:59', 0, NULL, NULL),
(183, 'shish150225@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:36:13', 0, NULL, NULL),
(184, 'shish150225@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:36:52', 0, NULL, NULL),
(185, 'shish150225@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:40:12', 0, NULL, NULL),
(186, 'shish150225@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:40:17', 0, NULL, NULL),
(187, 'shish150225@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:42:47', 0, NULL, NULL),
(188, 'shish150225@gmail.com', 'naim16@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:43:38', 0, NULL, NULL),
(189, 'shish150225@gmail.com', 'rumon@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:45:41', 2, NULL, '2018-10-29 11:47:30'),
(190, 'rumon@gmail.com', 'aysha@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:49:38', 0, NULL, NULL),
(191, 'rumon@gmail.com', 'mahmud05@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 11:49:38', 0, NULL, NULL),
(192, 'shish150225@gmail.com', 'monir150227@gmail.com', 'BLOOD NEEDED!!! Wondering you might help! Blood will be needed after 3 month', 0, '2018-10-29 12:04:48', 0, NULL, NULL),
(193, 'naim16@gmail.com', 'monir150227@gmail.com', 'hey there!need blood\r\n', 0, '2018-10-29 12:14:10', 0, NULL, NULL),
(194, 'naim16@gmail.com', 'abir@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2018-10-29 13:06:43', 0, NULL, NULL),
(195, 'naim16@gmail.com', 'shish150225@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!hi', 0, '2018-10-29 13:09:53', 0, NULL, NULL),
(196, 'naim16@gmail.com', 'abir@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!Blood for O+', 0, '2018-10-29 13:15:34', 0, NULL, NULL),
(197, 'naim16@gmail.com', 'shish150225@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!Blood for O+', 0, '2018-10-29 13:15:34', 1, 'ok', '2018-10-29 13:16:16'),
(198, 'mefahimrahman@gmail.com', 'saimumislam96@gmail.com', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2019-04-12 22:17:26', 1, 'okk', '2019-04-12 22:17:51'),
(199, 'monir1527@cseku.ac.bd', 'mkazi078@uottawa.ca', 'BLOOD NEEDED!!! Wondering you might help!', 0, '2019-04-15 11:27:54', 1, 'yes', '2019-04-15 11:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `pms_hall_fee`
--

DROP TABLE IF EXISTS `pms_hall_fee`;
CREATE TABLE IF NOT EXISTS `pms_hall_fee` (
  `ID` varchar(40) NOT NULL,
  `UniversityID` int(11) NOT NULL,
  `Batch` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `HallName` text NOT NULL,
  `FiscalYear` text NOT NULL,
  `Discipline` text NOT NULL,
  `Date` date NOT NULL,
  `Admission` int(11) NOT NULL,
  `Institutional` int(11) NOT NULL,
  `IdentificationCard` int(11) NOT NULL,
  `SeatRent` int(11) NOT NULL,
  `Utensil` int(11) NOT NULL,
  `CommonRoom` int(11) NOT NULL,
  `Sports` int(11) NOT NULL,
  `ReligiousEvent` int(11) NOT NULL,
  `SecurityReturnable` int(11) NOT NULL,
  `Contingency` int(11) NOT NULL,
  `HallAnniversary` int(11) NOT NULL,
  `Fine` int(11) NOT NULL,
  `Others` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_hall_fee`
--

INSERT INTO `pms_hall_fee` (`ID`, `UniversityID`, `Batch`, `Name`, `Email`, `HallName`, `FiscalYear`, `Discipline`, `Date`, `Admission`, `Institutional`, `IdentificationCard`, `SeatRent`, `Utensil`, `CommonRoom`, `Sports`, `ReligiousEvent`, `SecurityReturnable`, `Contingency`, `HallAnniversary`, `Fine`, `Others`, `Total`) VALUES
('{29879C14-ED41-47B8-8A8B-5CF8CB8FF74B}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', 'Khan Jahan Ali Hall', '2017/2018', 'Computer Science and Engineering', '2018-10-21', 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 80),
('{C06F2047-430A-4DC7-8587-7DEADCF82A5E}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', 'Khan Jahan Ali Hall', '2016/2017', 'Computer Science and Engineering', '2018-10-20', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pms_link_project`
--

DROP TABLE IF EXISTS `pms_link_project`;
CREATE TABLE IF NOT EXISTS `pms_link_project` (
  `id` varchar(40) NOT NULL,
  `link` text NOT NULL,
  `project_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pms_others_fee`
--

DROP TABLE IF EXISTS `pms_others_fee`;
CREATE TABLE IF NOT EXISTS `pms_others_fee` (
  `ID` varchar(40) NOT NULL,
  `UniversityID` int(40) NOT NULL,
  `Batch` text NOT NULL,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `Discipline` text NOT NULL,
  `Date` date NOT NULL,
  `Description` text NOT NULL,
  `Total` int(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_others_fee`
--

INSERT INTO `pms_others_fee` (`ID`, `UniversityID`, `Batch`, `Name`, `Email`, `Discipline`, `Date`, `Description`, `Total`) VALUES
('{48B9FB28-B876-4296-92B6-E8EE3453E488}', 160216, '16', 'Aswad  Alam', 'aswad@gmail.com', 'Computer Science and Engineering', '2018-10-22', 'DEVELOPMENT', 10),
('{76A1ED3E-84CD-42BB-8BF4-4822FC6F163E}', 160216, '16', 'Aswad  Alam', 'aswad@gmail.com', 'Computer Science and Engineering', '2018-10-22', 'CLUSTER', 5),
('{D3779D9D-A8E8-4C89-9579-7CC5429A5609}', 160204, '16', 'Emamul Haque Manna', 'mannaemam@gmail.com', 'Computer Science and Engineering', '2018-10-22', 'Cluster', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pms_payment_type`
--

DROP TABLE IF EXISTS `pms_payment_type`;
CREATE TABLE IF NOT EXISTS `pms_payment_type` (
  `ID` varchar(40) CHARACTER SET utf8 NOT NULL,
  `PID` varchar(40) CHARACTER SET utf8 NOT NULL,
  `UniversityID` int(40) NOT NULL,
  `Type` text CHARACTER SET utf8 NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_payment_type`
--

INSERT INTO `pms_payment_type` (`ID`, `PID`, `UniversityID`, `Type`, `Date`) VALUES
('{0EA045CA-E9EA-47E0-809F-D72F4A8A5E36}', '{8D94B890-D07A-43CD-B1D7-84F6177B99C8}', 160204, 'Registration Fee', '2018-10-19'),
('{20735E4D-1273-4D55-83C0-5362B566B005}', '{9A69A4D3-5166-4F65-80A9-5B6347A30041}', 160204, 'Registration Fee', '2018-10-20'),
('{2D20B95F-E2F2-49D3-9108-545E203CC3EC}', '{87956421-ABC3-4FAC-888B-41EA15315A69}', 160204, 'Registration Fee', '2018-10-20'),
('{59878D61-4946-4608-BE94-0C47D3A8EADA}', '{C06F2047-430A-4DC7-8587-7DEADCF82A5E}', 160204, 'Hall Fee', '2018-10-20'),
('{67AB46B8-1EEA-46A7-98E3-481D9E24CFC0}', '{8B38CC68-FBE3-49A7-B31C-DB8D2B915159}', 160204, 'Registration Fee', '2018-10-18'),
('{8AD3FC1A-6F81-4C08-A843-2B66D8498400}', '{AD69CEC5-D998-4C67-94FA-F235D4DBC077}', 160204, 'Registration Fee', '2018-10-20'),
('{909E7B34-B267-4924-8367-8A44AA42DE46}', '{E464BEA5-AFCC-4A96-9AEC-10587AF3C5AD}', 160216, 'Registration Fee', '2018-10-19'),
('{AF5104DA-382F-446E-8C53-10E096B9E1EE}', '{29879C14-ED41-47B8-8A8B-5CF8CB8FF74B}', 160204, 'Hall Fee', '2018-10-20'),
('{FBAE33C2-1575-4F90-A661-8D09B7356DBA}', '{47EE1E78-A76B-4122-8147-106E94B1C480}', 160204, 'Registration Fee', '2018-10-17');

-- --------------------------------------------------------

--
-- Table structure for table `pms_project`
--

DROP TABLE IF EXISTS `pms_project`;
CREATE TABLE IF NOT EXISTS `pms_project` (
  `id` varchar(40) NOT NULL,
  `thumbnail` text NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `language` varchar(256) NOT NULL,
  `year_id` varchar(40) NOT NULL,
  `term_id` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `discipline_id` varchar(40) NOT NULL,
  `teacher_id` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `year_id` (`year_id`),
  KEY `term_id` (`term_id`),
  KEY `course_id` (`course_id`),
  KEY `discipline_id` (`discipline_id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pms_recharge`
--

DROP TABLE IF EXISTS `pms_recharge`;
CREATE TABLE IF NOT EXISTS `pms_recharge` (
  `ID` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Date` date NOT NULL,
  `Email` text CHARACTER SET utf8 NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_recharge`
--

INSERT INTO `pms_recharge` (`ID`, `Date`, `Email`, `Amount`) VALUES
('{46D252E8-7694-4C15-AB10-99D14CEE73B1}', '2018-10-17', 'mannaemam@gmail.com', 75),
('{94CEC983-C608-408E-86B5-EE99012CE047}', '2018-10-19', 'aswad@gmail.com', 9);

-- --------------------------------------------------------

--
-- Table structure for table `pms_recharge_log`
--

DROP TABLE IF EXISTS `pms_recharge_log`;
CREATE TABLE IF NOT EXISTS `pms_recharge_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Email` text CHARACTER SET utf8 NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_recharge_log`
--

INSERT INTO `pms_recharge_log` (`ID`, `Date`, `Email`, `Amount`) VALUES
(5, '2018-10-17', 'mannaemam@gmail.com', 100),
(6, '2018-10-19', 'aswad@gmail.com', 100),
(7, '2018-10-20', 'mannaemam@gmail.com', 50);

-- --------------------------------------------------------

--
-- Table structure for table `pms_reg_fee`
--

DROP TABLE IF EXISTS `pms_reg_fee`;
CREATE TABLE IF NOT EXISTS `pms_reg_fee` (
  `ID` varchar(40) CHARACTER SET utf8 NOT NULL,
  `UniversityID` int(40) NOT NULL,
  `Batch` int(40) NOT NULL,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Term` text CHARACTER SET utf8 NOT NULL,
  `Discipline` text CHARACTER SET utf8 NOT NULL,
  `Date` date NOT NULL,
  `AdmissionFee` double NOT NULL,
  `PayBook` double NOT NULL,
  `Security` double NOT NULL,
  `Transportation` double NOT NULL,
  `CourseRegistration` double NOT NULL,
  `Verification` double NOT NULL,
  `Retake` double NOT NULL,
  `ReRetake` double NOT NULL,
  `Bncc` double NOT NULL,
  `Library` double NOT NULL,
  `Medical` double NOT NULL,
  `Cultural` double NOT NULL,
  `ReligiousFee` double NOT NULL,
  `ExaminationFee` double NOT NULL,
  `SessionCharge` double NOT NULL,
  `Gradesheet` double NOT NULL,
  `ProvisionalCertificate` double NOT NULL,
  `MainCertificate` double NOT NULL,
  `Transcript` double NOT NULL,
  `SecurityLibrary` double NOT NULL,
  `EquivalenceCertificate` double NOT NULL,
  `FineLibrary` double NOT NULL,
  `FineRegistration` double NOT NULL,
  `Mc_Mi` double NOT NULL,
  `MphilPhd` double NOT NULL,
  `StudentWelfare` double NOT NULL,
  `Sports` double NOT NULL,
  `Publication` double NOT NULL,
  `Others` double NOT NULL,
  `Total` int(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_reg_fee`
--

INSERT INTO `pms_reg_fee` (`ID`, `UniversityID`, `Batch`, `Name`, `Email`, `Term`, `Discipline`, `Date`, `AdmissionFee`, `PayBook`, `Security`, `Transportation`, `CourseRegistration`, `Verification`, `Retake`, `ReRetake`, `Bncc`, `Library`, `Medical`, `Cultural`, `ReligiousFee`, `ExaminationFee`, `SessionCharge`, `Gradesheet`, `ProvisionalCertificate`, `MainCertificate`, `Transcript`, `SecurityLibrary`, `EquivalenceCertificate`, `FineLibrary`, `FineRegistration`, `Mc_Mi`, `MphilPhd`, `StudentWelfare`, `Sports`, `Publication`, `Others`, `Total`) VALUES
('{47EE1E78-A76B-4122-8147-106E94B1C480}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '1-1', 'Computer Science and Engineering', '2018-10-17', 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3),
('{87956421-ABC3-4FAC-888B-41EA15315A69}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '2-2', 'Computer Science and Engineering', '2018-10-20', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3),
('{8B38CC68-FBE3-49A7-B31C-DB8D2B915159}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '1-2', 'Computer Science and Engineering', '2018-10-18', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2),
('{8D94B890-D07A-43CD-B1D7-84F6177B99C8}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '2-1', 'Computer Science and Engineering', '2018-10-19', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('{9A69A4D3-5166-4F65-80A9-5B6347A30041}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '3-1', 'Computer Science and Engineering', '2018-10-20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 4),
('{AD69CEC5-D998-4C67-94FA-F235D4DBC077}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '3-2', 'Computer Science and Engineering', '2018-10-20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2),
('{E464BEA5-AFCC-4A96-9AEC-10587AF3C5AD}', 160216, 16, 'Aswad  Alam', 'aswad@gmail.com', '1-1', 'Computer Science and Engineering', '2018-10-19', 5, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pms_student_project`
--

DROP TABLE IF EXISTS `pms_student_project`;
CREATE TABLE IF NOT EXISTS `pms_student_project` (
  `id` varchar(40) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `project_id` varchar(40) NOT NULL,
  `contribution` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_course`
--

DROP TABLE IF EXISTS `reg_course`;
CREATE TABLE IF NOT EXISTS `reg_course` (
  `ID` varchar(40) NOT NULL,
  `CourseNo` varchar(40) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Credit` double NOT NULL,
  `CourseTypeID` varchar(40) NOT NULL,
  `DisciplineID` varchar(40) NOT NULL,
  `PrequisiteID` varchar(40) DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course`
--

INSERT INTO `reg_course` (`ID`, `CourseNo`, `Title`, `Credit`, `CourseTypeID`, `DisciplineID`, `PrequisiteID`, `IsDeleted`) VALUES
('{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664}', 'CSE 1103', 'Structered Programming', 3, '{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', NULL, 0),
('{24B98067-01EA-4B04-B815-3910BBAB2C29}', 'ece 3206', 'Data communication', 3, '{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', NULL, 0),
('{2A038C6A-B6DA-408D-8458-7493D4EE5D6C}', 'cse-3200', 'Web Programming Lab', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5} ', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D} ', 0),
('{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', 'cse-4112', 'Computer Networks Lab', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5} ', NULL, 0),
('{683A3D91-D124-44AF-82A3-FB43837A4392}', 'cse-4111', 'Computer Networks', 3, '{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5} ', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664} ', 0),
('{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', 'CSE 1104', 'Structured Programming Laboratory', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5} ', NULL, 0),
('{B17BDB32-6D88-4537-9545-65D940E17EEF}', 'cse-2115', 'Advanced Programming Lab', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{0CF37516-06FE-41CD-93AD-D2D1652509D6} ', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664} ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_resource`
--

DROP TABLE IF EXISTS `reg_course_resource`;
CREATE TABLE IF NOT EXISTS `reg_course_resource` (
  `CourseID` varchar(40) NOT NULL,
  `ResourceID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_sessional_type`
--

DROP TABLE IF EXISTS `reg_course_sessional_type`;
CREATE TABLE IF NOT EXISTS `reg_course_sessional_type` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_sessional_type`
--

INSERT INTO `reg_course_sessional_type` (`ID`, `Name`) VALUES
('{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}', 'N/A'),
('{45B2147F-5FE0-4CC9-880C-C19EB6323955}', 'physics'),
('{4B342686-B38E-449C-AAD2-1F7DD77E6594}', 'chemistry'),
('{D1E54E03-CDEB-4155-AD0C-27C70A3A490C}', 'ece'),
('{D3F895D3-7389-487F-A604-0BD546DCC764}', 'software'),
('{F1D0443A-EC5D-41C4-94BA-D6F0D9AB1691}', 'hardware');

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_student_registration`
--

DROP TABLE IF EXISTS `reg_course_student_registration`;
CREATE TABLE IF NOT EXISTS `reg_course_student_registration` (
  `ID` varchar(40) NOT NULL,
  `Regs_TeacherID` varchar(40) DEFAULT NULL,
  `StudentID` varchar(40) NOT NULL,
  `CourseID` varchar(40) NOT NULL,
  `SessionID` varchar(40) DEFAULT NULL,
  `YearID` varchar(40) DEFAULT NULL,
  `TermID` varchar(40) DEFAULT NULL,
  `IsRetake` tinyint(1) DEFAULT '0',
  `PreRetake` tinyint(1) NOT NULL DEFAULT '0',
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_student_registration`
--

INSERT INTO `reg_course_student_registration` (`ID`, `Regs_TeacherID`, `StudentID`, `CourseID`, `SessionID`, `YearID`, `TermID`, `IsRetake`, `PreRetake`, `Status`) VALUES
('{27D9E7CA-3B47-4FA6-8014-796F69E06B79}', 'mkazi078@uottawa.ca', 'lotif@gmail.com', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', '{2FFA4D56-743A-47AF-9DDF-1EA28CA43251}', '{EA335D18-A1A8-4D15-9C7B-4A4700AD4543}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 0, 1, 'registered'),
('{C2E9EB00-1751-4C91-8854-676FEC952714}', 'mkazi078@uottawa.ca', 'lotif@gmail.com', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 0, 0, 'registered'),
('{DFD4D9FF-DCA1-41CF-BC95-D604B237CB67}', 'mkazi078@uottawa.ca', 'rokeya@gmail.com', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 0, 0, 'registered'),
('{F2CF29E3-A0C8-4659-B5BA-638532427A8A}', 'mkazi078@uottawa.ca', 'lotif@gmail.com', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 1, 0, 'failed');

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_teacher`
--

DROP TABLE IF EXISTS `reg_course_teacher`;
CREATE TABLE IF NOT EXISTS `reg_course_teacher` (
  `ID` varchar(40) NOT NULL,
  `CourseID` varchar(40) NOT NULL,
  `TeacherID` varchar(40) NOT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `NoOfTests` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_teacher`
--

INSERT INTO `reg_course_teacher` (`ID`, `CourseID`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `NoOfTests`) VALUES
('{03BC7D61-45DF-4714-B30F-FE48BF508443}', '{24B98067-01EA-4B04-B815-3910BBAB2C29}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{A21965E4-4FE4-43AC-A77F-DABAC9B356F2}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 4),
('{8872B54C-23D7-4358-A7F7-E2C245C14FB9}', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 4),
('{B504FC3B-18CB-4E2F-84BD-8C1229CBA920}', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', 'avi@gmail.com', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 3),
('{FDDB9AAF-1495-49CC-A682-CE2DF2C8A561}', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', 'avi@gmail.com', '{2FFA4D56-743A-47AF-9DDF-1EA28CA43251}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 3);

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_teacher_registration`
--

DROP TABLE IF EXISTS `reg_course_teacher_registration`;
CREATE TABLE IF NOT EXISTS `reg_course_teacher_registration` (
  `ID` varchar(40) NOT NULL,
  `TeacherID` varchar(40) NOT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_teacher_registration`
--

INSERT INTO `reg_course_teacher_registration` (`ID`, `TeacherID`, `SessionID`, `YearID`, `TermID`) VALUES
('{CC494F52-1D3F-4877-BD28-91DF69556A2B}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}');

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_type`
--

DROP TABLE IF EXISTS `reg_course_type`;
CREATE TABLE IF NOT EXISTS `reg_course_type` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `SessionalTypeID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_type`
--

INSERT INTO `reg_course_type` (`ID`, `Name`, `SessionalTypeID`) VALUES
('{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', 'Theory', '{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}'),
('{5F886686-4EB1-48C8-A801-8D46233739D1}', 'Thesis', '{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}'),
('{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', 'Sessional', '{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}');

-- --------------------------------------------------------

--
-- Table structure for table `reg_registration_session`
--

DROP TABLE IF EXISTS `reg_registration_session`;
CREATE TABLE IF NOT EXISTS `reg_registration_session` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_registration_session`
--

INSERT INTO `reg_registration_session` (`ID`, `Name`) VALUES
('{05DA37EB-6C62-45E9-A0E3-7C5C6943F6AD}', '2012-2013'),
('{1399EEA3-B939-4155-B9F3-4DAD4928C4D5}', '2014-2015'),
('{2FFA4D56-743A-47AF-9DDF-1EA28CA43251}', '2017-2018'),
('{65C2BA57-7231-497A-A5A7-90912259684C}', '2011-2012'),
('{A36A7057-CDB5-4E10-9E61-CCC85C74460E}', '2013-2014'),
('{DFF9E45F-6954-46A1-9088-D930EE460C3F}', '2015-2016'),
('{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '2016-2017');

-- --------------------------------------------------------

--
-- Table structure for table `reg_term`
--

DROP TABLE IF EXISTS `reg_term`;
CREATE TABLE IF NOT EXISTS `reg_term` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_term`
--

INSERT INTO `reg_term` (`ID`, `Name`) VALUES
('{6DE3CF58-3A1A-4D6A-88CF-83F22C27E0BA}', 'Special'),
('{AF8B217E-4E76-41B8-A02A-7115BD4A6BE6}', '2nd'),
('{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '1st');

-- --------------------------------------------------------

--
-- Table structure for table `reg_year`
--

DROP TABLE IF EXISTS `reg_year`;
CREATE TABLE IF NOT EXISTS `reg_year` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_year`
--

INSERT INTO `reg_year` (`ID`, `Name`) VALUES
('{1FAC0F1A-9D60-43F6-AB07-C933D5A4AA30}', 'Phd 1st'),
('{326B168F-58CC-42F3-B71A-DFE8DBBC05E8}', 'MSc 1st'),
('{6780C884-E112-4F58-9503-E2110B615547}', '4th'),
('{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '1st'),
('{A21965E4-4FE4-43AC-A77F-DABAC9B356F2}', '3rd'),
('{ADBEDD3E-D8EA-47AA-A068-C4C703DB4AE6}', 'MSc 2nd'),
('{B9D6CC05-7AD4-4666-80AB-80797A872743}', 'Phd 2nd'),
('{BB760927-4174-47E8-B68F-ACB8AA381B41}', '5th'),
('{CBE08035-94CD-4610-B4E2-A0E844184056}', 'Phd 4th'),
('{E3823AA6-6BE5-4A07-93EA-FA59DE4F616F}', 'Phd 3rd'),
('{EA335D18-A1A8-4D15-9C7B-4A4700AD4543}', '2nd');

-- --------------------------------------------------------

--
-- Table structure for table `rms_course_marks_result`
--

DROP TABLE IF EXISTS `rms_course_marks_result`;
CREATE TABLE IF NOT EXISTS `rms_course_marks_result` (
  `ID` varchar(40) NOT NULL,
  `CourseID` varchar(40) NOT NULL,
  `TeacherID` varchar(40) DEFAULT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `StudentID` varchar(40) NOT NULL,
  `MarksID` varchar(40) NOT NULL,
  `MarksValue` varchar(200) NOT NULL,
  `Status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_course_marks_result`
--

INSERT INTO `rms_course_marks_result` (`ID`, `CourseID`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `StudentID`, `MarksID`, `MarksValue`, `Status`) VALUES
('{357EFB93-A3A6-4044-A305-206F30EF9841}', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160212', '{7E24DC07-CD2C-4360-A6E9-05A363C2EA08}', '8,20,20,10', ''),
('{4C7C80C2-8570-4895-B44D-67AA017F2EB0}', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', 'avi@gmail.com', '{2FFA4D56-743A-47AF-9DDF-1EA28CA43251}', '{EA335D18-A1A8-4D15-9C7B-4A4700AD4543}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160212', '{236BBFE8-E4CF-4EEF-9C54-AD83FEF42ADB}', '10,50,25', ''),
('{A8BBB47F-B9B8-4E93-A137-39240B5842FC}', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', 'avi@gmail.com', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160212', '{236BBFE8-E4CF-4EEF-9C54-AD83FEF42ADB}', '5,20,10', ''),
('{F20DC6E0-95C7-40A0-9F09-04BF5C55618C}', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160210', '{7E24DC07-CD2C-4360-A6E9-05A363C2EA08}', '10,28,25,25', '');

-- --------------------------------------------------------

--
-- Table structure for table `rms_course_marks_result_publish`
--

DROP TABLE IF EXISTS `rms_course_marks_result_publish`;
CREATE TABLE IF NOT EXISTS `rms_course_marks_result_publish` (
  `ID` varchar(40) NOT NULL,
  `CourseID` varchar(40) NOT NULL,
  `TeacherID` varchar(40) DEFAULT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `StudentID` varchar(40) NOT NULL,
  `HeaderID` varchar(200) NOT NULL,
  `HeaderName` varchar(200) NOT NULL,
  `HeaderMax` varchar(200) NOT NULL,
  `MarksValue` varchar(200) NOT NULL,
  `MarksTotal` varchar(20) NOT NULL,
  `Grades` varchar(200) NOT NULL,
  `GradeRanges` varchar(300) NOT NULL,
  `FinalGrade` varchar(20) NOT NULL,
  `GradePoint` double NOT NULL,
  `IsRetake` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_course_marks_result_publish`
--

INSERT INTO `rms_course_marks_result_publish` (`ID`, `CourseID`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `StudentID`, `HeaderID`, `HeaderName`, `HeaderMax`, `MarksValue`, `MarksTotal`, `Grades`, `GradeRanges`, `FinalGrade`, `GradePoint`, `IsRetake`) VALUES
('{8A2C3585-D74F-4E27-B2AA-596CBF89E41F}', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', 'avi@gmail.com', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160212', 'att,assess,viva', 'Attendance,Assessment,Viva', '10,60,30', '5,20,10', '35', 'F,D,C,C+,B-,B,B+,A-,A,A+', '0-39,40-44,45-49,50-54,55-59,60-64,65-69,70-74,75-79,80-100', 'F', 0, 0),
('{93578272-8B2F-4913-9290-AFD706073FCE}', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160210', 'att,assess,seca,secb', 'Attendance,Assessment,Section A,Section B', '10,30,30,30,30', '10,28,25,25', '88', 'F,D,C,C+,B-,B,B+,A-,A,A+', '0-39,40-44,45-49,50-54,55-59,60-64,65-69,70-74,75-79,80-100', 'A+', 4, 0),
('{B55CE2EF-8FA0-4B65-8CCB-D56781AC0281}', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', 'avi@gmail.com', '{2FFA4D56-743A-47AF-9DDF-1EA28CA43251}', '{EA335D18-A1A8-4D15-9C7B-4A4700AD4543}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160212', 'att,assess,viva', 'Attendance,Assessment,Viva', '10,60,30', '10,50,25', '85', 'F,D,C,C+,B-,B,B+,A-,A,A+', '0-39,40-44,45-49,50-54,55-59,60-64,65-69,70-74,75-79,80-100', 'A', 3.75, 1),
('{B9976440-6CE3-4F51-B6CF-E0D5842A889B}', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160212', 'att,assess,seca,secb', 'Attendance,Assessment,Section A,Section B', '10,30,30,30,30', '8,20,20,10', '58', 'F,D,C,C+,B-,B,B+,A-,A,A+', '0-39,40-44,45-49,50-54,55-59,60-64,65-69,70-74,75-79,80-100', 'B-', 2.75, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rms_course_marks_tests`
--

DROP TABLE IF EXISTS `rms_course_marks_tests`;
CREATE TABLE IF NOT EXISTS `rms_course_marks_tests` (
  `ID` varchar(40) NOT NULL,
  `CourseID` varchar(40) NOT NULL,
  `TeacherID` varchar(40) NOT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `StudentID` varchar(40) NOT NULL,
  `MarksValue` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_course_marks_tests`
--

INSERT INTO `rms_course_marks_tests` (`ID`, `CourseID`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `StudentID`, `MarksValue`) VALUES
('{2008BCA1-57CD-4F6F-8C7F-BAAEA680C27D}', '{7DFAB7F9-0C4F-4098-9140-0D89ABDD0A3D}', 'avi@gmail.com', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160212', '10,10,10'),
('{F747C284-82BC-4563-969A-2CF6523F2C7D}', '{1CD0842E-9FCF-4F58-BB6B-FB7E7B73E664}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '160210', '13,X,X,X,X,X,X');

-- --------------------------------------------------------

--
-- Table structure for table `rms_grade_setup`
--

DROP TABLE IF EXISTS `rms_grade_setup`;
CREATE TABLE IF NOT EXISTS `rms_grade_setup` (
  `ID` varchar(40) NOT NULL,
  `Grades` varchar(200) NOT NULL,
  `Ranges` varchar(300) NOT NULL,
  `Cgpa` varchar(300) NOT NULL,
  `IsRetake` tinyint(1) DEFAULT '0',
  `IsDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_grade_setup`
--

INSERT INTO `rms_grade_setup` (`ID`, `Grades`, `Ranges`, `Cgpa`, `IsRetake`, `IsDefault`) VALUES
('{77E5B72E-93A8-4F4C-8FEC-0D6EBE396CDD}', 'F,D,D,C,C+,B-,B,B+,A-,A', '0-39,40-44,45-49,50-54,55-59,60-64,65-69,70-74,75-79,80-100', '0.00,2.00,2.00,2.25,2.50,2.75,3.00,3.25,3.50,3.75', 1, 0),
('{FC3DBA75-AF9C-4533-825E-D8A01D076F60}', 'F,E,D,C,C+,B,B+,A-,A,A+', '0-39,40-44,45-49,50-54,55-59,60-64,65-69,70-74,75-79,80-100', '0.00,2.00,2.25,2.50,2.75,3.00,3.25,3.50,3.75,4.00', 0, 0),
('{FF75A9CD-E512-439C-AED2-9B176C8E68F1}', 'F,D,C,C+,B-,B,B+,A-,A,A+', '0-39,40-44,45-49,50-54,55-59,60-64,65-69,70-74,75-79,80-100', '0.00,2.00,2.25,2.50,2.75,3.00,3.25,3.50,3.75,4.00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rms_marks_setup`
--

DROP TABLE IF EXISTS `rms_marks_setup`;
CREATE TABLE IF NOT EXISTS `rms_marks_setup` (
  `ID` varchar(40) NOT NULL,
  `CourseTypeID` varchar(40) NOT NULL,
  `HeaderID` varchar(200) NOT NULL,
  `HeaderName` varchar(200) NOT NULL,
  `HeaderMax` varchar(200) NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_marks_setup`
--

INSERT INTO `rms_marks_setup` (`ID`, `CourseTypeID`, `HeaderID`, `HeaderName`, `HeaderMax`, `IsDefault`) VALUES
('{236BBFE8-E4CF-4EEF-9C54-AD83FEF42ADB}', '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', 'att,assess,viva', 'Attendance,Assessment,Viva', '10,60,30', 1),
('{7E24DC07-CD2C-4360-A6E9-05A363C2EA08}', '{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', 'att,assess,seca,secb', 'Attendance,Assessment,Section A,Section B', '10,30,30,30,30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rsm_management`
--

DROP TABLE IF EXISTS `rsm_management`;
CREATE TABLE IF NOT EXISTS `rsm_management` (
  `sl` int(11) NOT NULL AUTO_INCREMENT,
  `ownerEmail` varchar(50) NOT NULL,
  `flatno` varchar(10) NOT NULL,
  `renterEmail` varchar(50) NOT NULL,
  `date1` date NOT NULL,
  `month` varchar(40) DEFAULT NULL,
  `house` varchar(40) DEFAULT NULL,
  `payment` int(11) NOT NULL,
  `statas` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sl`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rsm_management`
--

INSERT INTO `rsm_management` (`sl`, `ownerEmail`, `flatno`, `renterEmail`, `date1`, `month`, `house`, `payment`, `statas`) VALUES
(4, 'asif@gmail.com', '3a', 'sujana@gmail.com', '2019-10-15', NULL, NULL, 11000, NULL),
(8, 'akash@gmail.com', '1a', 'danny@gmail.com', '2019-12-24', 'december', 'akash housing', 50000, 'approved'),
(9, 'akash@gmail.com', '1a', 'danny@gmail.com', '2019-12-24', 'december', 'akash housing', 50000, 'approved'),
(11, 'akash@gmail.com', '1b', 'danny@gmail.com', '2019-12-02', 'june', 'akash housing', 50000, 'approved'),
(12, 'akash@gmail.com', '1b', 'danny@gmail.com', '2019-12-02', 'august', 'akash housing', 50000, 'approved'),
(13, 'akash@gmail.com', '1b', 'danny@gmail.com', '2019-12-02', 'september', 'akash housing', 50000, 'approved'),
(14, 'akash@gmail.com', '1b', 'danny@gmail.com', '2019-12-02', 'november', 'akash housing', 50000, 'approved'),
(15, 'akash@gmail.com', '1b', 'danny@gmail.com', '2019-12-02', 'june', 'akash housing', 50000, 'approved'),
(16, 'akash@gmail.com', '1b', 'danny@gmail.com', '2019-12-02', 'august', 'akash housing', 50000, 'approved'),
(17, 'akash@gmail.com', '1b', 'danny@gmail.com', '2019-12-02', 'september', 'akash housing', 50000, 'approved'),
(18, 'akash@gmail.com', '1b', 'danny@gmail.com', '2019-12-02', 'november', 'akash housing', 50000, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `rsm_rent`
--

DROP TABLE IF EXISTS `rsm_rent`;
CREATE TABLE IF NOT EXISTS `rsm_rent` (
  `ownerID` varchar(50) NOT NULL,
  `adtype` varchar(6) NOT NULL,
  `flatno` varchar(10) NOT NULL,
  `flatsize` int(10) NOT NULL,
  `rooms` int(4) NOT NULL,
  `washrooms` int(4) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `price` int(14) NOT NULL,
  `flatimage` mediumblob NOT NULL,
  `flatinfo` varchar(1000) NOT NULL,
  `phoneno` varchar(11) NOT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`flatno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rsm_rent`
--

INSERT INTO `rsm_rent` (`ownerID`, `adtype`, `flatno`, `flatsize`, `rooms`, `washrooms`, `address`, `price`, `flatimage`, `flatinfo`, `phoneno`, `Status`) VALUES
('akash@gmail.com', 'rent', '1a', 1200, 4, 2, 'daspara,boyra,khulna', 12000, 0xffd8ffe000104a46494600010100000100010000ffdb00840009060712121215101212101515151015151515151515151515101515161615121515181d2820181a251b151521312125292b2e2e2e171f3338332d37282d2e2b010a0a0a0e0d0e1b10101b2d251f252d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2dffc000110801c402a603012200021101031101ffc4001b00000105010100000000000000000000000300010204050607ffc40047100002010204030505050505080301000301020003110412213105415106226171811391a1b1c132425272d114236292f007335382e11516244373a2b2c26383f1d2345417ffc4001b01000301010101010000000000000000000001020304050607ffc400351100020201030203060407010003000000000102110304213112411322510532617181d191a1b1f0141523334252c1e10682f1ffda000c03010002110311003f00f40e25d9116269b7a19c663b08c8c5586c6de13d6788d4b2fbcfb85e713535de72c357386670e524bf1669d1d4ace48198dda246aad468a8394d405cdb40abad8ceeaae0d0eea2557c0a794f463a98cb6664f134ec960aca800d8012f2b842589034f85a677ecf6d8910aa2dd0ceaf1e2d6c73bc52b33785a9a956ae2dc105db253045ad450e9ef373344ebbc7249de4b2ce696e74476d9146a0ca6dcb949a9965e983a1102f8623ecebe139ba9c59aa8a63ac2880468743358cd321c682289202308451344662b49011c09202301808e0496592020035a3a88e04908806024808e047b44035a3110804622265221147b45699b65a1c4908c049811a6263811ed1c08ad010d692023811ed01d8d68f68f68a2687686b456928f268085a2b49da2b44c01c52568d68876346b495a2b40646349456898c8da3da3811490b224489926306ed1d0591730c70f945cee79784960e8fdf6d86c3a993a86e6e6679255b171456f65e308a00dcc931b48d3a458c230eadd8395704ce27928de1a860efde7d4f4e421a861c2f9f5870268a29704b638115e385920b289b2224808f1ed001011e28e0402c40471108f0015a2023811c402c66d8f919e1a67ba30d0f94f0ead4cab15604104820f220ea2698cf9ff6e7f87d7fe108a29d760b19c3c70f64755f6f95bee9ce6afdc60df876e7356cf170e2591bb6952bdce4628eb6b8bed7d7cb9ceb7b5b8bc03d0a4b8655150117caa5484b6a1cf337b42c31e2528ca5d49576f5f91c8c52ff0003e1ff00b457a743365cec466b5ed604ede93a31d93c235434131dfbdcc5429a76ef8e57bf8456562d2e4c8baa35cd7296ff00538d8a6a9e0d96a57a556ad3a6d4549b37fcc23655f316f7c7e21c2052c2e1f1398935b3dd6d60a14d86bce164f813a6eb8fbd7ea64c51451988a28a2800a28a2800a28ad14005145140051451400f6eed0d4b5323ae9ef3fe939679bdda5a9f657c49f76939f733c18bbc9397abfd363f458af283682658568369dd0258322448848c44e983326886592511ed1013a119b11124047024d44c271699ac5827a00efef806a457c44be047cb32af42ca54da1d0c93e1c1db4304415dfdf2d646b921c2f80e24c41234289d1192664d512024ad12c9012806b4901240470202220495a3811ed100c044449da2b44c681111ad085646d32922d31093118092b41031c092023092b46215a3811ed1ed100d68ad1ed1ed18118f1ed15a003451e35a450c6b46b494510c8c69231ad1500d1ad1ed14063489324c60b78d441b198c951a3736f8f4124a92c65b0b75dff48e5515f105b91a8f7d06c36fd644e908b4e58a3440d4ea7e5e53050b76cd1ca8af4b065b56d3c25c4a606d26229b5195880928a28c07114788440211e2884403811c08808f00108a28e20033381a9906c428d4dc7a49b203bc4698360750360621ec49581171381fed230549592a820556d197f128fbe7a1e5e33bfd87a4f16e2bc41ebd56aae75276e4aa3651e13482dcf23daf9631c5d0d5b7c7c2bb87ecee052be229d1a8c555d88245af7b136179e803fb39c2ff00895ff997ff00e6798e1abb23ad45366560c0ff0010371f29ecbd9aed152c5a02081500efd327507991d57c65cace0f66474f92e1912bed6647ff00f38c2ff8988fe65fff00988ff67385ff0012bff32fff00cceca72ddb2ed4261e9b52460d5981000d7203f79ba780929b3d3cda6d2628394a2a8e1bb29482f12a68a6e16b54507a80ae019d0d1c5f0f1c408f635856f6ec339374f6a4917cb7daf38ae0bc40e1eba57cb98a126c4daf75237f59d0ff00be74c39aab80c38a97273937398fdefb32da3c7d367c718536979af757b6dc1a383c2b7b7e262b6477148366cba6aa4a900eddd2bee96b857064c4e0f03ed08ca9ed0e4bd8d462c72a0f71bce4b07da6a8ad897750ed894cac6f972ee0103c8fc206bf1e73470f455721c3b332b86d4b137bdada5a2a65c755852df7e76ffec9afc8e97b338c6afc42a7b5a6aa1285455a5945a9852a32dbaefac1700e2271f89a746b53a229d2cf515116c0e516553d40bccfa7dadb624e2c5050ed44d37b358331cbdfdb4365989c27893e1eaad6a76cca4e87620eea7c23a21eaa31715d56ba9b7b72b6afff000ecf03c4bf6f4c5d1ad4e905a7499e9955b142b7b0bfa7ce453862e3570159540008a55c28b0b5319b5e97b1fe613231ddadcd4ea53a387a544d5bfb575d59af7bf216bdcfbe5eeccf10fd93055aa1ab4af501f654c35dc54b152c472e47d22a36866c73928c9f52a76f8e1dae7f0fa999c4aa2e2f8884d0533885a42c00fdd860ba79ea7d66a768bb46d42ad4c253a18714907b30ac97fbbf6be3398a3c402520829a7b41585415bef8b6cbe57d66d627b5cb50135307866aa5329a86e6e2d6be5b7d63a39a19954bcd526eeebe7b7ef62f2637f60c0e1ead14a66a572cceeeb9b41f747f5c8cd7a583a478861aa8a6abedb08d5196c2c1edbdbaebf09c9f0ced384a230f5b0f4aba23164cc6c54ef6d8dc6b269daea9fb58c5b53539699a6b4c12aaa8795fd62a66f0d4e24a36f6f2ed5c572fea745c238b8c42e292a50c394c3a97a6a16c2ea5ac0ff2894388633f6be18f88a94e98a94ab2aa945cbdd2545bdcdf0981c2b8e9a3fb40c81bf6842a75b65b96d469afda90a1c68ae11f0792e1ea07cf7d458a9b5adfc3d79c2887ab528549f6927b77ff00132a28a2967947aaf1dab7aa474007d7eb32c984c657ccecdd589f4e52bde7cfe2d91fa456c39320d1ef06c676e3666d0f18c8de3de75c59932423c612404e8899b1c49ac88124b34448402480892194489624f829646b9060459618d1e92369cf2835c9aa927c155b0df874f0e522ac46845a5db44d4c1de674d7056cf902ad0a201a811b6be11254eb368e5f533943d0b2248482b420336bb3315a3c711ed001011ed1478988811224425a44899b2d11124246f26b20a2424808c24c4b448808ad1c478e806b4568f68ad001a2b47b468806b451e2800d145149686344445118a808c8b18ec6305e665a889b2016f08164808e165d50b91e98e7ee9284a742da986026128db3452a43524b42469202550ac51c468e22a01e388d250014711a4a00318e04424a26028a28f100d1c45108500f145142804db1f233c35beb3dc4cc37ecbe086a68a8ff00337eb2e32a3ccf68e8a7a9e9e96b6be7e8794c95372a6ea4823620d88f59e9bfec0c09fb34737e52e47bef6118765a81db0e8a3f89d89f703f595e223cdfe4b9bfd97e7f63806e378a2329c457b74f68dfaca04f39ea54fb1d85bdd92fe00903dd7bfc61bfdd3c1ff823f99bf5875a2a5ec8d44b992fc5fd8f278a7ac7fba783ff00047f337eb1bfdd3c1ff823f99bf5878889fe4b9bfd97e7f63ca22b4f553d94c1ff00823f99bf58dfeeae0ffc11fccdfac7e2217f25cdfecbf3fb1e5714f516ecb613fc11fccdfac1b766309fe10fe66fd61d683f92e6ff0065f9fd8f328ad3d21bb3585ff087bdbf5823d9dc37f843dedfac7d687fc9737fb2fcfec79e453d0876770dfe18f7b7eb36385f64306c999a883ae9ab6c3d61d42fe4d9bd57e7f63c96d14f5fafd90c10b01407f337eb193b1f82bff723f99bf58bad07f25cdfecbf3fb1e4314f65ff0073303fe00fe67fd60697643044ff00703f99bf5875a0fe4b9bfd97e7f63c8229eb589ec96081d288fe66fd6287888afe499bfd97e7f639b15818e1e6a8e02a45d5c8f3d60aa702aa36b3791fd67cc62d5636b63ec5aa2816837786ad8574fb4ac3d252ac67a18b226f666735b040d259a550d08af3d08b30658569670b94b00da02753d0759455a151a74c4c99bf8ce168a86a25546005ed7d7d26529835a9260cd22487487512bd332caca243242640778348658d8204d873cb583b4bcb1ca03b898cb127c171c95c942d2152883bcb9530a46dafce02d39e506b9368c93e0a6d4d97c44925596ad0752803aec7ac94dc781b498ead260ca8415df6eb0a8f358e44ccdc28b48b736109fb3374bf94ae8d3a2e1aa0f7fc3e3ce6b6a8cf7b39daed93ed696947fda2874066ff001ac307b9b781fa4e65785516398a0bf5d8fbc4e4d44a50aa36c552e4d0a06f2c0590c0e0820d09d76b9bda5d0936c71b8a6c994927b15f2c710f9631497d24d8311e3e58d68b71928a46f1c42c0515a3c51011cb1a4e3110021147222801132264b7920b2d449b20ab25692021a9d1eb1f000a9d226595a604947b486343011e2b45150c423c5144028e228f0285251a388a80711e34711500e24a463de003c504d5d4731e4353ee11bda31d94fae9feb000d1af05918ee40f21f53074b04a402d998dbef1247bb6f844326d8c4daf73d17bc7dc237b573f652de2c401ee1732ca53034000f2d24a022a7b073f69ede082df137925c0a6e4663d58e6f9cb368ad10110b1c0928f68011b45692b4568011b46224ed1888010b48910968c4400aec20d84b2eb04c23432abac03096dc4aeeb188822ce930699514787c4eb3070a97603a913a331b13e4ad50dda4e90d64009571dc4d69f746adf2896e3669995289d7d61708494527722e7d656a4dafac4c488e34f7a291c69ef4513345c1cee0b17a0f77ba6952c5ce730cd6bf9cbc9527c94b034f63baecdb3890779c27f68b887a7ecde890ba90da0b1d88b8f7ce98559caf6f45e886fc2e3dc6e26fa18b5a9837c5feaa8e6d52ac4e8e76871da99955954861b8d35e92d2768296cd997cc5c7bc4e6d6a7d93d0ca9c4b56b78fd27d7bc513c8866c974d9dfe1b88d27fb3510f803acb8b52797d26cacbf987ce1713c42b53a8deceab8198d85ee3dc652c7e86cb35ba68f524a90aaf3cd709dadaeba3047f4ca7de3f49b983ed8d33f6d1d7c45987eb2ba248aea476b49a5c59cf6038c51a9972b8ef6c0dc13e866f234ce59129532d46d59692196090432882ca83a09ac22c8812604b5325a26b19e986dc7eb109311ecc453a985236d7e705344c155a77dc4c65893e0d2391f7291594aae1edf64dbc394d36a246dacacf39a78df7368c8a8b9c743eb377806388bd361beabe7cc4cb510b4f4208dc451b4f9d8249346d684ebb19cfe22894a856f6037bfcc4de53717f094f8928367b6a343e226fa987546d7631c4ea54c053c408415440fb053c846fd98788f599acb25d8d1e389683c57957d81e4d1b2b8e60c6b3faa1785e8cb71659543b8e51ff683cc194b3c43c3658cb114821891242b08fc48b25c5a2568ad17b4115e3d85b8d68a393205a52416226305bc92a426597544dd90cb24a97845a70a044320a9693023c51500a2b478a201ad1e28a0315a3495a2b45431808f15e08e217977bf28bfca200c238800ce76503c58fd07eb25ec09fb4e7c87747ebf180137a806e40f39115eff006431f4b0f7993a74146c079ee7de616218101cfe15f2d4fe91ff00671f78b3799d3dc34868f246456981b003cb492b452568980d68d48683c84946a7b0f21100f1e211e301ad1e3c5688051451e0034568f1ed00231495a2b4008da31124446220009842fecc00bb1906907279c00aae20584b4c201c4a00dc329f7c780266bd53a4a3c2d6c19bd3eb28718e2bf717ff00d8d2b10fc578ae5ee21d799fd26361417700ea5881ef956a3cd2eced3cd581e4a09f5d87ce6b49225b3aeb5879099749b5f5facd3a9b1f299348ebebf59cf22e24f1c7bd148e37ed478148e2d4eb2dd2329896694f19c4eb4cb20cc5ed5d2cd86a9e097f76b360194f8ad3cd4dd7aa30f7822425d3252f46bf52722ea835f03c9036e3c60b881ef08e4d8c8e3fee9f29f5a91e17740d8ea3f30f9c2635740dd4b1ff00b8c0563f396f102f450f9ffe465450dba6994298d61298b8f53f38a90d64e88d3faeb29229c8dae16ffbca03a32ffe579ebf56ae6005f51b74274d0f8693c77820cd88a43ff957e1afd27a8e2ea950ac07df5f713acf07dad85bcf09c5f099e86969e269fafd8eae950a6d6d2d717d0f3f28ff00ecefc2c3d651a58bd45bfae52e52c4f8f39e3ad5e4849a9766743c76ad09b06e395fca08adb43a4d1189da13da8d277c35cbd4c9c3d51956920268bd243cbdd20d831c8ceb86b533370452920218e11874306c846ea675c7511910f188011aa61d1b711ae7a49027c26dd49914d10ff65d3b69987ac19e1a3931f74b99b4df5f848dbc4fbe4f4447d52f53271958d33ecd4b123536161af899428e36b13664baf81bfc2746d8643b8f8caf5302bc8098cb1646f6952f43453877451c355fba77e436bcb590f4313608f9f87ffbb4277b9ab7ce11c4ebcc3735d81da2b49339e87d4481a87a08fc1f462f107cb16491f6dd57e324b5478c4f0c87e2219a90e820ce1c7496748f9243c2fd0a5917a945b0dd09f7c1b5361b34d12920d4a43c74575599356ad41d0cb784048b9de3e268e92d50a56026b853be489b5420b0aa969251253a0c48c404945018d68888f22ee06e40800f1ed05ed6fb027e03e311573cc2f90cc7e368980581a98951a5c5fa0d4fb845fb303f68b3799d3dc3485ca00b0000b8db4886901f6ce7eca1f362147d4fc237b2a87770be0abffb37e92cc4221815c22f319bf312df3da1c08a2022024228a280128a28a218e23c51c49188478a3888042353d879478d4f61e510128f1a388008478a2800a388ad1e0028a28a0028a28a0029132518c008190610a0758aa3df68c0ab504aec259aa6db903ce53ab8da2bf6aa2fa6bf2858f901c431cc8a10680dccc477265de27c5283808a58b66d0dac3c44ce33783d896a8726741d97a76567ea40f41bfce73b3ade0f4f2d241d45cf99d62c8f6252dcd6ac7bbe932d477bd65fc69ee4cd15906b984e79334885c60ef45058bc42dee228e8671aa7696e9095576f596e8cf32b63a42881c56d0f03891a199ce3b01e398e5cb5197a5461ee2647122e13d25fed2d1cb89a83ad4bfa3007ea653ac3babe0f3ea30bea827f047832f2ba29d7972a1fdc53f5f9981c6ada58cbfb843e27e666c96e272f2af995290d64e86dfd758d4c6b2543ecff005d634b71b66cf64fff00f2e8ff00d4ff00d4cf50c5a587a19e6fd8ba77c5d3f363ff00619e9f88a64a39e897f8cf3f5787af22f91dd866a3888d062025f7b196a957f9c86047b44cc395afe64030ab40f49e6e5d0f53ba3a219d2d8b2311b43fed1b4a6689922a6714fd9ed366cb3265d388df5855c4e8265d42758ecc6c3ca73bd24d4b62baa2cdafda6156bcc46a86d08b5cdc4be9cb064f4459aed94ee048be1d7912267bd6865afafa4a8e7c91da8978fe21bf663c889034d872324b88d64d311a99d30d6c96cc878fe0063cb7ed01ded17b2533ae1ab52ee66e08a9224cb6d86e8602a61d878cdd6a12e49f0c1de0dcc93a91b832bd569b432c6444a0d0e6d1ac3a401a917b59bd11b870821160e962ac0ae9ac75690dd0e8308f22b08b489d84ca5962b965a8306c244985ab488de55aec46d69cff00c6e2eae95bbf81a2c526ac289294b0b5d98dad6d4f8ed2e7b21cf5f3d67463c919c7a91128b4e99135472d7cb58aedd00f33f41fac2c52c5407d913bb13e5a0f86bf1934a406c079c9c513015a28a23100d19fea3e72519fea3e701a108f108a218a3c68e2201e28a3880d0f1c46b4901258c51c4568f100a3c5144021120d047119761100f1c4568f0014423c154c522eeebef80068a51a9c5a90e64f9095ea71d5fba84f998ac74cd68ad39fa9c72a1d828f8cab5389d53f7cfa690b2ba19d5edbc0d4c6535ddd7df3917aac776260898ac7e19d455e35487327c84a957b423eea1f5339f2f20d521d452c68d7abc7aa9d828f4bfce51afc52a9dea37a69f2941eac03d58ba87d083d6ae4ee49952a55837a92bbbc5d4550f52beb7f19b745c32861cc0339aaad35b80d7ba943c8dc791ff59ae2924e8cb2adacd5a697217a903df3afa5a58794e6785a5ea03d359d1523a89a4cc51771e7b9383c7d7b0369dbf136b533e47e53cf3166fef8a2acb5b23a307babf947ca28c3ecafe51f28d00308197294a2db4bd40e93ce94763a130e242aed08241c4c9a28f33eddd0b570df8a98f7a923f498d88fb3eb79d576fe8e94dba332fbc5c7ca72757ec0f213ded03bc11fdf0789a9db2bf992e249a03e03e50aa3fe1c7831f9c8e285e92b787ca3d03fb81f99be40ced5c9cf7e5fa95506a64e97d9b78fd6301bf9884a63e7ff00b4aa1d9d1f61d7fe297c15cfc2d3d271556c8c07decabefbcf3aec28ff008a1ff4dfe93d1f1147323f55b30f317d272e65fd4fa1d78dff00497efb9678261f2532a77056fe769ac89b4c4e078bcd4998ee0a66f88bcdaa753699b45261929037b8e50630e3a7387a550598f41ac545c1f7cc8b02fc381d8ef02705f0369ae9ca096df199eddd156cccfd88f3120f86226d32ed2253489c62f943ea68c5f604c45089b694c7481a98604ccde1832d64919c88645d8de6a52a232995df0d717912d2c194b332aa56d079c32e22d07570c41b41d4a444e59689a5b1a2ca9f25d5c44854c558ca563075af7f49cf2d34eaaca4e06a2e2e66f13c40e96ee13a7869efb91166b7b84cce26e495f12e3cad6607e134c18723ca937b1195c541b47109db3ac8e52a22359c8d2ea7436f2e53428f6d691fb6190fa37ca729da45b629cf57bfbecdf599eee6de4c47a4fa6f0d51e5ac8fd4f4fe1bda1a559b2d36cc6c09d0e9736d674983208bb5e797f6190fb5a83a05f999e8f876d3ddf39f35ed4fe2565e9c72a47ada75078edadcdea2546c24ea5799b4eac9bb5e638f16592a6c6d450f8aa84da05a4981d0c6cb3bf169d42266f26f40387a77bd4cd165b68653c3a59bd4cb6676618f4c68ca6edd8d1478a6a48d1478808980d1478c22043c8bedea3e72522fb4450f14568f6880568f147580080921189104d8a41bb2fbeff289b1a0e24a507e26836b9f4836e2dd17de7f49168aa66a45698edc46a1db28f4817c4b9dd9be5f28ba83a59bc481b903ce05f174c6ec3e7f2982c6fbeb1a2b2ba4d97e294c6d98fa7eb0278c0e4a7d4cca3224c563e9468d4e32fc9547c6567e2354fdf23cb495498d78ac29127a8c77663e660cc44c893159687bc626130b88086e555b4d8dede7058aae19af95574d945847b502e462d225a0cbc83549365052d06cd04d560daac430acf04cf04d5bc47c205f103a8800676816302d8b1e3ee95ea633c0c02cb0e605a566c59e83e304d8a6f0f740458710dc35ca540791d0f91998d5dba9f9485cf327df2e2d264cadaa3d33832fda6f21f59b140ea263767c9f614c9dd96e7d7ffc9af863ace867320dc69ad45bf2fce709545d80f19daf1e6fdc9f4f9ce430e97aaa3f887cc42053e0dcc469a45238d3afac500301b69730db4a96d25bc3ed3867c1d08b424489258cd3168b391edcd3bd027f0ba9fa7d670805e9f95fdd3d27b574b351a83ff8d8fb85fe93cda8fd861e3f49ee683fb0bebfa9e26b3fbafe84af7a23c18892c29bd123ff0093e91b082f4dc78dfe022c20ee38e8c0fce76c4e67dc81ff00d87ca113ff006ffda0efa81e30abff00bfd6682ec753d825be27ff00adbe6b3d15cfeeea9e8a3e3713cf7fb3e1ff00127fe937c5967a40a5992a8eaa35f7ce4cbfdc3b21b625f5fd41f06c2e5a6f4fa14bf893a9f9cd84a3b7c262f662b16a6d7dc585fadb69d0d1d84ca6da2d0a8d2396a0eba48d0a676b7396a9fde8a97d663d5c9a7a04a7b0f294e8ec3cfeb2fda4028b484ca68763b48254b8bc2b2ed22298b5a4ec3a62a6d788b0cd68912c64590e6063dac3b135da440d249069eb2206862019d606b5310ac4e9e507897b09689643d80806a02e25b47fa4167178e82ca9ec264716a0472d981f316ef0f709d0023e332b8fd4b7a1d0f42d75bfb8995082ea232c9f4b3cafb774c0c4961b364616e847fa4c5c9727c759d37f687860a52db0a617f94b6bff0074e770e351e207c6ff00a4f471af2aa38a6e9bb36fb1ce457a96fc0bf39e8f4134f74f37ec57f7eff947fe53d4292fd3e538353854a7677e1cad4120b493e72d25291a625aa7bccd638c4a736c09a5ac6ac96862da983c436bfd748df00b90257bc3fae52c1482abf687a7ca141898d3d88948d964ef226b01b9115b1ec35a34638a5ebee102f8c1c818ba828347b4a4d8b3e0205f12dd7e9175a1a8b34e0aad5503ed2fbc4ca7727727df0464f885f49acf8f41cc9f2100dc4c7253eb33d811b8b419690f214a0688e20c7f08f4bfce109623ed37bedf299945b59a66aa8138b3ea5c7b9a4608a15bc49f9c15e4b10e0981f6825e3cb68a710a24d65635e30ade335eb44f49a8942e99eebe448bfba56bc7526d22587323df2ac81462640d65ebf0320d885e87e126c741098366837afd00f7c1b563d07ba0d949042f18bcaed50f5f948dbc4c5d43a0e6a8f0836c40ea20bd9c629e106c626c48f1f741b623a03245446517e926d8c0b566e9206a34b0cb20562b632b927a983653d4cb2cbe120d0b02a9a522c92c3083643d23b02bb2c1309618413c6988aec20c8856836063b02064a9d32c428dc900799368c44d1ece50cf884e8a731ff2ebf3b4a8eec89ecacefe8530aaaa365503dc2d2de1b795434b1863aceb7c1cc86ed037eec0ead39fe1a97acbe173f09b5da06d14789333383afef09e8a625c14f80f8f3ac521c40f7a3c7633246c443d0fac00e62170ed38a4b6358f25b531cc8ac79851a197c629dc5badc7bc113caa8ad9990f236f769f49eb5c5bec83e22798716a593135075624791ef7d67b7a0fecfd59e46b97f56fe055c0eeebd449e0c6953d3eb218636a96ea0fce5ac3a779c7f083f19dd1470c8a67edac3d2173fe7fac83afef00f01f332785dffce7eb2c57b1d8ff006729fbea87a5351ef6ff0049df39fdd56fc9f5338afeced3fbc6fc4c07f2ff00fb3bb6b7b37079ad8ff34e49db9bfa1deb6c6be44782a801946c02dbc6ea093ef266e50d87ace6fb2cc7d91bfa7e5d6d3752b9b2dbf0b1f9da65913b1c4bebf7bfae51a973f382c256ccac4fafba0b0f8925edcb35bfd661d2f734be0d1e522220fbf8411ac2e0795fd7690932db2c451830313301bc92878a28a003c631e280c8b083ac808d61233468868825312bb52d7faeb2d53fa41f3f49498bb14fd89d3ce50e3600537db98ea2c76f5b4d86dbd66671cc3e61bdae72dfa1dc1f2b89b637e6dccf27bacf3cede513ec2996fb4058fc08f84e4b0aba8f21f31faced7b6af9f0aafccd400f985379c661790f3f858cf4b0ad8e0caf7dbf7b1b5d871ff14c3f80fc184f5151f213cbbb0fff00f967f23ffe53d4a989cd9e3e63af0cbca1e90da5ca49ac05112e5313926e8d90114b531b134edfd7843a8d4c862c7f5e926f728a98ad0fa7d250a98aa9e1e93431835f4fa4ce6132cd26aa8d7124f900f896e77f7c81c442b2413539c72cb3f53a142237ed1226bc8b53817a73279d94a083fb691356562a7ac131224ff103f0cb156b417ed3699dc431ab4c02e42826c09eb331fb43407dfbf9027e921ea4a58ce9ab6359b5249f382359a735fef3d21b2b9f403eb0d47b582fa51bf9b7e827366d6cd70acb588e970a49617eb3a74c225af61b4e4b86768dea10b4e952cc741a5cdfd4cea13156fefb1280fe15ca00f0b8138b1ca5a89372bf96d4beada16583823178861dc9eea9f412854a4e370479e936b8d9ca3fbd7b11717244f3fe2f52e4dd89f59c9a6d464c5278ededebff008dfea742875c7a8d6c463d57ed5441e6c266e238ed2ff101f2b99ccd60204a7819eac7512adccde347a9d24ba8f21f292f672786a5dc5fcabf2109ec8cf59707295cd388d3967d99eb199257602b324194965841342c607246cb085bc240bc940472c6cb1cd4f291350c36189924720917a87ac1e78b60086d22cd2058c8b3c06397836790630152a81b9023dc0317832f2a1c6d31ff00313f984b05a0ed02645da058c21304c64f50036304c615841112930064ce8bb1947bd52a740147aea7e4273c44ecfb2d472d007f1316f4d00f94df0ab918e5e0d99670e655bcb140cea68c0abc71b55f280e06bab9f011f8cb77bd049f051dc63d5a496fb15f1e7bd1407127d7d628e80a83ed4250de408ef49d2de72496c6b12dac791125306688a5c547eec9f11f39e79db2a396b254fc54edeab71f2b4f47e243f74de5389ed8d0cd87471f71c7b88ff49eb681ff0049fcff00e1e66ba372b3946d1d0ff5a89a343fbd3e29f599d5fec2b78acbd44f7d4f553f29e9c393cb971f891c427ef0797d60709bff0098fd65aadf6bd0caf861a0f33f29ac91117b1e8dd83c3da886fc458fc6df49d6e4bad5fc82def339fec8d22b41072cabef2331f9ce9a810438f017f2cd3cfdedb7ea7ab3da292f403c0e98c8e46c48cb6db2e4169ad4a85d57a80c3df7995d98a645120f5f768481ee337286cbe466595eec5143e1b0f9558786fe90387c377b3788f7cbabcffae5214bea263d4f734ae09b29b1958d037b8f0974c692a4d14d6e0d575bf846c48da1e3c9bdcaad805226e7a5842de3da2b41b1d0f1a3c510c85f4830fa7a435a0fd9e91aa21a6416afd2085619bd2152903ee103ec35f49a2a16e49d85ade33378e9269365dcedd493c878daf2fd6a06f799fc5815a4cdf8487f55d47ca698ead1965f759c676c32b61972fd92c2de1dc7d3cef382a5ba1ead6f78ff0049e85da7c364c35317be675727f89d589b784f3d6d003f86a0f9913d4c1eefd4e0cbef6fe86ff6207fc59fcaff0039ea69fa4f31ec42ff00c59fc953e627a6d31afba61a8f78e9d3fb85ca1ca5ba6759570eba4b689acf3e6752121d4c1635ac216926a64714971217257629e2cfcbe928113471ab6f74cd99e6ec6b8bb9022418429902271491d0809106cb0ec20da61345a65765807596d841389cb3344723db65fdd27fd4ff00d4ce415276ddb64fdd27fd5ffd4ce3d57ca733746b15b1154f285a5fd691803d63e6b6e643dcb357058a2ba8241f0d26b3f6902007d90671b1165f2274d4ce58571e70eb98ec8de8a666a0e32b0938c95336db8d3551773adc9d4ded73b5f9ccdc4d5bc051f68c6c88c4efa01b40e2f16d4d823a904f2d34322187cde5fc2ca73a54c838bf2318a9b5ac6197103a1917c50e866be6f4259ea1865ee2fe45f9093cb1b0c7b8bf917e4216d3e823c1c00ed19a12d0354caa114f88e3e9d15cd51b28bdaf6275e9a0994fda8c30d9d8f9237d650ede31f600f4acbf269c31aa7ace98628b56c894da7b1dfbf6ae872150ff00940f99959fb594f952a87cca89c29ae7a990358f595e0c05d72676cfdade947dee3f495dfb5753953a63cd899c71aa6419e358a1e82727ea75afdabadffc23d09f9995ea769eb1ff009a83c917f49cbe78ccf0e882ec2527ea744dda3ad6b7b63fcab7f7da547e2d50ff00cdabfcc44c5cd094a3a88fea5eab8a277673e6c7f5951f103a7c64aa4ad696896130f88bd441dd1df51e3bcf44cc679e60680f68adcf3afcfa4ef4319c7ac4d346b87b87bc8911031da721b9065826585306c268840c2f2eb3d13094b222a0fbaa07b84e238451cf5a9af2cc09f25d7e93bb9dba75b3673e57bd0f2c61e5696284dd99195c5aa77ccbbc305a9799332b1ed776fcc66be145a92f94cacd64b831789b77a290c7fdb8a696493a8bae9101afac96237f488ef39245c43ac9812292604c68d406356f4dff0021f94e578a53cf85a83a2dfddafeb3b0aebdc61fc27e4672ea99a9baf5461ef13bf46fa60fe68e4d546ff03ceed7a6474fa4b7877d50f80f94ac9bb2fafebf593c3b7713c0dbdda4f611e2f62fe337f4301875bd97f30f7e9f593c59d2fe10dc1a9e6ad4d7f8be19bfd26d26678b7691eb3c3280a688a3fab0025ea084676e472ffe529e0b4083c3eb2ee1ea024aff0010f75ccf35707ab377b85ecf1bd363d5afef5135f0fb2facc7ece8cb488fe323d6c2ff001bcbbc36a9b28bdc6befb1d267915b6117c1a7074beb29e22b90c75d003f28b0d54955f123e932e8756575234cc681c5d42a079dbd2030d5c9fe6b7a7590a2dab2db574684518c806d241a5848a0aa54b0bc777b0bc742b09146062bc431e346cd1b3405624fa41f3f48a9d507d2445417f7cba64593a83433378b1ee0bdb5741aec45fbc0f85af3459c10666717406993f87bc47f06cd6f1b1978d799599e5f759c876869ff00c22b6b97f68fdddf714b50a3e3380af4b4a9e77facf46ed1393837a4da9a35516e39adc653e07c2701587dbf15bfd27b5a65707f3679599d497c8dbec22df167fe99f8959e9d4d759e73d834ff008a3ff4c7baeb3d201d6726af69d7c0edd36f04cb5404b2b2b5032cab4f365c9d711246ac34f58a9b6a63567e51772fb1571ff49953531c6658919b845e2ee319192323392474220d06d0a609a63245a20609a10c834e49a2d1cd76d97f72bff547fe2d38d5a7e73b4eda8fdc2ffd51f269c5a95f09c73e4de1c12f66bfd190a996e2d6dc7ce396581c430b691479dca9707a56129a5c580b1e804b18a7011b51b1e7e1313b3f59886bb5ec45bc2f79cfd1c1d4a3558bab58b13a0bf7492797a4f3b0fb3e39e593cfbc69c556f2dfe7d97cc53cb4e36b67cfc0b9c0aa65662540eed8586a4dfec8eb39fed0b39ae0b2956cc7bbd0585a7455d18d2a6c9b824eba759cc71a661554bea73723e027b4b4b0c591bbb957e55e8613d44f2ceeaa25b4bdbecfca45ff002fc630a86db7c645dcf41396b73a4f58c30ee27e45ff00c4425a0f0bf613fe9aff00e2216d3dd8f070591b40d612c5a06b89a24856729db05bd017d7f78bf233cf715a311e33d0bb6247b1034d6a8f919e778dfb4de667a18d7f49339dbf3812640b462d065a665042623201a4ef26e85c90906324e60498dee344ef0d44caa0cb144c96058a9b4042d43020cdf1a2645cc22f7d3f3afcc4ed967178417ab4ff003afce766b393da1ef25f035d3f0c3a889a32c46711d045a40c9b08269a262373b2b46eecff00856dea4ffa4e9c998dd98a396966e6cc4fa0d07d66c4f4712a823926ee4c787a6657842d607c8cb24c4aa6e7d66e916403f844c14d5879cdeae7bb3083b3799cf62cf7cc690ac7527c629a51341ab72841ca0eaf2844d84c5a1a2d24208348413168d0761a1f23f29cbe1f43eb3aa1395d98f99f9cdf1ba8b329ab923cff0088d3c95d874a8ebe84dc4052fb2474a87e77facd2ed325b1153cd5be00feb3301fef3d0fbc7fa4f671cae29fef83c39c6a4d7a7dcd1c48eefba68f642906c4a03b0049f8ccda87ba3d0cdfec152bd766e88a3de6ff0049be67e5274cbce7a3d3517b0e421f0c9624f53f2b995a8f33e32d618dfe3f29c096c77c987e014c1a42db1a8587ad8cd1c0e1c017f13f5953b3c07b15b6d99ade40dbe934b0db7f9cfd66191eeca82e08d5c303763d3e91a8d216b7422587d8f94150da676e8aadc2d7a41858f590a7440dbafd619a457eb253745b5b932244249c524aa05569dc5a3b25c5a1228ec2865115a3c510c8658b2e96938d1d8a8af4a8d89f1bc614b5f7c32feb189d7df2ad91408d13623accbe308decf4db3267b7e00c335fc26d9da66715af92939deea5479b682fef9a6293ea467952e96733c4a986c0e210fdb566671ccb060c1bc41005a79dd517f5561f0d27a82e1fda52c4b74a66801cec896b9f1379e62a36f03f3044f6348f692f8ffc3cad47317f03a3fecfc5f107c6881ebdd9e88699b89c0ff66e97c41f0a7f2227a211ace4d63acbf43b74bfda4128a7ca594582a50eb3ce933b22429a6a6356a77d611627937b955b1471c26509af8e132049cbc22f177119132522672be4dd11306d0860da6522d026836308f02c673c9168e7fb67fdc0ff00a8bf2338a566e87dd3b4ed83da87ff0062fd671eb54f4f94e0cbc9d10e08e563f74c0e2299b1d2da75967da1e90588624116e5338b765cb83a8e15856c35465cc0ab5356076dae0e876d65bc56369837cebf399b8bed0506a469d9b314b5ec37fe84c3f6cac2d71ee9e869347a6591e594f77dab7afb9c79726592aa3a8a38a4aa722bb29d4dc01b0f31391ed62915d4662daee6d7d874d21d712ab7d4dcf84cce21df65cbaf7ae4fa4e9d5654a4a107e5aefebbfc058716dd72e6f82d2e6f0f7c8bb37849a83d448b03e13c83b4f5bc2ff769ff004d7ff110b7305843fbb4ff00a6bff8884bf8cf723c1c142d606b4313e30158ca0390edea9fd9ff00fb5679e577bebd67a576bdc0a2336d9f9f94f32aa749e843fb69fef939a4fcc04c8349983790f92860d241e0ed22626c023bc1131898d1089acb14655496a8c0a0d54c12c956306a66d06448b9c35bf7f4ff00389dca4e0b8403ede9ebf7e77a8270ebdf9d1be0e186531c98ca0c720ce44cd9a22c60d8c234370fc3e7aa8bfc409f21a99a4537b12dd2b3aec151c94d57a28f7db5863118b2cf592a38c68f5dac87ca4956071addc3264e931c55b450c1addc79cd6c63594f94cce1c3bf2ef136ee1f4986336c9c984e628cc358a5d88b55beb269b48d7fac9e1d6e266f912e0b34e1041ac9899335411672d881663f98fce750b39cc7ad9dbf319517b325f28e3bb594ed5d5b93521ef0587cad3047da23f83e46753db04d293f8b2fbc5fe86730ff006bfcadf2bfd27afa495e2478baa8d6665e63dc1e93aefece698fde31fc400f403f59c713dc1e6b3bdec2d1cb86cdf8998ffdc7f49d5a87e52748bccd9d650da59a8722661b8a6cdf032953b897314c3d9ea3fe57f4271a3aa5c1a1c00de8ad858677ff00c8cd0a1ffb999fc09bf74b7e6335ff0031b99730e753ff0054fca73e4f79971ec59274f480a0e2d6beb054c9b30f0329e16f9afafdaf80b414366272dcda73f3910df3b7ade46bec7d204a9ee1fe317f7ef334b6346f72ec62632c55363e520bec3de2bc8d21a0bc891b79fc23a0b097881884801ac4161235e23188d4180100dafa990f682f1f27fe5f483344df7e72d511b8776b09471590a387fb391afe03acbb512e04cfc5e0bda2bd3bdb3215bfa6f2a15dd933b31783963505bef61ef57a137ee37e62b62679e716c3fb3af513f0d53eebdc7c27a0709c47b3aa0117cee28541d2b20b065eaa44e7bfb40c0e5acb540d1d729e9986df0f94f5b4d2e9cd5ea8f2f347ab15aecc27f66c3fe21fc299f9813bd77173387fecce95eb556e896f791fa4ee6ad1d4ce6d6b5e3bf923ab4b7e120d49b69615b595e926821d5759c123ae23a36a7ce3b191a6ba98ec24f734ec55c5b5c5e63acd7c52596de332164e5e1158bb88c632568d39a46c88182785304f329234401ccaee61aa1956a34c5a2d183db16fdc7ff62fd671cae7c275bdaf3fb8ff00ec5face3d1bc670e65e63a20f60cae7c3dd27ea20c29eb2414f59cccd4453cbdd09493fab48e53626fb5be768f4c18d5aa6086aa9e5ee83cbe524ec6fbc6cbe31b6ef7016be106e4f849e4f1f84838f1f84112cf58c293ecd3f22ffe221403d24309fdda7fd35f9087067b91e11c00ec7a083aa259cd20e2f181c37f6820fb051ffca3e467035321d067b5b7b5fbdcfd27b3710e1e95059d430bdf500ebea265d5e0143fc25fe54fd275c3325149a3278edd9e4c517f10f5b890347a15f7ff00a4f547ecfd0ff0d7f957f4816ecdd0ff000d7f957f48de65e83f09fa9e5e70e7a0f788e9836621428b9eaca07bccf4c3d99c3ff86bfca3f4826ecce1ff00c25fe51178cbd05e13f53ceb13c35e9ae6655b7854463d760652d3a37f5e93d3cf6630e36a607a463d9ba3f87e7fac97955f05784fd4f3345fe17f4fff0025aa2416b00c07f11171ee13be7ecc503f77ff002fd644766680d900f43fac3c541e1b380c4d5506c2e6083ff5a4efaa765a81fba3fee1ff00b40b765287e1ff00cbf596b3242789b397ecf2e6af4f4d0313f033d013ca66f0fece52a75054506ea7ab1e56e67c66efb2f09c9a897892b46b8e3d3c8107c235e1f279c8151e33051346c0b4b7c0ea65ae9e371ef12b1592a0f95d5ba303ee33683a69912569a3b6b4568f78a7a4710d695388fd9f59704a3c48ed32caea2cd312b9221c306b793e2cda0f3f947e1a3495f8cbea07813ef99c1f96cda4bcc504de28f87d6f14da2b63397258afcfd24b04fb8eb1ab8dfca0b0f21aa625c1a00c9080a30c26325b9b2e022cc2e28bdf266e0991c546a60bb89f2731da95be1f37e1aaa7df75ff00da71d546a3d7e4676dda05be16b75097fe520fd2714c6e01bf433d2f67bbc6d7c4f2b5d1ac898766ee2f98f9133d4fb3147261a92db5c809f74f2b099bd9a7e2703e169ec1805b281d05a76677748cf4aa94997d1613881ee9b5bee0f7b7ff00b0497b8b45c48f708ea47bb417ff00b8cc626b236f83530b453f2fc2f2de186a7fea1f948d14caaaa39281f08f863de3f9cfca7249ddb345c8665001f2305855196f6e661ea6c7c8c0618f73d4c95c14f92cb8d2453ebf5926da469edebf593d8a7c858a28a49628a308f002224a414eb27062428c63c89300644efeb18ef199f5b79445b5954430836815de111c1102ae337ac69720fb1cbd3434f1088e2cdfb43b2923bb516a585c1fc43a42f6d707ed28b81ab277c73375dfe179b98ec18ac00b9529503823a83b4e27b55c3ebd5adec92be4a6141b1045c93624b29d6da4edc52eb9a95d3471ce3d1171ab4cb9fd97a7eeeab732e078d809d7d5e7e738aec0609b0d88af41c82c1148617b105b422fadb5f84ebdeb6a7ccc5aa5799c977afd0bd3ed8927d8b54e144ad49f41e70eadace3923a22c92ef1da450ea63b993dcbec57c6ed3144dbc66d31409393dd45e3e599b538ed01bd41bdbd7a4d006621eccd3e6cdf6b37aebfacdc0b61395d9bec3181710c64184865228d7369419e58e32ec8a08476b9b594026613636a7ffebd7f546fa0333716559875f0cd501aa72e5359d6e4b3586736256f6be800f395388602c8ad97296a45c1fb3aaea7bbd3eb6eb278318ba79d4238466cc55d1f2dc35c11a686f695b16d5b20423bbdeb019af724137cdaefacf4238e5e326a6ba7d3ee67d71e8ae9dca98537506fcbac3dbce52c2232ad8a9963daa8176d3d09f909f373c72527b1dea4a8b94d29b2dace4d88b82df68fd9d8d8588f1bc0d206d6cc4db4bc618b0a8543b056b136047f46d78c2bd102cae0f858fcc472849a4a9fe028c95f2448d77921e72b9adaf3840e3a999b8b2ec2127ac1b988b8eb205869adf5eb35c1865966a0bb9339a8ab3d7f083f769b7f76bff888703ca0308ddc4fc8beeb087bcf59707092023e51231c4a1917a6206ad116961a0ea8d23b1229fb212268c310231111400d1913461c88c44405634247d8cb0c246050034a0dd3c2593a4630029b2784132784bc60dedd200530be119a586b419f5936c0ae5e4098732040e915800bc8930f6f09123c22b6075780a99a9a37f08f781686bccee04f7a56e8c47c8cd013d383b8a671c9531c4a1c47703c26bd3c0d422f94dbc74995c42990e41d08b4c752ea06b817982e04693278bd4fde1f0026ce186939cc7bddd8f8cc5caa06f15720f841a450f804d3d229d11952327c8f5fe90140eb0acd700f5101477953e4ce3c17a943895d3787598cb9348f04c1999c4c6a7ca695e67f101def4890d9cfe357352aabd69b8ffb4cf3da0d7453e9ee9e8cdb907c679c0b23544b8b0a8c05b622f6bcedf67ba72470eba36933678152cf5e88e84b7b87eb69eb383fb37e82d3cdbb19872d54b004da981a7f137e827a6504196d9d2fd330f94eccd2f318e18d632c523acad51b3d50bfe5f325831f7012ae3789d2a67266667fc2a3311e734f84e1adfbc39af6d01dc789f12625b206d3674a6430a7bc7f337ca276ee83e03df2af0c625ff9bdfa4e54bcacb4fcc8d0ad5400413c8c061aa0f677f191c421ef69b83eeb4870da47d8e53d624974fe03b6d975ea00b7f012b60f179b4b5b5f87586a94ae96f003e12a6070855b31f48a2a3d2ec6efa91a9791264ad11132352286e2266d6de124a2315d6f18762b7b539ede10ee74064020cd7868db44c78214e0729cd2cda231263712a55a67303e109ecf5846fa446575134468d3b40a52ef5fa196c408de09bdc6d704952d7338eed15419ca11a0a6493f9982fc05ccecface4bb46a335322d9bda5bce9eb981f0b4df4cfce61a85e52ff000dc38f6e2a0d6f44213d546a0dfcfe7346a53173eb327b2ed603f092f97c12fa0f84d9ac7530cb7d743853858f493e70eabac1d2dbd6141d661266888d35d4c7aab24bb98ed26f72fb15b143bb31966d630e9315449cbeea2f1f2c94568f1c09ce6a44ac62212d1ad25a195eaa0256e01d79f918fec17f08f747adbafe6fa184b46a8017eccbd3e26336117f8bde61c4702142dca8b814248e5a6e01f988aa708a47ee53f545fd25952331048e5f5850be3348ba544b322a767e81ff00954bf907d257abd97c35ae69d3b01bf78587be6fda22bca3159ccbf63b0a7fe58f30ed2bbf6230e79541e4e3eab3aec916487445f61f53f538a7ec251e46afbd0fd2577ec027e3a9d7ec83f59df849264d0f91f941638c5da54c7d6df261e1d2ca00e4a00f202182990a00803c87ca13319cc683e58e2443c706340c91122eb79232263b0400d2906a6658223186c32a943d0c8153e32d990260d0ecaac0f8c89265a2d237887653690612e348b98920293341339971ad06c0784632a1790679619441b28934c00832261e961cb1b0ff00f25f4c10a7621598df723e4394f3b57ed1c5a7f2bde5e9f73486372329e9906c411a460b34f8b5204071c8d8f91eb2e767382fb639dae107fdc7a794d3d9fa9fe2b1a956fdc9ca9630bd97e18ee18ea1091a9e679da74f4b06a9b58753bb7be199828cab6161600741ca012c7ed5c1f39ecaf2c7a4e3e5d87b5b506fface47889bd66fcd3a564c877d08b89cbb1bb93d58fccce6cef648df12e59a1c3d75be9a293af94e3ea1bb799f999d5bdc53a846f9081e6741393af5129119d8037d86b6f39cd9f510874c64f936c716ed9b3835d2287e1b44b0b0e978a76a95ad8c5b4999b8217537e44da453711601b46122ad357c2325cb2e2ef2c032aa9da581266b72e2c9de67f127b11e5facbd7997c64ea3f2fd628f2391c9f6b716528542b705885b8e41b7f85e7034dc28b917b9b7a0d7f49dd76bd2f877f0cade81a70605f28feae4ff00a4eed2ecbea7167dd9b5c3ea5423251f6bf8aca5afa699885e42779d9cc0357a67db83ed91b9934d8ad859982ede7ce71bd97a9ecb1b4f43f6d96fd5181b823a6b3d3386571fb4b07b021722f88d0afc27737bb5471d6c9df2cd1e1d804a7b28b9dc8bfccea66ee0d41d26715b19a1813afba652dd596956c6b2ea04afc352c7f98fca1c1d20b876ff00e5face4ff166abde45d71a1f280c2fd8961b9c0613ecfa1f9c85c1a3e431da413949df483a5b8f28bb03e5162318f22c649a12118c40c4d0004bbc28329a5705adce13dbe834defee9728b338b2cc46458e9194c82ec673f2903505fd233dfe065714cdc794d12466d970b80201aad8c9b53b81e502f4c5c79c229049b0ded2f7fca672fc6d2e86a0b66a64900ec45b51ee9bfc42a64a7508e545cfb9499855db3ab20fbc808f59be05dccb26ea8afd9dae43fb317ca155d6fbae7fb87acdcaf54e63303866282d56045b3b0b783a8d699f41a4df2f35c8bcd74678df9792e517eedfc443254d60287d93e621517bd39255b9d098546d48936fa40d35ef930a46fe521f268b82b62ce9e8264acd4c5ae97f0133164e5f75178f9648478c63ce735145146264b600aaee3f37d0c948553b79fd0c9030b02724240193060032a024e8361f58ffb321fba247da804defb0e448f78935c427e21efb7ce5a10861d7c4791325ec3f89bdf08a41d8832528903ec9bf11f5023846eabeeff00586023ca420367e8a7d488eecd94dd791e70d2357ecb7e53f28c0c1a6a6c3c8428264299d06bca4c19c46f6388c62bf944d180e64498f226f1821131888e4c89318c52262bc8c56031b4890248c8110190b6b07504993682768ac60d841b5e14b0906223180632546866d761d7f493a74efe50d511b915f233c3f68fb4fc27e1627e6eefd3ff007f43a70e1eaf34b80f875ca3ba259a4b7d083aee08b8f7ca786a8e0d9b2dbc089a54ce86e797a89f2795bbb66f229d5c3a0b801ac74201d2dd676785a4aa815458002de538aacd6ddb4f2f8693b0c154bd2423fc35f94fa8ff00e3591a9648bf44ce4d74768b0af7e9a7858c8e4522c7e3bc0b54304f58f9da7d3bc896ece25060f16d90153c85c794e5aad5f67a904b1d979927e53678863c0d45c9b5b4d6de539ac4e38a12d90e63cd8ebee9f2faef6b75cfa706f5dfedf73d0c3876b901e21c42b20bb9b311dda6bb2ff1375338dad5db312d73353195cbb16737332318c54dadebe1d6638136ee5bb6692e291e8bd93c767a4186e0653e914e7fb118fc8d513705437a836fac53dac1a84a0949ee724a1b97b0a7ed44921863afa47067b0fb1cc8baa76968194e9ed2d21d24cca892999c6bee9f39a57999c70f754ff11f9498f23970727da9ae128393f79328f33383a2bde4f49d776cb1415298b037a97b1e807face4d1eeea4f3613bf4e928af99c595b727f23a1c054031541bf897e3713d3aae116a5811a95b661ba95d8cf26a86c51ba5bff0029eb9876cca0ded9a9dbde359d79b69a39b0a52c4d7c45d99c43bab072485365277db517e73a4c16f398ecf62d541c39eed4563707ef6bb89d260dbbde92677b847dd4cd8aa6ca7ca4304e396bddfaca7c5490a4f5b5bcb9c27095d5ac3eeafd67338f91b348bf31a589ad61a749570989fb03a8d7c258c5d3ee9fca657a385b1a67a0d7ce447a7a773477d459acc4212395fe70181ab998f97c74ff005962aa5d48ea7e703c3500bf991f189574b1ff00922e090ac34f51f38583aa74f599ae4d1f049639112c510194948fb4ff0035e5d1479743017fde7f9a5a53de3e5369b6651a0b68d1032a57c6aa920f299c62df05ca4907aa7eb00cfb4cee23c6e9d3ddada5f5e876f94cbc5768941b277cdb40badefcefc878ce8860935c1cf2cd15dceb11f494ead517df9ce453b4efa87cc801eed806cc08e76da1b01c7293365ab6f6973642df7795c0d2fe129e9dc37625994dd235fb458dcb46a581666a0eaaaa0b12cca401612870cc2d622931a4e2f45435c5ac6c2e0833529f1203600795a4d38caec666f3c610edf89ac70b72b31c601c550cc8da54620dae2e56ca617198f08093c88f89b7d66b7fb5c6f6004a58fab42b29574bdc1175ded1475f8dc929340f4d249d04c163c5ac48173a5f724749a147100906f79e7b5e91a754828eca41b556b936b5f2adbec0f89864e2acb4d96d56a02e56c3b8c05868587ce76cb4ca5bc5f271ad438ba923d1293dd8c2d53a1f29c7e0b8f01912d77b7d80752be0dcc803d489af4b8b50704e76516b82ea56e39917f1d272cf4f24f83a61a88bdacbf8b3dd1e4266accc5ed207210a54009b2b95395bd794d10c00b9330d441c124ce8c1252b68918a56a98d41cefe52b3f103c801382538a3a945b34af035b10abbb0132aae298ee4ca8c660f37a16a069bf1152c145f53bec3632d23ce6ab6199b90b78cb14a938db30f26312ccfb8fa11d10326a660fed6eb605ed7d83006fe5d61578bd880c52e4d85c32dcf406d6bcda326f84ccdc4dda6753e90d6bca34eb38fb549c7958c22e3d39dc7983358c910d32cfb043f757dd1861d79661e4cdfac64c4a1d997df0c0cd134483f62793b7ad8fd23e47fc40f9afe8612f1e020599fa29f523e92356a1ca6ea7ec9d883ca1e0b15f61bf237c8c76063a6c3ca3c8526d079093cf38ecdc578f78b308d7118e84498b3466f03185e301168c4c9111ad0190d22223b08261001c883223130388c4aa0cccc001ce44f2462ae4e8a8c5b7489b41b5a07038e5acb9d2f6b91a8b6a3c21498e32525681a69d320c2416983bed154702456a5e791ed4d73c6bc3c7cf77e9ffa74e0c5d5bbe0b9488da5836e8255a2259433e4a7c9dac92d01b8b03e00184b10a6e46d248be4243197ca05edaef33bb7465dccfaf548e57f23cbca757c1df350a601fbb6f76938b7001d5b5f23627c3a19daf014070e971d7e73e9bd84bfacd2ff005ffa8c75bb417cc3392bf681f4991c4b1caba1700753b99a3c4311a6453e7fa4c0c461a91bb544563d49b9f4e90f6d7b45397f0f07b7f957e9f731d3e3bf3331b1bda1a084d959c8f3b5e73dc438f0a8db65f3bcea32e114ec74d81da0f18f85a83bf97d57503c27958658e0fdc93f89d7bb38fcd9b5264332bf75bffc9a58fa1830494ac54f25b13f19935ad7b8f7f59e9c1a92b56be9466d3453ab59a81251ad736f4fe84501c4f979fd23cf431c538db319727778731c41d13a5e16a2d8cfa16ce22d52da594da56c16be8259bc24b61a74c9ccee367f760f461f232f9333b8e1fdd13e23f4911e472e19e67db5ab77a6bd12fea4ff00a4c3536653e2268f6aaa5eb9f0451f5faccc73b1e8677e3d8e496f66ce2bec29f03f0b19ea5c35ef4148dc007dda1f84f2bac6ea9a723f29e91d93af9a828e7915878f745c4e9d47299cda5f7648b1c5f0cccd46a531dfb80c475d3293ee33afc17da13168b656bf29a9c3eb06b30fc44788234223e509ae96fe26d6335403c4096708a033002c2ca3e129b9be41e24fba5cc39b335fa8f94e49fbb5fbe4d22fcc131a7b87cad15f5129f11c7203ecee0b020b01b85bee60b13c5a9aeb7db537d2c39931471c9a5b0e59237c9a35cfeb05c30777faf19ceb76a95c1a812afb356ca494b722735fcbe732ab76959db2e15dca95ef596e54826f61b88f2e3962c4e524fe8aff004271e58649a517ff000ee719c42952177703c39fba73f8eed601fddd32403bb683dd393ff685266cce5f35f66b86d37bde1e962e83e9b9bec794f9ecded449d2dbe68f5e1a65cbdcbf5fb675c6ca83d2567edae28725fe5e5332ae1c2d4b82ae092353b0e464fdb521b91727ec817d3d369cb1d7e79bac7bbf81d1e1e28add23630fdacae4666a0879dd5b29f8de5fadda0072f75ef60ce77f660ed9add4cc56232feed6e79a9ee937fc27607ce5ec0f04aae2e7fe1d14dd41d599f5ef375ff59f4becec79d47ab5525f05dfea789ad9c1be9c51fa961f8fb16cc989451f769ba1008fe27b684ea651e298a7a8d6a995c9fb34693777f33b8f95e74d82e194c53c958ad42492c720d7a0f410230387a7a5350be9f533d18e4827b2fdfe4713c536b77fbfcfec72f4b0b51b44464b7e33ed00d3ee1e92743833b122a3d3a6a770832e6f3f0e73a76a5a5b31f495530c01bdafe72de6b08e9cc9abd9fa282e959d4dbbd975cde7d21e8f08a34d4594124662585dafebce5fc56282daf957c3eb281e20bbb30de7c67ff24f6bcd25a6c2ddf326bf4d8f5745a357d725f22be270ae755aaea7c2d6f75a673d2c45eded4ff2afe9350714a67637f4fd60ff00da880dede1cb69f290d4ea52e9b67aea2bd0ad4787543f6ab54f4b0fa43a66a22eae7d77ff0058e38ba5f6d62ab8f47394296be800deff00a421933b9abbfa7fc1b4ab82f60f8bfb55162a0f3d3427c75d257e21491dd0fb36b837b2b2d891d75da7434690cb62abb6c394854c2236eabd36e53f55c39142297efebf13e6f261949bdcc3c470e46657f6b9691bdd6ddf56deea770336b1f88e09e90b971589b126aea4b7260a36d34b739b2dc2e91604a96236ef35ae36e72d54a6a05b2afcfdc66be3d197f0c9f270ff00b192c1cd5a9989bb6b653e197909a82a68359b353088775122b8341f744f3f5cfc5aa3bb4cbc354635c9ea64d6893356b534452e4580e7627e115301ac54d3b13a778127a5809e72d3cd9d7e2233d3097e44c28c381a1b0fa79cbcafecd94146736d5c6c189b0196fa4bb8842ca42b6527ef581f81de5ad345724bc8fb18351ed7029d5beca4a9ca4ec09b7284c161f10080c9434dd8e6ef5ff08b696973f68297666a84053f73ba728d5aeb7ded7b4c65e2f519d6cd7424b32b051fbb3a850d6b683ad8f8ce858e2b844db66b63eba5fd9b516a86c34b0b1077b1bec2df112a7b0a6c415c3329537be4046ba75d4e9ca4b0d8e4a85487c420a8480b9014d34b8600d81f39b14a8955cb9c9e8d6171f0b46c5c1468b0a6bfbeaf9731e60213a0d8efbf491c5540c1512a8236be5351f31d8823416f190ab8ca22f9b134dbf37b3210f5d07c251adc32901ed958b2b6b99351ded4b5b5d3ca15ea06baf075b7f78f7ebddb7a0b48e2929d336bbdf4dada5f6f7f84a9c3f87300b96b12a5816b6617503ec8dade734a9d60bdc2b60ada12c1ada5c33126e0ef2690f7281c4550c422d5702c2e329d798b132d52af5480729d7aa907d658acac6eeb50852a74196db6f9a66714c6b2d15ca2b1b3a5d9186d7df329371d445d37c0177f6e61ba7c7f58d88c6828c2cc09461f0339bff6a14a7516a96aa335c5ded52d7d86517b5874e73630b84cd65295d1480c1bda0606e2e54f31ee8535dc2910a6741e424ed2f55c1d302fa803c7f598d5788e1c0ccb5598036baa336badfec898f86cab2de58ad2bd0c52b9cb4d839b5ca8fb40756536225b6a0e3ee98ba1aec5583223111cdc6e0c62d174811b98d78f710556a051726c0487495b1adc933c136206dbccfc4e3c9d1741f1b49e1f4058cf1757ed7e9db0eff1fb1df8b476ae7f812c66342025ac3e7385e35c50d6622ec17602f6d26af1ae225eebb0f2b83e739baa809dae761e7e939f029cdf5e576ff43adc63055154771d96a4570c80df5cc75dec58da6a93680c1d0c94d53f0a28f70d654c7635002aad736e5cbce7bbd7e162ea7d91e57bd22388c4dcc250331e954b99a944e827c9ea1b949ca5cb3d1824951a94ea5a5da441f09954aa4d0a2fce79d9223932d043e72af10a86f6041b01a78f9cd1c31bfd7c662f10c32e72c8c54dce876ff4938926f73283b9152a5373adf6eb3b2e1f5cae191ae3ecdade373389ab46aef9f417d8833a6c31229a2937b28f8cf574fabfe16339ae5aa5f3d85a987552f890c4d5637cbb9eba4c2c663cd3d1d47811b4dac4616e090f636f4f3339ac5e0d4e953144f805d3e3383074c9f99feb638ba5b153138b2dde00199b88c4b9d97d25da98114f5a75d4f8180ad8f2770b7ea06f3d3c697f8abfc84efb997571c07dba27cc497b6a656eaba79cb357100eea251655d728b78729d51a6b8a33665f19a9603f37d2295b8e36c3c4c69eb6082e84734e5b9e8341b430f5deed2a614e8615ceb3d9ad8e6ee5ac2b907432e527bdefd666d069728b6a6535e50ee59bca1c645e8bf82dfdc44b65a55e21ad371fc0df23325c952f759e3bc66a66ad50ff001dbdda4acfb458a6bbb1eaedf33198f7677a391706db2f769ffd3f9da765d87c4fee8755047f2922df29c950d692fe41f29a7d88c4e5a8e97d9efe8743f113b3531f22672691d6468f4baa6eb9d75b811b178c3469e651a822e6da5c8b293e17b0bcadc2ea652699fccbe2a771e87e72d3d3bdd4d99482083cc1e531c33b46b9a04b01daf1ff003a95442a0ab102ea18d8efd2d695789f68e9b5467a78c7a5a28ca29920d86e2fce66f0fe0f8aa6cca95aea0d973dca9a7b82dc8ef6f49d152e174557f7a94ea36ffdda8036fb23909d4de284aff7f99c0a19b246bff3f4660fedd49d09031194b5cd53ad5acdf889d828e4253a589cc453a75ddd59adecdc6b7dfbc7f00dcf5b4ed8e5cba2a816b6800d3a0952970ca59bda0a6335ad7232923a69ac239e2f72bf8571d8abc538864a3903166006a45eedb5edcfdd2a767b1550d227b884b1b950003fc579af5932ec29278db337fdda4e5b1fc4550b05398dc93b655bef703763f09866cb18c7ca74e0c4dcad84e27c2a939cce4bb7526fee9875f85a29251994f50c47d64711c518f3958e249dc99e64da9727a515d2584a4df7aabb0e84cbf85ae94c6c2631ad206b8bee3df222947dd45bdf93a31c5e74fc03b494dc0a4ffde0d893a30e97eb3cd91d9bec863e40cea3b39c055887aa5c90410962177e679ceac536f639f24635b9e914b11717d206a0b9cc564a9d06fc209ebc87a4b070be26f35b499851572c714e5a144016f7c92ada2b2923371bc3c3a9cc011e3d672d5bb24ecd715994741b01eb3bb7a7712bbd3b749c5a8d363ccee5146d8f23870ce2d3b1bd6bd5f4b0861d8d4e756b1ff34eb23133997b3f02ff00136fe226fb9cb7fb97479b553fe732f70eeccd1a2c1973defb9627e73723da5c749893b5125e593ee1913e518a6d055312114b126c06b6173ee1321fb482ff0060dbc7737d06db6b3d139e9b36d93bd612446ba65f2d3dd39bad84c5356cc2b2b6b982b5c0a6a76361a373f1d04d2a34ea61d59ea546aaa35b6419ff009ae2f21c915d01f18ac14b2d890341627d3498b88a388756f6bece98b582e676058fe500cd0abc78023f7554a9b59801624f4e5cc73815e2bedad7a3580cf65617b86d75b8e5e323a99a243f06a0eb4d52a87ac1893988ee2a81a0cae730f74d4a75e906f66a5011a6516b8e76b4cc7a5490b55aa6a8d2e4b3dc6a75ca01bdf61b6824931b8775cd4c1b816cc12cea2dba961a902434d944b1f85a5de167a77018b2fd965bea0ef700ee2dd2470d8ba14b4159c80b7cb6b8e5988196e3af84961302b5007a82bf3b0a8c092a75fba76d6d6bcb5fecba1bfb35d2e79db5dee3623c0c2d012a0aac0bd12bdefbc3bca6dcf2ded29e2f84bbb663540d45ed4d36b5ac2e09f7c99e2014aa525a7932e96d0a817d4d3b0b2e92962aa6299fda53d52cb60ada13cc907503d75880bd87c72ab9a24d3baadec09164ea41007ba1b154856a760eea0dbbd4cd9bd0cc7a1c1cd546352881519b562d9330d8b5941b684f59b586c0d3a62c8aa86c6d6dfc4db626275d80c16e0355484a593d98b58b5f35cfda2c14d98efbc2e0305fb3d5aae18b922c7385a74d46841b8b9f85a6815c4df57a600fbc4660dae8480065f940fb2c4b8ccc30c6f6b0b1b9523517234858cb69c457206254b6c5699cf66d01cbb1205f781c4252ad4cb9a6a416d73feedaebfc5d7d6d08ee68a16c81ada85a74c8398efb5fdf69955b8aa55016b51c9ddcca2a1205eda96d340224ac0b54388d0a6001ed74e5736b13a9cb9ad6f386c2f11a151b2a66467048d002ca3ef0b5c7be4385e2e92a8ccd8757705885d2e2f7d4b6bcf9cd154a60e70a809fbc02ebd0de0c0a55f84e73735ab837e4d97d2cb68f88acd4402d52964b01dfcc0e9b92fafc646b63dc385b2d98902e1d5f4f0b6be731717edeba32b20aa85b4234200eb617062f981b989f675d7d93d983283607420ea08226762bb3970ab4aa3d30a08b68fea330241f594f05c14394a8571000254abe50577b32b5c305f2f74e89f0eca8129155236cd76f4bdefebac06660e13ec88a9497355b59aa333963a5b365bea65ba18aa8ad932567b9273be45034bd8680dafa6b2856c0624862f58a8249b0d6c3f30b5a58c070ab0567aaf50d8df5390df6d0ebb78c0468515a87fbc34ca91b01620f217bcc9c461ebb5ec29d35bd812f7d89e7e26fa5bd61b89e10d5ca94b1029db6543626db8eeb036991c470f5e91542a2b000321219b2b060599cb1276b81a1e504334d383d7dbdb29b917256e428dedd49f198bc6eb0350a2925574f37e67ca5d6ed2551a8387616160b99ae799b8dbd4729868a58ebcf73f59e27b633f4c1635df77f23bf458edb932c6085ced07c631361941f4bda5ec3d20a2f3278ce342ded90789179f338fcf93647ae8c1ae8377553d0ab8bfaf595b00abed91acc42b86d3f8483038bc4e63b83e571f39d0f64308acf9c8db6fd67b129f830eb6734f74e8b58fe22ce7bc4a2fe116cc7ccccefda835f28b0d80fa99d2f68383fb6a64a7f78069fc5fc2671f86a2549437bad81bfe2e727f8dfe2b1db7baec72c3174c8d2c299ab4a63506b19ab4df69c1991d08d34496e9dc4a141e69e1ac749e764d8991a3806b6bd04e771ac2e5ac773b4df7ee5363fc3f3d273bed57a9bc9d3f764e3e5b2be170cb55d402c0deedcaea37fd275555c01ca66706198b3d869dd1f33f496b886211477843349ce6a2396f22862d48bb8a84796de569cfd602b1b1396a75d819771f8a673fbbca39587499f569d6fbca3e179dd821d2adbdc4ca18ba7529e8eade60137f294dab37f86f69b0bc56aa77431b0ebafce06bf1377dedee13ba329778afc4cda3316b83a588f3120e6d2d55a97e4253c499b4776433038a3dea5ba2fc4c52babe6a8ede3f2b08a7adeea48e37bbb3d1706dbc9d57d667617120137d05a4b1f8c0a77e5a0eba4f72306f83967351dd9a34aa43ae22cfa9b0cbf1bce628710ab7272e9f3969718d51c128502af8ea4cd278dc60d910cca52491d19c7a72b995f118e254802da1f94a0af244de79d29b3b1ad8f297dcf99f9c476f49aadd9ec41636a66d98ef61a5e0abf0aaaa427b372d6e42e3df3d18c93ee71f0b82f61dbf74bf947ca4bb2f548c4fe656f81bc260b87d7205314c86b5ac75f84e8385f655a99ce194b5b9836d77d66f9f530e9493b30d3e09ac8e5474d84c6060a0eea77e7e3354639156ee545bdfee9cdd2e0b5ef70c80f85ccd3a3c02a358bd4fe51f533cf8e592f74ef9422f765fc3f6811f445dbad86be52e53766fb42c0f3f0e80ca982ece524d6c6e77d77f3b4d6a58040328161d2e652736f721a8a5b10bea3a0e424d8b9fb2bea7496928851a011efcf97ce6c94999b68cbadc2cb0bbbb7a69388e31c01c39144547b9b9cd7b5fced3d3d2966eba0e7d7a4ae535da138da145d33ccf0fd93c4b6f917de66961fb12df7ea9ff28b7ce77604799784df2cd7c4394a1d8da03ed676f363f29a587ecf61d36a49ee1360c51ac5125cd95a960d17655f7096f0d4cdc651fa488f09a3855200bda6918a5c10e4cb6b19a329912f78e88113a48169230644b404d5a41e4e9adc5f918f5100d4c5630269c1353333fb41da2a1854cced7dc00ba92c05edd01f39ccb769713892453a4e8852c86c0ddd8828d988b65b5c927e70e8b2a3676f4d6fa8b5baf286ab4c5adafa122e7cc4e6071c0954517276401b933b5fa7d9dbe226c8c7281766000dc9200b0f199b4d705d01a551ee5ff67caddd1f6ee2c7ed6836b6be7a42d7c66550cd4f3383f61002d72795cf4dcf9cabec45622bd1ace012a4906f4d82dc5ac47ca6257c1e24366a8aeeec4d9e9e52156fdd422e2dbefe1279e4a491d0e1b8b2d7cc948b8603ed3536caadd0df4bf84af538bd446f66693bb5f46b6557037296b932861f85d62c400d4574cce08cd53c2c86c078cd7e1d46babb1ab555d4fd950b62bd3592e90cafc378a7b5acc800b01722cc72b00a2c58802fa996f198caa8c5568338ca08607424f2db4966b5454058d8000927cb9cca3da9a16b867b7e2f66f94f969ac5cef401b888a6caa6b50bb13650406b37e65b90273f5304eac58960a6f62a42806f7c8c1d8e808be9a4e8f85718a55c1f665bba6c4b020dfc2f295635bdb155a6ce8793f7937bdc5ed63ef8d3a1d19740d55cd5159d4a90dde67cac7f0e451661cec04e8f098524ad5a951cb650728255013bd977f430e16a02490960a745d5c9e5627403c26257c487a85c97a4ca8541ce9bdcf70036ef1f5da4b6d81d215dc8b5ed6bdbfad266a3e26d6614835c5b291722fa8009d34b1bfc21703c411ec2e410366b027c6dfa41f17650a19d0b229be60d6284e97d35e7246478a62da9d35bbd35a8728ccfaa13719bcb4b9f499bc3f880ad5da9d7fd9ae97299189622d7241bd88b72bc9e2f83354145e954cc8a7364a8ec50ab6abd76e533470ead95d0d1a849421454642bb8b95e77db5d378f619b068e30900ba321520d82af76fcc107bd6b0d3486e046ad9d2a2555b1eebbb8666bdef6b6c069699d85e078845a252b646404b2104af7b7d01b31b75eb3a756d35022623330fc3ab87b9c4b1517034bb15dc5c7d9bdc6f68dc4b87bd471fddb2e5d987797c8db9fa191e2dc756832a05351d8db2a95b8fcdcc7ba513c7abdecb87526f761ed54bebbf756f6b08e9f2002b70d3a22397736b815012aa0d8f74adc8d7524f297e87063987b401940b156248245886451a01e1f0826aeb8d05691746422e5d0af3d2c46bcbaf39a981e1e542fb4a8cec2e77602fa6b6bf844d80cbc4a98634c9ca558280da03a0b653d35f849574ab981a6f4c2db55653bf504416338754350544a8c406b946361e42c0e9e16f594d5b16ac6eb6bb587795d35d07461ada2a02e53c4e4cc2ad45df42465d2dbded69cee3b88d4662a1e9b7b3a8330c9ae5274b32b5b35bc44e8b0b4abd4bfb655a7d323924f9adad26fc290f78ad367b5b315b5c72072c013a31315c41182b0ad88a4ada01605430d08247eb2c70f4a7ed405a98846075565cab52c2d9892ba8f5e50b5b80120d8d206ddd0533d8f2d5efa790972854a94d07b557720d999156d6ea141b911bf800d5b845166cc516fcf2f76e7a9037f584c6e0a9ba8045ac40057bb604dada72f085a58847365617e6bb37b8ce778c706af53102a160d487dc576a6c17c75b1eb71692be231769a9534b2a85ccc7333699ac365cdbfa4c357b728aa802f6000cc4db5e67c4c87b5027c66b7378f9a525c70be48f77043c38245dc46242d3cc4db49c6e3b17ed0923201e3bce9da9d3a8016b1b6c3737f2991c66cba7b0a6bd18d95bcfbb2349d319556e6f2b68e76a203d0f4234b19df764f0f92902776d7d394e1f0f4bda540a3425ac7a5b999e8fc356c00e8001e4269ed29d635139ef73454ccee29c216a9cca42bf5b687f37eb3454c966f09e1c67283b883389c5e0de9b5985ba1e47c8c6a750cecab0523290083cad393e29c36a532590164dedf79478f59e961ceb26d2d992cbb83a87ce6ee0803b7c7e8672fc32a86d8907a4e970a48dfde273ea635b10cd0c69fdd107a8f39ced7a1a686e3fee137b1f52f4c016fb5efd261ba977543a5d85ff28d4998e9ed21e3d91adc3a91a74d57736b9f33aca1c675d1afcf5066b54a8369cd7183726c61813964b61d8cc34ac6eae3c8cad56a6bde2d7eb789d391d0f583a6c068daf8cf6228cec6c1307a9ecd890391f196abf0b70d95416e7a0e52bbd216d37bdc1f19d0f08e26720aa96ce9a107636e47c27a7a6c58f3c7a7892309ca51673b53055177461e86667100c14f75b63c8ced9bfb4e5072d6c22dc686d6fac854edfe02a7dac2dbd06f3d38fb192dd4d7e5f739dea25de2794e028904dc1f778c79e9cdc7b85b0be4b1f11fe91e744b41924ed7fc214d51c0d572d75cc6d6d65ea95d58ab65bb9402dc85b4bfba6757aa05891aec075f18f8a2ec42822c45ce5e67c4cf4d494559e7b8ca4e91669bf7bedee796d3670946a9233bdd40d073997c3b02ebf641bf94e9f86e19fefdfe1f498cf249a699b430c62d325470c25b4c3cb74b0fe12dd3c34e458cebea463ae1759669616680a1ac3a519b4717a99b994e96144b54b0d2c2288549aac69221cd8a95096516d19442094a2896d93c9a692c50a5d6469c2d33f39ad195960d00548f095a851fbc4dfa784ba0c003b8928416da095d30ea4e5d45fa759614ede7005acd782022fc34fdd61eb2b54c238e57f2d66b126f1edade40ecc4f60df84cb34b86b1d5b41d3732f5bbc7cef0f783d82ccfa94c2d80124a36f293c589143b7acd1702274b68d68818c4c0044c81d8f944cd065a303128e21e99eeb1f2e5ee96713c48d442a57bdcac6c2fe3293ee7ce444d1a56347358f6a99eef42980465258dd189b5b3741a0d7c04b7c2283b55a8cc4a05232aa9ee64b582f4e40e9b5c4db23d650c5f0c0daa33533fc26c2fe521da2d01c460d55ce26ed980b9527ba4016bdbada5be1f8d4ae97b1b5cad9adb7523a1130b18b552a2d5ac1d951185d49ca7ba46aa399d3dd33f058a70c870b988770ac84330517b92762bb9d4f4004854cb68eb387d4386359aaba846a97425b653c8fe1e961d262e2f88d5c43b65c415a25fba5bba065176cb94e66df6f1137319854aea69d40083a11e5cefc8ded2678353ca8994009aa91cb5049f336de43db71a617b3fc5a89fdca875b7d9351ae5ff0011b93d41d27402716fd9e44a9ed733017248be858dac4dfe535f0dc4cbf749208d1eda5cdce83a6d7f5994a2b9450fc7f8453726b16aa5d468a3beb71b5d2c6c3ada55c3e0712cc0d41490004b302c7ba3f0a6c04daa7c414680012c5602aa1436d411cb4bf9c5d4c673586e1c8d5fda9a82bbaf7bd9ad35a7a72617df5b739d360ebb32e67a6d4cdcf758a9361cf43283d0ac6c89590328370065276ca4efcafe72cd2c0b0003557616b3036b3922cd7e80f41d2293b11712a83b1047810654c5e25331a6e80f7435dc0c96ebe96e902304b42ef490b39014297b022f7b0f2d4fd6546fdaaa1462810826ebddca56e0656bdc9bebb692521969930a1006f60416b8b852331d74e92e61b114dbbb4d90e5d08520dbddb4c4a9d9ea841efa8bab682e2cedbf786f6d003cb592c2f04aa6a53a8e55421b322b35dc01657665b027c088f6f5035b1587762325564f0caac0fbf63322b765c12bdf76b1b9bb11a93736b6806da0e93a4cb2bd7c75243959d411636275b1dbe464a6c0a4af5a91cbec83a0b05ca7bc05b9dc92668d270c3620f353b8f39cbf68788d74a8a10b2a1d7da277c1eee8a56c45ef6b758a8f681ea540569161916ea092e14920e8ba1d411bcae9d80d4abc0a867358664a86e732b1bdfae598f85e1b8a66199c2d30e43955c8e57a1bede6275382ac592e69b27f0b65bdbad94c9bd55072e600f424036f28949a039bc26068e0ea134dd8d46d2d5090a431161702c0edaf8cdde1cf59949ad4d6990c4001b35d791f080ae899f32bd357b5886b106db5eff66d7e5d6575c3543533b627ba0b1b03601586801d8dafbf8439034063e967f679c66be5b6a3bc2dddbdad7d7683c67b4439cb29a60dfbd65c86c40248dd75f4924e1b488b38cfadeedbf51723782e25837a8ea055ca805d972dc30045c137fead0556050c671caa2c2d4c1ba9b8bb2b2b03a86205c0d36bef288e355f40ad9aa33f7a965576545d4b205b5ee08df59b5c1f07441252a2d423badf64817b35ac341b09ae292def6171cec2e3c8c7d4900d4ac403aea2fae87d449da46b36552c013617b0dcf94c57e222bde928b5c0bdd9a9b81d57bbdef873914054ed463ab61ed513314cddeccaaca01b0034ef2ebcf5de6657ed307cd4d0121aea181d17f15ee3bc34363783c4632a525756b861500efbbdac0dc381945c1277f213271dc4d58aa5807506e6c837b7d9cbbaf9f5339f5d93c3c12f5aafc4e8d3c3aa6903c4d7e5e0605c5c095b175b6b7f57816c6ae5d586de67e13e52389d2a3d87245da7c43d993d00d6dbcc7e2158b82fa6f717bde53c7f1453dcb1b9e9a9fd04861daa3777280bd373e13b31e9fa3cef6664f3c56d66b76629667353a0ca3ccea7e93b9c26b307836072201d753e666e50baea2793adc8b24dd0a1c6e5e47f03084dc402e2873855aa089e6b4fd0b1f2d8682f1bd99235d3ca329b6d246ac5b86e62e3f801bfb4a46cdcd7607f430bc2b887fcaaca558733a4d36c481055b238fde01fa7ace8f16528f4cd5fa3ee438b23c518280b9bc4788eb28f062cd559cb5c2a587993bfb8187c6d20d4c206e7ddbf23e0653e0886882aff0069ab1db504696d65c12f09d72276951b359ef7205bc66255aabae6b4d3c636996f724ed3131c8174beb1608a07b14f1669df7d7e128d5b1da587209b100c854c28b5d5bd0cf4e14b9337b8046e51b018929540e4c6cc3eb1ed21ec8fb453e33bb45fdf8af56619bdc66c712e168c330456befd671bc4e9d0472a55d4fc27706a5b69cd76d3160530b956edf7adad8729f539bd9fd2dcd49d7a1e7e2d4f5795adce7bfd98b5355a9e9145c04dc9fcbf5114f2336a678e6e299d0a29ab2cd0c01bdcefe33a9e1d820aa2c00d21e9d151b01ee97694f59330492151a52f5048012d513290cbb4e196574685569484d0edbc90304ed195e5da228b486111a53f69268f1b62a2fab49ab4aa1e111a0989a3429344957782a2749063acdbb199a74ea18063ac6a35233bdcc7422c50a9b7e690afbc8d2d3f9a4ab9d62adc0bb4dae01f08af01876eef949de67403b9d442832bd53b491a90a021899046d07998d5db7f380a6c65a5b007cf2151f491612244aa10d9af20a63f23057850c056c1df553e8651742a6c4113503c1d7a808b18c2ccfbc71235d9575e5afa5a429d40c2e083029308d034f0c8a4955ca5b72ba5fc48d8c2988c8691601d586a0661e1a1f7192c3712e40ff94e87e309075698616600f9efef99c93293465e378bd618aa74ee9ecaa36c575006f76bef7f9895b0fda1a01aa0375b31373f7dc9232a28d4dad0fc4b841617424d8dc03ad8db95e61602805ae3f6b1640c080100566e59dc6bd34db499aa34bb3b377eba4c2e25c6c8645a559750c7b9de3945f33137b72d00d749678ee3d2a7b4c3a29a83d8b33906d616160ba1cc751b4e4b114bb8f4ca93cf2aa1ccacb60495b69a6d7842af71bd8ee383b362a9e6776196cb706ce729bf7c86d74e4443f16e395d6b2d2a028b0c976bb2df4366041616e52be130e69825330cc05f5d6e05afe739eff771c552c2a8c8c589ba83505f96637bebce3e957b9299d761f895474b3d44f6a1b213485ee6a0eea0df5d2f9b616e7343018ba34ad4cd662e45cfb5241e9f7b4f74f35462ac30c6a924166af90b0b39b0570db68a069e734131587d1185deb2f79dfbd602e3da123402c01d3c64b894959ea08dce42bd72a015467d6d6522e3c75338ae078c7c40385051529269529f792d7002956dcefade75bc2f0494572a126fab12752dd6db0f4993540d1994d98d461ed6a3a2e62ea41057424588b1e636e9015b87b5722b52a8080994231370c3993adf9eff0019d4df499585e2eecfecda83af78af32010a4f78e502da6845f710b623330783c52555ee6606d9d8bd9341d56c49bf220ed36b0d81cb55ea64a433000150439e673723bc5c3f1aee4e7502cbad83101ee458310030b58de071fc5c5270ac8e54a96ceb620004037035dc8f7c1dbd80bf8ac2ad4528d720f891f2330876749b672182ae552b70c13a6ba7c35bc860f8851c5d5fddbd7470bad8e8cbb78807cbe90dc438d56a375f61a2b019ddfbac9f8ae01b1f386eb61d02a7d9f466b8a8e2c75d012ca45ec6fb1dc5ed79a584e0d4d4b7de53b2b6a16e2c409895f8bb2b2562e29d33509640a5f39cbb66361a8b7a8f19b5598e26807a150a66b3062a7607ecee2d07603715c3d72a130f64b0d08603fcb94a916f1bcc3c454c4d361ed55d85421598d4055013de2360ad6bf2977034f1a8d7cb7cc6cded1c32e96ef00a6e2fb69ea0cb9c748b21a94f3283a9d196e74b321ef1eba413de80a1c3f8b2d2a6c6961d88f68d6034275b2ee37226de178c23150cae8cc34cc34db5171a0f5b4e7bf61aa74a4542bd9969bd36c94f5dd1c6db7de12a9c28f68c8ccb549163df0c05c8d94ae5041bf28eac363a9e21c56829f66d51949d332e854f2d7fae70afc38975a81c580fc0b98ef739bc7ca64702c0a5272873d4b92c8e53b8800b1553caff0049ba714a1853cc3310485ea06f2588ad4b0d51415760e9f74106f6f137d6729dabe0146a7ef8855703ed8d1b4e7713b3c7e1855428c585f9ab153f0f94c3a9c10a8bb3b5423ecdd6e14df46504def6d37d66728a972691951e5f8ee0f8902cb5148d7eedb4f1379ce62b0b5d771703a6827ad56c1d240299a80837539d32fa653f77f49c371be1f454ad25170c49434aa5ec09f1d0fbe4c30422ae97e0692c9297733782613da6a771b8e8675583c20169cae1b14c8c02a1bae97cc183006c6e46c6763c3eb070184f9ef6929c66ddec6f8aaa8d5a604986e50348cb1944f064762199b91895edb18e2c74320f4ad16dc007158c8bd595fda5a02ad4f18d63dc761aa626dce57a95ff000b29f026c4ca5598f9cccc4e53b99d58f026272356af126275d3979199dfedb66c453a64dd4555d7c334cfaf8861a1d7a1e7e52ae1acb5a983b97cc7c3a4ee869a093b5d8c326475b1e8abbb313adffa133aad5d4dec21e9d66b1039ccec4e12a10481b99e6638abdcd1bd8a350dc93b47453ce098106c7afc65a2b6b4ed7b198852179728e184aece2e0f84bd4ab002632949535c852650e238b5a454373e9d272fdafac1c26537d26be314d472e76d97f28fd654abc3036e359f59a5f6865783a32eeeb93827a7829f547631fb394f56bf4fac535f0fc31a8dd88eeb6de6378f3ccd4c9bc8dd1ac23b1bca659a4655530f4e7d0291cd45b169629bca4ad0aaf0ea1d17d6a422d49483c9abc2c4d16d9e0f3c16791cf345211643c9ab4a7ed2110cab24bded21e934a20435336948991ab45ac2317d60693e9244ec674f6302e52d4459baee0c8516de2aaf18829737b78886ab2a235c8866a9a7ac2803e1ea6e216f29d268707489a0b2750ed1ef22a63516d4c54045f9c822f393ac3593c1119883cd4c774ac019306c7e7224eba48b18e8083b6f005e15869020443202a1bc0625f785695f15b4a4228e2ea5d72f3be9e569c79c63fed0591caad3eedc6c48e5e3afca6f71dc4b221c8b7394dad6fb5b0de72544114c2ecd725bccc52c91ea51fa9718be96d1d6613b48ba2d5007f10dbd44daa55d5c6652187506e279938b6f793c263ea5239a9b153d391f31b18e493e06ad727a6de2bce5b8776b51bbb58653f885cafa8dc4e8e8d60c0329041d88371336a8a0f20e80e84023c63868f798c95f2544cec770a0cb6a6ed4c837163a06ebe1bcb185ac57d98aea010329a83553a5812de9ce5a881febfd2438762d48b270e185d0de567c39e7ef91a6814dd6e87f8755f55e5e92b51c7e211d96aa7b557a872ba58044234571b817bebe316e87c9cbf19c11a0f571549d82ab80e961ad47b1366ded6606503c4a8ddaad8ddaf6161958ad8e46e7e3eb3a1c46330f519ea3a3200596b06fbc990ae60b7d75ca2f6e969531785c261d29ad3547ceded57da67cc05ac1869a6c37b4d682cd5e178f64aab4053a4a95297b50abdd656b2dcb0f1bfc274982c70b950d72b6bf517d84e578361e88ab52a85615340c1af75bea42dfee9ea3499b8ec554a35eb0a242160aec5ac41b03aaf4dac7d24cb1a7c0291e9e98c5e7095892a42b59ada74b8dafe179cb70bc635445775284a8254ee0f8cd0abc405352ec6caa2e773a79098f4efb0c5fed6c4d3c9eda8684842cae0f7cfdee813ced3253893d4c45408597206ba5419cb7e506c2c6c3e1acd3e0bc7d3137640d917f10b6663d3c05bfab43d6e0f86a950d66539c817ef10a481606c34bc1d27ba1993c216a254269e6a6b7cce3d9a2d23717b0d331b69a8265ae1dc72a3bba8a62a2ea4b2ab0074d893b6d6b4ac9d9a2acbed2bd474be555d4686fa937dc0d889abc0781a61daa3abb367b6a6da01e5a137e7072421f83f15a789069d4408fa8349812328f3007a4da5403416f211b24569001035b4b41d66bd947de6b1f2d49f95bd660768bb40b873ecc5fda15b8eedc0e84ed71a4cfc2f16c504156a95706f945355b8be87bc74bd8dec7a6f043e97475d88a571652148fb26d7b7a5c4c6a98b7a753362111cadfd994cc0e524026c74e63c44c7a54aa1a8b8b47aac13574760a4efdd26f96dfd5a6b60f882637f74f4eaa585f752a482366daf2aa828b0bc6064664a06e2da0b6ac48d2e06fac363528d4a74ead6cc96d8f781566d2c47eb0982e054695f2826e41ef6bde1b11d0f8cb988c2ad4b66b9b1b8d48b1b5b979c9b1199c2ea53085e9d4a9513358820965606c7b805c6bfac22f19a46d9b32eff6d72ea371af98d76f183abc1181734ab326602cb652148161a9d4ccfa3c2b154c12ce842824742b637b000117b9e66552606c6369d4600d234efcc303623cd4fd2723da0c12d54a944d2b5604156b00a4dee192c74ea67414f82252b54a556ba83b22b0ca49db4b4bc387a939dac5c8b16f0e83a098cfd11717dce11bb2c129e6500b1b96f127599030af87b54b1ca4f787d44f516c27432af10e161d0ae5be9f19cd3d34669a92e4d94ce3e8d40c030370658a6f3271549b0953290decd8dff2f8cbcb5011704113e5357a49619d3e3b33b613ea2cd4a77d440ad761a1d21293f43156ac87bad69c8bd1a342b622b91bccbc4561d6d2d62730d05987c665577d7e93b30c110d8d55ff00887be51ac4c2542b0985c380339dafa5fe73b5545590c0855a6a5df90e7cbc260617124d5f6879b5fc87484ed0f10150e443dd0753d5bfd266e1ead8d8cf4f0e9a5e1b9be5fe8724f22eaa3d4f86636e021b6bb19778955c89bd893a09c3f0ae236b0274e47a4d1e2bc52a391aa050079dcf59e14f46fc5f81d30c9b05aedce0ead6b81e12a53c55ef7b48fb5169d0b1d09b0ed5bc657c59ae4065fb17b9d45ca8e56997c4b8965ee26ac76b7281a14eb2842c2a006f7de7aba3d12979f22dbb1cd972b4e91ea23860655eedbba0fbe12970854d773fd6d03d95415f0eacc4e65ba93737d36f85a6d0e1807d976f5d66f1c2bb029d9caf69c119146e09bf845327b618aa94310466b822ff0028a7367c79a336a2957ccbeb45a5687569514c3299eb9cccb0af0cad2aa9865801615a114c02c2032a84c2932379163204cb5b1214342a3caa1a4d378d017d5e190ca886d0e8d358a666cbd41eda4b2db4a7425c533a62b6307c85c21bdfca2aa7e723434309536225d6c4f7240e83ca45c9e71d4e8216b1d3d442804a749655b4f494e9b58ff5a4b0c6268614347a07782532141b53134012a54d613066ccc7a2995dd7532c6008cf63cc18a5ee8d154ef78ad25516c74eb20d29810630461098190dd0d20156a01bccec4e309d84b78a4b9f4946ad3984f2491b4208ccc4a96d4999389c274137dd657ab4af395c9b3a144e5eb51942ae1edb4ea3118499b5f0b1c72b42704ce7def0d81e235689bd3723a8dd4f9896eae1fc251ad872369bc33d99bc7475dc2fb614dfbb587b36fc43543f513a4a75830041041d883707dd3c919659e1fc4ab5037a6e40e6a7553e6269c92be27ab869306727c2fb5d4decb547b36ebba1f5e53a5a55811704107620dc1f592c659880900d25788456c4e011d85422ce05b30d0daf7b11b11794719c30b545a9950b175cf500ef7b251b0526d9b6171362f111150ec2536a6da0b7c8f94a3c47b394aa9cec8ac45bcec0ded2c544077d7e047911a899fc5e8621932d1ad93ae6dcdac459c6db5bd62dd14a86adc4130f65aa5af988d8b1ca05c31b72b6e7acd6570e34e7b1eb398e2946ab1a7559516a1414ea29d05835ce57e7a72e709c2f8f535409549a796c15aa11775b7dab816f03ca5f4a60d8fda04a945e9d455728ba2a20397da66bf7c2f504dbc6754954f395b0f8a0c0104107620dc1995da4c4622922be1c66b139d6d72548b023c8eb264add02652e2f8ec5bbbe1db2842eb9196c0819810e6cd702d797bb0a50e7ac4d4b2e814e7cba5fbd9af67330b8270f7a9ed313541bb53395dd7beee458f740b85b6961bde6c6173d7a429e9472adc05390e41f64ab0d6f7196db6e64ce92a452dcee68e315d43ab2953b106e0885a75d0fde179e67c0f893e1ff0076a5ded65643a287bf7caf33adc5ed3acc2713a75012b9858d88207be64e2d0e933638870ca55c5aa22b5b6bee2fd0ce578b7017c38070ce5771949be626e46a7c05a757c33180ad8ea47ca02a61c6259838fdd8165e576e7501f0e47ce2aa60a5471fc330589ad54ad57a880a9cb63721b7bd8696df79afc37b32d87aab5fdb03626eb97296041bf3f5f49d461b0f9542e66240b663b9e99adbcc8e3d85ce518aee6ce6d740393937161d62b61d5668d6e314a995462f763603239bf91b5a68cc6c22ae168e67a85d16db01a2dec2c3a7a93047b404bba2a1b852515810ec577cab7ef0df69695f04336d88dc91e7d267f12c5b282b91886520382080c468186e256a7824a948bd6a403163b6652fa8b1617e76da1705c3d69e999c8b68a4f740e400e76f1932d98e28b68bb0e41401f530b13346934508c84919131d0ccee2b825a8a5594116f74f3da8a70ce51bec13a1fc37e67c27a95a64717e074ea8d5479ce4d4e99668f4b35c793a4e36a29dd5c095ea62f4b5540c3f12ee3c616a611f0cfecdc128c7b8dc81fc26356a6d6fb07d27cb65c2f0cfa2677465d4ad146ad127bd4dc30e441d7c8894eab373d7ce4aa6145ee0b2f86a35fa4aeecf7cbf6875e63ce74423f106c54a9e76b5b4e72bf68f1b917d927da3bff0afea65ec562968d3d2c59b6f1f1f29cb55aa4927724ea7733b34b87c4975be171f130cb2a54b9290a5d640d1266df09a74b3deb0622da69717f181c4502188d2c0fc394f6964dce470d8cc4aec9275389336fe1f0da1ea61e04e1e4b86393badc2e4822712f03055b89311602d17ecf18d18470624ee84e522ef02b2ad4acc2ec0d85e59abc6eab0b122db5adca6761d98034ff111a78c77420d8ce972262951dfff00673c4c12f48e8480c0796867a1289e2fd8daa53174db90366fca74facf68498a5b957bb4796ff69887f6806c6d97f48a6cff0068447b44047dd8a639e494f8f4354ad19a0c3a083a6b0ea677287a9ccd84410cb02861544d23017520824c48a884023f0989c88911984993225a5ac489ea180854812d268d2ba62856cb290a0c0d37850d1a6265cc3d4e465d0d32834d0a6f700cda0cce48b28dafba149de5656d7d24ddb5f494493a6da7acb159b43e92807b4b6fa8bff088260c6568617f4956ff0039673c1030c0c8d23ac0962351b47a4dac6c0316b9d3a436018671e47e529d37bde3e16a59c1f190d5aa1a0d5db5f5802dbcb38e4b1f74a8617b0210910239323326595315bfa4aacb2f6216fe72b32da734dee6f0e0a7529095ea24be758274bcc246c8ce74956b61ef355e8caed4e654518788c24cfab86f09d454a52ad5c30e90b0393af85bca7570e46d3a6ad84f0946b61a6b0cad1128d9cfb2cb7c3b89d6a06f4dc81cd4eaa7cc4b15b0d2955a244e88e54ccdc5a3b3e15dafa4f65aa3d9b75dd0faee3d674b4aa822e0820ec46a0facf217025be1dc56b5037a6e6dcd4ea87d3ea25da24f580d240ce538576c293d96a8f64dd7743ebcbd674b4aa822e0820ec41b823ce30a0f18c606393102224696d08e845c1f4331f8c767e9575b6b4c804065d4004dc8ca76f4226cc50a28a181c19a14969aa82aa3534ee75e64aee3596296351b406f6dfafba1bcb4f281ad451fed28bfe25eebfbc6feb21d822dd22185b43d3ac9601156a136198ae53c8d85c81e1bcce5c2d406f4ea07fe17ee3fa36c618e348203a9561c9c58fbf9cc7d4b27c6f81d2a82e32a96656240b662b7d1ba83723d60e870e14107b1fba0f74b12186e54dfe0794b388e394a9d326b2d94697009d4e82c252e1fc568d62568d4cc40cd66b83979900f9c21d5df81b469e12b0670a0908e9989e794dacbe17befe066b0c465200e96139ce1887d9e637b9636fc8a72a8f70f899b6709ed0064366b6a3ac793626211788656ef75f49a0eeae845f46041f5169cee368d4519bd0dbeb0785e2846845a4ae0a68d31c0c8b52ce1a8952a435b30b8df6ef1e7cbe12ce13848a6cafed2ab1552352a035fef1000b9d2672768d0060cea0a0bb5cea01d8f9412f16673ede9b354a3909207e202c156fb9f0eb2d36438fa9d1d43b7bfd6220199184e2cadf6bba4df4d2e003cfc65ba58c076d6472555168538fac82d5930d1884444163c78058d6906846304d01a667f12e1c9554a30b83f03d44f3fe2dc2ab50637a8e179541a8b720d7d8cf4eb4156a4ac0ab0041dc1170672ea74b0ccb7e7d4d6191c4f25adedcfdf0c2dd07cef002b1a40b32b163a016bceff001fd92a6dad23ecf5be502e87d394861bb32a9bf7db72cdafb81d84f2a3ececbd5d2d2afd4e879e35f13cdbf61a95accf7d361b0d7a0921c36da0427c84f4e6e136e83d256adc30f2b5e7a31c2e2a8c6d3dcf3ba5822ac0b53245f506fa89638b5052d990594a8205ad63d27615306ea751f5129e2b0f98116dc7c6689051c2350f0826c3eb376b613c35958d0f087488caf61e124b859aab8627612ed0c15b5e7293a151cd623065594916b91f381e30a055b0e82751c4703a2b1eb393e2af7afea04de1ba6cce6a8e8783d10a9e3d7c67aa709aded2923f55d7cc68679b6169f744edbb1d5fb8d4ff0009cc3c8ef2daf22667c48e73fb421fbe5276cb14bdfda26189f66c075114cb269badf551b5b3190c32da56a66155a7a31471b6d9655a115a560d08a6558a8b21a481810d241a43186264098d791cd001490682264d6219650c3299569987531585165659c337ce51496683589f19ac1ee448bea751e461afb7e59515f68515369b23324e359643f77d25276d658a4da5bc62403ab438329e796299d2098504cfca414db5e86446f1c73898c2533afa49d03620f8c0831d5a3406a715bdefe533499778854d141df28bcce0667c44689132179290bcc64cd10c6330eb1de41a62cd5159d64184b150414c19aa059641a94b01645d626865074d60d925f64827a53268a335e9094ebe12f35da9c13a759207395f0b2856a1ca75356866df4f9ca188c1f410ea0397ab8495aa52b4e86b616d2954a1368e56b925c13318897387715ad40feedc81cd4eaa7fcbfa4955c2caaf4889d10c9e866e3476fc2bb6149ecb547b36ebba13e7cbd67494ea822e0820ec46def9e4044b7c3b8a56a06f4dc81f84eaa7d26a9d907ac031e729c2bb6149ecb547b36ebba1f5dc7ace9a9d404020820ec41b83e463a1a4162b46063c963224490aa6d95accbf85c661f1da463190f7191ad84a0eb97ec5feeb0cf4faf9ace6df85d4c26286207f74cd6671de408ff6ac576d40dface91a44315d891f23e63632382a8e39bb41568e2016763411b440743992febf49d67657b4871155c01902aa9504dd8df72474da50c7f08a55087ca11c1b865516cdd4a1d3a4adc1309570acef6f6b9cdcb8d5add083cbc254e6a4b8dc4ad1e965338be9a8d478cc0e27ec91b23544566d1412335ce82c0ca27b4f4a921776ca36235dff002ef39d7ad866ad53ec3fb45575bab66a65c8eba6a4e9e7338c6f72f82b62823d7f6149ead570e4333b6eb71754b10328d49f296285701fd8aabfb32c52cd5025dcbe70ec48df4b003a45c4387ad4a4cd4c05f648cd64fb445fbc0b0d6faebbcb7d98c096c22d4a875a6e6a53b6a4293628dd6facddb5d3667dcd7a18665b1249f1de5da78ccbb5e06962baa884f6c9f844e583d8d9a2e52e26a3724f9cb3478886d85a655d3a420a89cc5bcaf2c9a3792b78c28aa3acc04c5d31f8a59a7c4e98eb01346c7b411af28271153b08418a1d202e92d48b08215bc0c90ab0011123245c48de218cf2b3a4b0c60ed01a2ad4a52abe141e426932c1948a87672f8de14189d81bccefd8d54ea35f19d955c303e729d5c301b811d0ece5ce1efb096a870e3d3df36c5303602344d20463e3f86e64b123498789ecf5264636bb80483e205c4ecde9dc1f29428d0dc79c8aa29d339de18b9a8861ebe626cf66b1192b28e4c0a9fa4c8ece1b1ab47f0d46b7be69fb3b35c6841bcdd70d1cf246ff006b6c29a13fe27d0c52976cb117a1498737bffda629db817911b456c70181e2a8d60743d0feb3515a7108668e078a3d3d0f787cbca7262d5a6ea6632c5dd1d58935328e131a9505d4ebd39cb6ad3ad3462d50753080c006930626841af239a4498c22d809093bc086920d1340190c329950342a3c45596d1ad0f49b5129830a8df39712246829d479c397d252cdce1f35c7acdccc987bcb140efe62532369628b6fe9120649b7f587a4da4aeeda993a460803e78e0e8608348e7f9c1b0a0f9b485423d79743e12b7284a075827b8da08ef7d640991aba136f74886bc89b2a24c990679166909cd266b144d9e4498c5a4661266890e4c818f68c66765a1c4661186924bac0644890630b077bedb486303507be05a973de5d0bd231492d0cce65836a7341e940353914066d6c283b4cdc4612dca740eb06d4fac2c67295b0f2a54a13aac460afb4ccad85f096a542a39bab86959a9ce82ae1e54ab87f09b432fa90e2631497387713ad40de9b9039a9d54f9a992ab87959a95a754649f066d3476bc2fb634decb547b36fc5ba1f5dc4e929d50c0104107623506791b2cb380e255a81bd3723aaeea7cc195562b3d5af14e578676c29b596b0f667f10d50fd5674b4aa860194820ec41b83eb336ab928299131ef1a431a224481108640c96595b1d854acb96aa061d766fe69938cecfe72192abe8b94adc2332004052fb1d0f39b8645845bae029339cc2e1abd37a62b55654a7b0b59d8116b9be86dddbea6f69d3f01e0a8b4aa51f6b985425f41932d886b000f85e04936cba15fc245c7b8cd4ecae113da6848b03dcbe607cafa8f283936a896ab739a7c657a2c454a65d01ee9d9f2f2bf2334f05c528d4b052a1bf0b687cb59dae2704afa100f989ce715ec852a9a8194fbc4c69a0eb643237808bd9375130ea70dc6617fbb72ca3ee9ef2dbe92743b4aa3bb5a9b533d47797f512d6e3ea360e1cf5827c330e70b85c753a82e8eade475f74b37102acccb91d61e971075e72cbe1c1956ae08f58c0b74b8d30ded2d271b1cc4c27a44419368c291d40e294cc9ae2a99e7396cf1c39eb00a4755994ec64c24e669d73d65da78fb7380a8dab489132ffdaea3a9f287a5c441df4f0bc742a2d1582a880ef27fb42f58d98180d158e1d63ad11d2159620203236f09502d9a5cb4af596cd0038a5029e2ea9ffe5b9f2204dac552fbc264715a6463587274047981acdba1533531e02d2a2fccd11231bb518bfdc5243b8a8deeb4501dab40427998a7429b8aa45c1ec79d26c24c4514f15941e91b6a3433a3e0f8b671deb1b738a29d7a293dd19e45b1a8a64d628a77985128d1451850d1468a0244843538a28bb8fb065308b145291322d83dd87a0748a29d08c499309479f94514009543ac65631450282d3322228a431062741254f71e71451f71f627883acacc79c514cf272547812c1d47d6de11e29c93e0dd121224c514ca46a8988378a290b8193124768a2942236b9b748dced1e2993189a28a294c640c8958a292001960984514ce43431582a9481d088d1410cccc452009133eb208a294b8114eaa0956a5311452f1f227c14ea208168f14ee473b04c21705c4aad039a9395ea3753e60e91453440b93d2782631aad25a8d6b91adb697ef14539df2cd469068a2898c818c628a4b1a230f85ac52eea6c41b88a2978f9267c1dc507ccaac772a0c911145219995ead213178970aa5501cc82f6dc6914533901e7fc5f87a536ba66041d35fac1e0b8f5747099f3a9b7db1723d458c78a5c37127b9dc5172403d443831e2926e41a983ca02ae1d7a4514684ca7570ebd256aa96eb1a28020418c72e7a98a28ca0b4e1c2c514003511696e9d43d628a3422cad430c8d14507c889caf89dc4514108e57b463f7f4db9ea3d2d2de086f145263ef84f8317b4df77d634514eb638707ffd9, '', '1080090', 'approved');
INSERT INTO `rsm_rent` (`ownerID`, `adtype`, `flatno`, `flatsize`, `rooms`, `washrooms`, `address`, `price`, `flatimage`, `flatinfo`, `phoneno`, `Status`) VALUES
('asif@gmail.com', 'sells', '3b', 1200, 4, 2, 'daspara,boyra,khulna', 120000000, 0xffd8ffe000104a46494600010100000100010000ffdb00840009060712121215101212101515151015151515151515151515101515161615121515181d2820181a251b151521312125292b2e2e2e171f3338332d37282d2e2b010a0a0a0e0d0e1b10101b2d251f252d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2dffc000110801c402a603012200021101031101ffc4001b00000105010100000000000000000000000300010204050607ffc40047100002010204030505050505080301000301020003110412213105415106226171811391a1b1c132425272d114236292f007335382e11516244373a2b2c26383f1d2345417ffc4001b01000301010101010000000000000000000001020304050607ffc400351100020201030203060407010003000000000102110304213112411322510532617181d191a1b1f0141523334252c1e10682f1ffda000c03010002110311003f00f40e25d9116269b7a19c663b08c8c5586c6de13d6788d4b2fbcfb85e713535de72c357386670e524bf1669d1d4ace48198dda246aad468a8394d405cdb40abad8ceeaae0d0eea2557c0a794f463a98cb6664f134ec960aca800d8012f2b842589034f85a677ecf6d8910aa2dd0ceaf1e2d6c73bc52b33785a9a956ae2dc105db253045ad450e9ef373344ebbc7249de4b2ce696e74476d9146a0ca6dcb949a9965e983a1102f8623ecebe139ba9c59aa8a63ac2880468743358cd321c682289202308451344662b49011c09202301808e0496592020035a3a88e04908806024808e047b44035a3110804622265221147b45699b65a1c4908c049811a6263811ed1c08ad010d692023811ed01d8d68f68f68a2687686b456928f268085a2b49da2b44c01c52568d68876346b495a2b40646349456898c8da3da3811490b224489926306ed1d0591730c70f945cee79784960e8fdf6d86c3a993a86e6e6679255b171456f65e308a00dcc931b48d3a458c230eadd8395704ce27928de1a860efde7d4f4e421a861c2f9f5870268a29704b638115e385920b289b2224808f1ed001011e28e0402c40471108f0015a2023811c402c66d8f919e1a67ba30d0f94f0ead4cab15604104820f220ea2698cf9ff6e7f87d7fe108a29d760b19c3c70f64755f6f95bee9ce6afdc60df876e7356cf170e2591bb6952bdce4628eb6b8bed7d7cb9ceb7b5b8bc03d0a4b8655150117caa5484b6a1cf337b42c31e2528ca5d49576f5f91c8c52ff0003e1ff00b457a743365cec466b5ed604ede93a31d93c235434131dfbdcc5429a76ef8e57bf8456562d2e4c8baa35cd7296ff00538d8a6a9e0d96a57a556ad3a6d4549b37fcc23655f316f7c7e21c2052c2e1f1398935b3dd6d60a14d86bce164f813a6eb8fbd7ea64c51451988a28a2800a28a2800a28ad14005145140051451400f6eed0d4b5323ae9ef3fe939679bdda5a9f657c49f76939f733c18bbc9397abfd363f458af283682658568369dd0258322448848c44e983326886592511ed1013a119b11124047024d44c271699ac5827a00efef806a457c44be047cb32af42ca54da1d0c93e1c1db4304415dfdf2d646b921c2f80e24c41234289d1192664d512024ad12c9012806b4901240470202220495a3811ed100c044449da2b44c681111ad085646d32922d31093118092b41031c092023092b46215a3811ed1ed100d68ad1ed1ed18118f1ed15a003451e35a450c6b46b494510c8c69231ad1500d1ad1ed14063489324c60b78d441b198c951a3736f8f4124a92c65b0b75dff48e5515f105b91a8f7d06c36fd644e908b4e58a3440d4ea7e5e53050b76cd1ca8af4b065b56d3c25c4a606d26229b5195880928a28c07114788440211e2884403811c08808f00108a28e20033381a9906c428d4dc7a49b203bc4698360750360621ec49581171381fed230549592a820556d197f128fbe7a1e5e33bfd87a4f16e2bc41ebd56aae75276e4aa3651e13482dcf23daf9631c5d0d5b7c7c2bb87ecee052be229d1a8c555d88245af7b136179e803fb39c2ff00895ff997ff00e6798e1abb23ad45366560c0ff0010371f29ecbd9aed152c5a02081500efd327507991d57c65cace0f66474f92e1912bed6647ff00f38c2ff8988fe65fff00988ff67385ff0012bff32fff00cceca72ddb2ed4261e9b52460d5981000d7203f79ba780929b3d3cda6d2628394a2a8e1bb29482f12a68a6e16b54507a80ae019d0d1c5f0f1c408f635856f6ec339374f6a4917cb7daf38ae0bc40e1eba57cb98a126c4daf75237f59d0ff00be74c39aab80c38a97273937398fdefb32da3c7d367c718536979af757b6dc1a383c2b7b7e262b6477148366cba6aa4a900eddd2bee96b857064c4e0f03ed08ca9ed0e4bd8d462c72a0f71bce4b07da6a8ad897750ed894cac6f972ee0103c8fc206bf1e73470f455721c3b332b86d4b137bdada5a2a65c755852df7e76ffec9afc8e97b338c6afc42a7b5a6aa1285455a5945a9852a32dbaefac1700e2271f89a746b53a229d2cf515116c0e516553d40bccfa7dadb624e2c5050ed44d37b358331cbdfdb4365989c27893e1eaad6a76cca4e87620eea7c23a21eaa31715d56ba9b7b72b6afff000ecf03c4bf6f4c5d1ad4e905a7499e9955b142b7b0bfa7ce453862e3570159540008a55c28b0b5319b5e97b1fe613231ddadcd4ea53a387a544d5bfb575d59af7bf216bdcfbe5eeccf10fd93055aa1ab4af501f654c35dc54b152c472e47d22a36866c73928c9f52a76f8e1dae7f0fa999c4aa2e2f8884d0533885a42c00fdd860ba79ea7d66a768bb46d42ad4c253a18714907b30ac97fbbf6be3398a3c402520829a7b41585415bef8b6cbe57d66d627b5cb50135307866aa5329a86e6e2d6be5b7d63a39a19954bcd526eeebe7b7ef62f2637f60c0e1ead14a66a572cceeeb9b41f747f5c8cd7a583a478861aa8a6abedb08d5196c2c1edbdbaebf09c9f0ced384a230f5b0f4aba23164cc6c54ef6d8dc6b269daea9fb58c5b53539699a6b4c12aaa8795fd62a66f0d4e24a36f6f2ed5c572fea745c238b8c42e292a50c394c3a97a6a16c2ea5ac0ff2894388633f6be18f88a94e98a94ab2aa945cbdd2545bdcdf0981c2b8e9a3fb40c81bf6842a75b65b96d469afda90a1c68ae11f0792e1ea07cf7d458a9b5adfc3d79c2887ab528549f6927b77ff00132a28a2967947aaf1dab7aa474007d7eb32c984c657ccecdd589f4e52bde7cfe2d91fa456c39320d1ef06c676e3666d0f18c8de3de75c59932423c612404e8899b1c49ac88124b34448402480892194489624f829646b9060459618d1e92369cf2835c9aa927c155b0df874f0e522ac46845a5db44d4c1de674d7056cf902ad0a201a811b6be11254eb368e5f533943d0b2248482b420336bb3315a3c711ed001011ed1478988811224425a44899b2d11124246f26b20a2424808c24c4b448808ad1c478e806b4568f68ad001a2b47b468806b451e2800d145149686344445118a808c8b18ec6305e665a889b2016f08164808e165d50b91e98e7ee9284a742da986026128db3452a43524b42469202550ac51c468e22a01e388d250014711a4a00318e04424a26028a28f100d1c45108500f145142804db1f233c35beb3dc4cc37ecbe086a68a8ff00337eb2e32a3ccf68e8a7a9e9e96b6be7e8794c95372a6ea4823620d88f59e9bfec0c09fb34737e52e47bef6118765a81db0e8a3f89d89f703f595e223cdfe4b9bfd97e7f63806e378a2329c457b74f68dfaca04f39ea54fb1d85bdd92fe00903dd7bfc61bfdd3c1ff823f99bf5875a2a5ec8d44b992fc5fd8f278a7ac7fba783ff00047f337eb1bfdd3c1ff823f99bf5878889fe4b9bfd97e7f63ca22b4f553d94c1ff00823f99bf58dfeeae0ffc11fccdfac7e2217f25cdfecbf3fb1e5714f516ecb613fc11fccdfac1b766309fe10fe66fd61d683f92e6ff0065f9fd8f328ad3d21bb3585ff087bdbf5823d9dc37f843dedfac7d687fc9737fb2fcfec79e453d0876770dfe18f7b7eb36385f64306c999a883ae9ab6c3d61d42fe4d9bd57e7f63c96d14f5fafd90c10b01407f337eb193b1f82bff723f99bf58bad07f25cdfecbf3fb1e4314f65ff0073303fe00fe67fd60697643044ff00703f99bf5875a0fe4b9bfd97e7f63c8229eb589ec96081d288fe66fd6287888afe499bfd97e7f639b15818e1e6a8e02a45d5c8f3d60aa702aa36b3791fd67cc62d5636b63ec5aa2816837786ad8574fb4ac3d252ac67a18b226f666735b040d259a550d08af3d08b30658569670b94b00da02753d0759455a151a74c4c99bf8ce168a86a25546005ed7d7d26529835a9260cd22487487512bd332caca243242640778348658d8204d873cb583b4bcb1ca03b898cb127c171c95c942d2152883bcb9530a46dafce02d39e506b9368c93e0a6d4d97c44925596ad0752803aec7ac94dc781b498ead260ca8415df6eb0a8f358e44ccdc28b48b736109fb3374bf94ae8d3a2e1aa0f7fc3e3ce6b6a8cf7b39daed93ed696947fda2874066ff001ac307b9b781fa4e65785516398a0bf5d8fbc4e4d44a50aa36c552e4d0a06f2c0590c0e0820d09d76b9bda5d0936c71b8a6c994927b15f2c710f9631497d24d8311e3e58d68b71928a46f1c42c0515a3c51011cb1a4e3110021147222801132264b7920b2d449b20ab25692021a9d1eb1f000a9d226595a604947b486343011e2b45150c423c5144028e228f0285251a388a80711e34711500e24a463de003c504d5d4731e4353ee11bda31d94fae9feb000d1af05918ee40f21f53074b04a402d998dbef1247bb6f844326d8c4daf73d17bc7dc237b573f652de2c401ee1732ca53034000f2d24a022a7b073f69ede082df137925c0a6e4663d58e6f9cb368ad10110b1c0928f68011b45692b4568011b46224ed1888010b48910968c4400aec20d84b2eb04c23432abac03096dc4aeeb188822ce930699514787c4eb3070a97603a913a331b13e4ad50dda4e90d64009571dc4d69f746adf2896e3669995289d7d61708494527722e7d656a4dafac4c488e34f7a291c69ef4513345c1cee0b17a0f77ba6952c5ce730cd6bf9cbc9527c94b034f63baecdb3890779c27f68b887a7ecde890ba90da0b1d88b8f7ce98559caf6f45e886fc2e3dc6e26fa18b5a9837c5feaa8e6d52ac4e8e76871da99955954861b8d35e92d2768296cd997cc5c7bc4e6d6a7d93d0ca9c4b56b78fd27d7bc513c8866c974d9dfe1b88d27fb3510f803acb8b52797d26cacbf987ce1713c42b53a8deceab8198d85ee3dc652c7e86cb35ba68f524a90aaf3cd709dadaeba3047f4ca7de3f49b983ed8d33f6d1d7c45987eb2ba248aea476b49a5c59cf6038c51a9972b8ef6c0dc13e866f234ce59129532d46d59692196090432882ca83a09ac22c8812604b5325a26b19e986dc7eb109311ecc453a985236d7e705344c155a77dc4c65893e0d2391f7291594aae1edf64dbc394d36a246dacacf39a78df7368c8a8b9c743eb377806388bd361beabe7cc4cb510b4f4208dc451b4f9d8249346d684ebb19cfe22894a856f6037bfcc4de53717f094f8928367b6a343e226fa987546d7631c4ea54c053c408415440fb053c846fd98788f599acb25d8d1e389683c57957d81e4d1b2b8e60c6b3faa1785e8cb71659543b8e51ff683cc194b3c43c3658cb114821891242b08fc48b25c5a2568ad17b4115e3d85b8d68a393205a52416226305bc92a426597544dd90cb24a97845a70a044320a9693023c51500a2b478a201ad1e28a0315a3495a2b45431808f15e08e217977bf28bfca200c238800ce76503c58fd07eb25ec09fb4e7c87747ebf180137a806e40f39115eff006431f4b0f7993a74146c079ee7de616218101cfe15f2d4fe91ff00671f78b3799d3dc34868f246456981b003cb492b452568980d68d48683c84946a7b0f21100f1e211e301ad1e3c5688051451e0034568f1ed00231495a2b4008da31124446220009842fecc00bb1906907279c00aae20584b4c201c4a00dc329f7c780266bd53a4a3c2d6c19bd3eb28718e2bf717ff00d8d2b10fc578ae5ee21d799fd26361417700ea5881ef956a3cd2eced3cd581e4a09f5d87ce6b49225b3aeb5879099749b5f5facd3a9b1f299348ebebf59cf22e24f1c7bd148e37ed478148e2d4eb2dd2329896694f19c4eb4cb20cc5ed5d2cd86a9e097f76b360194f8ad3cd4dd7aa30f7822425d3252f46bf52722ea835f03c9036e3c60b881ef08e4d8c8e3fee9f29f5a91e17740d8ea3f30f9c2635740dd4b1ff00b8c0563f396f102f450f9ffe465450dba6994298d61298b8f53f38a90d64e88d3faeb29229c8dae16ffbca03a32ffe579ebf56ae6005f51b74274d0f8693c77820cd88a43ff957e1afd27a8e2ea950ac07df5f713acf07dad85bcf09c5f099e86969e269fafd8eae950a6d6d2d717d0f3f28ff00ecefc2c3d651a58bd45bfae52e52c4f8f39e3ad5e4849a9766743c76ad09b06e395fca08adb43a4d1189da13da8d277c35cbd4c9c3d51956920268bd243cbdd20d831c8ceb86b533370452920218e11874306c846ea675c7511910f188011aa61d1b711ae7a49027c26dd49914d10ff65d3b69987ac19e1a3931f74b99b4df5f848dbc4fbe4f4447d52f53271958d33ecd4b123536161af899428e36b13664baf81bfc2746d8643b8f8caf5302bc8098cb1646f6952f43453877451c355fba77e436bcb590f4313608f9f87ffbb4277b9ab7ce11c4ebcc3735d81da2b49339e87d4481a87a08fc1f462f107cb16491f6dd57e324b5478c4f0c87e2219a90e820ce1c7496748f9243c2fd0a5917a945b0dd09f7c1b5361b34d12920d4a43c74575599356ad41d0cb784048b9de3e268e92d50a56026b853be489b5420b0aa969251253a0c48c404945018d68888f22ee06e40800f1ed05ed6fb027e03e311573cc2f90cc7e368980581a98951a5c5fa0d4fb845fb303f68b3799d3dc3485ca00b0000b8db4886901f6ce7eca1f362147d4fc237b2a87770be0abffb37e92cc4221815c22f319bf312df3da1c08a2022024228a280128a28a218e23c51c49188478a3888042353d879478d4f61e510128f1a388008478a2800a388ad1e0028a28a0028a28a0029132518c008190610a0758aa3df68c0ab504aec259aa6db903ce53ab8da2bf6aa2fa6bf2858f901c431cc8a10680dccc477265de27c5283808a58b66d0dac3c44ce33783d896a8726741d97a76567ea40f41bfce73b3ade0f4f2d241d45cf99d62c8f6252dcd6ac7bbe932d477bd65fc69ee4cd15906b984e79334885c60ef45058bc42dee228e8671aa7696e9095576f596e8cf32b63a42881c56d0f03891a199ce3b01e398e5cb5197a5461ee2647122e13d25fed2d1cb89a83ad4bfa3007ea653ac3babe0f3ea30bea827f047832f2ba29d7972a1fdc53f5f9981c6ada58cbfb843e27e666c96e272f2af995290d64e86dfd758d4c6b2543ecff005d634b71b66cf64fff00f2e8ff00d4ff00d4cf50c5a587a19e6fd8ba77c5d3f363ff00619e9f88a64a39e897f8cf3f5787af22f91dd866a3888d062025f7b196a957f9c86047b44cc395afe64030ab40f49e6e5d0f53ba3a219d2d8b2311b43fed1b4a6689922a6714fd9ed366cb3265d388df5855c4e8265d42758ecc6c3ca73bd24d4b62baa2cdafda6156bcc46a86d08b5cdc4be9cb064f4459aed94ee048be1d7912267bd6865afafa4a8e7c91da8978fe21bf663c889034d872324b88d64d311a99d30d6c96cc878fe0063cb7ed01ded17b2533ae1ab52ee66e08a9224cb6d86e8602a61d878cdd6a12e49f0c1de0dcc93a91b832bd569b432c6444a0d0e6d1ac3a401a917b59bd11b870821160e962ac0ae9ac75690dd0e8308f22b08b489d84ca5962b965a8306c244985ab488de55aec46d69cff00c6e2eae95bbf81a2c526ac289294b0b5d98dad6d4f8ed2e7b21cf5f3d67463c919c7a91128b4e99135472d7cb58aedd00f33f41fac2c52c5407d913bb13e5a0f86bf1934a406c079c9c513015a28a23100d19fea3e72519fea3e701a108f108a218a3c68e2201e28a3880d0f1c46b4901258c51c4568f100a3c5144021120d047119761100f1c4568f0014423c154c522eeebef80068a51a9c5a90e64f9095ea71d5fba84f998ac74cd68ad39fa9c72a1d828f8cab5389d53f7cfa690b2ba19d5edbc0d4c6535ddd7df3917aac776260898ac7e19d455e35487327c84a957b423eea1f5339f2f20d521d452c68d7abc7aa9d828f4bfce51afc52a9dea37a69f2941eac03d58ba87d083d6ae4ee49952a55837a92bbbc5d4550f52beb7f19b745c32861cc0339aaad35b80d7ba943c8dc791ff59ae2924e8cb2adacd5a697217a903df3afa5a58794e6785a5ea03d359d1523a89a4cc51771e7b9383c7d7b0369dbf136b533e47e53cf3166fef8a2acb5b23a307babf947ca28c3ecafe51f28d00308197294a2db4bd40e93ce94763a130e242aed08241c4c9a28f33eddd0b570df8a98f7a923f498d88fb3eb79d576fe8e94dba332fbc5c7ca72757ec0f213ded03bc11fdf0789a9db2bf992e249a03e03e50aa3fe1c7831f9c8e285e92b787ca3d03fb81f99be40ced5c9cf7e5fa95506a64e97d9b78fd6301bf9884a63e7ff00b4aa1d9d1f61d7fe297c15cfc2d3d271556c8c07decabefbcf3aec28ff008a1ff4dfe93d1f1147323f55b30f317d272e65fd4fa1d78dff00497efb9678261f2532a77056fe769ac89b4c4e078bcd4998ee0a66f88bcdaa753699b45261929037b8e50630e3a7387a550598f41ac545c1f7cc8b02fc381d8ef02705f0369ae9ca096df199eddd156cccfd88f3120f86226d32ed2253489c62f943ea68c5f604c45089b694c7481a98604ccde1832d64919c88645d8de6a52a232995df0d717912d2c194b332aa56d079c32e22d07570c41b41d4a444e59689a5b1a2ca9f25d5c44854c558ca563075af7f49cf2d34eaaca4e06a2e2e66f13c40e96ee13a7869efb91166b7b84cce26e495f12e3cad6607e134c18723ca937b1195c541b47109db3ac8e52a22359c8d2ea7436f2e53428f6d691fb6190fa37ca729da45b629cf57bfbecdf599eee6de4c47a4fa6f0d51e5ac8fd4f4fe1bda1a559b2d36cc6c09d0e9736d674983208bb5e797f6190fb5a83a05f999e8f876d3ddf39f35ed4fe2565e9c72a47ada75078edadcdea2546c24ea5799b4eac9bb5e638f16592a6c6d450f8aa84da05a4981d0c6cb3bf169d42266f26f40387a77bd4cd165b68653c3a59bd4cb6676618f4c68ca6edd8d1478a6a48d1478808980d1478c22043c8bedea3e72522fb4450f14568f6880568f147580080921189104d8a41bb2fbeff289b1a0e24a507e26836b9f4836e2dd17de7f49168aa66a45698edc46a1db28f4817c4b9dd9be5f28ba83a59bc481b903ce05f174c6ec3e7f2982c6fbeb1a2b2ba4d97e294c6d98fa7eb0278c0e4a7d4cca3224c563e9468d4e32fc9547c6567e2354fdf23cb495498d78ac29127a8c77663e660cc44c893159687bc626130b88086e555b4d8dede7058aae19af95574d945847b502e462d225a0cbc83549365052d06cd04d560daac430acf04cf04d5bc47c205f103a8800676816302d8b1e3ee95ea633c0c02cb0e605a566c59e83e304d8a6f0f740458710dc35ca540791d0f91998d5dba9f9485cf327df2e2d264cadaa3d33832fda6f21f59b140ea263767c9f614c9dd96e7d7ffc9af863ace867320dc69ad45bf2fce709545d80f19daf1e6fdc9f4f9ce430e97aaa3f887cc42053e0dcc469a45238d3afac500301b69730db4a96d25bc3ed3867c1d08b424489258cd3168b391edcd3bd027f0ba9fa7d670805e9f95fdd3d27b574b351a83ff8d8fb85fe93cda8fd861e3f49ee683fb0bebfa9e26b3fbafe84af7a23c18892c29bd123ff0093e91b082f4dc78dfe022c20ee38e8c0fce76c4e67dc81ff00d87ca113ff006ffda0efa81e30abff00bfd6682ec753d825be27ff00adbe6b3d15cfeeea9e8a3e3713cf7fb3e1ff00127fe937c5967a40a5992a8eaa35f7ce4cbfdc3b21b625f5fd41f06c2e5a6f4fa14bf893a9f9cd84a3b7c262f662b16a6d7dc585fadb69d0d1d84ca6da2d0a8d2396a0eba48d0a676b7396a9fde8a97d663d5c9a7a04a7b0f294e8ec3cfeb2fda4028b484ca68763b48254b8bc2b2ed22298b5a4ec3a62a6d788b0cd68912c64590e6063dac3b135da440d249069eb2206862019d606b5310ac4e9e507897b09689643d80806a02e25b47fa4167178e82ca9ec264716a0472d981f316ef0f709d0023e332b8fd4b7a1d0f42d75bfb8995082ea232c9f4b3cafb774c0c4961b364616e847fa4c5c9727c759d37f687860a52db0a617f94b6bff0074e770e351e207c6ff00a4f471af2aa38a6e9bb36fb1ce457a96fc0bf39e8f4134f74f37ec57f7eff947fe53d4292fd3e538353854a7677e1cad4120b493e72d25291a625aa7bccd638c4a736c09a5ac6ac96862da983c436bfd748df00b90257bc3fae52c1482abf687a7ca141898d3d88948d964ef226b01b9115b1ec35a34638a5ebee102f8c1c818ba828347b4a4d8b3e0205f12dd7e9175a1a8b34e0aad5503ed2fbc4ca7727727df0464f885f49acf8f41cc9f2100dc4c7253eb33d811b8b419690f214a0688e20c7f08f4bfce109623ed37bedf299945b59a66aa8138b3ea5c7b9a4608a15bc49f9c15e4b10e0981f6825e3cb68a710a24d65635e30ade335eb44f49a8942e99eebe448bfba56bc7526d22587323df2ac81462640d65ebf0320d885e87e126c741098366837afd00f7c1b563d07ba0d949042f18bcaed50f5f948dbc4c5d43a0e6a8f0836c40ea20bd9c629e106c626c48f1f741b623a03245446517e926d8c0b566e9206a34b0cb20562b632b927a983653d4cb2cbe120d0b02a9a522c92c3083643d23b02bb2c1309618413c6988aec20c8856836063b02064a9d32c428dc900799368c44d1ece50cf884e8a731ff2ebf3b4a8eec89ecacefe8530aaaa365503dc2d2de1b795434b1863aceb7c1cc86ed037eec0ead39fe1a97acbe173f09b5da06d14789333383afef09e8a625c14f80f8f3ac521c40f7a3c7633246c443d0fac00e62170ed38a4b6358f25b531cc8ac79851a197c629dc5badc7bc113caa8ad9990f236f769f49eb5c5bec83e22798716a593135075624791ef7d67b7a0fecfd59e46b97f56fe055c0eeebd449e0c6953d3eb218636a96ea0fce5ac3a779c7f083f19dd1470c8a67edac3d2173fe7fac83afef00f01f332785dffce7eb2c57b1d8ff006729fbea87a5351ef6ff0049df39fdd56fc9f5338afeced3fbc6fc4c07f2ff00fb3bb6b7b37079ad8ff34e49db9bfa1deb6c6be44782a801946c02dbc6ea093ef266e50d87ace6fb2cc7d91bfa7e5d6d3752b9b2dbf0b1f9da65913b1c4bebf7bfae51a973f382c256ccac4fafba0b0f8925edcb35bfd661d2f734be0d1e522220fbf8411ac2e0795fd7690932db2c451830313301bc92878a28a003c631e280c8b083ac808d61233468868825312bb52d7faeb2d53fa41f3f49498bb14fd89d3ce50e3600537db98ea2c76f5b4d86dbd66671cc3e61bdae72dfa1dc1f2b89b637e6dccf27bacf3cede513ec2996fb4058fc08f84e4b0aba8f21f31faced7b6af9f0aafccd400f985379c661790f3f858cf4b0ad8e0caf7dbf7b1b5d871ff14c3f80fc184f5151f213cbbb0fff00f967f23ffe53d4a989cd9e3e63af0cbca1e90da5ca49ac05112e5313926e8d90114b531b134edfd7843a8d4c862c7f5e926f728a98ad0fa7d250a98aa9e1e93431835f4fa4ce6132cd26aa8d7124f900f896e77f7c81c442b2413539c72cb3f53a142237ed1226bc8b53817a73279d94a083fb691356562a7ac131224ff103f0cb156b417ed3699dc431ab4c02e42826c09eb331fb43407dfbf9027e921ea4a58ce9ab6359b5249f382359a735fef3d21b2b9f403eb0d47b582fa51bf9b7e827366d6cd70acb588e970a49617eb3a74c225af61b4e4b86768dea10b4e952cc741a5cdfd4cea13156fefb1280fe15ca00f0b8138b1ca5a89372bf96d4beada16583823178861dc9eea9f412854a4e370479e936b8d9ca3fbd7b11717244f3fe2f52e4dd89f59c9a6d464c5278ededebff008dfea742875c7a8d6c463d57ed5441e6c266e238ed2ff101f2b99ccd60204a7819eac7512adccde347a9d24ba8f21f292f672786a5dc5fcabf2109ec8cf59707295cd388d3967d99eb199257602b324194965841342c607246cb085bc240bc940472c6cb1cd4f291350c36189924720917a87ac1e78b60086d22cd2058c8b3c06397836790630152a81b9023dc0317832f2a1c6d31ff00313f984b05a0ed02645da058c21304c64f50036304c615841112930064ce8bb1947bd52a740147aea7e4273c44ecfb2d472d007f1316f4d00f94df0ab918e5e0d99670e655bcb140cea68c0abc71b55f280e06bab9f011f8cb77bd049f051dc63d5a496fb15f1e7bd1407127d7d628e80a83ed4250de408ef49d2de72496c6b12dac791125306688a5c547eec9f11f39e79db2a396b254fc54edeab71f2b4f47e243f74de5389ed8d0cd87471f71c7b88ff49eb681ff0049fcff00e1e66ba372b3946d1d0ff5a89a343fbd3e29f599d5fec2b78acbd44f7d4f553f29e9c393cb971f891c427ef0797d60709bff0098fd65aadf6bd0caf861a0f33f29ac91117b1e8dd83c3da886fc458fc6df49d6e4bad5fc82def339fec8d22b41072cabef2331f9ce9a810438f017f2cd3cfdedb7ea7ab3da292f403c0e98c8e46c48cb6db2e4169ad4a85d57a80c3df7995d98a645120f5f768481ee337286cbe466595eec5143e1b0f9558786fe90387c377b3788f7cbabcffae5214bea263d4f734ae09b29b1958d037b8f0974c692a4d14d6e0d575bf846c48da1e3c9bdcaad805226e7a5842de3da2b41b1d0f1a3c510c85f4830fa7a435a0fd9e91aa21a6416afd2085619bd2152903ee103ec35f49a2a16e49d85ade33378e9269365dcedd493c878daf2fd6a06f799fc5815a4cdf8487f55d47ca698ead1965f759c676c32b61972fd92c2de1dc7d3cef382a5ba1ead6f78ff0049e85da7c364c35317be675727f89d589b784f3d6d003f86a0f9913d4c1eefd4e0cbef6fe86ff6207fc59fcaff0039ea69fa4f31ec42ff00c59fc953e627a6d31afba61a8f78e9d3fb85ca1ca5ba6759570eba4b689acf3e6752121d4c1635ac216926a64714971217257629e2cfcbe928113471ab6f74cd99e6ec6b8bb9022418429902271491d0809106cb0ec20da61345a65765807596d841389cb3344723db65fdd27fd4ff00d4ce415276ddb64fdd27fd5ffd4ce3d57ca733746b15b1154f285a5fd691803d63e6b6e643dcb357058a2ba8241f0d26b3f6902007d90671b1165f2274d4ce58571e70eb98ec8de8a666a0e32b0938c95336db8d3551773adc9d4ded73b5f9ccdc4d5bc051f68c6c88c4efa01b40e2f16d4d823a904f2d34322187cde5fc2ca73a54c838bf2318a9b5ac6197103a1917c50e866be6f4259ea1865ee2fe45f9093cb1b0c7b8bf917e4216d3e823c1c00ed19a12d0354caa114f88e3e9d15cd51b28bdaf6275e9a0994fda8c30d9d8f9237d650ede31f600f4acbf269c31aa7ace98628b56c894da7b1dfbf6ae872150ff00940f99959fb594f952a87cca89c29ae7a990358f595e0c05d72676cfdade947dee3f495dfb5753953a63cd899c71aa6419e358a1e82727ea75afdabadffc23d09f9995ea769eb1ff009a83c917f49cbe78ccf0e882ec2527ea744dda3ad6b7b63fcab7f7da547e2d50ff00cdabfcc44c5cd094a3a88fea5eab8a277673e6c7f5951f103a7c64aa4ad696896130f88bd441dd1df51e3bcf44cc679e60680f68adcf3afcfa4ef4319c7ac4d346b87b87bc8911031da721b9065826585306c268840c2f2eb3d13094b222a0fbaa07b84e238451cf5a9af2cc09f25d7e93bb9dba75b3673e57bd0f2c61e5696284dd99195c5aa77ccbbc305a9799332b1ed776fcc66be145a92f94cacd64b831789b77a290c7fdb8a696493a8bae9101afac96237f488ef39245c43ac9812292604c68d406356f4dff0021f94e578a53cf85a83a2dfddafeb3b0aebdc61fc27e4672ea99a9baf5461ef13bf46fa60fe68e4d546ff03ceed7a6474fa4b7877d50f80f94ac9bb2fafebf593c3b7713c0dbdda4f611e2f62fe337f4301875bd97f30f7e9f593c59d2fe10dc1a9e6ad4d7f8be19bfd26d26678b7691eb3c3280a688a3fab0025ea084676e472ffe529e0b4083c3eb2ee1ea024aff0010f75ccf35707ab377b85ecf1bd363d5afef5135f0fb2facc7ece8cb488fe323d6c2ff001bcbbc36a9b28bdc6befb1d267915b6117c1a7074beb29e22b90c75d003f28b0d54955f123e932e8756575234cc681c5d42a079dbd2030d5c9fe6b7a7590a2dab2db574684518c806d241a5848a0aa54b0bc777b0bc742b09146062bc431e346cd1b3405624fa41f3f48a9d507d2445417f7cba64593a83433378b1ee0bdb5741aec45fbc0f85af3459c10666717406993f87bc47f06cd6f1b1978d799599e5f759c876869ff00c22b6b97f68fdddf714b50a3e3380af4b4a9e77facf46ed1393837a4da9a35516e39adc653e07c2701587dbf15bfd27b5a65707f3679599d497c8dbec22df167fe99f8959e9d4d759e73d834ff008a3ff4c7baeb3d201d6726af69d7c0edd36f04cb5404b2b2b5032cab4f365c9d711246ac34f58a9b6a63567e51772fb1571ff49953531c6658919b845e2ee319192323392474220d06d0a609a63245a20609a10c834e49a2d1cd76d97f72bff547fe2d38d5a7e73b4eda8fdc2ffd51f269c5a95f09c73e4de1c12f66bfd190a996e2d6dc7ce396581c430b691479dca9707a56129a5c580b1e804b18a7011b51b1e7e1313b3f59886bb5ec45bc2f79cfd1c1d4a3558bab58b13a0bf7492797a4f3b0fb3e39e593cfbc69c556f2dfe7d97cc53cb4e36b67cfc0b9c0aa65662540eed8586a4dfec8eb39fed0b39ae0b2956cc7bbd0585a7455d18d2a6c9b824eba759cc71a661554bea73723e027b4b4b0c591bbb957e55e8613d44f2ceeaa25b4bdbecfca45ff002fc630a86db7c645dcf41396b73a4f58c30ee27e45ff00c4425a0f0bf613fe9aff00e2216d3dd8f070591b40d612c5a06b89a24856729db05bd017d7f78bf233cf715a311e33d0bb6247b1034d6a8f919e778dfb4de667a18d7f49339dbf3812640b462d065a665042623201a4ef26e85c90906324e60498dee344ef0d44caa0cb144c96058a9b4042d43020cdf1a2645cc22f7d3f3afcc4ed967178417ab4ff003afce766b393da1ef25f035d3f0c3a889a32c46711d045a40c9b08269a262373b2b46eecff00856dea4ffa4e9c998dd98a396966e6cc4fa0d07d66c4f4712a823926ee4c787a6657842d607c8cb24c4aa6e7d66e916403f844c14d5879cdeae7bb3083b3799cf62cf7cc690ac7527c629a51341ab72841ca0eaf2844d84c5a1a2d24208348413168d0761a1f23f29cbe1f43eb3aa1395d98f99f9cdf1ba8b329ab923cff0088d3c95d874a8ebe84dc4052fb2474a87e77facd2ed325b1153cd5be00feb3301fef3d0fbc7fa4f671cae29fef83c39c6a4d7a7dcd1c48eefba68f642906c4a03b0049f8ccda87ba3d0cdfec152bd766e88a3de6ff0049be67e5274cbce7a3d3517b0e421f0c9624f53f2b995a8f33e32d618dfe3f29c096c77c987e014c1a42db1a8587ad8cd1c0e1c017f13f5953b3c07b15b6d99ade40dbe934b0db7f9cfd66191eeca82e08d5c303763d3e91a8d216b7422587d8f94150da676e8aadc2d7a41858f590a7440dbafd619a457eb253745b5b932244249c524aa05569dc5a3b25c5a1228ec2865115a3c510c8658b2e96938d1d8a8af4a8d89f1bc614b5f7c32feb189d7df2ad91408d13623accbe308decf4db3267b7e00c335fc26d9da66715af92939deea5479b682fef9a6293ea467952e96733c4a986c0e210fdb566671ccb060c1bc41005a79dd517f5561f0d27a82e1fda52c4b74a66801cec896b9f1379e62a36f03f3044f6348f692f8ffc3cad47317f03a3fecfc5f107c6881ebdd9e88699b89c0ff66e97c41f0a7f2227a211ace4d63acbf43b74bfda4128a7ca594582a50eb3ce933b22429a6a6356a77d611627937b955b1471c26509af8e132049cbc22f177119132522672be4dd11306d0860da6522d026836308f02c673c9168e7fb67fdc0ff00a8bf2338a566e87dd3b4ed83da87ff0062fd671eb54f4f94e0cbc9d10e08e563f74c0e2299b1d2da75967da1e90588624116e5338b765cb83a8e15856c35465cc0ab5356076dae0e876d65bc56369837cebf399b8bed0506a469d9b314b5ec37fe84c3f6cac2d71ee9e869347a6591e594f77dab7afb9c79726592aa3a8a38a4aa722bb29d4dc01b0f31391ed62915d4662daee6d7d874d21d712ab7d4dcf84cce21df65cbaf7ae4fa4e9d5654a4a107e5aefebbfc058716dd72e6f82d2e6f0f7c8bb37849a83d448b03e13c83b4f5bc2ff769ff004d7ff110b7305843fbb4ff00a6bff8884bf8cf723c1c142d606b4313e30158ca0390edea9fd9ff00fb5679e577bebd67a576bdc0a2336d9f9f94f32aa749e843fb69fef939a4fcc04c8349983790f92860d241e0ed22626c023bc1131898d1089acb14655496a8c0a0d54c12c956306a66d06448b9c35bf7f4ff00389dca4e0b8403ede9ebf7e77a8270ebdf9d1be0e186531c98ca0c720ce44cd9a22c60d8c234370fc3e7aa8bfc409f21a99a4537b12dd2b3aec151c94d57a28f7db5863118b2cf592a38c68f5dac87ca4956071addc3264e931c55b450c1addc79cd6c63594f94cce1c3bf2ef136ee1f4986336c9c984e628cc358a5d88b55beb269b48d7fac9e1d6e266f912e0b34e1041ac9899335411672d881663f98fce750b39cc7ad9dbf319517b325f28e3bb594ed5d5b93521ef0587cad3047da23f83e46753db04d293f8b2fbc5fe86730ff006bfcadf2bfd27afa495e2478baa8d6665e63dc1e93aefece698fde31fc400f403f59c713dc1e6b3bdec2d1cb86cdf8998ffdc7f49d5a87e52748bccd9d650da59a8722661b8a6cdf032953b897314c3d9ea3fe57f4271a3aa5c1a1c00de8ad858677ff00c8cd0a1ffb999fc09bf74b7e6335ff0031b99730e753ff0054fca73e4f79971ec59274f480a0e2d6beb054c9b30f0329e16f9afafdaf80b414366272dcda73f3910df3b7ade46bec7d204a9ee1fe317f7ef334b6346f72ec62632c55363e520bec3de2bc8d21a0bc891b79fc23a0b097881884801ac4161235e23188d4180100dafa990f682f1f27fe5f483344df7e72d511b8776b09471590a387fb391afe03acbb512e04cfc5e0bda2bd3bdb3215bfa6f2a15dd933b31783963505bef61ef57a137ee37e62b62679e716c3fb3af513f0d53eebdc7c27a0709c47b3aa0117cee28541d2b20b065eaa44e7bfb40c0e5acb540d1d729e9986df0f94f5b4d2e9cd5ea8f2f347ab15aecc27f66c3fe21fc299f9813bd77173387fecce95eb556e896f791fa4ee6ad1d4ce6d6b5e3bf923ab4b7e120d49b69615b595e926821d5759c123ae23a36a7ce3b191a6ba98ec24f734ec55c5b5c5e63acd7c52596de332164e5e1158bb88c632568d39a46c88182785304f329234401ccaee61aa1956a34c5a2d183db16fdc7ff62fd671cae7c275bdaf3fb8ff00ec5face3d1bc670e65e63a20f60cae7c3dd27ea20c29eb2414f59cccd4453cbdd09493fab48e53626fb5be768f4c18d5aa6086aa9e5ee83cbe524ec6fbc6cbe31b6ef7016be106e4f849e4f1f84838f1f84112cf58c293ecd3f22ffe221403d24309fdda7fd35f9087067b91e11c00ec7a083aa259cd20e2f181c37f6820fb051ffca3e467035321d067b5b7b5fbdcfd27b3710e1e95059d430bdf500ebea265d5e0143fc25fe54fd275c3325149a3278edd9e4c517f10f5b890347a15f7ff00a4f547ecfd0ff0d7f957f4816ecdd0ff000d7f957f48de65e83f09fa9e5e70e7a0f788e9836621428b9eaca07bccf4c3d99c3ff86bfca3f4826ecce1ff00c25fe51178cbd05e13f53ceb13c35e9ae6655b7854463d760652d3a37f5e93d3cf6630e36a607a463d9ba3f87e7fac97955f05784fd4f3345fe17f4fff0025aa2416b00c07f11171ee13be7ecc503f77ff002fd644766680d900f43fac3c541e1b380c4d5506c2e6083ff5a4efaa765a81fba3fee1ff00b40b765287e1ff00cbf596b3242789b397ecf2e6af4f4d0313f033d013ca66f0fece52a75054506ea7ab1e56e67c66efb2f09c9a897892b46b8e3d3c8107c235e1f279c8151e33051346c0b4b7c0ea65ae9e371ef12b1592a0f95d5ba303ee33683a69912569a3b6b4568f78a7a4710d695388fd9f59704a3c48ed32caea2cd312b9221c306b793e2cda0f3f947e1a3495f8cbea07813ef99c1f96cda4bcc504de28f87d6f14da2b63397258afcfd24b04fb8eb1ab8dfca0b0f21aa625c1a00c9080a30c26325b9b2e022cc2e28bdf266e0991c546a60bb89f2731da95be1f37e1aaa7df75ff00da71d546a3d7e4676dda05be16b75097fe520fd2714c6e01bf433d2f67bbc6d7c4f2b5d1ac898766ee2f98f9133d4fb3147261a92db5c809f74f2b099bd9a7e2703e169ec1805b281d05a76677748cf4aa94997d1613881ee9b5bee0f7b7ff00b0497b8b45c48f708ea47bb417ff00b8cc626b236f83530b453f2fc2f2de186a7fea1f948d14caaaa39281f08f863de3f9cfca7249ddb345c8665001f2305855196f6e661ea6c7c8c0618f73d4c95c14f92cb8d2453ebf5926da469edebf593d8a7c858a28a49628a308f002224a414eb27062428c63c89300644efeb18ef199f5b79445b5954430836815de111c1102ae337ac69720fb1cbd3434f1088e2cdfb43b2923bb516a585c1fc43a42f6d707ed28b81ab277c73375dfe179b98ec18ac00b9529503823a83b4e27b55c3ebd5adec92be4a6141b1045c93624b29d6da4edc52eb9a95d3471ce3d1171ab4cb9fd97a7eeeab732e078d809d7d5e7e738aec0609b0d88af41c82c1148617b105b422fadb5f84ebdeb6a7ccc5aa5799c977afd0bd3ed8927d8b54e144ad49f41e70eadace3923a22c92ef1da450ea63b993dcbec57c6ed3144dbc66d31409393dd45e3e599b538ed01bd41bdbd7a4d006621eccd3e6cdf6b37aebfacdc0b61395d9bec3181710c64184865228d7369419e58e32ec8a08476b9b594026613636a7ffebd7f546fa0333716559875f0cd501aa72e5359d6e4b3586736256f6be800f395388602c8ad97296a45c1fb3aaea7bbd3eb6eb278318ba79d4238466cc55d1f2dc35c11a686f695b16d5b20423bbdeb019af724137cdaefacf4238e5e326a6ba7d3ee67d71e8ae9dca98537506fcbac3dbce52c2232ad8a9963daa8176d3d09f909f373c72527b1dea4a8b94d29b2dace4d88b82df68fd9d8d8588f1bc0d206d6cc4db4bc618b0a8543b056b136047f46d78c2bd102cae0f858fcc472849a4a9fe028c95f2448d77921e72b9adaf3840e3a999b8b2ec2127ac1b988b8eb205869adf5eb35c1865966a0bb9339a8ab3d7f083f769b7f76bff888703ca0308ddc4fc8beeb087bcf59707092023e51231c4a1917a6206ad116961a0ea8d23b1229fb212268c310231111400d1913461c88c44405634247d8cb0c246050034a0dd3c2593a4630029b2784132784bc60dedd200530be119a586b419f5936c0ae5e4098732040e915800bc8930f6f09123c22b6075780a99a9a37f08f781686bccee04f7a56e8c47c8cd013d383b8a671c9531c4a1c47703c26bd3c0d422f94dbc74995c42990e41d08b4c752ea06b817982e04693278bd4fde1f0026ce186939cc7bddd8f8cc5caa06f15720f841a450f804d3d229d11952327c8f5fe90140eb0acd700f5101477953e4ce3c17a943895d3787598cb9348f04c1999c4c6a7ca695e67f101def4890d9cfe357352aabd69b8ffb4cf3da0d7453e9ee9e8cdb907c679c0b23544b8b0a8c05b622f6bcedf67ba72470eba36933678152cf5e88e84b7b87eb69eb383fb37e82d3cdbb19872d54b004da981a7f137e827a6504196d9d2fd330f94eccd2f318e18d632c523acad51b3d50bfe5f325831f7012ae3789d2a67266667fc2a3311e734f84e1adfbc39af6d01dc789f12625b206d3674a6430a7bc7f337ca276ee83e03df2af0c625ff9bdfa4e54bcacb4fcc8d0ad5400413c8c061aa0f677f191c421ef69b83eeb4870da47d8e53d624974fe03b6d975ea00b7f012b60f179b4b5b5f87586a94ae96f003e12a6070855b31f48a2a3d2ec6efa91a9791264ad11132352286e2266d6de124a2315d6f18762b7b539ede10ee74064020cd7868db44c78214e0729cd2cda231263712a55a67303e109ecf5846fa446575134468d3b40a52ef5fa196c408de09bdc6d704952d7338eed15419ca11a0a6493f9982fc05ccecface4bb46a335322d9bda5bce9eb981f0b4df4cfce61a85e52ff000dc38f6e2a0d6f44213d546a0dfcfe7346a53173eb327b2ed603f092f97c12fa0f84d9ac7530cb7d743853858f493e70eabac1d2dbd6141d661266888d35d4c7aab24bb98ed26f72fb15b143bb31966d630e9315449cbeea2f1f2c94568f1c09ce6a44ac62212d1ad25a195eaa0256e01d79f918fec17f08f747adbafe6fa184b46a8017eccbd3e26336117f8bde61c4702142dca8b814248e5a6e01f988aa708a47ee53f545fd25952331048e5f5850be3348ba544b322a767e81ff00954bf907d257abd97c35ae69d3b01bf78587be6fda22bca3159ccbf63b0a7fe58f30ed2bbf6230e79541e4e3eab3aec916487445f61f53f538a7ec251e46afbd0fd2577ec027e3a9d7ec83f59df849264d0f91f941638c5da54c7d6df261e1d2ca00e4a00f202182990a00803c87ca13319cc683e58e2443c706340c91122eb79232263b0400d2906a6658223186c32a943d0c8153e32d990260d0ecaac0f8c89265a2d237887653690612e348b98920293341339971ad06c0784632a1790679619441b28934c00832261e961cb1b0ff00f25f4c10a7621598df723e4394f3b57ed1c5a7f2bde5e9f73486372329e9906c411a460b34f8b5204071c8d8f91eb2e767382fb639dae107fdc7a794d3d9fa9fe2b1a956fdc9ca9630bd97e18ee18ea1091a9e679da74f4b06a9b58753bb7be199828cab6161600741ca012c7ed5c1f39ecaf2c7a4e3e5d87b5b506fface47889bd66fcd3a564c877d08b89cbb1bb93d58fccce6cef648df12e59a1c3d75be9a293af94e3ea1bb799f999d5bdc53a846f9081e6741393af5129119d8037d86b6f39cd9f510874c64f936c716ed9b3835d2287e1b44b0b0e978a76a95ad8c5b4999b8217537e44da453711601b46122ad357c2325cb2e2ef2c032aa9da581266b72e2c9de67f127b11e5facbd7997c64ea3f2fd628f2391c9f6b716528542b705885b8e41b7f85e7034dc28b917b9b7a0d7f49dd76bd2f877f0cade81a70605f28feae4ff00a4eed2ecbea7167dd9b5c3ea5423251f6bf8aca5afa699885e42779d9cc0357a67db83ed91b9934d8ad859982ede7ce71bd97a9ecb1b4f43f6d96fd5181b823a6b3d3386571fb4b07b021722f88d0afc27737bb5471d6c9df2cd1e1d804a7b28b9dc8bfccea66ee0d41d26715b19a1813afba652dd596956c6b2ea04afc352c7f98fca1c1d20b876ff00e5face4ff166abde45d71a1f280c2fd8961b9c0613ecfa1f9c85c1a3e431da413949df483a5b8f28bb03e5162318f22c649a12118c40c4d0004bbc28329a5705adce13dbe834defee9728b338b2cc46458e9194c82ec673f2903505fd233dfe065714cdc794d12466d970b80201aad8c9b53b81e502f4c5c79c229049b0ded2f7fca672fc6d2e86a0b66a64900ec45b51ee9bfc42a64a7508e545cfb9499855db3ab20fbc808f59be05dccb26ea8afd9dae43fb317ca155d6fbae7fb87acdcaf54e63303866282d56045b3b0b783a8d699f41a4df2f35c8bcd74678df9792e517eedfc443254d60287d93e621517bd39255b9d098546d48936fa40d35ef930a46fe521f268b82b62ce9e8264acd4c5ae97f0133164e5f75178f9648478c63ce735145146264b600aaee3f37d0c948553b79fd0c9030b02724240193060032a024e8361f58ffb321fba247da804defb0e448f78935c427e21efb7ce5a10861d7c4791325ec3f89bdf08a41d8832528903ec9bf11f5023846eabeeff00586023ca420367e8a7d488eecd94dd791e70d2357ecb7e53f28c0c1a6a6c3c8428264299d06bca4c19c46f6388c62bf944d180e64498f226f1821131888e4c89318c52262bc8c56031b4890248c8110190b6b07504993682768ac60d841b5e14b0906223180632546866d761d7f493a74efe50d511b915f233c3f68fb4fc27e1627e6eefd3ff007f43a70e1eaf34b80f875ca3ba259a4b7d083aee08b8f7ca786a8e0d9b2dbc089a54ce86e797a89f2795bbb66f229d5c3a0b801ac74201d2dd676785a4aa815458002de538aacd6ddb4f2f8693b0c154bd2423fc35f94fa8ff00e3591a9648bf44ce4d74768b0af7e9a7858c8e4522c7e3bc0b54304f58f9da7d3bc896ece25060f16d90153c85c794e5aad5f67a904b1d979927e53678863c0d45c9b5b4d6de539ac4e38a12d90e63cd8ebee9f2faef6b75cfa706f5dfedf73d0c3876b901e21c42b20bb9b311dda6bb2ff1375338dad5db312d73353195cbb16737332318c54dadebe1d6638136ee5bb6692e291e8bd93c767a4186e0653e914e7fb118fc8d513705437a836fac53dac1a84a0949ee724a1b97b0a7ed44921863afa47067b0fb1cc8baa76968194e9ed2d21d24cca892999c6bee9f39a57999c70f754ff11f9498f23970727da9ae128393f79328f33383a2bde4f49d776cb1415298b037a97b1e807face4d1eeea4f3613bf4e928af99c595b727f23a1c054031541bf897e3713d3aae116a5811a95b661ba95d8cf26a86c51ba5bff0029eb9876cca0ded9a9dbde359d79b69a39b0a52c4d7c45d99c43bab072485365277db517e73a4c16f398ecf62d541c39eed4563707ef6bb89d260dbbde92677b847dd4cd8aa6ca7ca4304e396bddfaca7c5490a4f5b5bcb9c27095d5ac3eeafd67338f91b348bf31a589ad61a749570989fb03a8d7c258c5d3ee9fca657a385b1a67a0d7ce447a7a773477d459acc4212395fe70181ab998f97c74ff005962aa5d48ea7e703c3500bf991f189574b1ff00922e090ac34f51f38583aa74f599ae4d1f049639112c510194948fb4ff0035e5d1479743017fde7f9a5a53de3e5369b6651a0b68d1032a57c6aa920f299c62df05ca4907aa7eb00cfb4cee23c6e9d3ddada5f5e876f94cbc5768941b277cdb40badefcefc878ce8860935c1cf2cd15dceb11f494ead517df9ce453b4efa87cc801eed806cc08e76da1b01c7293365ab6f6973642df7795c0d2fe129e9dc37625994dd235fb458dcb46a581666a0eaaaa0b12cca401612870cc2d622931a4e2f45435c5ac6c2e0833529f1203600795a4d38caec666f3c610edf89ac70b72b31c601c550cc8da54620dae2e56ca617198f08093c88f89b7d66b7fb5c6f6004a58fab42b29574bdc1175ded1475f8dc929340f4d249d04c163c5ac48173a5f724749a147100906f79e7b5e91a754828eca41b556b936b5f2adbec0f89864e2acb4d96d56a02e56c3b8c05868587ce76cb4ca5bc5f271ad438ba923d1293dd8c2d53a1f29c7e0b8f01912d77b7d80752be0dcc803d489af4b8b50704e76516b82ea56e39917f1d272cf4f24f83a61a88bdacbf8b3dd1e4266accc5ed207210a54009b2b95395bd794d10c00b9330d441c124ce8c1252b68918a56a98d41cefe52b3f103c801382538a3a945b34af035b10abbb0132aae298ee4ca8c660f37a16a069bf1152c145f53bec3632d23ce6ab6199b90b78cb14a938db30f26312ccfb8fa11d10326a660fed6eb605ed7d83006fe5d61578bd880c52e4d85c32dcf406d6bcda326f84ccdc4dda6753e90d6bca34eb38fb549c7958c22e3d39dc7983358c910d32cfb043f757dd1861d79661e4cdfac64c4a1d997df0c0cd134483f62793b7ad8fd23e47fc40f9afe8612f1e020599fa29f523e92356a1ca6ea7ec9d883ca1e0b15f61bf237c8c76063a6c3ca3c8526d079093cf38ecdc578f78b308d7118e84498b3466f03185e301168c4c9111ad0190d22223b08261001c883223130388c4aa0cccc001ce44f2462ae4e8a8c5b7489b41b5a07038e5acb9d2f6b91a8b6a3c21498e32525681a69d320c2416983bed154702456a5e791ed4d73c6bc3c7cf77e9ffa74e0c5d5bbe0b9488da5836e8255a2259433e4a7c9dac92d01b8b03e00184b10a6e46d248be4243197ca05edaef33bb7465dccfaf548e57f23cbca757c1df350a601fbb6f76938b7001d5b5f23627c3a19daf014070e971d7e73e9bd84bfacd2ff005ffa8c75bb417cc3392bf681f4991c4b1caba1700753b99a3c4311a6453e7fa4c0c461a91bb544563d49b9f4e90f6d7b45397f0f07b7f957e9f731d3e3bf3331b1bda1a084d959c8f3b5e73dc438f0a8db65f3bcea32e114ec74d81da0f18f85a83bf97d57503c27958658e0fdc93f89d7bb38fcd9b5264332bf75bffc9a58fa1830494ac54f25b13f19935ad7b8f7f59e9c1a92b56be9466d3453ab59a81251ad736f4fe84501c4f979fd23cf431c538db319727778731c41d13a5e16a2d8cfa16ce22d52da594da56c16be8259bc24b61a74c9ccee367f760f461f232f9333b8e1fdd13e23f4911e472e19e67db5ab77a6bd12fea4ff00a4c3536653e2268f6aaa5eb9f0451f5faccc73b1e8677e3d8e496f66ce2bec29f03f0b19ea5c35ef4148dc007dda1f84f2bac6ea9a723f29e91d93af9a828e7915878f745c4e9d47299cda5f7648b1c5f0cccd46a531dfb80c475d3293ee33afc17da13168b656bf29a9c3eb06b30fc44788234223e509ae96fe26d6335403c4096708a033002c2ca3e129b9be41e24fba5cc39b335fa8f94e49fbb5fbe4d22fcc131a7b87cad15f5129f11c7203ecee0b020b01b85bee60b13c5a9aeb7db537d2c39931471c9a5b0e59237c9a35cfeb05c30777faf19ceb76a95c1a812afb356ca494b722735fcbe732ab76959db2e15dca95ef596e54826f61b88f2e3962c4e524fe8aff004271e58649a517ff000ee719c42952177703c39fba73f8eed601fddd32403bb683dd393ff685266cce5f35f66b86d37bde1e962e83e9b9bec794f9ecded449d2dbe68f5e1a65cbdcbf5fb675c6ca83d2567edae28725fe5e5332ae1c2d4b82ae092353b0e464fdb521b91727ec817d3d369cb1d7e79bac7bbf81d1e1e28add23630fdacae4666a0879dd5b29f8de5fadda0072f75ef60ce77f660ed9add4cc56232feed6e79a9ee937fc27607ce5ec0f04aae2e7fe1d14dd41d599f5ef375ff59f4becec79d47ab5525f05dfea789ad9c1be9c51fa961f8fb16cc989451f769ba1008fe27b684ea651e298a7a8d6a995c9fb34693777f33b8f95e74d82e194c53c958ad42492c720d7a0f410230387a7a5350be9f533d18e4827b2fdfe4713c536b77fbfcfec72f4b0b51b44464b7e33ed00d3ee1e92743833b122a3d3a6a770832e6f3f0e73a76a5a5b31f495530c01bdafe72de6b08e9cc9abd9fa282e959d4dbbd975cde7d21e8f08a34d4594124662585dafebce5fc56282daf957c3eb281e20bbb30de7c67ff24f6bcd25a6c2ddf326bf4d8f5745a357d725f22be270ae755aaea7c2d6f75a673d2c45eded4ff2afe9350714a67637f4fd60ff00da880dede1cb69f290d4ea52e9b67aea2bd0ad4787543f6ab54f4b0fa43a66a22eae7d77ff0058e38ba5f6d62ab8f47394296be800deff00a421933b9abbfa7fc1b4ab82f60f8bfb55162a0f3d3427c75d257e21491dd0fb36b837b2b2d891d75da7434690cb62abb6c394854c2236eabd36e53f55c39142297efebf13e6f261949bdcc3c470e46657f6b9691bdd6ddf56deea770336b1f88e09e90b971589b126aea4b7260a36d34b739b2dc2e91604a96236ef35ae36e72d54a6a05b2afcfdc66be3d197f0c9f270ff00b192c1cd5a9989bb6b653e197909a82a68359b353088775122b8341f744f3f5cfc5aa3bb4cbc354635c9ea64d6893356b534452e4580e7627e115301ac54d3b13a778127a5809e72d3cd9d7e2233d3097e44c28c381a1b0fa79cbcafecd94146736d5c6c189b0196fa4bb8842ca42b6527ef581f81de5ad345724bc8fb18351ed7029d5beca4a9ca4ec09b7284c161f10080c9434dd8e6ef5ff08b696973f68297666a84053f73ba728d5aeb7ded7b4c65e2f519d6cd7424b32b051fbb3a850d6b683ad8f8ce858e2b844db66b63eba5fd9b516a86c34b0b1077b1bec2df112a7b0a6c415c3329537be4046ba75d4e9ca4b0d8e4a85487c420a8480b9014d34b8600d81f39b14a8955cb9c9e8d6171f0b46c5c1468b0a6bfbeaf9731e60213a0d8efbf491c5540c1512a8236be5351f31d8823416f190ab8ca22f9b134dbf37b3210f5d07c251adc32901ed958b2b6b99351ded4b5b5d3ca15ea06baf075b7f78f7ebddb7a0b48e2929d336bbdf4dada5f6f7f84a9c3f87300b96b12a5816b6617503ec8dade734a9d60bdc2b60ada12c1ada5c33126e0ef2690f7281c4550c422d5702c2e329d798b132d52af5480729d7aa907d658acac6eeb50852a74196db6f9a66714c6b2d15ca2b1b3a5d9186d7df329371d445d37c0177f6e61ba7c7f58d88c6828c2cc09461f0339bff6a14a7516a96aa335c5ded52d7d86517b5874e73630b84cd65295d1480c1bda0606e2e54f31ee8535dc2910a6741e424ed2f55c1d302fa803c7f598d5788e1c0ccb5598036baa336badfec898f86cab2de58ad2bd0c52b9cb4d839b5ca8fb40756536225b6a0e3ee98ba1aec5583223111cdc6e0c62d174811b98d78f710556a051726c0487495b1adc933c136206dbccfc4e3c9d1741f1b49e1f4058cf1757ed7e9db0eff1fb1df8b476ae7f812c66342025ac3e7385e35c50d6622ec17602f6d26af1ae225eebb0f2b83e739baa809dae761e7e939f029cdf5e576ff43adc63055154771d96a4570c80df5cc75dec58da6a93680c1d0c94d53f0a28f70d654c7635002aad736e5cbce7bbd7e162ea7d91e57bd22388c4dcc250331e954b99a944e827c9ea1b949ca5cb3d1824951a94ea5a5da441f09954aa4d0a2fce79d9223932d043e72af10a86f6041b01a78f9cd1c31bfd7c662f10c32e72c8c54dce876ff4938926f73283b9152a5373adf6eb3b2e1f5cae191ae3ecdade373389ab46aef9f417d8833a6c31229a2937b28f8cf574fabfe16339ae5aa5f3d85a987552f890c4d5637cbb9eba4c2c663cd3d1d47811b4dac4616e090f636f4f3339ac5e0d4e953144f805d3e3383074c9f99feb638ba5b153138b2dde00199b88c4b9d97d25da98114f5a75d4f8180ad8f2770b7ea06f3d3c697f8abfc84efb997571c07dba27cc497b6a656eaba79cb357100eea251655d728b78729d51a6b8a33665f19a9603f37d2295b8e36c3c4c69eb6082e84734e5b9e8341b430f5deed2a614e8615ceb3d9ad8e6ee5ac2b907432e527bdefd666d069728b6a6535e50ee59bca1c645e8bf82dfdc44b65a55e21ad371fc0df23325c952f759e3bc66a66ad50ff001dbdda4acfb458a6bbb1eaedf33198f7677a391706db2f769ffd3f9da765d87c4fee8755047f2922df29c950d692fe41f29a7d88c4e5a8e97d9efe8743f113b3531f22672691d6468f4baa6eb9d75b811b178c3469e651a822e6da5c8b293e17b0bcadc2ea652699fccbe2a771e87e72d3d3bdd4d99482083cc1e531c33b46b9a04b01daf1ff003a95442a0ab102ea18d8efd2d695789f68e9b5467a78c7a5a28ca29920d86e2fce66f0fe0f8aa6cca95aea0d973dca9a7b82dc8ef6f49d152e174557f7a94ea36ffdda8036fb23909d4de284aff7f99c0a19b246bff3f4660fedd49d09031194b5cd53ad5acdf889d828e4253a589cc453a75ddd59adecdc6b7dfbc7f00dcf5b4ed8e5cba2a816b6800d3a0952970ca59bda0a6335ad7232923a69ac239e2f72bf8571d8abc538864a3903166006a45eedb5edcfdd2a767b1550d227b884b1b950003fc579af5932ec29278db337fdda4e5b1fc4550b05398dc93b655bef703763f09866cb18c7ca74e0c4dcad84e27c2a939cce4bb7526fee9875f85a29251994f50c47d64711c518f3958e249dc99e64da9727a515d2584a4df7aabb0e84cbf85ae94c6c2631ad206b8bee3df222947dd45bdf93a31c5e74fc03b494dc0a4ffde0d893a30e97eb3cd91d9bec863e40cea3b39c055887aa5c90410962177e679ceac536f639f24635b9e914b11717d206a0b9cc564a9d06fc209ebc87a4b070be26f35b499851572c714e5a144016f7c92ada2b2923371bc3c3a9cc011e3d672d5bb24ecd715994741b01eb3bb7a7712bbd3b749c5a8d363ccee5146d8f23870ce2d3b1bd6bd5f4b0861d8d4e756b1ff34eb23133997b3f02ff00136fe226fb9cb7fb97479b553fe732f70eeccd1a2c1973defb9627e73723da5c749893b5125e593ee1913e518a6d055312114b126c06b6173ee1321fb482ff0060dbc7737d06db6b3d139e9b36d93bd612446ba65f2d3dd39bad84c5356cc2b2b6b982b5c0a6a76361a373f1d04d2a34ea61d59ea546aaa35b6419ff009ae2f21c915d01f18ac14b2d890341627d3498b88a388756f6bece98b582e676058fe500cd0abc78023f7554a9b59801624f4e5cc73815e2bedad7a3580cf65617b86d75b8e5e323a99a243f06a0eb4d52a87ac1893988ee2a81a0cae730f74d4a75e906f66a5011a6516b8e76b4cc7a5490b55aa6a8d2e4b3dc6a75ca01bdf61b6824931b8775cd4c1b816cc12cea2dba961a902434d944b1f85a5de167a77018b2fd965bea0ef700ee2dd2470d8ba14b4159c80b7cb6b8e5988196e3af84961302b5007a82bf3b0a8c092a75fba76d6d6bcb5fecba1bfb35d2e79db5dee3623c0c2d012a0aac0bd12bdefbc3bca6dcf2ded29e2f84bbb663540d45ed4d36b5ac2e09f7c99e2014aa525a7932e96d0a817d4d3b0b2e92962aa6299fda53d52cb60ada13cc907503d75880bd87c72ab9a24d3baadec09164ea41007ba1b154856a760eea0dbbd4cd9bd0cc7a1c1cd546352881519b562d9330d8b5941b684f59b586c0d3a62c8aa86c6d6dfc4db626275d80c16e0355484a593d98b58b5f35cfda2c14d98efbc2e0305fb3d5aae18b922c7385a74d46841b8b9f85a6815c4df57a600fbc4660dae8480065f940fb2c4b8ccc30c6f6b0b1b9523517234858cb69c457206254b6c5699cf66d01cbb1205f781c4252ad4cb9a6a416d73feedaebfc5d7d6d08ee68a16c81ada85a74c8398efb5fdf69955b8aa55016b51c9ddcca2a1205eda96d340224ac0b54388d0a6001ed74e5736b13a9cb9ad6f386c2f11a151b2a66467048d002ca3ef0b5c7be4385e2e92a8ccd8757705885d2e2f7d4b6bcf9cd154a60e70a809fbc02ebd0de0c0a55f84e73735ab837e4d97d2cb68f88acd4402d52964b01dfcc0e9b92fafc646b63dc385b2d98902e1d5f4f0b6be731717edeba32b20aa85b4234200eb617062f981b989f675d7d93d983283607420ea08226762bb3970ab4aa3d30a08b68fea330241f594f05c14394a8571000254abe50577b32b5c305f2f74e89f0eca8129155236cd76f4bdefebac06660e13ec88a9497355b59aa333963a5b365bea65ba18aa8ad932567b9273be45034bd8680dafa6b2856c0624862f58a8249b0d6c3f30b5a58c070ab0567aaf50d8df5390df6d0ebb78c0468515a87fbc34ca91b01620f217bcc9c461ebb5ec29d35bd812f7d89e7e26fa5bd61b89e10d5ca94b1029db6543626db8eeb036991c470f5e91542a2b000321219b2b060599cb1276b81a1e504334d383d7dbdb29b917256e428dedd49f198bc6eb0350a2925574f37e67ca5d6ed2551a8387616160b99ae799b8dbd4729868a58ebcf73f59e27b633f4c1635df77f23bf458edb932c6085ced07c631361941f4bda5ec3d20a2f3278ce342ded90789179f338fcf93647ae8c1ae8377553d0ab8bfaf595b00abed91acc42b86d3f8483038bc4e63b83e571f39d0f64308acf9c8db6fd67b129f830eb6734f74e8b58fe22ce7bc4a2fe116cc7ccccefda835f28b0d80fa99d2f68383fb6a64a7f78069fc5fc2671f86a2549437bad81bfe2e727f8dfe2b1db7baec72c3174c8d2c299ab4a63506b19ab4df69c1991d08d34496e9dc4a141e69e1ac749e764d8991a3806b6bd04e771ac2e5ac773b4df7ee5363fc3f3d273bed57a9bc9d3f764e3e5b2be170cb55d402c0deedcaea37fd275555c01ca66706198b3d869dd1f33f496b886211477843349ce6a2396f22862d48bb8a84796de569cfd602b1b1396a75d819771f8a673fbbca39587499f569d6fbca3e179dd821d2adbdc4ca18ba7529e8eade60137f294dab37f86f69b0bc56aa77431b0ebafce06bf1377dedee13ba329778afc4cda3316b83a588f3120e6d2d55a97e4253c499b4776433038a3dea5ba2fc4c52babe6a8ede3f2b08a7adeea48e37bbb3d1706dbc9d57d667617120137d05a4b1f8c0a77e5a0eba4f72306f83967351dd9a34aa43ae22cfa9b0cbf1bce628710ab7272e9f3969718d51c128502af8ea4cd278dc60d910cca52491d19c7a72b995f118e254802da1f94a0af244de79d29b3b1ad8f297dcf99f9c476f49aadd9ec41636a66d98ef61a5e0abf0aaaa427b372d6e42e3df3d18c93ee71f0b82f61dbf74bf947ca4bb2f548c4fe656f81bc260b87d7205314c86b5ac75f84e8385f655a99ce194b5b9836d77d66f9f530e9493b30d3e09ac8e5474d84c6060a0eea77e7e3354639156ee545bdfee9cdd2e0b5ef70c80f85ccd3a3c02a358bd4fe51f533cf8e592f74ef9422f765fc3f6811f445dbad86be52e53766fb42c0f3f0e80ca982ece524d6c6e77d77f3b4d6a58040328161d2e652736f721a8a5b10bea3a0e424d8b9fb2bea7496928851a011efcf97ce6c94999b68cbadc2cb0bbbb7a69388e31c01c39144547b9b9cd7b5fced3d3d2966eba0e7d7a4ae535da138da145d33ccf0fd93c4b6f917de66961fb12df7ea9ff28b7ce77604799784df2cd7c4394a1d8da03ed676f363f29a587ecf61d36a49ee1360c51ac5125cd95a960d17655f7096f0d4cdc651fa488f09a3855200bda6918a5c10e4cb6b19a329912f78e88113a48169230644b404d5a41e4e9adc5f918f5100d4c5630269c1353333fb41da2a1854cced7dc00ba92c05edd01f39ccb769713892453a4e8852c86c0ddd8828d988b65b5c927e70e8b2a3676f4d6fa8b5baf286ab4c5adafa122e7cc4e6071c0954517276401b933b5fa7d9dbe226c8c7281766000dc9200b0f199b4d705d01a551ee5ff67caddd1f6ee2c7ed6836b6be7a42d7c66550cd4f3383f61002d72795cf4dcf9cabec45622bd1ace012a4906f4d82dc5ac47ca6257c1e24366a8aeeec4d9e9e52156fdd422e2dbefe1279e4a491d0e1b8b2d7cc948b8603ed3536caadd0df4bf84af538bd446f66693bb5f46b6557037296b932861f85d62c400d4574cce08cd53c2c86c078cd7e1d46babb1ab555d4fd950b62bd3592e90cafc378a7b5acc800b01722cc72b00a2c58802fa996f198caa8c5568338ca08607424f2db4966b5454058d8000927cb9cca3da9a16b867b7e2f66f94f969ac5cef401b888a6caa6b50bb13650406b37e65b90273f5304eac58960a6f62a42806f7c8c1d8e808be9a4e8f85718a55c1f665bba6c4b020dfc2f295635bdb155a6ce8793f7937bdc5ed63ef8d3a1d19740d55cd5159d4a90dde67cac7f0e451661cec04e8f098524ad5a951cb650728255013bd977f430e16a02490960a745d5c9e5627403c26257c487a85c97a4ca8541ce9bdcf70036ef1f5da4b6d81d215dc8b5ed6bdbfad266a3e26d6614835c5b291722fa8009d34b1bfc21703c411ec2e410366b027c6dfa41f17650a19d0b229be60d6284e97d35e7246478a62da9d35bbd35a8728ccfaa13719bcb4b9f499bc3f880ad5da9d7fd9ae97299189622d7241bd88b72bc9e2f83354145e954cc8a7364a8ec50ab6abd76e533470ead95d0d1a849421454642bb8b95e77db5d378f619b068e30900ba321520d82af76fcc107bd6b0d3486e046ad9d2a2555b1eebbb8666bdef6b6c069699d85e078845a252b646404b2104af7b7d01b31b75eb3a756d35022623330fc3ab87b9c4b1517034bb15dc5c7d9bdc6f68dc4b87bd471fddb2e5d987797c8db9fa191e2dc756832a05351d8db2a95b8fcdcc7ba513c7abdecb87526f761ed54bebbf756f6b08e9f2002b70d3a22397736b815012aa0d8f74adc8d7524f297e87063987b401940b156248245886451a01e1f0826aeb8d05691746422e5d0af3d2c46bcbaf39a981e1e542fb4a8cec2e77602fa6b6bf844d80cbc4a98634c9ca558280da03a0b653d35f849574ab981a6f4c2db55653bf504416338754350544a8c406b946361e42c0e9e16f594d5b16ac6eb6bb587795d35d07461ada2a02e53c4e4cc2ad45df42465d2dbded69cee3b88d4662a1e9b7b3a8330c9ae5274b32b5b35bc44e8b0b4abd4bfb655a7d323924f9adad26fc290f78ad367b5b315b5c72072c013a31315c41182b0ad88a4ada01605430d08247eb2c70f4a7ed405a98846075565cab52c2d9892ba8f5e50b5b80120d8d206ddd0533d8f2d5efa790972854a94d07b557720d999156d6ea141b911bf800d5b845166cc516fcf2f76e7a9037f584c6e0a9ba8045ac40057bb604dada72f085a58847365617e6bb37b8ce778c706af53102a160d487dc576a6c17c75b1eb71692be231769a9534b2a85ccc7333699ac365cdbfa4c357b728aa802f6000cc4db5e67c4c87b5027c66b7378f9a525c70be48f77043c38245dc46242d3cc4db49c6e3b17ed0923201e3bce9da9d3a8016b1b6c3737f2991c66cba7b0a6bd18d95bcfbb2349d319556e6f2b68e76a203d0f4234b19df764f0f92902776d7d394e1f0f4bda540a3425ac7a5b999e8fc356c00e8001e4269ed29d635139ef73454ccee29c216a9cca42bf5b687f37eb3454c966f09e1c67283b883389c5e0de9b5985ba1e47c8c6a750cecab0523290083cad393e29c36a532590164dedf79478f59e961ceb26d2d992cbb83a87ce6ee0803b7c7e8672fc32a86d8907a4e970a48dfde273ea635b10cd0c69fdd107a8f39ced7a1a686e3fee137b1f52f4c016fb5efd261ba977543a5d85ff28d4998e9ed21e3d91adc3a91a74d57736b9f33aca1c675d1afcf5066b54a8369cd7183726c61813964b61d8cc34ac6eae3c8cad56a6bde2d7eb789d391d0f583a6c068daf8cf6228cec6c1307a9ecd890391f196abf0b70d95416e7a0e52bbd216d37bdc1f19d0f08e26720aa96ce9a107636e47c27a7a6c58f3c7a7892309ca51673b53055177461e86667100c14f75b63c8ced9bfb4e5072d6c22dc686d6fac854edfe02a7dac2dbd06f3d38fb192dd4d7e5f739dea25de2794e028904dc1f778c79e9cdc7b85b0be4b1f11fe91e744b41924ed7fc214d51c0d572d75cc6d6d65ea95d58ab65bb9402dc85b4bfba6757aa05891aec075f18f8a2ec42822c45ce5e67c4cf4d494559e7b8ca4e91669bf7bedee796d3670946a9233bdd40d073997c3b02ebf641bf94e9f86e19fefdfe1f498cf249a699b430c62d325470c25b4c3cb74b0fe12dd3c34e458cebea463ae1759669616680a1ac3a519b4717a99b994e96144b54b0d2c2288549aac69221cd8a95096516d19442094a2896d93c9a692c50a5d6469c2d33f39ad195960d00548f095a851fbc4dfa784ba0c003b8928416da095d30ea4e5d45fa759614ede7005acd782022fc34fdd61eb2b54c238e57f2d66b126f1edade40ecc4f60df84cb34b86b1d5b41d3732f5bbc7cef0f783d82ccfa94c2d80124a36f293c589143b7acd1702274b68d68818c4c0044c81d8f944cd065a303128e21e99eeb1f2e5ee96713c48d442a57bdcac6c2fe3293ee7ce444d1a56347358f6a99eef42980465258dd189b5b3741a0d7c04b7c2283b55a8cc4a05232aa9ee64b582f4e40e9b5c4db23d650c5f0c0daa33533fc26c2fe521da2d01c460d55ce26ed980b9527ba4016bdbada5be1f8d4ae97b1b5cad9adb7523a1130b18b552a2d5ac1d951185d49ca7ba46aa399d3dd33f058a70c870b988770ac84330517b92762bb9d4f4004854cb68eb387d4386359aaba846a97425b653c8fe1e961d262e2f88d5c43b65c415a25fba5bba065176cb94e66df6f1137319854aea69d40083a11e5cefc8ded2678353ca8994009aa91cb5049f336de43db71a617b3fc5a89fdca875b7d9351ae5ff0011b93d41d27402716fd9e44a9ed733017248be858dac4dfe535f0dc4cbf749208d1eda5cdce83a6d7f5994a2b9450fc7f8453726b16aa5d468a3beb71b5d2c6c3ada55c3e0712cc0d41490004b302c7ba3f0a6c04daa7c414680012c5602aa1436d411cb4bf9c5d4c673586e1c8d5fda9a82bbaf7bd9ad35a7a72617df5b739d360ebb32e67a6d4cdcf758a9361cf43283d0ac6c89590328370065276ca4efcafe72cd2c0b0003557616b3036b3922cd7e80f41d2293b11712a83b1047810654c5e25331a6e80f7435dc0c96ebe96e902304b42ef490b39014297b022f7b0f2d4fd6546fdaaa1462810826ebddca56e0656bdc9bebb692521969930a1006f60416b8b852331d74e92e61b114dbbb4d90e5d08520dbddb4c4a9d9ea841efa8bab682e2cedbf786f6d003cb592c2f04aa6a53a8e55421b322b35dc01657665b027c088f6f5035b1587762325564f0caac0fbf63322b765c12bdf76b1b9bb11a93736b6806da0e93a4cb2bd7c75243959d411636275b1dbe464a6c0a4af5a91cbec83a0b05ca7bc05b9dc92668d270c3620f353b8f39cbf68788d74a8a10b2a1d7da277c1eee8a56c45ef6b758a8f681ea540569161916ea092e14920e8ba1d411bcae9d80d4abc0a867358664a86e732b1bdfae598f85e1b8a66199c2d30e43955c8e57a1bede6275382ac592e69b27f0b65bdbad94c9bd55072e600f424036f28949a039bc26068e0ea134dd8d46d2d5090a431161702c0edaf8cdde1cf59949ad4d6990c4001b35d791f080ae899f32bd357b5886b106db5eff66d7e5d6575c3543533b627ba0b1b03601586801d8dafbf8439034063e967f679c66be5b6a3bc2dddbdad7d7683c67b4439cb29a60dfbd65c86c40248dd75f4924e1b488b38cfadeedbf51723782e25837a8ea055ca805d972dc30045c137fead0556050c671caa2c2d4c1ba9b8bb2b2b03a86205c0d36bef288e355f40ad9aa33f7a965576545d4b205b5ee08df59b5c1f07441252a2d423badf64817b35ac341b09ae292def6171cec2e3c8c7d4900d4ac403aea2fae87d449da46b36552c013617b0dcf94c57e222bde928b5c0bdd9a9b81d57bbdef873914054ed463ab61ed513314cddeccaaca01b0034ef2ebcf5de6657ed307cd4d0121aea181d17f15ee3bc34363783c4632a525756b861500efbbdac0dc381945c1277f213271dc4d58aa5807506e6c837b7d9cbbaf9f5339f5d93c3c12f5aafc4e8d3c3aa6903c4d7e5e0605c5c095b175b6b7f57816c6ae5d586de67e13e52389d2a3d87245da7c43d993d00d6dbcc7e2158b82fa6f717bde53c7f1453dcb1b9e9a9fd04861daa3777280bd373e13b31e9fa3cef6664f3c56d66b76629667353a0ca3ccea7e93b9c26b307836072201d753e666e50baea2793adc8b24dd0a1c6e5e47f03084dc402e2873855aa089e6b4fd0b1f2d8682f1bd99235d3ca329b6d246ac5b86e62e3f801bfb4a46cdcd7607f430bc2b887fcaaca558733a4d36c481055b238fde01fa7ace8f16528f4cd5fa3ee438b23c518280b9bc4788eb28f062cd559cb5c2a587993bfb8187c6d20d4c206e7ddbf23e0653e0886882aff0069ab1db504696d65c12f09d72276951b359ef7205bc66255aabae6b4d3c636996f724ed3131c8174beb1608a07b14f1669df7d7e128d5b1da587209b100c854c28b5d5bd0cf4e14b9337b8046e51b018929540e4c6cc3eb1ed21ec8fb453e33bb45fdf8af56619bdc66c712e168c330456befd671bc4e9d0472a55d4fc27706a5b69cd76d3160530b956edf7adad8729f539bd9fd2dcd49d7a1e7e2d4f5795adce7bfd98b5355a9e9145c04dc9fcbf5114f2336a678e6e299d0a29ab2cd0c01bdcefe33a9e1d820aa2c00d21e9d151b01ee97694f59330492151a52f5048012d513290cbb4e196574685569484d0edbc90304ed195e5da228b486111a53f69268f1b62a2fab49ab4aa1e111a0989a3429344957782a2749063acdbb199a74ea18063ac6a35233bdcc7422c50a9b7e690afbc8d2d3f9a4ab9d62adc0bb4dae01f08af01876eef949de67403b9d442832bd53b491a90a021899046d07998d5db7f380a6c65a5b007cf2151f491612244aa10d9af20a63f23057850c056c1df553e8651742a6c4113503c1d7a808b18c2ccfbc71235d9575e5afa5a429d40c2e083029308d034f0c8a4955ca5b72ba5fc48d8c2988c8691601d586a0661e1a1f7192c3712e40ff94e87e309075698616600f9efef99c93293465e378bd618aa74ee9ecaa36c575006f76bef7f9895b0fda1a01aa0375b31373f7dc9232a28d4dad0fc4b841617424d8dc03ad8db95e61602805ae3f6b1640c080100566e59dc6bd34db499aa34bb3b377eba4c2e25c6c8645a559750c7b9de3945f33137b72d00d749678ee3d2a7b4c3a29a83d8b33906d616160ba1cc751b4e4b114bb8f4ca93cf2aa1ccacb60495b69a6d7842af71bd8ee383b362a9e6776196cb706ce729bf7c86d74e4443f16e395d6b2d2a028b0c976bb2df4366041616e52be130e69825330cc05f5d6e05afe739eff771c552c2a8c8c589ba83505f96637bebce3e957b9299d761f895474b3d44f6a1b213485ee6a0eea0df5d2f9b616e7343018ba34ad4cd662e45cfb5241e9f7b4f74f35462ac30c6a924166af90b0b39b0570db68a069e734131587d1185deb2f79dfbd602e3da123402c01d3c64b894959ea08dce42bd72a015467d6d6522e3c75338ae078c7c40385051529269529f792d7002956dcefade75bc2f0494572a126fab12752dd6db0f4993540d1994d98d461ed6a3a2e62ea41057424588b1e636e9015b87b5722b52a8080994231370c3993adf9eff0019d4df499585e2eecfecda83af78af32010a4f78e502da6845f710b623330783c52555ee6606d9d8bd9341d56c49bf220ed36b0d81cb55ea64a433000150439e673723bc5c3f1aee4e7502cbad83101ee458310030b58de071fc5c5270ac8e54a96ceb620004037035dc8f7c1dbd80bf8ac2ad4528d720f891f2330876749b672182ae552b70c13a6ba7c35bc860f8851c5d5fddbd7470bad8e8cbb78807cbe90dc438d56a375f61a2b019ddfbac9f8ae01b1f386eb61d02a7d9f466b8a8e2c75d012ca45ec6fb1dc5ed79a584e0d4d4b7de53b2b6a16e2c409895f8bb2b2562e29d33509640a5f39cbb66361a8b7a8f19b5598e26807a150a66b3062a7607ecee2d07603715c3d72a130f64b0d08603fcb94a916f1bcc3c454c4d361ed55d85421598d4055013de2360ad6bf2977034f1a8d7cb7cc6cded1c32e96ef00a6e2fb69ea0cb9c748b21a94f3283a9d196e74b321ef1eba413de80a1c3f8b2d2a6c6961d88f68d6034275b2ee37226de178c23150cae8cc34cc34db5171a0f5b4e7bf61aa74a4542bd9969bd36c94f5dd1c6db7de12a9c28f68c8ccb549163df0c05c8d94ae5041bf28eac363a9e21c56829f66d51949d332e854f2d7fae70afc38975a81c580fc0b98ef739bc7ca64702c0a5272873d4b92c8e53b8800b1553caff0049ba714a1853cc3310485ea06f2588ad4b0d51415760e9f74106f6f137d6729dabe0146a7ef8855703ed8d1b4e7713b3c7e1855428c585f9ab153f0f94c3a9c10a8bb3b5423ecdd6e14df46504def6d37d66728a972691951e5f8ee0f8902cb5148d7eedb4f1379ce62b0b5d771703a6827ad56c1d240299a80837539d32fa653f77f49c371be1f454ad25170c49434aa5ec09f1d0fbe4c30422ae97e0692c9297733782613da6a771b8e8675583c20169cae1b14c8c02a1bae97cc183006c6e46c6763c3eb070184f9ef6929c66ddec6f8aaa8d5a604986e50348cb1944f064762199b91895edb18e2c74320f4ad16dc007158c8bd595fda5a02ad4f18d63dc761aa626dce57a95ff000b29f026c4ca5598f9cccc4e53b99d58f026272356af126275d3979199dfedb66c453a64dd4555d7c334cfaf8861a1d7a1e7e52ae1acb5a983b97cc7c3a4ee869a093b5d8c326475b1e8abbb313adffa133aad5d4dec21e9d66b1039ccec4e12a10481b99e6638abdcd1bd8a350dc93b47453ce098106c7afc65a2b6b4ed7b198852179728e184aece2e0f84bd4ab002632949535c852650e238b5a454373e9d272fdafac1c26537d26be314d472e76d97f28fd654abc3036e359f59a5f6865783a32eeeb93827a7829f547631fb394f56bf4fac535f0fc31a8dd88eeb6de6378f3ccd4c9bc8dd1ac23b1bca659a4655530f4e7d0291cd45b169629bca4ad0aaf0ea1d17d6a422d49483c9abc2c4d16d9e0f3c16791cf345211643c9ab4a7ed2110cab24bded21e934a20435336948991ab45ac2317d60693e9244ec674f6302e52d4459baee0c8516de2aaf18829737b78886ab2a235c8866a9a7ac2803e1ea6e216f29d268707489a0b2750ed1ef22a63516d4c54045f9c822f393ac3593c1119883cd4c774ac019306c7e7224eba48b18e8083b6f005e15869020443202a1bc0625f785695f15b4a4228e2ea5d72f3be9e569c79c63fed0591caad3eedc6c48e5e3afca6f71dc4b221c8b7394dad6fb5b0de72544114c2ecd725bccc52c91ea51fa9718be96d1d6613b48ba2d5007f10dbd44daa55d5c6652187506e279938b6f793c263ea5239a9b153d391f31b18e493e06ad727a6de2bce5b8776b51bbb58653f885cafa8dc4e8e8d60c0329041d88371336a8a0f20e80e84023c63868f798c95f2544cec770a0cb6a6ed4c837163a06ebe1bcb185ac57d98aea010329a83553a5812de9ce5a881febfd2438762d48b270e185d0de567c39e7ef91a6814dd6e87f8755f55e5e92b51c7e211d96aa7b557a872ba58044234571b817bebe316e87c9cbf19c11a0f571549d82ab80e961ad47b1366ded6606503c4a8ddaad8ddaf6161958ad8e46e7e3eb3a1c46330f519ea3a3200596b06fbc990ae60b7d75ca2f6e969531785c261d29ad3547ceded57da67cc05ac1869a6c37b4d682cd5e178f64aab4053a4a95297b50abdd656b2dcb0f1bfc274982c70b950d72b6bf517d84e578361e88ab52a85615340c1af75bea42dfee9ea3499b8ec554a35eb0a242160aec5ac41b03aaf4dac7d24cb1a7c0291e9e98c5e7095892a42b59ada74b8dafe179cb70bc635445775284a8254ee0f8cd0abc405352ec6caa2e773a79098f4efb0c5fed6c4d3c9eda8684842cae0f7cfdee813ced3253893d4c45408597206ba5419cb7e506c2c6c3e1acd3e0bc7d3137640d917f10b6663d3c05bfab43d6e0f86a950d66539c817ef10a481606c34bc1d27ba1993c216a254269e6a6b7cce3d9a2d23717b0d331b69a8265ae1dc72a3bba8a62a2ea4b2ab0074d893b6d6b4ac9d9a2acbed2bd474be555d4686fa937dc0d889abc0781a61daa3abb367b6a6da01e5a137e7072421f83f15a789069d4408fa8349812328f3007a4da5403416f211b24569001035b4b41d66bd947de6b1f2d49f95bd660768bb40b873ecc5fda15b8eedc0e84ed71a4cfc2f16c504156a95706f945355b8be87bc74bd8dec7a6f043e97475d88a571652148fb26d7b7a5c4c6a98b7a753362111cadfd994cc0e524026c74e63c44c7a54aa1a8b8b47aac13574760a4efdd26f96dfd5a6b60f882637f74f4eaa585f752a482366daf2aa828b0bc6064664a06e2da0b6ac48d2e06fac363528d4a74ead6cc96d8f781566d2c47eb0982e054695f2826e41ef6bde1b11d0f8cb988c2ad4b66b9b1b8d48b1b5b979c9b1199c2ea53085e9d4a9513358820965606c7b805c6bfac22f19a46d9b32eff6d72ea371af98d76f183abc1181734ab326602cb652148161a9d4ccfa3c2b154c12ce842824742b637b000117b9e66552606c6369d4600d234efcc303623cd4fd2723da0c12d54a944d2b5604156b00a4dee192c74ea67414f82252b54a556ba83b22b0ca49db4b4bc387a939dac5c8b16f0e83a098cfd11717dce11bb2c129e6500b1b96f127599030af87b54b1ca4f787d44f516c27432af10e161d0ae5be9f19cd3d34669a92e4d94ce3e8d40c030370658a6f3271549b0953290decd8dff2f8cbcb5011704113e5357a49619d3e3b33b613ea2cd4a77d440ad761a1d21293f43156ac87bad69c8bd1a342b622b91bccbc4561d6d2d62730d05987c665577d7e93b30c110d8d55ff00887be51ac4c2542b0985c380339dafa5fe73b5545590c0855a6a5df90e7cbc260617124d5f6879b5fc87484ed0f10150e443dd0753d5bfd266e1ead8d8cf4f0e9a5e1b9be5fe8724f22eaa3d4f86636e021b6bb19778955c89bd893a09c3f0ae236b0274e47a4d1e2bc52a391aa050079dcf59e14f46fc5f81d30c9b05aedce0ead6b81e12a53c55ef7b48fb5169d0b1d09b0ed5bc657c59ae4065fb17b9d45ca8e56997c4b8965ee26ac76b7281a14eb2842c2a006f7de7aba3d12979f22dbb1cd972b4e91ea23860655eedbba0fbe12970854d773fd6d03d95415f0eacc4e65ba93737d36f85a6d0e1807d976f5d66f1c2bb029d9caf69c119146e09bf845327b618aa94310466b822ff0028a7367c79a336a2957ccbeb45a5687569514c3299eb9cccb0af0cad2aa9865801615a114c02c2032a84c2932379163204cb5b1214342a3caa1a4d378d017d5e190ca886d0e8d358a666cbd41eda4b2db4a7425c533a62b6307c85c21bdfca2aa7e723434309536225d6c4f7240e83ca45c9e71d4e8216b1d3d442804a749655b4f494e9b58ff5a4b0c6268614347a07782532141b53134012a54d613066ccc7a2995dd7532c6008cf63cc18a5ee8d154ef78ad25516c74eb20d29810630461098190dd0d20156a01bccec4e309d84b78a4b9f4946ad3984f2491b4208ccc4a96d4999389c274137dd657ab4af395c9b3a144e5eb51942ae1edb4ea3118499b5f0b1c72b42704ce7def0d81e235689bd3723a8dd4f9896eae1fc251ad872369bc33d99bc7475dc2fb614dfbb587b36fc43543f513a4a75830041041d883707dd3c919659e1fc4ab5037a6e40e6a7553e6269c92be27ab869306727c2fb5d4decb547b36ebba1f5e53a5a55811704107620dc1f592c659880900d25788456c4e011d85422ce05b30d0daf7b11b11794719c30b545a9950b175cf500ef7b251b0526d9b6171362f111150ec2536a6da0b7c8f94a3c47b394aa9cec8ac45bcec0ded2c544077d7e047911a899fc5e8621932d1ad93ae6dcdac459c6db5bd62dd14a86adc4130f65aa5af988d8b1ca05c31b72b6e7acd6570e34e7b1eb398e2946ab1a7559516a1414ea29d05835ce57e7a72e709c2f8f535409549a796c15aa11775b7dab816f03ca5f4a60d8fda04a945e9d455728ba2a20397da66bf7c2f504dbc6754954f395b0f8a0c0104107620dc1995da4c4622922be1c66b139d6d72548b023c8eb264add02652e2f8ec5bbbe1db2842eb9196c0819810e6cd702d797bb0a50e7ac4d4b2e814e7cba5fbd9af67330b8270f7a9ed313541bb53395dd7beee458f740b85b6961bde6c6173d7a429e9472adc05390e41f64ab0d6f7196db6e64ce92a452dcee68e315d43ab2953b106e0885a75d0fde179e67c0f893e1ff0076a5ded65643a287bf7caf33adc5ed3acc2713a75012b9858d88207be64e2d0e933638870ca55c5aa22b5b6bee2fd0ce578b7017c38070ce5771949be626e46a7c05a757c33180ad8ea47ca02a61c6259838fdd8165e576e7501f0e47ce2aa60a5471fc330589ad54ad57a880a9cb63721b7bd8696df79afc37b32d87aab5fdb03626eb97296041bf3f5f49d461b0f9542e66240b663b9e99adbcc8e3d85ce518aee6ce6d740393937161d62b61d5668d6e314a995462f763603239bf91b5a68cc6c22ae168e67a85d16db01a2dec2c3a7a93047b404bba2a1b852515810ec577cab7ef0df69695f04336d88dc91e7d267f12c5b282b91886520382080c468186e256a7824a948bd6a403163b6652fa8b1617e76da1705c3d69e999c8b68a4f740e400e76f1932d98e28b68bb0e41401f530b13346934508c84919131d0ccee2b825a8a5594116f74f3da8a70ce51bec13a1fc37e67c27a95a64717e074ea8d5479ce4d4e99668f4b35c793a4e36a29dd5c095ea62f4b5540c3f12ee3c616a611f0cfecdc128c7b8dc81fc26356a6d6fb07d27cb65c2f0cfa2677465d4ad146ad127bd4dc30e441d7c8894eab373d7ce4aa6145ee0b2f86a35fa4aeecf7cbf6875e63ce74423f106c54a9e76b5b4e72bf68f1b917d927da3bff0afea65ec562968d3d2c59b6f1f1f29cb55aa4927724ea7733b34b87c4975be171f130cb2a54b9290a5d640d1266df09a74b3deb0622da69717f181c4502188d2c0fc394f6964dce470d8cc4aec9275389336fe1f0da1ea61e04e1e4b86393badc2e4822712f03055b89311602d17ecf18d18470624ee84e522ef02b2ad4acc2ec0d85e59abc6eab0b122db5adca6761d98034ff111a78c77420d8ce972262951dfff00673c4c12f48e8480c0796867a1289e2fd8daa53174db90366fca74facf68498a5b957bb4796ff69887f6806c6d97f48a6cff0068447b44047dd8a639e494f8f4354ad19a0c3a083a6b0ea677287a9ccd84410cb02861544d23017520824c48a884023f0989c88911984993225a5ac489ea180854812d268d2ba62856cb290a0c0d37850d1a6265cc3d4e465d0d32834d0a6f700cda0cce48b28dafba149de5656d7d24ddb5f494493a6da7acb159b43e92807b4b6fa8bff088260c6568617f4956ff0039673c1030c0c8d23ac0962351b47a4dac6c0316b9d3a436018671e47e529d37bde3e16a59c1f190d5aa1a0d5db5f5802dbcb38e4b1f74a8617b0210910239323326595315bfa4aacb2f6216fe72b32da734dee6f0e0a7529095ea24be758274bcc246c8ce74956b61ef355e8caed4e654518788c24cfab86f09d454a52ad5c30e90b0393af85bca7570e46d3a6ad84f0946b61a6b0cad1128d9cfb2cb7c3b89d6a06f4dc81cd4eaa7cc4b15b0d2955a244e88e54ccdc5a3b3e15dafa4f65aa3d9b75dd0faee3d674b4aa822e0820ec46a0facf217025be1dc56b5037a6e6dcd4ea87d3ea25da24f580d240ce538576c293d96a8f64dd7743ebcbd674b4aa822e0820ec41b823ce30a0f18c606393102224696d08e845c1f4331f8c767e9575b6b4c804065d4004dc8ca76f4226cc50a28a181c19a14969aa82aa3534ee75e64aee3596296351b406f6dfafba1bcb4f281ad451fed28bfe25eebfbc6feb21d822dd22185b43d3ac9601156a136198ae53c8d85c81e1bcce5c2d406f4ea07fe17ee3fa36c618e348203a9561c9c58fbf9cc7d4b27c6f81d2a82e32a96656240b662b7d1ba83723d60e870e14107b1fba0f74b12186e54dfe0794b388e394a9d326b2d94697009d4e82c252e1fc568d62568d4cc40cd66b83979900f9c21d5df81b469e12b0670a0908e9989e794dacbe17befe066b0c465200e96139ce1887d9e637b9636fc8a72a8f70f899b6709ed0064366b6a3ac793626211788656ef75f49a0eeae845f46041f5169cee368d4519bd0dbeb0785e2846845a4ae0a68d31c0c8b52ce1a8952a435b30b8df6ef1e7cbe12ce13848a6cafed2ab1552352a035fef1000b9d2672768d0060cea0a0bb5cea01d8f9412f16673ede9b354a3909207e202c156fb9f0eb2d36438fa9d1d43b7bfd6220199184e2cadf6bba4df4d2e003cfc65ba58c076d6472555168538fac82d5930d1884444163c78058d6906846304d01a667f12e1c9554a30b83f03d44f3fe2dc2ab50637a8e179541a8b720d7d8cf4eb4156a4ac0ab0041dc1170672ea74b0ccb7e7d4d6191c4f25adedcfdf0c2dd07cef002b1a40b32b163a016bceff001fd92a6dad23ecf5be502e87d394861bb32a9bf7db72cdafb81d84f2a3ececbd5d2d2afd4e879e35f13cdbf61a95accf7d361b0d7a0921c36da0427c84f4e6e136e83d256adc30f2b5e7a31c2e2a8c6d3dcf3ba5822ac0b53245f506fa89638b5052d990594a8205ad63d27615306ea751f5129e2b0f98116dc7c6689051c2350f0826c3eb376b613c35958d0f087488caf61e124b859aab8627612ed0c15b5e7293a151cd623065594916b91f381e30a055b0e82751c4703a2b1eb393e2af7afea04de1ba6cce6a8e8783d10a9e3d7c67aa709aded2923f55d7cc68679b6169f744edbb1d5fb8d4ff0009cc3c8ef2daf22667c48e73fb421fbe5276cb14bdfda26189f66c075114cb269badf551b5b3190c32da56a66155a7a31471b6d9655a115a560d08a6558a8b21a481810d241a43186264098d791cd001490682264d6219650c3299569987531585165659c337ce51496683589f19ac1ee448bea751e461afb7e59515f68515369b23324e359643f77d25276d658a4da5bc62403ab438329e796299d2098504cfca414db5e86446f1c73898c2533afa49d03620f8c0831d5a3406a715bdefe533499778854d141df28bcce0667c44689132179290bcc64cd10c6330eb1de41a62cd5159d64184b150414c19aa059641a94b01645d626865074d60d925f64827a53268a335e9094ebe12f35da9c13a759207395f0b2856a1ca75356866df4f9ca188c1f410ea0397ab8495aa52b4e86b616d2954a1368e56b925c13318897387715ad40feedc81cd4eaa7fcbfa4955c2caaf4889d10c9e866e3476fc2bb6149ecb547b36ebba13e7cbd67494ea822e0820ec46def9e4044b7c3b8a56a06f4dc81f84eaa7d26a9d907ac031e729c2bb6149ecb547b36ebba1f5dc7ace9a9d404020820ec41b83e463a1a4162b46063c963224490aa6d95accbf85c661f1da463190f7191ad84a0eb97ec5feeb0cf4faf9ace6df85d4c26286207f74cd6671de408ff6ac576d40dface91a44315d891f23e63632382a8e39bb41568e2016763411b440743992febf49d67657b4871155c01902aa9504dd8df72474da50c7f08a55087ca11c1b865516cdd4a1d3a4adc1309570acef6f6b9cdcb8d5add083cbc254e6a4b8dc4ad1e965338be9a8d478cc0e27ec91b23544566d1412335ce82c0ca27b4f4a921776ca36235dff002ef39d7ad866ad53ec3fb45575bab66a65c8eba6a4e9e7338c6f72f82b62823d7f6149ead570e4333b6eb71754b10328d49f296285701fd8aabfb32c52cd5025dcbe70ec48df4b003a45c4387ad4a4cd4c05f648cd64fb445fbc0b0d6faebbcb7d98c096c22d4a875a6e6a53b6a4293628dd6facddb5d3667dcd7a18665b1249f1de5da78ccbb5e06962baa884f6c9f844e583d8d9a2e52e26a3724f9cb3478886d85a655d3a420a89cc5bcaf2c9a3792b78c28aa3acc04c5d31f8a59a7c4e98eb01346c7b411af28271153b08418a1d202e92d48b08215bc0c90ab0011123245c48de218cf2b3a4b0c60ed01a2ad4a52abe141e426932c1948a87672f8de14189d81bccefd8d54ea35f19d955c303e729d5c301b811d0ece5ce1efb096a870e3d3df36c5303602344d20463e3f86e64b123498789ecf5264636bb80483e205c4ecde9dc1f29428d0dc79c8aa29d339de18b9a8861ebe626cf66b1192b28e4c0a9fa4c8ece1b1ab47f0d46b7be69fb3b35c6841bcdd70d1cf246ff006b6c29a13fe27d0c52976cb117a1498737bffda629db817911b456c70181e2a8d60743d0feb3515a7108668e078a3d3d0f787cbca7262d5a6ea6632c5dd1d58935328e131a9505d4ebd39cb6ad3ad3462d50753080c006930626841af239a4498c22d809093bc086920d1340190c329950342a3c45596d1ad0f49b5129830a8df39712246829d479c397d252cdce1f35c7acdccc987bcb140efe62532369628b6fe9120649b7f587a4da4aeeda993a460803e78e0e8608348e7f9c1b0a0f9b485423d79743e12b7284a075827b8da08ef7d640991aba136f74886bc89b2a24c990679166909cd266b144d9e4498c5a4661266890e4c818f68c66765a1c4661186924bac0644890630b077bedb486303507be05a973de5d0bd231492d0cce65836a7341e940353914066d6c283b4cdc4612dca740eb06d4fac2c67295b0f2a54a13aac460afb4ccad85f096a542a39bab86959a9ce82ae1e54ab87f09b432fa90e2631497387713ad40de9b9039a9d54f9a992ab87959a95a754649f066d3476bc2fb634decb547b36fc5ba1f5dc4e929d50c0104107623506791b2cb380e255a81bd3723aaeea7cc195562b3d5af14e578676c29b596b0f667f10d50fd5674b4aa860194820ec41b83eb336ab928299131ef1a431a224481108640c96595b1d854acb96aa061d766fe69938cecfe72192abe8b94adc2332004052fb1d0f39b8645845bae029339cc2e1abd37a62b55654a7b0b59d8116b9be86dddbea6f69d3f01e0a8b4aa51f6b985425f41932d886b000f85e04936cba15fc245c7b8cd4ecae113da6848b03dcbe607cafa8f283936a896ab739a7c657a2c454a65d01ee9d9f2f2bf2334f05c528d4b052a1bf0b687cb59dae2704afa100f989ce715ec852a9a8194fbc4c69a0eb643237808bd9375130ea70dc6617fbb72ca3ee9ef2dbe92743b4aa3bb5a9b533d47797f512d6e3ea360e1cf5827c330e70b85c753a82e8eade475f74b37102acccb91d61e971075e72cbe1c1956ae08f58c0b74b8d30ded2d271b1cc4c27a44419368c291d40e294cc9ae2a99e7396cf1c39eb00a4755994ec64c24e669d73d65da78fb7380a8dab489132ffdaea3a9f287a5c441df4f0bc742a2d1582a880ef27fb42f58d98180d158e1d63ad11d2159620203236f09502d9a5cb4af596cd0038a5029e2ea9ffe5b9f2204dac552fbc264715a6463587274047981acdba1533531e02d2a2fccd11231bb518bfdc5243b8a8deeb4501dab40427998a7429b8aa45c1ec79d26c24c4514f15941e91b6a3433a3e0f8b671deb1b738a29d7a293dd19e45b1a8a64d628a77985128d1451850d1468a0244843538a28bb8fb065308b145291322d83dd87a0748a29d08c499309479f94514009543ac65631450282d3322228a431062741254f71e71451f71f627883acacc79c514cf272547812c1d47d6de11e29c93e0dd121224c514ca46a8988378a290b8193124768a2942236b9b748dced1e2993189a28a294c640c8958a292001960984514ce43431582a9481d088d1410cccc452009133eb208a294b8114eaa0956a5311452f1f227c14ea208168f14ee473b04c21705c4aad039a9395ea3753e60e91453440b93d2782631aad25a8d6b91adb697ef14539df2cd469068a2898c818c628a4b1a230f85ac52eea6c41b88a2978f9267c1dc507ccaac772a0c911145219995ead213178970aa5501cc82f6dc6914533901e7fc5f87a536ba66041d35fac1e0b8f5747099f3a9b7db1723d458c78a5c37127b9dc5172403d443831e2926e41a983ca02ae1d7a4514684ca7570ebd256aa96eb1a28020418c72e7a98a28ca0b4e1c2c514003511696e9d43d628a3422cad430c8d14507c889caf89dc4514108e57b463f7f4db9ea3d2d2de086f145263ef84f8317b4df77d634514eb638707ffd9, 'aaa', '12121', 'approved');
INSERT INTO `rsm_rent` (`ownerID`, `adtype`, `flatno`, `flatsize`, `rooms`, `washrooms`, `address`, `price`, `flatimage`, `flatinfo`, `phoneno`, `Status`) VALUES
('akash@gmail.com', 'rent', '1b', 1200, 11, 1, '11', 1111, 0xffd8ffe000104a46494600010100000100010000ffdb00840009060712121215101212101515151015151515151515151515101515161615121515181d2820181a251b151521312125292b2e2e2e171f3338332d37282d2e2b010a0a0a0e0d0e1b10101b2d251f252d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2dffc000110801c402a603012200021101031101ffc4001b00000105010100000000000000000000000300010204050607ffc40047100002010204030505050505080301000301020003110412213105415106226171811391a1b1c132425272d114236292f007335382e11516244373a2b2c26383f1d2345417ffc4001b01000301010101010000000000000000000001020304050607ffc400351100020201030203060407010003000000000102110304213112411322510532617181d191a1b1f0141523334252c1e10682f1ffda000c03010002110311003f00f40e25d9116269b7a19c663b08c8c5586c6de13d6788d4b2fbcfb85e713535de72c357386670e524bf1669d1d4ace48198dda246aad468a8394d405cdb40abad8ceeaae0d0eea2557c0a794f463a98cb6664f134ec960aca800d8012f2b842589034f85a677ecf6d8910aa2dd0ceaf1e2d6c73bc52b33785a9a956ae2dc105db253045ad450e9ef373344ebbc7249de4b2ce696e74476d9146a0ca6dcb949a9965e983a1102f8623ecebe139ba9c59aa8a63ac2880468743358cd321c682289202308451344662b49011c09202301808e0496592020035a3a88e04908806024808e047b44035a3110804622265221147b45699b65a1c4908c049811a6263811ed1c08ad010d692023811ed01d8d68f68f68a2687686b456928f268085a2b49da2b44c01c52568d68876346b495a2b40646349456898c8da3da3811490b224489926306ed1d0591730c70f945cee79784960e8fdf6d86c3a993a86e6e6679255b171456f65e308a00dcc931b48d3a458c230eadd8395704ce27928de1a860efde7d4f4e421a861c2f9f5870268a29704b638115e385920b289b2224808f1ed001011e28e0402c40471108f0015a2023811c402c66d8f919e1a67ba30d0f94f0ead4cab15604104820f220ea2698cf9ff6e7f87d7fe108a29d760b19c3c70f64755f6f95bee9ce6afdc60df876e7356cf170e2591bb6952bdce4628eb6b8bed7d7cb9ceb7b5b8bc03d0a4b8655150117caa5484b6a1cf337b42c31e2528ca5d49576f5f91c8c52ff0003e1ff00b457a743365cec466b5ed604ede93a31d93c235434131dfbdcc5429a76ef8e57bf8456562d2e4c8baa35cd7296ff00538d8a6a9e0d96a57a556ad3a6d4549b37fcc23655f316f7c7e21c2052c2e1f1398935b3dd6d60a14d86bce164f813a6eb8fbd7ea64c51451988a28a2800a28a2800a28ad14005145140051451400f6eed0d4b5323ae9ef3fe939679bdda5a9f657c49f76939f733c18bbc9397abfd363f458af283682658568369dd0258322448848c44e983326886592511ed1013a119b11124047024d44c271699ac5827a00efef806a457c44be047cb32af42ca54da1d0c93e1c1db4304415dfdf2d646b921c2f80e24c41234289d1192664d512024ad12c9012806b4901240470202220495a3811ed100c044449da2b44c681111ad085646d32922d31093118092b41031c092023092b46215a3811ed1ed100d68ad1ed1ed18118f1ed15a003451e35a450c6b46b494510c8c69231ad1500d1ad1ed14063489324c60b78d441b198c951a3736f8f4124a92c65b0b75dff48e5515f105b91a8f7d06c36fd644e908b4e58a3440d4ea7e5e53050b76cd1ca8af4b065b56d3c25c4a606d26229b5195880928a28c07114788440211e2884403811c08808f00108a28e20033381a9906c428d4dc7a49b203bc4698360750360621ec49581171381fed230549592a820556d197f128fbe7a1e5e33bfd87a4f16e2bc41ebd56aae75276e4aa3651e13482dcf23daf9631c5d0d5b7c7c2bb87ecee052be229d1a8c555d88245af7b136179e803fb39c2ff00895ff997ff00e6798e1abb23ad45366560c0ff0010371f29ecbd9aed152c5a02081500efd327507991d57c65cace0f66474f92e1912bed6647ff00f38c2ff8988fe65fff00988ff67385ff0012bff32fff00cceca72ddb2ed4261e9b52460d5981000d7203f79ba780929b3d3cda6d2628394a2a8e1bb29482f12a68a6e16b54507a80ae019d0d1c5f0f1c408f635856f6ec339374f6a4917cb7daf38ae0bc40e1eba57cb98a126c4daf75237f59d0ff00be74c39aab80c38a97273937398fdefb32da3c7d367c718536979af757b6dc1a383c2b7b7e262b6477148366cba6aa4a900eddd2bee96b857064c4e0f03ed08ca9ed0e4bd8d462c72a0f71bce4b07da6a8ad897750ed894cac6f972ee0103c8fc206bf1e73470f455721c3b332b86d4b137bdada5a2a65c755852df7e76ffec9afc8e97b338c6afc42a7b5a6aa1285455a5945a9852a32dbaefac1700e2271f89a746b53a229d2cf515116c0e516553d40bccfa7dadb624e2c5050ed44d37b358331cbdfdb4365989c27893e1eaad6a76cca4e87620eea7c23a21eaa31715d56ba9b7b72b6afff000ecf03c4bf6f4c5d1ad4e905a7499e9955b142b7b0bfa7ce453862e3570159540008a55c28b0b5319b5e97b1fe613231ddadcd4ea53a387a544d5bfb575d59af7bf216bdcfbe5eeccf10fd93055aa1ab4af501f654c35dc54b152c472e47d22a36866c73928c9f52a76f8e1dae7f0fa999c4aa2e2f8884d0533885a42c00fdd860ba79ea7d66a768bb46d42ad4c253a18714907b30ac97fbbf6be3398a3c402520829a7b41585415bef8b6cbe57d66d627b5cb50135307866aa5329a86e6e2d6be5b7d63a39a19954bcd526eeebe7b7ef62f2637f60c0e1ead14a66a572cceeeb9b41f747f5c8cd7a583a478861aa8a6abedb08d5196c2c1edbdbaebf09c9f0ced384a230f5b0f4aba23164cc6c54ef6d8dc6b269daea9fb58c5b53539699a6b4c12aaa8795fd62a66f0d4e24a36f6f2ed5c572fea745c238b8c42e292a50c394c3a97a6a16c2ea5ac0ff2894388633f6be18f88a94e98a94ab2aa945cbdd2545bdcdf0981c2b8e9a3fb40c81bf6842a75b65b96d469afda90a1c68ae11f0792e1ea07cf7d458a9b5adfc3d79c2887ab528549f6927b77ff00132a28a2967947aaf1dab7aa474007d7eb32c984c657ccecdd589f4e52bde7cfe2d91fa456c39320d1ef06c676e3666d0f18c8de3de75c59932423c612404e8899b1c49ac88124b34448402480892194489624f829646b9060459618d1e92369cf2835c9aa927c155b0df874f0e522ac46845a5db44d4c1de674d7056cf902ad0a201a811b6be11254eb368e5f533943d0b2248482b420336bb3315a3c711ed001011ed1478988811224425a44899b2d11124246f26b20a2424808c24c4b448808ad1c478e806b4568f68ad001a2b47b468806b451e2800d145149686344445118a808c8b18ec6305e665a889b2016f08164808e165d50b91e98e7ee9284a742da986026128db3452a43524b42469202550ac51c468e22a01e388d250014711a4a00318e04424a26028a28f100d1c45108500f145142804db1f233c35beb3dc4cc37ecbe086a68a8ff00337eb2e32a3ccf68e8a7a9e9e96b6be7e8794c95372a6ea4823620d88f59e9bfec0c09fb34737e52e47bef6118765a81db0e8a3f89d89f703f595e223cdfe4b9bfd97e7f63806e378a2329c457b74f68dfaca04f39ea54fb1d85bdd92fe00903dd7bfc61bfdd3c1ff823f99bf5875a2a5ec8d44b992fc5fd8f278a7ac7fba783ff00047f337eb1bfdd3c1ff823f99bf5878889fe4b9bfd97e7f63ca22b4f553d94c1ff00823f99bf58dfeeae0ffc11fccdfac7e2217f25cdfecbf3fb1e5714f516ecb613fc11fccdfac1b766309fe10fe66fd61d683f92e6ff0065f9fd8f328ad3d21bb3585ff087bdbf5823d9dc37f843dedfac7d687fc9737fb2fcfec79e453d0876770dfe18f7b7eb36385f64306c999a883ae9ab6c3d61d42fe4d9bd57e7f63c96d14f5fafd90c10b01407f337eb193b1f82bff723f99bf58bad07f25cdfecbf3fb1e4314f65ff0073303fe00fe67fd60697643044ff00703f99bf5875a0fe4b9bfd97e7f63c8229eb589ec96081d288fe66fd6287888afe499bfd97e7f639b15818e1e6a8e02a45d5c8f3d60aa702aa36b3791fd67cc62d5636b63ec5aa2816837786ad8574fb4ac3d252ac67a18b226f666735b040d259a550d08af3d08b30658569670b94b00da02753d0759455a151a74c4c99bf8ce168a86a25546005ed7d7d26529835a9260cd22487487512bd332caca243242640778348658d8204d873cb583b4bcb1ca03b898cb127c171c95c942d2152883bcb9530a46dafce02d39e506b9368c93e0a6d4d97c44925596ad0752803aec7ac94dc781b498ead260ca8415df6eb0a8f358e44ccdc28b48b736109fb3374bf94ae8d3a2e1aa0f7fc3e3ce6b6a8cf7b39daed93ed696947fda2874066ff001ac307b9b781fa4e65785516398a0bf5d8fbc4e4d44a50aa36c552e4d0a06f2c0590c0e0820d09d76b9bda5d0936c71b8a6c994927b15f2c710f9631497d24d8311e3e58d68b71928a46f1c42c0515a3c51011cb1a4e3110021147222801132264b7920b2d449b20ab25692021a9d1eb1f000a9d226595a604947b486343011e2b45150c423c5144028e228f0285251a388a80711e34711500e24a463de003c504d5d4731e4353ee11bda31d94fae9feb000d1af05918ee40f21f53074b04a402d998dbef1247bb6f844326d8c4daf73d17bc7dc237b573f652de2c401ee1732ca53034000f2d24a022a7b073f69ede082df137925c0a6e4663d58e6f9cb368ad10110b1c0928f68011b45692b4568011b46224ed1888010b48910968c4400aec20d84b2eb04c23432abac03096dc4aeeb188822ce930699514787c4eb3070a97603a913a331b13e4ad50dda4e90d64009571dc4d69f746adf2896e3669995289d7d61708494527722e7d656a4dafac4c488e34f7a291c69ef4513345c1cee0b17a0f77ba6952c5ce730cd6bf9cbc9527c94b034f63baecdb3890779c27f68b887a7ecde890ba90da0b1d88b8f7ce98559caf6f45e886fc2e3dc6e26fa18b5a9837c5feaa8e6d52ac4e8e76871da99955954861b8d35e92d2768296cd997cc5c7bc4e6d6a7d93d0ca9c4b56b78fd27d7bc513c8866c974d9dfe1b88d27fb3510f803acb8b52797d26cacbf987ce1713c42b53a8deceab8198d85ee3dc652c7e86cb35ba68f524a90aaf3cd709dadaeba3047f4ca7de3f49b983ed8d33f6d1d7c45987eb2ba248aea476b49a5c59cf6038c51a9972b8ef6c0dc13e866f234ce59129532d46d59692196090432882ca83a09ac22c8812604b5325a26b19e986dc7eb109311ecc453a985236d7e705344c155a77dc4c65893e0d2391f7291594aae1edf64dbc394d36a246dacacf39a78df7368c8a8b9c743eb377806388bd361beabe7cc4cb510b4f4208dc451b4f9d8249346d684ebb19cfe22894a856f6037bfcc4de53717f094f8928367b6a343e226fa987546d7631c4ea54c053c408415440fb053c846fd98788f599acb25d8d1e389683c57957d81e4d1b2b8e60c6b3faa1785e8cb71659543b8e51ff683cc194b3c43c3658cb114821891242b08fc48b25c5a2568ad17b4115e3d85b8d68a393205a52416226305bc92a426597544dd90cb24a97845a70a044320a9693023c51500a2b478a201ad1e28a0315a3495a2b45431808f15e08e217977bf28bfca200c238800ce76503c58fd07eb25ec09fb4e7c87747ebf180137a806e40f39115eff006431f4b0f7993a74146c079ee7de616218101cfe15f2d4fe91ff00671f78b3799d3dc34868f246456981b003cb492b452568980d68d48683c84946a7b0f21100f1e211e301ad1e3c5688051451e0034568f1ed00231495a2b4008da31124446220009842fecc00bb1906907279c00aae20584b4c201c4a00dc329f7c780266bd53a4a3c2d6c19bd3eb28718e2bf717ff00d8d2b10fc578ae5ee21d799fd26361417700ea5881ef956a3cd2eced3cd581e4a09f5d87ce6b49225b3aeb5879099749b5f5facd3a9b1f299348ebebf59cf22e24f1c7bd148e37ed478148e2d4eb2dd2329896694f19c4eb4cb20cc5ed5d2cd86a9e097f76b360194f8ad3cd4dd7aa30f7822425d3252f46bf52722ea835f03c9036e3c60b881ef08e4d8c8e3fee9f29f5a91e17740d8ea3f30f9c2635740dd4b1ff00b8c0563f396f102f450f9ffe465450dba6994298d61298b8f53f38a90d64e88d3faeb29229c8dae16ffbca03a32ffe579ebf56ae6005f51b74274d0f8693c77820cd88a43ff957e1afd27a8e2ea950ac07df5f713acf07dad85bcf09c5f099e86969e269fafd8eae950a6d6d2d717d0f3f28ff00ecefc2c3d651a58bd45bfae52e52c4f8f39e3ad5e4849a9766743c76ad09b06e395fca08adb43a4d1189da13da8d277c35cbd4c9c3d51956920268bd243cbdd20d831c8ceb86b533370452920218e11874306c846ea675c7511910f188011aa61d1b711ae7a49027c26dd49914d10ff65d3b69987ac19e1a3931f74b99b4df5f848dbc4fbe4f4447d52f53271958d33ecd4b123536161af899428e36b13664baf81bfc2746d8643b8f8caf5302bc8098cb1646f6952f43453877451c355fba77e436bcb590f4313608f9f87ffbb4277b9ab7ce11c4ebcc3735d81da2b49339e87d4481a87a08fc1f462f107cb16491f6dd57e324b5478c4f0c87e2219a90e820ce1c7496748f9243c2fd0a5917a945b0dd09f7c1b5361b34d12920d4a43c74575599356ad41d0cb784048b9de3e268e92d50a56026b853be489b5420b0aa969251253a0c48c404945018d68888f22ee06e40800f1ed05ed6fb027e03e311573cc2f90cc7e368980581a98951a5c5fa0d4fb845fb303f68b3799d3dc3485ca00b0000b8db4886901f6ce7eca1f362147d4fc237b2a87770be0abffb37e92cc4221815c22f319bf312df3da1c08a2022024228a280128a28a218e23c51c49188478a3888042353d879478d4f61e510128f1a388008478a2800a388ad1e0028a28a0028a28a0029132518c008190610a0758aa3df68c0ab504aec259aa6db903ce53ab8da2bf6aa2fa6bf2858f901c431cc8a10680dccc477265de27c5283808a58b66d0dac3c44ce33783d896a8726741d97a76567ea40f41bfce73b3ade0f4f2d241d45cf99d62c8f6252dcd6ac7bbe932d477bd65fc69ee4cd15906b984e79334885c60ef45058bc42dee228e8671aa7696e9095576f596e8cf32b63a42881c56d0f03891a199ce3b01e398e5cb5197a5461ee2647122e13d25fed2d1cb89a83ad4bfa3007ea653ac3babe0f3ea30bea827f047832f2ba29d7972a1fdc53f5f9981c6ada58cbfb843e27e666c96e272f2af995290d64e86dfd758d4c6b2543ecff005d634b71b66cf64fff00f2e8ff00d4ff00d4cf50c5a587a19e6fd8ba77c5d3f363ff00619e9f88a64a39e897f8cf3f5787af22f91dd866a3888d062025f7b196a957f9c86047b44cc395afe64030ab40f49e6e5d0f53ba3a219d2d8b2311b43fed1b4a6689922a6714fd9ed366cb3265d388df5855c4e8265d42758ecc6c3ca73bd24d4b62baa2cdafda6156bcc46a86d08b5cdc4be9cb064f4459aed94ee048be1d7912267bd6865afafa4a8e7c91da8978fe21bf663c889034d872324b88d64d311a99d30d6c96cc878fe0063cb7ed01ded17b2533ae1ab52ee66e08a9224cb6d86e8602a61d878cdd6a12e49f0c1de0dcc93a91b832bd569b432c6444a0d0e6d1ac3a401a917b59bd11b870821160e962ac0ae9ac75690dd0e8308f22b08b489d84ca5962b965a8306c244985ab488de55aec46d69cff00c6e2eae95bbf81a2c526ac289294b0b5d98dad6d4f8ed2e7b21cf5f3d67463c919c7a91128b4e99135472d7cb58aedd00f33f41fac2c52c5407d913bb13e5a0f86bf1934a406c079c9c513015a28a23100d19fea3e72519fea3e701a108f108a218a3c68e2201e28a3880d0f1c46b4901258c51c4568f100a3c5144021120d047119761100f1c4568f0014423c154c522eeebef80068a51a9c5a90e64f9095ea71d5fba84f998ac74cd68ad39fa9c72a1d828f8cab5389d53f7cfa690b2ba19d5edbc0d4c6535ddd7df3917aac776260898ac7e19d455e35487327c84a957b423eea1f5339f2f20d521d452c68d7abc7aa9d828f4bfce51afc52a9dea37a69f2941eac03d58ba87d083d6ae4ee49952a55837a92bbbc5d4550f52beb7f19b745c32861cc0339aaad35b80d7ba943c8dc791ff59ae2924e8cb2adacd5a697217a903df3afa5a58794e6785a5ea03d359d1523a89a4cc51771e7b9383c7d7b0369dbf136b533e47e53cf3166fef8a2acb5b23a307babf947ca28c3ecafe51f28d00308197294a2db4bd40e93ce94763a130e242aed08241c4c9a28f33eddd0b570df8a98f7a923f498d88fb3eb79d576fe8e94dba332fbc5c7ca72757ec0f213ded03bc11fdf0789a9db2bf992e249a03e03e50aa3fe1c7831f9c8e285e92b787ca3d03fb81f99be40ced5c9cf7e5fa95506a64e97d9b78fd6301bf9884a63e7ff00b4aa1d9d1f61d7fe297c15cfc2d3d271556c8c07decabefbcf3aec28ff008a1ff4dfe93d1f1147323f55b30f317d272e65fd4fa1d78dff00497efb9678261f2532a77056fe769ac89b4c4e078bcd4998ee0a66f88bcdaa753699b45261929037b8e50630e3a7387a550598f41ac545c1f7cc8b02fc381d8ef02705f0369ae9ca096df199eddd156cccfd88f3120f86226d32ed2253489c62f943ea68c5f604c45089b694c7481a98604ccde1832d64919c88645d8de6a52a232995df0d717912d2c194b332aa56d079c32e22d07570c41b41d4a444e59689a5b1a2ca9f25d5c44854c558ca563075af7f49cf2d34eaaca4e06a2e2e66f13c40e96ee13a7869efb91166b7b84cce26e495f12e3cad6607e134c18723ca937b1195c541b47109db3ac8e52a22359c8d2ea7436f2e53428f6d691fb6190fa37ca729da45b629cf57bfbecdf599eee6de4c47a4fa6f0d51e5ac8fd4f4fe1bda1a559b2d36cc6c09d0e9736d674983208bb5e797f6190fb5a83a05f999e8f876d3ddf39f35ed4fe2565e9c72a47ada75078edadcdea2546c24ea5799b4eac9bb5e638f16592a6c6d450f8aa84da05a4981d0c6cb3bf169d42266f26f40387a77bd4cd165b68653c3a59bd4cb6676618f4c68ca6edd8d1478a6a48d1478808980d1478c22043c8bedea3e72522fb4450f14568f6880568f147580080921189104d8a41bb2fbeff289b1a0e24a507e26836b9f4836e2dd17de7f49168aa66a45698edc46a1db28f4817c4b9dd9be5f28ba83a59bc481b903ce05f174c6ec3e7f2982c6fbeb1a2b2ba4d97e294c6d98fa7eb0278c0e4a7d4cca3224c563e9468d4e32fc9547c6567e2354fdf23cb495498d78ac29127a8c77663e660cc44c893159687bc626130b88086e555b4d8dede7058aae19af95574d945847b502e462d225a0cbc83549365052d06cd04d560daac430acf04cf04d5bc47c205f103a8800676816302d8b1e3ee95ea633c0c02cb0e605a566c59e83e304d8a6f0f740458710dc35ca540791d0f91998d5dba9f9485cf327df2e2d264cadaa3d33832fda6f21f59b140ea263767c9f614c9dd96e7d7ffc9af863ace867320dc69ad45bf2fce709545d80f19daf1e6fdc9f4f9ce430e97aaa3f887cc42053e0dcc469a45238d3afac500301b69730db4a96d25bc3ed3867c1d08b424489258cd3168b391edcd3bd027f0ba9fa7d670805e9f95fdd3d27b574b351a83ff8d8fb85fe93cda8fd861e3f49ee683fb0bebfa9e26b3fbafe84af7a23c18892c29bd123ff0093e91b082f4dc78dfe022c20ee38e8c0fce76c4e67dc81ff00d87ca113ff006ffda0efa81e30abff00bfd6682ec753d825be27ff00adbe6b3d15cfeeea9e8a3e3713cf7fb3e1ff00127fe937c5967a40a5992a8eaa35f7ce4cbfdc3b21b625f5fd41f06c2e5a6f4fa14bf893a9f9cd84a3b7c262f662b16a6d7dc585fadb69d0d1d84ca6da2d0a8d2396a0eba48d0a676b7396a9fde8a97d663d5c9a7a04a7b0f294e8ec3cfeb2fda4028b484ca68763b48254b8bc2b2ed22298b5a4ec3a62a6d788b0cd68912c64590e6063dac3b135da440d249069eb2206862019d606b5310ac4e9e507897b09689643d80806a02e25b47fa4167178e82ca9ec264716a0472d981f316ef0f709d0023e332b8fd4b7a1d0f42d75bfb8995082ea232c9f4b3cafb774c0c4961b364616e847fa4c5c9727c759d37f687860a52db0a617f94b6bff0074e770e351e207c6ff00a4f471af2aa38a6e9bb36fb1ce457a96fc0bf39e8f4134f74f37ec57f7eff947fe53d4292fd3e538353854a7677e1cad4120b493e72d25291a625aa7bccd638c4a736c09a5ac6ac96862da983c436bfd748df00b90257bc3fae52c1482abf687a7ca141898d3d88948d964ef226b01b9115b1ec35a34638a5ebee102f8c1c818ba828347b4a4d8b3e0205f12dd7e9175a1a8b34e0aad5503ed2fbc4ca7727727df0464f885f49acf8f41cc9f2100dc4c7253eb33d811b8b419690f214a0688e20c7f08f4bfce109623ed37bedf299945b59a66aa8138b3ea5c7b9a4608a15bc49f9c15e4b10e0981f6825e3cb68a710a24d65635e30ade335eb44f49a8942e99eebe448bfba56bc7526d22587323df2ac81462640d65ebf0320d885e87e126c741098366837afd00f7c1b563d07ba0d949042f18bcaed50f5f948dbc4c5d43a0e6a8f0836c40ea20bd9c629e106c626c48f1f741b623a03245446517e926d8c0b566e9206a34b0cb20562b632b927a983653d4cb2cbe120d0b02a9a522c92c3083643d23b02bb2c1309618413c6988aec20c8856836063b02064a9d32c428dc900799368c44d1ece50cf884e8a731ff2ebf3b4a8eec89ecacefe8530aaaa365503dc2d2de1b795434b1863aceb7c1cc86ed037eec0ead39fe1a97acbe173f09b5da06d14789333383afef09e8a625c14f80f8f3ac521c40f7a3c7633246c443d0fac00e62170ed38a4b6358f25b531cc8ac79851a197c629dc5badc7bc113caa8ad9990f236f769f49eb5c5bec83e22798716a593135075624791ef7d67b7a0fecfd59e46b97f56fe055c0eeebd449e0c6953d3eb218636a96ea0fce5ac3a779c7f083f19dd1470c8a67edac3d2173fe7fac83afef00f01f332785dffce7eb2c57b1d8ff006729fbea87a5351ef6ff0049df39fdd56fc9f5338afeced3fbc6fc4c07f2ff00fb3bb6b7b37079ad8ff34e49db9bfa1deb6c6be44782a801946c02dbc6ea093ef266e50d87ace6fb2cc7d91bfa7e5d6d3752b9b2dbf0b1f9da65913b1c4bebf7bfae51a973f382c256ccac4fafba0b0f8925edcb35bfd661d2f734be0d1e522220fbf8411ac2e0795fd7690932db2c451830313301bc92878a28a003c631e280c8b083ac808d61233468868825312bb52d7faeb2d53fa41f3f49498bb14fd89d3ce50e3600537db98ea2c76f5b4d86dbd66671cc3e61bdae72dfa1dc1f2b89b637e6dccf27bacf3cede513ec2996fb4058fc08f84e4b0aba8f21f31faced7b6af9f0aafccd400f985379c661790f3f858cf4b0ad8e0caf7dbf7b1b5d871ff14c3f80fc184f5151f213cbbb0fff00f967f23ffe53d4a989cd9e3e63af0cbca1e90da5ca49ac05112e5313926e8d90114b531b134edfd7843a8d4c862c7f5e926f728a98ad0fa7d250a98aa9e1e93431835f4fa4ce6132cd26aa8d7124f900f896e77f7c81c442b2413539c72cb3f53a142237ed1226bc8b53817a73279d94a083fb691356562a7ac131224ff103f0cb156b417ed3699dc431ab4c02e42826c09eb331fb43407dfbf9027e921ea4a58ce9ab6359b5249f382359a735fef3d21b2b9f403eb0d47b582fa51bf9b7e827366d6cd70acb588e970a49617eb3a74c225af61b4e4b86768dea10b4e952cc741a5cdfd4cea13156fefb1280fe15ca00f0b8138b1ca5a89372bf96d4beada16583823178861dc9eea9f412854a4e370479e936b8d9ca3fbd7b11717244f3fe2f52e4dd89f59c9a6d464c5278ededebff008dfea742875c7a8d6c463d57ed5441e6c266e238ed2ff101f2b99ccd60204a7819eac7512adccde347a9d24ba8f21f292f672786a5dc5fcabf2109ec8cf59707295cd388d3967d99eb199257602b324194965841342c607246cb085bc240bc940472c6cb1cd4f291350c36189924720917a87ac1e78b60086d22cd2058c8b3c06397836790630152a81b9023dc0317832f2a1c6d31ff00313f984b05a0ed02645da058c21304c64f50036304c615841112930064ce8bb1947bd52a740147aea7e4273c44ecfb2d472d007f1316f4d00f94df0ab918e5e0d99670e655bcb140cea68c0abc71b55f280e06bab9f011f8cb77bd049f051dc63d5a496fb15f1e7bd1407127d7d628e80a83ed4250de408ef49d2de72496c6b12dac791125306688a5c547eec9f11f39e79db2a396b254fc54edeab71f2b4f47e243f74de5389ed8d0cd87471f71c7b88ff49eb681ff0049fcff00e1e66ba372b3946d1d0ff5a89a343fbd3e29f599d5fec2b78acbd44f7d4f553f29e9c393cb971f891c427ef0797d60709bff0098fd65aadf6bd0caf861a0f33f29ac91117b1e8dd83c3da886fc458fc6df49d6e4bad5fc82def339fec8d22b41072cabef2331f9ce9a810438f017f2cd3cfdedb7ea7ab3da292f403c0e98c8e46c48cb6db2e4169ad4a85d57a80c3df7995d98a645120f5f768481ee337286cbe466595eec5143e1b0f9558786fe90387c377b3788f7cbabcffae5214bea263d4f734ae09b29b1958d037b8f0974c692a4d14d6e0d575bf846c48da1e3c9bdcaad805226e7a5842de3da2b41b1d0f1a3c510c85f4830fa7a435a0fd9e91aa21a6416afd2085619bd2152903ee103ec35f49a2a16e49d85ade33378e9269365dcedd493c878daf2fd6a06f799fc5815a4cdf8487f55d47ca698ead1965f759c676c32b61972fd92c2de1dc7d3cef382a5ba1ead6f78ff0049e85da7c364c35317be675727f89d589b784f3d6d003f86a0f9913d4c1eefd4e0cbef6fe86ff6207fc59fcaff0039ea69fa4f31ec42ff00c59fc953e627a6d31afba61a8f78e9d3fb85ca1ca5ba6759570eba4b689acf3e6752121d4c1635ac216926a64714971217257629e2cfcbe928113471ab6f74cd99e6ec6b8bb9022418429902271491d0809106cb0ec20da61345a65765807596d841389cb3344723db65fdd27fd4ff00d4ce415276ddb64fdd27fd5ffd4ce3d57ca733746b15b1154f285a5fd691803d63e6b6e643dcb357058a2ba8241f0d26b3f6902007d90671b1165f2274d4ce58571e70eb98ec8de8a666a0e32b0938c95336db8d3551773adc9d4ded73b5f9ccdc4d5bc051f68c6c88c4efa01b40e2f16d4d823a904f2d34322187cde5fc2ca73a54c838bf2318a9b5ac6197103a1917c50e866be6f4259ea1865ee2fe45f9093cb1b0c7b8bf917e4216d3e823c1c00ed19a12d0354caa114f88e3e9d15cd51b28bdaf6275e9a0994fda8c30d9d8f9237d650ede31f600f4acbf269c31aa7ace98628b56c894da7b1dfbf6ae872150ff00940f99959fb594f952a87cca89c29ae7a990358f595e0c05d72676cfdade947dee3f495dfb5753953a63cd899c71aa6419e358a1e82727ea75afdabadffc23d09f9995ea769eb1ff009a83c917f49cbe78ccf0e882ec2527ea744dda3ad6b7b63fcab7f7da547e2d50ff00cdabfcc44c5cd094a3a88fea5eab8a277673e6c7f5951f103a7c64aa4ad696896130f88bd441dd1df51e3bcf44cc679e60680f68adcf3afcfa4ef4319c7ac4d346b87b87bc8911031da721b9065826585306c268840c2f2eb3d13094b222a0fbaa07b84e238451cf5a9af2cc09f25d7e93bb9dba75b3673e57bd0f2c61e5696284dd99195c5aa77ccbbc305a9799332b1ed776fcc66be145a92f94cacd64b831789b77a290c7fdb8a696493a8bae9101afac96237f488ef39245c43ac9812292604c68d406356f4dff0021f94e578a53cf85a83a2dfddafeb3b0aebdc61fc27e4672ea99a9baf5461ef13bf46fa60fe68e4d546ff03ceed7a6474fa4b7877d50f80f94ac9bb2fafebf593c3b7713c0dbdda4f611e2f62fe337f4301875bd97f30f7e9f593c59d2fe10dc1a9e6ad4d7f8be19bfd26d26678b7691eb3c3280a688a3fab0025ea084676e472ffe529e0b4083c3eb2ee1ea024aff0010f75ccf35707ab377b85ecf1bd363d5afef5135f0fb2facc7ece8cb488fe323d6c2ff001bcbbc36a9b28bdc6befb1d267915b6117c1a7074beb29e22b90c75d003f28b0d54955f123e932e8756575234cc681c5d42a079dbd2030d5c9fe6b7a7590a2dab2db574684518c806d241a5848a0aa54b0bc777b0bc742b09146062bc431e346cd1b3405624fa41f3f48a9d507d2445417f7cba64593a83433378b1ee0bdb5741aec45fbc0f85af3459c10666717406993f87bc47f06cd6f1b1978d799599e5f759c876869ff00c22b6b97f68fdddf714b50a3e3380af4b4a9e77facf46ed1393837a4da9a35516e39adc653e07c2701587dbf15bfd27b5a65707f3679599d497c8dbec22df167fe99f8959e9d4d759e73d834ff008a3ff4c7baeb3d201d6726af69d7c0edd36f04cb5404b2b2b5032cab4f365c9d711246ac34f58a9b6a63567e51772fb1571ff49953531c6658919b845e2ee319192323392474220d06d0a609a63245a20609a10c834e49a2d1cd76d97f72bff547fe2d38d5a7e73b4eda8fdc2ffd51f269c5a95f09c73e4de1c12f66bfd190a996e2d6dc7ce396581c430b691479dca9707a56129a5c580b1e804b18a7011b51b1e7e1313b3f59886bb5ec45bc2f79cfd1c1d4a3558bab58b13a0bf7492797a4f3b0fb3e39e593cfbc69c556f2dfe7d97cc53cb4e36b67cfc0b9c0aa65662540eed8586a4dfec8eb39fed0b39ae0b2956cc7bbd0585a7455d18d2a6c9b824eba759cc71a661554bea73723e027b4b4b0c591bbb957e55e8613d44f2ceeaa25b4bdbecfca45ff002fc630a86db7c645dcf41396b73a4f58c30ee27e45ff00c4425a0f0bf613fe9aff00e2216d3dd8f070591b40d612c5a06b89a24856729db05bd017d7f78bf233cf715a311e33d0bb6247b1034d6a8f919e778dfb4de667a18d7f49339dbf3812640b462d065a665042623201a4ef26e85c90906324e60498dee344ef0d44caa0cb144c96058a9b4042d43020cdf1a2645cc22f7d3f3afcc4ed967178417ab4ff003afce766b393da1ef25f035d3f0c3a889a32c46711d045a40c9b08269a262373b2b46eecff00856dea4ffa4e9c998dd98a396966e6cc4fa0d07d66c4f4712a823926ee4c787a6657842d607c8cb24c4aa6e7d66e916403f844c14d5879cdeae7bb3083b3799cf62cf7cc690ac7527c629a51341ab72841ca0eaf2844d84c5a1a2d24208348413168d0761a1f23f29cbe1f43eb3aa1395d98f99f9cdf1ba8b329ab923cff0088d3c95d874a8ebe84dc4052fb2474a87e77facd2ed325b1153cd5be00feb3301fef3d0fbc7fa4f671cae29fef83c39c6a4d7a7dcd1c48eefba68f642906c4a03b0049f8ccda87ba3d0cdfec152bd766e88a3de6ff0049be67e5274cbce7a3d3517b0e421f0c9624f53f2b995a8f33e32d618dfe3f29c096c77c987e014c1a42db1a8587ad8cd1c0e1c017f13f5953b3c07b15b6d99ade40dbe934b0db7f9cfd66191eeca82e08d5c303763d3e91a8d216b7422587d8f94150da676e8aadc2d7a41858f590a7440dbafd619a457eb253745b5b932244249c524aa05569dc5a3b25c5a1228ec2865115a3c510c8658b2e96938d1d8a8af4a8d89f1bc614b5f7c32feb189d7df2ad91408d13623accbe308decf4db3267b7e00c335fc26d9da66715af92939deea5479b682fef9a6293ea467952e96733c4a986c0e210fdb566671ccb060c1bc41005a79dd517f5561f0d27a82e1fda52c4b74a66801cec896b9f1379e62a36f03f3044f6348f692f8ffc3cad47317f03a3fecfc5f107c6881ebdd9e88699b89c0ff66e97c41f0a7f2227a211ace4d63acbf43b74bfda4128a7ca594582a50eb3ce933b22429a6a6356a77d611627937b955b1471c26509af8e132049cbc22f177119132522672be4dd11306d0860da6522d026836308f02c673c9168e7fb67fdc0ff00a8bf2338a566e87dd3b4ed83da87ff0062fd671eb54f4f94e0cbc9d10e08e563f74c0e2299b1d2da75967da1e90588624116e5338b765cb83a8e15856c35465cc0ab5356076dae0e876d65bc56369837cebf399b8bed0506a469d9b314b5ec37fe84c3f6cac2d71ee9e869347a6591e594f77dab7afb9c79726592aa3a8a38a4aa722bb29d4dc01b0f31391ed62915d4662daee6d7d874d21d712ab7d4dcf84cce21df65cbaf7ae4fa4e9d5654a4a107e5aefebbfc058716dd72e6f82d2e6f0f7c8bb37849a83d448b03e13c83b4f5bc2ff769ff004d7ff110b7305843fbb4ff00a6bff8884bf8cf723c1c142d606b4313e30158ca0390edea9fd9ff00fb5679e577bebd67a576bdc0a2336d9f9f94f32aa749e843fb69fef939a4fcc04c8349983790f92860d241e0ed22626c023bc1131898d1089acb14655496a8c0a0d54c12c956306a66d06448b9c35bf7f4ff00389dca4e0b8403ede9ebf7e77a8270ebdf9d1be0e186531c98ca0c720ce44cd9a22c60d8c234370fc3e7aa8bfc409f21a99a4537b12dd2b3aec151c94d57a28f7db5863118b2cf592a38c68f5dac87ca4956071addc3264e931c55b450c1addc79cd6c63594f94cce1c3bf2ef136ee1f4986336c9c984e628cc358a5d88b55beb269b48d7fac9e1d6e266f912e0b34e1041ac9899335411672d881663f98fce750b39cc7ad9dbf319517b325f28e3bb594ed5d5b93521ef0587cad3047da23f83e46753db04d293f8b2fbc5fe86730ff006bfcadf2bfd27afa495e2478baa8d6665e63dc1e93aefece698fde31fc400f403f59c713dc1e6b3bdec2d1cb86cdf8998ffdc7f49d5a87e52748bccd9d650da59a8722661b8a6cdf032953b897314c3d9ea3fe57f4271a3aa5c1a1c00de8ad858677ff00c8cd0a1ffb999fc09bf74b7e6335ff0031b99730e753ff0054fca73e4f79971ec59274f480a0e2d6beb054c9b30f0329e16f9afafdaf80b414366272dcda73f3910df3b7ade46bec7d204a9ee1fe317f7ef334b6346f72ec62632c55363e520bec3de2bc8d21a0bc891b79fc23a0b097881884801ac4161235e23188d4180100dafa990f682f1f27fe5f483344df7e72d511b8776b09471590a387fb391afe03acbb512e04cfc5e0bda2bd3bdb3215bfa6f2a15dd933b31783963505bef61ef57a137ee37e62b62679e716c3fb3af513f0d53eebdc7c27a0709c47b3aa0117cee28541d2b20b065eaa44e7bfb40c0e5acb540d1d729e9986df0f94f5b4d2e9cd5ea8f2f347ab15aecc27f66c3fe21fc299f9813bd77173387fecce95eb556e896f791fa4ee6ad1d4ce6d6b5e3bf923ab4b7e120d49b69615b595e926821d5759c123ae23a36a7ce3b191a6ba98ec24f734ec55c5b5c5e63acd7c52596de332164e5e1158bb88c632568d39a46c88182785304f329234401ccaee61aa1956a34c5a2d183db16fdc7ff62fd671cae7c275bdaf3fb8ff00ec5face3d1bc670e65e63a20f60cae7c3dd27ea20c29eb2414f59cccd4453cbdd09493fab48e53626fb5be768f4c18d5aa6086aa9e5ee83cbe524ec6fbc6cbe31b6ef7016be106e4f849e4f1f84838f1f84112cf58c293ecd3f22ffe221403d24309fdda7fd35f9087067b91e11c00ec7a083aa259cd20e2f181c37f6820fb051ffca3e467035321d067b5b7b5fbdcfd27b3710e1e95059d430bdf500ebea265d5e0143fc25fe54fd275c3325149a3278edd9e4c517f10f5b890347a15f7ff00a4f547ecfd0ff0d7f957f4816ecdd0ff000d7f957f48de65e83f09fa9e5e70e7a0f788e9836621428b9eaca07bccf4c3d99c3ff86bfca3f4826ecce1ff00c25fe51178cbd05e13f53ceb13c35e9ae6655b7854463d760652d3a37f5e93d3cf6630e36a607a463d9ba3f87e7fac97955f05784fd4f3345fe17f4fff0025aa2416b00c07f11171ee13be7ecc503f77ff002fd644766680d900f43fac3c541e1b380c4d5506c2e6083ff5a4efaa765a81fba3fee1ff00b40b765287e1ff00cbf596b3242789b397ecf2e6af4f4d0313f033d013ca66f0fece52a75054506ea7ab1e56e67c66efb2f09c9a897892b46b8e3d3c8107c235e1f279c8151e33051346c0b4b7c0ea65ae9e371ef12b1592a0f95d5ba303ee33683a69912569a3b6b4568f78a7a4710d695388fd9f59704a3c48ed32caea2cd312b9221c306b793e2cda0f3f947e1a3495f8cbea07813ef99c1f96cda4bcc504de28f87d6f14da2b63397258afcfd24b04fb8eb1ab8dfca0b0f21aa625c1a00c9080a30c26325b9b2e022cc2e28bdf266e0991c546a60bb89f2731da95be1f37e1aaa7df75ff00da71d546a3d7e4676dda05be16b75097fe520fd2714c6e01bf433d2f67bbc6d7c4f2b5d1ac898766ee2f98f9133d4fb3147261a92db5c809f74f2b099bd9a7e2703e169ec1805b281d05a76677748cf4aa94997d1613881ee9b5bee0f7b7ff00b0497b8b45c48f708ea47bb417ff00b8cc626b236f83530b453f2fc2f2de186a7fea1f948d14caaaa39281f08f863de3f9cfca7249ddb345c8665001f2305855196f6e661ea6c7c8c0618f73d4c95c14f92cb8d2453ebf5926da469edebf593d8a7c858a28a49628a308f002224a414eb27062428c63c89300644efeb18ef199f5b79445b5954430836815de111c1102ae337ac69720fb1cbd3434f1088e2cdfb43b2923bb516a585c1fc43a42f6d707ed28b81ab277c73375dfe179b98ec18ac00b9529503823a83b4e27b55c3ebd5adec92be4a6141b1045c93624b29d6da4edc52eb9a95d3471ce3d1171ab4cb9fd97a7eeeab732e078d809d7d5e7e738aec0609b0d88af41c82c1148617b105b422fadb5f84ebdeb6a7ccc5aa5799c977afd0bd3ed8927d8b54e144ad49f41e70eadace3923a22c92ef1da450ea63b993dcbec57c6ed3144dbc66d31409393dd45e3e599b538ed01bd41bdbd7a4d006621eccd3e6cdf6b37aebfacdc0b61395d9bec3181710c64184865228d7369419e58e32ec8a08476b9b594026613636a7ffebd7f546fa0333716559875f0cd501aa72e5359d6e4b3586736256f6be800f395388602c8ad97296a45c1fb3aaea7bbd3eb6eb278318ba79d4238466cc55d1f2dc35c11a686f695b16d5b20423bbdeb019af724137cdaefacf4238e5e326a6ba7d3ee67d71e8ae9dca98537506fcbac3dbce52c2232ad8a9963daa8176d3d09f909f373c72527b1dea4a8b94d29b2dace4d88b82df68fd9d8d8588f1bc0d206d6cc4db4bc618b0a8543b056b136047f46d78c2bd102cae0f858fcc472849a4a9fe028c95f2448d77921e72b9adaf3840e3a999b8b2ec2127ac1b988b8eb205869adf5eb35c1865966a0bb9339a8ab3d7f083f769b7f76bff888703ca0308ddc4fc8beeb087bcf59707092023e51231c4a1917a6206ad116961a0ea8d23b1229fb212268c310231111400d1913461c88c44405634247d8cb0c246050034a0dd3c2593a4630029b2784132784bc60dedd200530be119a586b419f5936c0ae5e4098732040e915800bc8930f6f09123c22b6075780a99a9a37f08f781686bccee04f7a56e8c47c8cd013d383b8a671c9531c4a1c47703c26bd3c0d422f94dbc74995c42990e41d08b4c752ea06b817982e04693278bd4fde1f0026ce186939cc7bddd8f8cc5caa06f15720f841a450f804d3d229d11952327c8f5fe90140eb0acd700f5101477953e4ce3c17a943895d3787598cb9348f04c1999c4c6a7ca695e67f101def4890d9cfe357352aabd69b8ffb4cf3da0d7453e9ee9e8cdb907c679c0b23544b8b0a8c05b622f6bcedf67ba72470eba36933678152cf5e88e84b7b87eb69eb383fb37e82d3cdbb19872d54b004da981a7f137e827a6504196d9d2fd330f94eccd2f318e18d632c523acad51b3d50bfe5f325831f7012ae3789d2a67266667fc2a3311e734f84e1adfbc39af6d01dc789f12625b206d3674a6430a7bc7f337ca276ee83e03df2af0c625ff9bdfa4e54bcacb4fcc8d0ad5400413c8c061aa0f677f191c421ef69b83eeb4870da47d8e53d624974fe03b6d975ea00b7f012b60f179b4b5b5f87586a94ae96f003e12a6070855b31f48a2a3d2ec6efa91a9791264ad11132352286e2266d6de124a2315d6f18762b7b539ede10ee74064020cd7868db44c78214e0729cd2cda231263712a55a67303e109ecf5846fa446575134468d3b40a52ef5fa196c408de09bdc6d704952d7338eed15419ca11a0a6493f9982fc05ccecface4bb46a335322d9bda5bce9eb981f0b4df4cfce61a85e52ff000dc38f6e2a0d6f44213d546a0dfcfe7346a53173eb327b2ed603f092f97c12fa0f84d9ac7530cb7d743853858f493e70eabac1d2dbd6141d661266888d35d4c7aab24bb98ed26f72fb15b143bb31966d630e9315449cbeea2f1f2c94568f1c09ce6a44ac62212d1ad25a195eaa0256e01d79f918fec17f08f747adbafe6fa184b46a8017eccbd3e26336117f8bde61c4702142dca8b814248e5a6e01f988aa708a47ee53f545fd25952331048e5f5850be3348ba544b322a767e81ff00954bf907d257abd97c35ae69d3b01bf78587be6fda22bca3159ccbf63b0a7fe58f30ed2bbf6230e79541e4e3eab3aec916487445f61f53f538a7ec251e46afbd0fd2577ec027e3a9d7ec83f59df849264d0f91f941638c5da54c7d6df261e1d2ca00e4a00f202182990a00803c87ca13319cc683e58e2443c706340c91122eb79232263b0400d2906a6658223186c32a943d0c8153e32d990260d0ecaac0f8c89265a2d237887653690612e348b98920293341339971ad06c0784632a1790679619441b28934c00832261e961cb1b0ff00f25f4c10a7621598df723e4394f3b57ed1c5a7f2bde5e9f73486372329e9906c411a460b34f8b5204071c8d8f91eb2e767382fb639dae107fdc7a794d3d9fa9fe2b1a956fdc9ca9630bd97e18ee18ea1091a9e679da74f4b06a9b58753bb7be199828cab6161600741ca012c7ed5c1f39ecaf2c7a4e3e5d87b5b506fface47889bd66fcd3a564c877d08b89cbb1bb93d58fccce6cef648df12e59a1c3d75be9a293af94e3ea1bb799f999d5bdc53a846f9081e6741393af5129119d8037d86b6f39cd9f510874c64f936c716ed9b3835d2287e1b44b0b0e978a76a95ad8c5b4999b8217537e44da453711601b46122ad357c2325cb2e2ef2c032aa9da581266b72e2c9de67f127b11e5facbd7997c64ea3f2fd628f2391c9f6b716528542b705885b8e41b7f85e7034dc28b917b9b7a0d7f49dd76bd2f877f0cade81a70605f28feae4ff00a4eed2ecbea7167dd9b5c3ea5423251f6bf8aca5afa699885e42779d9cc0357a67db83ed91b9934d8ad859982ede7ce71bd97a9ecb1b4f43f6d96fd5181b823a6b3d3386571fb4b07b021722f88d0afc27737bb5471d6c9df2cd1e1d804a7b28b9dc8bfccea66ee0d41d26715b19a1813afba652dd596956c6b2ea04afc352c7f98fca1c1d20b876ff00e5face4ff166abde45d71a1f280c2fd8961b9c0613ecfa1f9c85c1a3e431da413949df483a5b8f28bb03e5162318f22c649a12118c40c4d0004bbc28329a5705adce13dbe834defee9728b338b2cc46458e9194c82ec673f2903505fd233dfe065714cdc794d12466d970b80201aad8c9b53b81e502f4c5c79c229049b0ded2f7fca672fc6d2e86a0b66a64900ec45b51ee9bfc42a64a7508e545cfb9499855db3ab20fbc808f59be05dccb26ea8afd9dae43fb317ca155d6fbae7fb87acdcaf54e63303866282d56045b3b0b783a8d699f41a4df2f35c8bcd74678df9792e517eedfc443254d60287d93e621517bd39255b9d098546d48936fa40d35ef930a46fe521f268b82b62ce9e8264acd4c5ae97f0133164e5f75178f9648478c63ce735145146264b600aaee3f37d0c948553b79fd0c9030b02724240193060032a024e8361f58ffb321fba247da804defb0e448f78935c427e21efb7ce5a10861d7c4791325ec3f89bdf08a41d8832528903ec9bf11f5023846eabeeff00586023ca420367e8a7d488eecd94dd791e70d2357ecb7e53f28c0c1a6a6c3c8428264299d06bca4c19c46f6388c62bf944d180e64498f226f1821131888e4c89318c52262bc8c56031b4890248c8110190b6b07504993682768ac60d841b5e14b0906223180632546866d761d7f493a74efe50d511b915f233c3f68fb4fc27e1627e6eefd3ff007f43a70e1eaf34b80f875ca3ba259a4b7d083aee08b8f7ca786a8e0d9b2dbc089a54ce86e797a89f2795bbb66f229d5c3a0b801ac74201d2dd676785a4aa815458002de538aacd6ddb4f2f8693b0c154bd2423fc35f94fa8ff00e3591a9648bf44ce4d74768b0af7e9a7858c8e4522c7e3bc0b54304f58f9da7d3bc896ece25060f16d90153c85c794e5aad5f67a904b1d979927e53678863c0d45c9b5b4d6de539ac4e38a12d90e63cd8ebee9f2faef6b75cfa706f5dfedf73d0c3876b901e21c42b20bb9b311dda6bb2ff1375338dad5db312d73353195cbb16737332318c54dadebe1d6638136ee5bb6692e291e8bd93c767a4186e0653e914e7fb118fc8d513705437a836fac53dac1a84a0949ee724a1b97b0a7ed44921863afa47067b0fb1cc8baa76968194e9ed2d21d24cca892999c6bee9f39a57999c70f754ff11f9498f23970727da9ae128393f79328f33383a2bde4f49d776cb1415298b037a97b1e807face4d1eeea4f3613bf4e928af99c595b727f23a1c054031541bf897e3713d3aae116a5811a95b661ba95d8cf26a86c51ba5bff0029eb9876cca0ded9a9dbde359d79b69a39b0a52c4d7c45d99c43bab072485365277db517e73a4c16f398ecf62d541c39eed4563707ef6bb89d260dbbde92677b847dd4cd8aa6ca7ca4304e396bddfaca7c5490a4f5b5bcb9c27095d5ac3eeafd67338f91b348bf31a589ad61a749570989fb03a8d7c258c5d3ee9fca657a385b1a67a0d7ce447a7a773477d459acc4212395fe70181ab998f97c74ff005962aa5d48ea7e703c3500bf991f189574b1ff00922e090ac34f51f38583aa74f599ae4d1f049639112c510194948fb4ff0035e5d1479743017fde7f9a5a53de3e5369b6651a0b68d1032a57c6aa920f299c62df05ca4907aa7eb00cfb4cee23c6e9d3ddada5f5e876f94cbc5768941b277cdb40badefcefc878ce8860935c1cf2cd15dceb11f494ead517df9ce453b4efa87cc801eed806cc08e76da1b01c7293365ab6f6973642df7795c0d2fe129e9dc37625994dd235fb458dcb46a581666a0eaaaa0b12cca401612870cc2d622931a4e2f45435c5ac6c2e0833529f1203600795a4d38caec666f3c610edf89ac70b72b31c601c550cc8da54620dae2e56ca617198f08093c88f89b7d66b7fb5c6f6004a58fab42b29574bdc1175ded1475f8dc929340f4d249d04c163c5ac48173a5f724749a147100906f79e7b5e91a754828eca41b556b936b5f2adbec0f89864e2acb4d96d56a02e56c3b8c05868587ce76cb4ca5bc5f271ad438ba923d1293dd8c2d53a1f29c7e0b8f01912d77b7d80752be0dcc803d489af4b8b50704e76516b82ea56e39917f1d272cf4f24f83a61a88bdacbf8b3dd1e4266accc5ed207210a54009b2b95395bd794d10c00b9330d441c124ce8c1252b68918a56a98d41cefe52b3f103c801382538a3a945b34af035b10abbb0132aae298ee4ca8c660f37a16a069bf1152c145f53bec3632d23ce6ab6199b90b78cb14a938db30f26312ccfb8fa11d10326a660fed6eb605ed7d83006fe5d61578bd880c52e4d85c32dcf406d6bcda326f84ccdc4dda6753e90d6bca34eb38fb549c7958c22e3d39dc7983358c910d32cfb043f757dd1861d79661e4cdfac64c4a1d997df0c0cd134483f62793b7ad8fd23e47fc40f9afe8612f1e020599fa29f523e92356a1ca6ea7ec9d883ca1e0b15f61bf237c8c76063a6c3ca3c8526d079093cf38ecdc578f78b308d7118e84498b3466f03185e301168c4c9111ad0190d22223b08261001c883223130388c4aa0cccc001ce44f2462ae4e8a8c5b7489b41b5a07038e5acb9d2f6b91a8b6a3c21498e32525681a69d320c2416983bed154702456a5e791ed4d73c6bc3c7cf77e9ffa74e0c5d5bbe0b9488da5836e8255a2259433e4a7c9dac92d01b8b03e00184b10a6e46d248be4243197ca05edaef33bb7465dccfaf548e57f23cbca757c1df350a601fbb6f76938b7001d5b5f23627c3a19daf014070e971d7e73e9bd84bfacd2ff005ffa8c75bb417cc3392bf681f4991c4b1caba1700753b99a3c4311a6453e7fa4c0c461a91bb544563d49b9f4e90f6d7b45397f0f07b7f957e9f731d3e3bf3331b1bda1a084d959c8f3b5e73dc438f0a8db65f3bcea32e114ec74d81da0f18f85a83bf97d57503c27958658e0fdc93f89d7bb38fcd9b5264332bf75bffc9a58fa1830494ac54f25b13f19935ad7b8f7f59e9c1a92b56be9466d3453ab59a81251ad736f4fe84501c4f979fd23cf431c538db319727778731c41d13a5e16a2d8cfa16ce22d52da594da56c16be8259bc24b61a74c9ccee367f760f461f232f9333b8e1fdd13e23f4911e472e19e67db5ab77a6bd12fea4ff00a4c3536653e2268f6aaa5eb9f0451f5faccc73b1e8677e3d8e496f66ce2bec29f03f0b19ea5c35ef4148dc007dda1f84f2bac6ea9a723f29e91d93af9a828e7915878f745c4e9d47299cda5f7648b1c5f0cccd46a531dfb80c475d3293ee33afc17da13168b656bf29a9c3eb06b30fc44788234223e509ae96fe26d6335403c4096708a033002c2ca3e129b9be41e24fba5cc39b335fa8f94e49fbb5fbe4d22fcc131a7b87cad15f5129f11c7203ecee0b020b01b85bee60b13c5a9aeb7db537d2c39931471c9a5b0e59237c9a35cfeb05c30777faf19ceb76a95c1a812afb356ca494b722735fcbe732ab76959db2e15dca95ef596e54826f61b88f2e3962c4e524fe8aff004271e58649a517ff000ee719c42952177703c39fba73f8eed601fddd32403bb683dd393ff685266cce5f35f66b86d37bde1e962e83e9b9bec794f9ecded449d2dbe68f5e1a65cbdcbf5fb675c6ca83d2567edae28725fe5e5332ae1c2d4b82ae092353b0e464fdb521b91727ec817d3d369cb1d7e79bac7bbf81d1e1e28add23630fdacae4666a0879dd5b29f8de5fadda0072f75ef60ce77f660ed9add4cc56232feed6e79a9ee937fc27607ce5ec0f04aae2e7fe1d14dd41d599f5ef375ff59f4becec79d47ab5525f05dfea789ad9c1be9c51fa961f8fb16cc989451f769ba1008fe27b684ea651e298a7a8d6a995c9fb34693777f33b8f95e74d82e194c53c958ad42492c720d7a0f410230387a7a5350be9f533d18e4827b2fdfe4713c536b77fbfcfec72f4b0b51b44464b7e33ed00d3ee1e92743833b122a3d3a6a770832e6f3f0e73a76a5a5b31f495530c01bdafe72de6b08e9cc9abd9fa282e959d4dbbd975cde7d21e8f08a34d4594124662585dafebce5fc56282daf957c3eb281e20bbb30de7c67ff24f6bcd25a6c2ddf326bf4d8f5745a357d725f22be270ae755aaea7c2d6f75a673d2c45eded4ff2afe9350714a67637f4fd60ff00da880dede1cb69f290d4ea52e9b67aea2bd0ad4787543f6ab54f4b0fa43a66a22eae7d77ff0058e38ba5f6d62ab8f47394296be800deff00a421933b9abbfa7fc1b4ab82f60f8bfb55162a0f3d3427c75d257e21491dd0fb36b837b2b2d891d75da7434690cb62abb6c394854c2236eabd36e53f55c39142297efebf13e6f261949bdcc3c470e46657f6b9691bdd6ddf56deea770336b1f88e09e90b971589b126aea4b7260a36d34b739b2dc2e91604a96236ef35ae36e72d54a6a05b2afcfdc66be3d197f0c9f270ff00b192c1cd5a9989bb6b653e197909a82a68359b353088775122b8341f744f3f5cfc5aa3bb4cbc354635c9ea64d6893356b534452e4580e7627e115301ac54d3b13a778127a5809e72d3cd9d7e2233d3097e44c28c381a1b0fa79cbcafecd94146736d5c6c189b0196fa4bb8842ca42b6527ef581f81de5ad345724bc8fb18351ed7029d5beca4a9ca4ec09b7284c161f10080c9434dd8e6ef5ff08b696973f68297666a84053f73ba728d5aeb7ded7b4c65e2f519d6cd7424b32b051fbb3a850d6b683ad8f8ce858e2b844db66b63eba5fd9b516a86c34b0b1077b1bec2df112a7b0a6c415c3329537be4046ba75d4e9ca4b0d8e4a85487c420a8480b9014d34b8600d81f39b14a8955cb9c9e8d6171f0b46c5c1468b0a6bfbeaf9731e60213a0d8efbf491c5540c1512a8236be5351f31d8823416f190ab8ca22f9b134dbf37b3210f5d07c251adc32901ed958b2b6b99351ded4b5b5d3ca15ea06baf075b7f78f7ebddb7a0b48e2929d336bbdf4dada5f6f7f84a9c3f87300b96b12a5816b6617503ec8dade734a9d60bdc2b60ada12c1ada5c33126e0ef2690f7281c4550c422d5702c2e329d798b132d52af5480729d7aa907d658acac6eeb50852a74196db6f9a66714c6b2d15ca2b1b3a5d9186d7df329371d445d37c0177f6e61ba7c7f58d88c6828c2cc09461f0339bff6a14a7516a96aa335c5ded52d7d86517b5874e73630b84cd65295d1480c1bda0606e2e54f31ee8535dc2910a6741e424ed2f55c1d302fa803c7f598d5788e1c0ccb5598036baa336badfec898f86cab2de58ad2bd0c52b9cb4d839b5ca8fb40756536225b6a0e3ee98ba1aec5583223111cdc6e0c62d174811b98d78f710556a051726c0487495b1adc933c136206dbccfc4e3c9d1741f1b49e1f4058cf1757ed7e9db0eff1fb1df8b476ae7f812c66342025ac3e7385e35c50d6622ec17602f6d26af1ae225eebb0f2b83e739baa809dae761e7e939f029cdf5e576ff43adc63055154771d96a4570c80df5cc75dec58da6a93680c1d0c94d53f0a28f70d654c7635002aad736e5cbce7bbd7e162ea7d91e57bd22388c4dcc250331e954b99a944e827c9ea1b949ca5cb3d1824951a94ea5a5da441f09954aa4d0a2fce79d9223932d043e72af10a86f6041b01a78f9cd1c31bfd7c662f10c32e72c8c54dce876ff4938926f73283b9152a5373adf6eb3b2e1f5cae191ae3ecdade373389ab46aef9f417d8833a6c31229a2937b28f8cf574fabfe16339ae5aa5f3d85a987552f890c4d5637cbb9eba4c2c663cd3d1d47811b4dac4616e090f636f4f3339ac5e0d4e953144f805d3e3383074c9f99feb638ba5b153138b2dde00199b88c4b9d97d25da98114f5a75d4f8180ad8f2770b7ea06f3d3c697f8abfc84efb997571c07dba27cc497b6a656eaba79cb357100eea251655d728b78729d51a6b8a33665f19a9603f37d2295b8e36c3c4c69eb6082e84734e5b9e8341b430f5deed2a614e8615ceb3d9ad8e6ee5ac2b907432e527bdefd666d069728b6a6535e50ee59bca1c645e8bf82dfdc44b65a55e21ad371fc0df23325c952f759e3bc66a66ad50ff001dbdda4acfb458a6bbb1eaedf33198f7677a391706db2f769ffd3f9da765d87c4fee8755047f2922df29c950d692fe41f29a7d88c4e5a8e97d9efe8743f113b3531f22672691d6468f4baa6eb9d75b811b178c3469e651a822e6da5c8b293e17b0bcadc2ea652699fccbe2a771e87e72d3d3bdd4d99482083cc1e531c33b46b9a04b01daf1ff003a95442a0ab102ea18d8efd2d695789f68e9b5467a78c7a5a28ca29920d86e2fce66f0fe0f8aa6cca95aea0d973dca9a7b82dc8ef6f49d152e174557f7a94ea36ffdda8036fb23909d4de284aff7f99c0a19b246bff3f4660fedd49d09031194b5cd53ad5acdf889d828e4253a589cc453a75ddd59adecdc6b7dfbc7f00dcf5b4ed8e5cba2a816b6800d3a0952970ca59bda0a6335ad7232923a69ac239e2f72bf8571d8abc538864a3903166006a45eedb5edcfdd2a767b1550d227b884b1b950003fc579af5932ec29278db337fdda4e5b1fc4550b05398dc93b655bef703763f09866cb18c7ca74e0c4dcad84e27c2a939cce4bb7526fee9875f85a29251994f50c47d64711c518f3958e249dc99e64da9727a515d2584a4df7aabb0e84cbf85ae94c6c2631ad206b8bee3df222947dd45bdf93a31c5e74fc03b494dc0a4ffde0d893a30e97eb3cd91d9bec863e40cea3b39c055887aa5c90410962177e679ceac536f639f24635b9e914b11717d206a0b9cc564a9d06fc209ebc87a4b070be26f35b499851572c714e5a144016f7c92ada2b2923371bc3c3a9cc011e3d672d5bb24ecd715994741b01eb3bb7a7712bbd3b749c5a8d363ccee5146d8f23870ce2d3b1bd6bd5f4b0861d8d4e756b1ff34eb23133997b3f02ff00136fe226fb9cb7fb97479b553fe732f70eeccd1a2c1973defb9627e73723da5c749893b5125e593ee1913e518a6d055312114b126c06b6173ee1321fb482ff0060dbc7737d06db6b3d139e9b36d93bd612446ba65f2d3dd39bad84c5356cc2b2b6b982b5c0a6a76361a373f1d04d2a34ea61d59ea546aaa35b6419ff009ae2f21c915d01f18ac14b2d890341627d3498b88a388756f6bece98b582e676058fe500cd0abc78023f7554a9b59801624f4e5cc73815e2bedad7a3580cf65617b86d75b8e5e323a99a243f06a0eb4d52a87ac1893988ee2a81a0cae730f74d4a75e906f66a5011a6516b8e76b4cc7a5490b55aa6a8d2e4b3dc6a75ca01bdf61b6824931b8775cd4c1b816cc12cea2dba961a902434d944b1f85a5de167a77018b2fd965bea0ef700ee2dd2470d8ba14b4159c80b7cb6b8e5988196e3af84961302b5007a82bf3b0a8c092a75fba76d6d6bcb5fecba1bfb35d2e79db5dee3623c0c2d012a0aac0bd12bdefbc3bca6dcf2ded29e2f84bbb663540d45ed4d36b5ac2e09f7c99e2014aa525a7932e96d0a817d4d3b0b2e92962aa6299fda53d52cb60ada13cc907503d75880bd87c72ab9a24d3baadec09164ea41007ba1b154856a760eea0dbbd4cd9bd0cc7a1c1cd546352881519b562d9330d8b5941b684f59b586c0d3a62c8aa86c6d6dfc4db626275d80c16e0355484a593d98b58b5f35cfda2c14d98efbc2e0305fb3d5aae18b922c7385a74d46841b8b9f85a6815c4df57a600fbc4660dae8480065f940fb2c4b8ccc30c6f6b0b1b9523517234858cb69c457206254b6c5699cf66d01cbb1205f781c4252ad4cb9a6a416d73feedaebfc5d7d6d08ee68a16c81ada85a74c8398efb5fdf69955b8aa55016b51c9ddcca2a1205eda96d340224ac0b54388d0a6001ed74e5736b13a9cb9ad6f386c2f11a151b2a66467048d002ca3ef0b5c7be4385e2e92a8ccd8757705885d2e2f7d4b6bcf9cd154a60e70a809fbc02ebd0de0c0a55f84e73735ab837e4d97d2cb68f88acd4402d52964b01dfcc0e9b92fafc646b63dc385b2d98902e1d5f4f0b6be731717edeba32b20aa85b4234200eb617062f981b989f675d7d93d983283607420ea08226762bb3970ab4aa3d30a08b68fea330241f594f05c14394a8571000254abe50577b32b5c305f2f74e89f0eca8129155236cd76f4bdefebac06660e13ec88a9497355b59aa333963a5b365bea65ba18aa8ad932567b9273be45034bd8680dafa6b2856c0624862f58a8249b0d6c3f30b5a58c070ab0567aaf50d8df5390df6d0ebb78c0468515a87fbc34ca91b01620f217bcc9c461ebb5ec29d35bd812f7d89e7e26fa5bd61b89e10d5ca94b1029db6543626db8eeb036991c470f5e91542a2b000321219b2b060599cb1276b81a1e504334d383d7dbdb29b917256e428dedd49f198bc6eb0350a2925574f37e67ca5d6ed2551a8387616160b99ae799b8dbd4729868a58ebcf73f59e27b633f4c1635df77f23bf458edb932c6085ced07c631361941f4bda5ec3d20a2f3278ce342ded90789179f338fcf93647ae8c1ae8377553d0ab8bfaf595b00abed91acc42b86d3f8483038bc4e63b83e571f39d0f64308acf9c8db6fd67b129f830eb6734f74e8b58fe22ce7bc4a2fe116cc7ccccefda835f28b0d80fa99d2f68383fb6a64a7f78069fc5fc2671f86a2549437bad81bfe2e727f8dfe2b1db7baec72c3174c8d2c299ab4a63506b19ab4df69c1991d08d34496e9dc4a141e69e1ac749e764d8991a3806b6bd04e771ac2e5ac773b4df7ee5363fc3f3d273bed57a9bc9d3f764e3e5b2be170cb55d402c0deedcaea37fd275555c01ca66706198b3d869dd1f33f496b886211477843349ce6a2396f22862d48bb8a84796de569cfd602b1b1396a75d819771f8a673fbbca39587499f569d6fbca3e179dd821d2adbdc4ca18ba7529e8eade60137f294dab37f86f69b0bc56aa77431b0ebafce06bf1377dedee13ba329778afc4cda3316b83a588f3120e6d2d55a97e4253c499b4776433038a3dea5ba2fc4c52babe6a8ede3f2b08a7adeea48e37bbb3d1706dbc9d57d667617120137d05a4b1f8c0a77e5a0eba4f72306f83967351dd9a34aa43ae22cfa9b0cbf1bce628710ab7272e9f3969718d51c128502af8ea4cd278dc60d910cca52491d19c7a72b995f118e254802da1f94a0af244de79d29b3b1ad8f297dcf99f9c476f49aadd9ec41636a66d98ef61a5e0abf0aaaa427b372d6e42e3df3d18c93ee71f0b82f61dbf74bf947ca4bb2f548c4fe656f81bc260b87d7205314c86b5ac75f84e8385f655a99ce194b5b9836d77d66f9f530e9493b30d3e09ac8e5474d84c6060a0eea77e7e3354639156ee545bdfee9cdd2e0b5ef70c80f85ccd3a3c02a358bd4fe51f533cf8e592f74ef9422f765fc3f6811f445dbad86be52e53766fb42c0f3f0e80ca982ece524d6c6e77d77f3b4d6a58040328161d2e652736f721a8a5b10bea3a0e424d8b9fb2bea7496928851a011efcf97ce6c94999b68cbadc2cb0bbbb7a69388e31c01c39144547b9b9cd7b5fced3d3d2966eba0e7d7a4ae535da138da145d33ccf0fd93c4b6f917de66961fb12df7ea9ff28b7ce77604799784df2cd7c4394a1d8da03ed676f363f29a587ecf61d36a49ee1360c51ac5125cd95a960d17655f7096f0d4cdc651fa488f09a3855200bda6918a5c10e4cb6b19a329912f78e88113a48169230644b404d5a41e4e9adc5f918f5100d4c5630269c1353333fb41da2a1854cced7dc00ba92c05edd01f39ccb769713892453a4e8852c86c0ddd8828d988b65b5c927e70e8b2a3676f4d6fa8b5baf286ab4c5adafa122e7cc4e6071c0954517276401b933b5fa7d9dbe226c8c7281766000dc9200b0f199b4d705d01a551ee5ff67caddd1f6ee2c7ed6836b6be7a42d7c66550cd4f3383f61002d72795cf4dcf9cabec45622bd1ace012a4906f4d82dc5ac47ca6257c1e24366a8aeeec4d9e9e52156fdd422e2dbefe1279e4a491d0e1b8b2d7cc948b8603ed3536caadd0df4bf84af538bd446f66693bb5f46b6557037296b932861f85d62c400d4574cce08cd53c2c86c078cd7e1d46babb1ab555d4fd950b62bd3592e90cafc378a7b5acc800b01722cc72b00a2c58802fa996f198caa8c5568338ca08607424f2db4966b5454058d8000927cb9cca3da9a16b867b7e2f66f94f969ac5cef401b888a6caa6b50bb13650406b37e65b90273f5304eac58960a6f62a42806f7c8c1d8e808be9a4e8f85718a55c1f665bba6c4b020dfc2f295635bdb155a6ce8793f7937bdc5ed63ef8d3a1d19740d55cd5159d4a90dde67cac7f0e451661cec04e8f098524ad5a951cb650728255013bd977f430e16a02490960a745d5c9e5627403c26257c487a85c97a4ca8541ce9bdcf70036ef1f5da4b6d81d215dc8b5ed6bdbfad266a3e26d6614835c5b291722fa8009d34b1bfc21703c411ec2e410366b027c6dfa41f17650a19d0b229be60d6284e97d35e7246478a62da9d35bbd35a8728ccfaa13719bcb4b9f499bc3f880ad5da9d7fd9ae97299189622d7241bd88b72bc9e2f83354145e954cc8a7364a8ec50ab6abd76e533470ead95d0d1a849421454642bb8b95e77db5d378f619b068e30900ba321520d82af76fcc107bd6b0d3486e046ad9d2a2555b1eebbb8666bdef6b6c069699d85e078845a252b646404b2104af7b7d01b31b75eb3a756d35022623330fc3ab87b9c4b1517034bb15dc5c7d9bdc6f68dc4b87bd471fddb2e5d987797c8db9fa191e2dc756832a05351d8db2a95b8fcdcc7ba513c7abdecb87526f761ed54bebbf756f6b08e9f2002b70d3a22397736b815012aa0d8f74adc8d7524f297e87063987b401940b156248245886451a01e1f0826aeb8d05691746422e5d0af3d2c46bcbaf39a981e1e542fb4a8cec2e77602fa6b6bf844d80cbc4a98634c9ca558280da03a0b653d35f849574ab981a6f4c2db55653bf504416338754350544a8c406b946361e42c0e9e16f594d5b16ac6eb6bb587795d35d07461ada2a02e53c4e4cc2ad45df42465d2dbded69cee3b88d4662a1e9b7b3a8330c9ae5274b32b5b35bc44e8b0b4abd4bfb655a7d323924f9adad26fc290f78ad367b5b315b5c72072c013a31315c41182b0ad88a4ada01605430d08247eb2c70f4a7ed405a98846075565cab52c2d9892ba8f5e50b5b80120d8d206ddd0533d8f2d5efa790972854a94d07b557720d999156d6ea141b911bf800d5b845166cc516fcf2f76e7a9037f584c6e0a9ba8045ac40057bb604dada72f085a58847365617e6bb37b8ce778c706af53102a160d487dc576a6c17c75b1eb71692be231769a9534b2a85ccc7333699ac365cdbfa4c357b728aa802f6000cc4db5e67c4c87b5027c66b7378f9a525c70be48f77043c38245dc46242d3cc4db49c6e3b17ed0923201e3bce9da9d3a8016b1b6c3737f2991c66cba7b0a6bd18d95bcfbb2349d319556e6f2b68e76a203d0f4234b19df764f0f92902776d7d394e1f0f4bda540a3425ac7a5b999e8fc356c00e8001e4269ed29d635139ef73454ccee29c216a9cca42bf5b687f37eb3454c966f09e1c67283b883389c5e0de9b5985ba1e47c8c6a750cecab0523290083cad393e29c36a532590164dedf79478f59e961ceb26d2d992cbb83a87ce6ee0803b7c7e8672fc32a86d8907a4e970a48dfde273ea635b10cd0c69fdd107a8f39ced7a1a686e3fee137b1f52f4c016fb5efd261ba977543a5d85ff28d4998e9ed21e3d91adc3a91a74d57736b9f33aca1c675d1afcf5066b54a8369cd7183726c61813964b61d8cc34ac6eae3c8cad56a6bde2d7eb789d391d0f583a6c068daf8cf6228cec6c1307a9ecd890391f196abf0b70d95416e7a0e52bbd216d37bdc1f19d0f08e26720aa96ce9a107636e47c27a7a6c58f3c7a7892309ca51673b53055177461e86667100c14f75b63c8ced9bfb4e5072d6c22dc686d6fac854edfe02a7dac2dbd06f3d38fb192dd4d7e5f739dea25de2794e028904dc1f778c79e9cdc7b85b0be4b1f11fe91e744b41924ed7fc214d51c0d572d75cc6d6d65ea95d58ab65bb9402dc85b4bfba6757aa05891aec075f18f8a2ec42822c45ce5e67c4cf4d494559e7b8ca4e91669bf7bedee796d3670946a9233bdd40d073997c3b02ebf641bf94e9f86e19fefdfe1f498cf249a699b430c62d325470c25b4c3cb74b0fe12dd3c34e458cebea463ae1759669616680a1ac3a519b4717a99b994e96144b54b0d2c2288549aac69221cd8a95096516d19442094a2896d93c9a692c50a5d6469c2d33f39ad195960d00548f095a851fbc4dfa784ba0c003b8928416da095d30ea4e5d45fa759614ede7005acd782022fc34fdd61eb2b54c238e57f2d66b126f1edade40ecc4f60df84cb34b86b1d5b41d3732f5bbc7cef0f783d82ccfa94c2d80124a36f293c589143b7acd1702274b68d68818c4c0044c81d8f944cd065a303128e21e99eeb1f2e5ee96713c48d442a57bdcac6c2fe3293ee7ce444d1a56347358f6a99eef42980465258dd189b5b3741a0d7c04b7c2283b55a8cc4a05232aa9ee64b582f4e40e9b5c4db23d650c5f0c0daa33533fc26c2fe521da2d01c460d55ce26ed980b9527ba4016bdbada5be1f8d4ae97b1b5cad9adb7523a1130b18b552a2d5ac1d951185d49ca7ba46aa399d3dd33f058a70c870b988770ac84330517b92762bb9d4f4004854cb68eb387d4386359aaba846a97425b653c8fe1e961d262e2f88d5c43b65c415a25fba5bba065176cb94e66df6f1137319854aea69d40083a11e5cefc8ded2678353ca8994009aa91cb5049f336de43db71a617b3fc5a89fdca875b7d9351ae5ff0011b93d41d27402716fd9e44a9ed733017248be858dac4dfe535f0dc4cbf749208d1eda5cdce83a6d7f5994a2b9450fc7f8453726b16aa5d468a3beb71b5d2c6c3ada55c3e0712cc0d41490004b302c7ba3f0a6c04daa7c414680012c5602aa1436d411cb4bf9c5d4c673586e1c8d5fda9a82bbaf7bd9ad35a7a72617df5b739d360ebb32e67a6d4cdcf758a9361cf43283d0ac6c89590328370065276ca4efcafe72cd2c0b0003557616b3036b3922cd7e80f41d2293b11712a83b1047810654c5e25331a6e80f7435dc0c96ebe96e902304b42ef490b39014297b022f7b0f2d4fd6546fdaaa1462810826ebddca56e0656bdc9bebb692521969930a1006f60416b8b852331d74e92e61b114dbbb4d90e5d08520dbddb4c4a9d9ea841efa8bab682e2cedbf786f6d003cb592c2f04aa6a53a8e55421b322b35dc01657665b027c088f6f5035b1587762325564f0caac0fbf63322b765c12bdf76b1b9bb11a93736b6806da0e93a4cb2bd7c75243959d411636275b1dbe464a6c0a4af5a91cbec83a0b05ca7bc05b9dc92668d270c3620f353b8f39cbf68788d74a8a10b2a1d7da277c1eee8a56c45ef6b758a8f681ea540569161916ea092e14920e8ba1d411bcae9d80d4abc0a867358664a86e732b1bdfae598f85e1b8a66199c2d30e43955c8e57a1bede6275382ac592e69b27f0b65bdbad94c9bd55072e600f424036f28949a039bc26068e0ea134dd8d46d2d5090a431161702c0edaf8cdde1cf59949ad4d6990c4001b35d791f080ae899f32bd357b5886b106db5eff66d7e5d6575c3543533b627ba0b1b03601586801d8dafbf8439034063e967f679c66be5b6a3bc2dddbdad7d7683c67b4439cb29a60dfbd65c86c40248dd75f4924e1b488b38cfadeedbf51723782e25837a8ea055ca805d972dc30045c137fead0556050c671caa2c2d4c1ba9b8bb2b2b03a86205c0d36bef288e355f40ad9aa33f7a965576545d4b205b5ee08df59b5c1f07441252a2d423badf64817b35ac341b09ae292def6171cec2e3c8c7d4900d4ac403aea2fae87d449da46b36552c013617b0dcf94c57e222bde928b5c0bdd9a9b81d57bbdef873914054ed463ab61ed513314cddeccaaca01b0034ef2ebcf5de6657ed307cd4d0121aea181d17f15ee3bc34363783c4632a525756b861500efbbdac0dc381945c1277f213271dc4d58aa5807506e6c837b7d9cbbaf9f5339f5d93c3c12f5aafc4e8d3c3aa6903c4d7e5e0605c5c095b175b6b7f57816c6ae5d586de67e13e52389d2a3d87245da7c43d993d00d6dbcc7e2158b82fa6f717bde53c7f1453dcb1b9e9a9fd04861daa3777280bd373e13b31e9fa3cef6664f3c56d66b76629667353a0ca3ccea7e93b9c26b307836072201d753e666e50baea2793adc8b24dd0a1c6e5e47f03084dc402e2873855aa089e6b4fd0b1f2d8682f1bd99235d3ca329b6d246ac5b86e62e3f801bfb4a46cdcd7607f430bc2b887fcaaca558733a4d36c481055b238fde01fa7ace8f16528f4cd5fa3ee438b23c518280b9bc4788eb28f062cd559cb5c2a587993bfb8187c6d20d4c206e7ddbf23e0653e0886882aff0069ab1db504696d65c12f09d72276951b359ef7205bc66255aabae6b4d3c636996f724ed3131c8174beb1608a07b14f1669df7d7e128d5b1da587209b100c854c28b5d5bd0cf4e14b9337b8046e51b018929540e4c6cc3eb1ed21ec8fb453e33bb45fdf8af56619bdc66c712e168c330456befd671bc4e9d0472a55d4fc27706a5b69cd76d3160530b956edf7adad8729f539bd9fd2dcd49d7a1e7e2d4f5795adce7bfd98b5355a9e9145c04dc9fcbf5114f2336a678e6e299d0a29ab2cd0c01bdcefe33a9e1d820aa2c00d21e9d151b01ee97694f59330492151a52f5048012d513290cbb4e196574685569484d0edbc90304ed195e5da228b486111a53f69268f1b62a2fab49ab4aa1e111a0989a3429344957782a2749063acdbb199a74ea18063ac6a35233bdcc7422c50a9b7e690afbc8d2d3f9a4ab9d62adc0bb4dae01f08af01876eef949de67403b9d442832bd53b491a90a021899046d07998d5db7f380a6c65a5b007cf2151f491612244aa10d9af20a63f23057850c056c1df553e8651742a6c4113503c1d7a808b18c2ccfbc71235d9575e5afa5a429d40c2e083029308d034f0c8a4955ca5b72ba5fc48d8c2988c8691601d586a0661e1a1f7192c3712e40ff94e87e309075698616600f9efef99c93293465e378bd618aa74ee9ecaa36c575006f76bef7f9895b0fda1a01aa0375b31373f7dc9232a28d4dad0fc4b841617424d8dc03ad8db95e61602805ae3f6b1640c080100566e59dc6bd34db499aa34bb3b377eba4c2e25c6c8645a559750c7b9de3945f33137b72d00d749678ee3d2a7b4c3a29a83d8b33906d616160ba1cc751b4e4b114bb8f4ca93cf2aa1ccacb60495b69a6d7842af71bd8ee383b362a9e6776196cb706ce729bf7c86d74e4443f16e395d6b2d2a028b0c976bb2df4366041616e52be130e69825330cc05f5d6e05afe739eff771c552c2a8c8c589ba83505f96637bebce3e957b9299d761f895474b3d44f6a1b213485ee6a0eea0df5d2f9b616e7343018ba34ad4cd662e45cfb5241e9f7b4f74f35462ac30c6a924166af90b0b39b0570db68a069e734131587d1185deb2f79dfbd602e3da123402c01d3c64b894959ea08dce42bd72a015467d6d6522e3c75338ae078c7c40385051529269529f792d7002956dcefade75bc2f0494572a126fab12752dd6db0f4993540d1994d98d461ed6a3a2e62ea41057424588b1e636e9015b87b5722b52a8080994231370c3993adf9eff0019d4df499585e2eecfecda83af78af32010a4f78e502da6845f710b623330783c52555ee6606d9d8bd9341d56c49bf220ed36b0d81cb55ea64a433000150439e673723bc5c3f1aee4e7502cbad83101ee458310030b58de071fc5c5270ac8e54a96ceb620004037035dc8f7c1dbd80bf8ac2ad4528d720f891f2330876749b672182ae552b70c13a6ba7c35bc860f8851c5d5fddbd7470bad8e8cbb78807cbe90dc438d56a375f61a2b019ddfbac9f8ae01b1f386eb61d02a7d9f466b8a8e2c75d012ca45ec6fb1dc5ed79a584e0d4d4b7de53b2b6a16e2c409895f8bb2b2562e29d33509640a5f39cbb66361a8b7a8f19b5598e26807a150a66b3062a7607ecee2d07603715c3d72a130f64b0d08603fcb94a916f1bcc3c454c4d361ed55d85421598d4055013de2360ad6bf2977034f1a8d7cb7cc6cded1c32e96ef00a6e2fb69ea0cb9c748b21a94f3283a9d196e74b321ef1eba413de80a1c3f8b2d2a6c6961d88f68d6034275b2ee37226de178c23150cae8cc34cc34db5171a0f5b4e7bf61aa74a4542bd9969bd36c94f5dd1c6db7de12a9c28f68c8ccb549163df0c05c8d94ae5041bf28eac363a9e21c56829f66d51949d332e854f2d7fae70afc38975a81c580fc0b98ef739bc7ca64702c0a5272873d4b92c8e53b8800b1553caff0049ba714a1853cc3310485ea06f2588ad4b0d51415760e9f74106f6f137d6729dabe0146a7ef8855703ed8d1b4e7713b3c7e1855428c585f9ab153f0f94c3a9c10a8bb3b5423ecdd6e14df46504def6d37d66728a972691951e5f8ee0f8902cb5148d7eedb4f1379ce62b0b5d771703a6827ad56c1d240299a80837539d32fa653f77f49c371be1f454ad25170c49434aa5ec09f1d0fbe4c30422ae97e0692c9297733782613da6a771b8e8675583c20169cae1b14c8c02a1bae97cc183006c6e46c6763c3eb070184f9ef6929c66ddec6f8aaa8d5a604986e50348cb1944f064762199b91895edb18e2c74320f4ad16dc007158c8bd595fda5a02ad4f18d63dc761aa626dce57a95ff000b29f026c4ca5598f9cccc4e53b99d58f026272356af126275d3979199dfedb66c453a64dd4555d7c334cfaf8861a1d7a1e7e52ae1acb5a983b97cc7c3a4ee869a093b5d8c326475b1e8abbb313adffa133aad5d4dec21e9d66b1039ccec4e12a10481b99e6638abdcd1bd8a350dc93b47453ce098106c7afc65a2b6b4ed7b198852179728e184aece2e0f84bd4ab002632949535c852650e238b5a454373e9d272fdafac1c26537d26be314d472e76d97f28fd654abc3036e359f59a5f6865783a32eeeb93827a7829f547631fb394f56bf4fac535f0fc31a8dd88eeb6de6378f3ccd4c9bc8dd1ac23b1bca659a4655530f4e7d0291cd45b169629bca4ad0aaf0ea1d17d6a422d49483c9abc2c4d16d9e0f3c16791cf345211643c9ab4a7ed2110cab24bded21e934a20435336948991ab45ac2317d60693e9244ec674f6302e52d4459baee0c8516de2aaf18829737b78886ab2a235c8866a9a7ac2803e1ea6e216f29d268707489a0b2750ed1ef22a63516d4c54045f9c822f393ac3593c1119883cd4c774ac019306c7e7224eba48b18e8083b6f005e15869020443202a1bc0625f785695f15b4a4228e2ea5d72f3be9e569c79c63fed0591caad3eedc6c48e5e3afca6f71dc4b221c8b7394dad6fb5b0de72544114c2ecd725bccc52c91ea51fa9718be96d1d6613b48ba2d5007f10dbd44daa55d5c6652187506e279938b6f793c263ea5239a9b153d391f31b18e493e06ad727a6de2bce5b8776b51bbb58653f885cafa8dc4e8e8d60c0329041d88371336a8a0f20e80e84023c63868f798c95f2544cec770a0cb6a6ed4c837163a06ebe1bcb185ac57d98aea010329a83553a5812de9ce5a881febfd2438762d48b270e185d0de567c39e7ef91a6814dd6e87f8755f55e5e92b51c7e211d96aa7b557a872ba58044234571b817bebe316e87c9cbf19c11a0f571549d82ab80e961ad47b1366ded6606503c4a8ddaad8ddaf6161958ad8e46e7e3eb3a1c46330f519ea3a3200596b06fbc990ae60b7d75ca2f6e969531785c261d29ad3547ceded57da67cc05ac1869a6c37b4d682cd5e178f64aab4053a4a95297b50abdd656b2dcb0f1bfc274982c70b950d72b6bf517d84e578361e88ab52a85615340c1af75bea42dfee9ea3499b8ec554a35eb0a242160aec5ac41b03aaf4dac7d24cb1a7c0291e9e98c5e7095892a42b59ada74b8dafe179cb70bc635445775284a8254ee0f8cd0abc405352ec6caa2e773a79098f4efb0c5fed6c4d3c9eda8684842cae0f7cfdee813ced3253893d4c45408597206ba5419cb7e506c2c6c3e1acd3e0bc7d3137640d917f10b6663d3c05bfab43d6e0f86a950d66539c817ef10a481606c34bc1d27ba1993c216a254269e6a6b7cce3d9a2d23717b0d331b69a8265ae1dc72a3bba8a62a2ea4b2ab0074d893b6d6b4ac9d9a2acbed2bd474be555d4686fa937dc0d889abc0781a61daa3abb367b6a6da01e5a137e7072421f83f15a789069d4408fa8349812328f3007a4da5403416f211b24569001035b4b41d66bd947de6b1f2d49f95bd660768bb40b873ecc5fda15b8eedc0e84ed71a4cfc2f16c504156a95706f945355b8be87bc74bd8dec7a6f043e97475d88a571652148fb26d7b7a5c4c6a98b7a753362111cadfd994cc0e524026c74e63c44c7a54aa1a8b8b47aac13574760a4efdd26f96dfd5a6b60f882637f74f4eaa585f752a482366daf2aa828b0bc6064664a06e2da0b6ac48d2e06fac363528d4a74ead6cc96d8f781566d2c47eb0982e054695f2826e41ef6bde1b11d0f8cb988c2ad4b66b9b1b8d48b1b5b979c9b1199c2ea53085e9d4a9513358820965606c7b805c6bfac22f19a46d9b32eff6d72ea371af98d76f183abc1181734ab326602cb652148161a9d4ccfa3c2b154c12ce842824742b637b000117b9e66552606c6369d4600d234efcc303623cd4fd2723da0c12d54a944d2b5604156b00a4dee192c74ea67414f82252b54a556ba83b22b0ca49db4b4bc387a939dac5c8b16f0e83a098cfd11717dce11bb2c129e6500b1b96f127599030af87b54b1ca4f787d44f516c27432af10e161d0ae5be9f19cd3d34669a92e4d94ce3e8d40c030370658a6f3271549b0953290decd8dff2f8cbcb5011704113e5357a49619d3e3b33b613ea2cd4a77d440ad761a1d21293f43156ac87bad69c8bd1a342b622b91bccbc4561d6d2d62730d05987c665577d7e93b30c110d8d55ff00887be51ac4c2542b0985c380339dafa5fe73b5545590c0855a6a5df90e7cbc260617124d5f6879b5fc87484ed0f10150e443dd0753d5bfd266e1ead8d8cf4f0e9a5e1b9be5fe8724f22eaa3d4f86636e021b6bb19778955c89bd893a09c3f0ae236b0274e47a4d1e2bc52a391aa050079dcf59e14f46fc5f81d30c9b05aedce0ead6b81e12a53c55ef7b48fb5169d0b1d09b0ed5bc657c59ae4065fb17b9d45ca8e56997c4b8965ee26ac76b7281a14eb2842c2a006f7de7aba3d12979f22dbb1cd972b4e91ea23860655eedbba0fbe12970854d773fd6d03d95415f0eacc4e65ba93737d36f85a6d0e1807d976f5d66f1c2bb029d9caf69c119146e09bf845327b618aa94310466b822ff0028a7367c79a336a2957ccbeb45a5687569514c3299eb9cccb0af0cad2aa9865801615a114c02c2032a84c2932379163204cb5b1214342a3caa1a4d378d017d5e190ca886d0e8d358a666cbd41eda4b2db4a7425c533a62b6307c85c21bdfca2aa7e723434309536225d6c4f7240e83ca45c9e71d4e8216b1d3d442804a749655b4f494e9b58ff5a4b0c6268614347a07782532141b53134012a54d613066ccc7a2995dd7532c6008cf63cc18a5ee8d154ef78ad25516c74eb20d29810630461098190dd0d20156a01bccec4e309d84b78a4b9f4946ad3984f2491b4208ccc4a96d4999389c274137dd657ab4af395c9b3a144e5eb51942ae1edb4ea3118499b5f0b1c72b42704ce7def0d81e235689bd3723a8dd4f9896eae1fc251ad872369bc33d99bc7475dc2fb614dfbb587b36fc43543f513a4a75830041041d883707dd3c919659e1fc4ab5037a6e40e6a7553e6269c92be27ab869306727c2fb5d4decb547b36ebba1f5e53a5a55811704107620dc1f592c659880900d25788456c4e011d85422ce05b30d0daf7b11b11794719c30b545a9950b175cf500ef7b251b0526d9b6171362f111150ec2536a6da0b7c8f94a3c47b394aa9cec8ac45bcec0ded2c544077d7e047911a899fc5e8621932d1ad93ae6dcdac459c6db5bd62dd14a86adc4130f65aa5af988d8b1ca05c31b72b6e7acd6570e34e7b1eb398e2946ab1a7559516a1414ea29d05835ce57e7a72e709c2f8f535409549a796c15aa11775b7dab816f03ca5f4a60d8fda04a945e9d455728ba2a20397da66bf7c2f504dbc6754954f395b0f8a0c0104107620dc1995da4c4622922be1c66b139d6d72548b023c8eb264add02652e2f8ec5bbbe1db2842eb9196c0819810e6cd702d797bb0a50e7ac4d4b2e814e7cba5fbd9af67330b8270f7a9ed313541bb53395dd7beee458f740b85b6961bde6c6173d7a429e9472adc05390e41f64ab0d6f7196db6e64ce92a452dcee68e315d43ab2953b106e0885a75d0fde179e67c0f893e1ff0076a5ded65643a287bf7caf33adc5ed3acc2713a75012b9858d88207be64e2d0e933638870ca55c5aa22b5b6bee2fd0ce578b7017c38070ce5771949be626e46a7c05a757c33180ad8ea47ca02a61c6259838fdd8165e576e7501f0e47ce2aa60a5471fc330589ad54ad57a880a9cb63721b7bd8696df79afc37b32d87aab5fdb03626eb97296041bf3f5f49d461b0f9542e66240b663b9e99adbcc8e3d85ce518aee6ce6d740393937161d62b61d5668d6e314a995462f763603239bf91b5a68cc6c22ae168e67a85d16db01a2dec2c3a7a93047b404bba2a1b852515810ec577cab7ef0df69695f04336d88dc91e7d267f12c5b282b91886520382080c468186e256a7824a948bd6a403163b6652fa8b1617e76da1705c3d69e999c8b68a4f740e400e76f1932d98e28b68bb0e41401f530b13346934508c84919131d0ccee2b825a8a5594116f74f3da8a70ce51bec13a1fc37e67c27a95a64717e074ea8d5479ce4d4e99668f4b35c793a4e36a29dd5c095ea62f4b5540c3f12ee3c616a611f0cfecdc128c7b8dc81fc26356a6d6fb07d27cb65c2f0cfa2677465d4ad146ad127bd4dc30e441d7c8894eab373d7ce4aa6145ee0b2f86a35fa4aeecf7cbf6875e63ce74423f106c54a9e76b5b4e72bf68f1b917d927da3bff0afea65ec562968d3d2c59b6f1f1f29cb55aa4927724ea7733b34b87c4975be171f130cb2a54b9290a5d640d1266df09a74b3deb0622da69717f181c4502188d2c0fc394f6964dce470d8cc4aec9275389336fe1f0da1ea61e04e1e4b86393badc2e4822712f03055b89311602d17ecf18d18470624ee84e522ef02b2ad4acc2ec0d85e59abc6eab0b122db5adca6761d98034ff111a78c77420d8ce972262951dfff00673c4c12f48e8480c0796867a1289e2fd8daa53174db90366fca74facf68498a5b957bb4796ff69887f6806c6d97f48a6cff0068447b44047dd8a639e494f8f4354ad19a0c3a083a6b0ea677287a9ccd84410cb02861544d23017520824c48a884023f0989c88911984993225a5ac489ea180854812d268d2ba62856cb290a0c0d37850d1a6265cc3d4e465d0d32834d0a6f700cda0cce48b28dafba149de5656d7d24ddb5f494493a6da7acb159b43e92807b4b6fa8bff088260c6568617f4956ff0039673c1030c0c8d23ac0962351b47a4dac6c0316b9d3a436018671e47e529d37bde3e16a59c1f190d5aa1a0d5db5f5802dbcb38e4b1f74a8617b0210910239323326595315bfa4aacb2f6216fe72b32da734dee6f0e0a7529095ea24be758274bcc246c8ce74956b61ef355e8caed4e654518788c24cfab86f09d454a52ad5c30e90b0393af85bca7570e46d3a6ad84f0946b61a6b0cad1128d9cfb2cb7c3b89d6a06f4dc81cd4eaa7cc4b15b0d2955a244e88e54ccdc5a3b3e15dafa4f65aa3d9b75dd0faee3d674b4aa822e0820ec46a0facf217025be1dc56b5037a6e6dcd4ea87d3ea25da24f580d240ce538576c293d96a8f64dd7743ebcbd674b4aa822e0820ec41b823ce30a0f18c606393102224696d08e845c1f4331f8c767e9575b6b4c804065d4004dc8ca76f4226cc50a28a181c19a14969aa82aa3534ee75e64aee3596296351b406f6dfafba1bcb4f281ad451fed28bfe25eebfbc6feb21d822dd22185b43d3ac9601156a136198ae53c8d85c81e1bcce5c2d406f4ea07fe17ee3fa36c618e348203a9561c9c58fbf9cc7d4b27c6f81d2a82e32a96656240b662b7d1ba83723d60e870e14107b1fba0f74b12186e54dfe0794b388e394a9d326b2d94697009d4e82c252e1fc568d62568d4cc40cd66b83979900f9c21d5df81b469e12b0670a0908e9989e794dacbe17befe066b0c465200e96139ce1887d9e637b9636fc8a72a8f70f899b6709ed0064366b6a3ac793626211788656ef75f49a0eeae845f46041f5169cee368d4519bd0dbeb0785e2846845a4ae0a68d31c0c8b52ce1a8952a435b30b8df6ef1e7cbe12ce13848a6cafed2ab1552352a035fef1000b9d2672768d0060cea0a0bb5cea01d8f9412f16673ede9b354a3909207e202c156fb9f0eb2d36438fa9d1d43b7bfd6220199184e2cadf6bba4df4d2e003cfc65ba58c076d6472555168538fac82d5930d1884444163c78058d6906846304d01a667f12e1c9554a30b83f03d44f3fe2dc2ab50637a8e179541a8b720d7d8cf4eb4156a4ac0ab0041dc1170672ea74b0ccb7e7d4d6191c4f25adedcfdf0c2dd07cef002b1a40b32b163a016bceff001fd92a6dad23ecf5be502e87d394861bb32a9bf7db72cdafb81d84f2a3ececbd5d2d2afd4e879e35f13cdbf61a95accf7d361b0d7a0921c36da0427c84f4e6e136e83d256adc30f2b5e7a31c2e2a8c6d3dcf3ba5822ac0b53245f506fa89638b5052d990594a8205ad63d27615306ea751f5129e2b0f98116dc7c6689051c2350f0826c3eb376b613c35958d0f087488caf61e124b859aab8627612ed0c15b5e7293a151cd623065594916b91f381e30a055b0e82751c4703a2b1eb393e2af7afea04de1ba6cce6a8e8783d10a9e3d7c67aa709aded2923f55d7cc68679b6169f744edbb1d5fb8d4ff0009cc3c8ef2daf22667c48e73fb421fbe5276cb14bdfda26189f66c075114cb269badf551b5b3190c32da56a66155a7a31471b6d9655a115a560d08a6558a8b21a481810d241a43186264098d791cd001490682264d6219650c3299569987531585165659c337ce51496683589f19ac1ee448bea751e461afb7e59515f68515369b23324e359643f77d25276d658a4da5bc62403ab438329e796299d2098504cfca414db5e86446f1c73898c2533afa49d03620f8c0831d5a3406a715bdefe533499778854d141df28bcce0667c44689132179290bcc64cd10c6330eb1de41a62cd5159d64184b150414c19aa059641a94b01645d626865074d60d925f64827a53268a335e9094ebe12f35da9c13a759207395f0b2856a1ca75356866df4f9ca188c1f410ea0397ab8495aa52b4e86b616d2954a1368e56b925c13318897387715ad40feedc81cd4eaa7fcbfa4955c2caaf4889d10c9e866e3476fc2bb6149ecb547b36ebba13e7cbd67494ea822e0820ec46def9e4044b7c3b8a56a06f4dc81f84eaa7d26a9d907ac031e729c2bb6149ecb547b36ebba1f5dc7ace9a9d404020820ec41b83e463a1a4162b46063c963224490aa6d95accbf85c661f1da463190f7191ad84a0eb97ec5feeb0cf4faf9ace6df85d4c26286207f74cd6671de408ff6ac576d40dface91a44315d891f23e63632382a8e39bb41568e2016763411b440743992febf49d67657b4871155c01902aa9504dd8df72474da50c7f08a55087ca11c1b865516cdd4a1d3a4adc1309570acef6f6b9cdcb8d5add083cbc254e6a4b8dc4ad1e965338be9a8d478cc0e27ec91b23544566d1412335ce82c0ca27b4f4a921776ca36235dff002ef39d7ad866ad53ec3fb45575bab66a65c8eba6a4e9e7338c6f72f82b62823d7f6149ead570e4333b6eb71754b10328d49f296285701fd8aabfb32c52cd5025dcbe70ec48df4b003a45c4387ad4a4cd4c05f648cd64fb445fbc0b0d6faebbcb7d98c096c22d4a875a6e6a53b6a4293628dd6facddb5d3667dcd7a18665b1249f1de5da78ccbb5e06962baa884f6c9f844e583d8d9a2e52e26a3724f9cb3478886d85a655d3a420a89cc5bcaf2c9a3792b78c28aa3acc04c5d31f8a59a7c4e98eb01346c7b411af28271153b08418a1d202e92d48b08215bc0c90ab0011123245c48de218cf2b3a4b0c60ed01a2ad4a52abe141e426932c1948a87672f8de14189d81bccefd8d54ea35f19d955c303e729d5c301b811d0ece5ce1efb096a870e3d3df36c5303602344d20463e3f86e64b123498789ecf5264636bb80483e205c4ecde9dc1f29428d0dc79c8aa29d339de18b9a8861ebe626cf66b1192b28e4c0a9fa4c8ece1b1ab47f0d46b7be69fb3b35c6841bcdd70d1cf246ff006b6c29a13fe27d0c52976cb117a1498737bffda629db817911b456c70181e2a8d60743d0feb3515a7108668e078a3d3d0f787cbca7262d5a6ea6632c5dd1d58935328e131a9505d4ebd39cb6ad3ad3462d50753080c006930626841af239a4498c22d809093bc086920d1340190c329950342a3c45596d1ad0f49b5129830a8df39712246829d479c397d252cdce1f35c7acdccc987bcb140efe62532369628b6fe9120649b7f587a4da4aeeda993a460803e78e0e8608348e7f9c1b0a0f9b485423d79743e12b7284a075827b8da08ef7d640991aba136f74886bc89b2a24c990679166909cd266b144d9e4498c5a4661266890e4c818f68c66765a1c4661186924bac0644890630b077bedb486303507be05a973de5d0bd231492d0cce65836a7341e940353914066d6c283b4cdc4612dca740eb06d4fac2c67295b0f2a54a13aac460afb4ccad85f096a542a39bab86959a9ce82ae1e54ab87f09b432fa90e2631497387713ad40de9b9039a9d54f9a992ab87959a95a754649f066d3476bc2fb634decb547b36fc5ba1f5dc4e929d50c0104107623506791b2cb380e255a81bd3723aaeea7cc195562b3d5af14e578676c29b596b0f667f10d50fd5674b4aa860194820ec41b83eb336ab928299131ef1a431a224481108640c96595b1d854acb96aa061d766fe69938cecfe72192abe8b94adc2332004052fb1d0f39b8645845bae029339cc2e1abd37a62b55654a7b0b59d8116b9be86dddbea6f69d3f01e0a8b4aa51f6b985425f41932d886b000f85e04936cba15fc245c7b8cd4ecae113da6848b03dcbe607cafa8f283936a896ab739a7c657a2c454a65d01ee9d9f2f2bf2334f05c528d4b052a1bf0b687cb59dae2704afa100f989ce715ec852a9a8194fbc4c69a0eb643237808bd9375130ea70dc6617fbb72ca3ee9ef2dbe92743b4aa3bb5a9b533d47797f512d6e3ea360e1cf5827c330e70b85c753a82e8eade475f74b37102acccb91d61e971075e72cbe1c1956ae08f58c0b74b8d30ded2d271b1cc4c27a44419368c291d40e294cc9ae2a99e7396cf1c39eb00a4755994ec64c24e669d73d65da78fb7380a8dab489132ffdaea3a9f287a5c441df4f0bc742a2d1582a880ef27fb42f58d98180d158e1d63ad11d2159620203236f09502d9a5cb4af596cd0038a5029e2ea9ffe5b9f2204dac552fbc264715a6463587274047981acdba1533531e02d2a2fccd11231bb518bfdc5243b8a8deeb4501dab40427998a7429b8aa45c1ec79d26c24c4514f15941e91b6a3433a3e0f8b671deb1b738a29d7a293dd19e45b1a8a64d628a77985128d1451850d1468a0244843538a28bb8fb065308b145291322d83dd87a0748a29d08c499309479f94514009543ac65631450282d3322228a431062741254f71e71451f71f627883acacc79c514cf272547812c1d47d6de11e29c93e0dd121224c514ca46a8988378a290b8193124768a2942236b9b748dced1e2993189a28a294c640c8958a292001960984514ce43431582a9481d088d1410cccc452009133eb208a294b8114eaa0956a5311452f1f227c14ea208168f14ee473b04c21705c4aad039a9395ea3753e60e91453440b93d2782631aad25a8d6b91adb697ef14539df2cd469068a2898c818c628a4b1a230f85ac52eea6c41b88a2978f9267c1dc507ccaac772a0c911145219995ead213178970aa5501cc82f6dc6914533901e7fc5f87a536ba66041d35fac1e0b8f5747099f3a9b7db1723d458c78a5c37127b9dc5172403d443831e2926e41a983ca02ae1d7a4514684ca7570ebd256aa96eb1a28020418c72e7a98a28ca0b4e1c2c514003511696e9d43d628a3422cad430c8d14507c889caf89dc4514108e57b463f7f4db9ea3d2d2de086f145263ef84f8317b4df77d634514eb638707ffd9, '', '9', 'approved');
INSERT INTO `rsm_rent` (`ownerID`, `adtype`, `flatno`, `flatsize`, `rooms`, `washrooms`, `address`, `price`, `flatimage`, `flatinfo`, `phoneno`, `Status`) VALUES
('asif@gmail.com', 'sells', '3a', 600, 2, 2, 'boro boyra khulna', 2000, 0xffd8ffe000104a46494600010101006000600000ffdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc0001108011801a403012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fb01adfbaf07f2a67992c7d7e61f91ad0687ae2a3d87e95f9e737f32b9f4a95b6204b847e0f07d0f152e0531a156ed8a8fc978ff00d5b7f9fa53e54f665a6fa93eda36d44b31538917f11532b06190722938b8ee5a6262979a5e29c076a00660d3b6d3b61a76d1400d0a471dea192ce39a358ca2800e7f4c0ab5fc3463a0ade355ad1ea66e28cd3693d8e7c83bed55b0b0b8c8c138183da9904c9249fbb636b70dff002c64c7cdf8f43fceb576545359c5701bcc5009e871d3a7f41fad75c2a292b18ca25667476db3a1864ef20e9f8fff005ff3a6cb6ef0f2795f514925bdcdab6c5c5cdb81f76424b0ce3eeb7d4d16d3066c5bb90fd4dbcbc37e03fc2b65aec67b0cc9a5a9ff007333607ee25fee3743f4ff003f8531e178ce1860d506e22b7be2a506a0c6da7a9e87fa55a22489d1bb55989aaa4643354cad835b2d4865f8e52a7ad68437447b115910be78ab09230c9cd2e44c6a6d1b915e9c75e6adc77c4819ae7d643daa78ee1bb9a5ec5363f68d1d12dc74c35584bc653c715810dc963d6ad4721cf5ad551b09d446cfdb9fd734c7ba6907278acf593269e2b68d2ee652a8ba12bc85e99b770e3a51d7e94ec93c576461d8e5726f7198a554cf5a9963f6a9238cf502ba144c48161a779357161269eb6e7a5588a1e4d3194ad6a1b7ff0038a864b7f97355624cc93bd5199b6d68dc2aae4d625e4c43100d431a209a4c922a9ccf8192d45d5d2c29963f37a564dc5e34a092762fd6b92a54513a2106f627b8bdd8080726b3e5b8791b8c9fa5579afa28cfca1a66f4154ee6f25da77c896c9fddce5bfcfd0579b5310cefa747ab2ccd2ece5e40abf5acebdbcfb51558c962189c81eb8ff0a80b2498748a4b827f8a43b47ebcd0f05cc8595e4f2971f7221b7f5eb5c12a8d9d9182327c5577756fe1cbc82dd59aeee17c9893fde2016e39c0073f855ad14ad9d9a88c9c2e10649e0018ef531d3e348ce061b9c13cf6e29117f7980383cfb7615c729bbea744629ab1dff877e68d4fb66ba7b05f324925ff0080afd05731a19f26d81efb703ebdabafb38fc98517f3afa1c37f0ee7855be22c114ce7774a976fcb4dfbbcd75180e07145145311c4b2edef9a6150d571903542f0f3c57c73a7d8f72e5478f6f414cdb565948e08a6b2861e958b46917d4afb41ebcd31adc139076d58298a4dbf2fbd526d6ccab2657dd247d46f15247708dc13b4fa354a1452342927040abbc5ee83543bf3a76df7a83ecef1fdc7e3d0d39262b90e9b7dc51c8dfc3a873772523e5c52e338a4560ff74e453bd2a005db46dcd3969d4088b1c71d3d3b54375a7c576bca857ce430e31c63afe556f029563ef9c1ae98546b721a31a6867846d954de423201e92f1df3df8c7f8d496f3168dbc9717712fde8dbefad6bb2f71835526d3629886e639171b5d4e31ef5db0a8a46528f62b2c697193036587de8df8615036558e41047553c54d3c32c441b88cc8173b678c61c73d48fea29eb20923064c5d439c79b1fde5fad6d6bea8cefdc811bbd4bba86b5f977c4de6c7ea3a8fa8a8d4f6ada26725d4b56efcf35695c567a395353ac9bbbe2b5563065d473bbdaa556e2aa47205e7ad59561dab78a15fa1721fae2af42d9e0d67c638c8ebdead447e6ae88c6e632958babdbd2ac2e5b181c7ad436eb9ab91a720638add475316ee091963e82adc70f1d29628b71e9fa55d8e118c7f4ad5226e42b6e3d6a6487be2ad476f8a98442aac49505b9e29de467b55c0a3b73f8557babc8ad7fd648abeddff2a7b011343b7a5579c0f2cd4175ac12b98e3c0ecf21da3f2ac4bfd4bcc1896567e790bf2a7ff5e95c5a90ea5a8450e5776e6feeaf35cd5edfb9ce1769f7eb535eea9047909f331e8231fccd65b49717272882107827a9fae6b86a55b753aa9d36fa14ee6693397754f790d65bdc2498d8af74c7bb7caa2a6d72e74bf0d5b2dceb37b1daab1daad3924b7d0753df38156e3db267600aa0903d6bc9ad52da9e85389986deea604338b75ec221838f4cd3a2d361898b637b772ddff1ad09233dce699e5939e6bce949743b922b18c6dc75a63296ff00ebd5af2e9ac9e958cb9a5d4d158a1241b81cfeb5147061c1ad0923f7cd42106ecfbd73fb3d4d148eab455ded6f1fa0de6bb58d7e55ed5c778663c8f33bb600fa0aec973c57d6d1568a47cf55d643c9ea699f788a7119a154ee15d263a8edb453b1450239668fda99b0d5d65fcaa1923eb8e2be6391743d58cfb94a48c9c122a168f6fd2af329fad30a0cf22b370ee6aa48a5b69a57f0ab6f067a1a88a6dea2b374d169906df7a5a94a8ef4dd98acb919771b46d07a8a5db4b53668646d02b720953ea28db2478fe31fad494ec74abe6efa886ac8a783f29f46a7d23286e08c8a6ac4c3ee36df63d29da2f60d49947b52e3daa3f3197efa67dd6a68d964e50eea2ce3b8c4e7de8e7de9f4a17356b7111e091c7e46aa5c69a8d219a2636f374dcbdfdbdfa77ad0da28d808e7915bc6a35b99ca373124325bc99994c2d9c79f08ca9faad3d8a48a1a50a81b913c7ca37d6b54a75e370ee0d51974fdaccf6cfe4b9e4a1e55bea3fc9aef8c9339e5168aaf0bc38cf2a7a3039069ab2e0e29de61b562acbf6663d55b989bf1ec69ccb1c8d823c893fbae783f435ba30b0e8e619e6acc52fe359cead13156521bd3bd0b70735ac67621c6e7410cc0f7ab90c80f4ae761b82390dc55b87502bd4d74c2a231945f53a8b6715ad6f186c1cf35c8dbeac17b56c59eb51ae32c01aec8c91ced1d3451818039356e38c0c67ad6247e20b62b9525cffb3d3f3a649e20620e1d635ff63e63f9f4ad39910ef7d4e8da64853748e107ab55497584da4c48d27fb6df2afe66b8fbcf13dbc721c38925f5cf98dfe02b3a4d5b50d49b6c30b28ecd21e7f01512a918f52941b5a23abbad724627cc9f6aff00720e3f5ac1b9f135b5bb111152f8cfcbf331fc6b93d535ad32c6e0c5a8eaeb25ce4e2cedb334c4fa7951866fd2a3b7d5ef2f37a695e1e9a07c0f2e6d5d84393ff5c937c98fa85358ba927ac51a2825bb37ee354bdbc24c51900f4693ad63ea125be9cc8fabea51c05fee4733fccd9eca9f79bfe020d6d691e01f14eab97d42f5c46e31e4c118b3857e9cb4adf52df8575fe1ff0085fa7f86d4dc0f2e2751b9cdb26d66c73cb9cb37e26a5d394dfbccbe78c1688f02d6be35787b4db3b9974eb79b5236f7af6123bfee238e6489a56dccc0b050a879dbd78ae1edfe28f893e2af83749d4f449c78712fb50b7b4992dd7749081765646dcc3386839ed8cf1dab8bf114696bf0bf51bcf27ccbfbaf124972c3180d9b5764207b02723d3afa575df05f4e8bfe15be9b691cebf6893c4135bdc4d1f52559e3e3dc0087f0ae09a77d0f5552518b7bd9d8ccfd9fb4cd2fe2769b75e2ad634f8eef579af2e10c97037b450f9a658915b27e5c1538f51cf415eed0c0029233f78ff3af21fd986c63d2fc35ab58c5f72d75bbd806170085738fd0d7b3c51e22fc4ff3ae5c46aa210d2522068fe6f6a8ead95f5a8997e6e95c0d591ba20db4c6502a595d23cef655fa9aa8d748df7033ff00bab59d996849073552e58c719da7e662147d6ac334983840a3fda3555e177991ddb2aa73b452b59dca3b9f0ea848e150380057549dab97d0c63cbfa0aea13b57d250f82e78557e21f4edbb69c3e5193d69acd9e7bd75246026d2dcd14f5ce28a7ca2b1c17d9b52b66060d416751d12ea2193ff00024c7f23522ea5a844cab7161e6ae705ade40dfa1da7f9d596fd6960f9ae13bfcc2b97d9464f5468a658568ee223246e415fbd0c8851d7df0698735b77d18fecd8d88e77d66797ebd2b87134553a968ec6f4aa734752b6d34d65ddc11569a31e82a331edae5e43a2332a984530c657dead15f6a615c5652a66d19955973cf4a431edf7ab05475229be591d0d62e26aa4404628cd4a53d68f2f23a565c85dc8fab715228c51e5102956322a794771690c2adcf43ea29db33d69db6a926b60d0880963e84483fdaebf9d396e173f30287d1ba53f69a5da18723356bcc43f6d21e2a3f20a9fddb797fcbf2a3cd78f0244ff00812d5a8ddd912d8fa6b2e69cac24e8734b8add27d48bdc89903ae19430e98359b7363e5a916e414ef0c832a7e9e9f856b6daab74819b8ad7da38ea64e176613ea0d1b086443ed14a79ff0080b77fa54525d06cf96738eaa46197ea2addec61d592451227b8cd73ba84725bb03136f03808c70cbf46ff001ac2789e5dcda148d117ccbc83f953bfb499464b041eac7158315d4f70dc249bfa1f942fe67fc2ac259cae773baa1f6f99bf33fe1592c63e8cd7d823506b4eb92a5a41fde1c2fe66a6b7d5a5ba7c07c8feec4a58fe7d2a0b5b0894862a656fef48735ce7c46bef1668ba5cd7fe1fbbb1b5b58624593ccb6f327695e408bb3276800364920f4e9deb7a78a94a56b994a844f42b7fb5b425d57ca0a32649db3b463afa0acd3e2cd26691e38efe7d7e74e1a0d22337217d8b27eed7fe04c2bcabc3326a3e38f1c2586b5773de593dd69e763be613b64d8c9b3eefceb2e58639c7b0afb3ecfc19a358a22a5946c23fb8ae32abf45e83f015ece1d3aaaf27b1e7d74a8d925ab3c5b4eff848b58f934cd12df4e8cff1dd31ba9b1ebb222107e321ae8ad7e10eabad60eb5a95c4f11fbd0c9379511ffb650ed07fe045abd73ce82d9022ed50bfc283fa0a84de4d237eee0257fbcc702bd08c1476381c9cb738ef0cfc19d03c2ed76d6e8552e645924821021877050b90ab8ea00279e4f35d859e9f65a5a62dade2817d5142febdeabcd3cc4fcd22ed3d3cbff1a486dd6e1c12bb99471b89f5ad2cafa93a96e4d4a18ce01de7fd819fd6963b89662311154f56352476a170485dc3baa8153796b4c47c07afe94b2780b50dd18565d57549d40fbaa56254047b664e9593f04ae9b45d3b4bb0980225d5e6b90131defe18037fe3d5e99e3ed35e0d1f538225c2c4dab328c718df6e3fad707a6e9c9a36a5e168f0427d9ac0823a6e9f580dff00b4c7e55c3569a84a513def68a749f9b674ff00045560d43c61698daf0ebd36ff004cb448dfe35ea0b36176aab3104f41c75af31f853b97e20fc4742c4a2eb84f3ea614af5255fdd0c0e2bccaf6b21437640cd349d15631efc9a89a166fbf2338f6e2ac1eb495c0fc8d91556de38db3b01a4900cf0302a790f4a858562df72caadd48ed5149e952b7dea86451bb358cb756375b1dae8a7e68fe82baa41ce7b572ba372d18f615d628c7d2bea70ebdc3e7aae921f276fa546bd4539b229abd6bb11cdd4b0a323ad14aa3028ab343896eb4fb5ff8f88ffde1494fb4e2ee2ff7856096a47368743ac621d0eda43d5a43fceb2a370f8ad2f149dbe1cb2ffae9ff00b31ac6b707cb1596220a53bb34a2fdd2d5230ef4e8dfb1a76df4e6b91d346dcc40d186a8da3f4156594fd29959ca9f7348c8a8d1f7c530afb55c65f7a8da303b573ca16378cec56db9a369ed5318c13c7069ad1edfad73ca1dcd54fa1160f4c7347d453f0deb46d351c88d1313f0a5a39a50297222ae25295db46da72ae7af4a3910b986eef4146d35696dc629e96fdb15a468b3373ee516855b05863e94c62d1f00ee1e8dd7f3ad336e3e955a6b520e456ea2e3b90a499563955b86ca1f46a64ea38a98af6233f85453c271f29da7f4a992561ddb32ee93dfad73da843b9f35d25cb155f9d78fef2f358b78ab23b10735e36263a5cefa2cc8b78df272ccdcd6a5b438ea3350c308dc71c8cd684455400481f8d71518b96e74d496a4f6f103ed5c97c6cba3a7fc3e9594659eea25fc40771faa0aece271fc219bfdd15c27c7591a4f07da42136b35d87193d36c6e33f9b8fcebd7a31b491c92673ff05a365f18f87a48c3173f66dc1ba96f3549efd0607e75f6fb47961dc64f19af883e12ccf278b3c3f71bb27cd8c907d0ce831f4afb7e7bc8ede78216cf9931609c71c0c9fd2bea707a45a3c6c6fc5164ab12af619fa52ec1e99a7515de79c64eb0c1644c71c5374b991650aec0349908a4f248e78fc0526b67f7c9f4ff001acfb7ff0090be93ff005d25cffdfb3fe34c0ea692968a407cbfe388166b2d751812a6df569081d70258ba7e55e65730c6afe1b9c86233e1d8fe99bbb87ddefc815ebde26b36b99bc471960a069dab91f8bc67fa5792f8ae31068be1eda84345ab786a36e71c0791f83dc0dd5cf88f8d9e8d27eea34fe11c217c71f12485233afb9e7feb92d7a86e1e58f4c57987c2f947fc275f11138206b8d923affa94eb5e959dca2bc6c44af63b29ab3634feb4c6cae6a46f4a8646ae06fa1d0275c9ed50bb54981b6a093ef706b07b8d6e42fd6a091b903dea6939aaedf7ff002ac5bf791bad8edf433fbe8c1aeb13b5729a1ffad4ff003dabaa8ce706beb70ff09f3b5be3257f4a6afdf029cdda914fcc0576999636d14bb68a6473f91c41a7d9f37517fbc2987a54962375dc5fef0ace3b926ef8bbe5f0f580ff00a6bfd5ab2adb1e5818ad6f17ae341d3c7fd35fead59b6a836ad1597be14e56449b01c76a395e3353e298548ed58389b7311b1c814c607b53d90d08dd8f158b81719103315078a824ba74eb19357f606e698630dd4573ca9be8cdd497532db52dbd616aaf26bc90e73131f6c8ad1be85540e2b92f116e8c958c60915e5577520ae99db49427d0f1ff00da43f68af1af806c6387c09e0d5d626913136a93bf9a2d5b3dad9705ff00de271ed5f347817fe0a8fe32b7985bf8a3c13a5eb4a87699ac657b09dc038dc11b729fc00afad75ad2d679e1de99f9c751ef5f04e87e15d2f54d4aea1bbb386e82b49859901db9948e33f4ae09e611c3c39aa46e7b583c07d6a7c91d0faf3c21ff00051ff851af2a2eb90eb9e109db83f6eb3f3e11ff006d2227ff0041af71f07fc70f877e3f09ff0008f78df42d4e47e90a5ea24bff007edc86fd2bf347c75f0334fd57c0be7d869e34fd466f2a49218e6608b8dcceabc90338af12baf843796d0acb04f3e31b86e40f81d73c73fa57461f1987c446f195b56bee35c46595294ad6d2d7d19fbb7e4bec0c57e53d1b1c1fc69638c7e35f893e13f1b7c5cf86ab049e1bf18ea96503209228e1bf9111d0f208462548fc2bd8fc2bff000512f8e9e0df2d75db1d3fc4f6abc31beb008ec3feba4254e7df06bbe2e0f669fccf32a60ea44fd5e58c28e952c7186e6be0bf03ff00c159bc3174c90f8c7c0ba969127469f4bba5b841ff000090237ea6be86f03fedc1f04bc76b1ad9f8dedb4b99f810eb30bda1cfa6e61b3ff1eaeb5d99e7ca8d48f43dcbecfc7ad4324191d29fa1eb1a7f892d56e348d46cf57b761912d85c24eb8faa13575a13cf15af2ab6e72dda76673f796e52de46e410a4823e9542f6e1ad9610e63632a86552db59b8e719ebf85747a843fe8371ed1b7f2af31f8956f3dcea762a92491a4366980bca92dc9247e03f2ac25151bb66b177b246e4f7111c87dd0b7f76418fd7a5635ec2acc48e3b822b8793c49aae8b8412f9f17f71ba7e4723f4adaf0deab3eb974eb3db7d880557568c902419c1e3903b7e75e3d78c67f03b1e9d34e3ab34e1870d82ccdf8d685a46aac70a0550b572ccf9eb9ad0b73d73c715c146e6d51ea68c38ae03e32422e23d1222d8fdf8f97d774d027f535dedb9e9e95c5fc4ec36a5a2a95cee9631ff009143ff00ed3af4e9ae69a460d9c07ecf72ff00680f084e724ccf68e72727e6b9273fa57dcf7ebbb58d2fd8ca7ff1caf8aff66db18a3d2fc11220f973a781cf4fdeb9afb62e86754b1f50b21fd057d46163ca99e362e5792f42fd14515d670189ae7fae5f61556c80fed2d30fbcc7ff001dab3adfcd7007b555b3655d46c18901504a5bdb200155d00e9a8a62c8add0e7f0a75481e01a94c8baaf88b68e574cd509f4cee8fad7877c4cba963b1b78cbec8a2d53c3ae188e877be40fd3f3af51b3d50deebfe2791c6d034ad5c6d61ff5cffc315e55f16a32ba7ceeedf32c9a34a4e38054b9c819e0f3fcab96b6b51a3d1a3a1b3f0c032fc44f898a4f0bae9dbff7e12bd38499c7d2bcdbc039ff008599f1302a6c8c6ae4f43c9f29066bd115be5193ce2bc7c446d63be0eed8eddbbbe0544dc53cb5338cf35c2cd469cd4521c7069cd9e6a199be6cf7ac6452dc899bbd570d9907b9a959bd4f26abeefde2ff00bdfd6b9e5f12365b1de683feb13e95d643f745725a0ffac5fa57590d7d8e1fe03e6eb7c64ccd9a6afdf148d42fde15d663cc5ac9a2a3c9f7a2a80e34f4a9b4ff00f8fb873fde1519153e9ebfe9907fbc2a52d4cdec6d78b577689a7ffd75ff00e2ab3edba0ad1f14fcda3d881ff3dbfc6a9db47f28fa5157e308fc24df5a4650d4fc523573b46972bfe54c20751d2a765a8082bc76a968d2e01b14edc2994aab9f6ac9a2b9882f17200c572bad2833f23b575775fc3935caeb87fd2f19ed5e26397ba7a985f88e4f5851ba0e3fe5a2ff003af80bc34ab278baea02998d9a4ddc71cccdd6beff00d5b96b7ffae8bffa10af82fc329f67f1b6a0f8cb2b118facb257c763f4c39f6d92ff00bc3475fe178a2ff8466e5028112dd5e2aae3000dd39c01f8541a65846e34ece029808fca226b93ff0084e2cfc2f65041a95efd82deeee6e3175342ed02e64941dcca3e538638cd6ce97e2cf0c8894daf8d34b9447195559ee23eea57be1bbd7053a7520949a766dbbd9f7ee8fa17529ca4e3757b6d746bfc3df0959ea5e1ff000fc73c2b227d81caaf380764183f5e4d3f50f85fa647e217852d54abe8535d3f5ff58b33ed3c1ebc0147837c430e9f61a5416dabe8f75259db7d9d8ade26d97e58c647cd91feac75f5ae9616d4afb5669d2d5658ff00b1e4b3125b48b2ab48f2b300369cf461dbd6ba6152a471527cda5bfadcca5084a925e6605e7ecf5e1dbcd3e29e65fb431b8b48de392352584971146df31e47cb231fae2b9af1f7ec6fa0dbf84fc4fac69cbe4ff65c775226d90c6ec21dd9ee47f0fa57b5ea0d796fa7426eacae2db6dcd8fde8f23e5bb809e549e8149e7d2b73e226b96961f097c6e8d2c62592cf502aad91b8386c10718390d5ef60abb518b93ea78d8aa09c9dbb1f10fec61f0d6ffc75f10752b26f146a3a12d8c4b2896de49176aed766625183657603c1f5e0d7eabfc2bf843e33f07dadabea9f1775cf10c076ca96b3410cf11848caaf992a1939041c8c11d39afcfcff008274b4537c6af1016198d6d573b4e0e30dcff9f5afd51f0bde49a8f86f47bc99d9e69ac6dda466c02cc62524f1ea4d7d7d06eaa7296fa7e47c4e3a3ec64a10db526d4d36e9f747fe99b579978f35eb5d3f5c8a0b8b7b838b381bcd8d432f2a7b641af4ed65bfe2517bed11af37f1de92b7dad46e4e0fd9201d3fd8a8acac9fc8e2a6f5471b3df68ba872b770871caace0c6d9fc40fe75b1a1aa2b96465618fbcac08fd2b98d47c202690b64102b77c33611699118a18c46a4e4e3b9c75af0a56e63d657b162cdbe66fad68c6df9d645ac9b59beb5a30c83ae73ed5c745697359fc469c2f8c735c17c54b961ab688aaff0075fcc618e8160bb73ffa07e95dc46e0f438af33f8997bff15044a7811dbce73eb8d3ef9bfcfd6bd3a317ce99cf3d8a7fb34df11e1af01b30206ed2803db0d23f3fcabee5920579e298825e3040e78c1c67f957c35f0051ad7c3fe128590036c344dff8ccbffc51afbaabe9686ccf2316ad25e82d34a06ea4fe74ea2ba8e0398d41825e5c0ec1ff00a0a5d2b126ad00233fb963ff008f541a93137d77cf493ff65152e8873ac43ff5c0ff00e846ac0ea291bee9a5a8ee1b641231e8aa4d401f2f794906b3e286c801b47d509e7aee58f9af20f8bd78df61d4d54fceb6fa632e08ce044e727dbdfeb5eb42f56eb54d6d40f9db49d406ec7ddf950e3f9578a7c646f2ec7c460fce534fb06c8c8dca22208f4ea738ae5af2f7ee8f4e845b7a9df7822465f8b5f12621f77edeadd7b98a33d3f1af40dc703d6bc9bc017e5fe387c5b8d9f2d1dd5ab0e7b35b46457a92cc1abc9c4cb63ae9eec98c9b7af15148ff00375a8e46dc6985bad798e474a4399ce78350b487348d215e950b487bf158b658b231e39aae1bf791f3fc429d34876fad56562268fdd87f3ae7e6bc91a5b467a2f87db320f5c57590fdd15c87875bf7ca3dabae84e01afb5c3fc07ccd6f88949f5a169ad42d761ce4db8d14da29d8ab9e7767e33d075060b6bafe953b1e8a9791e7f2ce6b52e96fdeceea3d35e28b576824164d326f413ec3e5165e3237edc8ee2bc9f53f80f6971b80d7a7bb53ff003dedad1bff006515d1780fe1feb5e15b8b786d3c6f70205914a5acd690ce91e33c2ee3c0e9c0e38a50bb7a912692d0fcf8f07ffc1493e31ea1f117c3763e2fd474bfec28f56860d4ac6d3488617d864d92287e5948c9efdabf527c1be23b2f1878674bd774df33fb3f52b74b983cd5dae1587dd61938607208cf506bf0e3f69bf86d71f09ff681f1c7872691f75aea324f6f22aed592298f9b1b81db871dfb57eaf7ec29e3d4f1e7c03d34efdd7163290cbdd5651e6e3e8246997fe0155257bbea84ba1f43ed1f5a8a45353523631cd63ca522b546e9b8706a665c530f4a92d32b15229eb93d7f9d487914797ef59f2977295e1f9eb90d7d82deb7d2bb0bc5fde62b89f1037fa7c83d85789982b40f5309f19cf6a8c19a0ffae8bfcc57c2be1554bcf1c6b2a396420f1ebe6c9c62bee0d61fe7b7c1ff00968bfcebe1bf04b18fc6dad3af5dea0e7a7324a6be3b1caf41bfeba1f6b947fbc346b68f696b79e0f9d6e605953ca99c2b80431333d675f7c36f0a6bd6b18bcd2a28dc8cee8939e9eb5b1f0dfc3b3f8fd7c39e1fb7bf6d2e5bd93cb375e50940cb93ca1fbc3e6ce323a75af7193f62af155aa816df11f4cc73f24ba3ba0ffc7653596170988a9194e8bd9bfccf5b178bc3509a8575ab4ba1f256a9fb35f846ea366b6b8685fb2e3073f957857c44f87fad7c3bf105bdb595f5c5a47732816ef6f727e652d80783c57e8edcfec8bf10ed559e2f167862e5319fde5bdd4791ff008f5721e3cfd8b3c53aec76d7be221e0dbb8addd55269b5a9ac86e246d5cb2019270304f7af7f09f5ea3517b5bca3db73c2c4d4cbeb41f24945fdc796f877e17f8f74c92d6ef4df1fea3e1bbc4b78924b3b291ae62591502b37ef0fcc5882c7b649c57b1e81a5fc4abfd36e6c751f1c68daedbdd42d6f2aea5a02ef746043026375e704f38f7aea2dfe047c59d0acd049e11d35ad608b19b7d7a3548d1475cba2e0003a93d055cf05dbf8bf599ae1749f0b26b86df02e3fb0b5ed3ef8c79195dc126e323a67ad66a8e31cbde8afb8dbdbe052f767aff8bfe09c2fecebf08b4df81bf1bae74fb58d5ae6f3406d4649a2b995d15434a8102c809cfc84e77771e95f77fc3fba5bcf02e8722f03ec70a81f48d457c7f6f7575a3fc6ed5753f10dac9e197b1f0d7d926b7d5da389d32d2ca1f72bb2152b27ae723a57d25f0b7e21f85a6f0978474b8bc49a449a9eab6a64b0b34be89a5bb552558c4a1b2f82a4719e41f4afa7c349ca6d35d8f92c7c631a6a49f5fc0eeb5c62347beffae47f98af1df899ad6bba7f8ba44b1b88d6d96d2df11490ab8cf9633c919fd6bd67c46cf16877bb94a92981918c9c8e95e65f16358d0bc262e35ef12ea56ba2e931c76f0c97b7d26c8d599555549f524e2b4ae9eb6f23cda3ddf99e7b27c44d7ade4292e9b65720f5601e33fccd75de1bd56e353b6f3ee2d16ce4cf08ae5b23039e40c532dfc3b69ab5941a858ecbdb49d16682e20612472a1e5595870c08ee2ac456f2583ec7429c7718ed5e04f77a1ec47644369375cfad6843292c074ac3b59b9c7bd684171cf26b8a8763a2a5ae6e4327cbeb5e3ff14ef07fc2636d10607cc875252bd71b34894ffed4fd6bd462b8dabc5787fc44b892efe26695103c341af4b8ef81a72440fe61bf2af6285ae72c95cf40f8476e6df477555cadbdc6888ab8e78b88b3fa8afb6abe35f85f3795ff00091db8e043aa694a01e3e517517f8fe95f649edf5af7f0fb33c9c63bcd7f5d10ea28a2ba8e038bbe6ff4ebc3ff004d8ffe82b56b413ff1388c7fd3bffeccd50dd5bb35d5d13de66fe42ae68b6cc9aaa3e3e5f231ff008f355f703a4aa3ae5c7d9744d426ff009e76f23fe4a4d5eac2f1d5d0b3f06eb52b0c816920c7d548feb5035b9f28f84f52171ac6a42456deda4df64b703848b8e9f5af19f8f57245f78aa22e00fec6b718c7a24601f7397fd6bd97c237514979abc8594edd2f5228d9cfdd28a49f7f96bc0bf68abc6b4f116bf92a0368a9c48781c5ae4a8f5f7f6c5795377b7ccf768c7dff00b8edbe1ddd08ff0068cf8b31b7cad2c5a7cbf5ff0046881af648e53b457cff00e0cbb48ff6aaf88b1ab1dd269961260f71e446335ee714c4aad7998b97c26b4d6acd2f38f5e0544d31e6ab19bde98d2d79d7372c3499ef51349d8f355da6c75eb5134db7273ee6a1b3448b1249ef5107fdf4433fc55c37897e36781fc26b236a5e25b38fcb7f2dc41ba7dae7f84ec07e6e0f1d6b57c35e34b5f1769f36a9a458ea9796369b5e595ec1e0daa7904f9bb7008e7278aaa785af524b960dfc999cab53827cd247b4786ce661f4aeb6392be34b8ff82827c39f0af892fb497b4bdbcb8b376865682e6dc82cbd42e1886fc0d769e13ff82827c1ff00125ec36975a96a5e1f9262144ba9d8b79009ec648cb003dc802bece8c5c6367b9f3755f34ae8fa69987ad2c2dbab2e3d52d6e2de39e0b88e68244592396260c8ea4643291c1041ea2a7b6d4a2660a1b9ae9b185cd3dc68a6d1413cc728d2f1c01f953b4dc49a8c0762e77f0768aa99356f49c7f685b8ff006eb48ad519cb63f3bbfe0ae9f0e1749f881e07f1bdbc584d674e934dba900e0cd6ed9427dfcb900ff80d6cff00c127fe227fa6f887c213b805e269615cf5da4c8bfa35c57bc7fc1523c0e7c55fb2cb6a91461ee7c3ba8c3a8038c91131f2a5ff00d0d4fe15f9c5fb15fc4c5f865fb437863519a43159dc4e96f3f6ca96c1cffc00c83f1a72ba9b5dca87c28fdc7a6b2d3e45f2e429d70719148d8391d01e2b068b4d10b281ef51b2f500715e0fe20f8f97fe16f8ff0077f0c3ec577a8983448b5b5d55a44c08ddca18dd0007391f781fc0574cbf1a2d6160b78b7500ef246bbc2fd4707f9d4b8bb5d15d6c7a86da551e82b81b0f8a5a16ab3f956fe24b3f3fa79334ab13e7d30f8cfe15bcdaa5da28633b056e871c1fa573b9db7365066add2fef33deb80f1271a94bf856b5eeb575e6f172c303d0570bafeaf73f6d919a7624f7c0af0b30a9170b1ebe0e9cb9ae55d5d8f9b6c077957f9d7c41e059a3ff0084ab5bde39173093e8402fc7eb9afafb54d5e5f3223e77dd60dd8f4af9c3c35a7e9b1ea9a8489636bb9e5566c4454f00f39dd5f2d8ba7ed28593dffccfaecb64e9d6726bfab16ff6676ff8aebc02ac49695d6518e99201ff000fcebf4199b745e5ed523a30c735f10fc12d36c34ff16f85658ec22b49adc0f2dd4642614631cff9c57d6536bf72f1822f01e31c81d8fd2bd5caf968d29a7d5b670678dd7ad071d2c91d2e93610e9709b78a302150d80ec4e73cd7cc3fb7679fe30d1fe177c33b768a2bbf19f8ae0b77674dfe5dbc7cb48c3b852e1b1fecf515ef363e23b868cc867575c161c022bc3be36785e1f157c62f861aecf797515edaa5ee9d6d35b30d96c668990cb82a46fc3f04f7515efd2a94ee8f999d2a8d33e3bf11d96b9a7f87756ba1e36d52f74cb3b096f5566bab8fdf460c622529e610378b8b638e40f31873b79e3be1efc3abdb8f0dcfafe9daf1d019f5b87c3f1436fe646670b18324ace8c3e58f0e769073838c57d11e2af81706a3e17d450eb5aa450bc366cf6cb6b1b0648e48484c850703318c0ed18f4a8747fd9c669be13787ac34fd7aed0437bab3bb4fa712ef70f148cac42bf4da5947b915d72acd25c9bb7f8192a2dbf7fb1f2a5df88ae752b7b8b8bd925bef2c3b19ae6e9e661b54ed6f9b9ee075e334ff0008783754f889af7877c3ba35d47617b6f6d24c972ece3ca21c72bb3e6c92c7a57aaeaffb20f8897ed2b6dacabc52c491853a5dc8c2bb2c85b8073f2e07d735bff0dff65df8b1e15f1c5c5ee8b0d8ddcd0d9ac292ced35bb15ceedcbba3e189dbc67a77af4a8ba527ef3d0e3a91a8a3b1e75a5fc07f1a7882e34c587c5369782faff58b489e4d42e7e44d322325c5cb02a4ac6402a871b89ea075af3cf14e8bac683a2e8f7fa979cf6dab5826a56c5ae1a4055cfdd607a3f209ff007abe895f807f1d343d22d059e996f0f91a15e59a4916a2892795772137792c17e72490467ee9e0d647c50f82df17bc4367e0fd3f5af0822db6971476a9fd9d776cc0dba945048de3e7d8a3b56ea34f74cc2d53a9e87ad7c1ad57c2df0af4bd52cfc45ab2699358c511823ba91161668c0c615b18dc46315e33a3f8ebc7d63e05bad6b4bf17f882d2ef49ba167710b5e4d246dd475248ce41e0f515bfe28f07fc649a68b4a1adfd87c3f148c6d74d70aab11c8e5937e3774e7a7d05721ae7c3ff001ce9326afe1cb7bb7b2bcbd3f6ab8125b733945c32edfe02bc9e3b139aba94e8cddd44ba72ad056933d43f66dfdab3c47adf8f20d07c57aa9d4ad3508da2b7927450f0dc282ca0328048700ae0f7c7e3f65e97af47711e43f0dcf5afc7ed23fb43e1878c2c758d427f327d1ef239dec7051a428d92b9238c8cf35f4269dff05069ece30b0f852d957aff00a45eb13fa015f2f8bc0c9d4bd08e87b54315151b557a9fa316f78acb8ddfad7886ad717779f17b4e95ecae5628acf5a532cc85130fe6aae09e0e42ae3d72315e0de13ff82815ceada94169ff00088da4cd23600b7bf656f7e0839e2bee8f82de23b2f1c43a45dfd9d6e2c2eefd03c1791025079418a10471d6b929616b5395a7a27a1bcb1106af1d6c71be0bd7a28758f125acd23a4f717d6d2c602315221bbb724e40c71efd6beecfb42f961c2971d4115c25ac9a75adaaadbd9c1021f98c71a00bbb39071d2b4e4d562b80ccecc0e00f95caff00235f454693a6ad2678b5eb2ad2ba56352fbc530e9f9f32d6e180ee814ffecd58f37c52d36024359df7e089ff00c5d646a532480e2e2e57fdd9dbfc6b9aba8cb3717b763fedb135a49f298a57675137c52d18b313657dcb67fd5c7e9fefd59b5f8a9a32b645b5eaf1b47eed3ff8bae2edfe5f2d5a5925258fcd2364f6a86182e10e05fcf8048e769efee2b3f68fa9a7223d42dbe21e9b758d915d7e28bffc5571dfb40f8dad74bf833e24bcde601e52461e61800b3a81deabd8fda9083f6f7fc6243fd2b62eb4bb5f1059ada6aab6fa959ee0ed6d756c9244e40206e5230719efdeb6b732b2334d4649b3e3df87fe35b09348d5eee5d46045ff00847f5092193cd4cbeeba55079eb918c7e35e71fb4631baf13dcaac7be3baf0fc6036325be5b53ebf740e7eb5f77ffc289f87d33dd349e1ad25a1b9b7fb2b5bada2a46b16e0db5429181b8038ae3fc69fb2bf84bc537d2ddb4af1e6d64b38a158c911a36d0801df9f936aed1fecd79b2c355563d58632929733d0f93b43b836bfb5778ab2df2dc787ecc8c74f9638b9fd6bde6dae7742b5c14de0db1b0f124fe2596d2dedf559963b3595a42661105501393d3080f4aecadd8b44028de7fd939af1f189ae53b294a32bb46834fc55692ec2e79e6aadc34a99054afd4565dd5e30ce4f4af3ec6e45e34f1f69be05f0ddf6b5aa4856d6d532234237cce7848901eaec7000ae6a0d03c45f16a1b36beb66d3ece48c4a7494669133d4f98c36f984640c74cf0335e19f19756bbf167c72d0b46b88257d134430dc8c90b0acd20dc656cfdf6030a0638c1e79afbdff0067df0bdae9ba25edc89ee6ede7b8c31ba90b79615065501fba07271ea735f6593e0a9c29bc4d5577d0f9cccb153e65469bb2ea798ea5f0dfc1ff0004745b5f12f8ca5b1171183f61d34c416289b193b51464b74ced040f7eb5f0a7c74f8f7a16b9a8eb29a2d8dedfaea3a84974cb710cc6d666202bdc14900ddf755146c006075db5edff00b727c66f1178ff005eb8b7d02ce6d3bc31601a33abdc4e20b77451991d09c79840e81378ce39cd7c2f25c788be23789ed749d26c2e357d7f56996decb4f8198ed5030a839036aa8c963c70cc48e4d7bb8aaae1154e2b5679b85a6a5fbc9bd114758f1143991c5bc5631b1c88923f2573ec02e49aaaba5f89f52911a3b71a6c1f7925bc730e7d080c777e2057793695a0fc2f692c34c9ad75ef12c64adff8887cf0c7274686c81e8aa72a673f331cedda3af317dab4f3c8cec4ee6e4b16c93f8f7af22ce3a23d1d1eb23ec6f823fb5e69df0e3e14e83e18f10ebe27d46c1648ccbe54d22ac65c9450fb39c2915f4f7c13f8efa47c508fcfd2358b3d5238e4d92fd9df2d1b760ca70475ee2bf1cf5abe60a72dbbf1afab7fe09970b2f8bbc6b7e7eefd96de153efe6163fd2bcfc473538ba8a4f43a2972ced071dcfd718662d121cf614541a7626b185b3d54515ea2936ae99e638bb9cac920ed56f4339d4a0f5ddfd2b337fe757b437ff89b5bff00bdfd2ba23b932d8d3f8d1e0d87e237c33d63c2b38063d6b4eb9b1e7b33c6421fc1b69fc2bf9eeb77b9f0deb29e68686f34ebad92af42ac8d861fa115fd1a6b8c561d39870558906bf0d3f6e2f8763e1a7ed4de3cd3e187c9b1d42e86af6831c79770a24e3e8c5c7e15157e2b8e9ec7ec77c0bf1c27c4af83be0ef122bf9925f69b179c7393e720f2e4cfbee427f1aee94d7c57ff0004a8f88a7c4ff02f5af0ccf2efbaf0f6a5b9149e7c999720fd3746dff7d57da74be2d47b33f253fe0a7de26d5bc27fb5a586a5a1ea979a46a30f876cf65d58ced0c8bf3ca7195238f6e95f767c1bf87f07c4bf803f0f35ed4750b98fc45a9e816973797c70e2795e3059dd78e49f4c57e7dffc1569b3fb53aafa787acbff004296bf4c3f65d52bfb35fc2bff00b1674fff00d10b5cc9be668eb925c9167837c56fd9f7c530d9b3dbe96facd9ae771b54f30a8e7929f7bd3a66be664f899e2ff86b793c5a26b9aae95e4be1ade2b970abecd0be57f315fac433d4715c87c40f841e0df8a56e62f147876cf557c616e990c7709eeb3210e3f3c5128f36e4c67cacfcf2d27f6f5f1ae9f6f22ea56da3eafb54859eead1a1756ff6bca6018633d8724552d43f6f4d72fa757b5d034621c7de2975f2b71d81f7f5af5af8c5ff0004ebb0b5d3755d4fc15e257b74b6865bb7d375c4de36a2162a93c6339c038dc87eb5f1b784b4d864d16dcc817c962640ae3ef30208cfe95f339838d08f3495ee7d365e9621b51d0f4ef117eda7e28e09b4d190636f1a7dc37cc73eb27b1af3fb7fda3b5d8964f2ec2c4c921ebfd9edcf6ea64a8ed7e1beb9f127c4d268fa1c0b7f7512fda9e369521558c1009dcc40eaebc75e6aa58f83d964ba8a416f1cb67feb15e400740dc1cf3c30e95e64aa52f66a5289ead3a757da38c246d697fb4c78b7477827d374ad3ecaea03fbb956d4b9e983f79c8aeb6eff006cef1edf480457575643ca198adeced986fc73cb02719ac8f87bf0a65f881ad697a65bdf5ae9a350e7ed57258a5b2e33fbcc0e3ae2a6fda03e10dafc016d36dcf88f4cf12de5f4666f2ecd59020058739624fddf6eb5ad16e69ba54cceba5069569ea42dfb57fc559a29561d66eaddd8e14086d86d1f847d6b2afbf684f89fab1b79351f12ea17525ac9e6c2e6444f25b1d576c639ae9be2b7c2487e1df8563d5b47be93c4577fd9d697d240d06c443264cc836b124c6b83f8f4af9ff50f1a789ed6c61bd9f418ed74e950b2dd1b291a3ce48fbe4e3b575d1a589a89b8c52472d4c46169b4a6ff0003d363f8c1f1002b243ae5e4659705bed6c72320e318f61f90a4b8f8bdf12648fca1e29d5a35cf291dfcea01f518600579beb5e2ed52cb4eb265996de694aabf9712e3e58048fdbd6441f81afa226f867a16a7f0fb45d48497d617f71a6c134d259dd953248d1a966dad918273d31555a35b0ae3ed6495fb5d934eb61ebdf922ddbe4798af8cbc72d313ff00092ead36ec7caf7d337d07dfa96eb54f186a4c259f5dbc5e46479f2e3e9cbd79178b2f2ff4dd7b55b38354be921b5ca86798ee27d4e3be6b9c3a8ea715c42d24ed72f0a8215e462391919e7a8ddfa57ad1c1d5693e75f71c12cc28c5d9537f79eded0ea11b159b5e97691b8892507ff42acfba7b785a476f1246930f98a89a30738f6af1b86f2487607b467d90b4594393966c93fcff003ad0d1268bedb773c9f2ae73f30e401815a3c1ca29bf68f4f21431f19c945535a9f5efec67f07cfc5af1abd8bde436f347a49bd96e2ee34900fdec43215948ce5876afb4350fd862caee2f39be24cf06a0abb62b85955b19183956ea0803232323bd7c23f07fc517de139af25d3de4b6b81a5286681fe6641221c0c7bad7afdefc44d62ea1f3a5d4ae278c286dfb8003312b038ee37120fb37a815eae5b252c3de4f5bb3cccd69cbeb3ee6d647a4fc3cfd947e19789e3d793c6d7da5ff00c249a26a73695a9aada24892c8837472a3484b1492228e33d324678a83c63fb39fc0bf06de5a5dd9de16b2697ecf776f0410851b94f96e87692b8600119c10fed5f335bfc42b8b4f1678a65bbd4a45bcbabb8555198969bcbb744dd81d73b719f6ae8b5cb5f1549e1fb1b9974b92caceeaea08e09f56616093b7deda9e69049c26738da3239e403e8a953b5ad73cb74e77bb9d91ddde7fc290f0edfab5bf847fb56f203e6c37576e55d08e5597600558632083d457bcfec8f7d07fc237a79b6321b63aedc18bcd62cdb04084024f248cf535f09f8998693e74baaeb761670f398ac6537b36dcf4054041d7a963f4afb5bf62e681be1ed862274fb2dfcb32166f99cb42a32dc75c28e9eb5e4e613e68c5256d4f4b0b0507269b7a1f553cf32db0936b08f19dd8e2996f7973710878a29245fef2a922b91b8f145ac77b7d62d6d243731449247248b849776ee1327e6236f3d8645660d4636937b42ca4f3b92464ae39575176b8e3439b63bab9ba9d73be2917ea86a8bde1fe2c8fa8ae7a1d71a3c797757f08ff0066e98ff3356175fb9ffa0a5d1ffaea88ff00cc1a875532d5168d882e3e6879fe23443758639f53fceb11b5092491646bb89a41d19a2da3f100006adc5aacb818834d9bfefa53ff00a154aa9e653a763a086fb6e315a96da93332aaab3337002f249f4ae523d524e3769309ff00ae372c3fa1af2bfdaa351f1cc7f06f50bef87b7f2785b56d3e41777b78f78911362a8fe7049180dafca91d338201ce2baa9d457b5ce79537b9f45deea2fa62e2ee6b7b138dc56eae638881eb86615e03fb5d78ebc5cbf08ded7e1bdf5adf6af7b3fd9eed6cb54b78ae12d99092d1b338e73804a9c8ce457e525c7c43b9d5ae646d4f52bb9a597fd6493b19779c9392c4927927f3a55f1608e4647b98d9f39f3377deebce4f7e4d752a9cbadbf131f677ea745e22f84ff11ecee1ae2f3c09e22333fce658ee96e4be4643652424e7f1ae3352b9f16f87640f7365e23d1c21c319ada78b6fb96231fad6e59f8ba56986cd415fd84bc9c741d79ae9a1f89dad58dac36f6b7f71044b19dc23623ab1383edd2b9e4e12e8744534b73ceb49f8f7e34d3da46b3f18ead1ede83edf295cf61b7773f9575163fb627c51b5f2a05d797512c76aa5c5b45296fc4ae4fe75a7acf8cf4df11794baaf87345ba558d50b358c619b1d58b801c92727ef67f4a87c216ff0ff00c2be28d37c472785e3b89a06332d8c57728b7f4190ccc73d4f5c7b5612a7465f144d39aaa574cefeebe19fc46f8a6c3c6daadedbe95aa9b15061b68fecf6cbb4111cb2b3921480d8e064e0600eff00427c0ffdaab56f0af86fc43a76ab671a6aed63bc4bb0c61e4c153e5ac980aa7e56f987407238ac38ff006a8f86fe20d310ea5697ba59b2f2cc1a6ac5e7a4d21c832e46012bd46f000e31c9cd41af78b3f665f1269f73ac6bfab7886eb58584ac76d0d9c96ae4b0008f35774631c9f9f20e39afa0a1ec28a5184aebb1e2d7556b5dce2d33e25f8bbf18357f885ac6a779a86ab36a12c93adb40acccc444bf3617270016db8000ce3a0e95eb1a8e96bfb2e7c3d6d00385f8b9e2ab257d76e94e5f41d3a40192c50ff0cd20c1908e40c2f6e733e18e8bf0ebc29f15bc47e3ab2b2bad47c25e074b8d6eca0d53695bd9bcd58f4eb7241f9ff7b2233e072223c735e4be26f175ff008cb5ed4f5ed5af24bed5752b87babbb890f2f239c93fe1ec05724e6eee4f7674c62b48ad915c4802850785e063802a2b8b9f948c93c554f33d4d57beba0b113d0e2b97637d599bac5d06e0735f6fff00c13b74f363a1ebb73d1e665c9fa57c20aa6eaf147bf35fa29fb0ed87d83c2d73c7df5527f335e6639f2e1d9d785d6b23f45bc23aa2dde816b213f36dc1fa8a2b94f06ea423d15509e8e7fa515ad1c643d9c6fbd8c2ae1e7ed256dae3fcce41e4568e83213ab5b7a6ff00e958bf68ad6f0ec9bb56b5ff007bfa57b513cc95eda9e8bae27fa2d877eb8fcabf333fe0af1f0f7c8d5be1e78ea18702e219f44ba703f890f9b167fe02f20fc2bf4eb506ff0045b2c8cf06be0cff0082b76af17fc29ef04e9042f9d77accd72bec22836e7fefa9947e34aa2d1b2a9bd523e6eff825c7c50b5f047ed017da1dfde259e9fe23d2e580b4ad84f3e2fdec7f890ac3f1afd52baf89de12b4c86d61653e904523ff00ecb5fcfe7c38f194fe01f1f681e248188934bbe8ae4edeacaac372fe2b91f8d7e92c9f1bfc57ac46b3e89f0735ef2250248a6d6b53b5b15dac32188cb360820f15cd76b436713e6bff00829f6b96de24fda49754d384cf62da35adb2bca9b09742fbb8f4f9857dff00f007e35c5a2fc03f879a7c5a2493cd65a059dac8f25c8552c912a9c00a4e322bf3dbf68ad2fc55e3bf105b5f6b5a3e8da34d1e008e1d424bb6c7a1611a8fcabd8fe1b5e78c9fc2d656bff0985969b690c61162b1d151dc00381be691bff41ac5df7366fdd48fb2efbf682d6db22db4ad36d7d0c8d24847ea2b02fbe3778cee558c5776b00cf1f67b35fe6d9af9ee4b6bdfbd79e2fd7af3d424f0daa9fc21894feb556e20d2bef4fe75e37f7af2f269cfe4ee47e959bb8923ea3b8fda1b46d4bc0fe23b1f11a43a56aeda4dda45731b7fa3cee607c0209ca313f5049ea3a57e5ff87ee9a3f0e58803042b6011df15f4078ab5bd3ec740d4d6186de0ff0044980f2e3553feadbd05781f876d62b8f0e58e23f9a4df860c410738c7f9f4af9acde5eec5347d4651177958f5efd97efde1f1d6a9885662ba6363273b99a6881cfb75aa3a26bbe10d7b54d43c2be26564d46da0867b6b8652a9144c31b5641ca9ddce0f1cf5accf873e34d3fe19f8aa69a48e2796fed92d6059a6f2a3f30bab0dcf8380761ebc73d4579e5d787fc43aa7c58f185bda698d75a8d869f6a9711c720458988539e48c8fa54e06a7b3a12a918a7a75db746f8ca4aa578d3949ad775beccf69d26e2c3e18f89becf15ebcd6f2402e1666f9d76138c92a0f19e326bccff684f110f1b78db4578e48ae22455896485cb291bb26b0ed75bd534bf899e04f0c5edb45a536aac9a7de3293318e396eb89532472011f2f43b7deba5f8ddf0e07c34f1943a549a8da6bb2dc43f6ab5bed36378980dcc0874619471b4e472391cd7d152f62d464ac9b57b743c0abed79e5177959dafd4f56d4356bad43443e75ca94f2366df200e36e3192c6bcfbe1678a2d748d2e5d2e7d46e2da18e67c44814a104f7dc1abc9a6fda0356f0cdc4fa36ad6736a28994f32490c33a7b32e3071f406b9eb6f885613cd24b1cff0066666c84994e79f7c915d14e2e374f63926d6f63a1b7f0ce87e2df8b17da65fcf38d35a79cc7f63c4622de49247ca40e71d6be93b7d62c347d022d39f5059edecedd608e6289e62aa28033c81d00af8fb4df10cb6de2a86ee4b99a6803ee2865ca1fc33835ebdff0b3ad1ec888d210d8c6360fe946270f4b12e3ed15ec3a15a742fc8f73c4b5eb1967b7d5afa724ea371a99b6fb3c522c985d9bd9b2a4e7f84641c75ac0f105b5d68bac5d5adec0f6b32b91b5c638ed8fc2bb54d564b89a2482d09315e17458539c138e95f5fc3e37f09af876d97c5f71a522342bbe1d67ca623819f91c16fd2bd0953b25667229ebaa3e07b2911a50377353692c7cb91bab48d8fc0907fad7d17f13354fd9f754d36f9349d3dedb55f298437ba1db4c91a3e386d8cca8c07a6315e35278067b5f86f6be2fb7bc49348bad6e6d1ededa55db71ba38639bcc6ec014751807ae6b96ae90675e1dfef533d97e09dbe8775ab6a8de22d6b55d22ce0b3842b6916f14b34c4c9c2fef0e146403919af4fbff008b5f087e1fdbc5f66d26fb57bd88aec9bc5ba82cea3180316702a23631fc61874ac0fd8efe03e83fb40788bc4b6fe225be92db49b4b69d2deceeda05959ddd48919792a02f40475afbc3c0bfb36f80fe1da9fec5f0a787ecae13fe5ba58096727d77bee63f9d7161311ec68a8f2ea7a38da3edabb77ec7c19f08be2f7c5ab9f0d3685e03f0ff008a2facdaeae6e636b3b530430acb2b384133602afcd9c0381dababbefd95fe327c54b8373e25f10e99a0c923acac935c497f76080460e38cf27a1ec2bf4321f0badd329912491631c79b26107d14715a8ba3416eb83b412385807f80cd6d2c5569ae5d9184685283bee7c29e12ff008274e9114d0dcf897c43ad788a51c980aadb407ea8b96fd6be91f87bfb3ec1e0bd1ce9fa2dcea5a4d8bb3398e3ba93a9ea7731c83f4af68b7964b40a9146910c7598647e95b1697c25505b6cae060955213f035cd2a6aa6b366aaa386914785ea5fb3c5b6ad745a7bababc914706eaea49b9ff007493543fe1426a3a4fcd65aaddc2ff00c291dc48a3f050c057d2104ce72113629fee0e3f1ab9f618ee157cee5b1597f675193bd87fda1562ed7d0f97bfe107f1d58102db509ee17fe9e02c98ff00c768921f1ce98bbee21b2b84032774241fd1857d3eda433294444853e9c9aa175a3410a96d8af27f79f9c544b2f7f666d15f5fbfc514cf9917c69aec2c3cfd015d7bb23ba7f3534f8fe28448c526d22fa32bf78c4c8e07e656bdf2e3c229a864c8b16c3d3b0fd0567de7c37d3a48f6b4218e4e0311fcbfc6b1fa9d78eaa66cb1587969287dc7975878fb48ba4462f730ab74696d9b1f9a835f3efed5dfb4c6871d8ebbf0ab4c9af6fb55d56c3173242c23b582311b4c564c82d233617e51b42e01e735f5dc9f0d2c778db6c2551d57240fc48afc90f8e90edfdb23c750b923cbd56fe3da3a2a2c2ca00f60001f8574e1235a136e767a1cf89746714a1dcf29b2d422b796e56585268fcb276c8b9e72077fad45358e91a8317fb32c5275c465867f234496e9f6abb5322a2ed1866ce3ef8f4150c5692acbba2549b03fe59386feb9af513b9e74a367a11dc786ed7cbcefb8840e7e59738fc08ace9267b0611c3ad5cc654f1b8671f420d6c5d5c48abb248e48c1ebb811fceb3aeb499b1e65b18e68a439c160181f422a92467a8f8eff00579e30575d8e5ffaeca73fc8d45f6fd7a3cf97736d2ffba00fe82abc36ed67957db9273b54f4f6a7f9df37b54d87764f1eafe215e7eccafeeadd7f5abb6fe33d5adfe5974d909ff65bff00ad5962e1d7a12053bed4db47cd96a5ca839993ead772ea912a3e9f7300c961821416ec4fe3df1580750b8b3711dcc453f0ad94bc756e496fa9a5ba74bd87cb703f2a7a89bb9561bc4970cad54354bbf94f3f4a8a6b56b190b467727f12e7a7bd56d4a3923bc68a5528ebd54f51ed4b71df97d4d2f0cda9b8be4cff007abf487f651b7163e1f2a06df91722bf3cbc0b019b508140e4bd7e90feceb08834490e00fba3f4af2f327fb9b1d981fe29f49e8d7c61b30a38f9b3fca8acbb1980839f5a2be6d546958f69d34ddceb3ccf635b1e156ddac5b0edbbfa1ac731b66b67c289ff0013cb607d4ff235fa2c373e3e7b1e99aedfdbd858583dccf15ba1cfcd348101e3dcd7e5c7fc15abc7b6baaf8a7c1ba658ddc3771e9fa535c379320655927bae3a77db6bfad7e85fc77d2e1d4acfc2893431c81249dc79a3383b50715f90ff00b7e6a316a9fb415ee95115115a7d82c0040028db6eaedff8f5c9ae49d5a8eaba765cbf89b4294152552ef98f99f50b76b5ba96165d854f4faf23f9d7e8cfc15f8b3a56a7f017c277daaeaf6565716f69f609cde5dc7112d09d809dc4755087f1afceed5d649996f9d7f757524bb1bd76bfff005c57d1bfb247853c19e33f0ff8823d7bc3f65abeb3a6cf1b4335e06702ddd4f1b33b4e1c1e48fe2a4f540753f163e2c783350bc1e57886caf1c1e16cd9a727e9b01aa5e1df8c32476ab0e95a1eb9a928e9225a0863ff00bea46515d9f8bb45d3f4b84c7a669d67a7c4bd16d2dd221ff8e815e73717d2dbb1059b3f9d4ab319d2cde3ef17ea03e4d16c74e53deff530edff007cc487ff0042aa171ae788981371af59db7aad8d89623e8d239ffd06b98b9d75b69dce47d2b26eb599181249a7ca82e69f88f51f32c6e966d5750ba7689c7cf28443c7f7515452f84731f87ac65691408d2403ea588feb5c16b5ab160ea493b86315dc786d917c17a7866f95a4663db3863c7e95f319d2b463ea7d364af59981f1837c3e16b01236efdf2a74ce7e57fe958ff02fe3e6a1f047c5177a8ae9d0eb9657f1476f7905c311298d0e54c721cec61ee08c718ab9f17e62de19b2ccbc7dad70b8c63f76dc1f535e43f2375739f65ae9cb6929e0d424ae9dff00330ccaa3a78b728bb356fc8fa07e23fc54d07e277ed31e09f14683a56a5a969c86c449a57d983dd4b2236e785501c3b13c0c1c1ae87f68cf12789bc61f10f469478075af0e241a6ac5058eb4eb6f2b2167c3e07dd5e4f1ec6be68d2351b8d2b56b2bbd3eea7b0bfb7992482ea090a490b83f2bab0e41070783dabdc3e307c74bbf8a3e3fd2f51469754d46cf4e874d324658c972d193ba52916ef99c93901bbd7a13c3b8a8a8c7656d4e1a78852727395aeee61fc5bf0c788bc7bfb524de1bd72cec3c3de23d5b53b2d3a582de633db5abc891468778e58052ac71ee2b77c03fb1e6a9f123c1be23d5b4ef14695a7dfe85abcfa4dc5aeac7ecf048630bf389c9c2e727861d8735c5789bc49e30f88dfb440d5d6da4d3bc6da96a7034304119b1786e308b1050ec4c6461482c78eb5eefa0fec31f10fc64df68f11ebfa069492334d27da6e66bf99a46e598a2e10b127939e4d6b39aa7149c944ca9c1d5936a0e5f81f25ebfa1ea1e0df105de992cd6f2ddd9c9b1e5d3ae52e2127ae5648c9561cf506b7341f1b5f358cd1c96d633ba027ed17110254007f87214fe20d7b56a5f08c7ecf3fb597c3ed153566d6f379a65e7da8da8b756f326daca132780548eb5d269b1685a47fc146f533aac1a6d868367e21bc9278efe245b48956073f3a91b71bb07a75c5691affcbae9721d171dddb5b1f3a5d78a35fb9b67946a1716d6a842b7d8c08225ce480760032406c67ae0fa57bf7c35ff00827cfc45f1bda59eb1abdfe91e1bd3afa34b849aeae0dd5c491ba8656f2e3f5041f9987bd79d7c448f4ed5afbe33cda3cf15e696be2186eed2e200446f135d5c2ab28c0c2e2518e3bd7ea0fc1d65d4be10f81eed5a48cc9a158379923ed5cfd9d07000c9fceb3c462674a29aea6d85c3c2acda9743e65f177ec09e0bf877f067c6dae5cf88755f10f88b4fd16eaeed4612d6de39638cb03e5ae59871d0b62be4dfed2ddfb31e87684e7cbf19dd4bd39e74fb61fd2bf59fe22696b7ff000bfc6566ec267b8d12fa2fba0024dbb81d79c57e3a5aea5ff168ed2cf3c26b924f8f736b1aff004ac6955956a6dc8e8a94e34eb454763eefff008262ec8f54f88f215ddfe89a7a6d53cfdf98d7de51dd2bc6c44490638ccc719fa73cd7c11ff04cd592de1f8973095f0c74e43b474e2738f6afb6a39a36f999d772ff000fdf3edf4ae484d538a573aea41ce6dd8e86078264ce04a8bc8e7e55ab51de44b1aa34c91331da1638b1bbbd7306611aabbbf94b90c72b9dc7e9835a1a7ea107581493c86902f3f9d6d19ce6ee96873ce118adf53a06b6f3304b050380d2367f4e82acdbdd8dc22919a7239031c573d0dc4cee5e22d22b36371e368fad6bd9cbe5b2ee219f1c851fa926bd08ec71cee761625e6d842796bdf35bf69a6ae010b927b9eb5cce86cf3c814303db0bd057756b1ec8d41e4f7e2ba5e8706e547d3432ed071f8566dd694b17cc137363f2ae8ea29a10ea78ed493133cfb50cdbc9ba5909233855159a8f7174ac3ee2376cf35d36a9a629b862c98c1eb8e7eb45ae90b75b76a617fbc7a9ad7962f7173b47376f60be618f95ee78eb5f93ff00b667c2bbdf87ff00b626b9a84a8a74ef11d85debd6732b0246eb7659548ea36c8add7a82315fb233692d14276aa81df9afc9cff828b79b65fb612b4a8fe54de0d2b03e4ed20453eec7d183545484791f29a53a9294f53e1dbcb8ddf6a20e06e51fa93fd2a8b36fe79e29b793ed49f0d8cc83f1e0d50170e78cf15ca9b48e8946eee5d6d4a784623b99100ec1ce3f2a87fb72e724334728efe646a7f5c66a9c8c791daab96c1a7abdc1248d4fed346ff5b6ea4fac7215fe79a77daad24ea278ff00ef97ff000ac8639ed4a18f155a90dc59abe65bb7ddbb653e8f091fc89a5f2d187cb7701ff78b2ff35acbf339cf7a3cceb9e946a4732358dbb751716e71e932ff005a5d92edc7eedcff00b32a1feb591e61fc28de3eb4b52935d4bcfbad6659668c98d18330c8e40ea3ad62c929b8ba9253c1762dc9cf53eb525dc9d40e3350c49f383daaa2ac44ddd9e85f0ced849ac5a8c77afd14f8123cbd09bb648fe55f9f9f0be00dacc381c8c57e80fc15f97c3c0f626bc6cd1fb87a3815efdcf73b260d6e0d1556d18790b9c9a2be60f70f07b8fdaf7e2ef88723c39f04e0d2626ff5773e21d49dbf128a23abfe13f8a1fb40deebd6b79a9ebde16d22d91b2da7e976192dcf4323167c633d08ebd6b69350b356c08236ed86ccac7f16e2b5f44d5247bc0ab008c700f96bd2be8618dc4549249a479f2c1d0a71bb573bff000f4be20d6af67d43c49ab5c5f196426d2d59dcc76e84f2a9bd8b63ea7fc2bf263f68cf121f137ed0fe35d515f746dad5ebc7dc058d8c6bfa422bf57752f102e9f1ace5b625b21998b019c2a963d4fb57e2f6b5a93ea7aa5f5f4ad99668de663fed4ae5cffe866bd7a57e677773caad651492b22dea4ad1f86f46848fbb099cfb6f91c7f2515e93fb26f88a5d1fe2e416019bc8d5ada6b57507b853221fcd31f89af3bd680fb2dca7fcfadbd9c03ea54b1fd735ce2dc4b6ee27899a275fbae84a91f422ba23aa39a5b9f7b78f35ad234cf33fb4355b1b21e93dc22b7e59cd785f893e26f856d647116a06f1fd2d61661f99c0af9e599b797ddf31ea7bfe7525969b79abdd2c1656d3df5cb7022b78da473f8004d0a36d447a2ea5f166d5b22d2c267f799c28fc866b9cbcf881a9dd8210436ea7a6c5c9fccd765e13fd947e27f8abcb922f0ccda65bb8ff005dab48b6a07fc05ceefc96bd0bc31fb135f5d789a2d275ff0014d9da1dbbe41a5c0d704719c02db054caa423bb348d29cb647ce90eab7779a94027b891d7cc1919c0eb5ef7a4123c27a3c63efb077503fde3826b82f8bdf0db4cf85ff1b67f09e9975717b6566d6e04f76543b33c48ed9dbc0e5abd2343686df44b3712324e2dd87c8c4614b3641fae6be73399ae581f4793c1fbe707f102d6ff00588f4ed1ade36babfb8d4238604520191dd4aaa8cf03248fcebabd17f630f1b4db5b5ed4345f0d45b82bacf77f6a987b6c8430fcd8567ea9318bc79e0c9ede1f35d75ab6748dbf8d958103fcfad7d38dff000b035ebcb8b8f2adb47819f9fdd296f7f99c8e7e8a6ae8e227470b0e45bdff00326be1e15b133e77b5bf23e2af88de028fe1bfc509fc3516a23598ed25b7537820308977aa39c2124803763af38afd33bcf10695e15bc4b1d0f48d1f438376d31dac51c58c1ee231fcebf39be3258dec3fb41dfd96a339bcbc17d6b1c9233062c4a45dc2a8e840fba2bf481b4cb3b5bc7910c512090e16da20ac39e85b048fcebb314dce10bbdce3c228c673b2d99f0a78d3c41047fb71cfacea77f0585b43e238679ef6e388a255084bb7b0c57be78a3f6c9f03e98d3a69b79e23f185ca12146951269d6a0fa994a97c7d00af9afe297851fe21fed71aff0087ad2e52ce4d4f5c6b68ee2752eb1e40f99877c62bdfbc3bfb19f80343585bc53e25d43c43723ada238822fc238cb363fe042ba2ac68fbaea7630a52ad792a5b36780fc47f8f93fc46f12699a8c5a2699e1fbfd3ee04f6b756f24f7ba81901ca0799dd99f69e5578504938ae7fc0fa1f8a7e2a7c6b974e5806b5e2ad526b8774f103987ce97cb67669c9604700b104f6c735fa11e01b5f04fc3fb98adbc21e0682daed46e134766b14cddb3bdb74a457ca7e08d6ae1bf6fcd735292fa3d0ee3fb5b5491ee64844e213e4ca0fc87863d40cf73447110719282b590a5879a71751df999e75e3af85daef84fc49f12344d6af6d2d351d02c6db51bbb5d1e3db69721a6b650a06170aa270c3e5eabf8d7e98fece774b79fb3ffc39b8172ca7fb0ad97e51d42aedff00d96bc1fc75f0bec3e2268be3ebdf0e68dac6bbe27f10582595e78cb5e992caca18d5e22393b102010af0884fca39a9f4dfda6bc19fb3dfc2df0b78223be8fc77e28d32c96c8c5a387fb2bc9b98801b1ba41c81f28c1c7515c15aacb154d2a2aeeffa6e7752a50c2d47ed1d95bf53eb1bcfb15ce9b791b7992092da44919b0142b210493c0007bd7e2042cf1e9e96ace4c4b21f941e0b676e7f215fa29a47c31f8ddfb50cd6f3f8c6fc7c2ff034d2291a788f1772a13fc36f9f94e0fde94e7d8d7e7eebda32e8fe28d5f4b12338b0d427b60cdd4ec94ae4fb9c56b868ba71929c937a6dd08ad3556a41c6365aefd4fd08ff00826fdbaae8bf11599997fd32c5028ef88e6ff1afb1e1bab785da3daa85573b54f43ee71fcabe3aff008275323f83fe213c80ed3abdaa8619cf1037403af5afad05bc4ac499980ce76bfcc7fc33f9d7346518a575ad8eea917293d742e49a92c423dc0481b80aab9cfd4f7a90dccd712aef2228471b48c0fae2a8a5d1dde5c313fcc71e67573fd6af594314320cbb4f3eecb281d3ea7b56d0a9293b184a3148e834bbc257106e9028fbf271f8815a7657e977f72559769c37f747b5734d203264b06239f2c7dd15a5a436e9364311400f2cc78fc2bd9a31bee79159d8f4af0dba9640a3e5181c577519f945719e13b52ca1a438f41fc55d9ae028c74aeaa9b9e7c475252d1589666ea16a6e0e3a01dbb9ab1676e238c63b54b22e5b349e67f0a72e7f4f7aabe82b6b722b84322b471b6d27ef123381fe35e0bfb49fecff00e05f8b9e15b99fc51a740baae9f65750e9bad72b7160d2c4ca4ae08deb920946c83ec79afa0d5022e07d6be77fda86c67d53ecd646e6686c254db3471363713d09c5545daedabd83979a492763f0bbe2c7c3bd4be166b93699a85cdaea31349fb9beb327ca940cf3820153fec9fd6b85fb42b0c83835f6e7c6ef81ad1df4906a0925c4723ee8e4c9231dbf1af04f117eceaf6a0c96570cc0f217a9f7e2bc3598d0e6e49fbafccf72580aea3cd0d51e38d3865f7a66ec02474ae9f52f857acd8e5954381fc23afe55cf5f683a9e9b2b473dac8aca483f21ed5e842b52a9f0c933cda94aac5fbd168acd26471c52073dcd42ccebc3020fd28127ad6e7396d5b70cd2d575b80a31435c065c5211306c9c52938aabe70fad2b483cb383c9e2995a11c8fbdc9abda6a0926546e43718f5f6acfad2d33f7b2c6075ce2988f6bf865e15b9b7b8b7b9dbf2330114a7a1efb0fe0720d7dc7f0863dbe1d8f2bb1f76190f63e95f3b7ecffa5c7e23b7b6d2ee3e52e14124641ff6beb93f8673dcd7d71a0f864e8be5d96489f6e6391c6df357190ade8dff00eaf4af99cc2a5d729ede0a9dbde3acb563e4af345456cdba219e08e08f4a2bc23d73cb61b78a3624cf2b93ee17f90ae8bc3f116986d80b77f98938fc4d6547a92b2130c4376700edc015aba7de4a245df2904f68c015ebe1e3795d9cd5a4b949be24477f37807c4d1593c497b3695730dbff000aef6899464f50327d2bf22efecda0d42f2c832bb2ceb6a1d3386da4ae47b702bf5afc5fa8456fe1fd46798b32c76f248dbb8185524f7f6afc97d2e56bad5ace46e4c977e7b7e041ff001af7a86f2b6c7875b5512febb38920d524181e76a5b07fbb1a30ff00d9856f7c0ff87a9f17be2468fe14bebd9ecf4d984d2cd34014b44891b392a0f192540e7d6b90be90be9766cdd669669cfe242ffeca6bd5bf654f15681e05f1c6abaf788353874d82df4c92280cc189791dd010a14124ed0ddaba64dc60ec73249c9267addffc09f877e0ad752d20d3e6d60c64069352b82fbbeaabb57f4afa3bc33a9697e1dd0e0b7d134cb3d2e3f2c7cb636e9176efb473f8d7c93e31fda5bc28dab493e9da7de6aa77655d916043f8b6e3ff008e8ac3d5bf6b4f1adc5aa2e91a1da6956cdf2a4d2c6f39fc0b613ff1daf2e14f1136dcf63d4955a108a50dcfb2aff5cbbba56740eecbdf1d3f3e2bcaafbc6fa7f87fc68f7fac788349d32255db8b9ba3239ff80257c83e26f8b9e34f15065d5fc5578f11eb05bc9b13e9b530b589e1df07eb7e30ba31e8ba35f6af293f33c7133a83eacdd07e26babeada7bece6facff00223d07e3578a3c2fe2ff008a97dace8d7f77a9dd5cdc41b67f2561b60ab1aa101492c7ee8e78ef5bfa6dc634db53bb25615fff0055622fecdde27d1f45bcd7f5896cf4f8ec6233b5ac6de6c9c763b7e55ebea6ad59b0874db55272de50e0579199a8c94545dec7b595f3479dc95ae6af85765c7c56f8722765118d72dd8b1e0000a9fe95f7836a9a7967904caa074da0bb9fa66be06f045cdb43f15bc052dd8636d1eab1bb85e495080f15f527883e37697a7cad6da4698af38e11181964ff00be1727f32288a4a8413f3fcc5277af3b797e47c95f1b26177fb536b0eaadf36b36c02c9d7fe590e6bee1f1378b4e9d7124da86a961a75bc6cd8f31d512319f5638afcfff00881a85ef887e3d5f5cdd2496d7d73abc3b94a05646dc807cb9c0238e2be9b5f854752d50cd7374f3dd97389ae105c4d9cf51e60d89f821aeec4c94634fd0e1c2c5b94fd7fccf11d13505f107ed7d15ed917d5e2bbd75e481a1c8370a436197d8fad7db56f65736298bc96cf465c7fc7b86f326fc4273f99ae27c11f04ec34df100d6a481d75224ff00c4d2f25692e5f8dbb559b95e38f900e2bd7f4bd0ec34984cb141b24e9e6ceb9e7d42ff0089ac2b55555a6b648de8d27493bf5667e9fa1ea3ab3245179c9687e57b9b9710023fdd5c13f89af8363f1ca7c29fdaa3c57aff00d820d75b4fd4f528e2b69f3e5caec5e3424004900b038ef8c6475afd0f5d4a07b88d9a16b9653c64fcaa7f1e057c3bf04e686e3f6d8f125d5d14545bed5e5dc70429cc98209e873d08e95ae154529bb7432c57337049db53bb3e13f8cdfb4a4d05d78df5993c1be179086874f316d90a9e9e4d9a91b78fe394e7d09afa87e09fecf7e0bf8476eb3f8734356d636fef75dd5185c5eb9ee431188c7b201ef9ace5f1c5a497cd6fa3e9ad7d73bb99e672225ff798f5ad7b5b7d5bc50c16eaf9e5849c1861ca5b8fa01cb7e35cd56b4a51e58e8bb23a69d18c5f33d5f76767ac7c4cd1fc2f3832dfcfaeea40e134ed313cf9a47cf418e17ea4e3d6bf2f3f684f867aff00c3ff0088171a9ebd671698fe29bdbbd5ad74f138965b685ae4e1652a3686e7a027a76e95fa81a6e8ba57826cdeea4960b6603e79e5c038f6f4fd6be0dfdac7567f8edf16342b5f04585deae9a6406d259963e257698b165e73b0640dcd8f6a9c3cb91b8b7b97563cd6925b1ee7ff0004f192483e1df8da4da3326b91804039e2dd7fc6bea986dd649b2f2142790b9cb115e31fb24fc33bbf833f0defecbc472c3fda9a8ea26f9a0b7f98423cb44085bbb7ca49c70338cd7b52de4ba949980058f38deca77673ebdab2935cc8dba32eacc6cd5422f903d14e49f5c9ff000a7f9d34f20db98d7fd93827dea030c8cdf7c4857b29e6a78956362b1659cfcd961915d507639a56352d6d3748a0b9080718ee7eb5d5698be5b45b532b9cef63c62b8eb5f970cf2ef9187015b85fad75da24eeec048c3838dca393fe02be830b792bb3c3c4e8cf4cf0de1769ddbc9aea0301815c0e9b79b484b72164c60baf45fafa9f6aecec5f6c4b96decdd58f526ba2ac75b9c14ddd1768a4dc0d32699614dc7939c051d49f415ce6a457171e49550a5a473855f53fe152c30f96093cbb72cdeb4c8206563248774add7d147a0a9e8012bc63f684b0fb6692486da570772e322bd9cf4af2df884a756b7b990e7c850c917190d8e19bf3e3f03eb5ad35cd74fb0b9b95a67c7fe32d0edb5ad35e29c26e51f263d71eb5f3178cb4cbfd0ee25468da4897ee861c30ec3a7eb5f5a6bec2cee64b5c4cb97c334806d23d8e2bc83e246973ebdb8a448b0970142c78240f46e9d7e95f0d8da0a53d7747dde16a5a3e4cf9e6d2c3fb46f92596060aafe649c64803b60f7e956aebc2f6579787cff9d932ecce3f8700e3ea4d75f0e8f1e8ba8b25e2491286f28328e779390a4fbe31f8d45736e9796f2480286672791cf27bfe47f2af9da95274df63d68c233f33c5f5af02697a9ee2d6a82666c05518e0d721a87c1b80a4cb1968a64466031c1fc6bdaeeec629ae954203b01661e9e98a4b7b47649259370401914ae3030a793f957651cc2b524b96471d6c0d2a9bc4f9b6ff00e126a76b929873d76743fad625e782752b2cef84e33d706beaa4d0e595a47660e594807f527f4ac5bdd2e355649add9319c32f3bba9e2bd5a79d55bd9ea7955329a6f55a1f2c49a7cd6ee5664311edbb8cfd28fecf9319da71eb5f4b4de17b0beb78d9e28654c82caeb8c8ee0835cbeb9f09ed23706c1a4b57c907636e43e9c57a74f38a52d27a1e7cf2b9c7e1d4f0e6b391472a6ad686e61d4a12470580e7a66bd0e6f04ea16e5924856e76f21e243923dc0e7f435ca6a9a49b7999762237fbe41fc4601af4e9e2a15344ee7054c2ce9ead1f58fc1d1f67921b8818c522b2b23af04608e7eb5f687876e17c4da0da4d72e0b4ec5564518686507054faf3c83e840f4af83ff66fd5a7d4b4f7b4ba62d736eeb867182c84e15bfcff005afb03e1deac6ce51692b29b5b86db87fbaae7039f63800fa601ed5e0e2ece67ad874d4353d15bc8b76f2f5285fed4bc1923765120ecdc039fe7c515d169f7d2bdb806cae2eca1d85e3dbb863f85f3fc43f23c1ef4570f2236e767cf3f6874639658bfde7edf415a963a8a46553123bff7635da3f3e2b060b395154b1111cf383d7f2e6b5ecfc98d81cb4a472173c57a94a56665515d59078aa47bfd26f2d5fc948e789e27f3097f9594823b7635f9ff00f153e1fdf68daf5deab65a6f91e1fd36c963fb62c4228da46523e55ea4976c7e15f7e6ad7c52ddbe416ec47deddfd3ad7ca9fb506a2d6bf0f2e21ceefb55ec51f980601c6e623f4ad29d49aaf1b75d0c6a538ba32bf4d4f96f50f961d3e2e3096ca7fefa666feb5abe19bdf0a69f69712ebda56a3ac5f6f1f66b7b7bc5b6b7db83b8c8db19c9ce30176f7e6b2b56f96f8a0cfeed123e7d900afac7f679f86be1687e18e95e21d4744b4bfd72f249645b8bc5f3022090aa0553951c2939c679af66b568d0a7cf23c7a34655a7ca8f04d0edbc51e2e9d4783bc21069f08e166b3b52db474e6e262c41ff00810af4bf0efec93e23f119177e2cf11a5a2b1e6384b5d4b8f4dc4851f8135ef1a878aed34e531653cced1a0e9eca05635dfc4b9a38c948961561c34af8fd2bc89661397c0ac7ab1c0c23acddc87c29fb39f803c1eab23e9cbaadca7fcb7d51bcefa1d98083fef9aed1bc4da27877f75b63f2d7ee41161157db68e3f2af25bcd7b5cf124aeb68f318f3f33c7f220ff811fe95269be1d922c992788ccdc9d80c8f9ff79b81f9572cab4a5ace475c68c62bdc45ef8adf1306a1e0ed76c6d6dbcb82e2d8a36072391d6bc16de70d69013c7f0e7dc115e89f1321d3f4cf0dea9f6bd5516f1e1220b57982bc8db871b3393f962bcef438567d2239b054b49bb6939fbca3f4a2a5fd9a94bb9bd1f89c5337fe1df832f3c53e2ed1aee3b75b8b1d3ee3cdba52e50f2985518e7920d7d0d736da5f83ecc49aa5fe9fe1bb4ec9bd200df893b9bf0af96ed75cf18dac0fa5f838ea0b3de4c44eba6c45a4215405f9802547cc79045743e1ff00d943c6fe2ebafb7789f538346127ccf25e4e6eae4fb90a48ff00be98576c6929538caa4ecbf138aa5570ab254e177f81c85fdf69de24fda3adee74e9fed7a65df886dfca9b91e62199067e600f3ef5fa2896b6ba6dc32c10f92013d141735f9c3a6f87e1f08fed05a768b6d72d77069de2086dd2e1d4032049d46e2074ce2befc96e2ff5291842ca8cc48011393fe3578db2e44bb7f918e0936e6df737ee35d8a00c64cc6cbc067e580f6ac9b8f1219a51b7cc958e32f33f03f015cfdc4769a4ee92fae56376393bfe624fa7a9359379ac5f5e061a5d93c6587fc7c4e368fae3a01fafb5795ce7abca76526b8e786baf25621b9a690858d47d3b7e35f2b7ece7a3cbaf7ed35e23d585acb7da3c73ea064bc897f7259d9bcb1bfa7cc48c01fcabda21f8763c40567f176a726a1680ee1608c6380fa6ec60bfe3c7b57a0e87ad59e9ba6ad9e89a6c105a4190ab0c61235fc86335d34f10d41c12dce7a9479a519763b5b68ecad762dd2c56b00e44318e4fe03ad59d63e235b68f6256c93ece98e1b6ee91bd956bcfef2fa6b35f3e59036464b336147b01d7f3e2a2b382eb56bedf6e8d86fbd34838c77009ff003c571c9db43ad2e62aeb567acfc40be64bfb89934e7c1fb25bcbf34cbdbcc7ec3fd902bd17c0be00d2fc336445adb2412301f2aaed41d7271d58fbb13ed57bc27e07362a657dc77927cd93f0e9dcfe5deb726b7fb0b3fd9c19ce46d38dc727d07f89e29c572ebd41bb9d168762b0441cc587fbbd33bbd3e95bb18758bcd05577700039fccff4ae774dbd11c1fbcc01ebbb7b7d33fd062b54cc1957e65846ddc39ea3b60567ed2d2df50716cbf1b79308b7562c14e4c8c7b9ff002689efd2c59638b74b2b7702b14eaf1c6c61b566763c9723207e3eb5158ef19903b15dd8f31b2c5cfa01debb68c95f9a7b9cf38bd91d6e98b2ddb2923603c9d8783fe7d6babd2660926d46c45dd87527dbfc6b9ed0f4d95635965521319d99cf1ead8fe55d25bac51481a3f95f1ced19047b8afaac2caf63e7313bd8ee7c3df79557082bb9d3d42a2e0f6f5af39d06f82ed332141fde5f987f88aeeecef628ed5a5f39444abb8be4600ee735d551763ce868695c5d47691b4b2b6d40393d7e807bd47690bdc30ba9d36c8461233ff2cc7f89eff9557b356d5264bc95592253986171cffbec3d7d0761ee78d3da47435c86e2d19a3a6075a6cb22c51b3b10aaa37163c00077a00a1ab4d2308ad2ddf64f704a961d513f89fea3a0f722b99f195a8fecf11c49fb9401362f603815d169f2349e65ecd132bcd8d9c64a47fc20fa1ee7dcfb567f89365c5ab0dcac3fbfd715b53f88ce7b1f2ffc40b34b7170ac9f781fbbc1ff00ebf6fcabc8751d3270368b996058d7055f040f5c0fd3f0afa0be236882f430316768fe1191f5af9df55b39e3b892349376e60153764fa9cfa633f4af1730a7ecea735b73e930153da53b5ce6756d166bbd30411c713b4859e42a39719c2b76c918af30d72c5f4d9d9fcbfbb945da7aff0008fea6bdcadd6df59d31982f94eedf2a853d1495dd93ea00e2bce3c6da6a1999638a31e4e14204f9ba7a1af88c6d1739dd1f5586a9cab53ccadf475bcbe7f964daa76bf9a99da4f635b09a5c6b6b1c6b2abb37cc17615fe1618ea6b6acece1d36c37333879b965653919e833db8a6dc5baed45652a1810242a4e0e4d790db8c9a3bef7473d6f633dbcdfb9dbd702266c753d07af5ae4efb568adb555b79e3102391b77e00573db9ed5dd5c42d0e9f01c92db412df8751f88ae5fc4766bac4d7115c279ea76c89b97054f0c083f53fad5c6567aec435cc51b1d3e292f6e219530cc159573fc24107f5aafaa5ab259acdb0b15c213b71f32f1dbdb15b5a5c8ab756a24dca363213b78ce3a7e62ae6ab6e8d05cc4cad850245da7a8e33fa11f955295d9128a4717716bbf648a72fd41f5f626b36ff438b54b5136d0c473ea47b57470aa23040092c40e9c0c8e0fb510daafda02797b46e257b739e82b455251774652a69ee6278284de16d521bb813fd49f991463cd43d57f1fd180afac3c2f7506a5636f756ee26b7b840e8dfde07d7dfb1f706be71934f58f12a8db9047cbdf3d8fe35e89f05fc542d2f3fb1a73b60b862d6fbc6364dfc49cf4dc391ee0fad754310f9eef666152829434dd1f44dbebce90a2dcd925f3a8c099e66462a3a0381c91ebf4a2a9c39f2c6391da8af5398f3b94e1a28e49181f299cfab1c0fe95a50dac90c6434a141ea221fd695aeedad7e52eb9ce76f5359f77ae34cc91c30ed562407939c7e15d11aafa1cee98ba92c112fcd1ee7c646f6ce715f27fed85ab4773a4f8634b88463ccbc9652a87d1557ff6635f47eabe75c3379d2975c630bc283ffeaaf933f6a2b885bc6de17b3888616f6cd3b851eb21e7f24aeac2a72c445bf3fc8e7c4da341aeff00e6783ea52799a85dbf632b11f99c57d87e13d0f52b5f03e83600c8161b18942a923692bb88fccd7c6d1b2bcc8d2e4a1605b1d719e6bda7c55fb4e6a77ead0e93611d8c0a36a3ccdbd80030381803f5af571946a56518411e6612b4294a539b3d9ffe11d5b7666bcd4562ee63886e73efff00ebac3d53c7de08f09c789e6866ba51d656f3e4fc11781fa57ced0df78d7e255d35bd9ff69eacc7ac36aac5173ea140503eb5ddf85ff653f14eb1b1f57b8b6d1203826366f3a503e8bf28ff00beab87eab4a8eb5ea5bcbfad4edfadd4aba5185cbbe26fda52193f77a4e96f385fbb25e3ec41f444fea6b8893c79e3ff0088370d67a7c979306e0db69309403ea539c7d4d7d0de19fd9bfc0de17657d462975bba1d0de3fc9ff7ed7031f5cd7a0daadad8c2b65a75ac361689c08e18d55463a7caa3ad2fad61e97f0617f361f57c455fe2cede48f92dbf67bf1569be1cbef11eb46db4d86d23f38c32cdbe794960b8017201e7b9a92d5becf610463eea9000fa28afa33e2adbcedf0d75c90c6fe5f90b9924e38f313803b75af9a4cdb53a631c0cfae2b3a95a7888de475d0a31c3b7ca7b67ece7713c3a5f885600c435cc3bbd3fd5b715ec0d1cd3cd8bb9cc69da38f927eb5e21f00fc411e8be1af10b48b210d79113b1846bc467ab76ebd85741a97c44bdf125c359f86ec46a1720e0c9192b6b0fbb39ea7e86b393b686b6ea8f08965863fda7049b59a14f128255792409fa7d6bed31aa6a377139f2e3d1ecdb90653fbd38efec7eb5f3f7857e0dd9f85fc50be2ad73535d535e5b9fb645676abb2de398b1652ec797c1e703038ea6bd1d5b52f10917124ef7974ae7f77ce195bd00e841fd29e33110a8e2a0ef646184c3ce9a939ab5d9bf34d696b2992dd7ed4e3ef5f5d92c41e4fc8a7f0e4d3ad6faef56648ec6c9ee66dbb0b4afd8fa0ed5b1e18f86f2cc16eb559140e3f77907e51d464f031f8d7a0ff675a68f696ff668225b79a3de871b80ff0068b0e49f6e2b8395cb5933d06d2d11c75af8465dbf68d5373f1bb6b3109f4f7ad196f12da341649f67cf0bb06140f651dbdcf34b797535f47b2dfcc63919924048233d3d87bd69e93a7476770bf68259e4e378e6463d70a3b7a54ba8d7c2350ee66e8fe159b54b867bd6f318e0a31e8bf877af4bd074b8b4e21625f3270bb59ca8d8a3d947f5aab35bb491c41e3f2827cdb6271f913d3fcf6ad4b7ba96d408a15557c64ba9ce3d80fea7f0a8e64b565f2dd591a6d7170d222f9bb63072541f99881d3dbf4151dc5cbca0267258ed217a74f53d7ebd2b296e16d55a4ca95396cb1ee7bfbd50bdd777cca2d01b83d0b061b57d8f6fc2b3954725a171a69336a2b992de30db95114fde6191f51ea7fcf34d56b9d71842f23c1167ef1e1dc0ea714dd174dbbbb659af37b1ceedc7a01ec3fa9ae89563824df0f1b701a665c81f4f5a88cb5b22a494771f0e93142d144e1a5603fd506e4fb9f6ada8025abf9923033b7dd51d171e9ed58ed72d14d9b4759cbf59bdfdfd4d59b59541c1c3ce79663d00ee4fff005abdac3c12777b9e5d69732d0deb5bc9171cb65ba658fe95d4e8f1b9f999b783ce33d6b91b28ca950abb8fafb575fa7caeb84407ddabea30f35b1f3f5e0cec34e9963407a0adbd32d9352996e0e05ac641550789987463eaa0f4f53cfa571d6f731cede406df083fbc61d1bfd91edebf97ad75d67727ecfb410391f4af4edcc8f1e5a33b2b5bf691413cd5f5938191cd7316778d8eaa4638c1ad786e8b72580181c572ca1666ca49ea5d774f317270c7a7f85666a1236a17d1e9ea7f72a04d747fd9cfca9ff0223f253eb4fbed422b4b2967941288b9dabc963d028f727007d699a458cd676fbe6656b99d8cd70d9cfce7f847b280147b0a8b177ea69349c8f4f5acad5aca2b80e48f988c12a707f3ad0dc3cb240f7cd676a13048485ea41635515ae82679278c3486fdeb07dfb7a6e186fa647f857ce9e31f0f35bcf34b2a4afb4ee8c2e19b79e140fc4d7d47e23632c417e56c9c9af1ff001b68a2ebca88ff00d746da7d32073f5ad3154b9e9dfa9b60aaf24ecf63c62d613a2e990c08b3a20cb3adcf2538c1edc8e3a67e95c36bd7df6e91a2b948c80c76ba9f9b38e9cf23b57a6eb1a7cc2e25f3a512c70c654607cd93ebeb5e7ada7bc37124719257737cacbd4818e6bf3eaf4e71936cfbca338ca2ac63f89748f324827b795a39095dd1b10415c67047afe5589751ca19523607730ca6ee464f4f7e0d7a1b59996e21654904b8d8aafcab1c0efd8e33d6a86ada7c915caa4a8a77c8aaa4a0fef7ff00aebc7af49349d8ec84f5b1e5d04f706dcc6ead8d871b872060f4a7ea909b5b77936ed68915471904600231fe7ad6e6b96b3470b2a42aee5594e46307d060e2b3f58916398453c4d9998158ff00bc738ebe9c66bce945dec7626645bc36f23c2c5769f3d5b07be47f4ad0d4ad61499dd14ecda5580f4c1ff0aa38fde4aa8a14850517046304107f535b9a946b7500b80a1180121c1fbc32383fad28e9244cf53cfb5ad35b4d994ed0e7a07f5ce7a7e151caa6eb6383b1b1b77371f30e84fd6ba0f12696973244a7747b976ac81b3875e3a74e98fceb24689732da9114b0dcec5dadb5b073c15c0fa0ad3992d1936e6d47c962b3c21995fcb9060ed2783edfe7b5316336709950bb224a1f729f9e0e982075201e7daaedacde5129701a3ddc956c8e79c8feb579ad63f3a399b948c82db7ef01939e3b8c6723fc050a49de0f607eeb4d1edbe09f1e58eb9a0c535fde43677f1b7953a39c067007ccbec4107f1345788269e197f770fda50121595b18e7a7f9ec4515b2c5e220b97953b193c2d09be6e6b5cf56b9d520593e5432e3a00b8fd2a9dc6a1732127cb58476c8c9fc3deb4bfb3c742fb4e7908a052b59c70ed3b7cb3ddbb9af714ec8f16c72d78935ce772c8fe9e61e3f2af2ef8e1a445a6fc3bf106ad222aceb67f66590a2eec3385033d71f31fcebd9752bb823ff00564cafd005e7f5af13fdaa3549e1f8433c6eab1a5d5f5bc206724e373f5e9fc35ad0bd4ad05e68cab3e4a527e4cf963e1b78357c7de35d3b437ba36315c96325c2a6f31aaa16271919e98ebdebe9ad27e04f817c22519ac65d6ae71b84baa36f523d446b85fcf75794feca3a11d53e215fddec564b1d3e46cbf40ceca83f42d5f52f936b6e58b3f9927b9e3e95e9e63899c6a7b284acac706070f0953e792bbb9991432f92b05bc02ded62c6d8614114698f445c027357d9ee9d8c6b1cad2f076eec67238dde9f9d5bfb799a2db1c7b57231b323007f215a56da648211248e103ae4eef9540f763fd05783e67adb686547a6cbf2f9ae96c08e3c904e47d4f5c569db69f6ca4058b2739573dbdc62a8ea5e2ad1745462aaf7d2700053fbbcff0036ae56f3c53af6b61d2c226b2b16f97ef6c4c1ea7dff005ad6320b31df1b3568adfe1aebd035e2348d122f92ad924f9a9d71c0fd6be509af05ca49293b4b63e50bc1c607e1c7e75eebf13741367e01d4aeaea6370ea1080bc2ae241ce3bfe35e0a96a6684b0f962fbc19bd2bd0c3db92efb9cd52fcd647a8fc1bd260f1078735559a731c71de2b329e55804191b7a927381dabd52d24b7b5b45b4d2edf62a9d8c1549727b67d4fb74e2b94fd9c7e1cea9ace837739865b4b39ae498e7990af9a9b065907719e322be96f0ff8474bf0fa2470db2dcdc602ef63cfbf4e00f5aceb417b46cd69ced048f37f0f7c3bbad62e239ef37c48df7b3f3311efdbf0fd2bd234fd0f4ff0ec7b208da54c7cf203fd7bff002abf79709b9403e546a4b3b21c123a71e9f5ac6bad4adb56bd782dcdc79291a2dbc718da19c13b8b7a70063f1eb58cb962b4348f34b725d47c4cb166128d9ed0a73bc75f9bfba3eb8f7152595f4ba8c30edd931014b46abfba8c7d7dff005aa369a123106e17196f9a1dd8078272c4ff00fafe95d1db5baab2c02dfcd006ef2d1488bea7dbeb5c72a89b378c0d0b18c985923dbe4b706e65206eeb9dbedfe78a5b58ad34799654930cca544921dcdd3f847e03f3a41781af5a3526576401b6e4c498e0900f52781e9c7155a4b84b35dd1ab48d19dad33b00a99eecc7851ef59fb6b691355497534a6d67e53bca4614e7cb4206338c16fd7de9efad2b282ab971f748e141c753ea78ef5c8b5ff9d7de6bdbc7222f0ad6ecdb19bfd9dc496cfa9fcab46c2deef51923810192424b6edd9543819518eb4a565ab6524f634d6ea7d61b6169230fd7a0381dc64fa64e6b774af0fc562a934efb61dbf2a2e496fa7a9f734691610e9f1ec4c4b29c2e3a8cf73ee7f4ad2fb63b338cacb72ac536b11f2903a63dbd3f3f4ac233751da06ad722bb2d2ea0d2c651e236f013f226e196fa9eff00e7ad5cfb446ce1f79754181e5f00ff009fe9591fbb919a5998c8c39e492303daadc50bdddb46ac0c3128c850bd7df35e9538aa7b9c1297313c934f2491888031e48c2b7ddfafad6c5ac12363cadacdc16ddd73e9ed59fa6e9935c14441e545ff003db8c7d077cff88ae882a5adaa25b3621f5fe273e99feb5e9c2a27a2471548f2eecb766e55d6351fbccf3bb8c7d4f615a526a421516b049ba62312483f87e9effcab9ad4af0e9b6e88857ed2c772aa8c8001ce4fb55dd155b3e6b1cbb1dc77f55cf53f5af730cd456a78f5d36ec779a3ca2158d00042a81f2d74305f365402339ee2b90b6d415235dae231d338ce3dcd6c69773ff2d0b6541e2be8212bab9e1558ea77fa7dded846fe49ea3d2aeadf2348109190012738ae46d6f8b30c03cfa76abd73a935adb288d44976efe5c0afd371cf27d80058fb29a2515bb3052674514c356d595719b4b16c9c7479f1c7e080e7eac3d2b6e4991b1bab9ad37cbd36ca1b7462db472c4fcccc4e4b1f724927eb571aec64fd38e6b9f91ee74731a534a59739c229e8a7a8ac7babcf383aab7cc0ed20f51527db027dfe14f02aa4d74229338383c035718b4ee6729696462ead109188c0c819391f95798eb36ed77a8dc48bb550bf928c4f509c1e3eb9af4cd67505b7b4b9ba656fddc6d267af40481f8ff5af3d5b1686d5319919570c3a8c9ebf5e49adfa58d29e8ee797f89348685666e19b239c1cd79e4968d239976808ade839ce7838edfe35ec7e2585148520907396c1e3278fe7fa571935ba43a82a240ac7ac8a7eeb0da718f423afe3cd7cbe2e829367d461ab38d8e5d56784db3c71ee4519f2f3923aff002e3f3aadae58a4df674788c2dbd38cf4391dff003adcb88059de4642936c46f0ca7907838c7b834fb85b6ba298c24e5c39de72ae7af03d7a735f335e9a8e87b54ea5f53caaee6b1f115d4e6422ddbcc2bb5f8c63af3df38ac6f1668b7324c9f67da5f07e77c10bd0fe27915d3ff63c4bf68de91bab4ee3686e54163c8cff00ba6b1aeac26b69e48a32e0200cb9e7271d31dabce9e1fde3b6353dd3925b7637023742251c7cd9f7e3e95b5676212352e55e090b67bed07b7ea6aaea1702ea14996448ee23e3a1c64718cff4abfe1aba799a7b69ed89cfcc9b7905bd01af3a74dad51d3cdcda18b35bac8b2dbb2a99d3250b738c7078fc0555b8f0f86b759d230370dbba290ab0eeb918edc8aecb56d0cfda5a66578cbafde29df1827f1e735c8e9eda95e24908b659a485da191779578dc75e83f119ae79fbdef235869a159e165ff5bba454e54b2838f5156a1d36396332a390ae32303fa7e14b78b22a8334125bc9839dca71efcfeb56b4b9639a330c6ca371fbbe8707a7b552bd8868c46d365b676114e8a8c776dddb707bd15d1c91bab6d68262471f2018fe628adbda48cf951decda8343ba3b78401271bb1cfd2b1aed659a428f2316ebe5a75f6cfa51457b6e56d8f18ad25b88547971c602f2d24bfe1eb5f39fed89aa86f09f876cfcc2cd35f493119c8011001ffa1d14575e035c4c3fae87362ffdde473dfb28e9b27f67f892f926483cd960b60cc79f943310077eabfa57d05716163a5e9a6f66bff34172ad21cecdd8cedce31bbbe3ae28a2b6c5c79b153bff005a2270cf970f1b7f5ab30ee3c6d32e63d32d19db1c4853a7bfb7e355daeb5abe8bcdbfba6c39c9f31b247e668a2b822937a9df2d905958c312bdc2c65d23e4dc5c0f978e4ed5ef4b7de2636e48b5c3855ff5b20e391e9d4f4e00c014515e7d4a92e6b1d308ab19365e02d7bc7aa50c52b19a331c8f370801ea147455c1ec335e9be05fd98fc2de198ed6e350823d5af604554128fdc06503e60993b9bebc7b0a28ae9a152566ae73544af73d5459c30c65ae1c5bc4460c2832edf87f08ac9bed53ecf1c62d20f2d5c120ab75f4cd1456d39b1c22ac734d0cdab9916e0f92170a029c65b3d80eb5a915b8b15122c08108c6e270c7a0ce7af4fcf345158393968cd92b13ac5a95d5e5b34773f63b585b7244880c8c474273f747b9f5ad696779215324a5d0b7cb1ae4263bb75cb7d7bfad14571d4a8f9b94da3144125e0d2ed48652f2bf3e5f438c7193d80cff003acefb22dc4cb7137953c582426dcc6a7b91d89038c9cf53ce68a2aa2cd196ac74c692e8ed198d463cc20e3007dd1fe73f4aeaec95218560823d8d8c316014803a927a01edfce8a2b9e6db9a8f42d7c3717ed9f394b404856019c8c193d94ff0af6f5353ac62e0ee5fde363323f4441fdd5f6e28a2bbe9a515647349b66858d948ae246d8541ddb5b8273fe7f5ae861b666392ec90e3e704e0e3fc68a2baa2db39665cdc5942c415208c03cf049c7f9e2a1bcd5deddc4adf3372aa98efe83fc68a2bd2a2b95e87049f36e51b18a4bcbcf3ee5bcc909c9c74cf6007a0ae92dae84793c8ec5b1d4ff87ff5e8a2bd7a1ab386b6c0bae06baf2836e03efb6383edf8575563a9314da3938c061ebdff000a28afa98e913e72aeecded2ae9e15009c1fe75734cd40dcea125de331460c307e7f3bfe24607b2fbd1455ee8e6968cdd83502c0311c67a5586be2b82385f5a28a927a07dbfa672df8d453de89b8c903eb45140d1cf78a9d6e6c52cb2a56ea458dc7fb23e639fc87e75ccdf799a4a8fb3dc6f8c1ff005331e833d037de1f439a28a0e9a7b230e4bab5be9a1c6e8a5623724a33963d704707a7ff005ab9cd4b492b7d33a0cbba336dce7e6c1c514578588ea7b547a1cede5818e460393184c377e0026ab4896b78e86689965539f30646381f9d1457cce2759d99ef61fe13896d3a68750d414913c02691b6b039e32c003f9fb7355b56d27e5568a5604152a4b64302bcf53d7807f1a28ae1acf965a1dd4f589c4eb56226c82a8accf938c8cb74c8f7acbb659f458cacb3f9d6a24c6e51bbe5209078ed4515cd28ae43752772edf5f5e5a9852194b5bcadf3abfccaadbb078ce4704106959a5b3d620bc1ccac9fbc64e4b321c73ebc63f334515e5cd2b5ac74c772fde5c1bb7915d898255ce180619f5c7e95cf2d93c73ed745dbd432b609c7ff00aa8a2b9e3a686a68c6d710c6bf678e39226191e64851876c11f875a28a2ac83fffd9, 'aaa', '1212', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship`
--

DROP TABLE IF EXISTS `sms_scholarship`;
CREATE TABLE IF NOT EXISTS `sms_scholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) DEFAULT NULL,
  `subTitle` varchar(1000) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `publishDate` date DEFAULT NULL,
  `organization` varchar(50) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `ageLimit` varchar(5) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `lastDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `isDeleted` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship`
--

INSERT INTO `sms_scholarship` (`id`, `title`, `subTitle`, `category`, `publishDate`, `organization`, `gender`, `ageLimit`, `email`, `contact`, `amount`, `lastDate`, `status`, `isDeleted`) VALUES
(11, 'Board Scholarship', 'We are offering a scholarship for the poor and meritorious students . So if you are interested then please apply before the last date.', 'merit', '2018-10-22', 'Khulna Board', 'Anyone', '22', 'khulna@gmail.com', '0166623633', '10000', '2018-10-31', NULL, NULL),
(6, 'Joynul Abedin Sriti', 'It plays a vital role in the student of the fine arts to give them scholarship.', 'merit', '2018-09-25', 'Joynul Abedin Trust Fo.', 'Anyone', '25', 'joynul123@gmail.com', '01800000008', '50000', '2018-10-25', NULL, NULL),
(7, 'Sheikh Kamal Sriti Scholarship', 'Sheikh kamal organization provide some financial help for poor students.', 'merit', '2018-09-25', 'sheikh kamal foundation', 'Male', '22', 'kamal12@gmail.com', '01721345678', '100000', '2018-09-30', NULL, NULL),
(9, 'Mahin Scholarship', 'i am a donor of Bangladesh. please contact me with your cv and apply.', 'merit', '2018-09-21', 'Mahin And Brothers', 'Anyone', '30', 'mahin@gmail.com', '0198887777', '50000', '2018-10-10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_applyscholarship`
--

DROP TABLE IF EXISTS `sms_scholarship_applyscholarship`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_applyscholarship` (
  `studentId` int(11) NOT NULL,
  `scholarshipId` int(11) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'pending',
  `priority` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`studentId`,`scholarshipId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_applyscholarship`
--

INSERT INTO `sms_scholarship_applyscholarship` (`studentId`, `scholarshipId`, `status`, `priority`) VALUES
(160216, 6, 'pending', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_catagory`
--

DROP TABLE IF EXISTS `sms_scholarship_catagory`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_catagory` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `catagoryName` varchar(45) NOT NULL,
  `shortName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_catagory`
--

INSERT INTO `sms_scholarship_catagory` (`id`, `catagoryName`, `shortName`) VALUES
(1, 'Merit-based Scholarship', 'merit'),
(2, 'Grant in Aid', 'aid'),
(7, 'Cultural Scholarship', 'culture'),
(9, 'Board Scholarship', 'board');

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_cocurricular`
--

DROP TABLE IF EXISTS `sms_scholarship_cocurricular`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_cocurricular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coName` varchar(100) DEFAULT NULL,
  `shortName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_cocurricular`
--

INSERT INTO `sms_scholarship_cocurricular` (`id`, `coName`, `shortName`) VALUES
(1, 'Sports', 'SP'),
(3, 'Debate', 'DB'),
(4, 'Dance', 'DA'),
(5, 'Music', 'MU'),
(6, 'In Door Games', 'GA'),
(7, 'Acting', 'AC');

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_quota`
--

DROP TABLE IF EXISTS `sms_scholarship_quota`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotaName` varchar(45) DEFAULT NULL,
  `shortName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_quota`
--

INSERT INTO `sms_scholarship_quota` (`id`, `quotaName`, `shortName`) VALUES
(1, 'Bangladesh Krira Shikkha Protishtan Quota', 'BKSPQ'),
(2, 'Freedom Fighter Quota', 'FFQ'),
(3, 'District Quota', 'DQ'),
(4, 'Autism Quota', 'AQ'),
(5, 'Tribal Quota', 'TQ'),
(8, 'Others Quota', 'OQ');

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_student`
--

DROP TABLE IF EXISTS `sms_scholarship_student`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_student` (
  `universityId` int(11) NOT NULL,
  `age` varchar(5) NOT NULL,
  `fProf` varchar(45) DEFAULT NULL,
  `mProf` varchar(45) DEFAULT NULL,
  `income` varchar(45) DEFAULT NULL,
  `sibling` varchar(45) DEFAULT NULL,
  `reason` varchar(2000) DEFAULT NULL,
  `cocurricular` varchar(45) DEFAULT NULL,
  `quota` varchar(45) DEFAULT NULL,
  `term` varchar(5) NOT NULL,
  `cgpa` varchar(45) DEFAULT NULL,
  `picSource` varchar(350) DEFAULT NULL,
  `document` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`universityId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_student`
--

INSERT INTO `sms_scholarship_student` (`universityId`, `age`, `fProf`, `mProf`, `income`, `sibling`, `reason`, `cocurricular`, `quota`, `term`, `cgpa`, `picSource`, `document`) VALUES
(160216, '23', 'Businessmen', 'Housewife', '22222', '2', 'need for money', 'DB', '', '4-1', '2.6', 'account.jpg', 'Result.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

DROP TABLE IF EXISTS `tbl_cart`;
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `ID` varchar(40) NOT NULL,
  `ProductID` varchar(40) NOT NULL,
  `UserID` varchar(40) NOT NULL,
  `Datetime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `cat_id` int(100) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_organizer`
--

DROP TABLE IF EXISTS `tbl_organizer`;
CREATE TABLE IF NOT EXISTS `tbl_organizer` (
  `org_id` int(100) NOT NULL AUTO_INCREMENT,
  `organizerName` varchar(100) NOT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE IF NOT EXISTS `tbl_products` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `CategoryID` varchar(40) NOT NULL,
  `Price` double NOT NULL,
  `OfferedCredit` double NOT NULL,
  `PictureAddress` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`ID`, `Name`, `CategoryID`, `Price`, `OfferedCredit`, `PictureAddress`) VALUES
('{1A53D0E6-A580-4EA9-A2F9-B35CF92DDD01}', 'Forest Growth Simulation', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 600, 65, '9781604697285r.jpg'),
('{34A3C9A7-4B6C-4398-8845-76399D6878E0}', 'Compiler', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 300, 60, 'compilers.jpg'),
('{4308E3A8-E74F-49DC-A2BA-D26CEF37C37C}', 'Computer Graphics', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 400, 30, 'graphics.jpeg'),
('{8C35D14E-BA72-4FEC-8703-1C7BF08760A1}', 'Java', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 400, 40, 'bangla_c.jpg'),
('{9A912360-8C34-46EB-BFC2-698F237CC5D3}', 'Computer Networks', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 200, 20, 'networking.png'),
('{C7DA13A3-5A5C-4361-BCA5-12EA1C632E0A}', 'Web Learning', '{44CAEE8D-A9D7-48C8-A2EA-A7463E00FCD6}', 400, 40, '9781785280351.png'),
('{CBF2600B-4FD3-41C8-A243-BFEE6C0DB1C3}', 'Bangla C', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 400, 40, 'bangla_c.jpg'),
('{CC9C78DE-7022-4053-8951-B92BDF35D33D}', 'Deep Learning', '{44CAEE8D-A9D7-48C8-A2EA-A7463E00FCD6}', 550, 55, 'deep_learning.jpg'),
('{F14C8CA7-7F3F-45A0-95E5-2359805F2B96}', 'Computer Fundamentals', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 260, 26, 'computer_fundamentals.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

DROP TABLE IF EXISTS `tbl_product_category`;
CREATE TABLE IF NOT EXISTS `tbl_product_category` (
  `ID` varchar(40) NOT NULL,
  `Category` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_category`
--

INSERT INTO `tbl_product_category` (`ID`, `Category`) VALUES
('{3D212234-2F34-4AB0-83EF-1A772068403B}', 'Book'),
('{44CAEE8D-A9D7-48C8-A2EA-A7463E00FCD6}', 'Thesis Book');

-- --------------------------------------------------------

--
-- Table structure for table `tms_assign`
--

DROP TABLE IF EXISTS `tms_assign`;
CREATE TABLE IF NOT EXISTS `tms_assign` (
  `id` varchar(40) NOT NULL,
  `assign_to` varchar(40) NOT NULL,
  `assign_by` varchar(40) NOT NULL,
  `assing_date` date NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_assign`
--

INSERT INTO `tms_assign` (`id`, `assign_to`, `assign_by`, `assing_date`, `comment`, `status`) VALUES
('24', 'naeema@gmail.com', 'ryhan@gmail.com', '2018-09-25', 'TEST2                               \r\n                ', 0),
('24', 'naeema@gmail.com', 'ryhan@gmail.com', '2018-10-01', '                 test                ', 1),
('24', 'ryhan@gmail.com', 'ryhan@gmail.com', '2018-10-01', 'Test                          \r\n                ', 0),
('25', 'naeema@gmail.com', 'ryhan@gmail.com', '2018-10-08', 'Do the task very carefully                 \r\n                ', 1),
('27', 'naeema@gmail.com', 'ryhan@gmail.com', '2018-09-25', 'test\r\n                                  \r\n                ', 0),
('27', 'ryhan@gmail.com', 'naeema@gmail.com', '2018-09-25', '\r\n       tesy2                          \r\n                ', 1),
('28', 'ryhan@gmail.com', 'naeema@gmail.com', '2018-09-30', '\r\n          test                       \r\n                ', 1),
('32', 'ryhan@gmail.com', 'naeema@gmail.com', '2018-10-08', 'TEST               \r\n                ', 1),
('33', 'ryhan@gmail.com', 'naeema@gmail.com', '2018-10-08', 'TEST2                \r\n                ', 1),
('34', 'ryhan@gmail.com', 'ryhan@gmail.com', '2018-10-09', 'Study more and more               \r\n                ', 1),
('35', 'ryhan@gmail.com', 'avi@gmail.com', '2018-10-09', '  Do study                \r\n                ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tms_link_thesis`
--

DROP TABLE IF EXISTS `tms_link_thesis`;
CREATE TABLE IF NOT EXISTS `tms_link_thesis` (
  `id` varchar(40) NOT NULL,
  `link` text NOT NULL,
  `thesis_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thesis_id` (`thesis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_student_thesis`
--

DROP TABLE IF EXISTS `tms_student_thesis`;
CREATE TABLE IF NOT EXISTS `tms_student_thesis` (
  `id` varchar(40) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `thesis_id` varchar(40) NOT NULL,
  `contribution` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `thesis_id` (`thesis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_supervisor_thesis`
--

DROP TABLE IF EXISTS `tms_supervisor_thesis`;
CREATE TABLE IF NOT EXISTS `tms_supervisor_thesis` (
  `id` varchar(40) NOT NULL,
  `supervisor_id` varchar(40) NOT NULL,
  `thesis_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supervisor_id` (`supervisor_id`),
  KEY `thesis_id` (`thesis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tms_task`
--

DROP TABLE IF EXISTS `tms_task`;
CREATE TABLE IF NOT EXISTS `tms_task` (
  `id` varchar(40) NOT NULL,
  `task_name` varchar(20) NOT NULL,
  `task_creator` varchar(40) NOT NULL,
  `task_category` varchar(20) NOT NULL,
  `date_of_assign` date NOT NULL,
  `date_of_submission` date NOT NULL,
  `last_date_of_update` date NOT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `details` varchar(1000) NOT NULL,
  `attachment` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_task`
--

INSERT INTO `tms_task` (`id`, `task_name`, `task_creator`, `task_category`, `date_of_assign`, `date_of_submission`, `last_date_of_update`, `progress`, `details`, `attachment`) VALUES
('1539613941', 'Class Test', 'ryhan@gmail.com', 'Study', '2018-10-15', '2018-10-26', '2018-10-15', 0, ';ljlj', '1539613941'),
('1539614267', 'Class Test', 'ryhan@gmail.com', 'Office', '2018-10-15', '2018-10-20', '2018-10-15', 0, 'tem,s', '1539614267.pdf'),
('24', 'test11', 'ryhan@gmail.com', 'Study', '2018-09-17', '2018-10-26', '2018-10-08', 11, 'DIP', '0'),
('25', 'Class Test', 'ryhan@gmail.com', 'Study', '2018-09-17', '2018-10-29', '2018-10-08', 6, 'DIP Class test', '0'),
('26', 'test11', 'ryhan@gmail.com', 'Study', '2018-08-09', '2018-10-26', '2018-10-08', 7, 'update date test', '0'),
('27', 'Solve the 5x5x5 cube', 'ryhan@gmail.com', 'Study', '2018-09-25', '2018-10-27', '2018-10-09', 3, 'You Have to solve the cube in 30 Minutes', '0'),
('32', 'test11111133', 'naeema@gmail.com', 'Appointment', '2018-10-08', '2018-10-31', '2018-10-09', 0, 'TEST', '0'),
('33', 'test2', 'naeema@gmail.com', 'Study', '2018-10-08', '2018-10-31', '2018-10-08', 0, 'TEST2', '0'),
('35', 'Class Test', 'avi@gmail.com', 'Study', '2018-10-09', '2018-10-30', '2018-10-09', 0, 'Class TEST', '0'),
('36', 'test11', '160230', 'hh', '2018-10-11', '2018-10-18', '2018-10-18', 0, 'lll', '0'),
('53', 'test11', '160230', 'hh', '2018-10-10', '2018-10-10', '2018-10-12', 0, ';lk;lkj', NULL),
('75', 'test', 'ryhan@gmail.com', 'Programming Contest', '2018-10-15', '2018-10-26', '2018-10-15', 0, 'kkkkk', '1539613080'),
('1560742408', 'test', 'mkazi078@uottawa.ca', 'Study', '2019-06-17', '2019-06-12', '2019-06-17', 0, 'll', '1560742408.pak');

-- --------------------------------------------------------

--
-- Table structure for table `tms_task_category`
--

DROP TABLE IF EXISTS `tms_task_category`;
CREATE TABLE IF NOT EXISTS `tms_task_category` (
  `id` int(11) NOT NULL,
  `task_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_task_category`
--

INSERT INTO `tms_task_category` (`id`, `task_type`) VALUES
(1, 'Study'),
(2, 'Office'),
(3, 'Appointment'),
(4, 'Programming Contest');

-- --------------------------------------------------------

--
-- Table structure for table `tms_thesis`
--

DROP TABLE IF EXISTS `tms_thesis`;
CREATE TABLE IF NOT EXISTS `tms_thesis` (
  `id` varchar(40) NOT NULL,
  `thumbnail` text NOT NULL,
  `title` varchar(256) NOT NULL,
  `pdf_link` text,
  `description` text NOT NULL,
  `year_id` varchar(40) NOT NULL,
  `term_id` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `discipline_id` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `year_id` (`year_id`),
  KEY `term_id` (`term_id`),
  KEY `course_id` (`course_id`),
  KEY `discipline_id` (`discipline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ums_discipline`
--

DROP TABLE IF EXISTS `ums_discipline`;
CREATE TABLE IF NOT EXISTS `ums_discipline` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ShortCode` varchar(20) DEFAULT NULL,
  `SchoolID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_discipline`
--

INSERT INTO `ums_discipline` (`ID`, `Name`, `ShortCode`, `SchoolID`) VALUES
('{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'Akash Housing', 'Akash Housing', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}');

-- --------------------------------------------------------

--
-- Table structure for table `ums_permission`
--

DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE IF NOT EXISTS `ums_permission` (
  `TableID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Category` varchar(100) NOT NULL,
  PRIMARY KEY (`TableID`)
) ENGINE=InnoDB AUTO_INCREMENT=17188 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_permission`
--

INSERT INTO `ums_permission` (`TableID`, `ID`, `Name`, `Category`) VALUES
(17028, 'COURSE_C', 'COURSE_C', 'COURSE'),
(17029, 'COURSE_R', 'COURSE_R', 'COURSE'),
(17030, 'COURSE_U', 'COURSE_U', 'COURSE'),
(17031, 'COURSE_D', 'COURSE_D', 'COURSE'),
(17032, 'COURSE_TYPE_C', 'COURSE_TYPE_C', 'COURSE TYPE'),
(17033, 'COURSE_TYPE_R', 'COURSE_TYPE_R', 'COURSE TYPE'),
(17034, 'COURSE_TYPE_U', 'COURSE_TYPE_U', 'COURSE TYPE'),
(17035, 'COURSE_TYPE_D', 'COURSE_TYPE_D', 'COURSE TYPE'),
(17036, 'COURSE_SESSIONAL_TYPE_C', 'COURSE_SESSIONAL_TYPE_C', 'COURSE SESSIONAL TYPE'),
(17037, 'COURSE_SESSIONAL_TYPE_R', 'COURSE_SESSIONAL_TYPE_R', 'COURSE SESSIONAL TYPE'),
(17038, 'COURSE_SESSIONAL_TYPE_U', 'COURSE_SESSIONAL_TYPE_U', 'COURSE SESSIONAL TYPE'),
(17039, 'COURSE_SESSIONAL_TYPE_D', 'COURSE_SESSIONAL_TYPE_D', 'COURSE SESSIONAL TYPE'),
(17040, 'DISCIPLINE_C', 'DISCIPLINE_C', 'DISCIPLINE'),
(17041, 'DISCIPLINE_R', 'DISCIPLINE_R', 'DISCIPLINE'),
(17042, 'DISCIPLINE_U', 'DISCIPLINE_U', 'DISCIPLINE'),
(17043, 'DISCIPLINE_D', 'DISCIPLINE_D', 'DISCIPLINE'),
(17044, 'FILE_C', 'FILE_C', 'FILE'),
(17045, 'FILE_R', 'FILE_R', 'FILE'),
(17046, 'FILE_U', 'FILE_U', 'FILE'),
(17047, 'FILE_D', 'FILE_D', 'FILE'),
(17048, 'PERMISSION_C', 'PERMISSION_C', 'PERMISSION'),
(17049, 'PERMISSION_R', 'PERMISSION_R', 'PERMISSION'),
(17050, 'PERMISSION_U', 'PERMISSION_U', 'PERMISSION'),
(17051, 'PERMISSION_D', 'PERMISSION_D', 'PERMISSION'),
(17052, 'REGISTRATION_C', 'REGISTRATION_C', 'REGISTRATION'),
(17053, 'REGISTRATION_R', 'REGISTRATION_R', 'REGISTRATION'),
(17054, 'REGISTRATION_U', 'REGISTRATION_U', 'REGISTRATION'),
(17055, 'REGISTRATION_D', 'REGISTRATION_D', 'REGISTRATION'),
(17056, 'RESULT_C', 'RESULT_C', 'RESULT'),
(17057, 'RESULT_R', 'RESULT_R', 'RESULT'),
(17058, 'RESULT_U', 'RESULT_U', 'RESULT'),
(17059, 'RESULT_D', 'RESULT_D', 'RESULT'),
(17060, 'ATTENDANCE_C', 'ATTENDANCE_C', 'ATTENDANCE'),
(17061, 'ATTENDANCE_R', 'ATTENDANCE_R', 'ATTENDANCE'),
(17062, 'ATTENDANCE_U', 'ATTENDANCE_U', 'ATTENDANCE'),
(17063, 'ATTENDANCE_D', 'ATTENDANCE_D', 'ATTENDANCE'),
(17064, 'MARKS_SETUP_C', 'MARKS_SETUP_C', 'MARKS_SETUP'),
(17065, 'MARKS_SETUP_R', 'MARKS_SETUP_R', 'MARKS_SETUP'),
(17066, 'MARKS_SETUP_U', 'MARKS_SETUP_U', 'MARKS_SETUP'),
(17067, 'MARKS_SETUP_D', 'MARKS_SETUP_D', 'MARKS_SETUP'),
(17068, 'GRADE_SETUP_C', 'GRADE_SETUP_C', 'GRADE_SETUP'),
(17069, 'GRADE_SETUP_R', 'GRADE_SETUP_R', 'GRADE_SETUP'),
(17070, 'GRADE_SETUP_U', 'GRADE_SETUP_U', 'GRADE_SETUP'),
(17071, 'GRADE_SETUP_D', 'GRADE_SETUP_D', 'GRADE_SETUP'),
(17072, 'ROLE_C', 'ROLE_C', 'ROLE'),
(17073, 'ROLE_R', 'ROLE_R', 'ROLE'),
(17074, 'ROLE_U', 'ROLE_U', 'ROLE'),
(17075, 'ROLE_D', 'ROLE_D', 'ROLE'),
(17076, 'POSITION_C', 'POSITION_C', 'POSITION'),
(17077, 'POSITION_R', 'POSITION_R', 'POSITION'),
(17078, 'POSITION_U', 'POSITION_U', 'POSITION'),
(17079, 'POSITION_D', 'POSITION_D', 'POSITION'),
(17080, 'PROJECT_C', 'PROJECT_C', 'PROJECT'),
(17081, 'PROJECT_R', 'PROJECT_R', 'PROJECT'),
(17082, 'PROJECT_U', 'PROJECT_U', 'PROJECT'),
(17083, 'PROJECT_D', 'PROJECT_D', 'PROJECT'),
(17084, 'QUESTION_C', 'QUESTION_C', 'QUESTION'),
(17085, 'QUESTION_R', 'QUESTION_R', 'QUESTION'),
(17086, 'QUESTION_U', 'QUESTION_U', 'QUESTION'),
(17087, 'QUESTION_D', 'QUESTION_D', 'QUESTION'),
(17088, 'SCHOOL_C', 'SCHOOL_C', 'SCHOOL'),
(17089, 'SCHOOL_R', 'SCHOOL_R', 'SCHOOL'),
(17090, 'SCHOOL_U', 'SCHOOL_U', 'SCHOOL'),
(17091, 'SCHOOL_D', 'SCHOOL_D', 'SCHOOL'),
(17092, 'SESSION_C', 'SESSION_C', 'SESSION'),
(17093, 'SESSION_R', 'SESSION_R', 'SESSION'),
(17094, 'SESSION_U', 'SESSION_U', 'SESSION'),
(17095, 'SESSION_D', 'SESSION_D', 'SESSION'),
(17096, 'SURVEY_C', 'SURVEY_C', 'SURVEY'),
(17097, 'SURVEY_R', 'SURVEY_R', 'SURVEY'),
(17098, 'SURVEY_U', 'SURVEY_U', 'SURVEY'),
(17099, 'SURVEY_D', 'SURVEY_D', 'SURVEY'),
(17100, 'SURVEY_QUESTION_C', 'SURVEY_QUESTION_C', 'SURVEY QUESTION'),
(17101, 'SURVEY_QUESTION_R', 'SURVEY_QUESTION_R', 'SURVEY QUESTION'),
(17102, 'SURVEY_QUESTION_U', 'SURVEY_QUESTION_U', 'SURVEY QUESTION'),
(17103, 'SURVEY_QUESTION_D', 'SURVEY_QUESTION_D', 'SURVEY QUESTION'),
(17104, 'SURVEY_QUESTION_TYPE_C', 'SURVEY_QUESTION_TYPE_C', 'SURVEY QUESTION TYPE'),
(17105, 'SURVEY_QUESTION_TYPE_R', 'SURVEY_QUESTION_TYPE_R', 'SURVEY QUESTION TYPE'),
(17106, 'SURVEY_QUESTION_TYPE_U', 'SURVEY_QUESTION_TYPE_U', 'SURVEY QUESTION TYPE'),
(17107, 'SURVEY_QUESTION_TYPE_D', 'SURVEY_QUESTION_TYPE_D', 'SURVEY QUESTION TYPE'),
(17108, 'SURVEY_QUESTION_FILLUP_C', 'SURVEY_QUESTION_FILLUP_C', 'SURVEY QUESTION FILLUP'),
(17109, 'SURVEY_QUESTION_FILLUP_R', 'SURVEY_QUESTION_FILLUP_R', 'SURVEY QUESTION FILLUP'),
(17110, 'SURVEY_QUESTION_FILLUP_U', 'SURVEY_QUESTION_FILLUP_U', 'SURVEY QUESTION FILLUP'),
(17111, 'SURVEY_QUESTION_FILLUP_D', 'SURVEY_QUESTION_FILLUP_D', 'SURVEY QUESTION FILLUP'),
(17112, 'TERM_C', 'TERM_C', 'TERM'),
(17113, 'TERM_R', 'TERM_R', 'TERM'),
(17114, 'TERM_U', 'TERM_U', 'TERM'),
(17115, 'TERM_D', 'TERM_D', 'TERM'),
(17116, 'USER_C', 'USER_C', 'USER'),
(17117, 'USER_R', 'USER_R', 'USER'),
(17118, 'USER_U', 'USER_U', 'USER'),
(17119, 'USER_D', 'USER_D', 'USER'),
(17120, 'YEAR_C', 'YEAR_C', 'YEAR'),
(17121, 'YEAR_R', 'YEAR_R', 'YEAR'),
(17122, 'YEAR_U', 'YEAR_U', 'YEAR'),
(17123, 'YEAR_D', 'YEAR_D', 'YEAR'),
(17124, 'VIDEO_C', 'VIDEO_C', 'VIDEO'),
(17125, 'VIDEO_R', 'VIDEO_R', 'VIDEO'),
(17126, 'VIDEO_U', 'VIDEO_U', 'VIDEO'),
(17127, 'VIDEO_D', 'VIDEO_D', 'VIDEO'),
(17128, 'VIDEO_COMMENT_C', 'VIDEO_COMMENT_C', 'VIDEO COMMENT'),
(17129, 'VIDEO_COMMENT_R', 'VIDEO_COMMENT_R', 'VIDEO COMMENT'),
(17130, 'VIDEO_COMMENT_U', 'VIDEO_COMMENT_U', 'VIDEO COMMENT'),
(17131, 'VIDEO_COMMENT_D', 'VIDEO_COMMENT_D', 'VIDEO COMMENT'),
(17132, 'JOB_C', 'JOB_C', 'JOB'),
(17133, 'JOB_R', 'JOB_R', 'JOB'),
(17134, 'JOB_U', 'JOB_U', 'JOB'),
(17135, 'JOB_D', 'JOB_D', 'JOB'),
(17136, 'CLUB_C', 'CLUB_C', 'CLUB'),
(17137, 'CLUB_R', 'CLUB_R', 'CLUB'),
(17138, 'CLUB_U', 'CLUB_U', 'CLUB'),
(17139, 'CLUB_D', 'CLUB_D', 'CLUB'),
(17140, 'DISCUSSION_C', 'DISCUSSION_C', 'DISCUSSION'),
(17141, 'DISCUSSION_R', 'DISCUSSION_R', 'DISCUSSION'),
(17142, 'DISCUSSION_U', 'DISCUSSION_U', 'DISCUSSION'),
(17143, 'DISCUSSION_D', 'DISCUSSION_D', 'DISCUSSION'),
(17144, 'DISCUSSION_CAT_C', 'DISCUSSION_CAT_C', 'DISCUSSION CATEGORY'),
(17145, 'DISCUSSION_CAT_R', 'DISCUSSION_CAT_R', 'DISCUSSION CATEGORY'),
(17146, 'DISCUSSION_CAT_U', 'DISCUSSION_CAT_U', 'DISCUSSION CATEGORY'),
(17147, 'DISCUSSION_CAT_D', 'DISCUSSION_CAT_D', 'DISCUSSION CATEGORY'),
(17148, 'DISCUSSION_COMMENT_C', 'DISCUSSION_COMMENT_C', 'DISCUSSION COMMENT'),
(17149, 'DISCUSSION_COMMENT_R', 'DISCUSSION_COMMENT_R', 'DISCUSSION COMMENT'),
(17150, 'DISCUSSION_COMMENT_U', 'DISCUSSION_COMMENT_U', 'DISCUSSION COMMENT'),
(17151, 'DISCUSSION_COMMENT_D', 'DISCUSSION_COMMENT_D', 'DISCUSSION COMMENT'),
(17152, 'TASK_C', 'TASK_C', 'TASK'),
(17153, 'TASK_R', 'TASK_R', 'TASK'),
(17154, 'TASK_U', 'TASK_U', 'TASK'),
(17155, 'TASK_D', 'TASK_D', 'TASK'),
(17156, 'TASK_CATEGORY_C', 'TASK_CATEGORY_C', 'TASK_CATEGORY'),
(17157, 'TASK_CATEGORY_R', 'TASK_CATEGORY_R', 'TASK_CATEGORY'),
(17158, 'TASK_CATEGORY_U', 'TASK_CATEGORY_U', 'TASK_CATEGORY'),
(17159, 'TASK_CATEGORY_D', 'TASK_CATEGORY_D', 'TASK_CATEGORY'),
(17160, 'RENTANDSELLS_C', 'RENTANDSELLS_C', 'RENTANDSELLS'),
(17161, 'RENTANDSELLS_R', 'RENTANDSELLS_R', 'RENTANDSELLS'),
(17162, 'RENTANDSELLS_U', 'RENTANDSELLS_U', 'RENTANDSELLS'),
(17163, 'RENTANDSELLS_D', 'RENTANDSELLS_D', 'RENTANDSELLS'),
(17164, 'RENT_C', 'RENT_C', 'RENT'),
(17165, 'RENT_R', 'RENT_R', 'RENT'),
(17166, 'RENT_U', 'RENT_U', 'RENT'),
(17167, 'RENT_D', 'RENT_D', 'RENT'),
(17168, 'SELLS_C', 'SELLS_C', 'SELLS'),
(17169, 'SELLS_R', 'SELLS_R', 'SELLS'),
(17170, 'SELLS_U', 'SELLS_U', 'SELLS'),
(17171, 'SELLS_D', 'SELLS_D', 'SELLS'),
(17172, 'SETAD_C', 'SETAD_C', 'SETAD'),
(17173, 'SETAD_R', 'SETAD_R', 'SETAD'),
(17174, 'SETAD_U', 'SETAD_U', 'SETAD'),
(17175, 'SETAD_D', 'SETAD_D', 'SETAD'),
(17176, 'MANAGEMENT_C', 'MANAGEMENT_C', 'MANAGEMENT'),
(17177, 'MANAGEMENT_R', 'MANAGEMENT_R', 'MANAGEMENT'),
(17178, 'MANAGEMENT_U', 'MANAGEMENT_U', 'MANAGEMENT'),
(17179, 'MANAGEMENT_D', 'MANAGEMENT_D', 'MANAGEMENT'),
(17180, 'SEEPAYMENT_C', 'SEEPAYMENT_C', 'SEEPAYMENT'),
(17181, 'SEEPAYMENT_R', 'SEEPAYMENT_R', 'SEEPAYMENT'),
(17182, 'SEEPAYMENT_U', 'SEEPAYMENT_U', 'SEEPAYMENT'),
(17183, 'SEEPAYMENT_D', 'SEEPAYMENT_D', 'SEEPAYMENT'),
(17184, 'GIVEPAYMENT_C', 'GIVEPAYMENT_C', 'GIVEPAYMENT'),
(17185, 'GIVEPAYMENT_R', 'GIVEPAYMENT_R', 'GIVEPAYMENT'),
(17186, 'GIVEPAYMENT_U', 'GIVEPAYMENT_U', 'GIVEPAYMENT'),
(17187, 'GIVEPAYMENT_D', 'GIVEPAYMENT_D', 'GIVEPAYMENT');

-- --------------------------------------------------------

--
-- Table structure for table `ums_position`
--

DROP TABLE IF EXISTS `ums_position`;
CREATE TABLE IF NOT EXISTS `ums_position` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_position`
--

INSERT INTO `ums_position` (`ID`, `Name`) VALUES
('{1BFE76DB-C2AA-4FAA-A23B-F43E6150A2F6}', 'Section Officer'),
('{7CDA1F32-A2F8-4469-B5A8-C2038FCE1F9A}', 'Owner'),
('{818DE12F-60CC-42E4-BAEC-48EAAED65179}', 'Caretaker'),
('{92FDDA3F-1E91-4AA3-918F-EB595F85790C}', 'Daywise Worker'),
('{ADA027D3-21C1-47AF-A21D-759CAFCFE58D}', 'renter'),
('{B78C7A7B-4D38-4025-8170-7B8C9F291946}', 'Security Guard'),
('{C27B6BCF-FB83-4F3D-85CA-B7870D8B12D0}', 'Admin'),
('{C934BC09-BC4C-4AE1-B1EE-7548694F2905}', '');

-- --------------------------------------------------------

--
-- Table structure for table `ums_role`
--

DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE IF NOT EXISTS `ums_role` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_role`
--

INSERT INTO `ums_role` (`ID`, `Name`) VALUES
('admin', 'admin'),
('caretaker', 'Caretaker'),
('dailywise worker', 'Dailywise Worker'),
('owner', 'Owner'),
('renter', 'renter'),
('security guard', 'Security Guard');

-- --------------------------------------------------------

--
-- Table structure for table `ums_role_permission`
--

DROP TABLE IF EXISTS `ums_role_permission`;
CREATE TABLE IF NOT EXISTS `ums_role_permission` (
  `Row` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` varchar(40) NOT NULL,
  `PermissionID` varchar(100) NOT NULL,
  PRIMARY KEY (`Row`)
) ENGINE=InnoDB AUTO_INCREMENT=11674 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_role_permission`
--

INSERT INTO `ums_role_permission` (`Row`, `RoleID`, `PermissionID`) VALUES
(5575, 'registration coordinator', 'ASSET_C'),
(5576, 'registration coordinator', 'ASSET_R'),
(5577, 'registration coordinator', 'ASSET_U'),
(5578, 'registration coordinator', 'ASSET_D'),
(5579, 'registration coordinator', 'ATTENDANCE_C'),
(5580, 'registration coordinator', 'ATTENDANCE_R'),
(5581, 'registration coordinator', 'ATTENDANCE_U'),
(5582, 'registration coordinator', 'ATTENDANCE_D'),
(5583, 'registration coordinator', 'BLOOD_C'),
(5584, 'registration coordinator', 'BLOOD_R'),
(5585, 'registration coordinator', 'BLOOD_U'),
(5586, 'registration coordinator', 'CALENDAR_R'),
(5587, 'registration coordinator', 'CLUB_C'),
(5588, 'registration coordinator', 'CLUB_R'),
(5589, 'registration coordinator', 'CLUB_U'),
(5590, 'registration coordinator', 'CLUB_D'),
(5591, 'registration coordinator', 'COURSE_C'),
(5592, 'registration coordinator', 'COURSE_R'),
(5593, 'registration coordinator', 'COURSE_U'),
(5594, 'registration coordinator', 'COURSE_D'),
(5595, 'registration coordinator', 'COURSE_SESSIONAL_TYPE_C'),
(5596, 'registration coordinator', 'COURSE_SESSIONAL_TYPE_R'),
(5597, 'registration coordinator', 'COURSE_SESSIONAL_TYPE_U'),
(5598, 'registration coordinator', 'COURSE_SESSIONAL_TYPE_D'),
(5599, 'registration coordinator', 'COURSE_TYPE_C'),
(5600, 'registration coordinator', 'COURSE_TYPE_R'),
(5601, 'registration coordinator', 'COURSE_TYPE_U'),
(5602, 'registration coordinator', 'COURSE_TYPE_D'),
(5603, 'registration coordinator', 'DISCIPLINE_C'),
(5604, 'registration coordinator', 'DISCIPLINE_R'),
(5605, 'registration coordinator', 'DISCIPLINE_U'),
(5606, 'registration coordinator', 'DISCIPLINE_D'),
(5607, 'registration coordinator', 'DISCUSSION_C'),
(5608, 'registration coordinator', 'DISCUSSION_R'),
(5609, 'registration coordinator', 'DISCUSSION_U'),
(5610, 'registration coordinator', 'DISCUSSION_D'),
(5611, 'registration coordinator', 'DISCUSSION_CAT_C'),
(5612, 'registration coordinator', 'DISCUSSION_CAT_R'),
(5613, 'registration coordinator', 'DISCUSSION_CAT_U'),
(5614, 'registration coordinator', 'DISCUSSION_CAT_D'),
(5615, 'registration coordinator', 'DISCUSSION_COMMENT_C'),
(5616, 'registration coordinator', 'DISCUSSION_COMMENT_R'),
(5617, 'registration coordinator', 'DISCUSSION_COMMENT_U'),
(5618, 'registration coordinator', 'DISCUSSION_COMMENT_D'),
(5619, 'registration coordinator', 'EMAIL_C'),
(5620, 'registration coordinator', 'EMAIL_R'),
(5621, 'registration coordinator', 'EMAIL_U'),
(5622, 'registration coordinator', 'EMAIL_D'),
(5623, 'registration coordinator', 'FILE_C'),
(5624, 'registration coordinator', 'FILE_R'),
(5625, 'registration coordinator', 'FILE_U'),
(5626, 'registration coordinator', 'FILE_D'),
(5627, 'registration coordinator', 'GRADE_SETUP_C'),
(5628, 'registration coordinator', 'GRADE_SETUP_R'),
(5629, 'registration coordinator', 'GRADE_SETUP_U'),
(5630, 'registration coordinator', 'GRADE_SETUP_D'),
(5631, 'registration coordinator', 'JOB_C'),
(5632, 'registration coordinator', 'JOB_R'),
(5633, 'registration coordinator', 'JOB_U'),
(5634, 'registration coordinator', 'JOB_D'),
(5635, 'registration coordinator', 'MARKS_SETUP_C'),
(5636, 'registration coordinator', 'MARKS_SETUP_R'),
(5637, 'registration coordinator', 'MARKS_SETUP_U'),
(5638, 'registration coordinator', 'MARKS_SETUP_D'),
(5639, 'registration coordinator', 'PERMISSION_C'),
(5640, 'registration coordinator', 'PERMISSION_R'),
(5641, 'registration coordinator', 'PERMISSION_U'),
(5642, 'registration coordinator', 'PERMISSION_D'),
(5643, 'registration coordinator', 'POSITION_C'),
(5644, 'registration coordinator', 'POSITION_R'),
(5645, 'registration coordinator', 'POSITION_U'),
(5646, 'registration coordinator', 'POSITION_D'),
(5647, 'registration coordinator', 'PROJECT_C'),
(5648, 'registration coordinator', 'PROJECT_R'),
(5649, 'registration coordinator', 'PROJECT_U'),
(5650, 'registration coordinator', 'PROJECT_D'),
(5651, 'registration coordinator', 'QUESTION_C'),
(5652, 'registration coordinator', 'QUESTION_R'),
(5653, 'registration coordinator', 'QUESTION_U'),
(5654, 'registration coordinator', 'QUESTION_D'),
(5655, 'registration coordinator', 'REGISTRATION_C'),
(5656, 'registration coordinator', 'REGISTRATION_R'),
(5657, 'registration coordinator', 'REGISTRATION_U'),
(5658, 'registration coordinator', 'REGISTRATION_D'),
(5659, 'registration coordinator', 'RESULT_C'),
(5660, 'registration coordinator', 'RESULT_R'),
(5661, 'registration coordinator', 'RESULT_U'),
(5662, 'registration coordinator', 'RESULT_D'),
(5663, 'registration coordinator', 'ROLE_C'),
(5664, 'registration coordinator', 'ROLE_R'),
(5665, 'registration coordinator', 'ROLE_U'),
(5666, 'registration coordinator', 'ROLE_D'),
(5667, 'registration coordinator', 'SCHOOL_C'),
(5668, 'registration coordinator', 'SCHOOL_R'),
(5669, 'registration coordinator', 'SCHOOL_U'),
(5670, 'registration coordinator', 'SCHOOL_D'),
(5671, 'registration coordinator', 'SESSION_C'),
(5672, 'registration coordinator', 'SESSION_R'),
(5673, 'registration coordinator', 'SESSION_U'),
(5674, 'registration coordinator', 'SESSION_D'),
(5675, 'registration coordinator', 'SURVEY_C'),
(5676, 'registration coordinator', 'SURVEY_R'),
(5677, 'registration coordinator', 'SURVEY_U'),
(5678, 'registration coordinator', 'SURVEY_D'),
(5679, 'registration coordinator', 'SURVEY_QUESTION_C'),
(5680, 'registration coordinator', 'SURVEY_QUESTION_R'),
(5681, 'registration coordinator', 'SURVEY_QUESTION_U'),
(5682, 'registration coordinator', 'SURVEY_QUESTION_D'),
(5683, 'registration coordinator', 'SURVEY_QUESTION_FILLUP_C'),
(5684, 'registration coordinator', 'SURVEY_QUESTION_FILLUP_R'),
(5685, 'registration coordinator', 'SURVEY_QUESTION_FILLUP_U'),
(5686, 'registration coordinator', 'SURVEY_QUESTION_FILLUP_D'),
(5687, 'registration coordinator', 'SURVEY_QUESTION_TYPE_C'),
(5688, 'registration coordinator', 'SURVEY_QUESTION_TYPE_R'),
(5689, 'registration coordinator', 'SURVEY_QUESTION_TYPE_U'),
(5690, 'registration coordinator', 'SURVEY_QUESTION_TYPE_D'),
(5691, 'registration coordinator', 'TASK_C'),
(5692, 'registration coordinator', 'TASK_R'),
(5693, 'registration coordinator', 'TASK_U'),
(5694, 'registration coordinator', 'TASK_D'),
(5695, 'registration coordinator', 'TASK_CATEGORY_C'),
(5696, 'registration coordinator', 'TASK_CATEGORY_R'),
(5697, 'registration coordinator', 'TASK_CATEGORY_U'),
(5698, 'registration coordinator', 'TASK_CATEGORY_D'),
(5699, 'registration coordinator', 'TERM_C'),
(5700, 'registration coordinator', 'TERM_R'),
(5701, 'registration coordinator', 'TERM_U'),
(5702, 'registration coordinator', 'TERM_D'),
(5703, 'registration coordinator', 'THESIS_C'),
(5704, 'registration coordinator', 'THESIS_R'),
(5705, 'registration coordinator', 'THESIS_U'),
(5706, 'registration coordinator', 'THESIS_D'),
(5707, 'registration coordinator', 'USER_C'),
(5708, 'registration coordinator', 'USER_R'),
(5709, 'registration coordinator', 'USER_U'),
(5710, 'registration coordinator', 'USER_D'),
(5711, 'registration coordinator', 'VIDEO_C'),
(5712, 'registration coordinator', 'VIDEO_R'),
(5713, 'registration coordinator', 'VIDEO_U'),
(5714, 'registration coordinator', 'VIDEO_D'),
(5715, 'registration coordinator', 'VIDEO_COMMENT_C'),
(5716, 'registration coordinator', 'VIDEO_COMMENT_R'),
(5717, 'registration coordinator', 'VIDEO_COMMENT_U'),
(5718, 'registration coordinator', 'VIDEO_COMMENT_D'),
(5719, 'registration coordinator', 'YEAR_C'),
(5720, 'registration coordinator', 'YEAR_R'),
(5721, 'registration coordinator', 'YEAR_U'),
(5722, 'registration coordinator', 'YEAR_D'),
(5773, 'stuff', 'BLOOD_C'),
(5774, 'stuff', 'BLOOD_R'),
(5775, 'stuff', 'BLOOD_U'),
(5776, 'stuff', 'CALENDAR_R'),
(5777, 'tabulator', 'BLOOD_C'),
(5778, 'tabulator', 'BLOOD_R'),
(5779, 'tabulator', 'BLOOD_U'),
(5780, 'tabulator', 'CALENDAR_R'),
(6400, 'teacher', 'BLOOD_C'),
(6401, 'teacher', 'BLOOD_R'),
(6402, 'teacher', 'BLOOD_U'),
(6403, 'teacher', 'CALENDAR_R'),
(6404, 'teacher', 'COURSE_C'),
(6405, 'teacher', 'COURSE_R'),
(6406, 'teacher', 'COURSE_U'),
(6407, 'teacher', 'COURSE_D'),
(6408, 'teacher', 'DISCUSSION_C'),
(6409, 'teacher', 'DISCUSSION_R'),
(6410, 'teacher', 'DISCUSSION_U'),
(6411, 'teacher', 'DISCUSSION_D'),
(6412, 'teacher', 'DISCUSSION_CAT_C'),
(6413, 'teacher', 'DISCUSSION_CAT_R'),
(6414, 'teacher', 'DISCUSSION_CAT_U'),
(6415, 'teacher', 'DISCUSSION_CAT_D'),
(6416, 'teacher', 'DISCUSSION_COMMENT_C'),
(6417, 'teacher', 'DISCUSSION_COMMENT_R'),
(6418, 'teacher', 'DISCUSSION_COMMENT_U'),
(6419, 'teacher', 'DISCUSSION_COMMENT_D'),
(6420, 'teacher', 'FILE_C'),
(6421, 'teacher', 'FILE_R'),
(6422, 'teacher', 'FILE_U'),
(6423, 'teacher', 'FILE_D'),
(6424, 'teacher', 'PROJECT_C'),
(6425, 'teacher', 'PROJECT_R'),
(6426, 'teacher', 'PROJECT_U'),
(6427, 'teacher', 'PROJECT_D'),
(6428, 'teacher', 'QUESTION_C'),
(6429, 'teacher', 'QUESTION_R'),
(6430, 'teacher', 'QUESTION_U'),
(6431, 'teacher', 'QUESTION_D'),
(6432, 'teacher', 'REGISTRATION_C'),
(6433, 'teacher', 'REGISTRATION_R'),
(6434, 'teacher', 'REGISTRATION_U'),
(6435, 'teacher', 'REGISTRATION_D'),
(6436, 'teacher', 'RESULT_C'),
(6437, 'teacher', 'RESULT_R'),
(6438, 'teacher', 'RESULT_U'),
(6439, 'teacher', 'RESULT_D'),
(6440, 'teacher', 'VIDEO_C'),
(6441, 'teacher', 'VIDEO_R'),
(6442, 'teacher', 'VIDEO_U'),
(6443, 'teacher', 'VIDEO_D'),
(6444, 'teacher', 'VIDEO_COMMENT_C'),
(6445, 'teacher', 'VIDEO_COMMENT_R'),
(6446, 'teacher', 'VIDEO_COMMENT_U'),
(6447, 'teacher', 'VIDEO_COMMENT_D'),
(7381, 'administrator', 'ATTENDANCE_C'),
(7382, 'administrator', 'ATTENDANCE_R'),
(7383, 'administrator', 'ATTENDANCE_U'),
(7384, 'administrator', 'ATTENDANCE_D'),
(7385, 'administrator', 'CLUB_C'),
(7386, 'administrator', 'CLUB_R'),
(7387, 'administrator', 'CLUB_U'),
(7388, 'administrator', 'CLUB_D'),
(7389, 'administrator', 'COURSE_C'),
(7390, 'administrator', 'COURSE_R'),
(7391, 'administrator', 'COURSE_U'),
(7392, 'administrator', 'COURSE_D'),
(7393, 'administrator', 'COURSE_SESSIONAL_TYPE_C'),
(7394, 'administrator', 'COURSE_SESSIONAL_TYPE_R'),
(7395, 'administrator', 'COURSE_SESSIONAL_TYPE_U'),
(7396, 'administrator', 'COURSE_SESSIONAL_TYPE_D'),
(7397, 'administrator', 'COURSE_TYPE_C'),
(7398, 'administrator', 'COURSE_TYPE_R'),
(7399, 'administrator', 'COURSE_TYPE_U'),
(7400, 'administrator', 'COURSE_TYPE_D'),
(7401, 'administrator', 'DISCIPLINE_C'),
(7402, 'administrator', 'DISCIPLINE_R'),
(7403, 'administrator', 'DISCIPLINE_U'),
(7404, 'administrator', 'DISCIPLINE_D'),
(7405, 'administrator', 'DISCUSSION_C'),
(7406, 'administrator', 'DISCUSSION_R'),
(7407, 'administrator', 'DISCUSSION_U'),
(7408, 'administrator', 'DISCUSSION_D'),
(7409, 'administrator', 'DISCUSSION_CAT_C'),
(7410, 'administrator', 'DISCUSSION_CAT_R'),
(7411, 'administrator', 'DISCUSSION_CAT_U'),
(7412, 'administrator', 'DISCUSSION_CAT_D'),
(7413, 'administrator', 'DISCUSSION_COMMENT_C'),
(7414, 'administrator', 'DISCUSSION_COMMENT_R'),
(7415, 'administrator', 'DISCUSSION_COMMENT_U'),
(7416, 'administrator', 'DISCUSSION_COMMENT_D'),
(7417, 'administrator', 'FILE_C'),
(7418, 'administrator', 'FILE_R'),
(7419, 'administrator', 'FILE_U'),
(7420, 'administrator', 'FILE_D'),
(7421, 'administrator', 'GIVEPAYMENT_C'),
(7422, 'administrator', 'GIVEPAYMENT_R'),
(7423, 'administrator', 'GIVEPAYMENT_U'),
(7424, 'administrator', 'GIVEPAYMENT_D'),
(7425, 'administrator', 'GRADE_SETUP_C'),
(7426, 'administrator', 'GRADE_SETUP_R'),
(7427, 'administrator', 'GRADE_SETUP_U'),
(7428, 'administrator', 'GRADE_SETUP_D'),
(7429, 'administrator', 'JOB_C'),
(7430, 'administrator', 'JOB_R'),
(7431, 'administrator', 'JOB_U'),
(7432, 'administrator', 'JOB_D'),
(7433, 'administrator', 'MANAGEMENT_C'),
(7434, 'administrator', 'MANAGEMENT_R'),
(7435, 'administrator', 'MANAGEMENT_U'),
(7436, 'administrator', 'MANAGEMENT_D'),
(7437, 'administrator', 'MARKS_SETUP_C'),
(7438, 'administrator', 'MARKS_SETUP_R'),
(7439, 'administrator', 'MARKS_SETUP_U'),
(7440, 'administrator', 'MARKS_SETUP_D'),
(7441, 'administrator', 'PERMISSION_C'),
(7442, 'administrator', 'PERMISSION_R'),
(7443, 'administrator', 'PERMISSION_U'),
(7444, 'administrator', 'PERMISSION_D'),
(7445, 'administrator', 'POSITION_C'),
(7446, 'administrator', 'POSITION_R'),
(7447, 'administrator', 'POSITION_U'),
(7448, 'administrator', 'POSITION_D'),
(7449, 'administrator', 'PROJECT_C'),
(7450, 'administrator', 'PROJECT_R'),
(7451, 'administrator', 'PROJECT_U'),
(7452, 'administrator', 'PROJECT_D'),
(7453, 'administrator', 'QUESTION_C'),
(7454, 'administrator', 'QUESTION_R'),
(7455, 'administrator', 'QUESTION_U'),
(7456, 'administrator', 'QUESTION_D'),
(7457, 'administrator', 'REGISTRATION_C'),
(7458, 'administrator', 'REGISTRATION_R'),
(7459, 'administrator', 'REGISTRATION_U'),
(7460, 'administrator', 'REGISTRATION_D'),
(7461, 'administrator', 'RENT_C'),
(7462, 'administrator', 'RENT_R'),
(7463, 'administrator', 'RENT_U'),
(7464, 'administrator', 'RENT_D'),
(7465, 'administrator', 'RENTANDSELLS_C'),
(7466, 'administrator', 'RENTANDSELLS_R'),
(7467, 'administrator', 'RENTANDSELLS_U'),
(7468, 'administrator', 'RENTANDSELLS_D'),
(7469, 'administrator', 'RESULT_C'),
(7470, 'administrator', 'RESULT_R'),
(7471, 'administrator', 'RESULT_U'),
(7472, 'administrator', 'RESULT_D'),
(7473, 'administrator', 'ROLE_C'),
(7474, 'administrator', 'ROLE_R'),
(7475, 'administrator', 'ROLE_U'),
(7476, 'administrator', 'ROLE_D'),
(7477, 'administrator', 'SCHOOL_C'),
(7478, 'administrator', 'SCHOOL_R'),
(7479, 'administrator', 'SCHOOL_U'),
(7480, 'administrator', 'SCHOOL_D'),
(7481, 'administrator', 'SEEPAYMENT_C'),
(7482, 'administrator', 'SEEPAYMENT_R'),
(7483, 'administrator', 'SEEPAYMENT_U'),
(7484, 'administrator', 'SEEPAYMENT_D'),
(7485, 'administrator', 'SELLS_C'),
(7486, 'administrator', 'SELLS_R'),
(7487, 'administrator', 'SELLS_U'),
(7488, 'administrator', 'SELLS_D'),
(7489, 'administrator', 'SESSION_C'),
(7490, 'administrator', 'SESSION_R'),
(7491, 'administrator', 'SESSION_U'),
(7492, 'administrator', 'SESSION_D'),
(7493, 'administrator', 'SETAD_C'),
(7494, 'administrator', 'SETAD_R'),
(7495, 'administrator', 'SETAD_U'),
(7496, 'administrator', 'SETAD_D'),
(7497, 'administrator', 'SURVEY_C'),
(7498, 'administrator', 'SURVEY_R'),
(7499, 'administrator', 'SURVEY_U'),
(7500, 'administrator', 'SURVEY_D'),
(7501, 'administrator', 'SURVEY_QUESTION_C'),
(7502, 'administrator', 'SURVEY_QUESTION_R'),
(7503, 'administrator', 'SURVEY_QUESTION_U'),
(7504, 'administrator', 'SURVEY_QUESTION_D'),
(7505, 'administrator', 'SURVEY_QUESTION_FILLUP_C'),
(7506, 'administrator', 'SURVEY_QUESTION_FILLUP_R'),
(7507, 'administrator', 'SURVEY_QUESTION_FILLUP_U'),
(7508, 'administrator', 'SURVEY_QUESTION_FILLUP_D'),
(7509, 'administrator', 'SURVEY_QUESTION_TYPE_C'),
(7510, 'administrator', 'SURVEY_QUESTION_TYPE_R'),
(7511, 'administrator', 'SURVEY_QUESTION_TYPE_U'),
(7512, 'administrator', 'SURVEY_QUESTION_TYPE_D'),
(7513, 'administrator', 'TASK_C'),
(7514, 'administrator', 'TASK_R'),
(7515, 'administrator', 'TASK_U'),
(7516, 'administrator', 'TASK_D'),
(7517, 'administrator', 'TASK_CATEGORY_C'),
(7518, 'administrator', 'TASK_CATEGORY_R'),
(7519, 'administrator', 'TASK_CATEGORY_U'),
(7520, 'administrator', 'TASK_CATEGORY_D'),
(7521, 'administrator', 'TERM_C'),
(7522, 'administrator', 'TERM_R'),
(7523, 'administrator', 'TERM_U'),
(7524, 'administrator', 'TERM_D'),
(7525, 'administrator', 'USER_C'),
(7526, 'administrator', 'USER_R'),
(7527, 'administrator', 'USER_U'),
(7528, 'administrator', 'USER_D'),
(7529, 'administrator', 'VIDEO_C'),
(7530, 'administrator', 'VIDEO_R'),
(7531, 'administrator', 'VIDEO_U'),
(7532, 'administrator', 'VIDEO_D'),
(7533, 'administrator', 'VIDEO_COMMENT_C'),
(7534, 'administrator', 'VIDEO_COMMENT_R'),
(7535, 'administrator', 'VIDEO_COMMENT_U'),
(7536, 'administrator', 'VIDEO_COMMENT_D'),
(7537, 'administrator', 'YEAR_C'),
(7538, 'administrator', 'YEAR_R'),
(7539, 'administrator', 'YEAR_U'),
(7540, 'administrator', 'YEAR_D'),
(8221, 'student', 'ATTENDANCE_C'),
(8222, 'student', 'ATTENDANCE_R'),
(8223, 'student', 'ATTENDANCE_U'),
(8224, 'student', 'ATTENDANCE_D'),
(8225, 'student', 'CLUB_C'),
(8226, 'student', 'CLUB_R'),
(8227, 'student', 'CLUB_U'),
(8228, 'student', 'CLUB_D'),
(8229, 'student', 'COURSE_C'),
(8230, 'student', 'COURSE_R'),
(8231, 'student', 'COURSE_U'),
(8232, 'student', 'COURSE_D'),
(8233, 'student', 'COURSE_SESSIONAL_TYPE_C'),
(8234, 'student', 'COURSE_SESSIONAL_TYPE_R'),
(8235, 'student', 'COURSE_SESSIONAL_TYPE_U'),
(8236, 'student', 'COURSE_SESSIONAL_TYPE_D'),
(8237, 'student', 'COURSE_TYPE_C'),
(8238, 'student', 'COURSE_TYPE_R'),
(8239, 'student', 'COURSE_TYPE_U'),
(8240, 'student', 'COURSE_TYPE_D'),
(8241, 'student', 'DISCIPLINE_C'),
(8242, 'student', 'DISCIPLINE_R'),
(8243, 'student', 'DISCIPLINE_U'),
(8244, 'student', 'DISCIPLINE_D'),
(8245, 'student', 'DISCUSSION_C'),
(8246, 'student', 'DISCUSSION_R'),
(8247, 'student', 'DISCUSSION_U'),
(8248, 'student', 'DISCUSSION_D'),
(8249, 'student', 'DISCUSSION_CAT_C'),
(8250, 'student', 'DISCUSSION_CAT_R'),
(8251, 'student', 'DISCUSSION_CAT_U'),
(8252, 'student', 'DISCUSSION_CAT_D'),
(8253, 'student', 'DISCUSSION_COMMENT_C'),
(8254, 'student', 'DISCUSSION_COMMENT_R'),
(8255, 'student', 'DISCUSSION_COMMENT_U'),
(8256, 'student', 'DISCUSSION_COMMENT_D'),
(8257, 'student', 'FILE_C'),
(8258, 'student', 'FILE_R'),
(8259, 'student', 'FILE_U'),
(8260, 'student', 'FILE_D'),
(8261, 'student', 'GIVEPAYMENT_C'),
(8262, 'student', 'GIVEPAYMENT_R'),
(8263, 'student', 'GIVEPAYMENT_U'),
(8264, 'student', 'GIVEPAYMENT_D'),
(8265, 'student', 'GRADE_SETUP_C'),
(8266, 'student', 'GRADE_SETUP_R'),
(8267, 'student', 'GRADE_SETUP_U'),
(8268, 'student', 'GRADE_SETUP_D'),
(8269, 'student', 'JOB_C'),
(8270, 'student', 'JOB_R'),
(8271, 'student', 'JOB_U'),
(8272, 'student', 'JOB_D'),
(8273, 'student', 'MANAGEMENT_C'),
(8274, 'student', 'MANAGEMENT_R'),
(8275, 'student', 'MANAGEMENT_U'),
(8276, 'student', 'MANAGEMENT_D'),
(8277, 'student', 'MARKS_SETUP_C'),
(8278, 'student', 'MARKS_SETUP_R'),
(8279, 'student', 'MARKS_SETUP_U'),
(8280, 'student', 'MARKS_SETUP_D'),
(8281, 'student', 'PERMISSION_C'),
(8282, 'student', 'PERMISSION_R'),
(8283, 'student', 'PERMISSION_U'),
(8284, 'student', 'PERMISSION_D'),
(8285, 'student', 'POSITION_C'),
(8286, 'student', 'POSITION_R'),
(8287, 'student', 'POSITION_U'),
(8288, 'student', 'POSITION_D'),
(8289, 'student', 'PROJECT_C'),
(8290, 'student', 'PROJECT_R'),
(8291, 'student', 'PROJECT_U'),
(8292, 'student', 'PROJECT_D'),
(8293, 'student', 'QUESTION_C'),
(8294, 'student', 'QUESTION_R'),
(8295, 'student', 'QUESTION_U'),
(8296, 'student', 'QUESTION_D'),
(8297, 'student', 'REGISTRATION_C'),
(8298, 'student', 'REGISTRATION_R'),
(8299, 'student', 'REGISTRATION_U'),
(8300, 'student', 'REGISTRATION_D'),
(8301, 'student', 'RENT_C'),
(8302, 'student', 'RENT_R'),
(8303, 'student', 'RENT_U'),
(8304, 'student', 'RENT_D'),
(8305, 'student', 'RENTANDSELLS_C'),
(8306, 'student', 'RENTANDSELLS_R'),
(8307, 'student', 'RENTANDSELLS_U'),
(8308, 'student', 'RENTANDSELLS_D'),
(8309, 'student', 'RESULT_C'),
(8310, 'student', 'RESULT_R'),
(8311, 'student', 'RESULT_U'),
(8312, 'student', 'RESULT_D'),
(8313, 'student', 'ROLE_C'),
(8314, 'student', 'ROLE_R'),
(8315, 'student', 'ROLE_U'),
(8316, 'student', 'ROLE_D'),
(8317, 'student', 'SCHOOL_C'),
(8318, 'student', 'SCHOOL_R'),
(8319, 'student', 'SCHOOL_U'),
(8320, 'student', 'SCHOOL_D'),
(8321, 'student', 'SEEPAYMENT_C'),
(8322, 'student', 'SEEPAYMENT_R'),
(8323, 'student', 'SEEPAYMENT_U'),
(8324, 'student', 'SEEPAYMENT_D'),
(8325, 'student', 'SELLS_C'),
(8326, 'student', 'SELLS_R'),
(8327, 'student', 'SELLS_U'),
(8328, 'student', 'SELLS_D'),
(8329, 'student', 'SESSION_C'),
(8330, 'student', 'SESSION_R'),
(8331, 'student', 'SESSION_U'),
(8332, 'student', 'SESSION_D'),
(8333, 'student', 'SETAD_C'),
(8334, 'student', 'SETAD_R'),
(8335, 'student', 'SETAD_U'),
(8336, 'student', 'SETAD_D'),
(8337, 'student', 'SURVEY_C'),
(8338, 'student', 'SURVEY_R'),
(8339, 'student', 'SURVEY_U'),
(8340, 'student', 'SURVEY_D'),
(8341, 'student', 'SURVEY_QUESTION_C'),
(8342, 'student', 'SURVEY_QUESTION_R'),
(8343, 'student', 'SURVEY_QUESTION_U'),
(8344, 'student', 'SURVEY_QUESTION_D'),
(8345, 'student', 'SURVEY_QUESTION_FILLUP_C'),
(8346, 'student', 'SURVEY_QUESTION_FILLUP_R'),
(8347, 'student', 'SURVEY_QUESTION_FILLUP_U'),
(8348, 'student', 'SURVEY_QUESTION_FILLUP_D'),
(8349, 'student', 'SURVEY_QUESTION_TYPE_C'),
(8350, 'student', 'SURVEY_QUESTION_TYPE_R'),
(8351, 'student', 'SURVEY_QUESTION_TYPE_U'),
(8352, 'student', 'SURVEY_QUESTION_TYPE_D'),
(8353, 'student', 'TASK_C'),
(8354, 'student', 'TASK_R'),
(8355, 'student', 'TASK_U'),
(8356, 'student', 'TASK_D'),
(8357, 'student', 'TASK_CATEGORY_C'),
(8358, 'student', 'TASK_CATEGORY_R'),
(8359, 'student', 'TASK_CATEGORY_U'),
(8360, 'student', 'TASK_CATEGORY_D'),
(8361, 'student', 'TERM_C'),
(8362, 'student', 'TERM_R'),
(8363, 'student', 'TERM_U'),
(8364, 'student', 'TERM_D'),
(8365, 'student', 'USER_C'),
(8366, 'student', 'USER_R'),
(8367, 'student', 'USER_U'),
(8368, 'student', 'USER_D'),
(8369, 'student', 'VIDEO_C'),
(8370, 'student', 'VIDEO_R'),
(8371, 'student', 'VIDEO_U'),
(8372, 'student', 'VIDEO_D'),
(8373, 'student', 'VIDEO_COMMENT_C'),
(8374, 'student', 'VIDEO_COMMENT_R'),
(8375, 'student', 'VIDEO_COMMENT_U'),
(8376, 'student', 'VIDEO_COMMENT_D'),
(8377, 'student', 'YEAR_C'),
(8378, 'student', 'YEAR_R'),
(8379, 'student', 'YEAR_U'),
(8380, 'student', 'YEAR_D'),
(8381, 'caretaker', 'ATTENDANCE_C'),
(8382, 'caretaker', 'ATTENDANCE_R'),
(8383, 'caretaker', 'ATTENDANCE_U'),
(8384, 'caretaker', 'ATTENDANCE_D'),
(8385, 'caretaker', 'CLUB_C'),
(8386, 'caretaker', 'CLUB_R'),
(8387, 'caretaker', 'CLUB_U'),
(8388, 'caretaker', 'CLUB_D'),
(8389, 'caretaker', 'COURSE_C'),
(8390, 'caretaker', 'COURSE_R'),
(8391, 'caretaker', 'COURSE_U'),
(8392, 'caretaker', 'COURSE_D'),
(8393, 'caretaker', 'COURSE_SESSIONAL_TYPE_C'),
(8394, 'caretaker', 'COURSE_SESSIONAL_TYPE_R'),
(8395, 'caretaker', 'COURSE_SESSIONAL_TYPE_U'),
(8396, 'caretaker', 'COURSE_SESSIONAL_TYPE_D'),
(8397, 'caretaker', 'COURSE_TYPE_C'),
(8398, 'caretaker', 'COURSE_TYPE_R'),
(8399, 'caretaker', 'COURSE_TYPE_U'),
(8400, 'caretaker', 'COURSE_TYPE_D'),
(8401, 'caretaker', 'DISCIPLINE_C'),
(8402, 'caretaker', 'DISCIPLINE_R'),
(8403, 'caretaker', 'DISCIPLINE_U'),
(8404, 'caretaker', 'DISCIPLINE_D'),
(8405, 'caretaker', 'DISCUSSION_C'),
(8406, 'caretaker', 'DISCUSSION_R'),
(8407, 'caretaker', 'DISCUSSION_U'),
(8408, 'caretaker', 'DISCUSSION_D'),
(8409, 'caretaker', 'DISCUSSION_CAT_C'),
(8410, 'caretaker', 'DISCUSSION_CAT_R'),
(8411, 'caretaker', 'DISCUSSION_CAT_U'),
(8412, 'caretaker', 'DISCUSSION_CAT_D'),
(8413, 'caretaker', 'DISCUSSION_COMMENT_C'),
(8414, 'caretaker', 'DISCUSSION_COMMENT_R'),
(8415, 'caretaker', 'DISCUSSION_COMMENT_U'),
(8416, 'caretaker', 'DISCUSSION_COMMENT_D'),
(8417, 'caretaker', 'FILE_C'),
(8418, 'caretaker', 'FILE_R'),
(8419, 'caretaker', 'FILE_U'),
(8420, 'caretaker', 'FILE_D'),
(8421, 'caretaker', 'GIVEPAYMENT_C'),
(8422, 'caretaker', 'GIVEPAYMENT_R'),
(8423, 'caretaker', 'GIVEPAYMENT_U'),
(8424, 'caretaker', 'GIVEPAYMENT_D'),
(8425, 'caretaker', 'GRADE_SETUP_C'),
(8426, 'caretaker', 'GRADE_SETUP_R'),
(8427, 'caretaker', 'GRADE_SETUP_U'),
(8428, 'caretaker', 'GRADE_SETUP_D'),
(8429, 'caretaker', 'JOB_C'),
(8430, 'caretaker', 'JOB_R'),
(8431, 'caretaker', 'JOB_U'),
(8432, 'caretaker', 'JOB_D'),
(8433, 'caretaker', 'MANAGEMENT_C'),
(8434, 'caretaker', 'MANAGEMENT_R'),
(8435, 'caretaker', 'MANAGEMENT_U'),
(8436, 'caretaker', 'MANAGEMENT_D'),
(8437, 'caretaker', 'MARKS_SETUP_C'),
(8438, 'caretaker', 'MARKS_SETUP_R'),
(8439, 'caretaker', 'MARKS_SETUP_U'),
(8440, 'caretaker', 'MARKS_SETUP_D'),
(8441, 'caretaker', 'PERMISSION_C'),
(8442, 'caretaker', 'PERMISSION_R'),
(8443, 'caretaker', 'PERMISSION_U'),
(8444, 'caretaker', 'PERMISSION_D'),
(8445, 'caretaker', 'POSITION_C'),
(8446, 'caretaker', 'POSITION_R'),
(8447, 'caretaker', 'POSITION_U'),
(8448, 'caretaker', 'POSITION_D'),
(8449, 'caretaker', 'PROJECT_C'),
(8450, 'caretaker', 'PROJECT_R'),
(8451, 'caretaker', 'PROJECT_U'),
(8452, 'caretaker', 'PROJECT_D'),
(8453, 'caretaker', 'QUESTION_C'),
(8454, 'caretaker', 'QUESTION_R'),
(8455, 'caretaker', 'QUESTION_U'),
(8456, 'caretaker', 'QUESTION_D'),
(8457, 'caretaker', 'REGISTRATION_C'),
(8458, 'caretaker', 'REGISTRATION_R'),
(8459, 'caretaker', 'REGISTRATION_U'),
(8460, 'caretaker', 'REGISTRATION_D'),
(8461, 'caretaker', 'RENT_C'),
(8462, 'caretaker', 'RENT_R'),
(8463, 'caretaker', 'RENT_U'),
(8464, 'caretaker', 'RENT_D'),
(8465, 'caretaker', 'RENTANDSELLS_C'),
(8466, 'caretaker', 'RENTANDSELLS_R'),
(8467, 'caretaker', 'RENTANDSELLS_U'),
(8468, 'caretaker', 'RENTANDSELLS_D'),
(8469, 'caretaker', 'RESULT_C'),
(8470, 'caretaker', 'RESULT_R'),
(8471, 'caretaker', 'RESULT_U'),
(8472, 'caretaker', 'RESULT_D'),
(8473, 'caretaker', 'ROLE_C'),
(8474, 'caretaker', 'ROLE_R'),
(8475, 'caretaker', 'ROLE_U'),
(8476, 'caretaker', 'ROLE_D'),
(8477, 'caretaker', 'SCHOOL_C'),
(8478, 'caretaker', 'SCHOOL_R'),
(8479, 'caretaker', 'SCHOOL_U'),
(8480, 'caretaker', 'SCHOOL_D'),
(8481, 'caretaker', 'SEEPAYMENT_C'),
(8482, 'caretaker', 'SEEPAYMENT_R'),
(8483, 'caretaker', 'SEEPAYMENT_U'),
(8484, 'caretaker', 'SEEPAYMENT_D'),
(8485, 'caretaker', 'SELLS_C'),
(8486, 'caretaker', 'SELLS_R'),
(8487, 'caretaker', 'SELLS_U'),
(8488, 'caretaker', 'SELLS_D'),
(8489, 'caretaker', 'SESSION_C'),
(8490, 'caretaker', 'SESSION_R'),
(8491, 'caretaker', 'SESSION_U'),
(8492, 'caretaker', 'SESSION_D'),
(8493, 'caretaker', 'SETAD_C'),
(8494, 'caretaker', 'SETAD_R'),
(8495, 'caretaker', 'SETAD_U'),
(8496, 'caretaker', 'SETAD_D'),
(8497, 'caretaker', 'SURVEY_C'),
(8498, 'caretaker', 'SURVEY_R'),
(8499, 'caretaker', 'SURVEY_U'),
(8500, 'caretaker', 'SURVEY_D'),
(8501, 'caretaker', 'SURVEY_QUESTION_C'),
(8502, 'caretaker', 'SURVEY_QUESTION_R'),
(8503, 'caretaker', 'SURVEY_QUESTION_U'),
(8504, 'caretaker', 'SURVEY_QUESTION_D'),
(8505, 'caretaker', 'SURVEY_QUESTION_FILLUP_C'),
(8506, 'caretaker', 'SURVEY_QUESTION_FILLUP_R'),
(8507, 'caretaker', 'SURVEY_QUESTION_FILLUP_U'),
(8508, 'caretaker', 'SURVEY_QUESTION_FILLUP_D'),
(8509, 'caretaker', 'SURVEY_QUESTION_TYPE_C'),
(8510, 'caretaker', 'SURVEY_QUESTION_TYPE_R'),
(8511, 'caretaker', 'SURVEY_QUESTION_TYPE_U'),
(8512, 'caretaker', 'SURVEY_QUESTION_TYPE_D'),
(8513, 'caretaker', 'TASK_C'),
(8514, 'caretaker', 'TASK_R'),
(8515, 'caretaker', 'TASK_U'),
(8516, 'caretaker', 'TASK_D'),
(8517, 'caretaker', 'TASK_CATEGORY_C'),
(8518, 'caretaker', 'TASK_CATEGORY_R'),
(8519, 'caretaker', 'TASK_CATEGORY_U'),
(8520, 'caretaker', 'TASK_CATEGORY_D'),
(8521, 'caretaker', 'TERM_C'),
(8522, 'caretaker', 'TERM_R'),
(8523, 'caretaker', 'TERM_U'),
(8524, 'caretaker', 'TERM_D'),
(8525, 'caretaker', 'USER_C'),
(8526, 'caretaker', 'USER_R'),
(8527, 'caretaker', 'USER_U'),
(8528, 'caretaker', 'USER_D'),
(8529, 'caretaker', 'VIDEO_C'),
(8530, 'caretaker', 'VIDEO_R'),
(8531, 'caretaker', 'VIDEO_U'),
(8532, 'caretaker', 'VIDEO_D'),
(8533, 'caretaker', 'VIDEO_COMMENT_C'),
(8534, 'caretaker', 'VIDEO_COMMENT_R'),
(8535, 'caretaker', 'VIDEO_COMMENT_U'),
(8536, 'caretaker', 'VIDEO_COMMENT_D'),
(8537, 'caretaker', 'YEAR_C'),
(8538, 'caretaker', 'YEAR_R'),
(8539, 'caretaker', 'YEAR_U'),
(8540, 'caretaker', 'YEAR_D'),
(8541, 'dailywise worker', 'ATTENDANCE_C'),
(8542, 'dailywise worker', 'ATTENDANCE_R'),
(8543, 'dailywise worker', 'ATTENDANCE_U'),
(8544, 'dailywise worker', 'ATTENDANCE_D'),
(8545, 'dailywise worker', 'CLUB_C'),
(8546, 'dailywise worker', 'CLUB_R'),
(8547, 'dailywise worker', 'CLUB_U'),
(8548, 'dailywise worker', 'CLUB_D'),
(8549, 'dailywise worker', 'COURSE_C'),
(8550, 'dailywise worker', 'COURSE_R'),
(8551, 'dailywise worker', 'COURSE_U'),
(8552, 'dailywise worker', 'COURSE_D'),
(8553, 'dailywise worker', 'COURSE_SESSIONAL_TYPE_C'),
(8554, 'dailywise worker', 'COURSE_SESSIONAL_TYPE_R'),
(8555, 'dailywise worker', 'COURSE_SESSIONAL_TYPE_U'),
(8556, 'dailywise worker', 'COURSE_SESSIONAL_TYPE_D'),
(8557, 'dailywise worker', 'COURSE_TYPE_C'),
(8558, 'dailywise worker', 'COURSE_TYPE_R'),
(8559, 'dailywise worker', 'COURSE_TYPE_U'),
(8560, 'dailywise worker', 'COURSE_TYPE_D'),
(8561, 'dailywise worker', 'DISCIPLINE_C'),
(8562, 'dailywise worker', 'DISCIPLINE_R'),
(8563, 'dailywise worker', 'DISCIPLINE_U'),
(8564, 'dailywise worker', 'DISCIPLINE_D'),
(8565, 'dailywise worker', 'DISCUSSION_C'),
(8566, 'dailywise worker', 'DISCUSSION_R'),
(8567, 'dailywise worker', 'DISCUSSION_U'),
(8568, 'dailywise worker', 'DISCUSSION_D'),
(8569, 'dailywise worker', 'DISCUSSION_CAT_C'),
(8570, 'dailywise worker', 'DISCUSSION_CAT_R'),
(8571, 'dailywise worker', 'DISCUSSION_CAT_U'),
(8572, 'dailywise worker', 'DISCUSSION_CAT_D'),
(8573, 'dailywise worker', 'DISCUSSION_COMMENT_C'),
(8574, 'dailywise worker', 'DISCUSSION_COMMENT_R'),
(8575, 'dailywise worker', 'DISCUSSION_COMMENT_U'),
(8576, 'dailywise worker', 'DISCUSSION_COMMENT_D'),
(8577, 'dailywise worker', 'FILE_C'),
(8578, 'dailywise worker', 'FILE_R'),
(8579, 'dailywise worker', 'FILE_U'),
(8580, 'dailywise worker', 'FILE_D'),
(8581, 'dailywise worker', 'GIVEPAYMENT_C'),
(8582, 'dailywise worker', 'GIVEPAYMENT_R'),
(8583, 'dailywise worker', 'GIVEPAYMENT_U'),
(8584, 'dailywise worker', 'GIVEPAYMENT_D'),
(8585, 'dailywise worker', 'GRADE_SETUP_C'),
(8586, 'dailywise worker', 'GRADE_SETUP_R'),
(8587, 'dailywise worker', 'GRADE_SETUP_U'),
(8588, 'dailywise worker', 'GRADE_SETUP_D'),
(8589, 'dailywise worker', 'JOB_C'),
(8590, 'dailywise worker', 'JOB_R'),
(8591, 'dailywise worker', 'JOB_U'),
(8592, 'dailywise worker', 'JOB_D'),
(8593, 'dailywise worker', 'MANAGEMENT_C'),
(8594, 'dailywise worker', 'MANAGEMENT_R'),
(8595, 'dailywise worker', 'MANAGEMENT_U'),
(8596, 'dailywise worker', 'MANAGEMENT_D'),
(8597, 'dailywise worker', 'MARKS_SETUP_C'),
(8598, 'dailywise worker', 'MARKS_SETUP_R'),
(8599, 'dailywise worker', 'MARKS_SETUP_U'),
(8600, 'dailywise worker', 'MARKS_SETUP_D'),
(8601, 'dailywise worker', 'PERMISSION_C'),
(8602, 'dailywise worker', 'PERMISSION_R'),
(8603, 'dailywise worker', 'PERMISSION_U'),
(8604, 'dailywise worker', 'PERMISSION_D'),
(8605, 'dailywise worker', 'POSITION_C'),
(8606, 'dailywise worker', 'POSITION_R'),
(8607, 'dailywise worker', 'POSITION_U'),
(8608, 'dailywise worker', 'POSITION_D'),
(8609, 'dailywise worker', 'PROJECT_C'),
(8610, 'dailywise worker', 'PROJECT_R'),
(8611, 'dailywise worker', 'PROJECT_U'),
(8612, 'dailywise worker', 'PROJECT_D'),
(8613, 'dailywise worker', 'QUESTION_C'),
(8614, 'dailywise worker', 'QUESTION_R'),
(8615, 'dailywise worker', 'QUESTION_U'),
(8616, 'dailywise worker', 'QUESTION_D'),
(8617, 'dailywise worker', 'REGISTRATION_C'),
(8618, 'dailywise worker', 'REGISTRATION_R'),
(8619, 'dailywise worker', 'REGISTRATION_U'),
(8620, 'dailywise worker', 'REGISTRATION_D'),
(8621, 'dailywise worker', 'RENT_C'),
(8622, 'dailywise worker', 'RENT_R'),
(8623, 'dailywise worker', 'RENT_U'),
(8624, 'dailywise worker', 'RENT_D'),
(8625, 'dailywise worker', 'RENTANDSELLS_C'),
(8626, 'dailywise worker', 'RENTANDSELLS_R'),
(8627, 'dailywise worker', 'RENTANDSELLS_U'),
(8628, 'dailywise worker', 'RENTANDSELLS_D'),
(8629, 'dailywise worker', 'RESULT_C'),
(8630, 'dailywise worker', 'RESULT_R'),
(8631, 'dailywise worker', 'RESULT_U'),
(8632, 'dailywise worker', 'RESULT_D'),
(8633, 'dailywise worker', 'ROLE_C'),
(8634, 'dailywise worker', 'ROLE_R'),
(8635, 'dailywise worker', 'ROLE_U'),
(8636, 'dailywise worker', 'ROLE_D'),
(8637, 'dailywise worker', 'SCHOOL_C'),
(8638, 'dailywise worker', 'SCHOOL_R'),
(8639, 'dailywise worker', 'SCHOOL_U'),
(8640, 'dailywise worker', 'SCHOOL_D'),
(8641, 'dailywise worker', 'SEEPAYMENT_C'),
(8642, 'dailywise worker', 'SEEPAYMENT_R'),
(8643, 'dailywise worker', 'SEEPAYMENT_U'),
(8644, 'dailywise worker', 'SEEPAYMENT_D'),
(8645, 'dailywise worker', 'SELLS_C'),
(8646, 'dailywise worker', 'SELLS_R'),
(8647, 'dailywise worker', 'SELLS_U'),
(8648, 'dailywise worker', 'SELLS_D'),
(8649, 'dailywise worker', 'SESSION_C'),
(8650, 'dailywise worker', 'SESSION_R'),
(8651, 'dailywise worker', 'SESSION_U'),
(8652, 'dailywise worker', 'SESSION_D'),
(8653, 'dailywise worker', 'SETAD_C'),
(8654, 'dailywise worker', 'SETAD_R'),
(8655, 'dailywise worker', 'SETAD_U'),
(8656, 'dailywise worker', 'SETAD_D'),
(8657, 'dailywise worker', 'SURVEY_C'),
(8658, 'dailywise worker', 'SURVEY_R'),
(8659, 'dailywise worker', 'SURVEY_U'),
(8660, 'dailywise worker', 'SURVEY_D'),
(8661, 'dailywise worker', 'SURVEY_QUESTION_C'),
(8662, 'dailywise worker', 'SURVEY_QUESTION_R'),
(8663, 'dailywise worker', 'SURVEY_QUESTION_U'),
(8664, 'dailywise worker', 'SURVEY_QUESTION_D'),
(8665, 'dailywise worker', 'SURVEY_QUESTION_FILLUP_C'),
(8666, 'dailywise worker', 'SURVEY_QUESTION_FILLUP_R'),
(8667, 'dailywise worker', 'SURVEY_QUESTION_FILLUP_U'),
(8668, 'dailywise worker', 'SURVEY_QUESTION_FILLUP_D'),
(8669, 'dailywise worker', 'SURVEY_QUESTION_TYPE_C'),
(8670, 'dailywise worker', 'SURVEY_QUESTION_TYPE_R'),
(8671, 'dailywise worker', 'SURVEY_QUESTION_TYPE_U'),
(8672, 'dailywise worker', 'SURVEY_QUESTION_TYPE_D'),
(8673, 'dailywise worker', 'TASK_C'),
(8674, 'dailywise worker', 'TASK_R'),
(8675, 'dailywise worker', 'TASK_U'),
(8676, 'dailywise worker', 'TASK_D'),
(8677, 'dailywise worker', 'TASK_CATEGORY_C'),
(8678, 'dailywise worker', 'TASK_CATEGORY_R'),
(8679, 'dailywise worker', 'TASK_CATEGORY_U'),
(8680, 'dailywise worker', 'TASK_CATEGORY_D'),
(8681, 'dailywise worker', 'TERM_C'),
(8682, 'dailywise worker', 'TERM_R'),
(8683, 'dailywise worker', 'TERM_U'),
(8684, 'dailywise worker', 'TERM_D'),
(8685, 'dailywise worker', 'USER_C'),
(8686, 'dailywise worker', 'USER_R'),
(8687, 'dailywise worker', 'USER_U'),
(8688, 'dailywise worker', 'USER_D'),
(8689, 'dailywise worker', 'VIDEO_C'),
(8690, 'dailywise worker', 'VIDEO_R'),
(8691, 'dailywise worker', 'VIDEO_U'),
(8692, 'dailywise worker', 'VIDEO_D'),
(8693, 'dailywise worker', 'VIDEO_COMMENT_C'),
(8694, 'dailywise worker', 'VIDEO_COMMENT_R'),
(8695, 'dailywise worker', 'VIDEO_COMMENT_U'),
(8696, 'dailywise worker', 'VIDEO_COMMENT_D'),
(8697, 'dailywise worker', 'YEAR_C'),
(8698, 'dailywise worker', 'YEAR_R'),
(8699, 'dailywise worker', 'YEAR_U'),
(8700, 'dailywise worker', 'YEAR_D'),
(9181, 'security guard', 'ATTENDANCE_C'),
(9182, 'security guard', 'ATTENDANCE_R'),
(9183, 'security guard', 'ATTENDANCE_U'),
(9184, 'security guard', 'ATTENDANCE_D'),
(9185, 'security guard', 'CLUB_C'),
(9186, 'security guard', 'CLUB_R'),
(9187, 'security guard', 'CLUB_U'),
(9188, 'security guard', 'CLUB_D'),
(9189, 'security guard', 'COURSE_C'),
(9190, 'security guard', 'COURSE_R'),
(9191, 'security guard', 'COURSE_U'),
(9192, 'security guard', 'COURSE_D'),
(9193, 'security guard', 'COURSE_SESSIONAL_TYPE_C'),
(9194, 'security guard', 'COURSE_SESSIONAL_TYPE_R'),
(9195, 'security guard', 'COURSE_SESSIONAL_TYPE_U'),
(9196, 'security guard', 'COURSE_SESSIONAL_TYPE_D'),
(9197, 'security guard', 'COURSE_TYPE_C'),
(9198, 'security guard', 'COURSE_TYPE_R'),
(9199, 'security guard', 'COURSE_TYPE_U'),
(9200, 'security guard', 'COURSE_TYPE_D'),
(9201, 'security guard', 'DISCIPLINE_C'),
(9202, 'security guard', 'DISCIPLINE_R'),
(9203, 'security guard', 'DISCIPLINE_U'),
(9204, 'security guard', 'DISCIPLINE_D'),
(9205, 'security guard', 'DISCUSSION_C'),
(9206, 'security guard', 'DISCUSSION_R'),
(9207, 'security guard', 'DISCUSSION_U'),
(9208, 'security guard', 'DISCUSSION_D'),
(9209, 'security guard', 'DISCUSSION_CAT_C'),
(9210, 'security guard', 'DISCUSSION_CAT_R'),
(9211, 'security guard', 'DISCUSSION_CAT_U'),
(9212, 'security guard', 'DISCUSSION_CAT_D'),
(9213, 'security guard', 'DISCUSSION_COMMENT_C'),
(9214, 'security guard', 'DISCUSSION_COMMENT_R'),
(9215, 'security guard', 'DISCUSSION_COMMENT_U'),
(9216, 'security guard', 'DISCUSSION_COMMENT_D'),
(9217, 'security guard', 'FILE_C'),
(9218, 'security guard', 'FILE_R'),
(9219, 'security guard', 'FILE_U'),
(9220, 'security guard', 'FILE_D'),
(9221, 'security guard', 'GIVEPAYMENT_C'),
(9222, 'security guard', 'GIVEPAYMENT_R'),
(9223, 'security guard', 'GIVEPAYMENT_U'),
(9224, 'security guard', 'GIVEPAYMENT_D'),
(9225, 'security guard', 'GRADE_SETUP_C'),
(9226, 'security guard', 'GRADE_SETUP_R'),
(9227, 'security guard', 'GRADE_SETUP_U'),
(9228, 'security guard', 'GRADE_SETUP_D'),
(9229, 'security guard', 'JOB_C'),
(9230, 'security guard', 'JOB_R'),
(9231, 'security guard', 'JOB_U'),
(9232, 'security guard', 'JOB_D'),
(9233, 'security guard', 'MANAGEMENT_C'),
(9234, 'security guard', 'MANAGEMENT_R'),
(9235, 'security guard', 'MANAGEMENT_U'),
(9236, 'security guard', 'MANAGEMENT_D'),
(9237, 'security guard', 'MARKS_SETUP_C'),
(9238, 'security guard', 'MARKS_SETUP_R'),
(9239, 'security guard', 'MARKS_SETUP_U'),
(9240, 'security guard', 'MARKS_SETUP_D'),
(9241, 'security guard', 'PERMISSION_C'),
(9242, 'security guard', 'PERMISSION_R'),
(9243, 'security guard', 'PERMISSION_U'),
(9244, 'security guard', 'PERMISSION_D'),
(9245, 'security guard', 'POSITION_C'),
(9246, 'security guard', 'POSITION_R'),
(9247, 'security guard', 'POSITION_U'),
(9248, 'security guard', 'POSITION_D'),
(9249, 'security guard', 'PROJECT_C'),
(9250, 'security guard', 'PROJECT_R'),
(9251, 'security guard', 'PROJECT_U'),
(9252, 'security guard', 'PROJECT_D'),
(9253, 'security guard', 'QUESTION_C'),
(9254, 'security guard', 'QUESTION_R'),
(9255, 'security guard', 'QUESTION_U'),
(9256, 'security guard', 'QUESTION_D'),
(9257, 'security guard', 'REGISTRATION_C'),
(9258, 'security guard', 'REGISTRATION_R'),
(9259, 'security guard', 'REGISTRATION_U'),
(9260, 'security guard', 'REGISTRATION_D'),
(9261, 'security guard', 'RENT_C'),
(9262, 'security guard', 'RENT_R'),
(9263, 'security guard', 'RENT_U'),
(9264, 'security guard', 'RENT_D'),
(9265, 'security guard', 'RENTANDSELLS_C'),
(9266, 'security guard', 'RENTANDSELLS_R'),
(9267, 'security guard', 'RENTANDSELLS_U'),
(9268, 'security guard', 'RENTANDSELLS_D'),
(9269, 'security guard', 'RESULT_C'),
(9270, 'security guard', 'RESULT_R'),
(9271, 'security guard', 'RESULT_U'),
(9272, 'security guard', 'RESULT_D'),
(9273, 'security guard', 'ROLE_C'),
(9274, 'security guard', 'ROLE_R'),
(9275, 'security guard', 'ROLE_U'),
(9276, 'security guard', 'ROLE_D'),
(9277, 'security guard', 'SCHOOL_C'),
(9278, 'security guard', 'SCHOOL_R'),
(9279, 'security guard', 'SCHOOL_U'),
(9280, 'security guard', 'SCHOOL_D'),
(9281, 'security guard', 'SEEPAYMENT_C'),
(9282, 'security guard', 'SEEPAYMENT_R'),
(9283, 'security guard', 'SEEPAYMENT_U'),
(9284, 'security guard', 'SEEPAYMENT_D'),
(9285, 'security guard', 'SELLS_C'),
(9286, 'security guard', 'SELLS_R'),
(9287, 'security guard', 'SELLS_U'),
(9288, 'security guard', 'SELLS_D'),
(9289, 'security guard', 'SESSION_C'),
(9290, 'security guard', 'SESSION_R'),
(9291, 'security guard', 'SESSION_U'),
(9292, 'security guard', 'SESSION_D'),
(9293, 'security guard', 'SETAD_C'),
(9294, 'security guard', 'SETAD_R'),
(9295, 'security guard', 'SETAD_U'),
(9296, 'security guard', 'SETAD_D'),
(9297, 'security guard', 'SURVEY_C'),
(9298, 'security guard', 'SURVEY_R'),
(9299, 'security guard', 'SURVEY_U'),
(9300, 'security guard', 'SURVEY_D'),
(9301, 'security guard', 'SURVEY_QUESTION_C'),
(9302, 'security guard', 'SURVEY_QUESTION_R'),
(9303, 'security guard', 'SURVEY_QUESTION_U'),
(9304, 'security guard', 'SURVEY_QUESTION_D'),
(9305, 'security guard', 'SURVEY_QUESTION_FILLUP_C'),
(9306, 'security guard', 'SURVEY_QUESTION_FILLUP_R'),
(9307, 'security guard', 'SURVEY_QUESTION_FILLUP_U'),
(9308, 'security guard', 'SURVEY_QUESTION_FILLUP_D'),
(9309, 'security guard', 'SURVEY_QUESTION_TYPE_C'),
(9310, 'security guard', 'SURVEY_QUESTION_TYPE_R'),
(9311, 'security guard', 'SURVEY_QUESTION_TYPE_U'),
(9312, 'security guard', 'SURVEY_QUESTION_TYPE_D'),
(9313, 'security guard', 'TASK_C'),
(9314, 'security guard', 'TASK_R'),
(9315, 'security guard', 'TASK_U'),
(9316, 'security guard', 'TASK_D'),
(9317, 'security guard', 'TASK_CATEGORY_C'),
(9318, 'security guard', 'TASK_CATEGORY_R'),
(9319, 'security guard', 'TASK_CATEGORY_U'),
(9320, 'security guard', 'TASK_CATEGORY_D'),
(9321, 'security guard', 'TERM_C'),
(9322, 'security guard', 'TERM_R'),
(9323, 'security guard', 'TERM_U'),
(9324, 'security guard', 'TERM_D'),
(9325, 'security guard', 'USER_C'),
(9326, 'security guard', 'USER_R'),
(9327, 'security guard', 'USER_U'),
(9328, 'security guard', 'USER_D'),
(9329, 'security guard', 'VIDEO_C'),
(9330, 'security guard', 'VIDEO_R'),
(9331, 'security guard', 'VIDEO_U'),
(9332, 'security guard', 'VIDEO_D'),
(9333, 'security guard', 'VIDEO_COMMENT_C'),
(9334, 'security guard', 'VIDEO_COMMENT_R'),
(9335, 'security guard', 'VIDEO_COMMENT_U'),
(9336, 'security guard', 'VIDEO_COMMENT_D'),
(9337, 'security guard', 'YEAR_C'),
(9338, 'security guard', 'YEAR_R'),
(9339, 'security guard', 'YEAR_U'),
(9340, 'security guard', 'YEAR_D'),
(9838, 'renter', 'GIVEPAYMENT_C'),
(9839, 'renter', 'GIVEPAYMENT_R'),
(9840, 'renter', 'GIVEPAYMENT_U'),
(9841, 'renter', 'GIVEPAYMENT_D'),
(9842, 'renter', 'RENT_C'),
(9843, 'renter', 'RENT_R'),
(9844, 'renter', 'RENT_U'),
(9845, 'renter', 'RENT_D'),
(9846, 'renter', 'RENTANDSELLS_C'),
(9847, 'renter', 'RENTANDSELLS_R'),
(9848, 'renter', 'RENTANDSELLS_U'),
(9849, 'renter', 'RENTANDSELLS_D'),
(9850, 'renter', 'SELLS_C'),
(9851, 'renter', 'SELLS_R'),
(9852, 'renter', 'SELLS_U'),
(9853, 'renter', 'SELLS_D'),
(9854, 'renter', 'USER_R'),
(11339, 'admin', 'ATTENDANCE_C'),
(11340, 'admin', 'ATTENDANCE_R'),
(11341, 'admin', 'ATTENDANCE_U'),
(11342, 'admin', 'ATTENDANCE_D'),
(11343, 'admin', 'CLUB_C'),
(11344, 'admin', 'CLUB_R'),
(11345, 'admin', 'CLUB_U'),
(11346, 'admin', 'CLUB_D'),
(11347, 'admin', 'COURSE_C'),
(11348, 'admin', 'COURSE_R'),
(11349, 'admin', 'COURSE_U'),
(11350, 'admin', 'COURSE_D'),
(11351, 'admin', 'COURSE_SESSIONAL_TYPE_C'),
(11352, 'admin', 'COURSE_SESSIONAL_TYPE_R'),
(11353, 'admin', 'COURSE_SESSIONAL_TYPE_U'),
(11354, 'admin', 'COURSE_SESSIONAL_TYPE_D'),
(11355, 'admin', 'COURSE_TYPE_C'),
(11356, 'admin', 'COURSE_TYPE_R'),
(11357, 'admin', 'COURSE_TYPE_U'),
(11358, 'admin', 'COURSE_TYPE_D'),
(11359, 'admin', 'DISCIPLINE_C'),
(11360, 'admin', 'DISCIPLINE_R'),
(11361, 'admin', 'DISCIPLINE_U'),
(11362, 'admin', 'DISCIPLINE_D'),
(11363, 'admin', 'DISCUSSION_C'),
(11364, 'admin', 'DISCUSSION_R'),
(11365, 'admin', 'DISCUSSION_U'),
(11366, 'admin', 'DISCUSSION_D'),
(11367, 'admin', 'DISCUSSION_CAT_C'),
(11368, 'admin', 'DISCUSSION_CAT_R'),
(11369, 'admin', 'DISCUSSION_CAT_U'),
(11370, 'admin', 'DISCUSSION_CAT_D'),
(11371, 'admin', 'DISCUSSION_COMMENT_C'),
(11372, 'admin', 'DISCUSSION_COMMENT_R'),
(11373, 'admin', 'DISCUSSION_COMMENT_U'),
(11374, 'admin', 'DISCUSSION_COMMENT_D'),
(11375, 'admin', 'FILE_C'),
(11376, 'admin', 'FILE_R'),
(11377, 'admin', 'FILE_U'),
(11378, 'admin', 'FILE_D'),
(11379, 'admin', 'GRADE_SETUP_C'),
(11380, 'admin', 'GRADE_SETUP_R'),
(11381, 'admin', 'GRADE_SETUP_U'),
(11382, 'admin', 'GRADE_SETUP_D'),
(11383, 'admin', 'JOB_C'),
(11384, 'admin', 'JOB_R'),
(11385, 'admin', 'JOB_U'),
(11386, 'admin', 'JOB_D'),
(11387, 'admin', 'MARKS_SETUP_C'),
(11388, 'admin', 'MARKS_SETUP_R'),
(11389, 'admin', 'MARKS_SETUP_U'),
(11390, 'admin', 'MARKS_SETUP_D'),
(11391, 'admin', 'PERMISSION_C'),
(11392, 'admin', 'PERMISSION_R'),
(11393, 'admin', 'PERMISSION_U'),
(11394, 'admin', 'PERMISSION_D'),
(11395, 'admin', 'POSITION_C'),
(11396, 'admin', 'POSITION_R'),
(11397, 'admin', 'POSITION_U'),
(11398, 'admin', 'POSITION_D'),
(11399, 'admin', 'PROJECT_C'),
(11400, 'admin', 'PROJECT_R'),
(11401, 'admin', 'PROJECT_U'),
(11402, 'admin', 'PROJECT_D'),
(11403, 'admin', 'QUESTION_C'),
(11404, 'admin', 'QUESTION_R'),
(11405, 'admin', 'QUESTION_U'),
(11406, 'admin', 'QUESTION_D'),
(11407, 'admin', 'REGISTRATION_C'),
(11408, 'admin', 'REGISTRATION_R'),
(11409, 'admin', 'REGISTRATION_U'),
(11410, 'admin', 'REGISTRATION_D'),
(11411, 'admin', 'RENT_C'),
(11412, 'admin', 'RENT_R'),
(11413, 'admin', 'RENT_U'),
(11414, 'admin', 'RENT_D'),
(11415, 'admin', 'RENTANDSELLS_C'),
(11416, 'admin', 'RENTANDSELLS_R'),
(11417, 'admin', 'RENTANDSELLS_U'),
(11418, 'admin', 'RENTANDSELLS_D'),
(11419, 'admin', 'RESULT_C'),
(11420, 'admin', 'RESULT_R'),
(11421, 'admin', 'RESULT_U'),
(11422, 'admin', 'RESULT_D'),
(11423, 'admin', 'ROLE_C'),
(11424, 'admin', 'ROLE_R'),
(11425, 'admin', 'ROLE_U'),
(11426, 'admin', 'ROLE_D'),
(11427, 'admin', 'SCHOOL_C'),
(11428, 'admin', 'SCHOOL_R'),
(11429, 'admin', 'SCHOOL_U'),
(11430, 'admin', 'SCHOOL_D'),
(11431, 'admin', 'SELLS_C'),
(11432, 'admin', 'SELLS_R'),
(11433, 'admin', 'SELLS_U'),
(11434, 'admin', 'SELLS_D'),
(11435, 'admin', 'SESSION_C'),
(11436, 'admin', 'SESSION_R'),
(11437, 'admin', 'SESSION_U'),
(11438, 'admin', 'SESSION_D'),
(11439, 'admin', 'SETAD_C'),
(11440, 'admin', 'SETAD_R'),
(11441, 'admin', 'SETAD_U'),
(11442, 'admin', 'SETAD_D'),
(11443, 'admin', 'SURVEY_C'),
(11444, 'admin', 'SURVEY_R'),
(11445, 'admin', 'SURVEY_U'),
(11446, 'admin', 'SURVEY_D'),
(11447, 'admin', 'SURVEY_QUESTION_C'),
(11448, 'admin', 'SURVEY_QUESTION_R'),
(11449, 'admin', 'SURVEY_QUESTION_U'),
(11450, 'admin', 'SURVEY_QUESTION_D'),
(11451, 'admin', 'SURVEY_QUESTION_FILLUP_C'),
(11452, 'admin', 'SURVEY_QUESTION_FILLUP_R'),
(11453, 'admin', 'SURVEY_QUESTION_FILLUP_U'),
(11454, 'admin', 'SURVEY_QUESTION_FILLUP_D'),
(11455, 'admin', 'SURVEY_QUESTION_TYPE_C'),
(11456, 'admin', 'SURVEY_QUESTION_TYPE_R'),
(11457, 'admin', 'SURVEY_QUESTION_TYPE_U'),
(11458, 'admin', 'SURVEY_QUESTION_TYPE_D'),
(11459, 'admin', 'TASK_C'),
(11460, 'admin', 'TASK_R'),
(11461, 'admin', 'TASK_U'),
(11462, 'admin', 'TASK_D'),
(11463, 'admin', 'TASK_CATEGORY_C'),
(11464, 'admin', 'TASK_CATEGORY_R'),
(11465, 'admin', 'TASK_CATEGORY_U'),
(11466, 'admin', 'TASK_CATEGORY_D'),
(11467, 'admin', 'TERM_C'),
(11468, 'admin', 'TERM_R'),
(11469, 'admin', 'TERM_U'),
(11470, 'admin', 'TERM_D'),
(11471, 'admin', 'USER_C'),
(11472, 'admin', 'USER_R'),
(11473, 'admin', 'USER_U'),
(11474, 'admin', 'USER_D'),
(11475, 'admin', 'VIDEO_C'),
(11476, 'admin', 'VIDEO_R'),
(11477, 'admin', 'VIDEO_U'),
(11478, 'admin', 'VIDEO_D'),
(11479, 'admin', 'VIDEO_COMMENT_C'),
(11480, 'admin', 'VIDEO_COMMENT_R'),
(11481, 'admin', 'VIDEO_COMMENT_U'),
(11482, 'admin', 'VIDEO_COMMENT_D'),
(11483, 'admin', 'YEAR_C'),
(11484, 'admin', 'YEAR_R'),
(11485, 'admin', 'YEAR_U'),
(11486, 'admin', 'YEAR_D'),
(11645, 'owner', 'GIVEPAYMENT_C'),
(11646, 'owner', 'GIVEPAYMENT_R'),
(11647, 'owner', 'GIVEPAYMENT_U'),
(11648, 'owner', 'GIVEPAYMENT_D'),
(11649, 'owner', 'MANAGEMENT_C'),
(11650, 'owner', 'MANAGEMENT_R'),
(11651, 'owner', 'MANAGEMENT_U'),
(11652, 'owner', 'MANAGEMENT_D'),
(11653, 'owner', 'RENT_C'),
(11654, 'owner', 'RENT_R'),
(11655, 'owner', 'RENT_U'),
(11656, 'owner', 'RENT_D'),
(11657, 'owner', 'RENTANDSELLS_C'),
(11658, 'owner', 'RENTANDSELLS_R'),
(11659, 'owner', 'RENTANDSELLS_U'),
(11660, 'owner', 'RENTANDSELLS_D'),
(11661, 'owner', 'SEEPAYMENT_C'),
(11662, 'owner', 'SEEPAYMENT_R'),
(11663, 'owner', 'SEEPAYMENT_U'),
(11664, 'owner', 'SEEPAYMENT_D'),
(11665, 'owner', 'SELLS_C'),
(11666, 'owner', 'SELLS_R'),
(11667, 'owner', 'SELLS_U'),
(11668, 'owner', 'SELLS_D'),
(11669, 'owner', 'SETAD_C'),
(11670, 'owner', 'SETAD_R'),
(11671, 'owner', 'SETAD_U'),
(11672, 'owner', 'SETAD_D'),
(11673, 'owner', 'USER_R');

-- --------------------------------------------------------

--
-- Table structure for table `ums_school`
--

DROP TABLE IF EXISTS `ums_school`;
CREATE TABLE IF NOT EXISTS `ums_school` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DeanID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_school`
--

INSERT INTO `ums_school` (`ID`, `Name`, `DeanID`) VALUES
('{39DDC0C2-CFC2-4246-8748-8812B1751A5C}', 'Akash Housing', ''),
('{879375F7-0A15-4705-AC90-C6786D279EF1}', 'Khulna housing', '');

-- --------------------------------------------------------

--
-- Table structure for table `ums_user`
--

DROP TABLE IF EXISTS `ums_user`;
CREATE TABLE IF NOT EXISTS `ums_user` (
  `ID` varchar(40) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DisciplineID` varchar(40) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `IsLogged` varchar(10) DEFAULT NULL,
  `IsArchived` varchar(10) DEFAULT NULL,
  `IsDeleted` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user`
--

INSERT INTO `ums_user` (`ID`, `Email`, `Password`, `FirstName`, `MiddleName`, `LastName`, `DisciplineID`, `company`, `Role`, `Status`, `IsLogged`, `IsArchived`, `IsDeleted`) VALUES
('a@gmail.com', 'a@gmail.com', '$2y$10$GoWldwwdTml13FhfRTpYQ.sBNVCxaeQKLJsGQEGsTtM8DzXCdluae', 'admin', '', '1', '', 'Akash Housing', 'admin', 'approved', NULL, NULL, NULL),
('aaaa@gmail.com', 'aaaa@gmail.com', '$2y$10$CQif1uTt2JUQe7jdrKy9euw0y6kInKV5eK9aJ0m.aZFo1bnmIl39i', 'admin', '', '2', '', 'Asif Housing', 'admin', 'approved', NULL, NULL, NULL),
('akash@gmail.com', 'akash@gmail.com', '$2y$10$0hJeQSG2iLw5.qzqYAPl8.l1m6awzh.q/Y2knp0Aw1KSwa7aqjPpO', 'akash', '', 'owner', '', 'Akash Housing', 'owner', 'approved', NULL, NULL, NULL),
('asif@gmail.com', 'asif@gmail.com', '$2y$10$2iaYvvyJ4Y0eATnLPynhdu1g8/Vn/sPYHg6BKe9qchXkpPaC6rq.a', 'asif', '', 'ahmed', '', 'Asif Housing', 'owner', 'approved', NULL, NULL, NULL),
('danny@gmail.com', 'danny@gmail.com', '$2y$10$nMm2APNBdnwRtAfS.teT8ukOyRIguYWYCypNj3R22lmWrKftK3NEe', 'danny', '', 'renter', '', 'Akash Housing', 'renter', 'approved', NULL, NULL, NULL),
('e@a.c', 'e@a.c', '$2y$10$7BFS87H2MhC2Ad6U57Fr2uB3sEldsklBZkhis/VHrleAX98eF8Gk.', 'e', '', 'e', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'Asif Housing', 'admin', 'pending', NULL, NULL, '1'),
('sujana@gmail.com', 'sujana@gmail.com', '$2y$10$y64fvuOJzzNrzAwLzI/SX.zcJsoch0b2SMfm5l/oPTq1lAyH8O.dK', 'sujana', '', 'saha', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'Akash Housing', 'renter', 'approved', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_details`
--

DROP TABLE IF EXISTS `ums_user_details`;
CREATE TABLE IF NOT EXISTS `ums_user_details` (
  `ID` varchar(40) NOT NULL,
  `FatherName` varchar(100) DEFAULT NULL,
  `MotherName` varchar(100) DEFAULT NULL,
  `PermanentAddress` varchar(200) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `CurrentAddress` varchar(200) DEFAULT NULL,
  `MobilePhone` varchar(20) DEFAULT NULL,
  `blood_group` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_details`
--

INSERT INTO `ums_user_details` (`ID`, `FatherName`, `MotherName`, `PermanentAddress`, `HomePhone`, `CurrentAddress`, `MobilePhone`, `blood_group`) VALUES
('a@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('aaaa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('akash@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('asif@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('danny@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('e@a.c', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('sujana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_discipline`
--

DROP TABLE IF EXISTS `ums_user_discipline`;
CREATE TABLE IF NOT EXISTS `ums_user_discipline` (
  `UserID` varchar(40) NOT NULL,
  `DisciplineID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_position`
--

DROP TABLE IF EXISTS `ums_user_position`;
CREATE TABLE IF NOT EXISTS `ums_user_position` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(40) NOT NULL,
  `PositionID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_position`
--

INSERT INTO `ums_user_position` (`ID`, `UserID`, `PositionID`) VALUES
(50, 'aysha@gmail.com', '{7CDA1F32-A2F8-4469-B5A8-C2038FCE1F9A}'),
(56, 'anoy@gmail.com', '{64D25DDA-16B6-47B8-BBFC-4E2AAF5680C7}');

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_role`
--

DROP TABLE IF EXISTS `ums_user_role`;
CREATE TABLE IF NOT EXISTS `ums_user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(40) NOT NULL,
  `RoleID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_role`
--

INSERT INTO `ums_user_role` (`ID`, `UserID`, `RoleID`) VALUES
(122, 'middle@test.com', 'student'),
(123, 'middle@test.com', 'student'),
(124, 'middle@test.com', 'student'),
(125, 'middle@test.com', 'student'),
(126, 'middle@test.com', 'student'),
(127, 'middle@test.com', 'student'),
(128, 'middle@test.com', 'student'),
(129, 'middle@test.com', 'student'),
(130, 'middle@test.com', 'student'),
(131, 'middle@test.com', 'student'),
(132, 'middle@test.com', 'student'),
(133, 'middle@test.com', 'student'),
(134, 'middle@test.com', 'student'),
(135, 'middle@test.com', 'student'),
(136, 'middle@test.com', 'student'),
(137, 'middle@test.com', 'student'),
(138, 'middle@test.com', 'student'),
(144, 'middle1@test.com', 'student'),
(186, 'anoy@gmail.com', 'administrator'),
(194, 'c@gmail.com', 'owner'),
(202, 'sujana@gmail.com', 'renter'),
(215, 'asif@gmail.com', 'owner'),
(219, 'aaaa@gmail.com', 'admin'),
(221, 'akash@gmail.com', 'owner'),
(223, 'danny@gmail.com', 'renter'),
(224, 'a@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `vtms_video`
--

DROP TABLE IF EXISTS `vtms_video`;
CREATE TABLE IF NOT EXISTS `vtms_video` (
  `ID` varchar(40) NOT NULL,
  `Title` varchar(1500) NOT NULL,
  `Description` varchar(1500) NOT NULL,
  `TagID` varchar(40) NOT NULL,
  `Link` varchar(150) NOT NULL,
  `IsEmbed` tinyint(1) NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `CreatorID` varchar(40) NOT NULL,
  `Views` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vtms_video`
--

INSERT INTO `vtms_video` (`ID`, `Title`, `Description`, `TagID`, `Link`, `IsEmbed`, `CreationDate`, `CreatorID`, `Views`) VALUES
('{27438FB4-1128-4F81-B55A-2A7AF4EC669C}', 'How to learn coding language or programming language easily.', 'Hey whats up guys in today\'s video I\'ll show you that how can you learn coding language o', 'programmig', 'https://www.youtube.com/watch?v=VZzaqgxyHJs', 0, '2019-04-11 13:26:46', 'mkazi078@uottawa.ca', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtms_video_comment`
--

DROP TABLE IF EXISTS `vtms_video_comment`;
CREATE TABLE IF NOT EXISTS `vtms_video_comment` (
  `CommentID` varchar(40) NOT NULL,
  `Comment` varchar(1500) NOT NULL,
  `CreatorID` varchar(40) NOT NULL,
  `VideoID` varchar(40) NOT NULL,
  `CommentIDTop` varchar(40) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vtms_video_comment`
--

INSERT INTO `vtms_video_comment` (`CommentID`, `Comment`, `CreatorID`, `VideoID`, `CommentIDTop`, `CreationDate`) VALUES
('{138A18E4-CBBD-4E61-9C22-76353363B917}', 'dfd', 'mkazi078@uottawa.ca', '{27438FB4-1128-4F81-B55A-2A7AF4EC669C}', '0', '2019-04-11 13:27:01'),
('{C7D8F7AE-B5C2-4342-892C-E9F5EA249214}', 'ghjgj', 'mkazi078@uottawa.ca', '{27438FB4-1128-4F81-B55A-2A7AF4EC669C}', '{138A18E4-CBBD-4E61-9C22-76353363B917}', '2019-04-11 13:27:07');

-- --------------------------------------------------------

--
-- Table structure for table `vtms_video_tag`
--

DROP TABLE IF EXISTS `vtms_video_tag`;
CREATE TABLE IF NOT EXISTS `vtms_video_tag` (
  `VideoID` varchar(40) NOT NULL,
  `Tag` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tms_link_thesis`
--
ALTER TABLE `tms_link_thesis`
  ADD CONSTRAINT `tms_link_thesis_ibfk_1` FOREIGN KEY (`thesis_id`) REFERENCES `tms_thesis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
