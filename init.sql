DROP DATABASE `init.sql`;

CREATE DATABASE IF NOT EXISTS db;

USE db;

DROP TABLE IF EXISTS `countries`;

CREATE TABLE db.countries(
    code INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    continent_name VARCHAR(255)
);

DROP TABLE IF EXISTS `users`;

CREATE TABLE db.users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP,
    country_code INT,
    FOREIGN KEY (country_code) REFERENCES countries(code) ON UPDATE CASCADE ON DELETE
    SET
        NULL
);

DROP TABLE IF EXISTS `orders`;

CREATE TABLE db.orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_status ENUM('delivering', 'received', 'in_warehouse'),
    created_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE NO ACTION
);

DROP TABLE IF EXISTS `products`;

CREATE TABLE db.products(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    price INT,
    product_status ENUM('out_of_stock', 'in_stock', 'running_low'),
    created_at TIMESTAMP
);

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE db.order_items(
    order_id INT,
    product_id INT NOT NULL,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE
);