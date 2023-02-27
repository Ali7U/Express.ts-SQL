CREATE DATABASE store;

CREATE TABLE countries (
    code int not null PRIMARY KEY,
    name varchar(20) not null,
    continent varchar(20) not null

);

create table users (
    id int primary key not null,
    full_name varchar(20) not null,
    email varchar(20),
    gender char(1) not null,
    dat_of_birth varchar(15) not null,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    country_code int,
    foreign key (country_code) references countries(code)
);

create table orders(
    id int primary key not null,
    user_id int,
    status varchar(6),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    foreign key (user_id) references users(id)
);

create table products(
    id int primary key not null,
    name varchar(10) not null,
    price int,
    status varchar(10),
    created_at datetime DEFAULT CURRENT_TIMESTAMP
);

create table order_products(
    order_id int not null ,
    product_id int not null ,
    quantity int,
    foreign key (order_id) references orders(id) ,
    foreign key (product_id) references products(id)
);



alter table countries add constraint unique_name unique (name);
alter table countries alter column continent set not null;

alter table users
add constraint uq_email unique (email);

alter table users
add constraint 'gender_checking' check ( 'gender' = 'm' or 'gender' = 'f');

alter table orders
add constraint 'status_checking' check ( 'status' = 'start' or 'status' = 'finish' );

alter table order_products alter column quantity set default 0;

alter table products
alter column price set default 0;

alter table products alter column name set not null ;

alter table products
add constraint 'Exp' check ( 'status' = 'valid' or 'status' = 'expired' );

insert into countries (code, name, continent) VALUE (1, 'Abdullah', 'Asia, ME');

insert into users (id, full_name, email, gender, dat_of_birth)
value (1, 'Ali Ibrahim', 'alo@example.com', 'm', '2001/08/10');

insert into orders (id, user_id, status)
value (1, 1, 'valid');

insert into products (id, name, price, status)
value (8, 'Laptop', 399, 'valid');

insert into order_products (order_id, product_id, quantity)
value (1, 8, 2);

update countries
set continent = 'Asia'
where code = 1;

delete from products where id = 8;