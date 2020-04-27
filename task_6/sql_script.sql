-- ********************************************************************************
# 1
drop database if exists shop;

create database shop;

use shop;

create table USERS (
	id serial primary key,
    `name` varchar(255),
    birthday_at date,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp    
);

insert into USERS values
(null, 'Sam', '1990-07-07', current_timestamp(), current_timestamp()),
(null, 'Ann', '1991-08-08', current_timestamp(), current_timestamp()),
(null, 'John', '1993-09-09', current_timestamp(), current_timestamp()),
(null, 'Will', '1990-10-10', current_timestamp(), current_timestamp()),
(null, 'Sarah', '1990-11-11', current_timestamp(), current_timestamp());


drop database if exists sample;

create database sample;

use sample;

create table USERS (
	id serial primary key,
    `name` varchar(255),
    birthday_at date,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp    
);

insert into USERS values
(null, 'Bob', '1990-07-07', current_timestamp(), current_timestamp()),
(null, 'Ann', '1991-08-08', current_timestamp(), current_timestamp()),
(null, 'John', '1993-09-09', current_timestamp(), current_timestamp()),
(null, 'Will', '1990-10-10', current_timestamp(), current_timestamp()),
(null, 'Sarah', '1990-11-11', current_timestamp(), current_timestamp());

start transaction;
	
insert into sample.users
select (select max(id) from sample.users) + 1,
		`name`,
		birthday_at,
		created_at,
		updated_at
	 from shop.users
	where id = 1;
 
delete 
	 from shop.users
	where id = 1;

select *
	 from shop.users;
    
select *
	 from sample.users;
     
commit;
-- ********************************************************************************
# 2
use shop;

create table if not exists catalogs (
	id serial primary key,
    name varchar(50) not null
);

create table if not exists products (
	id serial primary key,
	name varchar(50) not null,
	description text,
    price decimal(7, 2),
    catalog_id int unsigned,
    created_at datetime default current_timestamp,
    updated_at  datetime default current_timestamp
);

insert into catalogs (name) values
('catalog_1'),
('catalog_2'),
('catalog_3'),
('catalog_4'),
('catalog_5');

insert into products values
(null, 'product_1', 'description_1', 15000.99, 2, now(), now()),
(null, 'product_2', 'description_2', 5000.99, 1, now(), now()),
(null, 'product_3', 'description_3', 3000.99, 3, now(), now()),
(null, 'product_4', 'description_4', 100.99, 4, now(), now()),
(null, 'product_5', 'description_5', 1200.99, 2, now(), now()),
(null, 'product_6', 'description_6', 9000.99, 1, now(), now()),
(null, 'product_7', 'description_7', 200.99, 5, now(), now()),
(null, 'product_8', 'description_8', 100.99, 5, now(), now()),
(null, 'product_9', 'description_9', 800.99, 2, now(), now()),
(null, 'product_10', 'description_10', 8300.99, 1, now(), now());

create view prod_name_catalog_name as select t1.`name` as prod_name,
											 t2.`name` as `catalog_name`
											from products as t1 
											join catalogs as t2 on t1.catalog_id = t2.id;

select * from prod_name_catalog_name;