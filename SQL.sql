CREATE TABLE IF NOT EXISTS `a_save_clouth` (
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT 'empty',
  `skin` longtext DEFAULT NULL,
  `save_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
