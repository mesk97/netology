create table if not exists test_table
(
	  id bigserial primary key,
	  fld varchar(255),
	  mark varchar(255),
	  nil varchar(255)
);

insert into test_table
select data.id, case when data.id % 2 = 0 then now()::text else null end, case when data.id % 2 = 0 then 'test_string'::text else null end, null from generate_series(1, 100) as data(id);

create table if not exists second_table
(
	id bigserial primary key,
	fld varchar(255),
	mark varchar(255),
	nil varchar(255)
);

insert into second_table
select data.id, case when data.id % 2 = 0 then now()::text else null end, case when data.id % 2 = 0 then 'test_string'::text else null end, null from generate_series(1, 1000) as data(id);
