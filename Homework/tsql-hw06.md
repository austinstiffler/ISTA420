# T-SQL Chapter 6 Homework
## Austin Stiffler
### 07 February, 2021


1. A *set operator* is an operator that combines rows from two query sets (or multisets).

1. The two rows have to have similar columns and be of similar type.

1. A *Venn diagram*, also called *primary diagram*, *set diagram* or *logic diagram*, 
is a diagram that shows all possible logical relations between a finite collection 
of different sets. These diagrams depict elements as points in the plane, and sets as 
regions inside closed curves.

1. The *UNION operator* unifies the results of two input queries. 

1. The *UNION ALL operator* unifies the two input query results without attempting to remove
duplicates from the result.

1. The *INTERSECT operator* returns only the rows that are common to the results of the 
two input queries.

1. If SQL made a *INTERSECT ALL operator*, it would return common rows without removing 
duplicate attributes.

1. The *EXCEPT operator* implements set differences. It operates on the results of two
input queries and returns rows that appear in the first input but not the second.

1. The *EXCEPT ALL operator* is similar to the *EXCEPT operator*, but it also takes into
the account the number of occurrences of each row.

1. *INTERSECT*, *UNION*, *EXCEPT*.

1. (A UNION B) EXCEPT (A INTERSECT B).