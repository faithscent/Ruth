
create table house_1(
house_id int not null,
house_num varchar (20) not null,
house_size  varchar (20) not null,
county varchar (20) not null,
area varchar (20) not null,
house_price decimal(8,2) not null,
primary key (house_id)
unique (house_num)
);

ALTER TABLE house_1
ADD COLUMN  bedroom_num varchar(20) not null;
EXPLAIN house_1;



