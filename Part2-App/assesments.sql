-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 17, 2019 at 12:16 PM
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
-- Database: `assesments`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `quesitonID` int(11) NOT NULL,
  `Score` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `quesitonID` (`quesitonID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=1569 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`ID`, `quesitonID`, `Score`, `UserID`) VALUES
(1457, 207, 2, 1),
(1458, 208, 1, 1),
(1459, 209, 1, 1),
(1460, 210, 1, 1),
(1461, 211, 1, 1),
(1462, 212, 1, 1),
(1463, 213, 1, 1),
(1464, 214, 1, 1),
(1465, 215, 1, 1),
(1466, 216, 1, 1),
(1467, 217, 1, 1),
(1468, 218, 1, 1),
(1469, 219, 1, 1),
(1470, 220, 1, 1),
(1471, 221, 1, 1),
(1472, 222, 1, 1),
(1473, 223, 1, 1),
(1474, 224, 1, 1),
(1475, 225, 1, 1),
(1476, 226, 1, 1),
(1477, 227, 1, 1),
(1478, 228, 1, 1),
(1479, 229, 1, 1),
(1480, 230, 1, 1),
(1481, 231, 1, 1),
(1482, 232, 1, 1),
(1483, 233, 1, 1),
(1484, 234, 1, 1),
(1485, 235, 1, 1),
(1486, 236, 1, 1),
(1487, 237, 1, 1),
(1488, 238, 1, 1),
(1489, 239, 1, 1),
(1490, 240, 1, 1),
(1491, 241, 1, 1),
(1492, 242, 1, 1),
(1493, 243, 1, 1),
(1494, 244, 1, 1),
(1495, 245, 1, 1),
(1496, 246, 1, 1),
(1497, 247, 1, 1),
(1498, 248, 1, 1),
(1499, 249, 1, 1),
(1500, 250, 1, 1),
(1501, 251, 1, 1),
(1502, 252, 1, 1),
(1503, 253, 1, 1),
(1504, 254, 1, 1),
(1505, 255, 1, 1),
(1506, 256, 1, 1),
(1507, 257, 1, 1),
(1508, 258, 1, 1),
(1509, 259, 1, 1),
(1510, 260, 1, 1),
(1511, 261, 1, 1),
(1512, 262, 1, 1),
(1513, 263, 1, 1),
(1514, 264, 1, 1),
(1515, 265, 1, 1),
(1516, 266, 1, 1),
(1517, 267, 1, 1),
(1518, 268, 1, 1),
(1519, 269, 1, 1),
(1520, 270, 1, 1),
(1521, 271, 1, 1),
(1522, 272, 1, 1),
(1523, 273, 1, 1),
(1524, 274, 1, 1),
(1525, 275, 1, 1),
(1526, 316, 1, 1),
(1527, 276, 1, 1),
(1528, 277, 1, 1),
(1529, 278, 1, 1),
(1530, 279, 1, 1),
(1531, 280, 1, 1),
(1532, 281, 1, 1),
(1533, 282, 1, 1),
(1534, 283, 1, 1),
(1535, 284, 1, 1),
(1536, 285, 1, 1),
(1537, 286, 1, 1),
(1538, 287, 1, 1),
(1539, 288, 1, 1),
(1540, 317, 1, 1),
(1541, 289, 1, 1),
(1542, 290, 1, 1),
(1543, 291, 1, 1),
(1544, 292, 1, 1),
(1545, 293, 1, 1),
(1546, 294, 1, 1),
(1547, 295, 1, 1),
(1548, 296, 1, 1),
(1549, 297, 1, 1),
(1550, 298, 1, 1),
(1551, 299, 1, 1),
(1552, 300, 1, 1),
(1553, 301, 1, 1),
(1554, 302, 1, 1),
(1555, 303, 1, 1),
(1556, 304, 1, 1),
(1557, 305, 1, 1),
(1558, 306, 1, 1),
(1559, 307, 1, 1),
(1560, 308, 1, 1),
(1561, 309, 1, 1),
(1562, 310, 1, 1),
(1563, 311, 1, 1),
(1564, 312, 1, 1),
(1565, 313, 1, 1),
(1566, 314, 1, 1),
(1567, 315, 1, 1),
(1568, 318, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `interest_area`
--

DROP TABLE IF EXISTS `interest_area`;
CREATE TABLE IF NOT EXISTS `interest_area` (
  `intAreaId` int(11) NOT NULL AUTO_INCREMENT,
  `Interest_Area_Name` text NOT NULL,
  PRIMARY KEY (`intAreaId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest_area`
--

INSERT INTO `interest_area` (`intAreaId`, `Interest_Area_Name`) VALUES
(1, 'Agriculture, Food & Natural Resources'),
(2, 'Architecture & Construction'),
(3, 'Arts, A/V Technology & Communications'),
(4, 'Business Management & Administration'),
(5, 'Education & Training'),
(6, 'Finance'),
(7, 'Government & Public Administration'),
(8, 'Health Science'),
(9, 'Hospitality & Tourism'),
(10, 'Human Services'),
(11, 'Information Technology'),
(12, 'Law, Public Safety, Corrections & Security'),
(13, 'Manufacturing'),
(14, 'Marketing, Sales & Service'),
(15, 'Science, Technology, Engineering & Mathematics'),
(16, 'Transportation, Distribution & Logistics');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `questionId` int(11) NOT NULL,
  `intAreaId` int(11) NOT NULL,
  `questionText` text NOT NULL,
  PRIMARY KEY (`questionId`),
  KEY `intAreaId` (`intAreaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`questionId`, `intAreaId`, `questionText`) VALUES
(207, 1, 'Learning how things grow and stay alive.'),
(208, 1, 'Making the best use of the earth\'s natural resources.'),
(209, 1, 'Hunting or fishing.'),
(210, 1, 'Protecting the environment or taking care of animals.'),
(211, 1, 'Being outdoors.'),
(212, 1, 'Planning, budgeting, and keeping records.'),
(213, 1, 'Operating and/or repairing machines.'),
(214, 2, 'Reading and following blueprints and/or instructions.'),
(215, 2, 'Picturing in my mind what a finished product will look like.'),
(216, 2, 'Working with my hands.'),
(217, 2, 'Performing work that requires precise steps.'),
(218, 2, 'Solving technical problems.'),
(219, 2, 'Visiting and learning from historical or beautiful buildings.'),
(220, 2, 'Following logical step-by-step procedures.'),
(221, 3, 'Using my imagination to communicate new information to others.'),
(222, 3, 'Performing in front of others.'),
(223, 3, 'Reading and writing.'),
(224, 3, 'Playing a musical instrument.'),
(225, 3, 'Performing creative, artistic activities.'),
(226, 3, 'Using video and recording technology.'),
(227, 3, 'Designing brochures and posters.'),
(228, 4, 'Performing routine, organized activities but can be flexible.'),
(229, 4, 'Working with numbers and detailed information.'),
(230, 4, 'Being the leader in a group.'),
(231, 4, 'Making business contact with people.'),
(232, 4, 'Working with computer programs.'),
(233, 4, 'Creating reports and communicating ideas.'),
(234, 4, 'Planning my work and follow instructions without close supervision.'),
(235, 5, 'Communicating with different types of people.'),
(236, 5, 'Help others with their homework or to learn new things.'),
(237, 5, 'Going to school.'),
(238, 5, 'Directing and planning activities for others.'),
(239, 5, 'Handling several responsibilities at once.'),
(240, 5, 'Acquiring new information.'),
(241, 5, 'Helping people overcome their challenges.'),
(242, 6, 'Working with numbers.'),
(243, 6, 'Working to meet a deadline.'),
(244, 6, 'Making predictions based on existing facts.'),
(245, 6, 'Having a framework of rules by which to operate.'),
(246, 6, 'Analyzing financial information and interpret it to others.'),
(247, 6, 'Handling money with accuracy and reliability.'),
(248, 6, 'Taking pride in the way I dress and look.'),
(249, 7, 'Being involved in politics.'),
(250, 7, 'Negotiating, defending, and debating ideas and topics.'),
(251, 7, 'Planning activities and working cooperatively with others.'),
(252, 7, 'Working with details.'),
(253, 7, 'Performing a variety of duties that may change often.'),
(254, 7, 'Analyzing information and interpreting it to others.'),
(255, 7, 'Traveling and seeing things that are new to me.'),
(256, 8, 'Working under pressure.'),
(257, 8, 'Helping sick people and animals.'),
(258, 8, 'Making decisions based on logic and information.'),
(259, 8, 'Participating in health and science classes.'),
(260, 8, 'Responding quickly and calmly in emergencies.'),
(261, 8, 'Working as a member of a team.'),
(262, 8, 'Following guidelines precisely and meet strict standards of accuracy.'),
(263, 9, 'Investigating new places and activities.'),
(264, 9, 'Working with all ages and types of people.'),
(265, 9, 'Organizing activities in which other people enjoy themselves.'),
(266, 9, 'Having a flexible schedule.'),
(267, 9, 'Helping people make up their minds.'),
(268, 9, 'Communicating easily, tactfully, and courteously.'),
(269, 9, 'Learning about other cultures.'),
(270, 10, 'Caring about people, their needs, and their problems.'),
(271, 10, 'Participating in community services and/or volunteering.'),
(272, 10, 'Listening to other people\'s viewpoints.'),
(273, 10, 'Working with people from preschool age to old age.'),
(274, 10, 'Thinking of new ways to do things.'),
(275, 10, 'Making friends with different kinds of people.'),
(276, 11, 'Reasoning clearly and logically to solve complex problems.'),
(277, 11, 'Using machines, techniques, and processes.'),
(278, 11, 'Reading technical materials and/or diagrams.'),
(279, 11, 'Solving technical problems.'),
(280, 11, 'Adapting to change.'),
(281, 11, 'Playing video games and figure out how they work.'),
(282, 11, 'Concentrating for long periods without being distracted.'),
(283, 12, 'Working under pressure or in the face of danger.'),
(284, 12, 'Making decisions based on my own observations.'),
(285, 12, 'Interacting with other people.'),
(286, 12, 'Respecting rules and regulations.'),
(287, 12, 'Debating and winning arguments.'),
(288, 12, 'Observing and analyzing people\'s behavior.'),
(289, 13, 'Working with my hands.'),
(290, 13, 'Putting things together.'),
(291, 13, 'Doing routine, organized and accurate work.'),
(292, 13, 'Performing activities that produce tangible results.'),
(293, 13, 'Applying math to work out solutions.'),
(294, 13, 'Using hand and power tools and operate equipment/machinery.'),
(295, 13, 'Visualizing objects in three dimensions from flat drawings.'),
(296, 14, 'Shopping and going to the mall.'),
(297, 14, 'Being in charge.'),
(298, 14, 'Making displays and promote ideas.'),
(299, 14, 'Making displays and promote ideas.'),
(300, 14, 'Persuading people to buy products or to participate in activities.'),
(301, 14, 'Communicating my ideas to other people.'),
(302, 14, 'Taking advantage of opportunities to make extra money.'),
(303, 15, 'Interpreting formulas.'),
(304, 15, 'Finding the answers to questions.'),
(305, 15, 'Working in a laboratory.'),
(306, 15, 'Figuring out how things work and investigate new things.'),
(307, 15, 'Exploring new technology.'),
(308, 15, 'Experimenting to find the best way to do something.'),
(309, 15, 'Paying attention to details and help things be precise.'),
(310, 16, 'Traveling.'),
(311, 16, 'Seeing well and having quick reflexes.'),
(312, 16, 'Designing efficient processes.'),
(313, 16, 'Anticipating needs and preparing to meet them.'),
(314, 16, 'Driving or riding.'),
(315, 16, 'Moving things from one place to another.'),
(316, 10, 'Being socially aware or advocating for the rights of others.'),
(317, 12, 'Helping people in need or standing up for the rights of others'),
(318, 16, 'Working with machines or automotive technology.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` text NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `user_name`, `email`, `password`) VALUES
(1, 'fjBurke', 'fjBurke@fake.com', 'ABC12!3'),
(2, 'rkWallace', 'rkWallace@fake.com', 'QWER/*123');

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
CREATE TABLE IF NOT EXISTS `user_sessions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `SessionID` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`ID`, `UserID`, `SessionID`) VALUES
(9, 1, '0f5624c492f0a3aa8df0eadaff23cb44'),
(10, 1, '1740be3337c6faf3715c8bf3e70fee92'),
(11, 1, '61c9805916687bd5bb207b21050b76f2'),
(12, 1, '016cc8c8b9f04d9e0db220ce9260fbaf'),
(13, 1, 'b167b6e1b8eb096a5208c2b05ba5a11c');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`quesitonID`) REFERENCES `questions` (`questionId`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`intAreaId`) REFERENCES `interest_area` (`intAreaId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
