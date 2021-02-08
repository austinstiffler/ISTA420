# T-SQL Chapter 4 Homework
## Austin Stiffler
### 01 February, 2021


1. A *subquery* is a query within a query.

1. A *self-contained subquery* has no dependancy on the tables from the outer query that it's inside. It can run by itself.

1. A *correlated subquery* depends on the tables from the outer query that it's embedded in. It cannot run by itself. Test by supplying a value for the predicate.

1. A scalar subquery returns a single value. You could use this to find information about the order that has the max order ID in the table by storing that result
in a variable, for example.

1. A multivalued subquery returns multiple values. You could use this to return orders placed by employees with a last name starting with 'D', for example.

1. A table valued subquery returns a set from table values. Select * from table, for example.

1. The *exists* predicate accepts a subquery as input and returns *TRUE* if the subquery returns any rows and *FALSE* otherwise.

1. Using the *NOT* operator will negate a predicate. For example, it reverses the *TRUE* value.

1. It will return two values; *TRUE* or *FALSE*.

1. (SELECT SUMM(02.qty) FROM Sales.OrderTotalsByYear AS 02 WHERE 02.orderyear <= 01.orderyear)