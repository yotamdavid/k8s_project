CREATE DATABASE IF NOT EXISTS site_entries;
USE site_entries;

CREATE TABLE IF NOT EXISTS site_entries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entry_date DATE,
    entry_time TIME,
    entry_count INT DEFAULT 0
);
