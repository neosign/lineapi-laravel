-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2013 at 12:27 PM
-- Server version: 5.0.51b-community-nt-log
-- PHP Version: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chatserver`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_token`
--

CREATE TABLE IF NOT EXISTS `access_token` (
  `member_id` int(11) NOT NULL,
  `access_token` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `app_id` int(11) NOT NULL,
  UNIQUE KEY `member_id` (`member_id`,`access_token`,`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `friend_group`
--

CREATE TABLE IF NOT EXISTS `friend_group` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `friend_relation`
--

CREATE TABLE IF NOT EXISTS `friend_relation` (
  `relation_id` int(11) NOT NULL auto_increment,
  `member1` int(11) NOT NULL,
  `member2` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `status` tinyint(4) NOT NULL default '0',
  `top_friend1` int(11) NOT NULL,
  `top_friend2` int(11) NOT NULL,
  PRIMARY KEY  (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `friend_request`
--

CREATE TABLE IF NOT EXISTS `friend_request` (
  `request_id` int(11) NOT NULL auto_increment,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`request_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(11) NOT NULL auto_increment,
  `facebook_id` int(11) default NULL,
  `member_type` int(11) NOT NULL default '0',
  `member_name` varchar(100) NOT NULL,
  `member_uname` varchar(100) NOT NULL,
  `member_email` varchar(100) NOT NULL,
  `member_password` varchar(50) NOT NULL,
  `ip_created` varchar(13) NOT NULL,
  `ip_updated` varchar(13) NOT NULL,
  `member_status` tinyint(4) NOT NULL default '0',
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `member_guid` varchar(20) NOT NULL,
  `page_id` varchar(30) NOT NULL,
  PRIMARY KEY  (`member_id`),
  UNIQUE KEY `member_guid` (`member_guid`),
  UNIQUE KEY `member_email` (`member_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `member_to_group`
--

CREATE TABLE IF NOT EXISTS `member_to_group` (
  `mg_id` int(11) NOT NULL auto_increment,
  `member_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY  (`mg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `msg_id` int(11) NOT NULL auto_increment,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `body` varchar(255) NOT NULL,
  `total_read` int(11) NOT NULL,
  `total_must_read` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`msg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
