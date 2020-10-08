drop schema if exists expense_tracker;
create schema expense_tracker;

drop table if exists expense_tracker.bank_account_owner;

create table expense_tracker.bank_account_owner(
		id_ba_own integer primary key,
		owner_name varchar(50) not null,
		user_login integer not null,
		active varchar(1) default 1 not null,
		insert_date timestamp default current_timestamp,
		update_date timestamp default current_timestamp
);

drop table if exists expense_tracker.bank_account_types;

create table expense_tracker.bank_acount_types(
		id_ba_type integer primary key,
		ba_type varchar(50)not null,
		ba_desc varchar(250),
		active varchar(1) default 1 not null,
		is_common_account varchar(1) default 0 not null,
		id_ba_own integer,
		insert_date timestamp default current_timestamp,
		update_date timestamp default current_timestamp
		);
		
drop table if exists expense_tracker.transactions;

create table expense_tracker.transactions(
		id_transaction integer primary key,
		id_trans_ba integer,
		id_trans_cat integer,
		id_trans_subcat integer,
		id_trans_type integer,
		id_user integer,
		transaction_date date default current_date,
		transaction_value numeric(9,2),
		transaction_description text,
		insert_date timestamp default current_timestamp,
		update_date timestamp default current_timestamp
		);
		
drop table if exists expense_tracker.transaction_bank_account;

create table expense_tracker.transaction_bank_account(
		id_trans_ba integer primary key,
		id_ba_own integer,
		id_ba_typ integer,
		bank_account_name varchar(50) not null,
		ban_account_desc varchar(250),
		active varchar(1) default 1 not null,
		insert_date timestamp default current_timestamp,
		update_date timestamp default current_timestamp
		);
		
drop table if exists expense_tracker.transaction_category;
	
create table expense_tracker.transaction_category(
		id_trans_cat integer not null,
		category_name varchar(50) not null,
		category_description varchar(250),
		active varchar(1) default 1 not null,
		insert_date timestamp default current_timestamp,
		update_date timestamp default current_timestamp		
		);
		
drop table if exists expense_tracker.transaction_subcategory;

create table expense_tracker.transaction_subcategory(
		id_trans_subcat integer primary key,
		id_trans_cat integer,
		subcategory_name varchar(50) not null,
		subcategory_description varchar(250),
		active varchar(1) default 1 not null,
		insert_date timestamp default current_timestamp,
		update_date timestamp default current_timestamp
		);

drop table if exists expense_tracker.transaction_type;

create table expense_tracker.transaction_type(
		id_trans_type integer primary key,
		transaction_type_name varchar(50) not null,
		active varchar(1) default 1 not null,
		insert_date timestamp default current_timestamp,
		update_date timestamp default current_timestamp
		);
		
drop table if exists expense_tracker.users;

create table expense_tracker.users(
		id_user integer primary key,
		user_login varchar(25) not null,
		user_name varchar(50) not null,
		user_password varchar(100) not null,
		password_salt varchar(100) not null,
		active varchar(1) default 1 not null,
		insert_date timestamp default current_timestamp,
		update_date timestamp default current_timestamp
);