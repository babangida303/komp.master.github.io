-- MySQL dump 10.16  Distrib 10.1.31-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: comp_services
-- ------------------------------------------------------
-- Server version	10.1.31-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Клиенты'),(5,'Менеджеры'),(10,'Администраторы');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'дата новости',
  `note` text NOT NULL COMMENT 'текст новости',
  `user_id` int(11) NOT NULL DEFAULT '1' COMMENT 'кем добавлено',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='новости';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (2,'2024-05-14 02:22:00','Открытие сайта',1),(4,'2024-05-16 14:14:00','Добавлен раздел \"Рейтинг филиалов\"',1),(6,'2024-05-15 08:25:00','Добавление раздела \"Брони\"',1),(7,'2024-05-15 06:06:00','Добавление раздела \"Визиты\"',1),(8,'2024-05-15 03:33:00','Добавление раздела \"Отзывы\"',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairs`
--

DROP TABLE IF EXISTS `repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repairs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'код типа ремонта',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT 'наименование типа ремонта',
  `price` int(11) NOT NULL COMMENT 'цена ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='типы ремонта';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairs`
--

LOCK TABLES `repairs` WRITE;
/*!40000 ALTER TABLE `repairs` DISABLE KEYS */;
INSERT INTO `repairs` VALUES (1,'установка операционной системы',1500),(2,'замена термопасты',1550),(3,'замена термопрокладок',1500),(4,'обслуживание',5000),(5,'настройка программного обеспечения',1500),(6,'настройка системы охлаждения',2500),(7,'настройка водяной системы охлаждения',5000),(8,'текущий ремонт',3000),(9,'диагностика',500),(10,'замена видеокарты',1200),(11,'реболлинг чипа',9000),(12,'замена процессора',900),(13,'установка деталей',500);
/*!40000 ALTER TABLE `repairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'код отзыва',
  `dt` datetime NOT NULL COMMENT 'дата и время',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'код клиента',
  `service_id` int(11) NOT NULL DEFAULT '0' COMMENT 'код сервиса',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT 'оценка сервиса',
  `comment` text NOT NULL COMMENT 'комментарий к отзыву',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='отзывы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'2024-04-18 10:37:10',2,2,4,''),(2,'2024-04-12 10:37:10',3,2,7,'жуть'),(3,'2024-04-18 10:37:10',4,3,10,'Хороший сервис'),(4,'2024-04-18 10:37:10',5,2,7,'Больше не хочу сюда обращаться'),(5,'2024-04-18 10:37:10',19,1,1,'Супер обслуживание'),(6,'2024-04-12 10:37:10',20,3,7,'На приемке хам');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'код сервиса',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT 'наименование сервиса',
  `address` text NOT NULL COMMENT 'адрес сервиса',
  `descr` text NOT NULL COMMENT 'описание сервиса',
  `contact` text NOT NULL COMMENT 'контактная информация',
  `products` text NOT NULL COMMENT 'виды услуг',
  `schedule` text NOT NULL COMMENT 'время работы',
  `marks` text NOT NULL COMMENT 'производители',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'код представителя',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='сервисы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Филиал1','ул. Лунная, д. 15, офис 1469','Любой сервис','тел. 7941632103210, 79416315454 (сергей)','все виды услуг','ПН, ВТ, СР, ЧТ, ПТ, СБ\r\n8:00-12:00\r\n12:30-20:30','HP, Asus, Samsung, Acer, Lenovo, Apple',117),(2,'Филиал2','ул. Кулькова, д. 19, офис 162','Замена систем охлаждения','+79132145444 skype: blamblam\r\ntelegram:@blamblam','Замена систем охлаждения','ПН, ВТ, СР, ЧТ, ПТ, СБ\\r\\n8:00-12:00\\r\\n12:30-20:30','HP, Asus, Samsung, Acer, Lenovo, Apple',122),(3,'Филиал3','пр. Мира, д. 362, офис 999','Электроника','TG: @tychko','все виды услуг','ПН, ВТ, СР, ЧТ, ПТ, СБ\\\\r\\\\n8:00-12:00\\\\r\\\\n12:30-20:30','HP, Asus, Samsung, Acer, Lenovo, Apple, Dell, Honor',119),(4,'Филиал4','ул. Рыбная, д.324, офис 218','','794165164444; akin@gmail.com','все виды услуг','ПН, ВТ, СР, ЧТ, ПТ, СБ\\\\\\\\r\\\\\\\\n8:00-12:00\\\\\\\\r\\\\\\\\n12:30-20:30','HP, Asus, Samsung, Acer, Lenovo, Apple, Dell, Honor',120),(5,'Филиал5','ул. Оконная, д.321, офис 1784','Авторизованный партнер HP','skype','все виды услуг','ПН, ВТ, СР, ЧТ, ПТ, СБ\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\n8:00-12:00\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\n12:30-20:30','HP',121);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='статусы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'забронировано'),(2,'в ремонте'),(3,'завершено'),(4,'отменено');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fio` varchar(200) DEFAULT NULL COMMENT 'фио ',
  `rank` varchar(200) DEFAULT NULL COMMENT 'должность',
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `date_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `birthday` date NOT NULL,
  `note` text NOT NULL COMMENT 'примечание',
  `department_id` int(11) NOT NULL COMMENT 'код отделения',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Цьпляков Радован Платонович','100','+79386210611',NULL,'pass10','admin','2024-05-17 06:43:14','cplyakovradovan8580@outlook.com',10,'1983-02-23','Цьпляков Радован Платонович 1983-02-23 cplyakovradovan8580@outlook.com +79386210611 cplyakovradovan8580 sLdwUUaqybNOtasZLRKbomM7 ',0),(2,'Цвылев Ипат Ефремович','100','+79625608495',NULL,'pass1','client1','2024-05-17 06:44:03','cvylevipat615@ukr.net',1,'1989-09-15','Цвылев Ипат Ефремович 1989-09-15 cvylevipat615@ukr.net +79625608495 cvylevipat615 c052smedM0R_TwpS2h8feO ',0),(3,'Ламанов Мартиниан Власович','100','+79656897950',NULL,'pass1','client2','2024-05-17 06:44:03','lamanovmartinian1776@riocketmail.com',1,'1944-10-22','Ламанов Мартиниан Власович 1944-10-22 lamanovmartinian1776@riocketmail.com +79656897950 lamanovmartinian1776 96UJ8kpvucT5N4Et81mf3 ',0),(4,'Ниценко Дорофей Брониславович','100','+79811472675',NULL,'pass1','client3','2024-05-17 06:44:03','nicenkodorofey4765@riocketmail.com',1,'1978-08-26','Ниценко Дорофей Брониславович 1978-08-26 nicenkodorofey4765@riocketmail.com +79811472675 nicenkodorofey4765 O7BHLGdCWSnsWT7 ',0),(5,'Тимушев Агапий Львович','100','+79587444497',NULL,'pass1','client4','2024-05-17 06:44:03','timushevagapiy327@tut.by',1,'1966-07-11','Тимушев Агапий Львович 1966-07-11 timushevagapiy327@tut.by +79587444497 timushevagapiy327 1Kv2jFze ',0),(6,'Демакин Гостомысл Иваныч','100','+79150644338',NULL,'pass5','manager5','2024-05-17 06:44:03','demakingostomysl9233@msn.com',5,'1940-05-02','Демакин Гостомысл Иваныч 1940-05-02 demakingostomysl9233@msn.com +79150644338 demakingostomysl9233 falTN0qpA ',0),(7,'Шевчук Панфил Филатович','100','+79057690058',NULL,'yrrvY.K','shevchukpanfil8270','2024-05-17 06:44:16','shevchukpanfil8270@free.fr',2,'1998-05-09','Шевчук Панфил Филатович 1998-05-09 shevchukpanfil8270@free.fr +79057690058 shevchukpanfil8270 yrrvY.K ',0),(8,'Сысин Климентий Гаврилович','100','+79738432816',NULL,'DoMr4BJQQ5FH.qtut56Nc','sysinklimentiy1750','2024-05-17 06:44:16','sysinklimentiy1750@live.com',2,'1955-08-14','Сысин Климентий Гаврилович 1955-08-14 sysinklimentiy1750@live.com +79738432816 sysinklimentiy1750 DoMr4BJQQ5FH.qtut56Nc ',0),(9,'Левкеев Фалалей Фокич','100','+79842097116',NULL,'tHTujzCq1MnBdwTe7J','levkeevfalaley3400','2024-05-17 06:44:16','levkeevfalaley3400@qip.ru',2,'1972-05-20','Левкеев Фалалей Фокич 1972-05-20 levkeevfalaley3400@qip.ru +79842097116 levkeevfalaley3400 tHTujzCq1MnBdwTe7J ',0),(10,'Гринков Ермий Даниилович','100','+79206736044',NULL,'T71SV.rwtkVI','grinkovermiy9102','2024-05-17 06:44:16','grinkovermiy9102@rambler.ru',2,'1944-04-08','Гринков Ермий Даниилович 1944-04-08 grinkovermiy9102@rambler.ru +79206736044 grinkovermiy9102 T71SV.rwtkVI ',0),(11,'Беспамятных Трофим Павлович','100','+79697902863',NULL,'VLTq4q_QunqmzA','bespamyatnyhtrofim4700','2024-05-17 06:44:16','bespamyatnyhtrofim4700@qip.ru',2,'1942-11-20','Беспамятных Трофим Павлович 1942-11-20 bespamyatnyhtrofim4700@qip.ru +79697902863 bespamyatnyhtrofim4700 VLTq4q_QunqmzA ',0),(12,'Додонов Меркул Иоаннович','100','+79164931559',NULL,'CnFwVBysSim7qWtY','dodonovmerkul16','2024-05-17 06:44:16','dodonovmerkul16@riocketmail.com',2,'1969-01-19','Додонов Меркул Иоаннович 1969-01-19 dodonovmerkul16@riocketmail.com +79164931559 dodonovmerkul16 CnFwVBysSim7qWtY ',0),(13,'Подтынников Палладий Григорьевич','100','+79811846568',NULL,'Dq1wYnd59abwJQ','podtynnikovpalladiy8847','2024-05-17 06:44:16','podtynnikovpalladiy8847@qip.ru',2,'2002-11-10','Подтынников Палладий Григорьевич 2002-11-10 podtynnikovpalladiy8847@qip.ru +79811846568 podtynnikovpalladiy8847 Dq1wYnd59abwJQ ',0),(14,'Цибулька Азар Осипович','100','+79565444941',NULL,'P9MhCTypl7odMT','cibulkaazar8699','2024-05-17 06:44:16','cibulkaazar8699@rambler.ru',2,'1976-05-15','Цибулька Азар Осипович 1976-05-15 cibulkaazar8699@rambler.ru +79565444941 cibulkaazar8699 P9MhCTypl7odMT ',0),(15,'Зырянцев Прокл Давидович','100','+79605722352',NULL,'aSuA5qPiCB.OhERByJ','zyryancevprokl1320','2024-05-17 06:44:16','zyryancevprokl1320@qip.ru',2,'1988-01-24','Зырянцев Прокл Давидович 1988-01-24 zyryancevprokl1320@qip.ru +79605722352 zyryancevprokl1320 aSuA5qPiCB.OhERByJ ',0),(16,'Аброськин Адам Изотович','100','+79423857234',NULL,'rMeHdDn2','abroskinadam8975','2024-05-17 06:44:16','abroskinadam8975@free.fr',2,'1942-03-05','Аброськин Адам Изотович 1942-03-05 abroskinadam8975@free.fr +79423857234 abroskinadam8975 rMeHdDn2 ',0),(17,'Исаченко Демьян Давыдович','100','+79253575313',NULL,'Ungbxv2p60','isachenkodemyan6852','2024-05-17 06:44:35','isachenkodemyan6852@yahoo.com',1,'1948-09-12','Исаченко Демьян Давыдович 1948-09-12 isachenkodemyan6852@yahoo.com +79253575313 isachenkodemyan6852 Ungbxv2p60 ',0),(18,'Хоробитов Прокоп Гавриилович','100','+79375792526',NULL,'xGYUSKBPq8zk','horobitovprokop2115','2024-05-17 06:44:35','horobitovprokop2115@live.com',1,'1954-08-16','Хоробитов Прокоп Гавриилович 1954-08-16 horobitovprokop2115@live.com +79375792526 horobitovprokop2115 xGYUSKBPq8zk ',0),(19,'Басунов Максимиан Ильясович','100','+79731734960',NULL,'IJuF3qoJoPHd_tCCvEXmgJEg','basunovmaksimian1112','2024-05-17 06:44:35','basunovmaksimian1112@bk.ru',1,'1974-04-26','Басунов Максимиан Ильясович 1974-04-26 basunovmaksimian1112@bk.ru +79731734960 basunovmaksimian1112 IJuF3qoJoPHd_tCCvEXmgJEg ',0),(20,'Сидорюк Бонифат Викентьевич','100','+79510812801',NULL,'YC0yzqfh','sidoryukbonifat7508','2024-05-17 06:44:35','sidoryukbonifat7508@list.ru',1,'1941-09-18','Сидорюк Бонифат Викентьевич 1941-09-18 sidoryukbonifat7508@list.ru +79510812801 sidoryukbonifat7508 YC0yzqfh ',0),(21,'Климанов Иустин Соломонович','100','+79047762351',NULL,'lR.EmM7','klimanoviustin3537','2024-05-17 06:44:35','klimanoviustin3537@riocketmail.com',1,'1985-07-26','Климанов Иустин Соломонович 1985-07-26 klimanoviustin3537@riocketmail.com +79047762351 klimanoviustin3537 lR.EmM7 ',0),(22,'Безручко Стахий Леонидович','100','+79025632610',NULL,'yNpXHQAMIFqBGcZKddJkv8R','bezruchkostahiy9441','2024-05-17 06:44:35','bezruchkostahiy9441@free.fr',1,'1954-01-30','Безручко Стахий Леонидович 1954-01-30 bezruchkostahiy9441@free.fr +79025632610 bezruchkostahiy9441 yNpXHQAMIFqBGcZKddJkv8R ',0),(23,'Прокунин Мавродий Дмитриевич','100','+79881868123',NULL,'WtYoA89lKon','prokuninmavrodiy6130','2024-05-17 06:44:35','prokuninmavrodiy6130@bk.ru',1,'1984-12-02','Прокунин Мавродий Дмитриевич 1984-12-02 prokuninmavrodiy6130@bk.ru +79881868123 prokuninmavrodiy6130 WtYoA89lKon ',0),(24,'Петрачков Мавродий Трифонович','100','+79538605567',NULL,'ziRj25Odwx','petrachkovmavrodiy1952','2024-05-17 06:44:35','petrachkovmavrodiy1952@bk.ru',1,'1962-09-17','Петрачков Мавродий Трифонович 1962-09-17 petrachkovmavrodiy1952@bk.ru +79538605567 petrachkovmavrodiy1952 ziRj25Odwx ',0),(25,'Янухин Флегонт Харламович','100','+79171874980',NULL,'WN3vWNzYAwbzW6_kQkTYQ6','yanuhinflegont4749','2024-05-17 06:44:35','yanuhinflegont4749@qip.ru',1,'1969-02-26','Янухин Флегонт Харламович 1969-02-26 yanuhinflegont4749@qip.ru +79171874980 yanuhinflegont4749 WN3vWNzYAwbzW6_kQkTYQ6 ',0),(26,'Звонарев Руслан Ефимьевич','100','+79438326508',NULL,'zeg865liue2zpQwOu_Q','zvonarevruslan1085','2024-05-17 06:44:35','zvonarevruslan1085@qip.ru',1,'1974-08-29','Звонарев Руслан Ефимьевич 1974-08-29 zvonarevruslan1085@qip.ru +79438326508 zvonarevruslan1085 zeg865liue2zpQwOu_Q ',0),(27,'Чудин Гедимин Никанорович','100','+79073864994',NULL,'.83WZY5z_n8wPVf5KV','chudingedimin9307','2024-05-17 06:44:35','chudingedimin9307@list.ru',1,'1997-08-26','Чудин Гедимин Никанорович 1997-08-26 chudingedimin9307@list.ru +79073864994 chudingedimin9307 .83WZY5z_n8wPVf5KV ',0),(28,'Яволов Любим Гаврилович','100','+79732867255',NULL,'d6EJfPx','yavolovlyubim4456','2024-05-17 06:44:35','yavolovlyubim4456@rambler.ru',1,'1972-12-06','Яволов Любим Гаврилович 1972-12-06 yavolovlyubim4456@rambler.ru +79732867255 yavolovlyubim4456 d6EJfPx ',0),(29,'Соколинский Витовт Леонтьевич','100','+79601473928',NULL,'.1tNiVCn2c','sokolinskiyvitovt8698','2024-05-17 06:44:35','sokolinskiyvitovt8698@bk.ru',1,'1942-10-06','Соколинский Витовт Леонтьевич 1942-10-06 sokolinskiyvitovt8698@bk.ru +79601473928 sokolinskiyvitovt8698 .1tNiVCn2c ',0),(30,'Аниканов Сидор Всеволодович','100','+79233713292',NULL,'qiT8aOL7M_fDHmoW0','anikanovsidor4248','2024-05-17 06:44:35','anikanovsidor4248@mail.ru',1,'1969-08-25','Аниканов Сидор Всеволодович 1969-08-25 anikanovsidor4248@mail.ru +79233713292 anikanovsidor4248 qiT8aOL7M_fDHmoW0 ',0),(31,'Ильинский Иоанн Григорьевич','100','+79538298228',NULL,'wwGjemsj_','ilinskiyioann546','2024-05-17 06:44:35','ilinskiyioann546@rambler.ru',1,'1959-12-21','Ильинский Иоанн Григорьевич 1959-12-21 ilinskiyioann546@rambler.ru +79538298228 ilinskiyioann546 wwGjemsj_ ',0),(32,'Сокольчик Измарагд Соломонович','100','+79912443303',NULL,'0na8zRbMf0vDOy5bGq41','sokolchikizmaragd2338','2024-05-17 06:44:35','sokolchikizmaragd2338@ukr.net',1,'1996-07-29','Сокольчик Измарагд Соломонович 1996-07-29 sokolchikizmaragd2338@ukr.net +79912443303 sokolchikizmaragd2338 0na8zRbMf0vDOy5bGq41 ',0),(33,'Поспехин Африкан Ануфриевич','100','+79862475179',NULL,'LoXSGa0zaGPSSf8R','pospehinafrikan3383','2024-05-17 06:44:35','pospehinafrikan3383@outlook.com',1,'1983-10-25','Поспехин Африкан Ануфриевич 1983-10-25 pospehinafrikan3383@outlook.com +79862475179 pospehinafrikan3383 LoXSGa0zaGPSSf8R ',0),(34,'Гусейнов Авенир Фомич','100','+79534964980',NULL,'CRlTtJsd','guseynovavenir3155','2024-05-17 06:44:35','guseynovavenir3155@yandex.ru',1,'1945-09-03','Гусейнов Авенир Фомич 1945-09-03 guseynovavenir3155@yandex.ru +79534964980 guseynovavenir3155 CRlTtJsd ',0),(35,'Никулов Тимур Терентьевич','100','+79868470355',NULL,'u.llIDtX09svgtRmk','nikulovtimur6982','2024-05-17 06:44:35','nikulovtimur6982@tut.by',1,'1965-09-10','Никулов Тимур Терентьевич 1965-09-10 nikulovtimur6982@tut.by +79868470355 nikulovtimur6982 u.llIDtX09svgtRmk ',0),(36,'Закамсков Конон Аксёнович','100','+79098954437',NULL,'xnJixfOkKVgeCs9Xa_','zakamskovkonon4200','2024-05-17 06:44:35','zakamskovkonon4200@microsoft.com',1,'1987-06-14','Закамсков Конон Аксёнович 1987-06-14 zakamskovkonon4200@microsoft.com +79098954437 zakamskovkonon4200 xnJixfOkKVgeCs9Xa_ ',0),(37,'Симахин Кирик Гаврилович','100','+79073328897',NULL,'RqsI6u6HUS7wr7gLjM','simahinkirik3388','2024-05-17 06:44:35','simahinkirik3388@yandex.ru',1,'1956-11-10','Симахин Кирик Гаврилович 1956-11-10 simahinkirik3388@yandex.ru +79073328897 simahinkirik3388 RqsI6u6HUS7wr7gLjM ',0),(38,'Курасов Иероним Вилорович','100','+79636895075',NULL,'oLgb446du','kurasovieronim773','2024-05-17 06:44:35','kurasovieronim773@riocketmail.com',1,'1954-01-15','Курасов Иероним Вилорович 1954-01-15 kurasovieronim773@riocketmail.com +79636895075 kurasovieronim773 oLgb446du ',0),(39,'Кандалов Эммануил Давыдович','100','+79954682751',NULL,'xh_ACHXdm4p4czjgMMN5','kandalovemmanuil1577','2024-05-17 06:44:35','kandalovemmanuil1577@ukr.net',1,'1963-01-29','Кандалов Эммануил Давыдович 1963-01-29 kandalovemmanuil1577@ukr.net +79954682751 kandalovemmanuil1577 xh_ACHXdm4p4czjgMMN5 ',0),(40,'Седов Роберт Захарович','100','+79995304401',NULL,'IkZP9rZEKJ6OtnyirSlz','sedovrobert8326','2024-05-17 06:44:35','sedovrobert8326@bk.ru',1,'1989-06-03','Седов Роберт Захарович 1989-06-03 sedovrobert8326@bk.ru +79995304401 sedovrobert8326 IkZP9rZEKJ6OtnyirSlz ',0),(41,'Супруненко Авксентий Русланович','100','+79966411990',NULL,'WGdVhO4','suprunenkoavksentiy8824','2024-05-17 06:44:35','suprunenkoavksentiy8824@live.com',1,'1942-08-22','Супруненко Авксентий Русланович 1942-08-22 suprunenkoavksentiy8824@live.com +79966411990 suprunenkoavksentiy8824 WGdVhO4 ',0),(42,'Петрованов Измаил Чеславович','100','+79758292948',NULL,'_tjZDpHIsrcFThA6HUzgJ','petrovanovizmail3476','2024-05-17 06:44:35','petrovanovizmail3476@tut.by',1,'1977-05-20','Петрованов Измаил Чеславович 1977-05-20 petrovanovizmail3476@tut.by +79758292948 petrovanovizmail3476 _tjZDpHIsrcFThA6HUzgJ ',0),(43,'Вирясов Антонин Михайлович','100','+79400898432',NULL,'beuvfEC52Go','viryasovantonin8178','2024-05-17 06:44:35','viryasovantonin8178@tut.by',1,'1983-11-10','Вирясов Антонин Михайлович 1983-11-10 viryasovantonin8178@tut.by +79400898432 viryasovantonin8178 beuvfEC52Go ',0),(44,'Жировой Творимир Данилович','100','+79884469694',NULL,'QSepqm','zhirovoytvorimir7444','2024-05-17 06:44:35','zhirovoytvorimir7444@free.fr',1,'1994-02-03','Жировой Творимир Данилович 1994-02-03 zhirovoytvorimir7444@free.fr +79884469694 zhirovoytvorimir7444 QSepqm ',0),(45,'Давыдив Аверкий Федосьевич','100','+79023919943',NULL,'BKyekMtElmQPhW8t','davydivaverkiy3363','2024-05-17 06:44:35','davydivaverkiy3363@qip.ru',1,'1948-12-15','Давыдив Аверкий Федосьевич 1948-12-15 davydivaverkiy3363@qip.ru +79023919943 davydivaverkiy3363 BKyekMtElmQPhW8t ',0),(46,'Жидовинов Зосим Акимович','100','+79724510933',NULL,'5Kp0ruekuK2M','zhidovinovzosim8570','2024-05-17 06:44:35','zhidovinovzosim8570@qip.ru',1,'1992-12-26','Жидовинов Зосим Акимович 1992-12-26 zhidovinovzosim8570@qip.ru +79724510933 zhidovinovzosim8570 5Kp0ruekuK2M ',0),(47,'Волосевич Виталий Даниилович','100','+79006297927',NULL,'ai3QTQYV3mO2LQj3ZGx_','volosevichvitaliy6824','2024-05-17 06:44:35','volosevichvitaliy6824@tut.by',1,'1980-06-07','Волосевич Виталий Даниилович 1980-06-07 volosevichvitaliy6824@tut.by +79006297927 volosevichvitaliy6824 ai3QTQYV3mO2LQj3ZGx_ ',0),(48,'Ярнев Харлам Изотович','100','+79883560451',NULL,'afhexRH_NZYr','yarnevharlam9237','2024-05-17 06:44:35','yarnevharlam9237@gmail.com',1,'1955-03-27','Ярнев Харлам Изотович 1955-03-27 yarnevharlam9237@gmail.com +79883560451 yarnevharlam9237 afhexRH_NZYr ',0),(49,'Бугрименко Вонифат Георгиевич','100','+79953610310',NULL,'nCEcr6NRpJ37FN','bugrimenkovonifat7100','2024-05-17 06:44:35','bugrimenkovonifat7100@yahoo.com',1,'1946-03-27','Бугрименко Вонифат Георгиевич 1946-03-27 bugrimenkovonifat7100@yahoo.com +79953610310 bugrimenkovonifat7100 nCEcr6NRpJ37FN ',0),(50,'Евлахов Савва Ильгизович','100','+79682978934',NULL,'1BAa6qWNc','evlahovsavva1147','2024-05-17 06:44:35','evlahovsavva1147@yandex.ru',1,'1951-06-15','Евлахов Савва Ильгизович 1951-06-15 evlahovsavva1147@yandex.ru +79682978934 evlahovsavva1147 1BAa6qWNc ',0),(51,'Пальчиков Родион Никанорович','100','+79501250888',NULL,'cXNTj7SvaBEf7mK142G_c_u','palchikovrodion3894','2024-05-17 06:44:35','palchikovrodion3894@microsoft.com',1,'1952-07-22','Пальчиков Родион Никанорович 1952-07-22 palchikovrodion3894@microsoft.com +79501250888 palchikovrodion3894 cXNTj7SvaBEf7mK142G_c_u ',0),(52,'Толкачев Люциан Игнатьевич','100','+79390036111',NULL,'BDGpUSXxue2SCBAStLO','tolkachevlyucian2145','2024-05-17 06:44:35','tolkachevlyucian2145@bk.ru',1,'1969-03-06','Толкачев Люциан Игнатьевич 1969-03-06 tolkachevlyucian2145@bk.ru +79390036111 tolkachevlyucian2145 BDGpUSXxue2SCBAStLO ',0),(53,'Парахин Гурий Демьянович','100','+79382301358',NULL,'7rO1xIdNjB0Iho.ciGShQZr','parahinguriy3346','2024-05-17 06:44:35','parahinguriy3346@qip.ru',1,'2004-06-17','Парахин Гурий Демьянович 2004-06-17 parahinguriy3346@qip.ru +79382301358 parahinguriy3346 7rO1xIdNjB0Iho.ciGShQZr ',0),(54,'Пустельников Анемподист Константинович','100','+79092845220',NULL,'3Qo5o3','pustelnikovanempodist3910','2024-05-17 06:44:35','pustelnikovanempodist3910@list.ru',1,'1982-12-24','Пустельников Анемподист Константинович 1982-12-24 pustelnikovanempodist3910@list.ru +79092845220 pustelnikovanempodist3910 3Qo5o3 ',0),(55,'Дедюлин Аполлон Бориславич','100','+79885110820',NULL,'b_I4_W','dedyulinapollon9044','2024-05-17 06:44:35','dedyulinapollon9044@bk.ru',1,'1982-05-17','Дедюлин Аполлон Бориславич 1982-05-17 dedyulinapollon9044@bk.ru +79885110820 dedyulinapollon9044 b_I4_W ',0),(56,'Хлопков Эраст Чеславович','100','+79608821902',NULL,'j3KdadYam2wSzonW9p1','hlopkoverast1946','2024-05-17 06:44:35','hlopkoverast1946@ukr.net',1,'1987-06-13','Хлопков Эраст Чеславович 1987-06-13 hlopkoverast1946@ukr.net +79608821902 hlopkoverast1946 j3KdadYam2wSzonW9p1 ',0),(57,'Флоров Патрикий Измаилович','100','+79524827073',NULL,'NXk8gSiXU_GBO','florovpatrikiy6548','2024-05-17 06:44:35','florovpatrikiy6548@ukr.net',1,'1960-02-05','Флоров Патрикий Измаилович 1960-02-05 florovpatrikiy6548@ukr.net +79524827073 florovpatrikiy6548 NXk8gSiXU_GBO ',0),(58,'Устюжанин Борислав Валентинович','100','+79726339072',NULL,'s19ERlPBjw7rX5B0q','ustyuzhaninborislav5816','2024-05-17 06:44:35','ustyuzhaninborislav5816@mail.ru',1,'1972-07-18','Устюжанин Борислав Валентинович 1972-07-18 ustyuzhaninborislav5816@mail.ru +79726339072 ustyuzhaninborislav5816 s19ERlPBjw7rX5B0q ',0),(59,'Бубнов Федот Олегович','100','+79247470053',NULL,'F7FBQHuh1IWlVMa_4','bubnovfedot8822','2024-05-17 06:44:35','bubnovfedot8822@yahoo.com',1,'1940-06-03','Бубнов Федот Олегович 1940-06-03 bubnovfedot8822@yahoo.com +79247470053 bubnovfedot8822 F7FBQHuh1IWlVMa_4 ',0),(60,'Колыганов Демьян Магометович','100','+79524267607',NULL,'P8DEnRKX4BfjblH','kolyganovdemyan1298','2024-05-17 06:44:35','kolyganovdemyan1298@yahoo.com',1,'1961-06-13','Колыганов Демьян Магометович 1961-06-13 kolyganovdemyan1298@yahoo.com +79524267607 kolyganovdemyan1298 P8DEnRKX4BfjblH ',0),(61,'Гаврилихин Кириак Валерьевич','100','+79884363122',NULL,'4zwNOKDe','gavrilihinkiriak6275','2024-05-17 06:44:35','gavrilihinkiriak6275@mail.ru',1,'1954-08-28','Гаврилихин Кириак Валерьевич 1954-08-28 gavrilihinkiriak6275@mail.ru +79884363122 gavrilihinkiriak6275 4zwNOKDe ',0),(62,'Узбеков Капик Иваныч','100','+79746525100',NULL,'ZRkYs9IoOpOsfIcjht','uzbekovkapik3461','2024-05-17 06:44:35','uzbekovkapik3461@live.com',1,'1970-02-08','Узбеков Капик Иваныч 1970-02-08 uzbekovkapik3461@live.com +79746525100 uzbekovkapik3461 ZRkYs9IoOpOsfIcjht ',0),(63,'Заозерский Онисифор Трифонович','100','+79295349518',NULL,'5HJnNm','zaozerskiyonisifor9038','2024-05-17 06:44:35','zaozerskiyonisifor9038@free.fr',1,'1986-03-08','Заозерский Онисифор Трифонович 1986-03-08 zaozerskiyonisifor9038@free.fr +79295349518 zaozerskiyonisifor9038 5HJnNm ',0),(64,'Аниськин Капитон Даниилович','100','+79297075821',NULL,'3MXwCDz2_','aniskinkapiton2060','2024-05-17 06:44:35','aniskinkapiton2060@rambler.ru',1,'1984-06-25','Аниськин Капитон Даниилович 1984-06-25 aniskinkapiton2060@rambler.ru +79297075821 aniskinkapiton2060 3MXwCDz2_ ',0),(65,'Кострикин Тимофей Трофимович','100','+79135940222',NULL,'ntNhLrdgH','kostrikintimofey5414','2024-05-17 06:44:35','kostrikintimofey5414@yahoo.com',1,'1983-09-21','Кострикин Тимофей Трофимович 1983-09-21 kostrikintimofey5414@yahoo.com +79135940222 kostrikintimofey5414 ntNhLrdgH ',0),(66,'Городчанинов Агап Леонтьевич','100','+79604720616',NULL,'95Wyskqio19EcwRuXt0H7','gorodchaninovagap4376','2024-05-17 06:44:35','gorodchaninovagap4376@riocketmail.com',1,'1994-11-21','Городчанинов Агап Леонтьевич 1994-11-21 gorodchaninovagap4376@riocketmail.com +79604720616 gorodchaninovagap4376 95Wyskqio19EcwRuXt0H7 ',0),(67,'Стефановский Иринарх Иларионович','100','+79416560004',NULL,'nO5rWM_4zB4PT','stefanovskiyirinarh4594','2024-05-17 06:44:35','stefanovskiyirinarh4594@live.com',1,'1944-04-05','Стефановский Иринарх Иларионович 1944-04-05 stefanovskiyirinarh4594@live.com +79416560004 stefanovskiyirinarh4594 nO5rWM_4zB4PT ',0),(68,'Шишагин Данил Гурьевич','100','+79078311326',NULL,'Z6gighfpsxfkW_2aKXEBjw','shishagindanil42','2024-05-17 06:44:35','shishagindanil42@rambler.ru',1,'1945-07-25','Шишагин Данил Гурьевич 1945-07-25 shishagindanil42@rambler.ru +79078311326 shishagindanil42 Z6gighfpsxfkW_2aKXEBjw ',0),(69,'Шарыпов Лев Измаилович','100','+79905504067',NULL,'isl8BIw.apykylMfnt10rD','sharypovlev4802','2024-05-17 06:44:35','sharypovlev4802@mail.ru',1,'1947-07-18','Шарыпов Лев Измаилович 1947-07-18 sharypovlev4802@mail.ru +79905504067 sharypovlev4802 isl8BIw.apykylMfnt10rD ',0),(70,'Семиноженко Трифилий Чеславович','100','+79826036664',NULL,'1ruN.mTYG','seminozhenkotrifiliy1100','2024-05-17 06:44:35','seminozhenkotrifiliy1100@qip.ru',1,'1992-05-26','Семиноженко Трифилий Чеславович 1992-05-26 seminozhenkotrifiliy1100@qip.ru +79826036664 seminozhenkotrifiliy1100 1ruN.mTYG ',0),(71,'Смирнин Авдей Анисимович','100','+79281704423',NULL,'XLm.U2qpDhSkgEsTao','smirninavdey9855','2024-05-17 06:44:35','smirninavdey9855@mail.ru',1,'1945-09-30','Смирнин Авдей Анисимович 1945-09-30 smirninavdey9855@mail.ru +79281704423 smirninavdey9855 XLm.U2qpDhSkgEsTao ',0),(72,'Север Гордей Борисыч','100','+79363541237',NULL,'bi7.Yjf3Nsfa5dZIV1wUU1V','severgordey1620','2024-05-17 06:44:35','severgordey1620@bk.ru',1,'1982-09-11','Север Гордей Борисыч 1982-09-11 severgordey1620@bk.ru +79363541237 severgordey1620 bi7.Yjf3Nsfa5dZIV1wUU1V ',0),(73,'Косоухов Ермилий Елизарович','100','+79213702760',NULL,'IV7Yi_SaEVGlzRO9g10Q','kosouhovermiliy7178','2024-05-17 06:44:35','kosouhovermiliy7178@msn.com',1,'1942-12-27','Косоухов Ермилий Елизарович 1942-12-27 kosouhovermiliy7178@msn.com +79213702760 kosouhovermiliy7178 IV7Yi_SaEVGlzRO9g10Q ',0),(74,'Рогушин Виктор Никандрович','100','+79714662234',NULL,'VPQKc8xnrjm9z','rogushinviktor5801','2024-05-17 06:44:35','rogushinviktor5801@msn.com',1,'1965-04-08','Рогушин Виктор Никандрович 1965-04-08 rogushinviktor5801@msn.com +79714662234 rogushinviktor5801 VPQKc8xnrjm9z ',0),(75,'Сергейчев Сильвестр Прохорович','100','+79454697906',NULL,'Jz7XkF1lA7','sergeychevsilvestr3291','2024-05-17 06:44:35','sergeychevsilvestr3291@ukr.net',1,'1948-05-24','Сергейчев Сильвестр Прохорович 1948-05-24 sergeychevsilvestr3291@ukr.net +79454697906 sergeychevsilvestr3291 Jz7XkF1lA7 ',0),(76,'Очеретный Антиох Виссарионович','100','+79549638109',NULL,'09E33C2guw8lgINLN','ocheretnyyantioh7936','2024-05-17 06:44:35','ocheretnyyantioh7936@outlook.com',1,'1961-08-02','Очеретный Антиох Виссарионович 1961-08-02 ocheretnyyantioh7936@outlook.com +79549638109 ocheretnyyantioh7936 09E33C2guw8lgINLN ',0),(77,'Аллавердов Пров Гурьевич','100','+79424869971',NULL,'WzRc8it2E1k4B0XjeSa0i_am','allaverdovprov5919','2024-05-17 06:44:35','allaverdovprov5919@microsoft.com',1,'2000-05-07','Аллавердов Пров Гурьевич 2000-05-07 allaverdovprov5919@microsoft.com +79424869971 allaverdovprov5919 WzRc8it2E1k4B0XjeSa0i_am ',0),(78,'Владычкин Мартин Федосеевич','100','+79620423368',NULL,'l2HN7Gm','vladychkinmartin4263','2024-05-17 06:44:35','vladychkinmartin4263@tut.by',1,'1987-05-23','Владычкин Мартин Федосеевич 1987-05-23 vladychkinmartin4263@tut.by +79620423368 vladychkinmartin4263 l2HN7Gm ',0),(79,'Афончин Савва Дмитриевич','100','+79088290778',NULL,'Mq58I_3bMG4EpdJk0','afonchinsavva3642','2024-05-17 06:44:35','afonchinsavva3642@ukr.net',1,'1940-02-14','Афончин Савва Дмитриевич 1940-02-14 afonchinsavva3642@ukr.net +79088290778 afonchinsavva3642 Mq58I_3bMG4EpdJk0 ',0),(80,'Авксентьев Павел Русланович','100','+79209877259',NULL,'HUzHfKmaJ','avksentevpavel5166','2024-05-17 06:44:35','avksentevpavel5166@msn.com',1,'1954-10-18','Авксентьев Павел Русланович 1954-10-18 avksentevpavel5166@msn.com +79209877259 avksentevpavel5166 HUzHfKmaJ ',0),(81,'Байдиков Прокопий Ильмирович','100','+79028528787',NULL,'SOgvI9HIo8wJiodtCq6ST','baydikovprokopiy1329','2024-05-17 06:44:35','baydikovprokopiy1329@free.fr',1,'1999-02-25','Байдиков Прокопий Ильмирович 1999-02-25 baydikovprokopiy1329@free.fr +79028528787 baydikovprokopiy1329 SOgvI9HIo8wJiodtCq6ST ',0),(82,'Фуфлыгин Марат Аксёнович','100','+79541239023',NULL,'9Mi3y1ZC','fuflyginmarat3182','2024-05-17 06:44:35','fuflyginmarat3182@list.ru',1,'1999-11-13','Фуфлыгин Марат Аксёнович 1999-11-13 fuflyginmarat3182@list.ru +79541239023 fuflyginmarat3182 9Mi3y1ZC ',0),(83,'Гневушев Владимир Денисович','100','+79836929643',NULL,'Ae8lXXQ2ezS_zI2iJof1Q.A6','gnevushevvladimir3532','2024-05-17 06:44:35','gnevushevvladimir3532@msn.com',1,'1947-07-11','Гневушев Владимир Денисович 1947-07-11 gnevushevvladimir3532@msn.com +79836929643 gnevushevvladimir3532 Ae8lXXQ2ezS_zI2iJof1Q.A6 ',0),(84,'Кайгородов Панкратий Ильнурович','100','+79950686236',NULL,'q3NldyUgpkoSiVZ6I.nd','kaygorodovpankratiy8604','2024-05-17 06:44:35','kaygorodovpankratiy8604@gmail.com',1,'1980-08-02','Кайгородов Панкратий Ильнурович 1980-08-02 kaygorodovpankratiy8604@gmail.com +79950686236 kaygorodovpankratiy8604 q3NldyUgpkoSiVZ6I.nd ',0),(85,'Скорокладов Мардарий Харлампьевич','100','+79643226684',NULL,'uWIC.KLYWctjC2IL','skorokladovmardariy2930','2024-05-17 06:44:35','skorokladovmardariy2930@list.ru',1,'1976-12-19','Скорокладов Мардарий Харлампьевич 1976-12-19 skorokladovmardariy2930@list.ru +79643226684 skorokladovmardariy2930 uWIC.KLYWctjC2IL ',0),(86,'Макрушин Дмитрий Ефимьевич','100','+79824217525',NULL,'HDvC2bKlTKIHTuKkI7eGgv','makrushindmitriy3854','2024-05-17 06:44:35','makrushindmitriy3854@msn.com',1,'1947-11-04','Макрушин Дмитрий Ефимьевич 1947-11-04 makrushindmitriy3854@msn.com +79824217525 makrushindmitriy3854 HDvC2bKlTKIHTuKkI7eGgv ',0),(87,'Бебенин Порфир Жоресович','100','+79135466670',NULL,'Gg3fT3lhTrRY5Ra_f_fu7nWY','bebeninporfir4933','2024-05-17 06:44:35','bebeninporfir4933@riocketmail.com',1,'1954-01-27','Бебенин Порфир Жоресович 1954-01-27 bebeninporfir4933@riocketmail.com +79135466670 bebeninporfir4933 Gg3fT3lhTrRY5Ra_f_fu7nWY ',0),(88,'Лебединов Май Захарьевич','100','+79536817324',NULL,'6MMq5IXTO8.HeQq','lebedinovmay3745','2024-05-17 06:44:35','lebedinovmay3745@gmail.com',1,'1988-11-06','Лебединов Май Захарьевич 1988-11-06 lebedinovmay3745@gmail.com +79536817324 lebedinovmay3745 6MMq5IXTO8.HeQq ',0),(89,'Чуешков Аксён Ваганович','100','+79418083452',NULL,'SWodteVycsaizhDUzI8VDFM','chueshkovaksen6833','2024-05-17 06:44:35','chueshkovaksen6833@live.com',1,'1991-07-10','Чуешков Аксён Ваганович 1991-07-10 chueshkovaksen6833@live.com +79418083452 chueshkovaksen6833 SWodteVycsaizhDUzI8VDFM ',0),(90,'Аргунов Акила Иосипович','100','+79060931819',NULL,'GhAK8S','argunovakila811','2024-05-17 06:44:35','argunovakila811@bk.ru',1,'1967-01-01','Аргунов Акила Иосипович 1967-01-01 argunovakila811@bk.ru +79060931819 argunovakila811 GhAK8S ',0),(91,'Базин Аверьян Бориславич','100','+79085367693',NULL,'WTXTYG6CKhlNazuVL4E6Jl4','bazinaveryan5146','2024-05-17 06:44:35','bazinaveryan5146@yahoo.com',1,'1974-06-22','Базин Аверьян Бориславич 1974-06-22 bazinaveryan5146@yahoo.com +79085367693 bazinaveryan5146 WTXTYG6CKhlNazuVL4E6Jl4 ',0),(92,'Капустин Владимир Викторович','100','+79226268651',NULL,'HXmII1UOPa2C9rpERw','kapustinvladimir5400','2024-05-17 06:44:35','kapustinvladimir5400@microsoft.com',1,'1989-02-15','Капустин Владимир Викторович 1989-02-15 kapustinvladimir5400@microsoft.com +79226268651 kapustinvladimir5400 HXmII1UOPa2C9rpERw ',0),(93,'Поздин Гервасий Бориславич','100','+79255706716',NULL,'SXhyng8B','pozdingervasiy8309','2024-05-17 06:44:35','pozdingervasiy8309@riocketmail.com',1,'1979-12-05','Поздин Гервасий Бориславич 1979-12-05 pozdingervasiy8309@riocketmail.com +79255706716 pozdingervasiy8309 SXhyng8B ',0),(94,'Белованов Игорь Ааронович','100','+79592083864',NULL,'bsPms.SKe','belovanovigor3400','2024-05-17 06:44:35','belovanovigor3400@list.ru',1,'1993-04-24','Белованов Игорь Ааронович 1993-04-24 belovanovigor3400@list.ru +79592083864 belovanovigor3400 bsPms.SKe ',0),(95,'Сутырин Афанасий Русланович','100','+79775196461',NULL,'SlSkejhpj','sutyrinafanasiy9714','2024-05-17 06:44:35','sutyrinafanasiy9714@list.ru',1,'1959-07-09','Сутырин Афанасий Русланович 1959-07-09 sutyrinafanasiy9714@list.ru +79775196461 sutyrinafanasiy9714 SlSkejhpj ',0),(96,'Вакорин Парфён Наумович','100','+79322123810',NULL,'Fwacngb3UtMBE','vakorinparfen1514','2024-05-17 06:44:35','vakorinparfen1514@tut.by',1,'1963-02-21','Вакорин Парфён Наумович 1963-02-21 vakorinparfen1514@tut.by +79322123810 vakorinparfen1514 Fwacngb3UtMBE ',0),(97,'Иванусьев Асафий Жоресович','100','+79232508062',NULL,'Z7mtvciJlGVN6ylAg.','ivanusevasafiy8567','2024-05-17 06:44:35','ivanusevasafiy8567@tut.by',1,'1957-02-27','Иванусьев Асафий Жоресович 1957-02-27 ivanusevasafiy8567@tut.by +79232508062 ivanusevasafiy8567 Z7mtvciJlGVN6ylAg. ',0),(98,'Бовкунов Валерий Максимилианович','100','+79881690558',NULL,'zAxjjawVrl0','bovkunovvaleriy3123','2024-05-17 06:44:35','bovkunovvaleriy3123@free.fr',1,'1993-11-25','Бовкунов Валерий Максимилианович 1993-11-25 bovkunovvaleriy3123@free.fr +79881690558 bovkunovvaleriy3123 zAxjjawVrl0 ',0),(99,'Корноусов Серафим Анатольевич','100','+79877272584',NULL,'aNy4FHAj','kornousovserafim1508','2024-05-17 06:44:35','kornousovserafim1508@gmail.com',1,'1998-05-05','Корноусов Серафим Анатольевич 1998-05-05 kornousovserafim1508@gmail.com +79877272584 kornousovserafim1508 aNy4FHAj ',0),(100,'Горлатов Флорентин Димитриевич','100','+79945230793',NULL,'p5zD6JfJj8RlE3iLI','gorlatovflorentin7869','2024-05-17 06:44:35','gorlatovflorentin7869@ukr.net',1,'1967-09-04','Горлатов Флорентин Димитриевич 1967-09-04 gorlatovflorentin7869@ukr.net +79945230793 gorlatovflorentin7869 p5zD6JfJj8RlE3iLI ',0),(101,'Козлитинов Самсоний Рустамович','100','+79805660996',NULL,'588yEFAD1a78t87D_Bj5gPdG','kozlitinovsamsoniy864','2024-05-17 06:44:35','kozlitinovsamsoniy864@ukr.net',1,'1945-05-22','Козлитинов Самсоний Рустамович 1945-05-22 kozlitinovsamsoniy864@ukr.net +79805660996 kozlitinovsamsoniy864 588yEFAD1a78t87D_Bj5gPdG ',0),(102,'Иннокентьев Макар Израилевич','100','+79705828024',NULL,'FBobYhadFE7soX92','innokentevmakar5917','2024-05-17 06:44:35','innokentevmakar5917@yahoo.com',1,'1998-02-16','Иннокентьев Макар Израилевич 1998-02-16 innokentevmakar5917@yahoo.com +79705828024 innokentevmakar5917 FBobYhadFE7soX92 ',0),(103,'Кононыхин Северин Демидович','100','+79413172026',NULL,'yf_fDgavvU1wvtlYWHWR','kononyhinseverin2017','2024-05-17 06:44:35','kononyhinseverin2017@ukr.net',1,'1954-05-27','Кононыхин Северин Демидович 1954-05-27 kononyhinseverin2017@ukr.net +79413172026 kononyhinseverin2017 yf_fDgavvU1wvtlYWHWR ',0),(104,'Горохов Ян Викентьевич','100','+79576959499',NULL,'508f6a03mY','gorohovyan8219','2024-05-17 06:44:35','gorohovyan8219@mail.ru',1,'1946-09-21','Горохов Ян Викентьевич 1946-09-21 gorohovyan8219@mail.ru +79576959499 gorohovyan8219 508f6a03mY ',0),(105,'Камышин Назар Валерьевич','100','+79512084759',NULL,'pXXPcM8OwsQmL9tgPdltH','kamyshinnazar4403','2024-05-17 06:44:35','kamyshinnazar4403@list.ru',1,'1984-01-30','Камышин Назар Валерьевич 1984-01-30 kamyshinnazar4403@list.ru +79512084759 kamyshinnazar4403 pXXPcM8OwsQmL9tgPdltH ',0),(106,'Вилокосов Галактион Владленович','100','+79486945552',NULL,'_Z7VuSpvy8','vilokosovgalaktion5959','2024-05-17 06:44:35','vilokosovgalaktion5959@gmail.com',1,'1950-07-12','Вилокосов Галактион Владленович 1950-07-12 vilokosovgalaktion5959@gmail.com +79486945552 vilokosovgalaktion5959 _Z7VuSpvy8 ',0),(107,'Пуштаев Пахомий Харлампьевич','100','+79388324093',NULL,'ahpVEbO.OPV52fsZnw','pushtaevpahomiy2468','2024-05-17 06:44:35','pushtaevpahomiy2468@mail.ru',1,'1969-06-30','Пуштаев Пахомий Харлампьевич 1969-06-30 pushtaevpahomiy2468@mail.ru +79388324093 pushtaevpahomiy2468 ahpVEbO.OPV52fsZnw ',0),(108,'Ручьев Никон Николаевич','100','+79055374621',NULL,'F0xSE5oYTlx0HgV6b44','ruchevnikon3599','2024-05-17 06:44:35','ruchevnikon3599@rambler.ru',1,'1995-12-20','Ручьев Никон Николаевич 1995-12-20 ruchevnikon3599@rambler.ru +79055374621 ruchevnikon3599 F0xSE5oYTlx0HgV6b44 ',0),(109,'Жванецкий Авдей Рудольфович','100','+79195061548',NULL,'6Qk3Mjc2mLS0qjY','zhvaneckiyavdey8172','2024-05-17 06:44:35','zhvaneckiyavdey8172@list.ru',1,'1998-02-18','Жванецкий Авдей Рудольфович 1998-02-18 zhvaneckiyavdey8172@list.ru +79195061548 zhvaneckiyavdey8172 6Qk3Mjc2mLS0qjY ',0),(110,'Глафирин Каллисфен Никанорович','100','+79821627249',NULL,'DmQiocN.bqkWMD7G1ir','glafirinkallisfen6973','2024-05-17 06:44:35','glafirinkallisfen6973@bk.ru',1,'1965-01-25','Глафирин Каллисфен Никанорович 1965-01-25 glafirinkallisfen6973@bk.ru +79821627249 glafirinkallisfen6973 DmQiocN.bqkWMD7G1ir ',0),(111,'Горных Софон Константинович','100','+79878129282',NULL,'BRedGAW','gornyhsofon4277','2024-05-17 06:44:35','gornyhsofon4277@yandex.ru',1,'1961-01-22','Горных Софон Константинович 1961-01-22 gornyhsofon4277@yandex.ru +79878129282 gornyhsofon4277 BRedGAW ',0),(112,'Рябоштан Виктор Афанасьевич','100','+79418180587',NULL,'1CUFPhiAO3TUDFrT','ryaboshtanviktor5363','2024-05-17 06:44:35','ryaboshtanviktor5363@ukr.net',1,'1965-09-12','Рябоштан Виктор Афанасьевич 1965-09-12 ryaboshtanviktor5363@ukr.net +79418180587 ryaboshtanviktor5363 1CUFPhiAO3TUDFrT ',0),(113,'Колосовников Глеб Борисыч','100','+79214009540',NULL,'TEuEaO','kolosovnikovgleb764','2024-05-17 06:44:35','kolosovnikovgleb764@yandex.ru',1,'1942-12-14','Колосовников Глеб Борисыч 1942-12-14 kolosovnikovgleb764@yandex.ru +79214009540 kolosovnikovgleb764 TEuEaO ',0),(114,'Магницкий Евстратий Федосеевич','100','+79771947247',NULL,'_uihruVnNXS45.31','magnickiyevstratiy5537','2024-05-17 06:44:35','magnickiyevstratiy5537@free.fr',1,'1981-05-19','Магницкий Евстратий Федосеевич 1981-05-19 magnickiyevstratiy5537@free.fr +79771947247 magnickiyevstratiy5537 _uihruVnNXS45.31 ',0),(115,'Черемнов Аполлон Артемьевич','100','+79119379213',NULL,'KHsnfCaj822pwnv62U8z','cheremnovapollon6358','2024-05-17 06:44:35','cheremnovapollon6358@riocketmail.com',1,'1958-01-23','Черемнов Аполлон Артемьевич 1958-01-23 cheremnovapollon6358@riocketmail.com +79119379213 cheremnovapollon6358 KHsnfCaj822pwnv62U8z ',0),(116,'Пальмин Милен Фомич','100','+79414910725',NULL,'zdHHF_snh393FRxlRAP','palminmilen4786','2024-05-17 06:44:35','palminmilen4786@mail.ru',1,'1982-02-13','Пальмин Милен Фомич 1982-02-13 palminmilen4786@mail.ru +79414910725 palminmilen4786 zdHHF_snh393FRxlRAP ',0),(117,'Белогорцев Филимон Федотович','100','+79220339051',NULL,'pass5','manager1','2024-05-17 06:44:35','belogorcevfilimon3931@bk.ru',5,'1975-12-26','Белогорцев Филимон Федотович 1975-12-26 belogorcevfilimon3931@bk.ru +79220339051 belogorcevfilimon3931 90uLhE ',0),(119,'Леушев Измаил Ваганович','100','+79456023892',NULL,'pass5','manager2','2024-05-17 06:44:35','leushevizmail4362@bk.ru',5,'1956-03-21','Леушев Измаил Ваганович 1956-03-21 leushevizmail4362@bk.ru +79456023892 leushevizmail4362 cfoPN8DPtqhVhbH96hQuYC ',0),(120,'Хирьяков Семён Прохорович','100','+79871537819',NULL,'pass5','manager3','2024-05-17 06:44:35','hiryakovsemen3253@outlook.com',5,'1956-05-11','Хирьяков Семён Прохорович 1956-05-11 hiryakovsemen3253@outlook.com +79871537819 hiryakovsemen3253 6_kPz8mMZQThK3wgcqukxAY ',0),(121,'Безносиков Силан Демидович','100','+79180374154',NULL,'pass5','manager4','2024-05-17 06:44:35','beznosikovsilan8492@list.ru',5,'1985-10-08','Безносиков Силан Демидович 1985-10-08 beznosikovsilan8492@list.ru +79180374154 beznosikovsilan8492 By5kdHNdDYFQ0QwSkVg ',0),(122,'Асейкин Асафий Геннадьевич','100','+79601677874',NULL,'pass5','manager5','2024-05-17 06:44:35','aseykinasafiy1367@yandex.ru',5,'1991-03-10','Асейкин Асафий Геннадьевич 1991-03-10 aseykinasafiy1367@yandex.ru +79601677874 aseykinasafiy1367 q.lBgRI2 ',0),(123,'Макеев Милий Игоревич','100','+79740396983',NULL,'pass1','client7','2024-05-17 06:44:35','makeevmiliy4726@rambler.ru',1,'1963-06-22','Макеев Милий Игоревич 1963-06-22 makeevmiliy4726@rambler.ru +79740396983 makeevmiliy4726 ZLznr7I.z ',0),(124,'Шергин Бронислав Харлампьевич','100','+79326450895',NULL,'So2cisoO6DAjc3I','sherginbronislav1165','2024-05-17 06:44:35','sherginbronislav1165@mail.ru',1,'1973-08-18','Шергин Бронислав Харлампьевич 1973-08-18 sherginbronislav1165@mail.ru +79326450895 sherginbronislav1165 So2cisoO6DAjc3I ',0),(125,'Савочкин Африкан Александрович','100','+79183889263',NULL,'ZeFG4rLYnHcQMS_k','savochkinafrikan8637','2024-05-17 06:44:35','savochkinafrikan8637@gmail.com',1,'1955-07-04','Савочкин Африкан Александрович 1955-07-04 savochkinafrikan8637@gmail.com +79183889263 savochkinafrikan8637 ZeFG4rLYnHcQMS_k ',0),(126,'Немкин Каллисфен Владимирович','100','+79802619353',NULL,'sYP_eU37kepXgEsfFcv','nemkinkallisfen6846','2024-05-17 06:44:35','nemkinkallisfen6846@microsoft.com',1,'1996-07-31','Немкин Каллисфен Владимирович 1996-07-31 nemkinkallisfen6846@microsoft.com +79802619353 nemkinkallisfen6846 sYP_eU37kepXgEsfFcv ',0),(127,'Юричев Кириак Фомич','100','+79794070325',NULL,'PY9QN6_zXslFGsMMd','yurichevkiriak3148','2024-05-17 06:44:35','yurichevkiriak3148@tut.by',1,'1970-05-31','Юричев Кириак Фомич 1970-05-31 yurichevkiriak3148@tut.by +79794070325 yurichevkiriak3148 PY9QN6_zXslFGsMMd ',0),(128,'Пьянов Карион Осипович','100','+79207002728',NULL,'LJJZ6Zx.','pyanovkarion221','2024-05-17 06:44:35','pyanovkarion221@yahoo.com',1,'1967-11-25','Пьянов Карион Осипович 1967-11-25 pyanovkarion221@yahoo.com +79207002728 pyanovkarion221 LJJZ6Zx. ',0),(129,'Глушенко Геласий Филатович','100','+79527104856',NULL,'qudUYZNogzoiZW','glushenkogelasiy4693','2024-05-17 06:44:35','glushenkogelasiy4693@list.ru',1,'1988-07-21','Глушенко Геласий Филатович 1988-07-21 glushenkogelasiy4693@list.ru +79527104856 glushenkogelasiy4693 qudUYZNogzoiZW ',0),(130,'Капланов Сократ Маркович','100','+79115694902',NULL,'qbp2cv5','kaplanovsokrat6262','2024-05-17 06:44:35','kaplanovsokrat6262@qip.ru',1,'2004-02-18','Капланов Сократ Маркович 2004-02-18 kaplanovsokrat6262@qip.ru +79115694902 kaplanovsokrat6262 qbp2cv5 ',0),(131,'Хрящиков Гаврила Трифонович','100','+79297607390',NULL,'N.a1MW6M','hryaschikovgavrila9148','2024-05-17 06:44:35','hryaschikovgavrila9148@msn.com',1,'1999-09-17','Хрящиков Гаврила Трифонович 1999-09-17 hryaschikovgavrila9148@msn.com +79297607390 hryaschikovgavrila9148 N.a1MW6M ',0),(132,'Вороницын Радован Власович','100','+79366069863',NULL,'OAFYenYOJhI0mJBDsRNGg','voronicynradovan596','2024-05-17 06:44:35','voronicynradovan596@riocketmail.com',1,'1977-12-29','Вороницын Радован Власович 1977-12-29 voronicynradovan596@riocketmail.com +79366069863 voronicynradovan596 OAFYenYOJhI0mJBDsRNGg ',0),(133,'Сторожевский Селивёрст Владимирович','100','+79848235971',NULL,'cFEKGvdU8hU','storozhevskiyseliverst8203','2024-05-17 06:44:35','storozhevskiyseliverst8203@yandex.ru',1,'1949-11-27','Сторожевский Селивёрст Владимирович 1949-11-27 storozhevskiyseliverst8203@yandex.ru +79848235971 storozhevskiyseliverst8203 cFEKGvdU8hU ',0),(134,'Юркевич Селифан Максимилианович','100','+79097856229',NULL,'56t3Qx8es0diwrHftE_q7b3','yurkevichselifan6087','2024-05-17 06:44:35','yurkevichselifan6087@list.ru',1,'1954-11-03','Юркевич Селифан Максимилианович 1954-11-03 yurkevichselifan6087@list.ru +79097856229 yurkevichselifan6087 56t3Qx8es0diwrHftE_q7b3 ',0),(135,'Архипцев Кирилл Гурьевич','100','+79662602911',NULL,'9zdFsgUJOW4JeODwx','arhipcevkirill5969','2024-05-17 06:44:35','arhipcevkirill5969@mail.ru',1,'1995-03-24','Архипцев Кирилл Гурьевич 1995-03-24 arhipcevkirill5969@mail.ru +79662602911 arhipcevkirill5969 9zdFsgUJOW4JeODwx ',0),(136,'Позднов Май Демидович','100','+79480417470',NULL,'O8p8JxjKFa.oAXuKzQ0P','pozdnovmay7318','2024-05-17 06:44:35','pozdnovmay7318@free.fr',1,'1950-02-22','Позднов Май Демидович 1950-02-22 pozdnovmay7318@free.fr +79480417470 pozdnovmay7318 O8p8JxjKFa.oAXuKzQ0P ',0),(137,'test','',NULL,NULL,'test','test','2024-05-17 10:17:51','test@test.test',1,'0000-00-00','',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'код визита',
  `dt` datetime NOT NULL COMMENT 'дата и время визита',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'код клиента',
  `service_id` int(11) NOT NULL DEFAULT '0' COMMENT 'код сервиса',
  `status_id` int(11) NOT NULL DEFAULT '0' COMMENT 'код статуса визита',
  `comp` varchar(200) NOT NULL DEFAULT '' COMMENT 'компьютер',
  `repair_id` int(11) NOT NULL COMMENT 'тип ремонта',
  `note` text NOT NULL COMMENT 'примечание',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='визиты, брони';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,'2024-05-16 10:44:00',2,1,1,'HP',2,''),(2,'2024-05-16 14:44:00',4,2,1,'Lenovo',12,'выключается, особенно при играх'),(3,'2024-05-15 13:15:00',3,3,2,'',9,'зависает'),(4,'2024-05-16 14:44:00',5,2,1,'AMD  Ryzen 4500U',11,'выключается, особенно при играх');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 13:20:19
