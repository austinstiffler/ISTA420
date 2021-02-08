.echo on
.headers on

-- Name: Austin Stiffler
-- File: lab2a-stiffler.sql
-- Date: 19 January, 2021

--1. What are the regions?
 select * from region;
 
--2. What are the cities?
select * from territories;

--3. What are the cities in the Southern region?
select * from territories where regionid = 4;

--4. How do you run this query with the fully qualified column name?
select territories.TerritoryID, territories.TerritoryDescription, territories.RegionID from territories where regionid = 4;

--5. How do you run this query with a table alias?
select T.Territoryid, T.Territorydescription, T.regionid from territories T where regionid = 4;

--6. What is the contact name, telephone number, and city for each customer?
select c.contactname, c.phone, c.city from customers c;

--7. What are the products currently out of stock?
select productname, productid, unitsinstock from products where unitsinstock = 0;

--8. What are the ten products currently in stock with the least amount on hand?
select productname, productid, unitsinstock from products where unitsinstock > 0 order by unitsinstock limit 10;

--9. What are the 5 most expensive products in stock?
select productid, productname, unitsinstock, unitprice from products where unitsinstock > 0 order by unitprice desc limit 5;

--10. How many products does Northwind have? How many customers? How many suppliers?
select count(productid) from products;
select count(customerid) from customers;
select count(supplierid) from suppliers;