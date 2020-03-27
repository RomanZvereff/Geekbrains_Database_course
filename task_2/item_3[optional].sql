insert into sample.cat
select *
from shop.catalogs
on duplicate key update sample.cat.name = shop.catalogs.name;