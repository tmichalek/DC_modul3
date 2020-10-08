--1
create schema training;
--2
alter schema training rename to training_zs;
--3
create table training_zs.products(
id integer,
production_qty numeric(10,2),
product_name varchar(100),
product_code varchar(10),
description text,
manufacturing_date date);

--4
alter table training_zs.products add primary key(id);

--5
drop table if exists training_zs.sales;

--6
create table training_zs.sales (
id integer,
sales_date timestamp not null,
sales_amount numeric(38,2),
sales_qty numeric(10,2),
product_id integer,
added_by text default 'admin',
constraint sales_over_1k check(sales_amount>1000)
);

--7
alter table training_zs.sales add foreign key (product_id) references training_zs.products (id) on delete cascade;

--8
drop schema training_zs cascade;