# 1
-- вариант если необходимо заполнить (обновить) уже существующие записи в полях created_at и updated_at
update users
	set created_at = case
						when created_at is null then now()
                        else created_at
					end,
		updated_at = case
						when updated_at is null then now()
                        else updated_at
					end;
                    
/* вариант если необходимо заполнить (добавить новые) записи в поля created_at и updated_at
 (но в данном случае возможна ошибка, т.к. другие поля погут иметь ограничение типа not null)*/
insert into users (created_at, updated_at) values
(now(), now());
-- но ни один из вариантов не сработает т.к. таблица users была неудачно спроектирована. (см задание 2)
-- ****************************************************************************************************
# 2
create temporary table temp_tbl
select  id,
		str_to_date(created_at, '%d.%m.%Y %H:%i') as created_at,
		str_to_date(updated_at, '%d.%m.%Y %H:%i') as updated_at
	from users;
    
update users
	set created_at = null,
		updated_at = null;

alter table users
modify created_at datetime,
modify updated_at datetime;

update users    as t1
  join temp_tbl as t2 on t1.id = t2.id
	set t1.created_at = t2.created_at,
		t1.updated_at = t2.updated_at;
commit;
-- ****************************************************************************************************
# 3
select  *
	 from storehouses_products
order by case value when 0 then 2 else 1 end, value asc;
-- ****************************************************************************************************
# 4
select *
	 from users
	where monthname(birthday_at) in ('may', 'august');
-- ****************************************************************************************************
#5
select  *
	 from catalogs
	where id in (5, 1, 2)
order by case id when 5 then 1 when 1 then 2 else 3 end, id asc;