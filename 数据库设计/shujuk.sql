-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: my_ser
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

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
-- Table structure for table `列车表`
--

DROP TABLE IF EXISTS `列车表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `列车表` (
  `列车编号` text COLLATE utf8mb4_general_ci,
  `列车类型` text COLLATE utf8mb4_general_ci,
  `站票数量` int DEFAULT NULL,
  `坐票数量` int DEFAULT NULL,
  `卧铺数量` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `列车表`
--

LOCK TABLES `列车表` WRITE;
/*!40000 ALTER TABLE `列车表` DISABLE KEYS */;
INSERT INTO `列车表` VALUES ('Z265',NULL,100,300,1),('Z223',NULL,250,1,2),('Z164',NULL,200,345,3),('T7009',NULL,140,6,4),('K1572',NULL,120,3245,5),('D779',NULL,155,5,6),('C199',NULL,174,4,7);
/*!40000 ALTER TABLE `列车表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `用户表`
--

DROP TABLE IF EXISTS `用户表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `用户表` (
  `user_id` int DEFAULT NULL,
  `user_name` text COLLATE utf8mb4_general_ci,
  `password` int DEFAULT NULL,
  `联系方式` double DEFAULT NULL,
  `身份` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `用户表`
--

LOCK TABLES `用户表` WRITE;
/*!40000 ALTER TABLE `用户表` DISABLE KEYS */;
INSERT INTO `用户表` VALUES (1,'张三',868757,13888829934,'学生'),(2,'李四',654321,13999999999,'军人'),(3,'王五',111111,13777777777,'成人'),(4,'赵六',222222,13666666666,'儿童'),(5,'孙七',333333,13555555555,'成人'),(6,'周八',444444,13444444444,'成人'),(NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `用户表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `站点表`
--

DROP TABLE IF EXISTS `站点表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `站点表` (
  `编号` int DEFAULT NULL,
  `站点名` text COLLATE utf8mb4_general_ci,
  `所属省份` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `站点表`
--

LOCK TABLES `站点表` WRITE;
/*!40000 ALTER TABLE `站点表` DISABLE KEYS */;
INSERT INTO `站点表` VALUES (1,'子长','陕西省'),(2,'重庆西','重庆市'),(3,'郑州','河南省'),(4,'榆林','陕西省'),(5,'杨陵','陕西省'),(6,'阳泉北','山西省'),(7,'延安','陕西省'),(8,'徐州','江苏省'),(9,'辛集','河北省'),(10,'咸阳','陕西省'),(11,'西宁','青海省'),(12,'西安','陕西省'),(13,'吴堡','陕西省'),(14,'文水','山西省'),(15,'太原','山西省'),(16,'绥德','陕西省'),(17,'石家庄北','河北省'),(18,'神木西','陕西省'),(19,'神木','陕西省'),(20,'任丘','河北省'),(21,'清涧县','陕西省'),(22,'蒲城东','陕西省'),(23,'南充北','四川省'),(24,'那曲','西藏自治区'),(25,'米脂','陕西省'),(26,'吕梁','山西省'),(27,'洛阳','河南省'),(28,'兰州','甘肃省'),(29,'拉萨','西藏自治区'),(30,'锦界','甘肃省'),(31,'交城','山西省'),(32,'广元','四川省'),(33,'格尔木','青海省'),(34,'甘泉北','陕西省'),(35,'富县东','陕西省'),(36,'汾阳','山西省'),(37,'鄂尔多斯','内蒙古自治区'),(38,'德令哈','青海省'),(39,'宝鸡','陕西省'),(40,'安多','西藏自治区');
/*!40000 ALTER TABLE `站点表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `经停站表`
--

DROP TABLE IF EXISTS `经停站表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `经停站表` (
  `编号` int DEFAULT NULL,
  `经停站id` int DEFAULT NULL,
  `列车id` text COLLATE utf8mb4_general_ci,
  `总经历时间` text COLLATE utf8mb4_general_ci,
  `发车时间` text COLLATE utf8mb4_general_ci,
  `站票价格` text COLLATE utf8mb4_general_ci,
  `站票已售` int DEFAULT NULL,
  `坐票价格` text COLLATE utf8mb4_general_ci,
  `坐票已售` int DEFAULT NULL,
  `卧铺价格` double DEFAULT NULL,
  `卧铺已售` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `经停站表`
--

LOCK TABLES `经停站表` WRITE;
/*!40000 ALTER TABLE `经停站表` DISABLE KEYS */;
INSERT INTO `经停站表` VALUES (1,18,'c199','0时00分','8:10','3.53 ',0,'3.53 ',0,4.77,0),(1,30,'c199','0时40分','8:52','3.89 ',0,'3.89 ',0,5.25,0),(1,4,'c199','1时24分','9:40','3.98 ',0,'3.98 ',0,5.37,0),(1,25,'c199','2时09分','10:21','1.24 ',0,'1.24 ',0,1.67,0),(1,16,'c199','2时23分','10:35','3.27 ',0,'3.27 ',0,4.41,0),(1,1,'c199','3时00分','11:12','3.62 ',0,'3.62 ',0,4.89,0),(1,7,'c199','3时41分','11:53','11.57 ',0,'11.57 ',0,15.62,0),(1,12,'c199','5时52分',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,37,'D779',NULL,'14:45','3.27 ',0,'3.27 ',0,4.41,0),(2,18,'D779','0时37分','15:24','4.15 ',0,'4.15 ',0,5.6,0),(2,4,'D779','1时24分','16:15','4.51 ',0,'4.51 ',0,6.08,0),(2,16,'D779','2时15分','17:02','3.27 ',0,'3.27 ',0,4.41,0),(2,1,'D779','2时52分','17:39','4.06 ',0,'4.06 ',0,5.49,0),(2,7,'D779','3时38分','18:25','11.40 ',0,'11.40 ',0,15.38,0),(2,12,'D779','5时47分',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,20,'K1573',NULL,'3:51','10.25 ',0,'10.25 ',0,13.83,0),(3,9,'K1573','1时56分','5:43','5.30 ',0,'5.30 ',0,7.16,0),(3,17,'K1573','2时56分','6:56','6.45 ',0,'6.45 ',0,8.71,0),(3,6,'K1573','4时09分','7:59','5.39 ',0,'5.39 ',0,7.27,0),(3,15,'K1573','5时10分','9:25','10.25 ',0,'10.25 ',0,13.83,0),(3,31,'K1573','5时44分','10:11','1.24 ',0,'1.24 ',0,1.67,0),(3,14,'K1573','5时58分','10:25','1.33 ',0,'1.33 ',0,1.79,0),(3,36,'K1573','6时13分','10:55','6.09 ',0,'6.09 ',0,8.23,0),(3,26,'K1573','7时22分','11:51','3.62 ',0,'3.62 ',0,4.89,0),(3,13,'K1573','8时03分','12:31','6.09 ',0,'6.09 ',0,8.23,0),(3,16,'K1573','8时34分','13:29','5.83 ',0,'5.83 ',0,7.87,0),(3,21,'K1573','9时40分','14:07','1.59 ',0,'1.59 ',0,2.15,0),(3,1,'K1573','9时58分','14:25','4.95 ',0,'4.95 ',0,6.68,0),(3,7,'K1573','10时54分','15:24','2.47 ',0,'2.47 ',0,3.34,0),(3,34,'K1573','11时22分','15:50','2.12 ',0,'2.12 ',0,2.86,0),(3,35,'K1573','11时46分','16:14','7.51 ',0,'7.51 ',0,10.14,0),(3,22,'K1573','13时11分','17:40','8.39 ',0,'8.39 ',0,11.33,0),(3,12,'K1573','14时46分',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,4,'T7009',NULL,'22:22','4.42 ',0,'4.42 ',0,5.96,0),(4,25,'T7009','0时50分','23:14','1.50 ',0,'1.50 ',0,2.03,0),(4,16,'T7009','1时07分','23:32','9.45 ',0,'9.45 ',0,12.76,0),(4,7,'T7009','2时54分','1:21','21.29 ',0,'21.29 ',0,28.74,0),(4,12,'T7009','6时55分','5:25','2.03 ',0,'2.03 ',0,2.74,0),(4,10,'T7009','7时18分','5:42','3.71 ',0,'3.71 ',0,5.01,0),(4,5,'T7009','8时00分','6:24','6.27 ',0,'6.27 ',0,8.47,0),(4,39,'T7009','9时11分',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,27,'z165',NULL,'4:48','24.29 ',0,'24.29 ',0,32.79,0),(5,12,'z165','4时35分','9:27','1.94 ',0,'1.94 ',0,2.62,0),(5,10,'z165','4时57分','9:45','6.89 ',0,'6.89 ',0,9.3,0),(5,39,'z165','6时15分','11:08','27.91 ',0,'27.91 ',0,37.68,0),(5,28,'z165','11时31分','16:38','24.29 ',0,'24.29 ',0,32.79,0),(5,11,'z165','12时04分','19:26','1.94 ',0,'1.94 ',0,2.62,0),(5,33,'z165','18时32分','25:59','21:21',0,'21:21',0,9.3,0),(5,40,'z165','26时57分','34:01','21:55',0,'21:55',0,37.68,0),(5,24,'z165','28时18分','35:26','11:26',0,'11:26',0,0.64,0),(5,29,'z165','32时18分',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,2,'z223',NULL,'22:05','11.04 ',0,'11.04 ',0,14.91,0),(6,23,'z223','2时05分','0:21','11.75 ',0,'11.75 ',0,15.86,0),(6,32,'z223','4时18分','2:38','31.54 ',0,'31.54 ',0,42.57,0),(6,28,'z223','10时15分','8:40','15.99 ',0,'15.99 ',0,21.58,0),(6,11,'z223','13时16分','11:41','22.17 ',0,'22.17 ',0,29.93,0),(6,38,'z223','17时27分','15:36','12.28 ',0,'12.28 ',0,16.58,0),(6,33,'z223','19时46分','18:16','31.54 ',0,'31.54 ',0,42.57,0),(6,29,'z223','33时37分',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,12,'z265',NULL,'7:53','8.48 ',0,'8.48 ',0,11.45,0),(7,39,'z265','1时36分','9:26','30.48 ',0,'30.48 ',0,41.14,0),(7,28,'z265','7时21分','15:25','14.84 ',0,'14.84 ',0,20.03,0),(7,11,'z265','10时09分','18:13','22.26 ',0,'22.26 ',0,30.05,0),(7,38,'z265','14时21分','22:09','4.42 ',0,'4.42 ',0,5.96,0),(7,33,'z265','16时37分','0:46','1.50 ',0,'1.50 ',0,2.03,0),(7,40,'z265','24时24分','8:50','9.45 ',0,'9.45 ',0,12.76,0),(7,24,'z265','26时25分','10:15','21.29 ',0,'21.29 ',0,28.74,0),(7,29,'z265','30时33分',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `经停站表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `订单表`
--

DROP TABLE IF EXISTS `订单表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `订单表` (
  `C1` text COLLATE utf8mb4_general_ci,
  `C2` text COLLATE utf8mb4_general_ci,
  `C3` text COLLATE utf8mb4_general_ci,
  `C4` text COLLATE utf8mb4_general_ci,
  `C5` text COLLATE utf8mb4_general_ci,
  `C6` text COLLATE utf8mb4_general_ci,
  `C7` text COLLATE utf8mb4_general_ci,
  `C8` text COLLATE utf8mb4_general_ci,
  `C9` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `订单表`
--

LOCK TABLES `订单表` WRITE;
/*!40000 ALTER TABLE `订单表` DISABLE KEYS */;
INSERT INTO `订单表` VALUES ('订单id','用户id','车次id','座位属性','乘车人信息','乘车人属性','订单时间','支付状态','改签状态');
/*!40000 ALTER TABLE `订单表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `评价表`
--

DROP TABLE IF EXISTS `评价表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `评价表` (
  `C1` text COLLATE utf8mb4_general_ci,
  `C2` text COLLATE utf8mb4_general_ci,
  `C3` text COLLATE utf8mb4_general_ci,
  `C4` text COLLATE utf8mb4_general_ci,
  `C5` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `评价表`
--

LOCK TABLES `评价表` WRITE;
/*!40000 ALTER TABLE `评价表` DISABLE KEYS */;
INSERT INTO `评价表` VALUES ('评价id','用户id','车次id','评价内容','评价时间');
/*!40000 ALTER TABLE `评价表` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-07 10:16:56
