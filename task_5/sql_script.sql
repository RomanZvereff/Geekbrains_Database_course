create database GEEKBRAINS_COURS DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
use GEEKBRAINS_COURS;
#1 
create table if not exists users (
	id serial primary key,
    name varchar(20) not null,
    birthday_at date null,
    created_at datetime default current_timestamp,
    updated_at  datetime default current_timestamp
);

create table if not exists orders (
	id serial primary key,
    user_id int unsigned,
    created_at datetime default current_timestamp,
    updated_at  datetime default current_timestamp
);

insert into users values
(null, 'Bob', '1990-08-15', '2020-04-06', '2020-04-07'),
(null, 'Sarah', '2000-11-19', '2020-04-06', '2020-04-07'),
(null, 'Will', '1992-04-05', '2020-04-06', '2020-04-07'),
(null, 'John', '1997-01-25', '2020-04-06', '2020-04-07'),
(null, 'Nick', '1999-02-28', '2020-04-06', '2020-04-07'),
(null, 'Ed', '1994-02-01', '2020-04-06', '2020-04-07');

insert into orders values
(null, 1, date_add(curdate(), interval -1 day), curdate()),
(null, 5, date_add(curdate(), interval -1 day), curdate()),
(null, 4, date_add(curdate(), interval -1 day), curdate()),
(null, 1, date_add(curdate(), interval -1 day), curdate()),
(null, 2, date_add(curdate(), interval -1 day), curdate()),
(null, 3, date_add(curdate(), interval -1 day), curdate()),
(null, 5, date_add(curdate(), interval -1 day), curdate()),
(null, 5, date_add(curdate(), interval -1 day), curdate()),
(null, 2, date_add(curdate(), interval -1 day), curdate()),
(null, 4, date_add(curdate(), interval -1 day), curdate()),
(null, 3, date_add(curdate(), interval -1 day), curdate());

select  distinct
		t1.id,
		t1.name
	from users as t1
    join orders as t2 on t1.id = t2.user_id
order by t1.id;

#2
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

select  t1.name as prod_name,
		t2.name as catalog
	from products as t1
    join catalogs as t2 on t1.catalog_id = t2.id;

#3
create table flights (
	id serial primary key,
    `from` varchar(30) not null,
    `to` varchar(30) not null
);

insert into flights (`from`, `to`) values
('moscow', 'omsk'),
('novgorog', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

create table cities (
    label varchar(30) not null,
    name varchar(30) not null
);

insert into cities values
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorog', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

select  t2.name as `from`,
		t3.name as `to`
	 from flights as t1
     join cities  as t2 on t1.`from` = t2.label
     join cities  as t3 on t1.`to` = t3.label
order by t1.id;