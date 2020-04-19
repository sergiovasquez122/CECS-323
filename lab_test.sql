select * from PRODUCTLINES

select * from PRODUCTS

select * from EMPLOYEES

select * from OFFICES

select * from CUSTOMERS

select * from ORDERS

select * from ORDERDETAILS

select * from PAYMENTS

select CUSTOMERNAME from CUSTOMERS
order by CUSTOMERNAME asc

select FIRSTNAME, LASTNAME from EMPLOYEES 
order by LASTNAME

select distinct JOBTITLE from EMPLOYEES

select PRODUCTNAME, PRODUCTLINE from PRODUCTS

select distinct TERRITORY from OFFICES

select CONTACTFIRSTNAME, CONTACTLASTNAME, CREDITLIMIT 
from CUSTOMERS where CREDITLIMIT > 50000

select * from CUSTOMERS where CREDITLIMIT = 0

select * from OFFICES where "COUNTRY" != 'USA'

select * from ORDERS where
ORDERDATE between '06/16/2014' and '07/07/2014'

select PRODUCTS where QUANTITYINSTOCK < 1000

select ORDERS where SHIPPEDDATE > REQUIREDDATE

select * from CUSTOMERS where CUSTOMERNAME like '%Mini%'

select * from PRODUCTS where PRODUCTVENDOR = 'Highway 66 Mini Classics'

select * from products where PRODUCTVENDOR != 'Highway 66 Mini Classics'

select * from EMPLOYEES where REPORTSTO is null

select * from ORDERS natural join ORDERDETAILS
where ORDERNUMBER in (10270, 10272, 10279)

select distinct PRODUCTLINE, PRODUCTVENDOR 
from PRODUCTLINES natural join PRODUCTS

select * from CUSTOMERS c inner join OFFICES o
on c."STATE" = o."STATE"

select * from Customers 
inner join EMPLOYEES
on CUSTOMERS.SALESREPEMPLOYEENUMBER = EMPLOYEENUMBER
inner join OFFICES on
EMPLOYEES.OFFICECODE = OFFICES.OFFICECODE and CUSTOMERS."STATE" = OFFICES."STATE"

select distinct CUSTOMERNAME, ORDERDATE, QUANTITYORDERED, PRODUCTLINE, PRODUCTNAME from PRODUCTLINES natural join PRODUCTS
natural join ORDERDETAILS natural join ORDERS
natural join CUSTOMERS where 
year(SHIPPEDDATE) = 2015 and year(ORDERDATE) = 2015

select * from PRODUCTS left outer join ORDERDETAILS
on PRODUCTS.PRODUCTCODE = ORDERDETAILS.PRODUCTCODE
where QUANTITYORDERED is null

select * from CUSTOMERS left outer join EMPLOYEES
on CUSTOMERS.SALESREPEMPLOYEENUMBER = EMPLOYEES.EMPLOYEENUMBER

select sum(AMOUNT) as amount from PAYMENTS

select max(amount) as max_value from PAYMENTS

select avg(amount) as avg_value from PAYMENTS

select count(*) as count_status, status from ORDERS
group by status

select distinct PRODUCTLINE, count(PRODUCTCODE) from PRODUCTS
group by PRODUCTLINE

select OFFICECODE, count(EMPLOYEENUMBER) as number_of_employees
from EMPLOYEES group by OFFICECODE

select count(PRODUCTCODE), PRODUCTLINE from
PRODUCTS group by PRODUCTLINE having count(PRODUCTCODE) > 3

select sum(amount) as total, ORDERNUMBER
from PAYMENTS natural join CUSTOMERS natural join 
ORDERS group by ORDERNUMBER
having sum(amount) > 60000

select count(ORDERNUMBER) as count_status, status from ORDERS
group by status

select distinct PRODUCTSCALE from PRODUCTS;

select country, count(*) as number_of_customers
from customers group by country order by number_of_customers desc;

select distinct CUSTOMERNAME, PRODUCTNAME
from customers natural join ORDERS natural join ORDERDETAILS natural join PRODUCTS
group by CUSTOMERNAME, PRODUCTNAME having count(PRODUCTNAME) >= 6;

select PRODUCTCODE, sum((PRICEEACH - BUYPRICE) * QUANTITYORDERED)
as profit
from products natural join ORDERDETAILS
group by PRODUCTNAME, PRODUCTCODE
having sum((PRICEEACH - BUYPRICE) * QUANTITYORDERED) > 60000
order by profit desc;

select  CUSTOMERNAME, PRODUCTNAME
from customers natural join ORDERS natural join ORDERDETAILS natural join PRODUCTS
group by CUSTOMERNAME, PRODUCTNAME having count(PRODUCTNAME) >= 6;
