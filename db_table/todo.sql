-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `todo`;
CREATE TABLE `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` text NOT NULL,
  `date` date NOT NULL,
  `val` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `todo` (`id`, `action`, `date`, `val`) VALUES
(1,	'найти вакансию работу',	'2017-02-14',	1),
(4,	'пройти собеседование',	'2017-02-16',	1),
(3,	'получить задание',	'2017-02-15',	0),
(5,	'получить одобрение',	'2017-02-17',	0),
(6,	'собеседование по skype',	'2017-02-19',	0);

-- 2017-02-19 10:22:28
