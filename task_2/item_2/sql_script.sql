drop database if exists MEDIA_LIBRARY;

create database if not exists MEDIA_LIBRARY;

use MEDIA_LIBRARY;

create table if not exists USERS (
	user_id int(9) unsigned auto_increment primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email varchar(20) not null,
    bio varchar(255) null,
    avatar varchar(255) null 
);

create table if not exists PHOTO (
	id int(6) auto_increment primary key,
	file_location varchar(255) not null,
    file_name varchar(150) not null,
    file_description varchar(255) null,
    file_key_words varchar(255) null,
    user_id int(9) unsigned not null 
);

alter table PHOTO
add constraint FK_PHOTO_USERS
foreign key (user_id)
references USERS(user_id);

create table if not exists AUDIO (
	id int(6) auto_increment primary key,
	file_location varchar(255) not null,
    file_name varchar(150) not null,
    file_description varchar(255) null,
    file_key_words varchar(255) null,
    user_id int(9) unsigned not null 
);

alter table AUDIO
add constraint FK_AUDIO_USERS
foreign key (user_id)
references USERS(user_id);

create table if not exists VIDEO (
	id int(6) auto_increment primary key,
	file_location varchar(255) not null,
    file_name varchar(150) not null,
    file_description varchar(255) null,
    file_key_words varchar(255) null,
    user_id int(9) unsigned not null 
);

alter table VIDEO
add constraint FK_VIDEO_USERS
foreign key (user_id)
references USERS(user_id);
