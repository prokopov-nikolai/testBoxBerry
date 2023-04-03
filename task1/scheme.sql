DROP TABLE IF EXISTS `arterial_pressure_bad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arterial_pressure_bad` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `lower` smallint(3) unsigned DEFAULT 0,
  `upper` smallint(3) unsigned NOT NULL DEFAULT 0,
  `pulse` smallint(3) unsigned DEFAULT 0,
  `date_add` date NOT NULL,
  `hours_add` tinyint(1) unsigned NOT NULL,
  `minutes_add` tinyint(1) unsigned NOT NULL,
  KEY `arterial_pressure_bad_hours_add_index` (`hours_add`),
  KEY `arterial_pressure_bad_users_id_fk` (`user_id`),
  CONSTRAINT `arterial_pressure_bad_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `arterial_pressure_log`
--

DROP TABLE IF EXISTS `arterial_pressure_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arterial_pressure_log` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `lower` smallint(3) unsigned DEFAULT 0,
  `lower_bad` tinyint(1) unsigned DEFAULT 0,
  `upper` smallint(3) unsigned NOT NULL DEFAULT 0,
  `upper_bad` tinyint(1) unsigned DEFAULT 0,
  `pulse` smallint(3) unsigned DEFAULT 0,
  `pulse_bad` tinyint(1) unsigned DEFAULT 0,
  `date_add` date NOT NULL,
  `hours_add` tinyint(1) unsigned NOT NULL,
  `minutes_add` tinyint(1) unsigned NOT NULL,
  KEY `arterial_pressure_log_users_id_fk` (`user_id`),
  KEY `arterial_pressure_log_hours_user_upper_pulse_index` (`hours_add`,`upper_bad`,`pulse_bad`),
  CONSTRAINT `arterial_pressure_log_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_add` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--
