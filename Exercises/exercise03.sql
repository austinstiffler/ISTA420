.echo on
.headers on

-- Name: Austin Stiffler
-- File: exercise03.sql
-- Date: 29 January, 2021


--  1. First, I need the customer ID, the customer contact name, the employee
-- ID, the employee name, the order ID, the number of orders, and the total amount of each order, where
-- the customer/employee pair has produced five or more orders between them, ordered by the dollar
-- amount of the order from highest to lowest. The output needs to be in a comma separated format
-- with strings that include spaces and commas delimited by double quotes. The dollar amount should
-- be formatted as a decimal number with two decimal places. 

.mode csv

select c.customerid, c.contactname, e.employeeid, e.firstname || ' ' || e.lastname as emp_name, o.orderid, 
count(o.orderid) as num_orders, printf("%.2f",sum(od.unitprice * od.quantity)) as order_total from customers c join orders o on c.customerid = o.customerid 
join employees e  on o.employeeid = e.employeeid join order_details od on  o.orderid = od.orderid group by c.customerid, e.employeeid, o.orderid 
having count(o.orderid) >= 5  order by order_total desc;

-- 2. Second, I want the least productive pairs with the same columns. The total of orders should be less
-- than three, the dollar amount of the order is less than $50.00, and the orders are ranked by increasing
-- dollar amounts, starting with the least order.

 select c.customerid, c.contactname, e.employeeid, e.firstname || ' ' || e.lastname as emp_name, o.orderid, count(o.orderid) 
 as num_orders, printf("%.2f",sum(od.unitprice * od.quantity)) as order_total from customers c join orders o on c.customerid = o.customerid join employees e 
 on o.employeeid = e.employeeid join order_details od on  o.orderid = od.orderid group by c.customerid, e.employeeid, o.orderid having count(o.orderid) < 3 
 and sum(od.unitprice * od.quantity) < 50 order by order_total;
 
-- 3. Third, I need the most productive pairs as in the first report above, omitting the order ID but ranked
-- by the average amount from highest to lowest of all orders by the customer/employee pair. Include
-- only pairs where the amount of the average exceeds $2,500.00.

select c.customerid, c.contactname, e.employeeid, e.firstname || ' ' || e.lastname as emp_name, count(o.orderid) 
as num_orders, printf("%.2f",avg(od.unitprice * od.quantity)) as order_avg from customers c join orders o on c.customerid = o.customerid join employees e 
on o.employeeid = e.employeeid join order_details od on  o.orderid = od.orderid group by c.customerid, e.employeeid, o.orderid having avg(od.unitprice * od.quantity) > 2500 
order by order_avg desc;

-- 4.Finally, I need the least productive pairs as ranked by average order amount, from lowest to highest,
-- formatted as above. Omit the order ID. Include only pairs where the average order amount is less than
-- $50.00. 

select c.customerid, c.contactname, e.employeeid, e.firstname || ' ' || e.lastname as emp_name, 
count(o.orderid) as num_orders, printf("%.2f",avg(od.unitprice * od.quantity)) as order_avg from customers c join orders o on c.customerid = o.customerid 
join employees e on o.employeeid = e.employeeid join order_details od on  o.orderid = od.orderid 
group by c.customerid, e.employeeid, o.orderid having avg(od.unitprice * od.quantity) < 50 order by order_avg;

-- 5. Please create a report with the order ID, the customer ID, the customer name, the customer country,
-- and the dollar amount of the order, sorted alphabetically by country and numerically from highest to
-- lowest by the dollar amount of the order, where the order total exceeds $5,000.00.

select o.orderid, c.customerid, c.companyname, c.country, printf("%.2f",sum(od.unitprice * od.quantity)) as total_order from orders o join customers c 
on o.customerid = c.customerid join order_details od on o.orderid = od.orderid group by o.orderid having sum(od.unitprice * od.quantity) > 5000 
order by c.country, total_order desc;

-- 6. I want to know the unique (distinct) cities, regions, and postal codes: (a) where we have both customers
-- and employees, (b) where we have customers but no employees AND both customers and employees,
-- and (c) where we have employees but no customers AND both customers and employees. Write three
-- queries, using inner and outer joins. Report the results of the queries. There is no need for any further
-- reporting.

.mode list

-- a.

select distinct c.city as c_city, c.region as c_region, c.postalcode as c_postalcode, e.city as e_city, e.region as e_region, e.postalcode as e_postalcode 
from employees e join customers c on c.city = e.city and c.region = e.region and c.postalcode = e.postalcode;

-- b.

select distinct c.city as c_city, c.region as c_region, c.postalcode as c_postalcode, e.city as e_city, e.region as e_region, e.postalcode 
as e_postalcode from customers c outer left join employees e on c.city = e.city and c.region = e.region and c.postalcode = e.postalcode;

-- c.

 select distinct c.city as c_city, c.region as c_region, c.postalcode as c_postalcode, e.city as e_city, e.region as e_region, e.postalcode as e_postalcode 
 from employees e outer left join customers c on c.city = e.city and c.region = e.region and c.postalcode = e.postalcode;