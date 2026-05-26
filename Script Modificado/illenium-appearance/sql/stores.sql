CREATE TABLE IF NOT EXISTS `appearance_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `size` text DEFAULT NULL,
  `rotation` float DEFAULT NULL,
  `usePoly` tinyint(1) DEFAULT 0,
  `points` text DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `gang` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `showBlip` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
