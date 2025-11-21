CREATE DATABASE IF NOT EXISTS weatherdb;

USE weatherdb;

CREATE TABLE IF NOT EXISTS measurements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    temperature DOUBLE,
    windspeed DOUBLE,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE USER IF NOT EXISTS 'weatheruser'@'%' IDENTIFIED WITH mysql_native_password BY 'weather123';

GRANT ALL PRIVILEGES ON weatherdb.* TO 'weatheruser'@'%';

FLUSH PRIVILEGES;
