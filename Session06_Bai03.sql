drop database if exists ss6_ex3;
create database ss6_ex3;
use ss6_ex3;

create table customers(
	customer_id int primary key,
    full_name varchar(255) not null,
    city varchar(255) not null

)ENGINE=InnoDB;

create table orders(
	order_id int primary key,
    customer_id int,
    order_date date not null,
    status_ord ENUM('pending', 'completed', 'cancelled'),
    total_amount decimal(20,2) not null,
    foreign key (customer_id) references customers(customer_id)
    on update cascade
    on delete cascade

)ENGINE=InnoDB;

insert into customers (customer_id, full_name, city)
values (1, 'Nguyen Van A', 'Ha Noi'),
(2, 'Nguyen Van B', 'Ha Noi'),
(3, 'Nguyen Van C', 'TP.HCM'),
(4, 'Nguyen Van D', 'Da Nang'),
(5, 'Nguyen Van E', 'TP.HCM');

insert into orders (order_id, customer_id, order_date, status_ord, total_amount)
values (101, 1, '2025-01-01', 'completed', 150000000),
(102, 1, '2025-01-05', 'pending',   200000000),
(103, 2, '2025-01-10', 'completed', 180000000),
(104, 3, '2025-01-12', 'cancelled', 120000000),
(105, 3, '2025-01-15', 'completed', 250000000);

select order_date, sum(total_amount) 
from orders 
where status_ord='completed'
group by order_date;


select order_date, count(total_amount) 
from orders 
where status_ord='completed'
group by order_date;

select order_date, sum(total_amount) 
from orders 
where status_ord='completed'
group by order_date
having sum(total_amount)>10000000;
