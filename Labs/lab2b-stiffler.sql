.echo on
.headers on

-- Name: Austin Stiffler
-- File: lab2b-stiffler.sql
-- Date: 20 January, 2021


-- 1. Who are our customers in North America?
select customerid, companyname, country from customers where country in('USA', 'Mexico', 'Canada');

-- 2. What orders were placed in April, 1998?
select orderid, orderdate from orders where orderdate like '%1998-04%';

-- 3. What sauces do we sell?
select productname, productid from products where productname like '%sauce%';

-- 4. You sell some kind of dried fruit that I liked very much. What is its name?
select productname, productid from products where productname like '%dried%';

-- 5. What employees ship products to Germany in December?
select employeeid, orderdate, shipcountry from orders where shipcountry like 'germany' and orderdate like '%-12-%';

-- 6. We have an issue with product 19. I need to know the total amount and the net amount of all orders for product 19 where the customer took a discount.
select orderid, productid, unitprice * quantity as TotalAmount, (unitprice * quantity) * (1 - discount) as NetPrice, discount from order_details where productid = 19 and discount > 0.0;

-- 7. I need a list of employees by title, first name, and last name, with the employee’s position under their names, and a line separating each employee.


-- 8. I need a list of our customers and the first name only of the customer representative.


-- 9. Give me a list of our customer contacts alphabetically by last name.


-- 10. ‘I need a report telling me the most common pairing of customers and employees with the greatest order volume (by the number of orders placed). Exclude pairings with minimal orders.


-- 11. I need a report listing the highest average selling product by product id. The average is determined by the total sales of each product id divided by the quantity of the product sold. Include only the highest 20 products.

