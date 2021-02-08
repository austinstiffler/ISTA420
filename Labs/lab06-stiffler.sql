--Name: Austin Stiffler
--File: lab06-stiffler.sql
--Date: 08 February, 2021

use TSQLV4;

-- 1. Find employee ID's who had orders in both January, 2016 AND February, 2016.

select o.empid, o.orderdate from sales.orders o where o.orderdate like '2016-01-%'
intersect
select o1.empid, o1.orderdate from sales.orders o1 where o1.orderdate like '2016-02-%';

-- 2. Find employee ID's who had orders in either January, 2016 OR February, 2016.

select o.empid from sales.orders o where o.orderdate like '2016-01-%'
union
select o1.empid from sales.orders o1 where o1.orderdate like '2016-02-%';

-- 3. Find employee ID's who had orders in January, 2016 but not February, 2016.

select o.empid, o.orderdate from sales.orders o where o.orderdate like '2016-01-%'
except
select o1.empid, o1.orderdate from sales.orders o1 where o1.orderdate like '2016-02-%';

select o.empid from sales.orders o where year(o.orderdate) = 2016
except
select o1.empid from sales.orders o1 where year(o1.orderdate) = 2014;

-- 4. Cities and countries where we have both customers and employees.

select e.city, e.country from hr.employees e
intersect
select c.city, c.country from sales.customers c;

-- 5. Cities and countries where we have either customers or employees.

select e.city, e.country from hr.employees e
	union
select c.city, c.country from sales.customers c;

-- 6. Cities and countries where we have either customers but not employees.

select c.city, c.country from sales.customers c
	except
select e.city, e.country from hr.employees e;

-- 7. Cities and countries where we have either employees but not customers.

select e.city, e.country from hr.employees e
	except
select c.city, c.country from sales.customers c;

-- 8. Cities and countries where we have either employees but not customers and
-- cities and countries where we have customers but not employees.

(select e.city, e.country from hr.employees e
	except
select c.city, c.country from sales.customers c)
	union
(select c.city, c.country from sales.customers c
	except
select e.city, e.country from hr.employees e);
