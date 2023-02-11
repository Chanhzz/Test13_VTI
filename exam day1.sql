create database if not exists ecommercedb;
use ecommercedb;
create table customer(
customer_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50),
email_address varchar(100) not null unique,
number_of_complaints int default 0
);
create table sales(
purchase_number int primary key auto_increment,
date_of_purchase date not null,
customer_id int not null,
item_code char(3) not null 
);
create table item(
item_code char(3) primary key,
item varchar(50) not null,
unit_price_usd int not null,
company_id int not null,
company varchar(50) not null,
headquaters_phone_number char(17) not null
);
