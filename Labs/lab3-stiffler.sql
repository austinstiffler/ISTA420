.echo on
.headers on

-- Name: Austin Stiffler
-- File: lab3-stiffler.sql
-- Date: 26 January, 2021

-- 1. What is the order number and the date of each order sold by each employee?
select e.employeeid, e.titleofcourtesy, e.firstname, e.lastname, o.orderid, o.orderdate from employees as e inner join orders as o on e.employeeid = o.employeeid;

-- 2. List each territory by region.
select t.territoryid, t.territorydescription, t.regionid, r.regionid, r.regiondescription from territories as t inner join region r on t.regionid = r.regionid order by r.regiondescription, t.territorydescription;

-- 3. What is the supplier name for each product alphabetically by supplier?
select s.supplierid, s.companyname, s.contactname, p.productid, p.productname from suppliers as s inner join products as p on s.supplierid = p.supplierid order by s.companyname;

-- 4. For every order on May 5, 1998, how many of each item was ordered, and what was the price of the item?
select o.orderid, o.orderdate, od.orderid, od.productid, p.unitprice, od.quantity, p.productid, p.productname from orders o join order_details od on o.orderid = od.orderid join products p on od.productid = p.productid where o.orderdate = '1998-05-05';

-- 5. For every order on May 5, 1998, how many of each item was ordered giving the name of the item, and what was the price of the item?


-- 6. For every order in May, 1998, what was the customer’s name and the shipper’s name?
 select o.orderid, o.orderdate, o.customerid, c.customerid, c.companyname, o.shipperid, s.shipperid, s.companyname from orders o join customers c on o.customerid = c.customerid join shippers s on o.shipperid = s.shipperid where o.orderdate like '1998-05-%';

-- 7. What is the customer’s name and the employee’s name for every order shipped to France?


-- 8. List the products by name that were shipped to Germany.
