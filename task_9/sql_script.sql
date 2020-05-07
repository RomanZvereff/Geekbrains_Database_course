create database if not exists geekbrains;
use geekbrains;

CREATE TABLE `users` (
   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(20) NOT NULL,
   `birthday_at` date DEFAULT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id` (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 CREATE TABLE `catalogs` (
   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(50) NOT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id` (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 CREATE TABLE `products` (
   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(50) NOT NULL,
   `description` text,
   `price` decimal(7,2) DEFAULT NULL,
   `catalog_id` int(10) unsigned DEFAULT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id` (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 -- **********************************************************************************************************
 
create table `logs` (
	id int(7) auto_increment primary key,
	created_at timestamp not null,
    tbl_name varchar(100) not null,
    tbl_PK int not null,
    tbl_name_col varchar(255) not null 
) engine=ARCHIVE;

DELIMITER //

create trigger logs_insert_users after insert on users
for each row
	begin
		insert into `logs` values (null, current_timestamp(), 'users', new.id, new.`name`);
    end//

create trigger logs_insert_catalogs after insert on `catalogs`
for each row
	begin
		insert into `logs` values (null, current_timestamp(), 'catalogs', new.id, new.`name`);
    end//
    
create trigger logs_insert_products after insert on `products`
for each row
	begin
		insert into `logs` values (null, current_timestamp(), 'products', new.id, new.`name`);
    end//
    
DELIMITER ;

insert into users values
(null, 'test', null, null, null);

insert into `catalogs` values
(null, 'test');

insert into `products` values
(null, 'test', 'test', 999, 1, null, null);

select * from `logs`;
