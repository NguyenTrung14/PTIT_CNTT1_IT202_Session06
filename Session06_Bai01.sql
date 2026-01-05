drop database if exists ss6_ex1;
create database ss6_ex1;
use ss6_ex1;

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

insert into orders (order_id, customer_id, order_date, status_ord)
values (101, 1, '2025-01-01', 'completed'),
(102, 1, '2025-01-05', 'pending'),
(103, 2, '2025-01-10', 'completed'),
(104, 3, '2025-01-12', 'cancelled'),
(105, 3, '2025-01-15', 'completed');

select o.order_id, c.full_name, o.order_date, o.status_ord
from orders o
join customers c
on o.customer_id = c.customer_id;

select c.customer_id, c.full_name, count(o.order_id) as total_orders
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select c.customer_id, c.full_name, count(o.order_id) as total_orders
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.full_name
having count(o.order_id)>=1;

