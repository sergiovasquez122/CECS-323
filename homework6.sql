-- 37
select customername from customers
except
select customername from customers
natural join orders where
year(orderdate) = 2015;

-- 38
select LASTNAME, FIRSTNAME, EMPLOYEENUMBER
from EMPLOYEES left outer join CUSTOMERS
on EMPLOYEES.EMPLOYEENUMBER = CUSTOMERS.SALESREPEMPLOYEENUMBER
where CUSTOMERNUMBER is null
order by lastname, firstname;

-- 41
select productcode, productname from products
except 
select productcode, PRODUCTNAME
from products natural join ORDERDETAILS
natural join orders
where QUANTITYORDERED > 48
order by PRODUCTNAME;

-- 42
select CONTACTLASTNAME, CONTACTFIRSTNAME from 
customers natural join ORDERS natural join ORDERDETAILS
natural join PRODUCTS
where PRODUCTLINE = 'Trains'
union
select CONTACTLASTNAME, CONTACTFIRSTNAME from
customers natural join orders natural join 
orderdetails natural join products
where PRODUCTLINE = 'Trucks and Buses'
order by CONTACTLASTNAME, CONTACTFIRSTNAME;

-- 43 
--10 rows
select distinct CUSTOMERNAME
from customers where
state is not null 
except
select distinct c1.CUSTOMERNAME
from customers c1, customers c2
where c1.CUSTOMERNUMBER != c2.CUSTOMERNUMBER
and (c1."STATE" = c2."STATE" and c1.COUNTRY = c2.COUNTRY)
order by CUSTOMERNAME

-- 17 rows
select distinct CUSTOMERNAME
from customers 
except 
select distinct c1.CUSTOMERNAME
from customers c1, customers c2 
where c1.CUSTOMERNUMBER != c2.CUSTOMERNUMBER
and c1.COUNTRY = c2.COUNTRY
and (c1."STATE" = c2."STATE" or c1."STATE" is null and c2."STATE" is null)
order by customername;

