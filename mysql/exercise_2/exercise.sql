create database vtapp;

use vtapp;

create user 'vtapp_user'@'localhost' identified by '987654321';

grant all privileges on vtapp.* to 'vtapp_user'@'localhost';