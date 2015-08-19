-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2015 at 01:23 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `x2fair_portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-06-18 12:11:05', '2015-06-18 12:11:05', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=551 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/x2fair.com', 'yes'),
(2, 'home', 'http://localhost/x2fair.com', 'yes'),
(3, 'blogname', 'Christopher Gerra', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'cngerra@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:45:"custom-contact-forms/custom-contact-forms.php";i:1;s:47:"responsive-photo-gallery/responsive-gallery.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'x2fair2015', 'yes'),
(42, 'stylesheet', 'x2fair2015', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '31536', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '31535', 'yes'),
(89, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";N;s:13:"array_version";i:3;}', 'yes'),
(97, 'cron', 'a:5:{i:1439992831;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1440011700;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1440029466;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1440072783;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(106, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1439987127;s:7:"checked";a:1:{s:10:"x2fair2015";s:3:"1.0";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(108, '_transient_random_seed', '72590ee53cc0f85b4e9cbb55785e3850', 'yes'),
(119, '_transient_twentyfifteen_categories', '1', 'yes'),
(136, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1434633984;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(137, 'current_theme', 'Christopher Gerra Portfolio', 'yes'),
(138, 'theme_mods_x2fair2015', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}}', 'yes'),
(139, 'theme_switched', '', 'yes'),
(141, 'category_children', 'a:0:{}', 'yes'),
(144, 'x2fair_theme_options', 'a:11:{s:4:"logo";s:0:"";s:16:"alternative_logo";s:0:"";s:7:"favicon";s:0:"";s:14:"companyaddress";s:0:"";s:9:"contactno";s:0:"";s:5:"email";s:0:"";s:11:"underbanner";s:1:"1";s:6:"slogan";s:0:"";s:13:"introtextarea";s:211:"I\\''m Christopher Gerra, a front-end web developer based in the Philippines.\r\nI posses over four years of experience in the digital space, specializing in the\r\ncreation of responsive websites and user experience.";s:15:"googleanalytics";s:0:"";s:16:"featuredproducts";N;}', 'yes'),
(147, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(167, 'theme_wptuts_options', 'a:1:{s:4:"logo";s:63:"http://localhost/x2fair.com/wp-content/uploads/2015/06/logo.png";}', 'yes'),
(178, 'theme_christopher_options', 'a:4:{s:4:"logo";s:64:"http://localhost/x2fair.com/wp-content/uploads/2015/06/logo2.png";s:14:"homepage_image";s:68:"http://localhost/x2fair.com/wp-content/uploads/2015/06/home_logo.png";s:7:"favicon";s:67:"http://localhost/x2fair.com/wp-content/uploads/2015/06/favicon1.png";s:13:"introtextarea";N;}', 'yes'),
(215, 'recently_activated', 'a:0:{}', 'yes'),
(217, 'json_api_plugin_version', '1.2.1', 'yes'),
(219, 'ccf_upgraded_forms', 'a:0:{}', 'yes'),
(221, 'WL_IGP_Settings', 's:273:"a:7:{s:18:"WL_Hover_Animation";s:4:"fade";s:17:"WL_Gallery_Layout";s:8:"col-md-4";s:14:"WL_Hover_Color";s:7:"#74C9BE";s:22:"WL_Hover_Color_Opacity";s:1:"1";s:13:"WL_Font_Style";s:9:"Helvetica";s:18:"WL_Image_View_Icon";s:12:"fa-picture-o";s:16:"WL_Gallery_Title";s:2:"no";}";', 'yes'),
(317, 'WPLANG', '', 'yes'),
(381, 'ilc_theme_settings', 'a:3:{s:9:"ilc_intro";s:33:"Some intro text for the home page";s:13:"ilc_tag_class";b:0;s:6:"ilc_ga";b:0;}', 'yes'),
(408, 'db_upgraded', '', 'yes'),
(409, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:2:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:57:"https://downloads.wordpress.org/release/wordpress-4.3.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:57:"https://downloads.wordpress.org/release/wordpress-4.3.zip";s:10:"no_content";s:68:"https://downloads.wordpress.org/release/wordpress-4.3-no-content.zip";s:11:"new_bundled";s:69:"https://downloads.wordpress.org/release/wordpress-4.3-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:3:"4.3";s:7:"version";s:3:"4.3";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":12:{s:8:"response";s:10:"autoupdate";s:8:"download";s:57:"https://downloads.wordpress.org/release/wordpress-4.3.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:57:"https://downloads.wordpress.org/release/wordpress-4.3.zip";s:10:"no_content";s:68:"https://downloads.wordpress.org/release/wordpress-4.3-no-content.zip";s:11:"new_bundled";s:69:"https://downloads.wordpress.org/release/wordpress-4.3-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:3:"4.3";s:7:"version";s:3:"4.3";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";s:13:"support_email";s:26:"updatehelp42@wordpress.org";s:9:"new_files";s:1:"1";}}s:12:"last_checked";i:1439987112;s:15:"version_checked";s:5:"4.2.4";s:12:"translations";a:0:{}}', 'yes'),
(411, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:17:"cngerra@gmail.com";s:7:"version";s:5:"4.2.4";s:9:"timestamp";i:1439120953;}', 'yes'),
(414, 'rewrite_rules', 'a:89:{s:21:"responsive-gallery/?$";s:38:"index.php?post_type=responsive-gallery";s:51:"responsive-gallery/feed/(feed|rdf|rss|rss2|atom)/?$";s:55:"index.php?post_type=responsive-gallery&feed=$matches[1]";s:46:"responsive-gallery/(feed|rdf|rss|rss2|atom)/?$";s:55:"index.php?post_type=responsive-gallery&feed=$matches[1]";s:38:"responsive-gallery/page/([0-9]{1,})/?$";s:56:"index.php?post_type=responsive-gallery&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?json_route=/";s:13:"^wp-json(.*)?";s:32:"index.php?json_route=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:46:"responsive-gallery/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:56:"responsive-gallery/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:76:"responsive-gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"responsive-gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"responsive-gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"responsive-gallery/([^/]+)/trackback/?$";s:45:"index.php?responsive-gallery=$matches[1]&tb=1";s:59:"responsive-gallery/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:57:"index.php?responsive-gallery=$matches[1]&feed=$matches[2]";s:54:"responsive-gallery/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:57:"index.php?responsive-gallery=$matches[1]&feed=$matches[2]";s:47:"responsive-gallery/([^/]+)/page/?([0-9]{1,})/?$";s:58:"index.php?responsive-gallery=$matches[1]&paged=$matches[2]";s:54:"responsive-gallery/([^/]+)/comment-page-([0-9]{1,})/?$";s:58:"index.php?responsive-gallery=$matches[1]&cpage=$matches[2]";s:39:"responsive-gallery/([^/]+)(/[0-9]+)?/?$";s:57:"index.php?responsive-gallery=$matches[1]&page=$matches[2]";s:35:"responsive-gallery/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"responsive-gallery/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"responsive-gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"responsive-gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"responsive-gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(420, '_site_transient_timeout_browser_224bf283a5a924fc3a30d51d5559a4ea', '1439849353', 'yes'),
(421, '_site_transient_browser_224bf283a5a924fc3a30d51d5559a4ea', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"44.0.2403.130";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(422, 'can_compress_scripts', '1', 'yes'),
(456, 'x2fair_theme_settings', 'a:11:{s:12:"x2fair_intro";s:211:"I\\''m Christopher Gerra, a front-end web developer based in the Philippines.\r\nI posses over four years of experience in the digital space, specializing in the\r\ncreation of responsive websites and user experience.";s:16:"x2fair_tag_class";b:0;s:9:"x2fair_ga";b:0;s:13:"x2fair_fb_url";s:5:"testf";s:18:"x2fair_twitter_url";s:6:"testtw";s:16:"x2fair_gplus_url";s:6:"testg+";s:19:"x2fair_linkedin_url";s:6:"testli";s:11:"x2fair_logo";s:63:"http://localhost/x2fair.com/wp-content/uploads/2015/08/logo.png";s:16:"x2fair_big_image";N;s:14:"x2fair_favicon";s:66:"http://localhost/x2fair.com/wp-content/uploads/2015/08/favicon.png";s:21:"x2fair_homepage_image";s:69:"http://localhost/x2fair.com/wp-content/uploads/2015/08/home_logo1.png";}', 'yes'),
(461, '_site_transient_timeout_browser_dd5b99c4bd8759ea677f8e7dc5c446a4', '1439901482', 'yes'),
(462, '_site_transient_browser_dd5b99c4bd8759ea677f8e7dc5c446a4', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"39.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(475, '_site_transient_timeout_browser_6c87615462301d709781c5732ebdb395', '1440041953', 'yes'),
(476, '_site_transient_browser_6c87615462301d709781c5732ebdb395', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"44.0.2403.130";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(505, '_site_transient_timeout_browser_e3d9c0a5da590831cc59aca115b34dd3', '1440124337', 'yes'),
(506, '_site_transient_browser_e3d9c0a5da590831cc59aca115b34dd3', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"44.0.2403.155";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(531, '_transient_timeout_plugin_slugs', '1439764806', 'no'),
(532, '_transient_plugin_slugs', 'a:4:{i:0;s:19:"akismet/akismet.php";i:1;s:45:"custom-contact-forms/custom-contact-forms.php";i:2;s:9:"hello.php";i:3;s:47:"responsive-photo-gallery/responsive-gallery.php";}', 'no'),
(533, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1439721606', 'no'),
(534, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: wordpress.org</p></div><div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: planet.wordpress.org</p></div><div class="rss-widget"><ul></ul></div>', 'no'),
(546, '_site_transient_timeout_theme_roots', '1439988914', 'yes'),
(547, '_site_transient_theme_roots', 'a:1:{s:10:"x2fair2015";s:7:"/themes";}', 'yes'),
(550, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1439987127;s:8:"response";a:3:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.3";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.3.zip";}s:45:"custom-contact-forms/custom-contact-forms.php";O:8:"stdClass":6:{s:2:"id";s:5:"16159";s:4:"slug";s:20:"custom-contact-forms";s:6:"plugin";s:45:"custom-contact-forms/custom-contact-forms.php";s:11:"new_version";s:3:"6.8";s:3:"url";s:51:"https://wordpress.org/plugins/custom-contact-forms/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/custom-contact-forms.6.8.zip";}s:47:"responsive-photo-gallery/responsive-gallery.php";O:8:"stdClass":6:{s:2:"id";s:5:"50904";s:4:"slug";s:24:"responsive-photo-gallery";s:6:"plugin";s:47:"responsive-photo-gallery/responsive-gallery.php";s:11:"new_version";s:3:"2.7";s:3:"url";s:55:"https://wordpress.org/plugins/responsive-photo-gallery/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/responsive-photo-gallery.2.7.zip";}}s:12:"translations";a:0:{}s:9:"no_update";a:1:{s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}}}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=183 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(4, 5, '_edit_last', '1'),
(5, 5, '_edit_lock', '1434895787:1'),
(6, 5, '_wp_page_template', 'default'),
(7, 7, '_edit_last', '1'),
(8, 7, '_wp_page_template', 'default'),
(9, 7, '_edit_lock', '1439679032:1'),
(10, 9, '_edit_last', '1'),
(11, 9, '_wp_page_template', 'default'),
(12, 9, '_edit_lock', '1434901924:1'),
(62, 25, '_wp_attached_file', '2015/06/logo2.png'),
(63, 25, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:72;s:6:"height";i:42;s:4:"file";s:17:"2015/06/logo2.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(66, 27, '_wp_attached_file', '2015/06/home_logo.png'),
(67, 27, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:339;s:6:"height";i:195;s:4:"file";s:21:"2015/06/home_logo.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"home_logo-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"home_logo-300x173.png";s:5:"width";i:300;s:6:"height";i:173;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(74, 31, '_wp_attached_file', '2015/06/favicon1.png'),
(75, 31, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:20;s:6:"height";i:20;s:4:"file";s:20:"2015/06/favicon1.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(76, 32, '_menu_item_type', 'custom'),
(77, 32, '_menu_item_menu_item_parent', '0'),
(78, 32, '_menu_item_object_id', '32'),
(79, 32, '_menu_item_object', 'custom'),
(80, 32, '_menu_item_target', ''),
(81, 32, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(82, 32, '_menu_item_xfn', ''),
(83, 32, '_menu_item_url', 'http://localhost/x2fair.com/works#works'),
(85, 33, '_menu_item_type', 'custom'),
(86, 33, '_menu_item_menu_item_parent', '0'),
(87, 33, '_menu_item_object_id', '33'),
(88, 33, '_menu_item_object', 'custom'),
(89, 33, '_menu_item_target', ''),
(90, 33, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(91, 33, '_menu_item_xfn', ''),
(92, 33, '_menu_item_url', 'http://localhost/x2fair.com/works#about'),
(94, 34, '_menu_item_type', 'custom'),
(95, 34, '_menu_item_menu_item_parent', '0'),
(96, 34, '_menu_item_object_id', '34'),
(97, 34, '_menu_item_object', 'custom'),
(98, 34, '_menu_item_target', ''),
(99, 34, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(100, 34, '_menu_item_xfn', ''),
(101, 34, '_menu_item_url', 'http://localhost/x2fair.com/works#contact'),
(102, 35, '_edit_last', '1'),
(103, 35, '_edit_lock', '1434895768:1'),
(104, 36, '_wp_attached_file', '2015/06/sports-q-c-640-480-1.jpg'),
(105, 36, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:480;s:4:"file";s:32:"2015/06/sports-q-c-640-480-1.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:32:"sports-q-c-640-480-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:32:"sports-q-c-640-480-1-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(106, 37, '_wp_attached_file', '2015/06/city-q-c-640-480-6.jpg'),
(107, 37, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:480;s:4:"file";s:30:"2015/06/city-q-c-640-480-6.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"city-q-c-640-480-6-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:30:"city-q-c-640-480-6-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(108, 38, '_wp_attached_file', '2015/06/city-q-g-640-480-7.jpg'),
(109, 38, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:480;s:4:"file";s:30:"2015/06/city-q-g-640-480-7.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"city-q-g-640-480-7-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:30:"city-q-g-640-480-7-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(110, 39, '_wp_attached_file', '2015/06/food-q-c-640-480-5.jpg'),
(111, 39, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:480;s:4:"file";s:30:"2015/06/food-q-c-640-480-5.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"food-q-c-640-480-5-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:30:"food-q-c-640-480-5-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(112, 40, '_wp_attached_file', '2015/06/nightlife-q-c-640-480-8.jpg'),
(113, 40, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:480;s:4:"file";s:35:"2015/06/nightlife-q-c-640-480-8.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"nightlife-q-c-640-480-8-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"nightlife-q-c-640-480-8-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(114, 41, '_wp_attached_file', '2015/06/nightlife-q-g-640-480-9.jpg'),
(115, 41, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:480;s:4:"file";s:35:"2015/06/nightlife-q-g-640-480-9.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"nightlife-q-g-640-480-9-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"nightlife-q-g-640-480-9-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(116, 35, 'rpg_all_photos_details', 's:894:"a:6:{i:0;a:2:{s:15:"rpg_image_label";s:0:"";s:13:"rpg_image_url";s:79:"http://localhost/x2fair.com/wp-content/uploads/2015/06/sports-q-c-640-480-1.jpg";}i:1;a:2:{s:15:"rpg_image_label";s:0:"";s:13:"rpg_image_url";s:82:"http://localhost/x2fair.com/wp-content/uploads/2015/06/nightlife-q-g-640-480-9.jpg";}i:2;a:2:{s:15:"rpg_image_label";s:0:"";s:13:"rpg_image_url";s:77:"http://localhost/x2fair.com/wp-content/uploads/2015/06/food-q-c-640-480-5.jpg";}i:3;a:2:{s:15:"rpg_image_label";s:0:"";s:13:"rpg_image_url";s:82:"http://localhost/x2fair.com/wp-content/uploads/2015/06/nightlife-q-c-640-480-8.jpg";}i:4;a:2:{s:15:"rpg_image_label";s:0:"";s:13:"rpg_image_url";s:77:"http://localhost/x2fair.com/wp-content/uploads/2015/06/city-q-g-640-480-7.jpg";}i:5;a:2:{s:15:"rpg_image_label";s:0:"";s:13:"rpg_image_url";s:77:"http://localhost/x2fair.com/wp-content/uploads/2015/06/city-q-c-640-480-6.jpg";}}";'),
(117, 35, 'rpg_total_images_count', '6'),
(118, 45, 'ccf_field_type', 'single-line-text'),
(119, 45, 'ccf_field_slug', 'name'),
(120, 45, 'ccf_field_placeholder', ''),
(121, 45, 'ccf_field_className', ''),
(122, 45, 'ccf_field_label', 'Name:'),
(123, 45, 'ccf_field_description', ''),
(124, 45, 'ccf_field_value', ''),
(125, 45, 'ccf_field_required', '1'),
(126, 46, 'ccf_field_type', 'email'),
(127, 46, 'ccf_field_slug', 'email'),
(128, 46, 'ccf_field_placeholder', ''),
(129, 46, 'ccf_field_className', ''),
(130, 46, 'ccf_field_label', 'Email:'),
(131, 46, 'ccf_field_description', ''),
(132, 46, 'ccf_field_value', ''),
(133, 46, 'ccf_field_required', '1'),
(134, 46, 'ccf_field_emailConfirmation', ''),
(135, 47, 'ccf_field_type', 'phone'),
(136, 47, 'ccf_field_slug', 'phone'),
(137, 47, 'ccf_field_placeholder', ''),
(138, 47, 'ccf_field_className', ''),
(139, 47, 'ccf_field_label', 'Phone:'),
(140, 47, 'ccf_field_description', ''),
(141, 47, 'ccf_field_value', ''),
(142, 47, 'ccf_field_required', '1'),
(143, 47, 'ccf_field_phoneFormat', 'international'),
(144, 48, 'ccf_field_type', 'paragraph-text'),
(145, 48, 'ccf_field_slug', 'message'),
(146, 48, 'ccf_field_placeholder', ''),
(147, 48, 'ccf_field_className', ''),
(148, 48, 'ccf_field_label', 'Message:'),
(149, 48, 'ccf_field_description', ''),
(150, 48, 'ccf_field_value', ''),
(151, 48, 'ccf_field_required', '1'),
(152, 44, 'ccf_attached_fields', 'a:4:{i:0;i:45;i:1;i:46;i:2;i:47;i:3;i:48;}'),
(153, 44, 'ccf_form_buttonText', 'SEND'),
(154, 44, 'ccf_form_description', ''),
(155, 44, 'ccf_form_completion_action_type', 'text'),
(156, 44, 'ccf_form_completion_message', 'Thank you for sending a message. I will get in touch with you soon.'),
(157, 44, 'ccf_form_completion_redirect_url', ''),
(158, 44, 'ccf_form_send_email_notifications', ''),
(159, 44, 'ccf_form_pause', ''),
(160, 44, 'ccf_form_pause_message', 'This form is paused right now. Check back later!'),
(161, 44, 'ccf_form_email_notification_addresses', 'cngerra@gmail.com'),
(162, 44, 'ccf_form_email_notification_from_type', 'default'),
(163, 44, 'ccf_form_email_notification_from_address', ''),
(164, 44, 'ccf_form_email_notification_from_field', 'email-'),
(165, 44, '_edit_lock', '1434898565:1'),
(166, 51, '_wp_attached_file', '2015/06/icon-fb.png'),
(167, 51, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:64;s:6:"height";i:64;s:4:"file";s:19:"2015/06/icon-fb.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(168, 52, '_wp_attached_file', '2015/06/icon-linkedin.png'),
(169, 52, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:64;s:6:"height";i:64;s:4:"file";s:25:"2015/06/icon-linkedin.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(170, 55, '_wp_attached_file', '2015/06/about-me.png'),
(171, 55, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:339;s:6:"height";i:195;s:4:"file";s:20:"2015/06/about-me.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"about-me-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:20:"about-me-300x173.png";s:5:"width";i:300;s:6:"height";i:173;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(172, 63, '_edit_last', '1'),
(173, 63, '_wp_page_template', 'default'),
(174, 63, '_edit_lock', '1435549697:1'),
(175, 67, '_wp_attached_file', '2015/08/favicon.png'),
(176, 67, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:20;s:6:"height";i:20;s:4:"file";s:19:"2015/08/favicon.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(177, 68, '_wp_attached_file', '2015/08/logo.png'),
(178, 68, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:72;s:6:"height";i:42;s:4:"file";s:16:"2015/08/logo.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(179, 69, '_wp_attached_file', '2015/08/home_logo.png'),
(180, 69, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:339;s:6:"height";i:195;s:4:"file";s:21:"2015/08/home_logo.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"home_logo-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"home_logo-300x173.png";s:5:"width";i:300;s:6:"height";i:173;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(181, 70, '_wp_attached_file', '2015/08/home_logo1.png'),
(182, 70, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:339;s:6:"height";i:195;s:4:"file";s:22:"2015/08/home_logo1.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"home_logo1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:22:"home_logo1-300x173.png";s:5:"width";i:300;s:6:"height";i:173;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=72 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-06-18 12:11:05', '2015-06-18 12:11:05', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-06-18 12:11:05', '2015-06-18 12:11:05', '', 0, 'http://localhost/x2fair.com/?p=1', 0, 'post', '', 1),
(5, 1, '2015-06-18 14:00:50', '2015-06-18 14:00:50', '[WRG id=35]', 'Works', '', 'publish', 'open', 'open', '', 'works', '', '', '2015-06-21 14:12:07', '2015-06-21 14:12:07', '', 0, 'http://localhost/x2fair.com/?page_id=5', 0, 'page', '', 0),
(6, 1, '2015-06-18 14:00:50', '2015-06-18 14:00:50', '', 'Works', '', 'inherit', 'open', 'open', '', '5-revision-v1', '', '', '2015-06-18 14:00:50', '2015-06-18 14:00:50', '', 5, 'http://localhost/x2fair.com/2015/06/18/5-revision-v1/', 0, 'revision', '', 0),
(7, 1, '2015-06-18 14:01:08', '2015-06-18 14:01:08', '<div class="col-xs-12 col-sm-6 col-md-4 my_image text-center"><a href="http://localhost/x2fair.com/wp-content/uploads/2015/06/home_logo.png"><img class=" img-responsive alignnone wp-image-27 size-full" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/home_logo.png" alt="" width="339" height="195" /></a></div>\r\n<div class="col-xs-12 col-sm-6 col-md-8 about_details">\r\n\r\nI am 24 years of age that have an interest in Front-end and Back-end Web Developing. After graduating from Eastern Visayas State University in March 2011, I took web development as the field in IT to be focused.\r\n\r\nI have 4 years of experience in Web Development using technology such as <span style="color: #fc2856;">PHP</span>, <span style="color: #fc2856;">HTML5</span>, <span style="color: #fc2856;">CSS</span>, <span style="color: #fc2856;">JQuery</span>, <span style="color: #fc2856;">Bootstrap</span>, <span style="color: #fc2856;">OpenCart</span> and <span style="color: #fc2856;">WordPress</span>.  I can develop a website from the scratch or from a PSD file. I design a website that are not only visual appealing but also in a cross browser way. Also I built web projects that are browser responsive so that it will fit of what device or gadget we are using.\r\n\r\nI really want to improve my skills because I love doing job on this field.\r\n\r\n</div>', 'About', '', 'publish', 'open', 'open', '', 'about', '', '', '2015-08-15 22:50:31', '2015-08-15 22:50:31', '', 0, 'http://localhost/x2fair.com/?page_id=7', 0, 'page', '', 0),
(8, 1, '2015-06-18 14:01:08', '2015-06-18 14:01:08', '', 'About', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-06-18 14:01:08', '2015-06-18 14:01:08', '', 7, 'http://localhost/x2fair.com/2015/06/18/7-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2015-06-18 14:01:15', '2015-06-18 14:01:15', '<div class="col-xs-12 col-sm-6 col-md-4 social-icons">\r\n\r\n<a href="#" target="_blank"><img class="alignnone size-full wp-image-51" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-fb.png" alt="icon-fb" /></a>   <a href="#" target="_blank"><img class="alignnone size-full wp-image-52" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-linkedin.png" alt="icon-linkedin" /></a>\r\n\r\nEmail me directly at\r\n<a href="mailto:hi@christophergerra.com">hi@christophergerra.com</a>\r\nor use this form\r\n\r\n</div>\r\n<div class="col-xs-12 col-sm-6 col-md-8 contact-form">\r\n\r\n[ccf_form id="44"]\r\n\r\n</div>', 'Contact', '', 'publish', 'open', 'open', '', 'contact', '', '', '2015-06-21 15:36:23', '2015-06-21 15:36:23', '', 0, 'http://localhost/x2fair.com/?page_id=9', 0, 'page', '', 0),
(10, 1, '2015-06-18 14:01:15', '2015-06-18 14:01:15', '', 'Contact', '', 'inherit', 'open', 'open', '', '9-revision-v1', '', '', '2015-06-18 14:01:15', '2015-06-18 14:01:15', '', 9, 'http://localhost/x2fair.com/2015/06/18/9-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2015-06-19 18:14:30', '2015-06-19 18:14:30', '', 'logo', '', 'inherit', 'open', 'open', '', 'logo-3', '', '', '2015-06-19 18:14:30', '2015-06-19 18:14:30', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/logo2.png', 0, 'attachment', 'image/png', 0),
(27, 1, '2015-06-19 18:23:52', '2015-06-19 18:23:52', '', 'home_logo', '', 'inherit', 'open', 'open', '', 'home_logo', '', '', '2015-06-19 18:23:52', '2015-06-19 18:23:52', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/home_logo.png', 0, 'attachment', 'image/png', 0),
(31, 1, '2015-06-21 03:55:59', '2015-06-21 03:55:59', '', 'favicon', '', 'inherit', 'open', 'open', '', 'favicon-2', '', '', '2015-06-21 03:55:59', '2015-06-21 03:55:59', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/favicon1.png', 0, 'attachment', 'image/png', 0),
(32, 1, '2015-06-21 07:03:06', '2015-06-21 07:03:06', '', 'Works', '', 'publish', 'open', 'open', '', 'works', '', '', '2015-07-20 13:17:59', '2015-07-20 13:17:59', '', 0, 'http://localhost/x2fair.com/?p=32', 1, 'nav_menu_item', '', 0),
(33, 1, '2015-06-21 07:03:06', '2015-06-21 07:03:06', '', 'About', '', 'publish', 'open', 'open', '', 'about', '', '', '2015-07-20 13:17:59', '2015-07-20 13:17:59', '', 0, 'http://localhost/x2fair.com/?p=33', 2, 'nav_menu_item', '', 0),
(34, 1, '2015-06-21 07:03:06', '2015-06-21 07:03:06', '', 'Contact', '', 'publish', 'open', 'open', '', 'contact', '', '', '2015-07-20 13:17:59', '2015-07-20 13:17:59', '', 0, 'http://localhost/x2fair.com/?p=34', 3, 'nav_menu_item', '', 0),
(35, 1, '2015-06-21 14:11:47', '2015-06-21 14:11:47', '', 'Gallery', '', 'publish', 'closed', 'closed', '', 'gallery', '', '', '2015-06-21 14:11:47', '2015-06-21 14:11:47', '', 0, 'http://localhost/x2fair.com/?post_type=responsive-gallery&#038;p=35', 0, 'responsive-gallery', '', 0),
(36, 1, '2015-06-21 13:54:29', '2015-06-21 13:54:29', '', 'sports-q-c-640-480-1', '', 'inherit', 'open', 'open', '', 'sports-q-c-640-480-1', '', '', '2015-06-21 13:54:29', '2015-06-21 13:54:29', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/sports-q-c-640-480-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(37, 1, '2015-06-21 13:54:30', '2015-06-21 13:54:30', '', 'city-q-c-640-480-6', '', 'inherit', 'open', 'open', '', 'city-q-c-640-480-6', '', '', '2015-06-21 13:54:30', '2015-06-21 13:54:30', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/city-q-c-640-480-6.jpg', 0, 'attachment', 'image/jpeg', 0),
(38, 1, '2015-06-21 13:54:31', '2015-06-21 13:54:31', '', 'city-q-g-640-480-7', '', 'inherit', 'open', 'open', '', 'city-q-g-640-480-7', '', '', '2015-06-21 13:54:31', '2015-06-21 13:54:31', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/city-q-g-640-480-7.jpg', 0, 'attachment', 'image/jpeg', 0),
(39, 1, '2015-06-21 13:54:32', '2015-06-21 13:54:32', '', 'food-q-c-640-480-5', '', 'inherit', 'open', 'open', '', 'food-q-c-640-480-5', '', '', '2015-06-21 13:54:32', '2015-06-21 13:54:32', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/food-q-c-640-480-5.jpg', 0, 'attachment', 'image/jpeg', 0),
(40, 1, '2015-06-21 13:54:32', '2015-06-21 13:54:32', '', 'nightlife-q-c-640-480-8', '', 'inherit', 'open', 'open', '', 'nightlife-q-c-640-480-8', '', '', '2015-06-21 13:54:32', '2015-06-21 13:54:32', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/nightlife-q-c-640-480-8.jpg', 0, 'attachment', 'image/jpeg', 0),
(41, 1, '2015-06-21 13:54:33', '2015-06-21 13:54:33', '', 'nightlife-q-g-640-480-9', '', 'inherit', 'open', 'open', '', 'nightlife-q-g-640-480-9', '', '', '2015-06-21 13:54:33', '2015-06-21 13:54:33', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/nightlife-q-g-640-480-9.jpg', 0, 'attachment', 'image/jpeg', 0),
(42, 1, '2015-06-21 14:12:07', '2015-06-21 14:12:07', '[WRG id=35]', 'Works', '', 'inherit', 'open', 'open', '', '5-revision-v1', '', '', '2015-06-21 14:12:07', '2015-06-21 14:12:07', '', 5, 'http://localhost/x2fair.com/2015/06/21/5-revision-v1/', 0, 'revision', '', 0),
(44, 1, '2015-06-21 14:57:32', '2015-06-21 14:57:32', '', '', '', 'publish', 'open', 'open', '', '44', '', '', '2015-06-21 15:02:21', '2015-06-21 15:02:21', '', 0, 'http://localhost/x2fair.com/?post_type=ccf_form&#038;p=44', 0, 'ccf_form', '', 0),
(45, 1, '2015-06-21 14:57:32', '2015-06-21 14:57:32', '', 'name-44', '', 'publish', 'open', 'open', '', 'name-44', '', '', '2015-06-21 14:57:32', '2015-06-21 14:57:32', '', 44, 'http://localhost/x2fair.com/?post_type=ccf_field&p=45', 0, 'ccf_field', '', 0),
(46, 1, '2015-06-21 14:57:32', '2015-06-21 14:57:32', '', 'email--44', '', 'publish', 'open', 'open', '', 'email-44', '', '', '2015-06-21 14:57:32', '2015-06-21 14:57:32', '', 44, 'http://localhost/x2fair.com/?post_type=ccf_field&p=46', 0, 'ccf_field', '', 0),
(47, 1, '2015-06-21 14:57:32', '2015-06-21 14:57:32', '', 'phone-44', '', 'publish', 'open', 'open', '', 'phone-44', '', '', '2015-06-21 14:57:32', '2015-06-21 14:57:32', '', 44, 'http://localhost/x2fair.com/?post_type=ccf_field&p=47', 0, 'ccf_field', '', 0),
(48, 1, '2015-06-21 14:57:33', '2015-06-21 14:57:33', '', 'message-44', '', 'publish', 'open', 'open', '', 'message-44', '', '', '2015-06-21 14:57:33', '2015-06-21 14:57:33', '', 44, 'http://localhost/x2fair.com/?post_type=ccf_field&p=48', 0, 'ccf_field', '', 0),
(49, 1, '2015-06-21 14:58:46', '2015-06-21 14:58:46', '[ccf_form id="44"]', 'Contact', '', 'inherit', 'open', 'open', '', '9-revision-v1', '', '', '2015-06-21 14:58:46', '2015-06-21 14:58:46', '', 9, 'http://localhost/x2fair.com/2015/06/21/9-revision-v1/', 0, 'revision', '', 0),
(50, 1, '2015-06-21 15:34:53', '2015-06-21 15:34:53', '<div class="col-xs-12 col-sm-6 col-md-4 social-icons">\n\n<a href="http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-fb.png"><img class="alignnone size-full wp-image-51" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-fb.png" alt="icon-fb" width="64" height="64" /></a> <a href="http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-linkedin.png"><img class="alignnone size-full wp-image-52" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-linkedin.png" alt="icon-linkedin" width="64" height="64" /></a>\n\nEmail me directly at\n<a href="mailto:hi@christophergerra.com">hi@christophergerra.com</a>\nor use this form\n\n</div>\n<div class="col-xs-12 col-sm-6 col-md-8 contact-form">\n\n[ccf_form id="44"]\n\n</div>', 'Contact', '', 'inherit', 'open', 'open', '', '9-autosave-v1', '', '', '2015-06-21 15:34:53', '2015-06-21 15:34:53', '', 9, 'http://localhost/x2fair.com/2015/06/21/9-autosave-v1/', 0, 'revision', '', 0),
(51, 1, '2015-06-21 15:34:38', '2015-06-21 15:34:38', '', 'icon-fb', '', 'inherit', 'open', 'open', '', 'icon-fb', '', '', '2015-06-21 15:34:38', '2015-06-21 15:34:38', '', 9, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-fb.png', 0, 'attachment', 'image/png', 0),
(52, 1, '2015-06-21 15:34:40', '2015-06-21 15:34:40', '', 'icon-linkedin', '', 'inherit', 'open', 'open', '', 'icon-linkedin', '', '', '2015-06-21 15:34:40', '2015-06-21 15:34:40', '', 9, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-linkedin.png', 0, 'attachment', 'image/png', 0),
(53, 1, '2015-06-21 15:36:23', '2015-06-21 15:36:23', '<div class="col-xs-12 col-sm-6 col-md-4 social-icons">\r\n\r\n<a href="#" target="_blank"><img class="alignnone size-full wp-image-51" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-fb.png" alt="icon-fb" /></a>   <a href="#" target="_blank"><img class="alignnone size-full wp-image-52" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/icon-linkedin.png" alt="icon-linkedin" /></a>\r\n\r\nEmail me directly at\r\n<a href="mailto:hi@christophergerra.com">hi@christophergerra.com</a>\r\nor use this form\r\n\r\n</div>\r\n<div class="col-xs-12 col-sm-6 col-md-8 contact-form">\r\n\r\n[ccf_form id="44"]\r\n\r\n</div>', 'Contact', '', 'inherit', 'open', 'open', '', '9-revision-v1', '', '', '2015-06-21 15:36:23', '2015-06-21 15:36:23', '', 9, 'http://localhost/x2fair.com/2015/06/21/9-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2015-06-23 05:02:02', '2015-06-23 05:02:02', '<div class="col-xs-12 col-sm-6 col-md-4 my_image text-center"><img class=" size-full wp-image-55 img-responsive" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/about-me.png" alt="about-me" /></div>\n<div class="col-xs-12 col-sm-6 col-md-8 about_details">\n\nI am 24 years of age that have an interest in Front-end and Back-end Web Developing. After graduating from Eastern Visayas State University in March 2011, I took web development as the field in IT to be focused.\n\nI have 4 years of experience in Web Development using technology such as <span style="color: #fc2856;">PHP</span>, <span style="color: #fc2856;">HTML5</span>, <span style="color: #fc2856;">CSS</span>, <span style="color: #fc2856;">JQuery</span>, <span style="color: #fc2856;">Bootstrap</span>, <span style="color: #fc2856;">OpenCart</span> and <span style="color: #fc2856;">WordPress</span>.  I can develop a website from the scratch or from a PSD file. I design a website that are not only visual appealing but also in a cross browser way. Also I built web projects that are browser responsive so that it will fit of what device or gadget we are using.\n\nI really want to improve my skills because I love doing job on this field.\n\n</div>', 'About', '', 'inherit', 'open', 'open', '', '7-autosave-v1', '', '', '2015-06-23 05:02:02', '2015-06-23 05:02:02', '', 7, 'http://localhost/x2fair.com/2015/06/21/7-autosave-v1/', 0, 'revision', '', 0),
(55, 1, '2015-06-21 15:55:51', '2015-06-21 15:55:51', '', 'about-me', '', 'inherit', 'open', 'open', '', 'about-me', '', '', '2015-06-21 15:55:51', '2015-06-21 15:55:51', '', 7, 'http://localhost/x2fair.com/wp-content/uploads/2015/06/about-me.png', 0, 'attachment', 'image/png', 0),
(56, 1, '2015-06-21 15:56:13', '2015-06-21 15:56:13', '<img class=" size-full wp-image-55 alignleft" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/about-me.png" alt="about-me" width="339" height="195" />I am 23 years of age that have an interest in Front-end and Back-end Web Developing. After graduating from Eastern Visayas State University in March 2011, I took web development as the field in IT to be focused.\r\n\r\nI have 4 years of experience in Web Development using technology such as <span style="color: #a40606;">PHP</span>, <span style="color: #a40606;">HTML</span>, <span style="color: #a40606;">CSS</span>, <span style="color: #a40606;">JQuery</span>, <span style="color: #a40606;">Bootstrap</span> and <span style="color: #a40606;">WordPress</span>.  I can develop a website from the scratch or from a PSD file. I design a website that are not only visual appealing but also in a cross browser way. Also I built web projects that are browser responsive so that it will fit of what device or gadget we are using.\r\n\r\nI really want to improve my skills because I love doing job on this field.', 'About', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-06-21 15:56:13', '2015-06-21 15:56:13', '', 7, 'http://localhost/x2fair.com/2015/06/21/7-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2015-06-21 15:57:42', '2015-06-21 15:57:42', '<div class="col-xs-12 col-sm-6 col-md-4"><img class=" size-full wp-image-55 img-responsive" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/about-me.png" alt="about-me" /></div>\r\n<div class="col-xs-12 col-sm-6 col-md-8">\r\n\r\nI am 23 years of age that have an interest in Front-end and Back-end Web Developing. After graduating from Eastern Visayas State University in March 2011, I took web development as the field in IT to be focused.\r\n\r\nI have 4 years of experience in Web Development using technology such as <span style="color: #a40606;">PHP</span>, <span style="color: #a40606;">HTML</span>, <span style="color: #a40606;">CSS</span>, <span style="color: #a40606;">JQuery</span>, <span style="color: #a40606;">Bootstrap</span> and <span style="color: #a40606;">WordPress</span>.  I can develop a website from the scratch or from a PSD file. I design a website that are not only visual appealing but also in a cross browser way. Also I built web projects that are browser responsive so that it will fit of what device or gadget we are using.\r\n\r\nI really want to improve my skills because I love doing job on this field.\r\n\r\n</div>', 'About', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-06-21 15:57:42', '2015-06-21 15:57:42', '', 7, 'http://localhost/x2fair.com/2015/06/21/7-revision-v1/', 0, 'revision', '', 0),
(58, 1, '2015-06-21 15:59:54', '2015-06-21 15:59:54', '<div class="col-xs-12 col-sm-6 col-md-4"><img class=" size-full wp-image-55 img-responsive" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/about-me.png" alt="about-me" /></div>\r\n<div class="col-xs-12 col-sm-6 col-md-8">\r\n\r\nI am 24 years of age that have an interest in Front-end and Back-end Web Developing. After graduating from Eastern Visayas State University in March 2011, I took web development as the field in IT to be focused.\r\n\r\nI have 4 years of experience in Web Development using technology such as <span style="color: #a40606;">PHP</span>, <span style="color: #a40606;">HTML</span>, <span style="color: #a40606;">CSS</span>, <span style="color: #a40606;">JQuery</span>, <span style="color: #a40606;">Bootstrap</span> and <span style="color: #a40606;">WordPress</span>.  I can develop a website from the scratch or from a PSD file. I design a website that are not only visual appealing but also in a cross browser way. Also I built web projects that are browser responsive so that it will fit of what device or gadget we are using.\r\n\r\nI really want to improve my skills because I love doing job on this field.\r\n\r\n</div>', 'About', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-06-21 15:59:54', '2015-06-21 15:59:54', '', 7, 'http://localhost/x2fair.com/2015/06/21/7-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2015-06-22 02:26:05', '2015-06-22 02:26:05', '<div class="col-xs-12 col-sm-6 col-md-4 my_image"><img class=" size-full wp-image-55 img-responsive" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/about-me.png" alt="about-me" /></div>\r\n<div class="col-xs-12 col-sm-6 col-md-8 about_details">\r\n\r\nI am 24 years of age that have an interest in Front-end and Back-end Web Developing. After graduating from Eastern Visayas State University in March 2011, I took web development as the field in IT to be focused.\r\n\r\nI have 4 years of experience in Web Development using technology such as <span style="color: #a40606;">PHP</span>, <span style="color: #a40606;">HTML</span>, <span style="color: #a40606;">CSS</span>, <span style="color: #a40606;">JQuery</span>, <span style="color: #a40606;">Bootstrap</span> and <span style="color: #a40606;">WordPress</span>.  I can develop a website from the scratch or from a PSD file. I design a website that are not only visual appealing but also in a cross browser way. Also I built web projects that are browser responsive so that it will fit of what device or gadget we are using.\r\n\r\nI really want to improve my skills because I love doing job on this field.\r\n\r\n</div>', 'About', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-06-22 02:26:05', '2015-06-22 02:26:05', '', 7, 'http://localhost/x2fair.com/2015/06/22/7-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2015-06-22 02:28:51', '2015-06-22 02:28:51', '<div class="col-xs-12 col-sm-6 col-md-4 my_image text-center"><img class=" size-full wp-image-55 img-responsive" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/about-me.png" alt="about-me" /></div>\r\n<div class="col-xs-12 col-sm-6 col-md-8 about_details">\r\n\r\nI am 24 years of age that have an interest in Front-end and Back-end Web Developing. After graduating from Eastern Visayas State University in March 2011, I took web development as the field in IT to be focused.\r\n\r\nI have 4 years of experience in Web Development using technology such as <span style="color: #a40606;">PHP</span>, <span style="color: #a40606;">HTML</span>, <span style="color: #a40606;">CSS</span>, <span style="color: #a40606;">JQuery</span>, <span style="color: #a40606;">Bootstrap</span> and <span style="color: #a40606;">WordPress</span>.  I can develop a website from the scratch or from a PSD file. I design a website that are not only visual appealing but also in a cross browser way. Also I built web projects that are browser responsive so that it will fit of what device or gadget we are using.\r\n\r\nI really want to improve my skills because I love doing job on this field.\r\n\r\n</div>', 'About', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-06-22 02:28:51', '2015-06-22 02:28:51', '', 7, 'http://localhost/x2fair.com/2015/06/22/7-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2015-06-23 05:02:06', '2015-06-23 05:02:06', '<div class="col-xs-12 col-sm-6 col-md-4 my_image text-center"><img class=" size-full wp-image-55 img-responsive" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/about-me.png" alt="about-me" /></div>\r\n<div class="col-xs-12 col-sm-6 col-md-8 about_details">\r\n\r\nI am 24 years of age that have an interest in Front-end and Back-end Web Developing. After graduating from Eastern Visayas State University in March 2011, I took web development as the field in IT to be focused.\r\n\r\nI have 4 years of experience in Web Development using technology such as <span style="color: #fc2856;">PHP</span>, <span style="color: #fc2856;">HTML5</span>, <span style="color: #fc2856;">CSS</span>, <span style="color: #fc2856;">JQuery</span>, <span style="color: #fc2856;">Bootstrap</span>, <span style="color: #fc2856;">OpenCart</span> and <span style="color: #fc2856;">WordPress</span>.  I can develop a website from the scratch or from a PSD file. I design a website that are not only visual appealing but also in a cross browser way. Also I built web projects that are browser responsive so that it will fit of what device or gadget we are using.\r\n\r\nI really want to improve my skills because I love doing job on this field.\r\n\r\n</div>', 'About', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-06-23 05:02:06', '2015-06-23 05:02:06', '', 7, 'http://localhost/x2fair.com/2015/06/23/7-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2015-06-29 03:45:48', '2015-06-29 03:45:48', '', 'Know More About Me', '', 'publish', 'open', 'closed', '', 'inner', '', '', '2015-06-29 03:48:17', '2015-06-29 03:48:17', '', 0, 'http://localhost/x2fair.com/?page_id=63', 0, 'page', '', 0),
(64, 1, '2015-06-29 03:45:48', '2015-06-29 03:45:48', '', 'Inner', '', 'inherit', 'open', 'open', '', '63-revision-v1', '', '', '2015-06-29 03:45:48', '2015-06-29 03:45:48', '', 63, 'http://localhost/x2fair.com/63-revision-v1', 0, 'revision', '', 0),
(65, 1, '2015-06-29 03:48:17', '2015-06-29 03:48:17', '', 'Know More About Me', '', 'inherit', 'open', 'open', '', '63-revision-v1', '', '', '2015-06-29 03:48:17', '2015-06-29 03:48:17', '', 63, 'http://localhost/x2fair.com/63-revision-v1', 0, 'revision', '', 0),
(67, 1, '2015-08-11 12:41:01', '2015-08-11 12:41:01', '', 'favicon', '', 'inherit', 'open', 'open', '', 'favicon', '', '', '2015-08-11 12:41:01', '2015-08-11 12:41:01', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/08/favicon.png', 0, 'attachment', 'image/png', 0),
(68, 1, '2015-08-11 13:08:54', '2015-08-11 13:08:54', '', 'logo', '', 'inherit', 'open', 'open', '', 'logo', '', '', '2015-08-11 13:08:54', '2015-08-11 13:08:54', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/08/logo.png', 0, 'attachment', 'image/png', 0),
(69, 1, '2015-08-15 22:46:49', '2015-08-15 22:46:49', '', 'home_logo', '', 'inherit', 'open', 'open', '', 'home_logo-2', '', '', '2015-08-15 22:46:49', '2015-08-15 22:46:49', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/08/home_logo.png', 0, 'attachment', 'image/png', 0),
(70, 1, '2015-08-15 22:47:53', '2015-08-15 22:47:53', '', 'home_logo', '', 'inherit', 'open', 'open', '', 'home_logo-3', '', '', '2015-08-15 22:47:53', '2015-08-15 22:47:53', '', 0, 'http://localhost/x2fair.com/wp-content/uploads/2015/08/home_logo1.png', 0, 'attachment', 'image/png', 0),
(71, 1, '2015-08-15 22:50:31', '2015-08-15 22:50:31', '<div class="col-xs-12 col-sm-6 col-md-4 my_image text-center"><a href="http://localhost/x2fair.com/wp-content/uploads/2015/06/home_logo.png"><img class=" img-responsive alignnone wp-image-27 size-full" src="http://localhost/x2fair.com/wp-content/uploads/2015/06/home_logo.png" alt="" width="339" height="195" /></a></div>\r\n<div class="col-xs-12 col-sm-6 col-md-8 about_details">\r\n\r\nI am 24 years of age that have an interest in Front-end and Back-end Web Developing. After graduating from Eastern Visayas State University in March 2011, I took web development as the field in IT to be focused.\r\n\r\nI have 4 years of experience in Web Development using technology such as <span style="color: #fc2856;">PHP</span>, <span style="color: #fc2856;">HTML5</span>, <span style="color: #fc2856;">CSS</span>, <span style="color: #fc2856;">JQuery</span>, <span style="color: #fc2856;">Bootstrap</span>, <span style="color: #fc2856;">OpenCart</span> and <span style="color: #fc2856;">WordPress</span>.  I can develop a website from the scratch or from a PSD file. I design a website that are not only visual appealing but also in a cross browser way. Also I built web projects that are browser responsive so that it will fit of what device or gadget we are using.\r\n\r\nI really want to improve my skills because I love doing job on this field.\r\n\r\n</div>', 'About', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-08-15 22:50:31', '2015-08-15 22:50:31', '', 7, 'http://localhost/x2fair.com/7-revision-v1', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(32, 2, 0),
(33, 2, 0),
(34, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Main Menu', 'main-menu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'cngerra'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '66'),
(16, 1, 'session_tokens', 'a:2:{s:64:"2a97e4a4cf33ff73ed475894218cdf0a434c86f94910d8506de6a9b34269c6a1";a:4:{s:10:"expiration";i:1439692336;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36";s:5:"login";i:1439519536;}s:64:"4670aedf1e8b34b6c52ec6a75eb1952579782eceb1bae4fa155ba2a3b41820fa";a:4:{s:10:"expiration";i:1439851201;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:102:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36";s:5:"login";i:1439678401;}}'),
(17, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(18, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(19, 1, 'wp_user-settings', 'imgsize=full&editor=tinymce&libraryContent=browse&advImgDetails=hide&urlbutton=none'),
(20, 1, 'wp_user-settings-time', '1437398218'),
(21, 1, 'nav_menu_recently_edited', '2');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'cngerra', '$P$BAo77F.V/JxKknjtKXnt3mYU1TUF0U1', 'cngerra', 'cngerra@gmail.com', '', '2015-06-18 12:11:04', '', 0, 'cngerra');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
