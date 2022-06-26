create view v_product(product_id, product_name, list_price, model_year, brand_name, category_name) as
select c.product_id, c.product_name, c.model_year, c.list_price, d.brand_name, c.category_name from (select a.*, b.category_name from products as a inner join categories as b
 on a.category_id = b.category_id) as c 
 inner join brands as d
 on c.brand_id = d.brand_id;

create view v_product2(product_id, product_name, list_price, model_year, brand_name, category_name)
with schemabinding
as
select c.product_id, c.product_name, c.model_year, c.list_price, d.brand_name, c.category_name from (select a.*, b.category_name from products as a inner join categories as b
 on a.category_id = b.category_id) as c 
 inner join brands as d
 on c.brand_id = d.brand_id;

CREATE VIEW product_master
with schemabinding
AS 
SELECT
    p.product_id,
    p.product_name,
    p.model_year,
    p.list_price
FROM
    products as p