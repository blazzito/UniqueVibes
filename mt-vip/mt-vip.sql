CREATE TABLE IF NOT EXISTS `uv_vip_ranks` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `label` VARCHAR(50) NOT NULL,
    `money_passive` INT DEFAULT 0,
    `coins_passive` INT DEFAULT 0,
    `interval` INT DEFAULT 30, -- In minutes
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `uv_vip_users` (
    `identifier` VARCHAR(60) PRIMARY KEY,
    `rank_id` INT DEFAULT NULL,
    `expiration` DATETIME DEFAULT NULL,
    `last_paycheck` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`rank_id`) REFERENCES `uv_vip_ranks`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `uv_coins` (
    `identifier` VARCHAR(60) PRIMARY KEY,
    `coins` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `uv_coins_logs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(60) NOT NULL,
    `amount` INT NOT NULL,
    `action` VARCHAR(100) NOT NULL,
    `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `uv_vip_codes` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(20) UNIQUE NOT NULL,
    `type` ENUM('vip', 'coins', 'item', 'vehicle', 'bundle') NOT NULL,
    `value` TEXT NOT NULL, -- JSON or raw value depending on type
    `max_uses` INT DEFAULT 1,
    `current_uses` INT DEFAULT 0,
    `expiration` DATETIME DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `uv_vip_codes_used` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `code_id` INT NOT NULL,
    `identifier` VARCHAR(60) NOT NULL,
    `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`code_id`) REFERENCES `uv_vip_codes`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Initial ranks
INSERT INTO `uv_vip_ranks` (`name`, `label`, `money_passive`, `coins_passive`, `interval`) VALUES
('bronce', 'Bronce', 200, 5, 30),
('plata', 'Plata', 400, 10, 30),
('oro', 'Oro', 600, 15, 30),
('platino', 'Platino', 1000, 25, 20),
('diamante', 'Diamante', 1500, 40, 15),
('manhattan', 'Manhattan', 3000, 75, 10);
