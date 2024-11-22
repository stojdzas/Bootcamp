/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 7

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses:
    - GROUP BY
    - HAVING
------------------------------------------------------------------------------------------------

*/

USE publications;

/*******************************************************************************
GROUP BY

https://www.w3schools.com/sql/sql_groupby.asp
*******************************************************************************/

-- 1. Find the total amount of authors for each state

SELECT COUNT(au_id),state
FROM authors
GROUP BY state;


/* 2. Find the total amount of authors by each state and order them in 
    descending order */

SELECT COUNT(au_id) AS total_amount_of_authors, state
FROM authors
GROUP by state
ORDER BY total_amount_of_authors DESC;

-- 3. What's the price of the most expensive title from each publisher?

SELECT MAX(price), pub_id
FROM titles
GROUP BY pub_id;

-- 4. Find out the top 3 stores with the most sales

SELECT MAX(qty) AS max, stor_id
FROM sales
GROUP BY stor_id
ORDER BY max DESC
LIMIT 3;

/* 5. Find the average job level for each job_id from the employees table.
    Order the jobs in ascending order by its average job level. */

SELECT AVG(min_lvl) AS average_job_level, job_id
FROM jobs
GROUP BY job_id
ORDER BY average_job_level ASC;

/* 6. For each type (business, psychology…), find out how many books each
    publisher has. */

SELECT COUNT(*), pub_id
FROM titles
GROUP BY pub_id,type ;

/* 7. Add the average price of each publisher - book type combination from your
   previous query */

SELECT COUNT(*), pub_id, AVG(price)
FROM titles
GROUP BY pub_id,type ;

/*******************************************************************************
HAVING

https://www.w3schools.com/sql/sql_having.asp
*******************************************************************************/

/* 8. From your previous query, keep only the combinations of publisher - book
   type with an average price higher than 12 */

SELECT COUNT(*), pub_id, type
FROM titles
GROUP BY type, pub_id
HAVING AVG(price) > 12;

/* 9. Order the results of your previous query by these two criteria:
      1. Count of books, descendingly
      2. Average price, descendingly */

SELECT 
    pub_id, type, COUNT(*), AVG(price)
FROM
    titles
GROUP BY pub_id , type
HAVING AVG(price) > 12
ORDER BY 
	COUNT(*) DESC,
	AVG(price) DESC;


/* 10. Some authors have a contract, while others don't - it's indicated in the
     "contract" column of the authors table.
     
     Select all the states and cities where there are 2 or more contracts 
     overall */

SELECT SUM(contract), state
FROM authors
GROUP BY state, city
HAVING SUM(contract) > 2;


/* 
The main difference between WHERE and HAVING is that:
    - the WHERE clause is used to specify a condition for filtering most records
    - the HAVING clause is used to specify a condition for filtering values from 
      an aggregate (such as MAX(), AVG(), COUNT() etc...)
 */

