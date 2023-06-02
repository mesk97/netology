create table if not exists persons
(
	  id bigserial primary key,
	  name varchar(255),
	  pos_id int
);

insert into persons(name, pos_id)
values
    ('Vlad', 1),
    ('Tanya', 2),
    ('Alex', 6),
    ('Boris', 2);

create table if not exists positions
(
	  id bigserial primary key,
	  name varchar(255)
);

insert into 
    positions(name)
values
    ('designer'),
    ('redactor'),
    ('programmist');