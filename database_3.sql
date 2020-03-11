select distinct CUSTOMERNAME, PRODUCTNAME from CUSTOMERS natural join ORDERS natural join ORDERDETAILS natural join PRODUCTS
where QUANTITYORDERED >= 6

select PRODUCTCODE, PRODUCTNAME, sum(100 * (MSRP - BUYPRICE) / BUYPRICE) as profit from PRODUCTS group by PRODUCTCODE, PRODUCTNAME having sum(100 * (MSRP - BUYPRICE) / BUYPRICE) > 125

select COUNTRY, count(CUSTOMERNUMBER) as numberOfCustomers from CUSTOMERS group by COUNTRY order by count(CUSTOMERNUMBER) desc

select distinct ORDERNUMBER, ORDERDATE, SHIPPEDDATE from ORDERS natural join ORDERDETAILS
where ORDERDATE between '06/16/2014' and '07/7/2014'
and SHIPPEDDATE between '06/20/2014' and '07/31/2014' order by ORDERDATE 

select productName, productVendor from PRODUCTS where PRODUCTVENDOR like '%Gear%'
