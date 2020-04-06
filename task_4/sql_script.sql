/*
users:
id	name	birthday_at		createed_at		updated_at
*/

#1
select floor(avg(floor(datediff(curdate(), birthday_at) / 365.25))) as AVG_AGE
	from users;
    
#2
select  dayname(concat(year(curdate()), substring(birthday_at, 5, 6))) as day_name,
		count(id) as count_birthday
    from users
    group by day_name
    order by day_name;