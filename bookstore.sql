-- MySQL dump 10.13  Distrib 8.0.18, for osx10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: bookstore_0816
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bs_book`
--

DROP TABLE IF EXISTS `bs_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bs_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `img_path` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_book`
--

LOCK TABLES `bs_book` WRITE;
/*!40000 ALTER TABLE `bs_book` DISABLE KEYS */;
INSERT INTO `bs_book` VALUES (17,'Spring实战',' Craig Walls',48.00,13,99,'/static/img/default.jpg'),(18,'JavaScript高级程序设计','Nicholas',68.30,27,73,'/static/img/default.jpg'),(19,'Java编程思想','Bruce Eckel',74.50,5,95,'/static/img/default.jpg'),(20,'JAVA核心技术（卷1）','昊斯特曼',67.60,1,99,'/static/img/default.jpg'),(21,'中国传统风水智慧一本通','陈晓倩 ',25.60,0,100,'/static/img/default.jpg'),(22,'Java并发编程实战','Brian',52.30,0,100,'/static/img/default.jpg'),(23,'Java与模式','阎宏',70.50,0,100,'/static/img/default.jpg'),(24,'汤的100种做法','犀文图书',2.90,0,100,'/static/img/default.jpg'),(25,'婚姻心理学：婚姻是最好的修行','霍妮',20.30,0,100,'/static/img/default.jpg'),(26,'Hibernate实战','鲍尔',87.10,0,100,'/static/img/default.jpg'),(27,'跟着君之学烘焙','君之',19.40,0,100,'/static/img/default.jpg'),(28,'深入理解Java虚拟机','周志明',51.80,0,100,'/static/img/default.jpg'),(29,'男人来自火星，女人来自金星','约翰·格雷',14.90,0,100,'/static/img/default.jpg'),(30,'海洋传','卡森',14.00,1,99,'/static/img/default.jpg'),(31,'Tomcat与Java Web开发技术详解','孙卫琴',63.60,0,100,'/static/img/default.jpg');
/*!40000 ALTER TABLE `bs_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_order`
--

DROP TABLE IF EXISTS `bs_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bs_order` (
  `id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `total_count` int(11) DEFAULT NULL,
  `total_amount` double(11,2) DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `bs_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `bs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_order`
--

LOCK TABLES `bs_order` WRITE;
/*!40000 ALTER TABLE `bs_order` DISABLE KEYS */;
INSERT INTO `bs_order` VALUES ('15825542667231','2020-02-24 08:24:27',2,116.30,0,1),('15825967427315','2020-02-24 20:12:23',2,142.80,0,5),('15826826827991','2020-02-25 20:04:43',15,1049.30,0,1),('15826828462951','2020-02-25 20:07:26',2,135.90,1,1);
/*!40000 ALTER TABLE `bs_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_order_item`
--

DROP TABLE IF EXISTS `bs_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bs_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COUNT` int(11) DEFAULT NULL,
  `amount` double(11,2) DEFAULT NULL,
  `title` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  `img_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `bs_order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `bs_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_order_item`
--

LOCK TABLES `bs_order_item` WRITE;
/*!40000 ALTER TABLE `bs_order_item` DISABLE KEYS */;
INSERT INTO `bs_order_item` VALUES (1,1,48.00,'Spring实战',' Craig Walls',48.00,'/static/img/default.jpg','15825542667231'),(2,1,68.30,'JavaScript高级程序设计','Nicholas',68.30,'/static/img/default.jpg','15825542667231'),(3,1,68.30,'JavaScript高级程序设计','Nicholas',68.30,'/static/img/default.jpg','15825967427315'),(4,1,74.50,'Java编程思想','Bruce Eckel',74.50,'/static/img/default.jpg','15825967427315'),(5,11,751.30,'JavaScript高级程序设计','Nicholas',68.30,'/static/img/default.jpg','15826826827991'),(6,4,298.00,'Java编程思想','Bruce Eckel',74.50,'/static/img/default.jpg','15826826827991'),(7,1,68.30,'JavaScript高级程序设计','Nicholas',68.30,'/static/img/default.jpg','15826828462951'),(8,1,67.60,'JAVA核心技术（卷1）','昊斯特曼',67.60,'/static/img/default.jpg','15826828462951');
/*!40000 ALTER TABLE `bs_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_user`
--

DROP TABLE IF EXISTS `bs_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bs_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `PASSWORD` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_user`
--

LOCK TABLES `bs_user` WRITE;
/*!40000 ALTER TABLE `bs_user` DISABLE KEYS */;
INSERT INTO `bs_user` VALUES (1,'admin','12345qq','110@qq.com'),(2,'admin123','12345qq','110@qq.com'),(3,'admin110','1234qq','110@qq.com'),(4,'admin111','1234qq','110@qq.com'),(5,'admin11','1111qq','110@qq.com');
/*!40000 ALTER TABLE `bs_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-08 17:42:04

INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (17, 'Spring实战', ' Craig Walls', 48, 13, 99, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (18, 'JavaScript高级程序设计', 'Nicholas', 68.3, 27, 73, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (19, 'Java编程思想', 'Bruce Eckel', 74.5, 5, 95, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (20, 'JAVA核心技术（卷1）', '昊斯特曼', 67.6, 1, 99, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (21, '中国传统风水智慧一本通', '陈晓倩 ', 25.6, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (22, 'Java并发编程实战', 'Brian', 52.3, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (23, 'Java与模式', '阎宏', 70.5, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (24, '汤的100种做法', '犀文图书', 2.9, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (25, '婚姻心理学：婚姻是最好的修行', '霍妮', 20.3, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (26, 'Hibernate实战', '鲍尔', 87.1, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (27, '跟着君之学烘焙', '君之', 19.4, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (28, '深入理解Java虚拟机', '周志明', 51.8, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (29, '男人来自火星，女人来自金星', '约翰·格雷', 14.9, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (30, '海洋传', '卡森', 14, 1, 99, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_book (id, title, author, price, sales, stock, img_path) VALUES (31, 'Tomcat与Java Web开发技术详解', '孙卫琴', 63.6, 0, 100, '/static/img/default.jpg');
INSERT INTO bookstore_0816.bs_order (id, order_time, total_count, total_amount, state, user_id) VALUES ('15825542667231', '2020-02-24 08:24:27', 2, 116.3, 0, 1);
INSERT INTO bookstore_0816.bs_order (id, order_time, total_count, total_amount, state, user_id) VALUES ('15825967427315', '2020-02-24 20:12:23', 2, 142.8, 0, 5);
INSERT INTO bookstore_0816.bs_order (id, order_time, total_count, total_amount, state, user_id) VALUES ('15826826827991', '2020-02-25 20:04:43', 15, 1049.3, 0, 1);
INSERT INTO bookstore_0816.bs_order (id, order_time, total_count, total_amount, state, user_id) VALUES ('15826828462951', '2020-02-25 20:07:26', 2, 135.9, 1, 1);
INSERT INTO bookstore_0816.bs_order_item (id, COUNT, amount, title, author, price, img_path, order_id) VALUES (1, 1, 48, 'Spring实战', ' Craig Walls', 48, '/static/img/default.jpg', '15825542667231');
INSERT INTO bookstore_0816.bs_order_item (id, COUNT, amount, title, author, price, img_path, order_id) VALUES (2, 1, 68.3, 'JavaScript高级程序设计', 'Nicholas', 68.3, '/static/img/default.jpg', '15825542667231');
INSERT INTO bookstore_0816.bs_order_item (id, COUNT, amount, title, author, price, img_path, order_id) VALUES (3, 1, 68.3, 'JavaScript高级程序设计', 'Nicholas', 68.3, '/static/img/default.jpg', '15825967427315');
INSERT INTO bookstore_0816.bs_order_item (id, COUNT, amount, title, author, price, img_path, order_id) VALUES (4, 1, 74.5, 'Java编程思想', 'Bruce Eckel', 74.5, '/static/img/default.jpg', '15825967427315');
INSERT INTO bookstore_0816.bs_order_item (id, COUNT, amount, title, author, price, img_path, order_id) VALUES (5, 11, 751.3, 'JavaScript高级程序设计', 'Nicholas', 68.3, '/static/img/default.jpg', '15826826827991');
INSERT INTO bookstore_0816.bs_order_item (id, COUNT, amount, title, author, price, img_path, order_id) VALUES (6, 4, 298, 'Java编程思想', 'Bruce Eckel', 74.5, '/static/img/default.jpg', '15826826827991');
INSERT INTO bookstore_0816.bs_order_item (id, COUNT, amount, title, author, price, img_path, order_id) VALUES (7, 1, 68.3, 'JavaScript高级程序设计', 'Nicholas', 68.3, '/static/img/default.jpg', '15826828462951');
INSERT INTO bookstore_0816.bs_order_item (id, COUNT, amount, title, author, price, img_path, order_id) VALUES (8, 1, 67.6, 'JAVA核心技术（卷1）', '昊斯特曼', 67.6, '/static/img/default.jpg', '15826828462951');
INSERT INTO bookstore_0816.bs_user (id, username, PASSWORD, email) VALUES (1, 'admin', '12345qq', '110@qq.com');
INSERT INTO bookstore_0816.bs_user (id, username, PASSWORD, email) VALUES (2, 'admin123', '12345qq', '110@qq.com');
INSERT INTO bookstore_0816.bs_user (id, username, PASSWORD, email) VALUES (3, 'admin110', '1234qq', '110@qq.com');
INSERT INTO bookstore_0816.bs_user (id, username, PASSWORD, email) VALUES (4, 'admin111', '1234qq', '110@qq.com');
INSERT INTO bookstore_0816.bs_user (id, username, PASSWORD, email) VALUES (5, 'admin11', '1111qq', '110@qq.com');