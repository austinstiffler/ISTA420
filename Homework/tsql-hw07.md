# T-SQL Homework Chapter 7
## Austin Stiffler
### 08 February, 2021


1. A *window function* is a function that, for each row, computes a scalar result value based on a calculation
against a subset of the rows from the underlying query.

1. *PARTITION* restricts the window to the subset of rows that have the same values in the partitioning columns 
as in the current row. 

1. *ORDER BY* defines ordering within a partition.

1. *ROWS BETWEEN* filters a frame, or a subset, of rows from the window partition between the two specified delimiters. 

1. 
	* *Ranking window functions* rank each row with respect to others in the window.
	* You would use this to apply a rank to a table with specific order.

1. 
	* *Offset window functions*  return an element from a row that is at a certain offset from the
current row or at the beginning or end of a window frame.
	* You would use this to return data from other rows based on their distance away from the current row.
	
1. 
	* The *LAG* and *LEAD* functions support window partitions and window order clauses. 
	*  The *LAG* function looks before the current row, and the *LEAD* function looks ahead. 
	
1. You use the *FIRST_VALUE* and *LAST_VALUE* functions to return an element from the first and last
rows in the window frame, respectively.

1. 
	* You use aggregate window functions to aggregate the rows in the defined window.
	* You could use an aggregate window function to find an average of attribute value.
	
1. A pivot table involves rotating data from a state of rows to a state of columns, possibly aggregating
values along the way.

1. 
	* A *power set* is the set of all subsets of elements that can be produced from a particular set.
	* It relates to *grouping set* because you are still defining multiple sets in the same query.
	
1. A *bit array* is an array data structure that compactly stores bits. It can be used to implement a simple set
data structure.

1. Set permissions to *myscript.sql* to "read, write, and execute by owner" and "read and execute by the group
and everyone else".