/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 8

*******************************************************************************
*******************************************************************************

In the exercises below you might need to use the any of the clauses learned so 
far.

*/

USE publications;

/* 1. Select the top 5 orders with most quantity sold between 1993-03-11 and
    1994-09-13 from the table sales */

SELECT qty
FROM sales
WHERE ord_date BETWEEN '1993-03-11' AND '1994-09-13'
ORDER BY qty DESC
LIMIT 5;


/* 2. How many authors have an "i" in their first name, are from Utah,
   Maryland, or Kansas? */

SELECT  state
FROM authors;
WHERE IN state ('CA','MD','CA'),
         au_lname '%i%';


/* 3. In California, how many authors are there in cities that contain an "o"
   in the name?
   - Show only results for cities with more than 1 author.
   - Sort the cities ascendingly by author count.
*/


