select cust_id
from orders
where order_num in (20007, 20008);

select cust_id
from orders
where order_num in (
select order_num
from orderitems
where prod_id = 'RGAN01');

select ORDER_NUM
from ORDERITEMS
where PROD_ID = 'RGAN01';

select CUST_ID from customers;

select cust_name, cust_contact from customers
where cust_id in (select cust_id from customers);

select cust_name, cust_contact
from customers
where cust_id in (select 
cust_id from orders
where order_num in (select
order_num from ORDERITEMS
where prod_id = 'RGAN01'));

SELECT COUNT(*) AS ordersFROM Orders
WHERE cust_id = 1000000001;

select CUST_NAME,
CUST_STATE,
(select count(*)
from ORDERS
where ORDERS.CUST_ID = Customers.cust_id) as ORDERS
from customers
order by cust_id;

select
vend_name, prod_name, prod_price
from VENDORS natural join
PRODUCTS;

select vend_name, prod_name, prod_price
from vendors cross join products;

select vend_name, prod_name, prod_price
from vendors
inner join products on vendors.vend_id = PRODUCTS.VEND_ID;

select prod_name, vend_name, prod_price, 
quantity from orderitems, products, vendors
where products.VEND_ID = vendors.VEND_ID
and orderitems.PROD_ID = PRODUCTS.PROD_ID
and ORDER_NUM = 20007;

select cust_name, cust_contact
from customers
where cust_id in (select cust_id from orders where order_num in (select order_num from ORDERITEMS where prod_id = 'RGAN01'))

select cust_name, cust_contact
from customers, orders, orderitems
where customers.CUST_ID = orders.CUST_ID
and ORDERITEMS.ORDER_NUM = ORDERS.ORDER_NUM
and PROD_ID = 'RGAN01';

select cust_name, CUST_CONTACT
from customers inner join ORDERS
on ORDERS.CUST_ID = CUSTOMERS.CUST_ID 
inner join ORDERITEMS on 
ORDERITEMS.ORDER_NUM = ORDERS.ORDER_NUM
and PROD_ID = 'RGAN01';


select cust_name, order_num
from customers inner join orders on customers.CUST_ID = orders.CUST_ID
order by cust_name, order_num;

select * from ORDERITEMS;

select cust_name, order_num, sum(ITEM_PRICE * QUANTITY) as total_price
from customers natural join orders natural join ORDERITEMS
group by cust_name, ORDER_NUM
order by total_price desc;

select cust_id, order_date
from customers natural join orders
natural join orderitems
where prod_id = 'BR01'
order by cust_id, order_date;

select cust_email
from customers 
natural join orders natural join
orderitems
where PROD_ID = 'BR01';

select cust_name, sum(item_price * quantity) as total_price
from CUSTOMERS natural join ORDERS
natural join ORDERITEMS
group by cust_name
order by total_price desc;

select  trim(vend_name) || ' (' || trim(vend_country) || ' )'
as vend_title
from vendors
order by vend_name;

select cust_name, cust_contact
from customers as C, Orders as O, OrderItems as OI
where C.CUST_ID = O.CUST_ID
and OI.ORDER_NUM = O.ORDER_NUM
and PROD_ID = 'RGAN01';

select cust_id, cust_name, cust_contact
from customers
where cust_name = (select cust_name from customers where cust_contact = 'Jim Jones')

select c1.cust_id, c1.cust_name, c1.cust_contact
from customers as c1, customers  as c2
where c1.cust_name = c2.cust_name
and c2.cust_contact = 'Jim Jones';

select customers.CUST_ID, orders.ORDER_NUM
from customers
left outer join orders on customers.CUST_ID = ORDERS.CUST_ID;

select customers.CUST_ID, orders.ORDER_NUM
from customers
right outer join orders on customers.cust_id = orders.CUST_ID;

select trim(vend_name) || ' (' || trim(vend_country) || ' )'
as vend_title
from vendors
order by vend_name;

select cust_name, cust_contact
from customers as c, orders as o, orderitems as oi
where c.cust_id = o.CUST_ID
and oi.order_num = o.ORDER_NUM
and prod_id = 'RGAN01';

select cust_id, cust_name, cust_contact
from customers
where cust_name = (select cust_name
from customers where cust_contact = 'Jim Jones');

select c1.cust_id, c1.cust_name, c1.cust_contact
from customers as c1, customers as c2
where c1.cust_name = c2.cust_name
and c2.CUST_CONTACT = 'Jim Jones';

select * from customers;

select customers.CUST_ID, orders.ORDER_NUM
from customers
inner join orders on customers.cust_id = orders.cust_id;

select customers.cust_id, orders.ORDER_NUM
from customers
left outer join orders on customers.cust_id = orders.cust_id;

select customers.cust_id, orders.ORDER_NUM
from customers
right outer join orders on customers.cust_id = orders.CUST_ID;

select CUSTOMERS.CUST_ID, ORDERS.ORDER_NUM
from CUSTOMERS left outer join ORDERS
on CUSTOMERS.CUST_ID = ORDERS.CUST_ID;

select customers.CUST_ID,
count(orders.ORDER_NUM) as num_ord
from customers
inner join orders on customers.CUST_ID = orders.CUST_ID
group by customers.CUST_ID;

select customers.CUST_ID,
count(orders.ORDER_NUM) as num_ord
from customers
inner join orders on customers.CUST_ID = orders.CUST_ID
group by customers.CUST_ID
order by num_ord desc;

/*
    Write a sql statement using an inner jion to retrieve customer
name and all order number for each
*/
select cust_name, order_num from customers natural join orders;

/*
    Modify the sql statement you just created to list all customers, even those with no orders
*/
select * from customers left outer join orders
on customers.cust_id = orders.CUST_ID;

/*
Use an outer join to join the products and orderitems tables, returning 
a sorted list of product names and the order number 
associated with each */
select prod_name, order_num
from products left outer join orderitems
on products.PROD_ID = ORDERITEMS.PROD_ID;

select prod_name, count(order_num) as total_orders
from products left outer join orderitems
on products.PROD_ID = orderitems.PROD_ID
group by prod_name
order by total_orders desc, prod_name;

select * from VENDORS

select * from products;

select vendors.VEND_ID, count(PROD_ID) as total_orders from vendors left outer join 
products on vendors.VEND_ID = products.VEND_ID
group by vendors.VEND_ID order by total_orders desc;

select cust_name, cust_contact, cust_email
from customers
where cust_state in ('IL', 'IN', 'MI');

select cust_name, cust_contact, cust_email
from customers where cust_name = 'Fun4All';

select cust_name, cust_contact, cust_email
from customers
where cust_state in ('IL', 'IN', 'MI')
union
select cust_name, cust_contact, cust_email
from customers
where cust_name = 'Fun4All';

insert into customers
(cust_id, cust_contact,
cust_email, cust_name,
cust_address, cust_city,
cust_state, cust_zip)
values ('52',
NULL,
NULL,
'Toy Land',
'123 Any Street',
'New York',
'NY',
'11111');

insert into customers
(cust_id, cust_contact,
cust_email, cust_name,
cust_address, cust_city,
cust_state, cust_zip)
values ('2916',
NULL,
NULL,
'Toy Land',
'123 Any Street', 
'New York',
'NY',
'11111');

/*nMake backup copies of your orders on orderitems tables */
create table ordercopy as select * from orders
create table orderitemcopy as select * from orderitems;

update customers
set cust_email = 'kim@thetoystore.com'
where cust_id = '1000000005';

select * from customers;

update customers
set cust_contact ='Sam Roberts',
cust_email = 'sam@toyland.com'
where cust_id = '1000000006';

update customers
set cust_email = null
where cust_id = '1000000005';

delete from customers
where cust_id = '1000000006';

select * from customers; 

delete from customers
where cust_id = '52';

update customers
set CUST_STATE = upper(CUST_STATE);

select * from customers;

select * from VENDORS;

update vendors
set vend_country = upper(vend_country);


