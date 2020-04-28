/** List the customer name of all customers who have never ordered any product
from the 'Classics Cars' productLine **/
select CUSTOMERNAME from customers
except
select CUSTOMERNAME from customers
natural join orders natural join 
ORDERDETAILS natural join products
where productline = 'Classic Cars';

/** List the customers who share the same postal code. Make sure
    that no pair of customers show up more than once. Order by the first customer name, then 
    the second one */
select c1.customername, c2.customername
from customers c1, customers c2 
where c1.CUSTOMERNUMBER < c2.CUSTOMERNUMBER
and c1.POSTALCODE = c2.POSTALCODE
order by c1.CUSTOMERNAME, c2.CUSTOMERNAME;

/** List the names of all of the customers who have ordered our most
expensive products order by customername. Show each customer only once. */
select distinct customername 
from customers natural join orders natural
join orderdetails natural join products
where productname  = (select PRODUCTNAME from products where msrp >= all (select max(MSRP) from PRODUCTS));

/** What product has the most value in our inventory */
select PRODUCTNAME from products where 
QUANTITYINSTOCK * msrp >= all (select max(QUANTITYINSTOCK * MSRP) from PRODUCTS);

/** List the cities and states in which we have either offices or   
    customers. Have the query identify whether the addresss is 
    associated with an office or a customer. Do not include rows where the state is null */
select CITY, "STATE", 'customer' as category from CUSTOMERS where state is not null
union 
select CITY, "STATE", 'Offices' as category from OFFICES where state is not null;

