-- MySQL Initialization Script for Laravel Development

-- Create additional user if needed
CREATE USER IF NOT EXISTS 'laravel_test'@'%' IDENTIFIED BY 'test_password';
GRANT ALL PRIVILEGES ON *.* TO 'laravel_test'@'%' WITH GRANT OPTION;

-- Create test database for Laravel testing
CREATE DATABASE IF NOT EXISTS `progesio_ips_test`;
GRANT ALL PRIVILEGES ON `progesio_ips_test`.* TO 'progesio_root'@'%';
GRANT ALL PRIVILEGES ON `progesio_ips_test`.* TO 'laravel_test'@'%';

-- Flush privileges
FLUSH PRIVILEGES;

-- Show databases
SHOW DATABASES;
