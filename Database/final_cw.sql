-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2024 at 03:17 PM
-- Server version: 8.0.37
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_cw`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int NOT NULL,
  `question_id` int DEFAULT NULL,
  `content` text NOT NULL,
  `code` text,
  `image` longblob,
  `image_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mem_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int NOT NULL,
  `question_id` int DEFAULT NULL,
  `mem_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `mem_id` int NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `displayname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mem_id`, `firstname`, `lastname`, `username`, `password`, `displayname`, `dob`, `phone`, `email`, `role`) VALUES
(1, 'Duc', 'Nguyen', 'ducngg411', '$2y$10$JsS.8Zv.9KfUG/UYFTcsI.UIDdb5n7n6G9fn./.HcjX8nOeCbH3bW', 'Nguyen Trong Duc', '2004-11-04', '03773867045', 'ducntgch221177@fpt.edu.vn', 'admin'),
(2, 'Peter', 'Parker', 'peterparker', '$2y$10$4K.eiy2rATgSl9UYRxOiTOvEwX963Tt12B1MxXnRuA860kInpOikC', 'Peter Parker', '1999-12-03', '+44123465789', 'peterparker@gmail.com', 'member'),
(3, 'John', 'Doe', 'john_doe01', '$2y$10$abcd1234', 'John Doe', '1990-01-01', '+441234567890', 'john_doe01@example.com', 'member'),
(4, 'Jane', 'Doe', 'jane_doe02', '$2y$10$abcd1235', 'Jane Doe', '1990-02-02', '+441234567891', 'jane_doe02@example.com', 'member'),
(5, 'Jim', 'Beam', 'jim_beam03', '$2y$10$abcd1236', 'Jim Beam', '1990-03-03', '+441234567892', 'jim_beam03@example.com', 'member'),
(6, 'Jack', 'Daniels', 'jack_daniels04', '$2y$10$abcd1237', 'Jack Daniels', '1990-04-04', '+441234567893', 'jack_daniels04@example.com', 'member'),
(7, 'Johnny', 'Walker', 'johnny_walker05', '$2y$10$abcd1238', 'Johnny Walker', '1990-05-05', '+441234567894', 'johnny_walker05@example.com', 'member'),
(8, 'James', 'Bond', 'james_bond06', '$2y$10$abcd1239', 'James Bond', '1990-06-06', '+441234567895', 'james_bond06@example.com', 'member'),
(9, 'Tony', 'Stark', 'tony_stark07', '$2y$10$abcd1240', 'Tony Stark', '1990-07-07', '+441234567896', 'tony_stark07@example.com', 'member'),
(10, 'Steve', 'Rogers', 'steve_rogers08', '$2y$10$abcd1241', 'Steve Rogers', '1990-08-08', '+441234567897', 'steve_rogers08@example.com', 'member'),
(11, 'Bruce', 'Wayne', 'bruce_wayne09', '$2y$10$abcd1242', 'Bruce Wayne', '1990-09-09', '+441234567898', 'bruce_wayne09@example.com', 'member'),
(12, 'Clark', 'Kent', 'clark_kent10', '$2y$10$abcd1243', 'Clark Kent', '1990-10-10', '+441234567899', 'clark_kent10@example.com', 'member'),
(13, 'Diana', 'Prince', 'diana_prince11', '$2y$10$abcd1244', 'Diana Prince', '1990-11-11', '+441234567900', 'diana_prince11@example.com', 'member'),
(14, 'Barry', 'Allen', 'barry_allen12', '$2y$10$abcd1245', 'Barry Allen', '1990-12-12', '+441234567901', 'barry_allen12@example.com', 'member'),
(15, 'Arthur', 'Curry', 'arthur_curry13', '$2y$10$abcd1246', 'Arthur Curry', '1991-01-13', '+441234567902', 'arthur_curry13@example.com', 'member'),
(16, 'Hal', 'Jordan', 'hal_jordan14', '$2y$10$abcd1247', 'Hal Jordan', '1991-02-14', '+441234567903', 'hal_jordan14@example.com', 'member'),
(17, 'Oliver', 'Queen', 'oliver_queen15', '$2y$10$abcd1248', 'Oliver Queen', '1991-03-15', '+441234567904', 'oliver_queen15@example.com', 'member'),
(18, 'Dinah', 'Lance', 'dinah_lance16', '$2y$10$abcd1249', 'Dinah Lance', '1991-04-16', '+441234567905', 'dinah_lance16@example.com', 'member'),
(19, 'Victor', 'Stone', 'victor_stone17', '$2y$10$abcd1250', 'Victor Stone', '1991-05-17', '+441234567906', 'victor_stone17@example.com', 'member'),
(20, 'Billy', 'Batson', 'billy_batson18', '$2y$10$abcd1251', 'Billy Batson', '1991-06-18', '+441234567907', 'billy_batson18@example.com', 'member'),
(21, 'Selina', 'Kyle', 'selina_kyle19', '$2y$10$abcd1252', 'Selina Kyle', '1991-07-19', '+441234567908', 'selina_kyle19@example.com', 'member'),
(22, 'Lois', 'Lane', 'lois_lane20', '$2y$10$abcd1253', 'Lois Lane', '1991-08-20', '+441234567909', 'lois_lane20@example.com', 'member'),
(23, 'Lex', 'Luthor', 'lex_luthor21', '$2y$10$abcd1254', 'Lex Luthor', '1991-09-21', '+441234567910', 'lex_luthor21@example.com', 'member'),
(24, 'Harley', 'Quinn', 'harley_quinn22', '$2y$10$abcd1255', 'Harley Quinn', '1991-10-22', '+441234567911', 'harley_quinn22@example.com', 'member'),
(25, 'Pamela', 'Isley', 'pamela_isley23', '$2y$10$abcd1256', 'Pamela Isley', '1991-11-23', '+441234567912', 'pamela_isley23@example.com', 'member'),
(26, 'Kara', 'Zor-El', 'kara_zorel24', '$2y$10$abcd1257', 'Kara Zor-El', '1991-12-24', '+441234567913', 'kara_zorel24@example.com', 'member'),
(27, 'Barry', 'West', 'barry_west25', '$2y$10$abcd1258', 'Barry West', '1992-01-25', '+441234567914', 'barry_west25@example.com', 'member'),
(28, 'Wally', 'West', 'wally_west26', '$2y$10$abcd1259', 'Wally West', '1992-02-26', '+441234567915', 'wally_west26@example.com', 'member'),
(29, 'Shayera', 'Hol', 'shayera_hol27', '$2y$10$abcd1260', 'Shayera Hol', '1992-03-27', '+441234567916', 'shayera_hol27@example.com', 'member'),
(30, 'John', 'Stewart', 'john_stewart28', '$2y$10$abcd1261', 'John Stewart', '1992-04-28', '+441234567917', 'john_stewart28@example.com', 'member'),
(31, 'Kendra', 'Saunders', 'kendra_saunders29', '$2y$10$abcd1262', 'Kendra Saunders', '1992-05-29', '+441234567918', 'kendra_saunders29@example.com', 'member'),
(32, 'Jesse', 'Quick', 'jesse_quick30', '$2y$10$abcd1263', 'Jesse Quick', '1992-06-30', '+441234567919', 'jesse_quick30@example.com', 'member'),
(33, 'Ronnie', 'Raymond', 'ronnie_raymond31', '$2y$10$abcd1264', 'Ronnie Raymond', '1992-07-31', '+441234567920', 'ronnie_raymond31@example.com', 'member'),
(34, 'Martin', 'Stein', 'martin_stein32', '$2y$10$abcd1265', 'Martin Stein', '1992-08-01', '+441234567921', 'martin_stein32@example.com', 'member'),
(35, 'Zatanna', 'Zatara', 'zatanna_zatara33', '$2y$10$abcd1266', 'Zatanna Zatara', '1992-09-02', '+441234567922', 'zatanna_zatara33@example.com', 'member'),
(36, 'Ralph', 'Dibny', 'ralph_dibny34', '$2y$10$abcd1267', 'Ralph Dibny', '1992-10-03', '+441234567923', 'ralph_dibny34@example.com', 'member'),
(37, 'Sue', 'Dibny', 'sue_dibny35', '$2y$10$abcd1268', 'Sue Dibny', '1992-11-04', '+441234567924', 'sue_dibny35@example.com', 'member'),
(38, 'Rene', 'Montoya', 'rene_montoya36', '$2y$10$abcd1269', 'Rene Montoya', '1992-12-05', '+441234567925', 'rene_montoya36@example.com', 'member'),
(39, 'Kathy', 'Kane', 'kathy_kane37', '$2y$10$abcd1270', 'Kathy Kane', '1993-01-06', '+441234567926', 'kathy_kane37@example.com', 'member'),
(40, 'Helena', 'Bertinelli', 'helena_bertinelli38', '$2y$10$abcd1271', 'Helena Bertinelli', '1993-02-07', '+441234567927', 'helena_bertinelli38@example.com', 'member'),
(41, 'Carter', 'Hall', 'carter_hall39', '$2y$10$abcd1272', 'Carter Hall', '1993-03-08', '+441234567928', 'carter_hall39@example.com', 'member'),
(42, 'Kendra', 'Hall', 'kendra_hall40', '$2y$10$abcd1273', 'Kendra Hall', '1993-04-09', '+441234567929', 'kendra_hall40@example.com', 'member'),
(43, 'Talia', 'Al Ghul', 'talia_alghul41', '$2y$10$abcd1274', 'Talia Al Ghul', '1993-05-10', '+441234567930', 'talia_alghul41@example.com', 'member'),
(44, 'Ra\'s', 'Al Ghul', 'ras_alghul42', '$2y$10$abcd1275', 'Ra\'s Al Ghul', '1993-06-11', '+441234567931', 'ras_alghul42@example.com', 'member'),
(45, 'Damian', 'Wayne', 'damian_wayne43', '$2y$10$abcd1276', 'Damian Wayne', '1993-07-12', '+441234567932', 'damian_wayne43@example.com', 'member'),
(46, 'Jason', 'Todd', 'jason_todd44', '$2y$10$abcd1277', 'Jason Todd', '1993-08-13', '+441234567933', 'jason_todd44@example.com', 'member'),
(47, 'Tim', 'Drake', 'tim_drake45', '$2y$10$abcd1278', 'Tim Drake', '1993-09-14', '+441234567934', 'tim_drake45@example.com', 'member'),
(48, 'Stephanie', 'Brown', 'stephanie_brown46', '$2y$10$abcd1279', 'Stephanie Brown', '1993-10-15', '+441234567935', 'stephanie_brown46@example.com', 'member'),
(49, 'Cassandra', 'Cain', 'cassandra_cain47', '$2y$10$abcd1280', 'Cassandra Cain', '1993-11-16', '+441234567936', 'cassandra_cain47@example.com', 'member'),
(50, 'Barbara', 'Gordon', 'barbara_gordon48', '$2y$10$abcd1281', 'Barbara Gordon', '1993-12-17', '+441234567937', 'barbara_gordon48@example.com', 'member');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `modules_id` int NOT NULL,
  `modules_name` varchar(255) NOT NULL,
  `modules_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `questions_count` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`modules_id`, `modules_name`, `modules_description`, `create_time`, `questions_count`) VALUES
(1, 'GoLang', 'Everything with GoLang!', '2024-07-09 17:42:48', 1),
(2, 'Python', 'Learn Python Programming', '2024-07-11 18:35:22', 1),
(3, 'English', 'Learn English, Open The World', '2024-07-19 17:41:15', 1),
(4, 'JavaScript', 'Everything with JavaScript!', '2024-07-05 19:23:00', 1),
(5, 'Java', 'Master Java Programming', '2024-06-15 14:45:30', 1),
(6, 'Automation Browser', 'Everything with Automation Browser!', '2024-06-06 06:06:00', 1),
(7, 'Machine Learning', 'Everything with Machine Learning!', '2024-07-29 20:27:00', 1),
(8, 'Data Science', 'Explore Data Science', '2024-08-01 10:10:10', 1),
(9, 'Mathematics', 'This module covers basic to advanced mathematical concepts.', '2024-07-31 03:47:33', 1),
(10, 'Physics', 'This module introduces students to the fundamental principles of physics.', '2024-07-31 03:47:33', 1),
(11, 'Chemistry', 'This module explores the principles of chemistry.', '2024-07-31 03:47:33', 1),
(12, 'Biology', 'This module delves into the study of living organisms.', '2024-07-31 03:47:33', 1),
(13, 'Computer Science', 'This module covers programming, algorithms, and data structures.', '2024-07-31 03:47:33', 1),
(14, 'Web Development', 'Building modern web applications.', '2024-06-25 15:45:12', 1),
(15, 'Cloud Computing', 'Introduction to cloud services and architecture.', '2024-08-01 11:30:45', 1),
(16, 'Cyber Security', 'Protecting systems and networks.', '2024-07-22 13:22:33', 1),
(17, 'Blockchain', 'Understanding blockchain technology.', '2024-06-18 09:12:21', 1),
(18, 'Quantum Computing', 'Principles of quantum computation.', '2024-08-03 12:10:11', 1),
(19, 'Digital Marketing', 'Strategies for digital marketing.', '2024-07-04 14:50:22', 1),
(20, 'Big Data', 'Managing and analyzing large datasets.', '2024-06-29 08:40:39', 1),
(21, 'Networking', 'Fundamentals of computer networks.', '2024-07-12 16:32:10', 1),
(22, 'DevOps', 'Collaboration between development and operations.', '2024-07-21 11:20:30', 1),
(23, 'Mobile Development', 'Creating mobile applications.', '2024-07-25 14:25:14', 1),
(24, 'Game Development', 'Designing and developing games.', '2024-08-05 13:50:50', 1),
(25, 'Artificial Intelligence', 'Introduction to AI concepts.', '2024-06-28 09:15:20', 1),
(26, 'VR/AR', 'Virtual and augmented reality technologies.', '2024-07-16 17:45:55', 1),
(27, '3D Printing', 'Techniques and applications of 3D printing.', '2024-07-14 08:25:17', 1),
(28, 'Graphic Design', 'Principles of visual communication.', '2024-07-18 11:55:44', 1),
(29, 'Ethical Hacking', 'Learning ethical hacking techniques.', '2024-07-22 10:30:45', 1),
(30, 'Project Management', 'Effective project management strategies.', '2024-07-26 09:15:30', 1),
(31, 'Database Management', 'Introduction to database systems.', '2024-08-01 11:45:00', 1),
(32, 'Cyber Law', 'Understanding the laws governing cyberspace.', '2024-06-30 14:30:20', 1),
(33, 'Machine Learning Advanced', 'Advanced topics in machine learning.', '2024-08-01 12:45:30', 1),
(34, 'Data Visualization', 'Techniques for visualizing data.', '2024-07-22 11:15:45', 1),
(35, 'Microservices', 'Building and managing microservices.', '2024-07-25 09:45:30', 1),
(36, 'IT Operations', 'Best practices for IT operations.', '2024-08-02 14:00:00', 1),
(37, 'Embedded Systems', 'Introduction to embedded systems.', '2024-07-30 13:25:10', 1),
(38, 'Robotics', 'Principles and applications of robotics.', '2024-07-31 09:30:50', 1),
(39, 'Software Testing', 'Techniques and tools for software testing.', '2024-08-03 08:10:30', 1),
(40, 'Cryptography', 'Fundamentals of cryptography.', '2024-07-29 07:45:20', 1),
(41, 'Agile Methodologies', 'Introduction to Agile methodologies.', '2024-07-28 12:20:15', 1),
(42, 'UX Design', 'User experience design principles.', '2024-07-27 14:15:50', 1),
(43, 'Network Security', 'Principles of network security.', '2024-07-26 10:50:30', 1),
(44, 'Natural Language Processing', 'Introduction to NLP.', '2024-07-25 11:10:25', 1),
(45, 'Computer Vision', 'Basics of computer vision.', '2024-07-24 09:35:40', 1),
(46, 'Augmented Reality', 'Applications of augmented reality.', '2024-07-23 08:50:30', 1),
(47, 'Edge Computing', 'Introduction to edge computing.', '2024-07-22 07:25:10', 1),
(48, 'Cloud Native', 'Building cloud-native applications.', '2024-07-21 12:30:40', 1),
(49, 'Blockchain Advanced', 'Advanced blockchain technologies.', '2024-07-20 10:20:50', 1),
(50, 'IoT', 'Internet of Things concepts.', '2024-07-19 15:45:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `code` text,
  `image` longblob,
  `image_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mem_id` int NOT NULL,
  `modules_id` int NOT NULL,
  `edited_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `bookmark_count` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `title`, `content`, `code`, `image`, `image_type`, `created_at`, `mem_id`, `modules_id`, `edited_at`, `bookmark_count`) VALUES
(1, 'What are the best practices for writing efficient Go code?', 'I am learning GoLang and want to ensure I am following best practices. Can anyone share tips on writing efficient Go code?', NULL, NULL, NULL, '2024-08-13 09:24:16', 1, 1, NULL, 0),
(2, 'How to handle errors in Python?', 'What are the common techniques for handling errors in Python programs?', NULL, NULL, NULL, '2024-08-13 09:24:16', 2, 2, NULL, 0),
(3, 'Tips for improving English vocabulary?', 'What are some effective methods to improve my English vocabulary?', NULL, NULL, NULL, '2024-08-13 09:24:16', 3, 3, NULL, 0),
(4, 'How to manage asynchronous operations in JavaScript?', 'Can someone explain the different ways to manage asynchronous operations in JavaScript?', NULL, NULL, NULL, '2024-08-13 09:24:16', 4, 4, NULL, 0),
(5, 'Best practices for Java exception handling?', 'What are some best practices for handling exceptions in Java?', NULL, NULL, NULL, '2024-08-13 09:24:16', 5, 5, NULL, 0),
(6, 'Getting started with Selenium for browser automation', 'How do I get started with Selenium for browser automation? Any resources or examples would be helpful.', NULL, NULL, NULL, '2024-08-13 09:24:16', 6, 6, NULL, 0),
(7, 'What are the key concepts in Machine Learning?', 'I am new to Machine Learning. What are the key concepts I should understand?', NULL, NULL, NULL, '2024-08-13 09:24:16', 7, 7, NULL, 0),
(8, 'How to preprocess data for a Data Science project?', 'What are the steps involved in data preprocessing for a Data Science project?', NULL, NULL, NULL, '2024-08-13 09:24:16', 8, 8, NULL, 0),
(9, 'Understanding derivatives in Mathematics', 'Can someone explain the concept of derivatives in Mathematics?', NULL, NULL, NULL, '2024-08-13 09:24:16', 9, 9, NULL, 0),
(10, 'What are the fundamental forces in Physics?', 'I am curious about the fundamental forces in Physics. Can someone explain them?', NULL, NULL, NULL, '2024-08-13 09:24:16', 10, 10, NULL, 0),
(11, 'Basics of chemical bonding in Chemistry', 'What are the basic types of chemical bonds in Chemistry?', NULL, NULL, NULL, '2024-08-13 09:24:16', 11, 11, NULL, 0),
(12, 'What is the role of DNA in Biology?', 'Can someone explain the role of DNA in living organisms?', NULL, NULL, NULL, '2024-08-13 09:24:16', 12, 12, NULL, 0),
(13, 'Introduction to algorithms in Computer Science', 'What are some fundamental algorithms that every computer science student should know?', NULL, NULL, NULL, '2024-08-13 09:24:16', 13, 13, NULL, 0),
(14, 'Best frameworks for Web Development in 2024?', 'What are some of the best frameworks for web development in 2024?', NULL, NULL, NULL, '2024-08-13 09:24:16', 14, 14, NULL, 0),
(15, 'How to set up a cloud server on AWS?', 'Can someone guide me through the process of setting up a cloud server on AWS?', NULL, NULL, NULL, '2024-08-13 09:24:16', 15, 15, NULL, 0),
(16, 'Common cyber security threats in 2024', 'What are some common cyber security threats to be aware of in 2024?', NULL, NULL, NULL, '2024-08-13 09:24:16', 16, 16, NULL, 0),
(17, 'Understanding blockchain consensus mechanisms', 'Can someone explain the different consensus mechanisms used in blockchain technology?', NULL, NULL, NULL, '2024-08-13 09:24:16', 17, 17, NULL, 0),
(18, 'Introduction to quantum entanglement', 'What is quantum entanglement and how does it work?', NULL, NULL, NULL, '2024-08-13 09:24:16', 18, 18, NULL, 0),
(19, 'Effective digital marketing strategies for startups', 'What are some effective digital marketing strategies for startups?', NULL, NULL, NULL, '2024-08-13 09:24:16', 19, 19, NULL, 0),
(20, 'What are the challenges of big data analytics?', 'Can someone share the common challenges faced in big data analytics?', NULL, NULL, NULL, '2024-08-13 09:24:16', 20, 20, NULL, 0),
(21, 'Basics of computer networking', 'What are the basic concepts of computer networking?', NULL, NULL, NULL, '2024-08-13 09:24:16', 21, 21, NULL, 0),
(22, 'Implementing CI/CD in a DevOps environment', 'How do you implement Continuous Integration and Continuous Deployment in a DevOps environment?', NULL, NULL, NULL, '2024-08-13 09:24:16', 22, 22, NULL, 0),
(23, 'Introduction to mobile app development with Flutter', 'How do I get started with mobile app development using Flutter?', NULL, NULL, NULL, '2024-08-13 09:24:16', 23, 23, NULL, 0),
(24, 'What are the popular game engines for development?', 'Can someone list some popular game engines used for game development?', NULL, NULL, NULL, '2024-08-13 09:24:16', 24, 24, NULL, 0),
(25, 'How does machine learning work?', 'Can someone explain how machine learning algorithms work?', NULL, NULL, NULL, '2024-08-13 09:24:16', 25, 25, NULL, 0),
(26, 'Applications of VR and AR in education', 'How are Virtual Reality and Augmented Reality being used in the education sector?', NULL, NULL, NULL, '2024-08-13 09:24:16', 26, 26, NULL, 0),
(27, 'Basics of 3D printing technology', 'What are the basic principles of 3D printing technology?', NULL, NULL, NULL, '2024-08-13 09:24:16', 27, 27, NULL, 0),
(28, 'Principles of good graphic design', 'What are some key principles to follow for good graphic design?', NULL, NULL, NULL, '2024-08-13 09:24:16', 28, 28, NULL, 0),
(29, 'Ethical hacking techniques', 'What are some common techniques used in ethical hacking?', NULL, NULL, NULL, '2024-08-13 09:24:16', 29, 29, NULL, 0),
(30, 'Key skills for effective project management', 'What are the key skills required for effective project management?', NULL, NULL, NULL, '2024-08-13 09:24:16', 30, 30, NULL, 0),
(31, 'Basics of SQL for database management', 'What are the basics of SQL that I should know for managing databases?', NULL, NULL, NULL, '2024-08-13 09:24:16', 31, 31, NULL, 0),
(32, 'Understanding cyber laws', 'Can someone explain the importance of cyber laws in today\'s digital age?', NULL, NULL, NULL, '2024-08-13 09:24:16', 32, 32, NULL, 0),
(33, 'Advanced topics in machine learning', 'What are some advanced topics in machine learning?', NULL, NULL, NULL, '2024-08-13 09:24:16', 33, 33, NULL, 0),
(34, 'Data visualization tools', 'What are some effective tools for data visualization?', NULL, NULL, NULL, '2024-08-13 09:24:16', 34, 34, NULL, 0),
(35, 'Introduction to microservices architecture', 'What is microservices architecture and how does it differ from monolithic architecture?', NULL, NULL, NULL, '2024-08-13 09:24:16', 35, 35, NULL, 0),
(36, 'Best practices for IT operations management', 'What are some best practices for managing IT operations?', NULL, NULL, NULL, '2024-08-13 09:24:16', 36, 36, NULL, 0),
(37, 'Basics of embedded systems', 'What are embedded systems and where are they commonly used?', NULL, NULL, NULL, '2024-08-13 09:24:16', 37, 37, NULL, 0),
(38, 'Applications of robotics in healthcare', 'How are robotics being used in the healthcare industry?', NULL, NULL, NULL, '2024-08-13 09:24:16', 38, 38, NULL, 0),
(39, 'Techniques for effective software testing', 'What are some effective techniques for software testing?', NULL, NULL, NULL, '2024-08-13 09:24:16', 39, 39, NULL, 0),
(40, 'Introduction to cryptography', 'What are the basic principles of cryptography?', NULL, NULL, NULL, '2024-08-13 09:24:16', 40, 40, NULL, 0),
(41, 'Principles of Agile methodologies', 'What are the core principles of Agile methodologies?', NULL, NULL, NULL, '2024-08-13 09:24:16', 41, 41, NULL, 0),
(42, 'UX design best practices', 'What are some best practices for user experience (UX) design?', NULL, NULL, NULL, '2024-08-13 09:24:16', 42, 42, NULL, 0),
(43, 'Network security fundamentals', 'What are the fundamental concepts of network security?', NULL, NULL, NULL, '2024-08-13 09:24:16', 43, 43, NULL, 0),
(44, 'Introduction to natural language processing', 'What is natural language processing (NLP) and what are its applications?', NULL, NULL, NULL, '2024-08-13 09:24:16', 44, 44, NULL, 0),
(45, 'Basics of computer vision', 'What are the basic concepts of computer vision?', NULL, NULL, NULL, '2024-08-13 09:24:16', 45, 45, NULL, 0),
(46, 'Applications of augmented reality in retail', 'How is augmented reality being used in the retail industry?', NULL, NULL, NULL, '2024-08-13 09:24:16', 46, 46, NULL, 0),
(47, 'Edge computing vs. cloud computing', 'What are the differences between edge computing and cloud computing?', NULL, NULL, NULL, '2024-08-13 09:24:16', 47, 47, NULL, 0),
(48, 'Building cloud-native applications', 'What are some best practices for building cloud-native applications?', NULL, NULL, NULL, '2024-08-13 09:24:16', 48, 48, NULL, 0),
(49, 'Advanced blockchain technologies', 'What are some advanced technologies being developed in the field of blockchain?', NULL, NULL, NULL, '2024-08-13 09:24:16', 49, 49, NULL, 0),
(50, 'Introduction to IoT', 'What is the Internet of Things (IoT) and how does it work?', NULL, NULL, NULL, '2024-08-13 09:24:16', 50, 50, NULL, 0);

--
-- Triggers `questions`
--
DELIMITER $$
CREATE TRIGGER `after_question_delete` AFTER DELETE ON `questions` FOR EACH ROW BEGIN
    UPDATE modules
    SET questions_count = questions_count - 1
    WHERE modules.modules_id = OLD.modules_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_question_insert` AFTER INSERT ON `questions` FOR EACH ROW BEGIN
    UPDATE modules
    SET questions_count = questions_count + 1
    WHERE modules.modules_id = NEW.modules_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_question_update` AFTER UPDATE ON `questions` FOR EACH ROW BEGIN
    IF NEW.modules_id <> OLD.modules_id THEN
        UPDATE modules
        SET questions_count = questions_count - 1
        WHERE modules.modules_id = OLD.modules_id;

        UPDATE modules
        SET questions_count = questions_count + 1
        WHERE modules.modules_id = NEW.modules_id;
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `mem_id` (`mem_id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `mem_id` (`mem_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mem_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`modules_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mem_id` (`mem_id`),
  ADD KEY `modules_id` (`modules_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `mem_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `modules_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_4` FOREIGN KEY (`modules_id`) REFERENCES `modules` (`modules_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
