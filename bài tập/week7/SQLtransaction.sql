begin transaction t_production
save transaction SP01;
use production;
update products set list_price += 2;
select * from products;
save transaction SP02;
update products set list_price += 3;
select * from products;
commit;
rele transaction SP01;
use production;

select * from products;
go
select * from products;
rollback transaction SP01;
use production;
select * from products;
commit;
commit;
go

select * from products;
rollback transaction SP01;
select * from products;

select * from products;
commit;
