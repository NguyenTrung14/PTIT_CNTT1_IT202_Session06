drop database if exists ss6_ex6;
create database ss6_ex6;
use ss6_ex6;

create table products(
	product_id int primary key,
    product_name varchar(255) not null,
    price decimal(20,2) not null
    
)ENGINE=InnoDB;

create table order_items(
	order_id int ,
    product_id int not null,
    quantity int not null,
    primary key(order_id, product_id),
    foreign key (product_id) references products(product_id)
    on update cascade
    on delete cascade
    
)ENGINE=InnoDB;

insert into products(product_id, product_name, price)
values (1, 'Tai nghe Bluetooth', 60000000),
(2, 'Ban phim co',90000000),
(3, 'Chuot gaming',50000000),
(4, 'Man hinh 24 inch',300000000),
(5, 'SSD 1TB',200000000);

insert into order_items (order_id, product_id, quantity)
values (1001, 1, 3),
(1001, 3, 2),
(1002, 2, 4),
(1003, 4, 2),
(1004, 5, 3),
(1005, 4, 1),
(1006, 5, 1),
(1007, 4, 7), 
(1008, 5, 6), 
(1009, 2, 6),
(1010, 1, 7), 
(1011, 3, 8); 


select p.product_name, sum(oi.quantity) as total_sold, sum(oi.quantity * p.price) as total_revenue, avg(p.price) as avg_price
from products p
join order_items oi
on p.product_id = oi.product_id
group by p.product_id, p.product_name
having sum(oi.quantity) >= 10
order by total_revenue desc
limit 5;
