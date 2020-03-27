create database if not exists example;

use example;

create table user(
	id int auto_increment primary key,
	name varchar(20) not null
);
