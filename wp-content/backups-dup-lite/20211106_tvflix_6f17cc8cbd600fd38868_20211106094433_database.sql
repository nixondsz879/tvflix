/* DUPLICATOR-LITE (MYSQL-DUMP BUILD MODE) MYSQL SCRIPT CREATED ON : 2021-11-06 09:44:38 */

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2021-10-26 09:06:51','2021-10-26 09:06:51','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_duplicator_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner` varchar(60) NOT NULL,
  `package` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_duplicator_packages` WRITE;
/*!40000 ALTER TABLE `wp_duplicator_packages` DISABLE KEYS */;
INSERT INTO `wp_duplicator_packages` VALUES (1,'20211106_tvflix','f1a40ce7f26c01304609_20211106085806',100,'2021-11-06 08:58:42','unknown','O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2021-11-06 08:58:06\";s:7:\"Version\";s:5:\"1.4.3\";s:9:\"VersionWP\";s:5:\"5.8.1\";s:9:\"VersionDB\";s:7:\"10.4.18\";s:10:\"VersionPHP\";s:6:\"7.3.27\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";i:1;s:4:\"Name\";s:15:\"20211106_tvflix\";s:4:\"Hash\";s:35:\"f1a40ce7f26c01304609_20211106085806\";s:8:\"NameHash\";s:51:\"20211106_tvflix_f1a40ce7f26c01304609_20211106085806\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:8:\"ScanFile\";s:61:\"20211106_tvflix_f1a40ce7f26c01304609_20211106085806_scan.json\";s:10:\"TimerStart\";i:-1;s:7:\"Runtime\";s:11:\"628.56 sec.\";s:7:\"ExeSize\";s:7:\"64.25KB\";s:7:\"ZipSize\";s:7:\"94.81MB\";s:6:\"Status\";s:5:\"100.0\";s:6:\"WPUser\";s:7:\"unknown\";s:7:\"Archive\";O:11:\"DUP_Archive\":23:{s:10:\"FilterDirs\";s:0:\"\";s:11:\"FilterFiles\";s:0:\"\";s:10:\"FilterExts\";s:0:\"\";s:13:\"FilterDirsAll\";a:0:{}s:14:\"FilterFilesAll\";a:0:{}s:13:\"FilterExtsAll\";a:0:{}s:8:\"FilterOn\";i:0;s:12:\"ExportOnlyDB\";i:0;s:4:\"File\";s:63:\"20211106_tvflix_f1a40ce7f26c01304609_20211106085806_archive.zip\";s:6:\"Format\";s:3:\"ZIP\";s:7:\"PackDir\";s:23:\"C:/xampp/htdocs/tv-flix\";s:4:\"Size\";i:99416134;s:4:\"Dirs\";a:0:{}s:5:\"Files\";a:0:{}s:10:\"FilterInfo\";O:23:\"DUP_Archive_Filter_Info\":8:{s:4:\"Dirs\";O:34:\"DUP_Archive_Filter_Scope_Directory\":6:{s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:10:\"AddonSites\";a:0:{}s:4:\"Core\";a:0:{}s:6:\"Global\";a:0:{}s:8:\"Instance\";a:0:{}}s:5:\"Files\";O:29:\"DUP_Archive_Filter_Scope_File\":7:{s:4:\"Size\";a:0:{}s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:10:\"AddonSites\";a:0:{}s:4:\"Core\";a:0:{}s:6:\"Global\";a:0:{}s:8:\"Instance\";a:0:{}}s:4:\"Exts\";O:29:\"DUP_Archive_Filter_Scope_Base\":3:{s:4:\"Core\";a:0:{}s:6:\"Global\";a:0:{}s:8:\"Instance\";a:0:{}}s:9:\"UDirCount\";i:0;s:10:\"UFileCount\";i:0;s:9:\"UExtCount\";i:0;s:8:\"TreeSize\";a:0:{}s:11:\"TreeWarning\";a:0:{}}s:14:\"RecursiveLinks\";a:0:{}s:10:\"file_count\";i:39408;s:10:\"\0*\0Package\";r:1;s:29:\"\0DUP_Archive\0tmpFilterDirsAll\";a:0:{}s:24:\"\0DUP_Archive\0wpCorePaths\";a:5:{i:0;s:32:\"C:/xampp/htdocs/tv-flix/wp-admin\";i:1;s:42:\"C:/xampp/htdocs/tv-flix/wp-content/uploads\";i:2;s:44:\"C:/xampp/htdocs/tv-flix/wp-content/languages\";i:3;s:41:\"C:/xampp/htdocs/tv-flix/wp-content/themes\";i:4;s:35:\"C:/xampp/htdocs/tv-flix/wp-includes\";}s:29:\"\0DUP_Archive\0wpCoreExactPaths\";a:2:{i:0;s:23:\"C:/xampp/htdocs/tv-flix\";i:1;s:34:\"C:/xampp/htdocs/tv-flix/wp-content\";}s:19:\"isOuterWPContentDir\";b:0;s:25:\"wpContentDirNormalizePath\";s:35:\"C:/xampp/htdocs/tv-flix/wp-content/\";}s:9:\"Installer\";O:13:\"DUP_Installer\":13:{s:4:\"File\";s:65:\"20211106_tvflix_f1a40ce7f26c01304609_20211106085806_installer.php\";s:4:\"Size\";i:65797;s:10:\"OptsDBHost\";s:0:\"\";s:10:\"OptsDBPort\";s:0:\"\";s:10:\"OptsDBName\";s:0:\"\";s:10:\"OptsDBUser\";s:0:\"\";s:13:\"OptsDBCharset\";s:0:\"\";s:15:\"OptsDBCollation\";s:0:\"\";s:12:\"OptsSecureOn\";i:0;s:14:\"OptsSecurePass\";s:0:\"\";s:13:\"numFilesAdded\";i:0;s:12:\"numDirsAdded\";i:0;s:10:\"\0*\0Package\";r:1;}s:8:\"Database\";O:12:\"DUP_Database\":15:{s:4:\"Type\";s:5:\"MySQL\";s:4:\"Size\";i:1132023;s:4:\"File\";s:64:\"20211106_tvflix_f1a40ce7f26c01304609_20211106085806_database.sql\";s:4:\"Path\";N;s:12:\"FilterTables\";s:0:\"\";s:8:\"FilterOn\";i:0;s:4:\"Name\";N;s:10:\"Compatible\";s:0:\"\";s:8:\"Comments\";s:31:\"mariadb.org binary distribution\";s:4:\"info\";O:16:\"DUP_DatabaseInfo\":16:{s:9:\"buildMode\";s:9:\"MYSQLDUMP\";s:13:\"collationList\";a:2:{i:0;s:18:\"utf8mb4_unicode_ci\";i:1;s:18:\"utf8mb4_general_ci\";}s:17:\"isTablesUpperCase\";i:0;s:15:\"isNameUpperCase\";i:0;s:4:\"name\";s:7:\"tv_flix\";s:15:\"tablesBaseCount\";i:13;s:16:\"tablesFinalCount\";i:13;s:14:\"tablesRowCount\";s:3:\"257\";s:16:\"tablesSizeOnDisk\";s:6:\"2.69MB\";s:18:\"varLowerCaseTables\";s:1:\"1\";s:7:\"version\";s:7:\"10.4.18\";s:14:\"versionComment\";s:31:\"mariadb.org binary distribution\";s:18:\"tableWiseRowCounts\";a:13:{s:14:\"wp_commentmeta\";s:1:\"0\";s:11:\"wp_comments\";s:1:\"1\";s:22:\"wp_duplicator_packages\";s:1:\"1\";s:8:\"wp_links\";s:1:\"0\";s:10:\"wp_options\";s:3:\"166\";s:11:\"wp_postmeta\";s:2:\"50\";s:8:\"wp_posts\";s:2:\"18\";s:21:\"wp_term_relationships\";s:1:\"3\";s:16:\"wp_term_taxonomy\";s:1:\"2\";s:11:\"wp_termmeta\";s:1:\"0\";s:8:\"wp_terms\";s:1:\"2\";s:11:\"wp_usermeta\";s:2:\"22\";s:8:\"wp_users\";s:1:\"1\";}s:11:\"triggerList\";a:0:{}s:33:\"\0DUP_DatabaseInfo\0intFieldsStruct\";a:0:{}s:42:\"\0DUP_DatabaseInfo\0indexProcessedSchemaSize\";a:0:{}}s:10:\"\0*\0Package\";r:1;s:24:\"\0DUP_Database\0tempDbPath\";s:120:\"C:/xampp/htdocs/tv-flix/wp-content/backups-dup-lite/tmp/20211106_tvflix_f1a40ce7f26c01304609_20211106085806_database.sql\";s:23:\"\0DUP_Database\0EOFMarker\";s:0:\"\";s:26:\"\0DUP_Database\0networkFlush\";b:0;s:19:\"sameNameTableExists\";b:0;}s:13:\"BuildProgress\";O:18:\"DUP_Build_Progress\":12:{s:17:\"thread_start_time\";N;s:11:\"initialized\";b:0;s:15:\"installer_built\";b:1;s:15:\"archive_started\";b:0;s:20:\"archive_has_database\";b:0;s:13:\"archive_built\";b:0;s:21:\"database_script_built\";b:0;s:6:\"failed\";b:0;s:7:\"retries\";i:0;s:14:\"build_failures\";a:0:{}s:19:\"validation_failures\";a:0:{}s:27:\"\0DUP_Build_Progress\0package\";O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2021-11-06 08:58:06\";s:7:\"Version\";s:5:\"1.4.3\";s:9:\"VersionWP\";s:5:\"5.8.1\";s:9:\"VersionDB\";s:7:\"10.4.18\";s:10:\"VersionPHP\";s:6:\"7.3.27\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:15:\"20211106_tvflix\";s:4:\"Hash\";s:35:\"f1a40ce7f26c01304609_20211106085806\";s:8:\"NameHash\";s:51:\"20211106_tvflix_f1a40ce7f26c01304609_20211106085806\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:8:\"ScanFile\";N;s:10:\"TimerStart\";i:-1;s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";i:0;s:6:\"WPUser\";N;s:7:\"Archive\";r:21;s:9:\"Installer\";r:76;s:8:\"Database\";r:90;s:13:\"BuildProgress\";r:137;}}}'),(2,'20211106_tvflix','de6ea2e97f9077202257_20211106090840',100,'2021-11-06 09:08:54','unknown','O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2021-11-06 09:08:40\";s:7:\"Version\";s:5:\"1.4.3\";s:9:\"VersionWP\";s:5:\"5.8.1\";s:9:\"VersionDB\";s:7:\"10.4.18\";s:10:\"VersionPHP\";s:6:\"7.3.27\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";i:2;s:4:\"Name\";s:15:\"20211106_tvflix\";s:4:\"Hash\";s:35:\"de6ea2e97f9077202257_20211106090840\";s:8:\"NameHash\";s:51:\"20211106_tvflix_de6ea2e97f9077202257_20211106090840\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:8:\"ScanFile\";s:61:\"20211106_tvflix_de6ea2e97f9077202257_20211106090840_scan.json\";s:10:\"TimerStart\";i:-1;s:7:\"Runtime\";s:10:\"82.49 sec.\";s:7:\"ExeSize\";s:7:\"64.25KB\";s:7:\"ZipSize\";s:6:\"62.4MB\";s:6:\"Status\";s:5:\"100.0\";s:6:\"WPUser\";s:7:\"unknown\";s:7:\"Archive\";O:11:\"DUP_Archive\":23:{s:10:\"FilterDirs\";s:131:\"C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/node_modules;C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/src;\";s:11:\"FilterFiles\";s:286:\"C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/.babelrc;C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/package-lock.json;C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/package.json;C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/webpack.config.js;\";s:10:\"FilterExts\";s:0:\"\";s:13:\"FilterDirsAll\";a:0:{}s:14:\"FilterFilesAll\";a:0:{}s:13:\"FilterExtsAll\";a:0:{}s:8:\"FilterOn\";i:1;s:12:\"ExportOnlyDB\";i:0;s:4:\"File\";s:63:\"20211106_tvflix_de6ea2e97f9077202257_20211106090840_archive.zip\";s:6:\"Format\";s:3:\"ZIP\";s:7:\"PackDir\";s:23:\"C:/xampp/htdocs/tv-flix\";s:4:\"Size\";i:65433419;s:4:\"Dirs\";a:0:{}s:5:\"Files\";a:0:{}s:10:\"FilterInfo\";O:23:\"DUP_Archive_Filter_Info\":8:{s:4:\"Dirs\";O:34:\"DUP_Archive_Filter_Scope_Directory\":6:{s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:10:\"AddonSites\";a:0:{}s:4:\"Core\";a:0:{}s:6:\"Global\";a:0:{}s:8:\"Instance\";a:0:{}}s:5:\"Files\";O:29:\"DUP_Archive_Filter_Scope_File\":7:{s:4:\"Size\";a:0:{}s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:10:\"AddonSites\";a:0:{}s:4:\"Core\";a:0:{}s:6:\"Global\";a:0:{}s:8:\"Instance\";a:0:{}}s:4:\"Exts\";O:29:\"DUP_Archive_Filter_Scope_Base\":3:{s:4:\"Core\";a:0:{}s:6:\"Global\";a:0:{}s:8:\"Instance\";a:0:{}}s:9:\"UDirCount\";i:0;s:10:\"UFileCount\";i:0;s:9:\"UExtCount\";i:0;s:8:\"TreeSize\";a:0:{}s:11:\"TreeWarning\";a:0:{}}s:14:\"RecursiveLinks\";a:0:{}s:10:\"file_count\";i:21470;s:10:\"\0*\0Package\";r:1;s:29:\"\0DUP_Archive\0tmpFilterDirsAll\";a:0:{}s:24:\"\0DUP_Archive\0wpCorePaths\";a:5:{i:0;s:32:\"C:/xampp/htdocs/tv-flix/wp-admin\";i:1;s:42:\"C:/xampp/htdocs/tv-flix/wp-content/uploads\";i:2;s:44:\"C:/xampp/htdocs/tv-flix/wp-content/languages\";i:3;s:41:\"C:/xampp/htdocs/tv-flix/wp-content/themes\";i:4;s:35:\"C:/xampp/htdocs/tv-flix/wp-includes\";}s:29:\"\0DUP_Archive\0wpCoreExactPaths\";a:2:{i:0;s:23:\"C:/xampp/htdocs/tv-flix\";i:1;s:34:\"C:/xampp/htdocs/tv-flix/wp-content\";}s:19:\"isOuterWPContentDir\";b:0;s:25:\"wpContentDirNormalizePath\";s:35:\"C:/xampp/htdocs/tv-flix/wp-content/\";}s:9:\"Installer\";O:13:\"DUP_Installer\":13:{s:4:\"File\";s:65:\"20211106_tvflix_de6ea2e97f9077202257_20211106090840_installer.php\";s:4:\"Size\";i:65797;s:10:\"OptsDBHost\";s:0:\"\";s:10:\"OptsDBPort\";s:0:\"\";s:10:\"OptsDBName\";s:0:\"\";s:10:\"OptsDBUser\";s:0:\"\";s:13:\"OptsDBCharset\";s:0:\"\";s:15:\"OptsDBCollation\";s:0:\"\";s:12:\"OptsSecureOn\";i:0;s:14:\"OptsSecurePass\";s:0:\"\";s:13:\"numFilesAdded\";i:0;s:12:\"numDirsAdded\";i:0;s:10:\"\0*\0Package\";r:1;}s:8:\"Database\";O:12:\"DUP_Database\":15:{s:4:\"Type\";s:5:\"MySQL\";s:4:\"Size\";i:1086169;s:4:\"File\";s:64:\"20211106_tvflix_de6ea2e97f9077202257_20211106090840_database.sql\";s:4:\"Path\";N;s:12:\"FilterTables\";s:0:\"\";s:8:\"FilterOn\";i:0;s:4:\"Name\";N;s:10:\"Compatible\";s:0:\"\";s:8:\"Comments\";s:31:\"mariadb.org binary distribution\";s:4:\"info\";O:16:\"DUP_DatabaseInfo\":16:{s:9:\"buildMode\";s:9:\"MYSQLDUMP\";s:13:\"collationList\";a:2:{i:0;s:18:\"utf8mb4_unicode_ci\";i:1;s:18:\"utf8mb4_general_ci\";}s:17:\"isTablesUpperCase\";i:0;s:15:\"isNameUpperCase\";i:0;s:4:\"name\";s:7:\"tv_flix\";s:15:\"tablesBaseCount\";i:13;s:16:\"tablesFinalCount\";i:13;s:14:\"tablesRowCount\";s:3:\"257\";s:16:\"tablesSizeOnDisk\";s:6:\"2.69MB\";s:18:\"varLowerCaseTables\";s:1:\"1\";s:7:\"version\";s:7:\"10.4.18\";s:14:\"versionComment\";s:31:\"mariadb.org binary distribution\";s:18:\"tableWiseRowCounts\";a:13:{s:14:\"wp_commentmeta\";s:1:\"0\";s:11:\"wp_comments\";s:1:\"1\";s:22:\"wp_duplicator_packages\";s:1:\"2\";s:8:\"wp_links\";s:1:\"0\";s:10:\"wp_options\";s:3:\"163\";s:11:\"wp_postmeta\";s:2:\"50\";s:8:\"wp_posts\";s:2:\"18\";s:21:\"wp_term_relationships\";s:1:\"3\";s:16:\"wp_term_taxonomy\";s:1:\"2\";s:11:\"wp_termmeta\";s:1:\"0\";s:8:\"wp_terms\";s:1:\"2\";s:11:\"wp_usermeta\";s:2:\"22\";s:8:\"wp_users\";s:1:\"1\";}s:11:\"triggerList\";a:0:{}s:33:\"\0DUP_DatabaseInfo\0intFieldsStruct\";a:0:{}s:42:\"\0DUP_DatabaseInfo\0indexProcessedSchemaSize\";a:0:{}}s:10:\"\0*\0Package\";r:1;s:24:\"\0DUP_Database\0tempDbPath\";s:120:\"C:/xampp/htdocs/tv-flix/wp-content/backups-dup-lite/tmp/20211106_tvflix_de6ea2e97f9077202257_20211106090840_database.sql\";s:23:\"\0DUP_Database\0EOFMarker\";s:0:\"\";s:26:\"\0DUP_Database\0networkFlush\";b:0;s:19:\"sameNameTableExists\";b:0;}s:13:\"BuildProgress\";O:18:\"DUP_Build_Progress\":12:{s:17:\"thread_start_time\";N;s:11:\"initialized\";b:0;s:15:\"installer_built\";b:1;s:15:\"archive_started\";b:0;s:20:\"archive_has_database\";b:0;s:13:\"archive_built\";b:0;s:21:\"database_script_built\";b:0;s:6:\"failed\";b:0;s:7:\"retries\";i:0;s:14:\"build_failures\";a:0:{}s:19:\"validation_failures\";a:0:{}s:27:\"\0DUP_Build_Progress\0package\";O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2021-11-06 09:08:40\";s:7:\"Version\";s:5:\"1.4.3\";s:9:\"VersionWP\";s:5:\"5.8.1\";s:9:\"VersionDB\";s:7:\"10.4.18\";s:10:\"VersionPHP\";s:6:\"7.3.27\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:15:\"20211106_tvflix\";s:4:\"Hash\";s:35:\"de6ea2e97f9077202257_20211106090840\";s:8:\"NameHash\";s:51:\"20211106_tvflix_de6ea2e97f9077202257_20211106090840\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:8:\"ScanFile\";N;s:10:\"TimerStart\";i:-1;s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";i:0;s:6:\"WPUser\";N;s:7:\"Archive\";r:21;s:9:\"Installer\";r:76;s:8:\"Database\";r:90;s:13:\"BuildProgress\";r:137;}}}'),(3,'20211106_tvflix','6f17cc8cbd600fd38868_20211106094433',20,'2021-11-06 09:44:38','unknown','O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2021-11-06 09:44:33\";s:7:\"Version\";s:5:\"1.4.3\";s:9:\"VersionWP\";s:5:\"5.8.1\";s:9:\"VersionDB\";s:7:\"10.4.18\";s:10:\"VersionPHP\";s:6:\"7.3.27\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";i:3;s:4:\"Name\";s:15:\"20211106_tvflix\";s:4:\"Hash\";s:35:\"6f17cc8cbd600fd38868_20211106094433\";s:8:\"NameHash\";s:51:\"20211106_tvflix_6f17cc8cbd600fd38868_20211106094433\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:8:\"ScanFile\";s:61:\"20211106_tvflix_6f17cc8cbd600fd38868_20211106094433_scan.json\";s:10:\"TimerStart\";i:-1;s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";s:4:\"20.0\";s:6:\"WPUser\";s:7:\"unknown\";s:7:\"Archive\";O:11:\"DUP_Archive\":21:{s:10:\"FilterDirs\";s:358:\"C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix - Copy;C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/node_modules;C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/src;C:/xampp/htdocs/tv-flix/wp-content/themes/twentynineteen;C:/xampp/htdocs/tv-flix/wp-content/themes/twentytwenty;C:/xampp/htdocs/tv-flix/wp-content/themes/twentytwentyone;\";s:11:\"FilterFiles\";s:286:\"C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/.babelrc;C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/package-lock.json;C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/package.json;C:/xampp/htdocs/tv-flix/wp-content/themes/tv-flix/assets/webpack.config.js;\";s:10:\"FilterExts\";s:0:\"\";s:13:\"FilterDirsAll\";a:0:{}s:14:\"FilterFilesAll\";a:0:{}s:13:\"FilterExtsAll\";a:0:{}s:8:\"FilterOn\";i:1;s:12:\"ExportOnlyDB\";i:0;s:4:\"File\";s:63:\"20211106_tvflix_6f17cc8cbd600fd38868_20211106094433_archive.zip\";s:6:\"Format\";s:3:\"ZIP\";s:7:\"PackDir\";s:23:\"C:/xampp/htdocs/tv-flix\";s:4:\"Size\";i:0;s:4:\"Dirs\";a:0:{}s:5:\"Files\";a:0:{}s:10:\"FilterInfo\";O:23:\"DUP_Archive_Filter_Info\":8:{s:4:\"Dirs\";O:34:\"DUP_Archive_Filter_Scope_Directory\":6:{s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:10:\"AddonSites\";a:0:{}s:4:\"Core\";a:0:{}s:6:\"Global\";a:0:{}s:8:\"Instance\";a:0:{}}s:5:\"Files\";O:29:\"DUP_Archive_Filter_Scope_File\":7:{s:4:\"Size\";a:0:{}s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:10:\"AddonSites\";a:0:{}s:4:\"Core\";a:0:{}s:6:\"Global\";a:0:{}s:8:\"Instance\";a:0:{}}s:4:\"Exts\";O:29:\"DUP_Archive_Filter_Scope_Base\":3:{s:4:\"Core\";a:0:{}s:6:\"Global\";a:0:{}s:8:\"Instance\";a:0:{}}s:9:\"UDirCount\";i:0;s:10:\"UFileCount\";i:0;s:9:\"UExtCount\";i:0;s:8:\"TreeSize\";a:0:{}s:11:\"TreeWarning\";a:0:{}}s:14:\"RecursiveLinks\";a:0:{}s:10:\"file_count\";i:-1;s:10:\"\0*\0Package\";O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2021-11-06 09:44:33\";s:7:\"Version\";s:5:\"1.4.3\";s:9:\"VersionWP\";s:5:\"5.8.1\";s:9:\"VersionDB\";s:7:\"10.4.18\";s:10:\"VersionPHP\";s:6:\"7.3.27\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:15:\"20211106_tvflix\";s:4:\"Hash\";s:35:\"6f17cc8cbd600fd38868_20211106094433\";s:8:\"NameHash\";s:51:\"20211106_tvflix_6f17cc8cbd600fd38868_20211106094433\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:8:\"ScanFile\";N;s:10:\"TimerStart\";i:-1;s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";i:0;s:6:\"WPUser\";N;s:7:\"Archive\";r:21;s:9:\"Installer\";O:13:\"DUP_Installer\":13:{s:4:\"File\";s:65:\"20211106_tvflix_6f17cc8cbd600fd38868_20211106094433_installer.php\";s:4:\"Size\";i:0;s:10:\"OptsDBHost\";s:0:\"\";s:10:\"OptsDBPort\";s:0:\"\";s:10:\"OptsDBName\";s:0:\"\";s:10:\"OptsDBUser\";s:0:\"\";s:13:\"OptsDBCharset\";s:0:\"\";s:15:\"OptsDBCollation\";s:0:\"\";s:12:\"OptsSecureOn\";i:0;s:14:\"OptsSecurePass\";s:0:\"\";s:13:\"numFilesAdded\";i:0;s:12:\"numDirsAdded\";i:0;s:10:\"\0*\0Package\";r:63;}s:8:\"Database\";O:12:\"DUP_Database\":14:{s:4:\"Type\";s:5:\"MySQL\";s:4:\"Size\";N;s:4:\"File\";s:64:\"20211106_tvflix_6f17cc8cbd600fd38868_20211106094433_database.sql\";s:4:\"Path\";N;s:12:\"FilterTables\";s:0:\"\";s:8:\"FilterOn\";i:0;s:4:\"Name\";N;s:10:\"Compatible\";s:0:\"\";s:8:\"Comments\";s:31:\"mariadb.org binary distribution\";s:4:\"info\";O:16:\"DUP_DatabaseInfo\":16:{s:9:\"buildMode\";N;s:13:\"collationList\";a:0:{}s:17:\"isTablesUpperCase\";N;s:15:\"isNameUpperCase\";N;s:4:\"name\";N;s:15:\"tablesBaseCount\";N;s:16:\"tablesFinalCount\";N;s:14:\"tablesRowCount\";N;s:16:\"tablesSizeOnDisk\";N;s:18:\"varLowerCaseTables\";i:1;s:7:\"version\";N;s:14:\"versionComment\";N;s:18:\"tableWiseRowCounts\";a:0:{}s:11:\"triggerList\";a:0:{}s:33:\"\0DUP_DatabaseInfo\0intFieldsStruct\";a:0:{}s:42:\"\0DUP_DatabaseInfo\0indexProcessedSchemaSize\";a:0:{}}s:10:\"\0*\0Package\";r:1;s:24:\"\0DUP_Database\0tempDbPath\";N;s:23:\"\0DUP_Database\0EOFMarker\";s:0:\"\";s:26:\"\0DUP_Database\0networkFlush\";b:0;}s:13:\"BuildProgress\";O:18:\"DUP_Build_Progress\":12:{s:17:\"thread_start_time\";N;s:11:\"initialized\";b:0;s:15:\"installer_built\";b:0;s:15:\"archive_started\";b:0;s:20:\"archive_has_database\";b:0;s:13:\"archive_built\";b:0;s:21:\"database_script_built\";b:0;s:6:\"failed\";b:0;s:7:\"retries\";i:0;s:14:\"build_failures\";a:0:{}s:19:\"validation_failures\";a:0:{}s:27:\"\0DUP_Build_Progress\0package\";r:63;}}s:29:\"\0DUP_Archive\0tmpFilterDirsAll\";a:0:{}s:24:\"\0DUP_Archive\0wpCorePaths\";a:5:{i:0;s:32:\"C:/xampp/htdocs/tv-flix/wp-admin\";i:1;s:42:\"C:/xampp/htdocs/tv-flix/wp-content/uploads\";i:2;s:44:\"C:/xampp/htdocs/tv-flix/wp-content/languages\";i:3;s:41:\"C:/xampp/htdocs/tv-flix/wp-content/themes\";i:4;s:35:\"C:/xampp/htdocs/tv-flix/wp-includes\";}s:29:\"\0DUP_Archive\0wpCoreExactPaths\";a:2:{i:0;s:23:\"C:/xampp/htdocs/tv-flix\";i:1;s:34:\"C:/xampp/htdocs/tv-flix/wp-content\";}}s:9:\"Installer\";r:84;s:8:\"Database\";r:98;s:13:\"BuildProgress\";r:129;}');
/*!40000 ALTER TABLE `wp_duplicator_packages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,3,'_wp_page_template','default'),(3,5,'_edit_lock','1635675774:1'),(4,7,'_edit_lock','1635679024:1'),(5,7,'_wp_trash_meta_status','draft'),(6,7,'_wp_trash_meta_time','1635679060'),(7,7,'_wp_desired_post_slug',''),(8,9,'_edit_lock','1636112346:1'),(9,9,'_wp_page_template','template-listing.php'),(10,12,'_wp_attached_file','2021/11/fav.png'),(11,12,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:82;s:6:\"height\";i:81;s:4:\"file\";s:15:\"2021/11/fav.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(12,13,'_wp_attached_file','2021/11/tv-logo.png'),(13,13,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:432;s:6:\"height\";i:428;s:4:\"file\";s:19:\"2021/11/tv-logo.png\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"tv-logo-300x297.png\";s:5:\"width\";i:300;s:6:\"height\";i:297;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"tv-logo-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(14,14,'_wp_trash_meta_status','publish'),(15,14,'_wp_trash_meta_time','1636110001'),(16,15,'_menu_item_type','post_type'),(17,15,'_menu_item_menu_item_parent','0'),(18,15,'_menu_item_object_id','5'),(19,15,'_menu_item_object','page'),(20,15,'_menu_item_target',''),(21,15,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(22,15,'_menu_item_xfn',''),(23,15,'_menu_item_url',''),(25,16,'_menu_item_type','post_type'),(26,16,'_menu_item_menu_item_parent','0'),(27,16,'_menu_item_object_id','9'),(28,16,'_menu_item_object','page'),(29,16,'_menu_item_target',''),(30,16,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(31,16,'_menu_item_xfn',''),(32,16,'_menu_item_url',''),(34,17,'_menu_item_type','post_type'),(35,17,'_menu_item_menu_item_parent','0'),(36,17,'_menu_item_object_id','2'),(37,17,'_menu_item_object','page'),(38,17,'_menu_item_target',''),(39,17,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(40,17,'_menu_item_xfn',''),(41,17,'_menu_item_url',''),(42,17,'_menu_item_orphaned','1636110211'),(43,18,'_menu_item_type','post_type'),(44,18,'_menu_item_menu_item_parent','0'),(45,18,'_menu_item_object_id','9'),(46,18,'_menu_item_object','page'),(47,18,'_menu_item_target',''),(48,18,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(49,18,'_menu_item_xfn',''),(50,18,'_menu_item_url',''),(51,18,'_menu_item_orphaned','1636110219'),(52,9,'_edit_last','1');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2021-10-26 09:06:51','2021-10-26 09:06:51','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2021-10-26 09:06:51','2021-10-26 09:06:51','',0,'http://localhost/tv-flix/?p=1',0,'post','',1),(2,1,'2021-10-26 09:06:51','2021-10-26 09:06:51','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/tv-flix/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2021-10-26 09:06:51','2021-10-26 09:06:51','',0,'http://localhost/tv-flix/?page_id=2',0,'page','',0),(3,1,'2021-10-26 09:06:51','2021-10-26 09:06:51','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost/tv-flix.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->','Privacy Policy','','draft','closed','open','','privacy-policy','','','2021-10-26 09:06:51','2021-10-26 09:06:51','',0,'http://localhost/tv-flix/?page_id=3',0,'page','',0),(5,1,'2021-10-31 10:25:16','2021-10-31 10:25:16','','Home','','publish','closed','closed','','home','','','2021-10-31 10:25:16','2021-10-31 10:25:16','',0,'http://localhost/tv-flix/?page_id=5',0,'page','',0),(6,1,'2021-10-31 10:25:16','2021-10-31 10:25:16','','Home','','inherit','closed','closed','','5-revision-v1','','','2021-10-31 10:25:16','2021-10-31 10:25:16','',5,'http://localhost/tv-flix/?p=6',0,'revision','',0),(7,1,'2021-10-31 11:17:40','2021-10-31 11:17:40','','L','','trash','closed','closed','','__trashed','','','2021-10-31 11:17:40','2021-10-31 11:17:40','',0,'http://localhost/tv-flix/?page_id=7',0,'page','',0),(8,1,'2021-10-31 11:17:40','2021-10-31 11:17:40','','L','','inherit','closed','closed','','7-revision-v1','','','2021-10-31 11:17:40','2021-10-31 11:17:40','',7,'http://localhost/tv-flix/?p=8',0,'revision','',0),(9,1,'2021-10-31 11:17:56','2021-10-31 11:17:56','','All Movies','','publish','closed','closed','','all-movies','','','2021-11-05 11:39:06','2021-11-05 11:39:06','',0,'http://localhost/tv-flix/?page_id=9',0,'page','',0),(10,1,'2021-10-31 11:17:56','2021-10-31 11:17:56','','Listing','','inherit','closed','closed','','9-revision-v1','','','2021-10-31 11:17:56','2021-10-31 11:17:56','',9,'http://localhost/tv-flix/?p=10',0,'revision','',0),(11,1,'2021-11-05 10:13:56','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2021-11-05 10:13:56','0000-00-00 00:00:00','',0,'http://localhost/tv-flix/?p=11',0,'post','',0),(12,1,'2021-11-05 10:59:45','2021-11-05 10:59:45','','fav','','inherit','open','closed','','fav','','','2021-11-05 10:59:45','2021-11-05 10:59:45','',0,'http://localhost/tv-flix/wp-content/uploads/2021/11/fav.png',0,'attachment','image/png',0),(13,1,'2021-11-05 10:59:46','2021-11-05 10:59:46','','tv-logo','','inherit','open','closed','','tv-logo','','','2021-11-05 10:59:46','2021-11-05 10:59:46','',0,'http://localhost/tv-flix/wp-content/uploads/2021/11/tv-logo.png',0,'attachment','image/png',0),(14,1,'2021-11-05 11:00:01','2021-11-05 11:00:01','{\n    \"blogdescription\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-11-05 11:00:01\"\n    },\n    \"site_icon\": {\n        \"value\": 12,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-11-05 11:00:01\"\n    },\n    \"tv-flix::custom_logo\": {\n        \"value\": 13,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-11-05 11:00:01\"\n    }\n}','','','trash','closed','closed','','bf02f890-6acb-484b-8523-d4120e884e9c','','','2021-11-05 11:00:01','2021-11-05 11:00:01','',0,'http://localhost/tv-flix/bf02f890-6acb-484b-8523-d4120e884e9c/',0,'customize_changeset','',0),(15,1,'2021-11-05 11:06:15','2021-11-05 11:03:54',' ','','','publish','closed','closed','','15','','','2021-11-05 11:06:15','2021-11-05 11:06:15','',0,'http://localhost/tv-flix/?p=15',1,'nav_menu_item','',0),(16,1,'2021-11-05 11:06:15','2021-11-05 11:03:54','','All Movies','','publish','closed','closed','','16','','','2021-11-05 11:06:15','2021-11-05 11:06:15','',0,'http://localhost/tv-flix/?p=16',2,'nav_menu_item','',0),(17,1,'2021-11-05 11:03:31','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2021-11-05 11:03:31','0000-00-00 00:00:00','',0,'http://localhost/tv-flix/?p=17',1,'nav_menu_item','',0),(18,1,'2021-11-05 11:03:39','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2021-11-05 11:03:39','0000-00-00 00:00:00','',0,'http://localhost/tv-flix/?p=18',1,'nav_menu_item','',0),(19,1,'2021-11-05 11:39:06','2021-11-05 11:39:06','','All Movies','','inherit','closed','closed','','9-revision-v1','','','2021-11-05 11:39:06','2021-11-05 11:39:06','',9,'http://localhost/tv-flix/?p=19',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0),(15,2,0),(16,2,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1),(2,2,'nav_menu','',0,2);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0),(2,'Main Menu','main-menu',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','admin'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'wp_user_level','10'),(14,1,'dismissed_wp_pointers',''),(15,1,'show_welcome_panel','1'),(17,1,'wp_dashboard_quick_press_last_post_id','11'),(18,1,'wp_user-settings','libraryContent=browse'),(19,1,'wp_user-settings-time','1636110163'),(20,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),(21,1,'metaboxhidden_nav-menus','a:1:{i:0;s:12:\"add-post_tag\";}'),(22,1,'nav_menu_recently_edited','2'),(25,1,'session_tokens','a:1:{s:64:\"d8b12fac1c419be9b886ede7fb234fb1cc49d0e6383bf7fcfeb189c195b06bbb\";a:4:{s:10:\"expiration\";i:1636361810;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36\";s:5:\"login\";i:1636189010;}}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'admin','$P$BDetQBVXEMgqyBmd8dlXk.s92vIohA/','admin','nixondsz879@gmail.com','http://localhost/tv-flix','2021-10-26 09:06:51','1635675830:$P$B7AQ14SyGc5VoGnEZl9QySEnYEuINB1',0,'admin');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



/* Duplicator WordPress Timestamp: 2021-11-06 09:44:40*/
/* DUPLICATOR_MYSQLDUMP_EOF */