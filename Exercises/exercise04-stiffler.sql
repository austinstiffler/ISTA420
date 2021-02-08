--Name: Austin Stiffler
--File: exercise04-stiffler.sql
--Date: 05 February, 2021

--1. Use a derived table to build a query that returns the number of distinct products per year that each
--customer ordered. Use internal aliasing. Use a variable to set the customer number. For example, if
--the customer ID is 1234, the query should report the number of distinct products ordered by customer
--1234 for the years 2014, 2015, and 2016.
use tsqlv4;

declare @num int = 14;
select custid, orderyear, count(distinct productid) as distinctproducts
from 
	(select o.custid,
			o.orderid,
			od.productid,
			year(o.orderdate) as orderyear,
			o.shipcountry 
	from sales.orders o 
			inner join sales.orderdetails od 
				on o.orderid = od.orderid) as t1
	where custid = @num
	group by custid, orderyear;


--2. Use multiple common table expressions to build a query that returns the number of distinct products
--per year that each country's customers ordered. Use external aliasing. Use a variable to set the country
--name. For example, if the country name is France, the query should report the number of distinct
--products ordered by French customers for the years 2014, 2015, and 2016.

use TSQLV4;
Go
declare @country nvarchar(15) = 'France';
with cte1(orderid, product) as 
(select orderid,
		productid
from sales.orderdetails
),
 cte2(orderid, custid, orderyear, country) as
(select o.orderid,
		o.shipcountry,
		o.custid,
		year(o.orderdate)
from sales.orders o)



select cte2.country, cte2.orderyear, count(distinct cte1.product) as distinctproducts
from cte2 inner join cte1 on cte2.orderid = cte1.orderid
where cte2.country = 'France'
group by cte2.country, cte2.orderyear;


--3. Create a view that shows, for each year, the total dollar amount spent by customers in each country
--for all the years in the database.drop view if exists sales.totalSales;gocreate view sales.totalSales as select sum(od.unitprice * od.qty) as sale, o.shipcountry, year(o.orderdate) as orderyear from sales.orderdetails od inner join sales.orders o on od.orderid = o.orderidgroup by o.shipcountry, year(o.orderdate);goselect * from sales.totalSales;--4. Create an inline table valued function that accepts as a parameter a country name and returns a table
--with the distinct products ordered by customers from that country. Products are to be identied by
--both product ID and product name.drop function if exists sales.products;gocreate function sales.products(@country as nvarchar(15)) returns table asreturnselect distinct o.shipcountry, p.productid, p.productname from sales.orderdetails od join production.products pon od.productid = p.productid join sales.orders o on o.orderid = od.orderidwhere o.shipcountry = @country;goselect * from sales.products('France');--5. Use the CROSS APPLY operator to create a query showing the top three products shipped to customers
--in each country. Your report should contain the name of the country, the product id, the product name,
--and the number of products shipped to customers in that country.select distinct country, t1.productid, t1.productname, t1.totalQty from sales.customers cross apply (select top 3 o.shipcountry, p.productid, p.productname, sum(od.qty) as totalQty from sales.orderdetails od join production.products p on od.productid = p.productid join sales.orders o on o.orderid = od.orderidgroup by p.productid, p.productname, o.shipcountryorder by o.shipcountry, totalQty desc) as t1;