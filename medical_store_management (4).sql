-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2025 at 07:11 AM
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
-- Database: `medical store management`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_medicine` (IN `id` INT, IN `price` DOUBLE, IN `qty` INT)   BEGIN
UPDATE medicines SET med_price = price, quantity = qty WHERE med_id = id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `staff_id` int(10) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `total_amount` double NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `customer_email_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `customer_id`, `staff_id`, `purchase_date`, `total_amount`, `payment_method`, `customer_email_id`) VALUES
(1, 101, 4, '2025-01-01', 1522.36, 'Cash', 'rahul.pillai@healthplus.com'),
(2, 102, 1, '2025-01-02', 3443.79, 'Net Banking', 'tanvi.sandhu@gmail.com'),
(3, 103, 3, '2025-01-03', 3000.62, 'UPI', 'harish.soni@hotmail.com'),
(4, 104, 5, '2025-01-04', 3586.81, 'Credit Card', 'ishita.iyer@outlook.com'),
(5, 105, 3, '2025-01-05', 627.16, 'UPI', 'rekha.ali@wellcare.com'),
(6, 106, 4, '2025-01-06', 2525.82, 'UPI', 'ajay.menon@lifeline.in'),
(7, 107, 2, '2025-01-07', 937.84, 'Cash', 'karan.kapoor@yahoo.com'),
(8, 108, 3, '2025-01-08', 3795.93, 'Debit Card', 'arpita.yadav@hotmail.com'),
(9, 109, 4, '2025-01-09', 4701.24, 'Net Banking', 'wasim.menon@gmail.com'),
(10, 110, 1, '2025-01-10', 748.9, 'Net Banking', 'girish.sandhu@healthplus.com'),
(11, 111, 1, '2025-01-11', 4158.01, 'Cash', 'ishita.sen@hotmail.com'),
(12, 112, 4, '2025-01-12', 4142.1, 'Debit Card', 'priya.sharma@healthplus.com'),
(13, 113, 1, '2025-01-13', 736.31, 'UPI', 'priya.gill@rediffmail.com'),
(14, 114, 2, '2025-01-14', 4021.65, 'Net Banking', 'sarita.bose@wellcare.com'),
(15, 115, 5, '2025-01-15', 1197.63, 'Cash', 'nisha.patel@hotmail.com'),
(16, 116, 3, '2025-01-16', 1605.93, 'Net Banking', 'umesh.verma@pharma.co.in'),
(17, 117, 5, '2025-01-17', 1053.17, 'UPI', 'alka.sharma@hotmail.com'),
(18, 118, 3, '2025-01-18', 3758.01, 'Credit Card', 'alka.reddy@yahoo.com'),
(19, 119, 4, '2025-01-19', 2282.74, 'Cash', 'varun.mehra@pharma.co.in'),
(20, 120, 5, '2025-01-20', 1888.66, 'Net Banking', 'umesh.george@healthplus.com'),
(21, 121, 1, '2025-01-21', 4022.63, 'Credit Card', 'anil.yadav@pharma.co.in'),
(22, 122, 5, '2025-01-22', 2926.36, 'UPI', 'chirag.george@lifeline.in'),
(23, 123, 2, '2025-01-23', 1803.52, 'Cash', 'mahesh.tiwari@healthplus.com'),
(24, 124, 5, '2025-01-24', 561.13, 'Cash', 'arpita.kumar@lifeline.in'),
(25, 125, 1, '2025-01-25', 2423.66, 'UPI', 'krishna.das@medicare.org'),
(26, 126, 5, '2025-01-26', 232.95, 'Debit Card', 'wasim.mishra@lifeline.in'),
(27, 127, 1, '2025-01-27', 4047.27, 'Net Banking', 'rahul.banerjee@healthplus.com'),
(28, 128, 5, '2025-01-28', 726.29, 'Cash', 'krishna.nigam@outlook.com'),
(29, 129, 4, '2025-01-29', 2612.59, 'Debit Card', 'suresh.mehra@rediffmail.com'),
(30, 130, 2, '2025-01-30', 4724.35, 'Cash', 'fatima.pawar@lifeline.in'),
(31, 131, 3, '2025-01-31', 4681.03, 'Cash', 'wasim.dutta@hotmail.com'),
(32, 132, 1, '2025-02-01', 1545.41, 'Debit Card', 'amit.gill@hotmail.com'),
(33, 133, 5, '2025-02-02', 685.16, 'Credit Card', 'rajiv.das@rediffmail.com'),
(34, 134, 2, '2025-02-03', 4072.65, 'Debit Card', 'nisha.sharma@gmail.com'),
(35, 135, 5, '2025-02-04', 2806.64, 'Net Banking', 'tanvi.dutta@healthplus.com'),
(36, 136, 3, '2025-02-05', 4191.75, 'UPI', 'karan.joshi@rediffmail.com'),
(37, 137, 3, '2025-02-06', 1891.21, 'Net Banking', 'deepa.desai@hotmail.com'),
(38, 138, 3, '2025-02-07', 585.64, 'UPI', 'manish.banerjee@outlook.com'),
(39, 139, 1, '2025-02-08', 4081.29, 'Net Banking', 'rajiv.thomas@pharma.co.in'),
(40, 140, 4, '2025-02-09', 3713.98, 'Credit Card', 'umesh.tiwari@hotmail.com'),
(41, 141, 3, '2025-02-10', 1150.33, 'Credit Card', 'qadir.grewal@medicare.org'),
(42, 142, 2, '2025-02-11', 3503.68, 'Debit Card', 'fatima.gill@gmail.com'),
(43, 143, 1, '2025-02-12', 1212.07, 'Cash', 'sarita.soni@outlook.com'),
(44, 144, 3, '2025-02-13', 3398.62, 'Debit Card', 'deepa.pathak@gmail.com'),
(45, 145, 5, '2025-02-14', 2301.56, 'Debit Card', 'wasim.chandra@healthplus.com'),
(46, 146, 2, '2025-02-15', 3564.08, 'UPI', 'manish.sandhu@gmail.com'),
(47, 147, 4, '2025-02-16', 2095.09, 'Credit Card', 'anita.ali@gmail.com'),
(48, 148, 3, '2025-02-17', 3173.08, 'Credit Card', 'suresh.verma@wellcare.com'),
(49, 149, 5, '2025-02-18', 3135.48, 'Net Banking', 'wasim.singh@hotmail.com'),
(50, 150, 1, '2025-02-19', 579.72, 'Credit Card', 'farhan.yadav@wellcare.com'),
(51, 151, 1, '2025-02-20', 3246.6, 'Cash', 'pooja.nair@outlook.com'),
(52, 152, 3, '2025-02-21', 3524.04, 'UPI', 'ajay.menon@healthplus.com'),
(53, 153, 4, '2025-02-22', 3975.04, 'Debit Card', 'anita.banerjee@medicare.org'),
(54, 154, 5, '2025-02-23', 1024.75, 'UPI', 'zara.sen@yahoo.com'),
(55, 155, 4, '2025-02-24', 3234.85, 'Credit Card', 'yogesh.pillai@healthplus.com'),
(56, 156, 1, '2025-02-25', 910.36, 'Cash', 'maria.desai@healthplus.com'),
(57, 157, 4, '2025-02-26', 3910.32, 'Net Banking', 'maria.kulkarni@outlook.com'),
(58, 158, 5, '2025-02-27', 1524.79, 'Net Banking', 'wasim.kulkarni@gmail.com'),
(59, 159, 3, '2025-02-28', 1189.52, 'Net Banking', 'priya.nigam@yahoo.com'),
(60, 160, 4, '2025-03-01', 2235.65, 'Credit Card', 'arpita.fernandes@medicare.org'),
(61, 161, 3, '2025-03-02', 1987.23, 'Credit Card', 'omkar.mishra@gmail.com'),
(62, 162, 3, '2025-03-03', 1368.35, 'UPI', 'priya.banerjee@medicare.org'),
(63, 163, 4, '2025-03-04', 4092.59, 'Credit Card', 'zara.tiwari@pharma.co.in'),
(64, 164, 1, '2025-03-05', 2969.54, 'UPI', 'anita.pathak@healthplus.com'),
(65, 165, 3, '2025-03-06', 1617.39, 'Net Banking', 'mahesh.grewal@outlook.com'),
(66, 166, 5, '2025-03-07', 2351.86, 'UPI', 'deepa.grewal@yahoo.com'),
(67, 167, 1, '2025-03-08', 4749.31, 'Net Banking', 'rajiv.nair@yahoo.com'),
(68, 168, 5, '2025-03-09', 2486.24, 'Credit Card', 'amit.kumar@wellcare.com'),
(69, 169, 1, '2025-03-10', 3354.25, 'Cash', 'leena.chandra@rediffmail.com'),
(70, 170, 2, '2025-03-11', 4378.47, 'Cash', 'rohit.gupta@pharma.co.in'),
(71, 171, 1, '2025-03-12', 4360.17, 'Debit Card', 'esha.sheikh@lifeline.in'),
(72, 172, 3, '2025-03-13', 4155.67, 'Debit Card', 'arpita.banerjee@lifeline.in'),
(73, 173, 3, '2025-03-14', 1357.96, 'Net Banking', 'sneha.iyer@lifeline.in'),
(74, 174, 2, '2025-03-15', 3697.43, 'Net Banking', 'anita.shah@medicare.org'),
(75, 175, 2, '2025-03-16', 2454.05, 'Credit Card', 'umesh.sen@lifeline.in'),
(76, 176, 2, '2025-03-17', 1105, 'UPI', 'divya.soni@gmail.com'),
(77, 177, 5, '2025-03-18', 3821.22, 'Net Banking', 'tanvi.khan@yahoo.com'),
(78, 178, 3, '2025-03-19', 386.26, 'Debit Card', 'chirag.singh@healthplus.com'),
(79, 179, 5, '2025-03-20', 2395.32, 'Cash', 'devika.grewal@yahoo.com'),
(80, 180, 4, '2025-03-21', 4239.79, 'Credit Card', 'arpita.shah@medicare.org'),
(81, 181, 4, '2025-03-22', 1872.65, 'Cash', 'divya.thomas@hotmail.com'),
(82, 182, 4, '2025-03-23', 4281.35, 'Credit Card', 'krishna.patel@outlook.com'),
(83, 183, 4, '2025-03-24', 1155, 'Credit Card', 'anil.verma@gmail.com'),
(84, 184, 2, '2025-03-25', 2545.55, 'UPI', 'chirag.desai@hotmail.com'),
(85, 185, 5, '2025-03-26', 2935.5, 'Cash', 'suresh.chandra@rediffmail.com'),
(86, 186, 5, '2025-03-27', 3667, 'Credit Card', 'rajiv.kulkarni@hotmail.com'),
(87, 187, 4, '2025-03-28', 4838.59, 'Credit Card', 'leena.ali@pharma.co.in'),
(88, 188, 5, '2025-03-29', 2988.18, 'Cash', 'yogesh.tiwari@outlook.com'),
(89, 189, 2, '2025-03-30', 3667.12, 'Credit Card', 'varun.mehra@hotmail.com'),
(90, 190, 2, '2025-03-31', 1765.69, 'Net Banking', 'krishna.pawar@yahoo.com'),
(91, 191, 5, '2025-04-01', 2393.46, 'Debit Card', 'deepa.singh@hotmail.com'),
(92, 192, 1, '2025-04-02', 3470.2, 'Credit Card', 'sunita.patel@healthplus.com'),
(93, 193, 1, '2025-04-03', 3531.91, 'Cash', 'ramesh.joseph@healthplus.com'),
(94, 194, 4, '2025-04-04', 370.44, 'Credit Card', 'xavier.nigam@pharma.co.in'),
(95, 195, 3, '2025-04-05', 2364.88, 'Cash', 'arpita.yadav@outlook.com'),
(96, 196, 2, '2025-04-06', 1585.14, 'Cash', 'divya.jain@medicare.org'),
(97, 197, 2, '2025-04-07', 2034.85, 'Net Banking', 'alka.pandey@healthplus.com'),
(98, 198, 5, '2025-04-08', 656.59, 'Credit Card', 'deepa.ahuja@hotmail.com'),
(99, 199, 3, '2025-04-09', 3625.04, 'Cash', 'anil.menon@rediffmail.com'),
(100, 200, 2, '2025-04-10', 4302.25, 'Credit Card', 'leena.pandey@healthplus.com'),
(101, 101, NULL, '2025-08-19', 120, 'cash', 'rahul.pillai@healthplus.com'),
(102, 101, NULL, '2025-08-19', 25, 'cash', 'rahul.pillai@healthplus.com'),
(103, 101, NULL, '2025-08-19', 25, 'cash', 'rahul.pillai@healthplus.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(20) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_gender` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_no` bigint(10) NOT NULL,
  `customer_email_id` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_gender`, `date_of_birth`, `contact_no`, `customer_email_id`, `address`) VALUES
(101, 'Rahul Pillai', 'Male', '1985-07-12', 9876543210, 'rahul.pillai@healthplus.com', '12 MG Road, Kochi'),
(102, 'Tanvi Sandhu', 'Female', '1990-09-21', 8765432109, 'tanvi.sandhu@gmail.com', '44 Sector 17, Chandigarh'),
(103, 'Harish Soni', 'Male', '1988-02-11', 7654321098, 'harish.soni@hotmail.com', '7 Civil Lines, Bhopal'),
(104, 'Meena Raghavan', 'Female', '1992-06-19', 6543210987, 'meena.raghavan@yahoo.com', '23 Brigade Road, Bengaluru'),
(105, 'Arvind Nair', 'Male', '1986-03-05', 9123456789, 'arvind.nair@pharma.co.in', '88 Aluva, Ernakulam'),
(106, 'Shweta Mishra', 'Female', '1991-11-23', 9234567890, 'shweta.mishra@gmail.com', '67 Hazratganj, Lucknow'),
(107, 'Gopal Krishnan', 'Male', '1987-08-17', 9345678901, 'gopal.krishnan@outlook.com', '34 T Nagar, Chennai'),
(108, 'Anita Sharma', 'Female', '1993-04-29', 9456789012, 'anita.sharma@gmail.com', '21 C G Road, Ahmedabad'),
(109, 'Vikram Desai', 'Male', '1989-12-15', 9567890123, 'vikram.desai@yahoo.com', '56 Koregaon Park, Pune'),
(110, 'Ritu Verma', 'Female', '1995-01-10', 9678901234, 'ritu.verma@hotmail.com', '11 Salt Lake, Kolkata'),
(111, 'Sandeep Menon', 'Male', '1984-10-05', 9789012345, 'sandeep.menon@pharma.co.in', '4 Vyttila, Kochi'),
(112, 'Pooja Kapoor', 'Female', '1990-05-21', 9890123456, 'pooja.kapoor@gmail.com', '88 Andheri East, Mumbai'),
(113, 'Ramesh Gupta', 'Male', '1987-07-09', 9901234567, 'ramesh.gupta@yahoo.com', '23 Kothrud, Pune'),
(114, 'Neelam Kaur', 'Female', '1992-08-14', 9012345678, 'neelam.kaur@outlook.com', '14 Sector 35, Chandigarh'),
(115, 'Anil Khanna', 'Male', '1988-11-27', 9123456701, 'anil.khanna@gmail.com', '45 Civil Lines, Delhi'),
(116, 'Divya Iyer', 'Female', '1991-02-06', 9234567812, 'divya.iyer@hotmail.com', '78 Mylapore, Chennai'),
(117, 'Sunil Yadav', 'Male', '1986-09-12', 9345678923, 'sunil.yadav@gmail.com', '31 Charbagh, Lucknow'),
(118, 'Kavita Joshi', 'Female', '1993-12-04', 9456789034, 'kavita.joshi@yahoo.com', '67 Sadashiv Peth, Pune'),
(119, 'Naveen Reddy', 'Male', '1989-03-18', 9567890145, 'naveen.reddy@pharma.co.in', '22 Banjara Hills, Hyderabad'),
(120, 'Sneha Bhatnagar', 'Female', '1994-07-27', 9678901256, 'sneha.bhatnagar@gmail.com', '19 Connaught Place, Delhi'),
(121, 'Rajesh Malhotra', 'Male', '1987-01-09', 9789012367, 'rajesh.malhotra@yahoo.com', '21 Sector 18, Noida'),
(122, 'Aarti Deshpande', 'Female', '1992-03-11', 9890123478, 'aarti.deshpande@gmail.com', '44 Camp Road, Pune'),
(123, 'Manoj Kumar', 'Male', '1985-06-22', 9901234589, 'manoj.kumar@outlook.com', '15 Koti, Hyderabad'),
(124, 'Rashmi Singh', 'Female', '1991-10-30', 9012345690, 'rashmi.singh@yahoo.com', '77 Rajendra Nagar, Indore'),
(125, 'Prakash Shetty', 'Male', '1988-05-14', 9123456712, 'prakash.shetty@pharma.co.in', '67 MG Road, Bengaluru'),
(126, 'Megha Arora', 'Female', '1994-01-25', 9234567823, 'megha.arora@gmail.com', '34 Karol Bagh, Delhi'),
(127, 'Ajay Saxena', 'Male', '1987-04-18', 9345678934, 'ajay.saxena@outlook.com', '23 Sector 14, Gurugram'),
(128, 'Rina Ghosh', 'Female', '1993-09-03', 9456789045, 'rina.ghosh@hotmail.com', '88 Ballygunge, Kolkata'),
(129, 'Mohit Choudhary', 'Male', '1989-11-07', 9567890156, 'mohit.choudhary@gmail.com', '10 Malviya Nagar, Jaipur'),
(130, 'Preeti Agarwal', 'Female', '1995-02-16', 9678901267, 'preeti.agarwal@yahoo.com', '55 Satellite, Ahmedabad'),
(131, 'Vivek Shah', 'Male', '1986-08-11', 9789012378, 'vivek.shah@pharma.co.in', '12 Law Garden, Ahmedabad'),
(132, 'Shilpa Nanda', 'Female', '1992-06-08', 9890123489, 'shilpa.nanda@gmail.com', '21 Salt Lake, Kolkata'),
(133, 'Alok Ranjan', 'Male', '1988-10-01', 9901234590, 'alok.ranjan@outlook.com', '66 Fraser Road, Patna'),
(134, 'Maya Pillai', 'Female', '1993-12-20', 9012345611, 'maya.pillai@yahoo.com', '77 MG Road, Kochi'),
(135, 'Suresh Patil', 'Male', '1987-02-28', 9123456722, 'suresh.patil@gmail.com', '32 FC Road, Pune'),
(136, 'Lata Kapoor', 'Female', '1991-05-09', 9234567833, 'lata.kapoor@outlook.com', '19 Model Town, Delhi'),
(137, 'Rohit Sinha', 'Male', '1985-09-17', 9345678944, 'rohit.sinha@hotmail.com', '44 Sector 62, Noida'),
(138, 'Anu George', 'Female', '1994-03-28', 9456789055, 'anu.george@gmail.com', '23 MG Road, Bengaluru'),
(139, 'Kapil Dev', 'Male', '1989-07-22', 9567890166, 'kapil.dev@pharma.co.in', '88 Janpath, Delhi'),
(140, 'Neetu Yadav', 'Female', '1992-11-12', 9678901277, 'neetu.yadav@yahoo.com', '11 Sector 20, Chandigarh'),
(141, 'Rajat Mehta', 'Male', '1988-01-03', 9789012389, 'rajat.mehta@gmail.com', '22 CG Road, Ahmedabad'),
(142, 'Kiran Bhosle', 'Female', '1993-08-14', 9890123490, 'kiran.bhosle@outlook.com', '65 Shivaji Nagar, Pune'),
(143, 'Nitin Garg', 'Male', '1986-04-25', 9901234591, 'nitin.garg@gmail.com', '34 Hazratganj, Lucknow'),
(144, 'Pallavi Rane', 'Female', '1991-12-05', 9012345622, 'pallavi.rane@hotmail.com', '12 Vashi, Navi Mumbai'),
(145, 'Arun Venkatesh', 'Male', '1987-03-15', 9123456733, 'arun.venkatesh@outlook.com', '56 Mylapore, Chennai'),
(146, 'Seema Tripathi', 'Female', '1992-09-18', 9234567844, 'seema.tripathi@gmail.com', '45 Rajaji Nagar, Bengaluru'),
(147, 'Kunal Rana', 'Male', '1989-06-30', 9345678955, 'kunal.rana@gmail.com', '88 Indiranagar, Bangalore'),
(148, 'Monica D\'Souza', 'Female', '1994-05-22', 9456789066, 'monica.dsouza@yahoo.com', '14 Colaba, Mumbai'),
(149, 'Ashok Jain', 'Male', '1986-10-11', 9567890177, 'ashok.jain@gmail.com', '34 Station Road, Jaipur'),
(150, 'Bhavna Shah', 'Female', '1993-07-29', 9678901288, 'bhavna.shah@outlook.com', '56 Navrangpura, Ahmedabad'),
(151, 'Varun Krishnan', 'Male', '1987-11-19', 9789012399, 'varun.krishnan@yahoo.com', '22 MG Road, Kochi'),
(152, 'Rekha Yadav', 'Female', '1991-04-06', 9890123401, 'rekha.yadav@gmail.com', '77 Gomti Nagar, Lucknow'),
(153, 'Mahesh Chauhan', 'Male', '1988-12-23', 9901234502, 'mahesh.chauhan@outlook.com', '33 Sector 9, Chandigarh'),
(154, 'Rupal Shah', 'Female', '1995-02-01', 9012345633, 'rupal.shah@gmail.com', '12 Ellisbridge, Ahmedabad'),
(155, 'Girish Kulkarni', 'Male', '1986-08-09', 9123456744, 'girish.kulkarni@yahoo.com', '99 Kothrud, Pune'),
(156, 'Anjana Reddy', 'Female', '1992-11-26', 9234567855, 'anjana.reddy@gmail.com', '22 Banjara Hills, Hyderabad'),
(157, 'Devendra Sharma', 'Male', '1989-05-18', 9345678966, 'devendra.sharma@gmail.com', '44 Aliganj, Lucknow'),
(158, 'Priyanka Iyer', 'Female', '1994-08-14', 9456789077, 'priyanka.iyer@outlook.com', '11 T Nagar, Chennai'),
(159, 'Sanjay Ghosh', 'Male', '1987-02-07', 9567890188, 'sanjay.ghosh@hotmail.com', '65 Howrah, Kolkata'),
(160, 'Meenal Jain', 'Female', '1990-10-20', 9678901299, 'meenal.jain@gmail.com', '23 Malviya Nagar, Delhi'),
(161, 'Lokesh Verma', 'Male', '1985-06-09', 9789012400, 'lokesh.verma@gmail.com', '18 Indira Nagar, Bengaluru'),
(162, 'Sangeeta Nair', 'Female', '1993-01-15', 9890123412, 'sangeeta.nair@yahoo.com', '33 MG Road, Kochi'),
(163, 'Abhishek Tiwari', 'Male', '1989-09-22', 9901234513, 'abhishek.tiwari@outlook.com', '45 Rajendra Nagar, Indore'),
(164, 'Radhika Mehta', 'Female', '1991-07-02', 9012345644, 'radhika.mehta@gmail.com', '77 Law Garden, Ahmedabad'),
(165, 'Pankaj Agarwal', 'Male', '1986-03-26', 9123456755, 'pankaj.agarwal@gmail.com', '19 Hazratganj, Lucknow'),
(166, 'Shruti Kapoor', 'Female', '1992-09-14', 9234567866, 'shruti.kapoor@yahoo.com', '56 Karol Bagh, Delhi'),
(167, 'Rajiv Menon', 'Male', '1988-12-30', 9345678977, 'rajiv.menon@gmail.com', '88 Edappally, Kochi'),
(168, 'Swati Sharma', 'Female', '1995-04-10', 9456789088, 'swati.sharma@gmail.com', '32 Gomti Nagar, Lucknow'),
(169, 'Akhil Reddy', 'Male', '1987-08-02', 9567890199, 'akhil.reddy@outlook.com', '43 Jubilee Hills, Hyderabad'),
(170, 'Pooja Bansal', 'Female', '1991-02-27', 9678901300, 'pooja.bansal@gmail.com', '99 Model Town, Delhi'),
(171, 'Suraj Gupta', 'Male', '1985-09-23', 9789012411, 'suraj.gupta@yahoo.com', '27 Sector 14, Gurugram'),
(172, 'Neha Saxena', 'Female', '1993-05-06', 9890123423, 'neha.saxena@gmail.com', '12 Aliganj, Lucknow'),
(173, 'Vinod Joshi', 'Male', '1989-11-19', 9901234524, 'vinod.joshi@gmail.com', '55 Model Colony, Pune'),
(174, 'Alka Rani', 'Female', '1992-01-22', 9012345655, 'alka.rani@outlook.com', '33 Rajajinagar, Bengaluru'),
(175, 'Mukesh Choudhary', 'Male', '1987-07-15', 9123456766, 'mukesh.choudhary@gmail.com', '76 Malviya Nagar, Jaipur'),
(176, 'Nisha Kapoor', 'Female', '1994-10-28', 9234567877, 'nisha.kapoor@gmail.com', '21 South Extension, Delhi'),
(177, 'Keshav Kumar', 'Male', '1988-04-08', 9345678988, 'keshav.kumar@yahoo.com', '19 Fraser Road, Patna'),
(178, 'Rupal Mehta', 'Female', '1990-12-19', 9456789099, 'rupal.mehta@gmail.com', '22 Ellisbridge, Ahmedabad'),
(179, 'Chetan Sinha', 'Male', '1986-06-27', 9567890201, 'chetan.sinha@gmail.com', '66 Sector 62, Noida'),
(180, 'Sonali Deshmukh', 'Female', '1993-08-11', 9678901312, 'sonali.deshmukh@hotmail.com', '77 FC Road, Pune'),
(181, 'Aman Chopra', 'Male', '1989-02-02', 9789012422, 'aman.chopra@gmail.com', '44 Connaught Place, Delhi'),
(182, 'Shalini Rao', 'Female', '1995-05-29', 9890123434, 'shalini.rao@gmail.com', '21 BTM Layout, Bengaluru'),
(183, 'Parth Patel', 'Male', '1987-12-21', 9901234535, 'parth.patel@yahoo.com', '11 Ellisbridge, Ahmedabad'),
(184, 'Reema Reddy', 'Female', '1991-09-03', 9012345666, 'reema.reddy@gmail.com', '99 Banjara Hills, Hyderabad'),
(185, 'Harish Nair', 'Male', '1988-03-13', 9123456777, 'harish.nair@outlook.com', '33 Vyttila, Kochi'),
(186, 'Smita Ghosh', 'Female', '1992-11-30', 9234567888, 'smita.ghosh@gmail.com', '56 Howrah, Kolkata'),
(187, 'Dhruv Sharma', 'Male', '1986-01-18', 9345678999, 'dhruv.sharma@gmail.com', '18 Hazratganj, Lucknow'),
(188, 'Tanya Malhotra', 'Female', '1993-07-12', 9456789100, 'tanya.malhotra@yahoo.com', '22 South Extension, Delhi'),
(189, 'Raj Malviya', 'Male', '1989-05-09', 9567890211, 'raj.malviya@gmail.com', '12 C Scheme, Jaipur'),
(190, 'Kiran Arora', 'Female', '1991-03-14', 9678901322, 'kiran.arora@gmail.com', '45 Sector 17, Chandigarh'),
(191, 'Sameer Desai', 'Male', '1987-10-28', 9789012433, 'sameer.desai@outlook.com', '66 Camp, Pune'),
(192, 'Alisha Khan', 'Female', '1994-12-22', 9890123445, 'alisha.khan@gmail.com', '34 Lalbagh, Lucknow'),
(193, 'Puneet Bansal', 'Male', '1986-06-15', 9901234544, 'puneet.bansal@gmail.com', '21 T Nagar, Chennai'),
(194, 'Geeta Pillai', 'Female', '1992-02-18', 9012345677, 'geeta.pillai@yahoo.com', '88 MG Road, Kochi'),
(195, 'Shivam Gupta', 'Male', '1988-09-07', 9123456788, 'shivam.gupta@gmail.com', '33 Model Town, Delhi'),
(196, 'Ankita Verma', 'Female', '1993-11-28', 9234567899, 'ankita.verma@gmail.com', '12 Aliganj, Lucknow'),
(197, 'Yashwant Rao', 'Male', '1989-04-03', 9345678900, 'yashwant.rao@pharma.co.in', '76 Shivaji Nagar, Pune'),
(198, 'Pallavi Kulkarni', 'Female', '1991-08-25', 9456789001, 'pallavi.kulkarni@gmail.com', '22 FC Road, Pune'),
(199, 'Arvind Mishra', 'Male', '1987-12-16', 9567890222, 'arvind.mishra@gmail.com', '19 C G Road, Ahmedabad'),
(200, 'Leena Pandey', 'Female', '1993-04-16', 9234567890, 'leena.pandey@healthplus.com', '9 MG Road, Lucknow');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `med_id` bigint(15) NOT NULL,
  `med_name` varchar(30) NOT NULL,
  `manufacture_name` varchar(30) NOT NULL,
  `med_type` varchar(50) NOT NULL,
  `med_price` double NOT NULL,
  `quantity` bigint(15) NOT NULL,
  `mfg_date` date NOT NULL,
  `exp_date` date NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`med_id`, `med_name`, `manufacture_name`, `med_type`, `med_price`, `quantity`, `mfg_date`, `exp_date`, `description`) VALUES
(1, 'Paracetamol 500mg', 'Cipla Ltd.', 'Tablet', 25, 200, '2023-05-12', '2026-05-11', 'Fever and mild pain relief'),
(2, 'Dolo-650', 'Micro Labs', 'Tablet', 30, 300, '2023-06-01', '2026-05-31', 'Pain reliever and antipyretic'),
(3, 'Amoxicillin 250mg', 'Sun Pharma', 'Capsule', 90, 175, '2023-04-18', '2026-04-17', 'Antibiotic for bacterial infections'),
(4, 'Azithromycin 500mg', 'Dr. Reddy\'s Labs', 'Tablet', 120, 97, '2023-03-22', '2026-03-21', 'Antibiotic for respiratory infections'),
(5, 'Cough Syrup 100ml', 'Pfizer India', 'Syrup', 60, 248, '2023-07-10', '2025-07-09', 'Relieves cough and throat irritation'),
(6, 'Insulin Injection 10ml', 'Novo Nordisk', 'Injection', 450, 80, '2023-09-05', '2025-09-04', 'Controls blood sugar in diabetes'),
(7, 'Cetirizine 10mg', 'Cipla Ltd.', 'Tablet', 15, 400, '2024-02-01', '2027-01-31', 'Relieves allergy symptoms'),
(8, 'Metformin 500mg', 'Sun Pharma', 'Tablet', 50, 300, '2023-06-15', '2026-06-14', 'Used to control blood sugar in diabetes'),
(9, 'Vitamin D3 60k IU', 'Alkem Labs', 'Capsule', 40, 200, '2023-08-20', '2026-08-19', 'Vitamin D supplement'),
(10, 'Omeprazole 20mg', 'Torrent Pharma', 'Capsule', 65, 250, '2023-04-11', '2026-04-10', 'Used for acidity and ulcers'),
(11, 'Aspirin 75mg', 'Bayer Zydus', 'Tablet', 55, 180, '2023-01-05', '2026-01-04', 'Blood thinner for heart patients'),
(12, 'Ibuprofen 400mg', 'Cipla Ltd.', 'Tablet', 70, 220, '2023-02-14', '2026-02-13', 'Pain relief and anti-inflammatory'),
(13, 'Pantoprazole 40mg', 'Sun Pharma', 'Tablet', 80, 210, '2023-03-30', '2026-03-29', 'Used for acidity and GERD'),
(14, 'Levocetirizine 5mg', 'Dr. Reddy\'s Labs', 'Tablet', 25, 260, '2023-04-20', '2026-04-19', 'Allergy and cold relief'),
(15, 'Losartan 50mg', 'Torrent Pharma', 'Tablet', 95, 170, '2023-05-17', '2026-05-16', 'Used to treat high blood pressure'),
(16, 'Atorvastatin 10mg', 'Pfizer India', 'Tablet', 120, 140, '2023-06-21', '2026-06-20', 'Lowers cholesterol'),
(17, 'Domperidone 10mg', 'Alkem Labs', 'Tablet', 35, 190, '2023-07-09', '2026-07-08', 'Used for nausea and vomiting'),
(18, 'Rabeprazole 20mg', 'Cipla Ltd.', 'Tablet', 75, 240, '2023-08-25', '2026-08-24', 'Reduces stomach acid'),
(19, 'Salbutamol Inhaler 100mcg', 'GlaxoSmithKline', 'Inhaler', 250, 90, '2023-09-12', '2025-09-11', 'Asthma relief inhaler'),
(20, 'Prednisolone 5mg', 'Sun Pharma', 'Tablet', 40, 130, '2023-10-18', '2026-10-17', 'Steroid used for inflammation'),
(21, 'Thyroxine 50mcg', 'Abbott India', 'Tablet', 60, 220, '2023-11-05', '2026-11-04', 'Thyroid hormone replacement'),
(22, 'Amiodarone 200mg', 'Dr. Reddy\'s Labs', 'Tablet', 160, 100, '2023-12-22', '2026-12-21', 'Used for irregular heartbeat'),
(23, 'Montelukast 10mg', 'Cipla Ltd.', 'Tablet', 85, 230, '2023-07-02', '2026-07-01', 'Prevents asthma and allergies'),
(24, 'Clopidogrel 75mg', 'Sun Pharma', 'Tablet', 140, 120, '2023-06-11', '2026-06-10', 'Blood thinner for heart patients'),
(25, 'Fluconazole 150mg', 'Cipla Ltd.', 'Tablet', 110, 200, '2023-03-27', '2026-03-26', 'Antifungal medicine'),
(26, 'Hydroxychloroquine 200mg', 'Ipca Labs', 'Tablet', 95, 140, '2023-04-15', '2026-04-14', 'Used for malaria and arthritis'),
(27, 'Insulin Glargine 10ml', 'Sanofi India', 'Injection', 500, 70, '2023-09-30', '2025-09-29', 'Long-acting insulin for diabetes'),
(28, 'Iron Syrup 150ml', 'Alkem Labs', 'Syrup', 75, 180, '2023-08-05', '2025-08-04', 'Iron supplement for anemia'),
(29, 'Vitamin C 500mg', 'Cipla Ltd.', 'Tablet', 35, 400, '2023-12-01', '2026-11-30', 'Vitamin supplement'),
(30, 'Zinc Sulphate 20mg', 'Sun Pharma', 'Tablet', 45, 260, '2023-01-15', '2026-01-14', 'Supplement for immunity'),
(31, 'Calcium Carbonate 500mg', 'Torrent Pharma', 'Tablet', 80, 300, '2023-02-20', '2026-02-19', 'Calcium supplement for bones'),
(32, 'Magnesium Hydroxide Syrup 200m', 'Pfizer India', 'Syrup', 95, 140, '2023-03-08', '2025-03-07', 'Used for constipation and acidity'),
(33, 'Folic Acid 5mg', 'Cipla Ltd.', 'Tablet', 25, 350, '2023-04-29', '2026-04-28', 'Vitamin B9 supplement'),
(34, 'Multivitamin Syrup 150ml', 'Dr. Reddy\'s Labs', 'Syrup', 120, 160, '2023-06-07', '2025-06-06', 'Multivitamin supplement'),
(35, 'ORS Solution 200ml', 'Cipla Ltd.', 'Solution', 30, 500, '2023-07-21', '2025-07-20', 'Oral rehydration solution'),
(36, 'Hydrocortisone Cream 1%', 'Sun Pharma', 'Ointment', 65, 120, '2023-05-15', '2025-05-14', 'Skin inflammation and rashes'),
(37, 'Betadine Ointment 15g', 'Win-Medicare', 'Ointment', 45, 200, '2023-09-01', '2025-08-31', 'Antiseptic ointment for wounds'),
(38, 'Loratadine 10mg', 'Cipla Ltd.', 'Tablet', 35, 210, '2023-10-12', '2026-10-11', 'Used for allergies'),
(39, 'Diclofenac Gel 30g', 'Sun Pharma', 'Ointment', 70, 180, '2023-11-08', '2025-11-07', 'Relief from joint and muscle pain'),
(40, 'Chlorpheniramine 4mg', 'Alkem Labs', 'Tablet', 20, 250, '2023-12-14', '2026-12-13', 'Used for common cold and allergies'),
(41, 'Ranitidine 150mg', 'Torrent Pharma', 'Tablet', 55, 190, '2023-01-27', '2026-01-26', 'Used for acidity and ulcers'),
(42, 'Levofloxacin 500mg', 'Cipla Ltd.', 'Tablet', 160, 100, '2023-03-13', '2026-03-12', 'Antibiotic for bacterial infections'),
(43, 'Dexamethasone 0.5mg', 'Sun Pharma', 'Tablet', 70, 140, '2023-05-09', '2026-05-08', 'Steroid used for inflammation'),
(44, 'Albendazole 400mg', 'GlaxoSmithKline', 'Tablet', 40, 280, '2023-07-16', '2026-07-15', 'Deworming medicine'),
(45, 'Ivermectin 12mg', 'Sun Pharma', 'Tablet', 120, 150, '2023-08-23', '2026-08-22', 'Used for parasitic infections'),
(46, 'Acetaminophen Syrup 120ml', 'Cipla Ltd.', 'Syrup', 55, 200, '2023-09-19', '2025-09-18', 'Fever reducer and pain relief'),
(47, 'Cefixime 200mg', 'Dr. Reddy\'s Labs', 'Tablet', 180, 110, '2023-11-25', '2026-11-24', 'Antibiotic for bacterial infections'),
(48, 'Norfloxacin 400mg', 'Sun Pharma', 'Tablet', 135, 130, '2023-12-03', '2026-12-02', 'Antibiotic for urinary tract infection'),
(49, 'Loperamide 2mg', 'Cipla Ltd.', 'Tablet', 45, 220, '2023-10-29', '2026-10-28', 'Used to stop diarrhea'),
(50, 'Ondansetron 4mg', 'Sun Pharma', 'Tablet', 90, 160, '2023-09-14', '2026-09-13', 'Prevents nausea and vomiting'),
(51, 'Glibenclamide 5mg', 'Torrent Pharma', 'Tablet', 75, 140, '2023-06-22', '2026-06-21', 'Used to lower blood sugar'),
(52, 'Pioglitazone 15mg', 'Sun Pharma', 'Tablet', 95, 150, '2023-07-17', '2026-07-16', 'Diabetes treatment'),
(53, 'Gliclazide 80mg', 'Cipla Ltd.', 'Tablet', 120, 130, '2023-08-14', '2026-08-13', 'Diabetes medicine'),
(54, 'Rosuvastatin 10mg', 'Sun Pharma', 'Tablet', 160, 120, '2023-09-09', '2026-09-08', 'Cholesterol-lowering medicine'),
(55, 'Amlodipine 5mg', 'Pfizer India', 'Tablet', 85, 190, '2023-10-04', '2026-10-03', 'Used for hypertension'),
(56, 'Bisoprolol 5mg', 'Cipla Ltd.', 'Tablet', 140, 110, '2023-11-01', '2026-10-31', 'Used for heart diseases'),
(57, 'Telmisartan 40mg', 'Sun Pharma', 'Tablet', 130, 140, '2023-12-19', '2026-12-18', 'Used for high blood pressure'),
(58, 'Hydrochlorothiazide 25mg', 'Dr. Reddy\'s Labs', 'Tablet', 75, 150, '2023-05-06', '2026-05-05', 'Diuretic for blood pressure'),
(59, 'Spironolactone 25mg', 'Torrent Pharma', 'Tablet', 110, 130, '2023-07-28', '2026-07-27', 'Used for heart failure'),
(60, 'Furosemide 40mg', 'Cipla Ltd.', 'Tablet', 90, 160, '2023-08-19', '2026-08-18', 'Diuretic used for fluid retention'),
(61, 'Warfarin 5mg', 'Sun Pharma', 'Tablet', 140, 100, '2023-09-11', '2026-09-10', 'Blood thinner for clot prevention'),
(62, 'Heparin Injection 5ml', 'Pfizer India', 'Injection', 250, 80, '2023-10-26', '2025-10-25', 'Blood thinner injection'),
(63, 'Enoxaparin Injection 40mg', 'Sanofi India', 'Injection', 450, 70, '2023-11-14', '2025-11-13', 'Used for clot prevention'),
(64, 'Tranexamic Acid 500mg', 'Cipla Ltd.', 'Tablet', 160, 110, '2023-12-23', '2026-12-22', 'Used to stop bleeding'),
(65, 'Erythromycin 250mg', 'Sun Pharma', 'Tablet', 100, 150, '2023-01-19', '2026-01-18', 'Antibiotic medicine'),
(66, 'Clarithromycin 500mg', 'Dr. Reddy\'s Labs', 'Tablet', 180, 120, '2023-02-25', '2026-02-24', 'Antibiotic for infections'),
(67, 'Ceftriaxone Injection 1g', 'Alkem Labs', 'Injection', 350, 90, '2023-03-30', '2025-03-29', 'Broad spectrum antibiotic'),
(68, 'Meropenem Injection 500mg', 'Cipla Ltd.', 'Injection', 750, 60, '2023-04-22', '2025-04-21', 'Strong antibiotic injection'),
(69, 'Linezolid 600mg', 'Sun Pharma', 'Tablet', 220, 100, '2023-05-27', '2026-05-26', 'Antibiotic for resistant infections'),
(70, 'Doxycycline 100mg', 'Pfizer India', 'Capsule', 150, 120, '2023-06-11', '2026-06-10', 'Antibiotic used for infections'),
(71, 'Rifampicin 300mg', 'Lupin Pharma', 'Capsule', 180, 110, '2023-07-13', '2026-07-12', 'Used for tuberculosis treatment'),
(72, 'Ethambutol 800mg', 'Cipla Ltd.', 'Tablet', 200, 100, '2023-08-21', '2026-08-20', 'TB treatment medicine'),
(73, 'Isoniazid 300mg', 'Sun Pharma', 'Tablet', 170, 120, '2023-09-30', '2026-09-29', 'Tuberculosis antibiotic'),
(74, 'Pyrazinamide 500mg', 'Dr. Reddy\'s Labs', 'Tablet', 190, 100, '2023-10-19', '2026-10-18', 'Part of TB treatment'),
(75, 'Chloroquine 250mg', 'Ipca Labs', 'Tablet', 80, 150, '2023-11-07', '2026-11-06', 'Used for malaria treatment'),
(76, 'Artemether-Lumefantrine', 'Cipla Ltd.', 'Tablet', 210, 90, '2023-12-15', '2026-12-14', 'Antimalarial combination'),
(77, 'Oseltamivir 75mg', 'Sun Pharma', 'Capsule', 350, 110, '2023-01-22', '2026-01-21', 'Used for influenza treatment'),
(78, 'Remdesivir Injection 100mg', 'Dr. Reddy\'s Labs', 'Injection', 2800, 50, '2023-02-18', '2025-02-17', 'Used for viral infections'),
(79, 'Favipiravir 200mg', 'Glenmark Pharma', 'Tablet', 1200, 70, '2023-03-24', '2026-03-23', 'Antiviral medicine'),
(80, 'Zidovudine 300mg', 'Cipla Ltd.', 'Tablet', 400, 90, '2023-04-27', '2026-04-26', 'Used for HIV treatment'),
(81, 'Lamivudine 150mg', 'Sun Pharma', 'Tablet', 420, 80, '2023-05-18', '2026-05-17', 'HIV medicine'),
(82, 'Tenofovir 300mg', 'Dr. Reddy\'s Labs', 'Tablet', 500, 70, '2023-06-09', '2026-06-08', 'Antiviral for HIV/HBV'),
(83, 'Efavirenz 600mg', 'Aurobindo Pharma', 'Tablet', 550, 60, '2023-07-03', '2026-07-02', 'HIV antiviral medicine'),
(84, 'Dolutegravir 50mg', 'Sun Pharma', 'Tablet', 600, 60, '2023-08-12', '2026-08-11', 'HIV treatment'),
(85, 'Insulin Aspart 10ml', 'Novo Nordisk', 'Injection', 520, 75, '2023-09-15', '2025-09-14', 'Fast acting insulin'),
(86, 'Insulin Detemir 10ml', 'Novo Nordisk', 'Injection', 540, 70, '2023-10-23', '2025-10-22', 'Long acting insulin'),
(87, 'Insulin Lispro 10ml', 'Eli Lilly', 'Injection', 530, 65, '2023-11-29', '2025-11-28', 'Rapid acting insulin'),
(88, 'Human Insulin 40IU', 'Biocon Ltd.', 'Injection', 480, 80, '2023-12-08', '2025-12-07', 'Insulin for diabetes'),
(89, 'Glucometer Strips (50 pcs)', 'Accu-Chek', 'Device', 750, 120, '2023-06-30', '2026-06-29', 'Blood sugar monitoring strips'),
(90, 'Blood Pressure Monitor', 'Omron Healthcare', 'Device', 1800, 40, '2023-07-25', '2028-07-24', 'BP monitoring device'),
(91, 'Digital Thermometer', 'Dr. Morepen', 'Device', 250, 200, '2023-08-28', '2027-08-27', 'Fever measurement device'),
(92, 'Pulse Oximeter', 'BPL Medical', 'Device', 1200, 60, '2023-09-18', '2027-09-17', 'Oxygen level monitoring'),
(93, 'Nebulizer Machine', 'Philips Respironics', 'Device', 2200, 30, '2023-10-07', '2028-10-06', 'Used for asthma inhalation therapy'),
(94, 'First Aid Kit', 'Apollo Pharmacy', 'Kit', 500, 100, '2023-11-11', '2026-11-10', 'Basic first aid supplies'),
(95, 'Hand Sanitizer 500ml', 'Himalaya Wellness', 'Liquid', 180, 250, '2023-12-02', '2025-12-01', 'Kills germs and bacteria'),
(96, 'Face Mask N95 (Pack of 5)', '3M India', 'Mask', 350, 300, '2023-01-14', '2026-01-13', 'Respiratory protection mask'),
(97, 'Gloves (100 pcs)', 'Medicare Supplies', 'Disposable', 600, 150, '2023-02-06', '2026-02-05', 'Protective examination gloves'),
(98, 'Surgical Spirit 500ml', 'Cipla Ltd.', 'Liquid', 90, 180, '2023-03-19', '2026-03-18', 'Antiseptic solution'),
(99, 'Cotton Roll 500g', 'Apollo Pharmacy', 'Consumable', 150, 200, '2023-04-04', '2026-04-03', 'Medical absorbent cotton'),
(100, 'Bandage Roll 10cm x 5m', 'Medicare Supplies', 'Consumable', 120, 220, '2023-05-16', '2026-05-15', 'Used for wound dressing');

-- --------------------------------------------------------

--
-- Table structure for table `sales_history`
--

CREATE TABLE `sales_history` (
  `sale_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `med_id` bigint(15) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_history`
--

INSERT INTO `sales_history` (`sale_id`, `customer_id`, `staff_id`, `med_id`, `quantity`, `sale_date`, `total_price`) VALUES
(1, 176, 9, 87, 2, '2025-04-20 14:33:00', 1060),
(2, 199, 6, 72, 1, '2025-02-25 06:24:00', 200),
(3, 182, 6, 86, 4, '2025-03-27 14:07:00', 2160),
(4, 138, 1, 75, 2, '2025-04-22 08:49:00', 160),
(5, 154, 4, 96, 5, '2025-02-04 17:13:00', 1750),
(6, 164, 8, 58, 2, '2025-04-24 07:38:00', 150),
(7, 140, 2, 53, 4, '2025-01-28 21:30:00', 480),
(8, 141, 10, 71, 4, '2025-02-05 21:32:00', 720),
(9, 148, 9, 76, 2, '2025-02-01 01:11:00', 420),
(10, 103, 1, 61, 2, '2025-02-05 20:46:00', 280),
(11, 112, 9, 9, 4, '2025-01-16 16:07:00', 160),
(12, 169, 3, 48, 4, '2025-04-14 11:48:00', 540),
(13, 108, 3, 40, 3, '2025-04-13 11:56:00', 60),
(14, 109, 4, 80, 3, '2025-02-16 23:01:00', 1200),
(15, 121, 5, 28, 5, '2025-04-03 05:09:00', 375),
(16, 115, 1, 89, 1, '2025-04-14 05:57:00', 750),
(17, 132, 7, 26, 1, '2025-03-07 01:07:00', 95),
(18, 118, 1, 12, 1, '2025-04-21 11:00:00', 70),
(19, 190, 10, 35, 1, '2025-04-25 20:08:00', 30),
(20, 110, 9, 66, 4, '2025-03-08 03:29:00', 720),
(21, 141, 6, 74, 2, '2024-12-31 22:37:00', 380),
(22, 104, 1, 31, 2, '2025-03-22 13:04:00', 160),
(23, 173, 10, 30, 3, '2025-04-15 10:21:00', 135),
(24, 125, 1, 14, 4, '2025-01-02 06:13:00', 100),
(25, 106, 4, 69, 1, '2025-01-31 11:16:00', 220),
(26, 157, 3, 61, 3, '2025-03-02 18:53:00', 420),
(27, 128, 3, 59, 5, '2025-02-24 19:08:00', 550),
(28, 166, 2, 70, 5, '2025-03-14 14:54:00', 750),
(29, 163, 2, 96, 1, '2025-04-26 11:12:00', 350),
(30, 111, 9, 67, 1, '2025-03-11 19:09:00', 350),
(31, 129, 7, 15, 3, '2025-03-30 06:14:00', 285),
(32, 116, 4, 84, 5, '2025-01-19 21:33:00', 3000),
(33, 192, 3, 53, 5, '2025-01-25 10:51:00', 600),
(34, 143, 8, 23, 1, '2025-01-05 23:43:00', 85),
(35, 144, 1, 34, 1, '2025-04-02 11:25:00', 120),
(36, 141, 6, 97, 1, '2025-02-26 21:30:00', 600),
(37, 124, 4, 23, 4, '2025-03-15 06:20:00', 340),
(38, 143, 9, 23, 1, '2025-04-24 05:27:00', 85),
(39, 195, 2, 18, 4, '2025-01-17 00:40:00', 300),
(40, 179, 9, 24, 5, '2025-03-11 05:59:00', 700),
(41, 164, 3, 98, 2, '2025-03-15 08:21:00', 180),
(42, 188, 10, 26, 4, '2025-01-10 20:31:00', 380),
(43, 183, 5, 92, 3, '2025-03-25 13:07:00', 3600),
(44, 119, 7, 83, 3, '2025-02-28 13:41:00', 1650),
(45, 197, 9, 37, 1, '2025-02-03 12:05:00', 45),
(46, 111, 4, 68, 3, '2025-03-09 03:50:00', 2250),
(47, 119, 4, 84, 3, '2025-04-09 23:07:00', 1800),
(48, 177, 8, 4, 3, '2025-02-22 01:48:00', 360),
(49, 192, 4, 66, 2, '2025-02-18 19:42:00', 360),
(50, 154, 6, 63, 2, '2025-03-13 17:36:00', 900),
(51, 181, 9, 91, 3, '2025-04-28 08:38:00', 750),
(52, 150, 4, 45, 1, '2025-03-03 01:50:00', 120),
(53, 159, 7, 1, 1, '2025-01-23 07:16:00', 25),
(54, 161, 2, 8, 4, '2025-03-18 03:08:00', 200),
(55, 117, 3, 77, 3, '2025-01-06 21:15:00', 1050),
(56, 136, 9, 48, 1, '2025-01-31 07:23:00', 135),
(57, 123, 9, 32, 4, '2025-03-25 20:19:00', 380),
(58, 173, 6, 57, 2, '2025-02-08 23:42:00', 260),
(59, 191, 4, 31, 2, '2025-02-16 02:55:00', 160),
(60, 115, 3, 97, 5, '2025-03-05 20:23:00', 3000),
(61, 119, 4, 17, 2, '2025-03-25 17:16:00', 70),
(62, 186, 6, 19, 4, '2025-01-06 04:25:00', 1000),
(63, 153, 1, 15, 4, '2025-04-12 02:36:00', 380),
(64, 141, 10, 99, 2, '2025-02-15 18:14:00', 300),
(65, 198, 7, 22, 1, '2025-02-04 14:36:00', 160),
(66, 155, 3, 86, 3, '2025-02-15 17:51:00', 1620),
(67, 159, 4, 3, 1, '2025-02-02 11:38:00', 85),
(68, 165, 4, 28, 3, '2025-02-21 20:31:00', 225),
(69, 178, 8, 20, 5, '2025-01-14 20:13:00', 200),
(70, 145, 9, 19, 2, '2025-03-18 20:51:00', 500),
(71, 151, 4, 23, 4, '2025-01-09 12:24:00', 340),
(72, 183, 3, 58, 5, '2025-03-01 07:23:00', 375),
(73, 116, 3, 98, 2, '2025-04-25 07:00:00', 180),
(74, 156, 3, 5, 4, '2025-02-08 05:33:00', 240),
(75, 154, 6, 40, 4, '2025-04-19 18:35:00', 80),
(76, 187, 4, 89, 4, '2025-04-25 12:09:00', 3000),
(77, 146, 8, 19, 1, '2025-04-01 05:10:00', 250),
(78, 180, 3, 46, 4, '2025-04-19 15:44:00', 220),
(79, 121, 3, 66, 3, '2025-03-15 00:53:00', 540),
(80, 196, 3, 9, 1, '2025-04-26 05:16:00', 40),
(81, 131, 9, 9, 4, '2025-01-16 06:52:00', 160),
(82, 122, 9, 73, 4, '2025-01-19 00:32:00', 680),
(83, 106, 1, 79, 2, '2025-04-06 00:37:00', 2400),
(84, 102, 4, 15, 4, '2025-03-18 23:42:00', 380),
(85, 111, 6, 32, 5, '2025-02-17 20:11:00', 475),
(86, 144, 10, 19, 1, '2025-04-27 23:52:00', 250),
(87, 166, 6, 38, 4, '2025-01-18 15:12:00', 140),
(88, 190, 5, 77, 1, '2025-03-22 17:21:00', 350),
(89, 135, 3, 7, 2, '2025-02-16 05:10:00', 30),
(90, 193, 8, 53, 1, '2025-01-16 08:21:00', 120),
(91, 108, 2, 32, 1, '2025-03-11 23:40:00', 95),
(92, 143, 5, 21, 4, '2025-03-29 11:27:00', 240),
(93, 184, 9, 100, 1, '2025-01-25 07:17:00', 120),
(94, 143, 1, 16, 1, '2025-04-05 21:36:00', 120),
(95, 195, 6, 13, 4, '2025-03-08 22:51:00', 320),
(96, 190, 10, 91, 1, '2025-04-12 10:00:00', 250),
(97, 130, 1, 66, 3, '2025-03-28 10:49:00', 540),
(98, 113, 3, 7, 4, '2025-03-14 02:50:00', 60),
(99, 142, 6, 55, 2, '2025-04-23 20:24:00', 170),
(100, 199, 4, 55, 5, '2025-04-17 10:47:00', 425),
(105, 101, NULL, 1, 1, '2025-08-19 04:30:15', 25);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_no` bigint(10) NOT NULL,
  `staff_email_id` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `date_of_joining` date NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `gender`, `date_of_birth`, `contact_no`, `staff_email_id`, `address`, `designation`, `date_of_joining`, `salary`) VALUES
(1, 'Rajesh Kumar', 'Male', '1982-04-15', 9876543210, 'rajesh.kumar@pharmacy.com', '12 MG Road, Delhi', 'Manager', '2017-06-12', 55000),
(2, 'Anita Sharma', 'Female', '1988-07-20', 8765432109, 'anita.sharma@gmail.com', '34 Park Street, Kolkata', 'Pharmacist', '2019-09-18', 32000),
(3, 'Vivek Nair', 'Male', '1985-02-11', 7654321098, 'vivek.nair@yahoo.com', '22 Marine Drive, Mumbai', 'Manager', '2016-01-25', 48000),
(4, 'Pooja Mehta', 'Female', '1990-11-02', 9543210876, 'pooja.mehta@outlook.com', '14 C Scheme, Jaipur', 'Pharmacist', '2021-05-09', 29000),
(5, 'Arjun Reddy', 'Male', '1983-09-13', 9123456780, 'arjun.reddy@pharma.co.in', '8 Jubilee Hills, Hyderabad', 'Manager', '2018-03-15', 52000),
(6, 'Sneha Kapoor', 'Female', '1989-06-08', 9345678901, 'sneha.kapoor@gmail.com', '44 Sector 17, Chandigarh', 'Pharmacist', '2020-10-21', 31000),
(7, 'Sanjay Gupta', 'Male', '1981-05-25', 9234567890, 'sanjay.gupta@healthplus.com', '9 MG Road, Lucknow', 'Manager', '2015-12-01', 60000),
(8, 'Ritika Singh', 'Female', '1992-01-19', 9456789012, 'ritika.singh@gmail.com', '66 Camp, Pune', 'Pharmacist', '2022-08-13', 28000),
(9, 'Amit Joshi', 'Male', '1984-12-09', 9567890123, 'amit.joshi@hotmail.com', '55 Ballygunge, Kolkata', 'Manager', '2017-02-17', 47000),
(10, 'Shreya Iyer', 'Female', '1987-03-30', 9678901234, 'shreya.iyer@outlook.com', '78 Karol Bagh, Delhi', 'Pharmacist', '2019-11-05', 35000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`med_id`);

--
-- Indexes for table `sales_history`
--
ALTER TABLE `sales_history`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `med_id` (`med_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `med_id` bigint(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `sales_history`
--
ALTER TABLE `sales_history`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales_history`
--
ALTER TABLE `sales_history`
  ADD CONSTRAINT `sales_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `sales_history_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `sales_history_ibfk_3` FOREIGN KEY (`med_id`) REFERENCES `medicines` (`med_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
