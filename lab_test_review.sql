select prod_id, prod_name, prod_price
from products;

select vend_id from PRODUCTS;

select distinct vend_id from PRODUCTS;

select prod_name
from PRODUCTS
fetch first 5 rows only;

select CUST_ID from CUSTOMERS;

select distinct PROD_ID from ORDERITEMS;

select * from CUSTOMERS;

select prod_name from PRODUCTS;

select prod_name 
from products
order by prod_name;

select prod_id, prod_price, prod_name
from products
order by prod_price, prod_name;

select prod_id, prod_price, prod_name
from products 
order by prod_price desc;

select prod_id, prod_price, prod_name
from products
order by prod_price desc, prod_name;

select cust_names from customers
order by cust_names desc;

select cust_id, order_num
from orders
order by cust_id, ORDER_DATE desc;

select ITEM_PRICE, QUANTITY
from ORDERITEMS order by
QUANTITY desc, ITEM_PRICE desc;

select VEND_NAME from VENDORS
order by VEND_NAME desc;

select prod_name, prod_price
from products
where prod_price = 3.49;

select prod_name, prod_price
from products where prod_price < 10;

select prod_name, prod_price
from products 
where prod_price <= 10;

select vend_id, prod_name
from products
where vend_id != 'DLL01';

select prod_name, prod_price
from products 
where prod_price between 5 and 10;

select prod_name
from products
where prod_price is null;

select cust_name
from CUSTOMERS 
where cust_email is null;

select prod_id, prod_name
from products
where PROD_PRICE = 9.49;

select prod_id, prod_name
from PRODUCTS where
PROD_PRICE >= 9;

select distinct order_num from ORDERITEMS
where QUANTITY >= 100;

select prod_name, prod_price from PRODUCTS
where PROD_PRICE between 3 and 6 
order by PROD_PRICE;

select prod_id, prod_price, prod_name
from products
where vend_id = 'DLL01' and prod_price <= 4;

select prod_id, prod_price, prod_name
from products
where vend_id = 'DLL01' or vend_id = 'BRS01';

select prod_name, prod_price
from products
where vend_id = 'DLL01' or vend_id = 'BRS01'
and prod_price >= 10;

select prod_name, prod_price
from products
where (vend_id = 'DLL01' or vend_id = 'BRS01')
and prod_price >= 10;

select prod_name, prod_price
from products
where vend_id in ('DLL01', 'BRS01')
order by prod_name;

select prod_name
from products
where not vend_id = 'DLL01'
order by prod_name;

select name
from products
where vend_id != 'DLL01'
order by prod_name;

select vend_name 
from vendors
where 
VEND_COUNTRY = 'USA'
and VEND_STATE = 'CA';

select ORDER_NUM, PROD_ID, QUANTITY
from ORDERITEMS
where QUANTITY >= 100 and PROD_ID in ('BR01', 'BR02', 'BR03')

select prod_name, prod_price 
from products where
PROD_PRICE >=3 and PROD_PRICE <= 6 
order by PROD_PRICE;

select vend_name
from vendors
where vend_country = 'USA' and vend_state = 'CA'
order by vend_name;

select prod_id, prod_name
from products
where prod_name like 'Fish%';

select prod_id, prod_name
from products
where prod_name like '%bean bag%'

select prod_name
from products
where prod_name like 'F%y';

select prod_id, prod_name
from products
where prod_name like '_ inch teddy bear';

select cust_contact
from customers
where cust_contact like '[JM]%'
order by cust_contact;

select cust_contact
from customers
where cust_contact like '[^JM]%'
order by cust_contact;

select cust_contact
from customers
where not cust_contact like '[JM]%'
order by cust_contact;

select prod_name, prod_desc
from products
where prod_desc like '%toy%';

select prod_name, prod_desc
from products
where prod_desc not like '%toy%'
order by prod_name;

select prod_name, prod_desc
from products
where PROD_DESC like '%toy%' and
prod_desc like '%carrots%';

select prod_name, prod_desc
from products where
prod_desc like '%toy%carrots%';

select vend_name || '(' || vend_country || ')'
from vendors 
order by vend_name;

select trim(vend_name) || ' (' || trim(vend_country) || ')'
from vendors
order by vend_name;

select trim(vend_name) || ' (' || trim(vend_country) || ')'
as vend_title
from vendors
order by vend_name;

select prod_id, quantity, item_price
from orderitems
where order_num = 20008;

select prod_id,
quantity,
item_price,
quantity * item_price as expanded_price
from orderitems
where order_num = 20008;

select vend_name as vname, vend_city as vcity
, vend_address as vaddress from vendors
order by vend_name;

select prod_id, prod_price, prod_price * .9 
as sales_price from products;

select vend_name, upper(vend_name) as vend_name_upcase
from vendors
order by vend_name;

select order_num from orders
where year(order_date) = 2012;

select order_num, order_date
from orders
where year(order_date) = 2012
and month(order_date) = 1
order by order_date;

select avg(prod_price) as avg_price
from products;

select avg(prod_price) as avg_price
from products
where vend_id = 'DLL01';

select count(*) as num_cust
from customers;

select count(cust_email) as num_cust
from customers;

select max(prod_price) as max_price
from products;

select min(prod_price) as min_price
from products;

select sum(quantity) as item_ordered
from orderitems
where order_num = 20005;

select sum(item_price * quantity) as total_price
from orderitems
where order_num = 20005;

select avg(distinct prod_price) as avg_price
from products
where vend_id = 'DLL01';

select avg(prod_price) as 
avg_price from products
where vend_id = 'DLL01';

select count(*) as num_items,
min(prod_price) as price_min,
max(prod_price) as price_max,
avg(prod_price) as price_avg
from products;

select count(QUANTITY) as sold_items
from orderitems;

select count(quantity) as sold_items
from orderitems where prod_id = 'BR01';

select max(prod_price) as max_price
from products
where prod_price <= 10;

select count(*) as num_prods
from products
where vend_id = 'DLL01';

select vend_id, count(*) as num_prods
from products
group by vend_id;

select cust_id, count(*) as orders
from orders
group by cust_id
having count(*) >= 2;

select vend_id, count(*) as num_prods
from products
where prod_price >= 4
group by vend_id
having count(*) >= 2;

select vend_id, count(*) as num_prods
from products
group by vend_id
having count(*) >= 2;

select order_num, count(*) as items
from orderitems
group by order_num
having count(*) >= 3;

select order_num, count(*) as items
from ORDERITEMS
group by order_num
having count(*) >=3 
order by items, ORDER_NUM;

select order_num, count(*) as order_lines
from orderitems
group by order_num
order by order_lines;

select vend_id, min(prod_price) as cheapest_item
from products
group by vend_id 
order by cheapest_item;

select order_num
from orderitems
group by order_num
having sum(QUANTITY) >= 100
order by order_num;

select order_num
from orderitems
group by order_num
having sum(item_price * quantity) >= 1000
order by order_num;

select ORDER_NUM, count(*) as items
from ORDERITEMS
group by ORDER_NUM
having count(*) >= 3
order by items, ORDER_NUM;


