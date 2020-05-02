drop function if exists hello;

DELIMITER //

create function hello() 
returns varchar(50) deterministic
begin
	declare greeting varchar(50);
    
    set greeting = 
		(select case
					when CURTIME() >= time('06:00:00') and CURTIME() < time('12:00:00') then 'Good morning!'
					when CURTIME() >= time('12:00:00') and CURTIME() < time('18:00:00') then 'Good afternoon!'
					when CURTIME() >= time('18:00:00') and CURTIME() <= time('23:59:59') then 'Good evening!'	
					when CURTIME() >= time('00:00:00') and CURTIME() < time('06:00:00') then 'Good night!'
				end);
			
	return greeting;
end//
DELIMITER ;

select hello();

-- --------------------------------------------------------------------------------------------------------------------
# табл PRODUCTS уже создавалась в прошлых ДЗ, поэтому просто сгенерировал скрипт на её создание автоматически 
CREATE TABLE if not exists `products_` (
   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(50) NULL,
   `description` text,
   `price` decimal(7,2) DEFAULT NULL,
   `catalog_id` int(10) unsigned DEFAULT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id` (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 drop trigger if exists not_nill_values;
 DELIMITER //
 
 create trigger not_nill_values before insert on products_
 for each row
begin
	if new.name is null and new.description is null then 
    signal sqlstate '45000'
    set message_text = 'Error! Name and description can''t be null.';
    end if;
end//

DELIMITER ;

insert into products_ values
(null, null, null, 999, 1, current_timestamp(), current_timestamp());