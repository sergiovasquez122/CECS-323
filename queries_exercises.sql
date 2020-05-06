-- List all customers who didn't order in 2015
select CUSTOMERS.CUSTOMERNUMBER, CUSTOMERNAME from customers 
except
select CUSTOMERS.CUSTOMERNUMBER, CUSTOMERNAME from customers natural join ORDERS
where year(ORDERDATE) = 2015;
-- List all peaple that we deal with. Display firstname, lastname, company name
select CONTACTFIRSTNAME as first_name, CONTACTLASTNAME as last_name, CUSTOMERNAME as company_name
from CUSTOMERS
union
select FIRSTNAME as first_name, LASTNAME as last_name, 'employee' as company_name from EMPLOYEES;
-- List the last name, first name, and employee number of all of the employees who do not have any customers. order by last name first, then the first name.
select FIRSTNAME, LASTNAME, EMPLOYEENUMBER from EMPLOYEES
except
select FIRSTNAME, LASTNAME, EMPLOYEENUMBER
from EMPLOYEES inner join CUSTOMERS
on EMPLOYEES.EMPLOYEENUMBER = CUSTOMERS.SALESREPEMPLOYEENUMBER
order by LASTNAME, FIRSTNAME;
-- list the states and the country that the state is that have customers but not office, offices but not customers, or both one or more customers and one of more offices all in one query

-- List the product code and product name of every product that has never been in an order in which the customers asked for more than 48 of them
select PRODUCTCODE, PRODUCTNAME from products
except
SELECT PRODUCTCODE, PRODUCTNAME from
customers natural join orders natural join orderdetails
natural join products where QUANTITYORDERED > 48
order by PRODUCTNAME;
-- List the first name and last name of any customer who ordered any products form either of the two product lines 'train' or truck and buses performa n union
select CUSTOMERNAME,CONTACTFIRSTNAME, CONTACTLASTNAME from customers
natural join orders natural join orderdetails natural join products
where PRODUCTLINE = 'Trains'
union select CUSTOMERNAME,CONTACTFIRSTNAME, CONTACTLASTNAME from
customers natural join orders natural join orderdetails natural join products
where productline = 'Trucks and Buses'
order by CUSTOMERNAME;


-- What products that makes us the most money
SELECT PRODUCTCODE, PRODUCTNAME from PRODUCTS natural join ORDERDETAILS
where QUANTITYORDERED * PRICEEACH >= all (select QUANTITYORDERED * PRICEEACH as computer from orderdetails);

-- Find the first name and last name of all customer contacts whose customer is located in the same state ans the san franscio office
select CONTACTFIRSTNAME, CONTACTLASTNAME from CUSTOMERS
where state = (select state from OFFICES
where CITY = 'San Francisco');

-- customers who have ordered the same thing. Find only those customers pairs that have ordered the same thing as each other 201 times

