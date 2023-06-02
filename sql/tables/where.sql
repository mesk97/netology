create table if not exists customer
(
	  id bigserial primary key,
	  name varchar(255),
	  order_id int
);

insert into customer(name, order_id)
values
    ('c1', 1),
    ('c2', 2);

create table if not exists orders
(
	  id bigserial primary key,
	  title varchar(255),
	  price int
);

insert into 
    orders(title, price)
values
    ('t1', 101),
    ('t2', 202);