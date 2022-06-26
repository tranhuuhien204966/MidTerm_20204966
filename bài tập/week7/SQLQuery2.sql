create database production;
use production;
select * from brands;

rollback transaction SP01;

commit;

 create table categories (
 	category_id int primary key,
 	category_name nvarchar(100)
 );

 create table brands (
 	brand_id int primary key,
 	brand_name nvarchar(100)
 );

 create table products (
 	product_id int primary key,
 	product_name nvarchar(100),
 	brand_id int,
 	category_id int,
 	model_year int,
 	list_price int,
 	foreign key (brand_id) references brands(brand_id),
 	foreign key (category_id) references categories(category_id)
 );

insert into categories (category_id , category_name) values (1,'bup be');
insert into categories (category_id , category_name) values (2,'oto');
 insert into categories (category_id , category_name) values (3,'xe may');
 insert into categories (category_id , category_name) values (4,'may bay');
 insert into categories (category_id , category_name) values (5,'sieu nhan');
 insert into categories (category_id , category_name) values (6,'xe dap');
 insert into categories (category_id , category_name) values (7,'bong da');
 insert into categories (category_id , category_name) values (8,'bong ro');
 insert into categories (category_id , category_name) values (9,'cau long');
 insert into categories (category_id , category_name) values (10,'may tinh');
 insert into categories (category_id , category_name) values (11,'cap sach');
  insert into categories (category_id , category_name) values (112,'sofa');

 insert into brands values
 (1, 'brand1'),
 (2, 'brand2'),
 (3, 'brand3'),
 (4, 'brand4'),
 (5, 'brand5'),
 (6, 'brand6'),
 (7, 'brand7'),
 (8, 'brand8'),
 (9, 'brand9'),
 (10, 'brand10')

 insert into products values
 (1, 'product1ggfh', 1, 2, 2020, 1000000),
 (2, 'product24', 5, 10, 2020, 10000000),
 (3, 'product1gtyj', 8, 9, 2020, 21000000),
 (4, 'product1i76', 7, 4, 2020, 2000000),
 (5, 'product1g4g4', 1, 5, 2020, 1400000),
 (6, 'product1657', 8, 2, 2020, 41000000),
 (7, 'product13', 7, 1, 2020, 100000),
 (8, 'product106789', 6, 6, 2020, 900000),
 (9, 'product17865', 2, 3, 2020, 1900000),
 (10, 'product1jtj', 4, 4, 2020, 4000000),
 (11, 'product1i', 5, 5, 2020, 5600000),
 (12, 'product1ge', 1, 9, 2020, 7000000),
 (13, 'product16785', 9, 1, 2020, 8000000),
 (14, 'product1324', 9, 10, 2020, 1100000),
 (15, 'product1wqer', 10, 2, 2020, 60000),
 (16, 'product1tj', 10, 1, 2020, 7500000),
 (17, 'product1fg', 6, 1, 2020, 9900000),
 (18, 'product1dfg', 3, 2, 2020, 99900000),
 (19, 'product1fg', 3, 2, 2020, 10000000),
 (20, 'product1312', 3, 2, 2020, 2200000)

 select c.*, d.brand_name from (select a.*, b.category_name from products as a inner join categories as b
 on a.category_id = b.category_id) as c 
 inner join brands as d
 on c.brand_id = d.brand_id;

 select * from v_product where model_year = 2022;
 
go