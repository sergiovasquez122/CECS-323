 
select * from ProductLines

select * from Products

select * from Employees

select * from Offices

select * from Customers

select * from Orders

select * from OrderDetails

select * from Payments

select customerName from Customers order by customerName asc

select distinct status from Orders

select lastName, firstName from Employees order by lastName, firstName

select distinct jobTitle from Employees

select productScale, productName from Products

select distinct territory from Offices

select contactLastName, contactFirstName, creditLimit from Customers where creditLimit > 50000

select * from Customers where creditLimit = 0

select * from Offices where not Country in ('USA')

select * from Orders where orderDate between '06/16/2014' and '07/07/2014'

select * from Products where quantityInStock < 1000

select * from Orders where shippedDate > requiredDate

select * from Customers where customerName like '%Mini%'

select * from Products where productVendor = 'Highway 66 Mini Classics'

select * from Products where not productVendor = 'Highway 66 Mini Classics'

select * from Employees where reportsTo is null

select * from OrderDetails natural join Orders where OrderNumber in (10270, 10272, 10279)

select distinct productLine, productVendor from ProductLines natural join Products

select * from Customers Inner Join Offices on
Customers."STATE" = Offices."STATE"

select * from Customers inner join Offices 
on Customers."STATE" = Offices."STATE"

select customerName, orderDate, quantityOrdered, productLine, productName from ProductLines natural join Products natural join OrderDetails natural join Orders natural join Customers
where year(orderDate) = 2015 and year(shippedDate) = 2015

select * from Products left outer join OrderDetails on PRODUCTS.PRODUCTCODE = ORDERDETAILS.PRODUCTCODE where quantityOrdered is null

select * from CUSTOMERS left outer join EMPLOYEES 
on CUSTOMERS.SALESREPEMPLOYEENUMBER = EMPLOYEES.EMPLOYEENUMBER

select max(amount) from Customers natural join Payments

select avg(amount) from Customers natural join Payments

select officeCode, count(employeeNumber) as number_of_employees from Offices natural join Employees group by officeCode

select customerName, sum(amount) as total from Customers natural join Payments group by customerName

select status, count(status) as numberOfOrders from Orders group by status

select productLine, count(productName) from PRODUCTLINES natural join PRODUCTS group by productLine

select productLine, count(productName) as numberOfProducts from PRODUCTLINES natural join PRODUCTS group by productLine having count(productName) > 3

select orderNumber, sum(priceEach * QUANTITYORDERED) as totalPrice from ORDERDETAILS group by orderNumber having sum(PRICEEACH * QUANTITYORDERED) > 60000

select productName, productCode, sum((ORDERDETAILS.PRICEEACH - PRODUCTS.BUYPRICE) * ORDERDETAILS.QUANTITYORDERED)  as profit from PRODUCTS natural join ORDERDETAILS group by PRODUCTNAME, PRODUCTCODE 
having sum((PRICEEACH - BUYPRICE) * QUANTITYORDERED) > 60000
order by profit desc

select productName, productCode, sum(MSRP - BUYPRICE) as profitPerProduct from  Products group by productName, productCode

select customerName, sum(QUANTITYORDERED * PRICEEACH) as totalOrders from Customers natural join Orders natural join ORDERDETAILS group by customerName having sum(QUANTITYORDERED * PRICEEACH) > 100000 order by sum(QUANTITYORDERED * PRICEEACH) desc 
