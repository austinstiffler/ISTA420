# TSQL Homework 02b
## Austin Stiffler
### 19 January, 2021

1. * A *data type* is an attribute that specifies the type of data that the object can hold. 
   * Data types are necessary in order to avoid improper query optimization or performance issues.

1. * A *collation* is a property of character data that encapsulates several aspects: language support, sort order, case sensitivity, accent sensitivity, and more.
   * The four elements of a collation are: instance, database, column, and expression.
   
1. The *RTRIM*, *LTRIM* or *TRIM* functions return the input string with leading or trailing spaces removed.

1. SELECT * FROM College WHERE CollegeName LIKE '%Institute%'. 

1. To find the index of the first space in a string, you would use the *CHARINDEX* function. For example: SELECT CHARINDEX(' ','Barack Hussein Obama');

1. SELECT SUBSTRING(Name, 0, CHARINDEX(' ', Name, 0)) AS FirstName FROM Employee;

1. The order of precedence for the logical operators are: *NOT*, *AND*, *OR*.

1. The order of precedence for the math operators are: Multiplication, division, modulo, addition, subtraction.

1. * The simple *CASE* form is based on a literal value.
   * The searched *CASE* form is based on an expression. 
   
1. SELECT SUBSTR('LASTNAME, FIRSTNAME', INSTR('LASTNAME, FIRSTNAME', ' ')+1) || ' ' || SUBSTR('LASTNAME, FIRSTNAME', INSTR('LASTNAME, FIRSTNAME', ',')-1);
1. SELECT SUBSTR('FIRSTNAME LASTNAME', INSTR('FIRSTNAME LASTNAME', ' ')+1) || ',' || SUBSTR('FIRSTNAME LASTNAME', 1, INSTR('FIRSTNAME LASTNAME', ' '));