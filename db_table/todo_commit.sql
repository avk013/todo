-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `todo_commit`;
CREATE TABLE `todo_commit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `todo_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `commit` text NOT NULL,
  `date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `todo_commit` (`id`, `todo_id`, `name`, `commit`, `date`) VALUES
(13,	3,	'alik',	'1111',	'2017-02-19 08:04:48'),
(12,	4,	'qqq',	'22222',	'2017-02-18 09:07:33'),
(11,	4,	'ali',	'1111',	'2017-02-18 09:07:26');

-- 2017-02-19 10:22:21
