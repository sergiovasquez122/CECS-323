select * from Customers;

select City from Customers;

select distinct Country from Customers;

select * from Customers
where City = 'Berlin';

select * from Customers
where not City = 'Berlin';

select * from Customers
where CustomerID = 32;

select * from Customers
where City = 'Berlin'
and PostalCode = 12209;

select * from Customers
where City = 'Berlin'
or City = 'London';


select * from Customers
order by City;

select * from Customers
order by City desc;

select * from Customers
order by Country, City;

insert into Customers(
CustomerName,
Address,
City,
PostalCode,
Country)
Values(
'Hekkan Burger',
'Gateveien 15',
'Sandes',
'4306',
'Norway');

select * from Customers where PostalCode is null;

select * from Customers where PostalCode is not null;

update Customers set City = 'Oslo';

update Customers set City = 'Oslo'
where Country = 'Norway';

update Customers
set City = 'Oslo', Country = 'Norway' where CustomerID = 32;

delete from Customers where Country = 'Norway';

delete from Customers;

select min(Price) from Products;

select max(Price) from Products;

select count(*)
from products 
where price = 18;

select avg(Price) from Products;

select sum(Price) from Products;

select * from Customers where City like 'a%';

select * from Customers where City like '%a';

select * from Customers where City like '%a%';

select * from Customers where City like 'a%b';

select * from Customers where City not like 'a%';

select * from Customers where City like '_a%';

select * from Customers where City like '[acs]%';

select * from Customers where City like '[a-f]%';

select * from Customers where City like '[^acf]%';

select * from Customers where Country in ('Norway', 'France');

select * from Cusomers where Country not in ('Norway', 'France');

select * from Products where Price between 10 and 20;

select * from Products where Price not between 10 and 20;

select * from Products where ProductName between 'Geitost' and 'Pavlova';

select CustomerName, Address, PostalCode as Pno from Customers;

select * from Customers as Consumers;

select * from Orders left join Customers
Orders.CustomerID = Customers.CustomerID;

select * from Orders inner join Customers 
on Orders.CustomerID = Customers.CustomerID;

select * from Orders right join Customers
on Orders.CustomerID = Customers.CustomerID;

select count(CustomerID),
Country 
from Customers
group by Country;

select count(CustomerID),
Country
from Customers
group by Country
order by count(CustomerID) desc;

create database testDB;

drop database testDB;

create table Persons(
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255));

drop table Persons;

truncate table Persons;

alter table Persons
add Birthday date;

alter table Persons
drop column Birthday;
