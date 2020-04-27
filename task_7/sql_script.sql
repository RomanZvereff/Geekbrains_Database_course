create database if not exists shop;

use shop;

CREATE USER 'shop_read'@'localhost' IDENTIFIED BY 'shop_read_pass';
GRANT SELECT ON shop.* TO 'shop_read'@'localhost';

CREATE USER 'shop'@'localhost' IDENTIFIED BY 'shop_pass';
GRANT ALL ON shop.* TO 'shop'@'localhost';

select host, user from mysql.user;