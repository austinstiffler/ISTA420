.echo on
.headers on

-- Name: Austin Stiffler
-- File: SQL Programming Exercise 02
-- Date: January 21, 2021


-- 1. List the company name, the contact name and the country of all customers in Poland.
select CompanyName, ContactName, Country from customers where country like 'Poland';

-- 2. List the order Id, the order date, and the destination city of all orders shipped to Berlin.
select OrderID, OrderDate, shipCity from orders where shipcity like 'Berlin';

-- 3. How many boxes of Filo Mix do we have in stock?
select productID, productName, Unitsinstock from products where productname like "Filo Mix";

-- 4. List the telephone numbers of all of our shippers.
select CompanyName, phone from shippers;

-- 5. Who is our oldest employee? Who is our youngest employee?
select EmployeeID, Lastname, Firstname, Birthdate from employees order by birthdate asc;

-- 6. List the suppliers where the owner of the supplier is also the sales contact.
select supplierID, CompanyName, ContactName, ContactTitle from suppliers where contactTitle like 'Owner';

-- 7. Mailing Labels 
-- From the Northwind database we used in class and SQLite, create mailing labels for customer representatives. Each label should consist of six, and exactly six, lines. The mailing labels should be suitable for printing on sticky label paper, specifically Avery 8160 labels. The format should be as follows:
        --TITLE FIRSTNAME LASTNAME
        --COMPANYNAME
        --STREET ADDRESS
        --CITY STATE ZIP COUNTRY
        --[blank line]
		--[blank line]

		select contacttitle || ' ' || contactname || '
   ...> ' || companyname || '
   ...> ' || address || '
   ...> ' || city, postalcode, country || '
   ...> ' || ' ' || '
   ...> ' || ' ' from customers where contacttitle like 'sales representative';;

-- 8. Telephone BookFrom the Northwind database we used in class and SQLite, create a telephone book for customer representatives.
-- Each line in the telehone book should consist of the representative last name, representative First name, company name, and telephone number. Each row should look like this.
       -- Lastname, Firstname Middlename [tab] Company name [tab] phone number
	   select substr(contactname, instr(contactname, ' ')+1) || ',' || ' ' || substr(contactname, 1, instr(contactname, ' ')) || '     ' || companyname || '   ' || phone from customers;
	  