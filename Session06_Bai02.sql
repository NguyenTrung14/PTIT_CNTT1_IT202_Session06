drop database if exists ss6_ex2;
create database ss6_ex2;
use ss6_ex2;

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
    total_amount decimal(10,2) not null,
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
values (101, 1, '2025-01-01', 'completed', 1500000.00),
(102, 1, '2025-01-05', 'pending',   2000000.00),
(103, 2, '2025-01-10', 'completed', 1800000.00),
(104, 3, '2025-01-12', 'cancelled', 1200000.00),
(105, 3, '2025-01-15', 'completed', 2500000.00);

select c.customer_id, c.full_name, sum(o.total_amount) as total_spent
from customers c
join orders o
on c.customer_id= o.customer_id
group by c.customer_id, c.full_name;


select c.customer_id, c.full_name, max(o.total_amount) as total_spent
from customers c
join orders o
on c.customer_id= o.customer_id
group by c.customer_id, c.full_name;

select c.customer_id, c.full_name, sum(o.total_amount) as total_spent
from customers c
join orders o
on c.customer_id= o.customer_id
group by c.customer_id, c.full_name
order by total_spent desc;
