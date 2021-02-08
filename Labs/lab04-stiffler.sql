-- Name: Austin Stiffler
-- File: lab04-stiffler.sql

---------------------------------------------------------------------
-- Microsoft SQL Server T-SQL Fundamentals
-- Chapter 04 - Subqueries
-- Exercises
-- © Itzik Ben-Gan 
---------------------------------------------------------------------
use tsqlv4;

-- 1 
-- Write a query that returns all orders placed on the last day of
-- activity that can be found in the Orders table
-- Tables involved: TSQLV4 database, Orders table

select o.orderid, o.custid, o.empid, o.orderdate from sales.orders o
where o.orderdate = (
select max(oo.orderdate) from sales.orders oo);

--Desired output
orderid     orderdate   custid      empid
----------- ----------- ----------- -----------
11077       2016-05-06  65          1
11076       2016-05-06  9           4
11075       2016-05-06  68          8
11074       2016-05-06  73          7

(4 row(s) affected)

-- 2 (Optional, Advanced)
-- Write a query that returns all orders placed
-- by the customer(s) who placed the highest number of orders
-- * Note: there may be more than one customer
--   with the same number of orders
-- Tables involved: TSQLV4 database, Orders table

select top (1) with ties o1.custid, count(o1.orderid) from sales.orders o1 group by o1.custid order by count(o1.orderid) desc;
select o1.custid from sales.orders o1

select o.orderid, o.custid, o.orderdate, o.empid
from sales.orders o where o.custid in (select top (1) with ties o1.custid from sales.orders o1 group by o1.custid order by count(o1.orderid) desc);

-- Desired output:
custid      orderid     orderdate  empid
----------- ----------- ---------- -----------
71          10324       2014-10-08 9
71          10393       2014-12-25 1
71          10398       2014-12-30 2
71          10440       2015-02-10 4
71          10452       2015-02-20 8
71          10510       2015-04-18 6
71          10555       2015-06-02 6
71          10603       2015-07-18 8
71          10607       2015-07-22 5
71          10612       2015-07-28 1
71          10627       2015-08-11 8
71          10657       2015-09-04 2
71          10678       2015-09-23 7
71          10700       2015-10-10 3
71          10711       2015-10-21 5
71          10713       2015-10-22 1
71          10714       2015-10-22 5
71          10722       2015-10-29 8
71          10748       2015-11-20 3
71          10757       2015-11-27 6
71          10815       2016-01-05 2
71          10847       2016-01-22 4
71          10882       2016-02-11 4
71          10894       2016-02-18 1
71          10941       2016-03-11 7
71          10983       2016-03-27 2
71          10984       2016-03-30 1
71          11002       2016-04-06 4
71          11030       2016-04-17 7
71          11031       2016-04-17 6
71          11064       2016-05-01 1

(31 row(s) affected)

-- 3
-- Write a query that returns employees
-- who did not place orders on or after May 1st, 2016
-- Tables involved: TSQLV4 database, Employees and Orders tables

select e.empid, e.firstname, e.lastname from hr.employees e where e.empid not in
(select distinct o.empid from sales.orders o where o.orderdate >= '2016-05-01');


-- Desired output:
empid       FirstName  lastname
----------- ---------- --------------------
3           Judy       Lew
5           Sven       Mortensen
6           Paul       Suurs
9           Patricia   Doyle

(4 row(s) affected)

