-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 27, 2019 at 06:09 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

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
('35', 'ryhan@gmail.com', 'avi@gmail.com', '2018-10-09', '  Do study                \r\n                ', 1),
('1551207935', 'avi@gmail.com', 'ryhan1630@cseku.ac.bd', '2019-02-26', '  ttt            		\r\n              	', 1),
('1551247379', 'avi@gmail.com', 'mkazi078@uottawa.ca', '2019-02-27', 'test              		\r\n              	', 1);

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
('1551207935', 'test', 'ryhan1630@cseku.ac.bd', 'Office', '2019-02-26', '2019-02-28', '2019-02-26', 1, 'test', '1551207935.txt'),
('1551247379', 'test', 'mkazi078@uottawa.ca', 'Study', '2019-02-27', '2019-02-14', '2019-02-27', 1, 'test', '1551247379.txt');

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
('{0CF37516-06FE-41CD-93AD-D2D1652509D6}', 'Mathematics', 'MATH', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}'),
('{560A0FC0-6221-497D-8D41-E584EE4BBEE3}', 'Architecture', 'ARCH', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}'),
('{63F3C00B-6168-4FBD-AB01-7A1FE413BDDE}', 'Forestry and Wood Technology', 'FWT', '{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}'),
('{AF41CC9F-3BCD-4952-9D02-17184CC40C79}', 'Urban and Rural Planning', 'URP', '{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}'),
('{E065BBA7-D0C5-4DFA-9768-81B6F056EB4A}', 'Foresty and Marine Resource Technology', 'FMRT', '{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}'),
('{E7280448-E379-424E-A11D-357F4334AC8D}', 'Physics', 'PHY', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}'),
('{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'Computer Science and Engineering', 'CSE', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}');

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
) ENGINE=InnoDB AUTO_INCREMENT=5105 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_permission`
--

INSERT INTO `ums_permission` (`TableID`, `ID`, `Name`, `Category`) VALUES
(4973, 'COURSE_C', 'COURSE_C', 'COURSE'),
(4974, 'COURSE_R', 'COURSE_R', 'COURSE'),
(4975, 'COURSE_U', 'COURSE_U', 'COURSE'),
(4976, 'COURSE_D', 'COURSE_D', 'COURSE'),
(4977, 'COURSE_TYPE_C', 'COURSE_TYPE_C', 'COURSE TYPE'),
(4978, 'COURSE_TYPE_R', 'COURSE_TYPE_R', 'COURSE TYPE'),
(4979, 'COURSE_TYPE_U', 'COURSE_TYPE_U', 'COURSE TYPE'),
(4980, 'COURSE_TYPE_D', 'COURSE_TYPE_D', 'COURSE TYPE'),
(4981, 'COURSE_SESSIONAL_TYPE_C', 'COURSE_SESSIONAL_TYPE_C', 'COURSE SESSIONAL TYPE'),
(4982, 'COURSE_SESSIONAL_TYPE_R', 'COURSE_SESSIONAL_TYPE_R', 'COURSE SESSIONAL TYPE'),
(4983, 'COURSE_SESSIONAL_TYPE_U', 'COURSE_SESSIONAL_TYPE_U', 'COURSE SESSIONAL TYPE'),
(4984, 'COURSE_SESSIONAL_TYPE_D', 'COURSE_SESSIONAL_TYPE_D', 'COURSE SESSIONAL TYPE'),
(4985, 'DISCIPLINE_C', 'DISCIPLINE_C', 'DISCIPLINE'),
(4986, 'DISCIPLINE_R', 'DISCIPLINE_R', 'DISCIPLINE'),
(4987, 'DISCIPLINE_U', 'DISCIPLINE_U', 'DISCIPLINE'),
(4988, 'DISCIPLINE_D', 'DISCIPLINE_D', 'DISCIPLINE'),
(4989, 'FILE_C', 'FILE_C', 'FILE'),
(4990, 'FILE_R', 'FILE_R', 'FILE'),
(4991, 'FILE_U', 'FILE_U', 'FILE'),
(4992, 'FILE_D', 'FILE_D', 'FILE'),
(4993, 'PERMISSION_C', 'PERMISSION_C', 'PERMISSION'),
(4994, 'PERMISSION_R', 'PERMISSION_R', 'PERMISSION'),
(4995, 'PERMISSION_U', 'PERMISSION_U', 'PERMISSION'),
(4996, 'PERMISSION_D', 'PERMISSION_D', 'PERMISSION'),
(4997, 'REGISTRATION_C', 'REGISTRATION_C', 'REGISTRATION'),
(4998, 'REGISTRATION_R', 'REGISTRATION_R', 'REGISTRATION'),
(4999, 'REGISTRATION_U', 'REGISTRATION_U', 'REGISTRATION'),
(5000, 'REGISTRATION_D', 'REGISTRATION_D', 'REGISTRATION'),
(5001, 'RESULT_C', 'RESULT_C', 'RESULT'),
(5002, 'RESULT_R', 'RESULT_R', 'RESULT'),
(5003, 'RESULT_U', 'RESULT_U', 'RESULT'),
(5004, 'RESULT_D', 'RESULT_D', 'RESULT'),
(5005, 'ATTENDANCE_C', 'ATTENDANCE_C', 'ATTENDANCE'),
(5006, 'ATTENDANCE_R', 'ATTENDANCE_R', 'ATTENDANCE'),
(5007, 'ATTENDANCE_U', 'ATTENDANCE_U', 'ATTENDANCE'),
(5008, 'ATTENDANCE_D', 'ATTENDANCE_D', 'ATTENDANCE'),
(5009, 'MARKS_SETUP_C', 'MARKS_SETUP_C', 'MARKS_SETUP'),
(5010, 'MARKS_SETUP_R', 'MARKS_SETUP_R', 'MARKS_SETUP'),
(5011, 'MARKS_SETUP_U', 'MARKS_SETUP_U', 'MARKS_SETUP'),
(5012, 'MARKS_SETUP_D', 'MARKS_SETUP_D', 'MARKS_SETUP'),
(5013, 'GRADE_SETUP_C', 'GRADE_SETUP_C', 'GRADE_SETUP'),
(5014, 'GRADE_SETUP_R', 'GRADE_SETUP_R', 'GRADE_SETUP'),
(5015, 'GRADE_SETUP_U', 'GRADE_SETUP_U', 'GRADE_SETUP'),
(5016, 'GRADE_SETUP_D', 'GRADE_SETUP_D', 'GRADE_SETUP'),
(5017, 'ROLE_C', 'ROLE_C', 'ROLE'),
(5018, 'ROLE_R', 'ROLE_R', 'ROLE'),
(5019, 'ROLE_U', 'ROLE_U', 'ROLE'),
(5020, 'ROLE_D', 'ROLE_D', 'ROLE'),
(5021, 'POSITION_C', 'POSITION_C', 'POSITION'),
(5022, 'POSITION_R', 'POSITION_R', 'POSITION'),
(5023, 'POSITION_U', 'POSITION_U', 'POSITION'),
(5024, 'POSITION_D', 'POSITION_D', 'POSITION'),
(5025, 'PROJECT_C', 'PROJECT_C', 'PROJECT'),
(5026, 'PROJECT_R', 'PROJECT_R', 'PROJECT'),
(5027, 'PROJECT_U', 'PROJECT_U', 'PROJECT'),
(5028, 'PROJECT_D', 'PROJECT_D', 'PROJECT'),
(5029, 'QUESTION_C', 'QUESTION_C', 'QUESTION'),
(5030, 'QUESTION_R', 'QUESTION_R', 'QUESTION'),
(5031, 'QUESTION_U', 'QUESTION_U', 'QUESTION'),
(5032, 'QUESTION_D', 'QUESTION_D', 'QUESTION'),
(5033, 'SCHOOL_C', 'SCHOOL_C', 'SCHOOL'),
(5034, 'SCHOOL_R', 'SCHOOL_R', 'SCHOOL'),
(5035, 'SCHOOL_U', 'SCHOOL_U', 'SCHOOL'),
(5036, 'SCHOOL_D', 'SCHOOL_D', 'SCHOOL'),
(5037, 'SESSION_C', 'SESSION_C', 'SESSION'),
(5038, 'SESSION_R', 'SESSION_R', 'SESSION'),
(5039, 'SESSION_U', 'SESSION_U', 'SESSION'),
(5040, 'SESSION_D', 'SESSION_D', 'SESSION'),
(5041, 'SURVEY_C', 'SURVEY_C', 'SURVEY'),
(5042, 'SURVEY_R', 'SURVEY_R', 'SURVEY'),
(5043, 'SURVEY_U', 'SURVEY_U', 'SURVEY'),
(5044, 'SURVEY_D', 'SURVEY_D', 'SURVEY'),
(5045, 'SURVEY_QUESTION_C', 'SURVEY_QUESTION_C', 'SURVEY QUESTION'),
(5046, 'SURVEY_QUESTION_R', 'SURVEY_QUESTION_R', 'SURVEY QUESTION'),
(5047, 'SURVEY_QUESTION_U', 'SURVEY_QUESTION_U', 'SURVEY QUESTION'),
(5048, 'SURVEY_QUESTION_D', 'SURVEY_QUESTION_D', 'SURVEY QUESTION'),
(5049, 'SURVEY_QUESTION_TYPE_C', 'SURVEY_QUESTION_TYPE_C', 'SURVEY QUESTION TYPE'),
(5050, 'SURVEY_QUESTION_TYPE_R', 'SURVEY_QUESTION_TYPE_R', 'SURVEY QUESTION TYPE'),
(5051, 'SURVEY_QUESTION_TYPE_U', 'SURVEY_QUESTION_TYPE_U', 'SURVEY QUESTION TYPE'),
(5052, 'SURVEY_QUESTION_TYPE_D', 'SURVEY_QUESTION_TYPE_D', 'SURVEY QUESTION TYPE'),
(5053, 'SURVEY_QUESTION_FILLUP_C', 'SURVEY_QUESTION_FILLUP_C', 'SURVEY QUESTION FILLUP'),
(5054, 'SURVEY_QUESTION_FILLUP_R', 'SURVEY_QUESTION_FILLUP_R', 'SURVEY QUESTION FILLUP'),
(5055, 'SURVEY_QUESTION_FILLUP_U', 'SURVEY_QUESTION_FILLUP_U', 'SURVEY QUESTION FILLUP'),
(5056, 'SURVEY_QUESTION_FILLUP_D', 'SURVEY_QUESTION_FILLUP_D', 'SURVEY QUESTION FILLUP'),
(5057, 'TERM_C', 'TERM_C', 'TERM'),
(5058, 'TERM_R', 'TERM_R', 'TERM'),
(5059, 'TERM_U', 'TERM_U', 'TERM'),
(5060, 'TERM_D', 'TERM_D', 'TERM'),
(5061, 'USER_C', 'USER_C', 'USER'),
(5062, 'USER_R', 'USER_R', 'USER'),
(5063, 'USER_U', 'USER_U', 'USER'),
(5064, 'USER_D', 'USER_D', 'USER'),
(5065, 'YEAR_C', 'YEAR_C', 'YEAR'),
(5066, 'YEAR_R', 'YEAR_R', 'YEAR'),
(5067, 'YEAR_U', 'YEAR_U', 'YEAR'),
(5068, 'YEAR_D', 'YEAR_D', 'YEAR'),
(5069, 'VIDEO_C', 'VIDEO_C', 'VIDEO'),
(5070, 'VIDEO_R', 'VIDEO_R', 'VIDEO'),
(5071, 'VIDEO_U', 'VIDEO_U', 'VIDEO'),
(5072, 'VIDEO_D', 'VIDEO_D', 'VIDEO'),
(5073, 'VIDEO_COMMENT_C', 'VIDEO_COMMENT_C', 'VIDEO COMMENT'),
(5074, 'VIDEO_COMMENT_R', 'VIDEO_COMMENT_R', 'VIDEO COMMENT'),
(5075, 'VIDEO_COMMENT_U', 'VIDEO_COMMENT_U', 'VIDEO COMMENT'),
(5076, 'VIDEO_COMMENT_D', 'VIDEO_COMMENT_D', 'VIDEO COMMENT'),
(5077, 'JOB_C', 'JOB_C', 'JOB'),
(5078, 'JOB_R', 'JOB_R', 'JOB'),
(5079, 'JOB_U', 'JOB_U', 'JOB'),
(5080, 'JOB_D', 'JOB_D', 'JOB'),
(5081, 'CLUB_C', 'CLUB_C', 'CLUB'),
(5082, 'CLUB_R', 'CLUB_R', 'CLUB'),
(5083, 'CLUB_U', 'CLUB_U', 'CLUB'),
(5084, 'CLUB_D', 'CLUB_D', 'CLUB'),
(5085, 'DISCUSSION_C', 'DISCUSSION_C', 'DISCUSSION'),
(5086, 'DISCUSSION_R', 'DISCUSSION_R', 'DISCUSSION'),
(5087, 'DISCUSSION_U', 'DISCUSSION_U', 'DISCUSSION'),
(5088, 'DISCUSSION_D', 'DISCUSSION_D', 'DISCUSSION'),
(5089, 'DISCUSSION_CAT_C', 'DISCUSSION_CAT_C', 'DISCUSSION CATEGORY'),
(5090, 'DISCUSSION_CAT_R', 'DISCUSSION_CAT_R', 'DISCUSSION CATEGORY'),
(5091, 'DISCUSSION_CAT_U', 'DISCUSSION_CAT_U', 'DISCUSSION CATEGORY'),
(5092, 'DISCUSSION_CAT_D', 'DISCUSSION_CAT_D', 'DISCUSSION CATEGORY'),
(5093, 'DISCUSSION_COMMENT_C', 'DISCUSSION_COMMENT_C', 'DISCUSSION COMMENT'),
(5094, 'DISCUSSION_COMMENT_R', 'DISCUSSION_COMMENT_R', 'DISCUSSION COMMENT'),
(5095, 'DISCUSSION_COMMENT_U', 'DISCUSSION_COMMENT_U', 'DISCUSSION COMMENT'),
(5096, 'DISCUSSION_COMMENT_D', 'DISCUSSION_COMMENT_D', 'DISCUSSION COMMENT'),
(5097, 'TASK_C', 'TASK_C', 'TASK'),
(5098, 'TASK_R', 'TASK_R', 'TASK'),
(5099, 'TASK_U', 'TASK_U', 'TASK'),
(5100, 'TASK_D', 'TASK_D', 'TASK'),
(5101, 'TASK_CATEGORY_C', 'TASK_CATEGORY_C', 'TASK_CATEGORY'),
(5102, 'TASK_CATEGORY_R', 'TASK_CATEGORY_R', 'TASK_CATEGORY'),
(5103, 'TASK_CATEGORY_U', 'TASK_CATEGORY_U', 'TASK_CATEGORY'),
(5104, 'TASK_CATEGORY_D', 'TASK_CATEGORY_D', 'TASK_CATEGORY');

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
('{2E024DF5-BD45-4EF2-A5E3-43BCA3E9777F}', 'Pro-vice Chancellor'),
('{64D25DDA-16B6-47B8-BBFC-4E2AAF5680C7}', 'Assistant Professor'),
('{7CDA1F32-A2F8-4469-B5A8-C2038FCE1F9A}', 'Lecturer'),
('{818DE12F-60CC-42E4-BAEC-48EAAED65179}', 'Dean of School'),
('{928EE9FF-E02D-470F-9A6A-AD0EB38B848F}', 'Vice Chancellor'),
('{92FDDA3F-1E91-4AA3-918F-EB595F85790C}', 'Daywise Worker'),
('{932CB0EE-76C2-448E-A40E-2D167EECC479}', 'Registrar'),
('{ADA027D3-21C1-47AF-A21D-759CAFCFE58D}', 'Assistant Registrar'),
('{B76EB035-EA26-4CEB-B029-1C6129574D98}', 'Librarian'),
('{B78C7A7B-4D38-4025-8170-7B8C9F291946}', 'Head of Discipline'),
('{C27B6BCF-FB83-4F3D-85CA-B7870D8B12D0}', 'Associate Professor'),
('{EB4880E2-01B3-4C6E-A2C9-89B6E5427C0A}', 'Professor');

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
('administrator', 'Administrator'),
('registration coordinator', 'Registration Coordinator'),
('student', 'Student'),
('stuff', 'Stuff'),
('tabulator', 'Tabulator'),
('teacher', 'Teacher');

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
) ENGINE=InnoDB AUTO_INCREMENT=2467 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_role_permission`
--

INSERT INTO `ums_role_permission` (`Row`, `RoleID`, `PermissionID`) VALUES
(2259, 'administrator', 'ATTENDANCE_C'),
(2260, 'administrator', 'ATTENDANCE_R'),
(2261, 'administrator', 'ATTENDANCE_U'),
(2262, 'administrator', 'ATTENDANCE_D'),
(2263, 'administrator', 'CLUB_C'),
(2264, 'administrator', 'CLUB_R'),
(2265, 'administrator', 'CLUB_U'),
(2266, 'administrator', 'CLUB_D'),
(2267, 'administrator', 'COURSE_C'),
(2268, 'administrator', 'COURSE_R'),
(2269, 'administrator', 'COURSE_U'),
(2270, 'administrator', 'COURSE_D'),
(2271, 'administrator', 'COURSE_SESSIONAL_TYPE_C'),
(2272, 'administrator', 'COURSE_SESSIONAL_TYPE_R'),
(2273, 'administrator', 'COURSE_SESSIONAL_TYPE_U'),
(2274, 'administrator', 'COURSE_SESSIONAL_TYPE_D'),
(2275, 'administrator', 'COURSE_TYPE_C'),
(2276, 'administrator', 'COURSE_TYPE_R'),
(2277, 'administrator', 'COURSE_TYPE_U'),
(2278, 'administrator', 'COURSE_TYPE_D'),
(2279, 'administrator', 'DISCIPLINE_C'),
(2280, 'administrator', 'DISCIPLINE_R'),
(2281, 'administrator', 'DISCIPLINE_U'),
(2282, 'administrator', 'DISCIPLINE_D'),
(2283, 'administrator', 'DISCUSSION_C'),
(2284, 'administrator', 'DISCUSSION_R'),
(2285, 'administrator', 'DISCUSSION_U'),
(2286, 'administrator', 'DISCUSSION_D'),
(2287, 'administrator', 'DISCUSSION_CAT_C'),
(2288, 'administrator', 'DISCUSSION_CAT_R'),
(2289, 'administrator', 'DISCUSSION_CAT_U'),
(2290, 'administrator', 'DISCUSSION_CAT_D'),
(2291, 'administrator', 'DISCUSSION_COMMENT_C'),
(2292, 'administrator', 'DISCUSSION_COMMENT_R'),
(2293, 'administrator', 'DISCUSSION_COMMENT_U'),
(2294, 'administrator', 'DISCUSSION_COMMENT_D'),
(2295, 'administrator', 'FILE_C'),
(2296, 'administrator', 'FILE_R'),
(2297, 'administrator', 'FILE_U'),
(2298, 'administrator', 'FILE_D'),
(2299, 'administrator', 'GRADE_SETUP_C'),
(2300, 'administrator', 'GRADE_SETUP_R'),
(2301, 'administrator', 'GRADE_SETUP_U'),
(2302, 'administrator', 'GRADE_SETUP_D'),
(2303, 'administrator', 'JOB_C'),
(2304, 'administrator', 'JOB_R'),
(2305, 'administrator', 'JOB_U'),
(2306, 'administrator', 'JOB_D'),
(2307, 'administrator', 'MARKS_SETUP_C'),
(2308, 'administrator', 'MARKS_SETUP_R'),
(2309, 'administrator', 'MARKS_SETUP_U'),
(2310, 'administrator', 'MARKS_SETUP_D'),
(2311, 'administrator', 'PERMISSION_C'),
(2312, 'administrator', 'PERMISSION_R'),
(2313, 'administrator', 'PERMISSION_U'),
(2314, 'administrator', 'PERMISSION_D'),
(2315, 'administrator', 'POSITION_C'),
(2316, 'administrator', 'POSITION_R'),
(2317, 'administrator', 'POSITION_U'),
(2318, 'administrator', 'POSITION_D'),
(2319, 'administrator', 'PROJECT_C'),
(2320, 'administrator', 'PROJECT_R'),
(2321, 'administrator', 'PROJECT_U'),
(2322, 'administrator', 'PROJECT_D'),
(2323, 'administrator', 'QUESTION_C'),
(2324, 'administrator', 'QUESTION_R'),
(2325, 'administrator', 'QUESTION_U'),
(2326, 'administrator', 'QUESTION_D'),
(2327, 'administrator', 'REGISTRATION_C'),
(2328, 'administrator', 'REGISTRATION_R'),
(2329, 'administrator', 'REGISTRATION_U'),
(2330, 'administrator', 'REGISTRATION_D'),
(2331, 'administrator', 'RESULT_C'),
(2332, 'administrator', 'RESULT_R'),
(2333, 'administrator', 'RESULT_U'),
(2334, 'administrator', 'RESULT_D'),
(2335, 'administrator', 'ROLE_C'),
(2336, 'administrator', 'ROLE_R'),
(2337, 'administrator', 'ROLE_U'),
(2338, 'administrator', 'ROLE_D'),
(2339, 'administrator', 'SCHOOL_C'),
(2340, 'administrator', 'SCHOOL_R'),
(2341, 'administrator', 'SCHOOL_U'),
(2342, 'administrator', 'SCHOOL_D'),
(2343, 'administrator', 'SESSION_C'),
(2344, 'administrator', 'SESSION_R'),
(2345, 'administrator', 'SESSION_U'),
(2346, 'administrator', 'SESSION_D'),
(2347, 'administrator', 'SURVEY_C'),
(2348, 'administrator', 'SURVEY_R'),
(2349, 'administrator', 'SURVEY_U'),
(2350, 'administrator', 'SURVEY_D'),
(2351, 'administrator', 'SURVEY_QUESTION_C'),
(2352, 'administrator', 'SURVEY_QUESTION_R'),
(2353, 'administrator', 'SURVEY_QUESTION_U'),
(2354, 'administrator', 'SURVEY_QUESTION_D'),
(2355, 'administrator', 'SURVEY_QUESTION_FILLUP_C'),
(2356, 'administrator', 'SURVEY_QUESTION_FILLUP_R'),
(2357, 'administrator', 'SURVEY_QUESTION_FILLUP_U'),
(2358, 'administrator', 'SURVEY_QUESTION_FILLUP_D'),
(2359, 'administrator', 'SURVEY_QUESTION_TYPE_C'),
(2360, 'administrator', 'SURVEY_QUESTION_TYPE_R'),
(2361, 'administrator', 'SURVEY_QUESTION_TYPE_U'),
(2362, 'administrator', 'SURVEY_QUESTION_TYPE_D'),
(2363, 'administrator', 'TASK_C'),
(2364, 'administrator', 'TASK_R'),
(2365, 'administrator', 'TASK_U'),
(2366, 'administrator', 'TASK_D'),
(2367, 'administrator', 'TASK_CATEGORY_C'),
(2368, 'administrator', 'TASK_CATEGORY_R'),
(2369, 'administrator', 'TASK_CATEGORY_U'),
(2370, 'administrator', 'TASK_CATEGORY_D'),
(2371, 'administrator', 'TERM_C'),
(2372, 'administrator', 'TERM_R'),
(2373, 'administrator', 'TERM_U'),
(2374, 'administrator', 'TERM_D'),
(2375, 'administrator', 'USER_C'),
(2376, 'administrator', 'USER_R'),
(2377, 'administrator', 'USER_U'),
(2378, 'administrator', 'USER_D'),
(2379, 'administrator', 'VIDEO_C'),
(2380, 'administrator', 'VIDEO_R'),
(2381, 'administrator', 'VIDEO_U'),
(2382, 'administrator', 'VIDEO_D'),
(2383, 'administrator', 'VIDEO_COMMENT_C'),
(2384, 'administrator', 'VIDEO_COMMENT_R'),
(2385, 'administrator', 'VIDEO_COMMENT_U'),
(2386, 'administrator', 'VIDEO_COMMENT_D'),
(2387, 'administrator', 'YEAR_C'),
(2388, 'administrator', 'YEAR_R'),
(2389, 'administrator', 'YEAR_U'),
(2390, 'administrator', 'YEAR_D'),
(2391, 'student', 'CLUB_C'),
(2392, 'student', 'CLUB_R'),
(2393, 'student', 'CLUB_U'),
(2394, 'student', 'CLUB_D'),
(2395, 'student', 'DISCUSSION_C'),
(2396, 'student', 'DISCUSSION_R'),
(2397, 'student', 'DISCUSSION_U'),
(2398, 'student', 'DISCUSSION_D'),
(2399, 'student', 'DISCUSSION_COMMENT_C'),
(2400, 'student', 'DISCUSSION_COMMENT_R'),
(2401, 'student', 'DISCUSSION_COMMENT_U'),
(2402, 'student', 'DISCUSSION_COMMENT_D'),
(2403, 'student', 'JOB_R'),
(2404, 'student', 'PROJECT_C'),
(2405, 'student', 'PROJECT_R'),
(2406, 'student', 'PROJECT_U'),
(2407, 'student', 'PROJECT_D'),
(2408, 'student', 'QUESTION_C'),
(2409, 'student', 'QUESTION_R'),
(2410, 'student', 'QUESTION_U'),
(2411, 'student', 'QUESTION_D'),
(2412, 'student', 'REGISTRATION_R'),
(2413, 'student', 'RESULT_R'),
(2414, 'student', 'TASK_C'),
(2415, 'student', 'TASK_R'),
(2416, 'student', 'TASK_U'),
(2417, 'student', 'TASK_D'),
(2418, 'student', 'USER_R'),
(2419, 'student', 'VIDEO_C'),
(2420, 'student', 'VIDEO_R'),
(2421, 'student', 'VIDEO_U'),
(2422, 'student', 'VIDEO_D'),
(2423, 'teacher', 'COURSE_C'),
(2424, 'teacher', 'COURSE_R'),
(2425, 'teacher', 'COURSE_U'),
(2426, 'teacher', 'COURSE_D'),
(2427, 'teacher', 'DISCUSSION_C'),
(2428, 'teacher', 'DISCUSSION_R'),
(2429, 'teacher', 'DISCUSSION_U'),
(2430, 'teacher', 'DISCUSSION_D'),
(2431, 'teacher', 'DISCUSSION_CAT_C'),
(2432, 'teacher', 'DISCUSSION_CAT_R'),
(2433, 'teacher', 'DISCUSSION_CAT_U'),
(2434, 'teacher', 'DISCUSSION_CAT_D'),
(2435, 'teacher', 'DISCUSSION_COMMENT_C'),
(2436, 'teacher', 'DISCUSSION_COMMENT_R'),
(2437, 'teacher', 'DISCUSSION_COMMENT_U'),
(2438, 'teacher', 'DISCUSSION_COMMENT_D'),
(2439, 'teacher', 'FILE_C'),
(2440, 'teacher', 'FILE_R'),
(2441, 'teacher', 'FILE_U'),
(2442, 'teacher', 'FILE_D'),
(2443, 'teacher', 'PROJECT_C'),
(2444, 'teacher', 'PROJECT_R'),
(2445, 'teacher', 'PROJECT_U'),
(2446, 'teacher', 'PROJECT_D'),
(2447, 'teacher', 'QUESTION_C'),
(2448, 'teacher', 'QUESTION_R'),
(2449, 'teacher', 'QUESTION_U'),
(2450, 'teacher', 'QUESTION_D'),
(2451, 'teacher', 'REGISTRATION_C'),
(2452, 'teacher', 'REGISTRATION_R'),
(2453, 'teacher', 'REGISTRATION_U'),
(2454, 'teacher', 'REGISTRATION_D'),
(2455, 'teacher', 'RESULT_C'),
(2456, 'teacher', 'RESULT_R'),
(2457, 'teacher', 'RESULT_U'),
(2458, 'teacher', 'RESULT_D'),
(2459, 'teacher', 'TASK_C'),
(2460, 'teacher', 'TASK_R'),
(2461, 'teacher', 'TASK_U'),
(2462, 'teacher', 'TASK_D'),
(2463, 'teacher', 'TASK_CATEGORY_C'),
(2464, 'teacher', 'TASK_CATEGORY_R'),
(2465, 'teacher', 'TASK_CATEGORY_U'),
(2466, 'teacher', 'TASK_CATEGORY_D');

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
('{39DDC0C2-CFC2-4246-8748-8812B1751A5C}', 'Science Engineering and Technology', ''),
('{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}', 'Life Science', ''),
('{86E0F021-B30D-48D2-B177-247180633C5E}', 'Social Science', ''),
('{879375F7-0A15-4705-AC90-C6786D279EF1}', 'Law and Humanities', ''),
('{CE09AA38-205B-4F50-A0E0-14DB8686C912}', 'Fine Arts', '');

-- --------------------------------------------------------

--
-- Table structure for table `ums_user`
--

DROP TABLE IF EXISTS `ums_user`;
CREATE TABLE IF NOT EXISTS `ums_user` (
  `ID` varchar(40) NOT NULL,
  `UniversityID` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DisciplineID` varchar(40) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `IsLogged` varchar(10) DEFAULT NULL,
  `IsArchived` varchar(10) DEFAULT NULL,
  `IsDeleted` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `UniversityID` (`UniversityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user`
--

INSERT INTO `ums_user` (`ID`, `UniversityID`, `Email`, `Password`, `FirstName`, `MiddleName`, `LastName`, `DisciplineID`, `Status`, `IsLogged`, `IsArchived`, `IsDeleted`) VALUES
('avi@gmail.com', '160211', 'avi@gmail.com', '$2y$10$3bxyNdNkpAqi2fybSynxsOVgqO6GwqMJwazAR/I/K5vWSr19.CSiy', 'avi', 'dev', 'raha', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('lotif@gmail.com', '160212', 'lotif@gmail.com', '$2y$10$MBB/ST/yOmtXog3FSEzneevL07erAGyxWK/pX/KT7QVSysSVqRaHq', 'Abdul', 'Lotif', 'Limon', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('mkazi078@uottawa.ca', '020229', 'mkazi078@uottawa.ca', '$2y$10$l0gFzILMq03DcwcBGxIdgunnOd9G5kF8J8ucZZvCKkt8mNGlI74/W', 'Kazi', 'Masudul', 'Alam', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('rokeya@gmail.com', '160210', 'rokeya@gmail.com', '$2y$10$yHHxXaXZX1Qm34Lz.r/BG..NB3Ctw7lkdf/g9geg0I0RzUnJsFDrm', 'Rokeya', '', 'sadaf', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('ryhan1630@cseku.ac.bd', '160230', 'ryhan1630@cseku.ac.bd', '$2y$10$4VNGxyf8mttFjuy2E07VkuZ3E4N4m09xugiq1hofd2vVty0ZXE9L.', 'Ryhan', 'Ahmed', 'Tamim', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('saimumislam96@gmail.com', '160227', 'saimumislam96@gmail.com', '$2y$10$BjexPvEbArRS7lcxvjHQ0.xegDY83Twv6REeuZ2B11IQ6Xr5qaV5G', 'saimum', '', 'islam', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL);

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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_details`
--

INSERT INTO `ums_user_details` (`ID`, `FatherName`, `MotherName`, `PermanentAddress`, `HomePhone`, `CurrentAddress`, `MobilePhone`) VALUES
('avi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('lotif@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('mkazi078@uottawa.ca', 'Kazi Shahidul Alam', 'Hosneara Jahan', '49/2, Rokon Uddin Sarak, East Baniakhamar, Khulna', '0417223344', 'Same', '01711149360 '),
('rokeya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('ryhan1630@cseku.ac.bd', NULL, NULL, NULL, NULL, NULL, NULL),
('saimumislam96@gmail.com', 'Rafiqul Islam', 'Shahida khatun', 'khulna', '01763706245', 'ku', '01763706245 ');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_position`
--

INSERT INTO `ums_user_position` (`ID`, `UserID`, `PositionID`) VALUES
(50, 'aysha@gmail.com', '{7CDA1F32-A2F8-4469-B5A8-C2038FCE1F9A}'),
(52, 'mkazi078@uottawa.ca', '{C27B6BCF-FB83-4F3D-85CA-B7870D8B12D0}');

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
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;

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
(168, 'saimumislam96@gmail.com', 'administrator'),
(170, 'mkazi078@uottawa.ca', 'administrator'),
(171, 'mkazi078@uottawa.ca', 'teacher'),
(173, 'lotif@gmail.com', 'student'),
(174, 'rokeya@gmail.com', 'student'),
(175, 'ryhan1630@cseku.ac.bd', 'administrator'),
(176, 'avi@gmail.com', 'teacher');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
