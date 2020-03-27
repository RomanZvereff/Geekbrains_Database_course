update shop.catalogs
	set name = 'empty'
where name is null
   or name = '';
commit;

-- уникальность необходимо убрать, т.к. при попытке хранения более одной записи 'empty' получим ошибку