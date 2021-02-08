TSQL-HW01

1. Declarative language requires you to specify what you want to get and not how to get it, letting RDBMS figure out how to process your request.
   In imperative language, you are telling the computer what you want it to do.

2. The 3 categories of command statements in SQL are Data Definition Language (DDL), Data Manipulation Language (DML), Data Control Language (DCL).

3. A "relational database management system" (RDBMS) is a database management system based on the relational model.
   A "Human Resources database" would be a container of objects involving human resources.
   
4. Minimal or no reduncancy and completeness would mean you want to have all necessary data while maximizing performance.
   You do not want repeated information in a database. You don't want to miss any data.

5. Two-Valued logic is simply a true/false predicate. 
   Three-valued logic includes true/false/unknown. 
   Four-valued logic also includes true/false/unknown, but unknown is branched into either "applicable" or "not applicable".
   SQL implements three-value by using the NULL marker to signify missing values.
   
6. SQL enforces entity integrity using canditate keys, preventing more than one occurrence of the same row in a table.

7. SQL enforces referential integrity usilng foreign keys, restricting foreign-key attributes to the values that appear in the referenced table's candidate-key attributes.

8. A set.

9. (a) A single entity that is a collection of unordered, unique objects.
   (b) A property in the relational model that is either true or false.  An evaluation of a predicate determines the value of the proposition.
   (c) Selection is giving specific conditions to select a subset of rows. Think "horizontal" (rows).
       Projection will remove all attributes except those mentioned. Think "vertical" (columns).
	   
10. No. The facCreds' column contains multiple attributes in each row. I would separate the attributes into different rows.

11. No. Must split Owner and Pet into 2 tables, invoking the ownerID.

12. No. There is transitive dependancy. City and state depend on the zip code.

13. The components of a four-part object name are Schema-qualified object name, database name, instance name

14. Declarative data integrity is enforced as part of a model. Procedural data intgegrity is enforced by code stored with procedures or triggers.