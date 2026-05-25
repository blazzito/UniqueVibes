CREATE TABLE IF NOT EXISTS `origen_admin_bans` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(100) NOT NULL DEFAULT '0',
  `banTime` int(11) NOT NULL DEFAULT 0,
  `expireTime` int(11) NOT NULL DEFAULT 0,
  `reason` longtext NOT NULL,
  `staff` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `origen_admin_sanctions` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userlicense` varchar(150) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `staff` varchar(50) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `origen_admin_priority` (
  `license` varchar(100) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `origen_admin_permissions` (
  `license` varchar(75) NOT NULL,
  `group` varchar(25) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;