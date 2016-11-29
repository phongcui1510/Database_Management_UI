-- Drop tables
DROP TABLE IF EXISTS `billing`;
DROP TABLE IF EXISTS `contract`;
DROP TABLE IF EXISTS `customer_dealership`;
DROP TABLE IF EXISTS `vehicle_inventory`;
DROP TABLE IF EXISTS `sale`;
DROP TABLE IF EXISTS `vehicle`;
DROP TABLE IF EXISTS `service`;
DROP TABLE IF EXISTS `inventory`;
DROP TABLE IF EXISTS `employee`;
DROP TABLE IF EXISTS `dealership`;
DROP TABLE IF EXISTS `customer`;


--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `BILLING_ID` int(11) NOT NULL,
  `PAYMENT_DATE` datetime NOT NULL,
  `PAYMENT_METHOD` varchar(45) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  `VEHICLE_ID` int(11) DEFAULT NULL,
  `SERVICE_ID` int(11) DEFAULT NULL,
  `SALE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`BILLING_ID`, `PAYMENT_DATE`, `PAYMENT_METHOD`, `CUSTOMER_ID`, `VEHICLE_ID`, `SERVICE_ID`, `SALE_ID`) VALUES
(10, '2016-11-20 00:00:00', 'credit', 10, 9, 6, 1),
(11, '2016-09-11 00:00:00', 'credit', 11, 11, 11, 1),
(12, '2016-01-12 00:00:00', 'cash', 12, 12, 10, 1),
(13, '2016-11-10 00:00:00', 'cash', 4, 2, 1, NULL),
(14, '2016-11-10 00:00:00', 'cash', 4, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `CONTRACT_ID` int(11) NOT NULL,
  `SERVICE_CONTRACT` varchar(45) DEFAULT NULL,
  `PROMOTIONAL_CONTRACT` varchar(45) DEFAULT NULL,
  `DEALERSHIP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`CONTRACT_ID`, `SERVICE_CONTRACT`, `PROMOTIONAL_CONTRACT`, `DEALERSHIP_ID`) VALUES
(2, 'Y', 'N', 2),
(3, 'N', 'Y', 3),
(4, 'Y', 'N', 4),
(5, 'N', 'Y', 5),
(6, 'Y', 'Y', 6),
(7, 'Y', 'N', 7),
(8, 'N', 'Y', 8),
(9, 'N', 'Y', 9),
(10, 'N', 'Y', 10);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `PHONE_NO` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `CUSTOMER_TYPE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUSTOMER_ID`, `NAME`, `ADDRESS`, `PHONE_NO`, `EMAIL`, `CUSTOMER_TYPE`) VALUES
(4, 'James Bond', 'James Bond', '287227 test', 'James@gmail.com', 'visit'),
(5, 'Brian Spead', '221 B Baker St, London, England', '92728572', 'Brian@gmail.com', 'purchase'),
(6, 'Channing Chandler', 'Tour Eiffel Champ de Mars, Paris', '2728728', 'Channing@gmail.com', 'purchase'),
(7, 'Curt Connor', '4059 Mt Lee Dr. Hollywood, CA 90068', '287254245', 'Curt@gmail.com', 'purchase'),
(8, 'John Connor', 'Buckingham Palace, London, England', '12345648', 'John@gmail.com', 'purchase'),
(9, 'Julia Roberts', 'Statue of Liberty, Liberty Island New York, NY 10004', '28572', 'Julia@gmail.com', 'purchase'),
(10, 'Katharine Hepburn', 'Manager Square, Bethlehem, West Bank', '227', 'Katharine@gmail.com', 'purchase'),
(11, 'Jessica Lange', '2 Macquarie Street, Sydney', '25422', 'Jessica@gmail.com', 'purchase'),
(12, 'Meryl Streep', '828 Broadway New York, NY 10003', '84515', 'Meryl@gmail.com', 'purchase'),
(13, 'Bette Davis', '163 Court St Brooklyn, NY 11201', '12345648', 'Bette@gmail.com', 'service'),
(14, 'Cate Blanchett', '163 Court St Brooklyn, NY 11201', '12345648', 'Cate@gmail.com', 'service'),
(15, 'Elizabeth Taylor', '686 Fulton St Brooklyn, NY 11217', '12345648', 'Elizabeth@gmail.com', 'service');

-- --------------------------------------------------------

--
-- Table structure for table `customer_dealership`
--

CREATE TABLE `customer_dealership` (
  `CUSTOMER_DEALERSHIP_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  `DEALERSHIP_ID` int(11) NOT NULL,
  `VEHICLE_ID` int(11) DEFAULT NULL,
  `SERVICE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_dealership`
--

INSERT INTO `customer_dealership` (`CUSTOMER_DEALERSHIP_ID`, `CUSTOMER_ID`, `DEALERSHIP_ID`, `VEHICLE_ID`, `SERVICE_ID`) VALUES
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 5),
(6, 6, 6, 6, 6),
(7, 7, 7, 7, 7),
(8, 8, 8, 8, 8),
(9, 9, 9, 9, 9),
(10, 10, 10, 7, 7),
(12, 12, 2, 10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `dealership`
--

CREATE TABLE `dealership` (
  `DEALERSHIP_ID` int(11) NOT NULL,
  `NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dealership`
--

INSERT INTO `dealership` (`DEALERSHIP_ID`, `NAME`) VALUES
(2, 'Aston Martin'),
(3, 'Audi'),
(4, 'BMW'),
(5, 'Bentley'),
(6, 'Bugatti'),
(7, 'Buick'),
(8, 'Cadillac'),
(9, 'Chevrolet'),
(10, 'Chrysler'),
(11, 'Toyota'),
(12, 'Misubishi'),
(13, 'Honda'),
(14, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PHONE_NO` varchar(45) DEFAULT NULL,
  `DEALERSHIP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EMPLOYEE_ID`, `NAME`, `ADDRESS`, `EMAIL`, `PHONE_NO`, `DEALERSHIP_ID`) VALUES
(1, 'Jack Nicholson', 'Jack Nicholson', 'Nicholson@gmail.com', '385282', 2),
(2, 'Marlon Brando', '350 Fifth Avenue New York, NY', 'Marlon@gmail.com', '7875782', 2),
(5, 'Daniel Day-Lewis', '355 Fifth Avenue New York, NY', 'Daniel@gmail.com', '8578', 8),
(6, 'Dustin Hoffman test', 'Dustin Hoffman test', 'Dustin@gmail.com', '85219975', 7),
(8, 'Anthony Hopkins', '321 Fifth Avenue New York, NY', 'Anthony@gmail.com', '85219975', 5),
(9, 'Paul Newman', '312 Fifth Avenue New York, NY', 'Paul@gmail.com', '2857217', 4),
(10, 'Denzel Washington', '310 Fifth Avenue New York, NY', 'Denzel@gmail.com', '8547257', 3),
(12, 'Laurence Olivier', '359 Fifth Avenue New York, NY', 'Laurence@gmail.com', '8521747179975', 3),
(14, 'Michael Caine', '389 Fifth Avenue New York, NY', 'Michael@gmail.com', '852852719975', 2);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `INVENTORY_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`INVENTORY_ID`, `NAME`, `ADDRESS`) VALUES
(2, '302 W', '302 W. 22nd St.'),
(3, '235 W', '235 W. 107th St'),
(4, '80 Riverside', '80 Riverside Dr. @ 80th St.'),
(5, '5 West', '5 West 63rd St.'),
(6, '319 W', '319 W. 94th St.'),
(7, '162-164 Bowery', '162-164 Bowery St New York, NY 10012'),
(8, '2246 Broadway', '2246 Broadway New York, NY 10024'),
(9, '828 Broadway', '828 Broadway New York, NY 10003'),
(10, '126 Crosby', '126 Crosby St New York, NY 10012'),
(11, '163 Court', '163 Court St Brooklyn, NY 11201'),
(12, '686 Fulton', '686 Fulton St Brooklyn, NY 11217'),
(13, 'test', 'getAddress'),
(14, 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `SALE_ID` int(11) NOT NULL,
  `TAG_NO` varchar(45) DEFAULT NULL,
  `SELLING_DATE` datetime NOT NULL,
  `CUSTOMIZATION` varchar(45) DEFAULT NULL,
  `VEHICLE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`SALE_ID`, `TAG_NO`, `SELLING_DATE`, `CUSTOMIZATION`, `VEHICLE_ID`) VALUES
(2, '2', '2016-11-12 00:00:00', NULL, 2),
(3, '3', '2016-11-13 00:00:00', NULL, 3),
(4, '4', '2016-11-14 00:00:00', NULL, 4),
(5, '5', '2016-11-15 00:00:00', NULL, 5),
(6, '6', '2016-11-16 00:00:00', NULL, 6),
(7, '7', '2016-11-17 00:00:00', NULL, 7),
(8, '8', '2016-11-18 00:00:00', NULL, 8),
(9, '9', '2016-11-19 00:00:00', NULL, 9),
(10, '3', '2016-12-10 00:00:00', NULL, 10),
(11, '4', '2016-01-10 00:00:00', NULL, 11),
(12, '5', '2016-02-10 00:00:00', NULL, 12),
(13, '6', '2016-03-10 00:00:00', NULL, 13),
(14, '7', '2016-04-10 00:00:00', NULL, 14),
(15, '8', '2016-05-10 00:00:00', NULL, 15),
(16, '9', '2016-06-10 00:00:00', NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `SERVICE_ID` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DEPARTURE_TIME` datetime DEFAULT NULL,
  `ARRIVING_TIME` datetime DEFAULT NULL,
  `PROBLEM_TYPE` varchar(45) DEFAULT NULL,
  `ESTIMATE_PRICE` int(11) NOT NULL,
  `ESTIMATE_TIME` int(11) NOT NULL,
  `COMPLETION_DATE` datetime DEFAULT NULL,
  `PICKUP_DATE` datetime DEFAULT NULL,
  `FINAL_BILLING` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`SERVICE_ID`, `NAME`, `DEPARTURE_TIME`, `ARRIVING_TIME`, `PROBLEM_TYPE`, `ESTIMATE_PRICE`, `ESTIMATE_TIME`, `COMPLETION_DATE`, `PICKUP_DATE`, `FINAL_BILLING`) VALUES
(1, 'oil change', '2016-11-10 00:00:00', '2016-01-12 00:00:00', 'oil change', 4513, 3600, '2016-12-12 00:00:00', '2016-11-29 00:00:00', '254'),
(2, 'oil change 2nd', '2016-11-11 00:00:00', '2016-02-12 00:00:00', 'oil change', 4513, 3700, NULL, '2016-11-29 00:00:00', '95'),
(3, 'oil change 3rd', '2016-11-12 00:00:00', '2016-11-12 00:00:00', 'oil change', 4513, 4000, '2016-11-30 00:00:00', '2016-11-29 00:00:00', '875'),
(4, 'tire rotation', '2016-11-13 00:00:00', '2016-10-12 00:00:00', 'tire rotation', 4513, 4400, '2016-01-30 00:00:00', NULL, '5242'),
(5, 'tire rotation 2nd', '2016-11-14 00:00:00', '2016-02-12 00:00:00', 'tire rotation', 4513, 4500, '2016-11-30 00:00:00', NULL, '254'),
(6, 'tire rotation 3rd', '2016-11-15 00:00:00', '2016-06-12 00:00:00', 'tire rotation', 4513, 4600, '2016-11-30 00:00:00', NULL, '456'),
(7, 'oil change 4th', '2016-11-15 00:00:00', '2016-11-15 00:00:00', 'oil change', 4513, 5000, '2016-11-30 00:00:00', '2016-11-29 00:00:00', '2054'),
(8, 'oil change 5th', '2016-11-16 00:00:00', '2016-11-17 00:00:00', 'oil change', 4513, 6000, '2016-11-30 00:00:00', '2016-11-29 00:00:00', '456'),
(9, '15000 mile overhaul 1st', '2016-11-17 00:00:00', '2016-11-20 00:00:00', '15000 mile overhaul', 4000, 4513, '2016-11-30 00:00:00', '2016-11-29 00:00:00', '542'),
(10, '15000 mile overhaul 2nd', '2016-10-10 00:00:00', '2016-11-21 00:00:00', '15000 mile overhaul', 3600, 4513, '2016-11-30 00:00:00', '2016-11-29 00:00:00', '215'),
(11, 'oil change 7th', '2016-06-10 00:00:00', '2016-11-01 00:00:00', 'oil change', 4513, 2000, '2016-11-30 00:00:00', '2016-11-29 00:00:00', '520');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstName`, `lastName`, `dob`, `email`, `address`, `description`, `role`) VALUES
(2, 'admin', 'admin', '', '', NULL, NULL, NULL, NULL, 'ADMIN'),
(3, 'phong', '456', 'phong', 'nguyen', '2015-07-09', 'gmail@gmail.com', 'Ho Van Long', NULL, 'STUDENT'),
(5, 'phong1', '123', 'phong1', 'nguyen', '2002-07-05', 'phong1@mail.com', 'Binh Tan', NULL, 'STUDENT'),
(13, 'math', '123', NULL, NULL, NULL, NULL, NULL, 'awfd afa vgsdf sef d ', 'FACULTY');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `VEHICLE_ID` int(11) NOT NULL,
  `MODEL` varchar(45) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `YEAR` int(11) NOT NULL,
  `COLOR` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`VEHICLE_ID`, `MODEL`, `PRICE`, `YEAR`, `COLOR`) VALUES
(2, 'Orlando LTZ', 669, 2016, ''),
(3, 'Captiva REVV', 779, 2015, 'red'),
(4, 'Aveo LTZ', 562, 2016, ''),
(5, 'Aveo LT', 440, 2016, ''),
(6, 'Orlando LTZ', 669, 2016, ''),
(7, 'Captiva REVV', 779, 2015, ''),
(8, 'CAMRY', 562, 2016, ''),
(9, 'HIACE GAS', 779, 2015, ''),
(10, 'VENZA 2.7', 562, 2016, ''),
(11, 'BMW B7', 779, 2015, ''),
(12, 'FORTUNER V', 562, 2016, ''),
(13, 'YARIS 1.3MT', 562, 2016, ''),
(14, 'CAMRY 2.5 LE', 779, 2015, ''),
(15, 'ALTIS 2.0V', 562, 2016, ''),
(16, 'test', 3, 2, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_inventory`
--

CREATE TABLE `vehicle_inventory` (
  `VEHICLE_ID` int(11) NOT NULL,
  `INVENTORY_ID` int(11) NOT NULL,
  `ARRIVING_TIME` datetime DEFAULT NULL,
  `LEAVING_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_inventory`
--

INSERT INTO `vehicle_inventory` (`VEHICLE_ID`, `INVENTORY_ID`, `ARRIVING_TIME`, `LEAVING_TIME`) VALUES
(2, 2, '2016-11-03 00:00:00', NULL),
(3, 3, '2016-11-02 00:00:00', NULL),
(4, 4, NULL, NULL),
(5, 5, NULL, '2016-11-17 00:00:00'),
(6, 6, '2016-11-09 00:00:00', '2016-11-26 00:00:00'),
(7, 7, NULL, NULL),
(8, 8, '2016-11-01 00:00:00', '2016-11-17 00:00:00'),
(9, 7, NULL, NULL),
(10, 8, '2016-11-01 00:00:00', '2016-11-17 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`BILLING_ID`),
  ADD KEY `billing_customer` (`CUSTOMER_ID`),
  ADD KEY `billing_service` (`SERVICE_ID`),
  ADD KEY `billing_vehicle` (`VEHICLE_ID`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`CONTRACT_ID`),
  ADD KEY `contract_dealership` (`DEALERSHIP_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUSTOMER_ID`);

--
-- Indexes for table `customer_dealership`
--
ALTER TABLE `customer_dealership`
  ADD PRIMARY KEY (`CUSTOMER_DEALERSHIP_ID`),
  ADD KEY `service` (`SERVICE_ID`),
  ADD KEY `customer` (`CUSTOMER_ID`),
  ADD KEY `dealership` (`DEALERSHIP_ID`),
  ADD KEY `vehicle` (`VEHICLE_ID`);

--
-- Indexes for table `dealership`
--
ALTER TABLE `dealership`
  ADD PRIMARY KEY (`DEALERSHIP_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD KEY `employee_dealership` (`DEALERSHIP_ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`INVENTORY_ID`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`SALE_ID`),
  ADD KEY `sale_vehicle` (`VEHICLE_ID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`SERVICE_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VEHICLE_ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`VEHICLE_ID`);

--
-- Indexes for table `vehicle_inventory`
--
ALTER TABLE `vehicle_inventory`
  ADD PRIMARY KEY (`VEHICLE_ID`),
  ADD KEY `inventory_idx` (`INVENTORY_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `BILLING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `dealership`
--
ALTER TABLE `dealership`
  MODIFY `DEALERSHIP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EMPLOYEE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `INVENTORY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `VEHICLE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_customer` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `billing_service` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`SERVICE_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `billing_vehicle` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `vehicle` (`VEHICLE_ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_dealership` FOREIGN KEY (`DEALERSHIP_ID`) REFERENCES `dealership` (`DEALERSHIP_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_dealership`
--
ALTER TABLE `customer_dealership`
  ADD CONSTRAINT `customer` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `dealership` FOREIGN KEY (`DEALERSHIP_ID`) REFERENCES `dealership` (`DEALERSHIP_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `service` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`SERVICE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vehicle` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `vehicle` (`VEHICLE_ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_dealership` FOREIGN KEY (`DEALERSHIP_ID`) REFERENCES `dealership` (`DEALERSHIP_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_vehicle` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `vehicle` (`VEHICLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_inventory`
--
ALTER TABLE `vehicle_inventory`
  ADD CONSTRAINT `inventory_foreign_key` FOREIGN KEY (`INVENTORY_ID`) REFERENCES `inventory` (`INVENTORY_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicle_foreign_key` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `vehicle` (`VEHICLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
