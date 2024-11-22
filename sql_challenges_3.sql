/*
*******************************************************************************
*******************************************************************************

SQL CHALLENGES 3

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses/operators:
	- ORDER BY
	- LIMIT
    - MIN(), MAX()
    - COUNT(), AVG(), SUM()

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with.
*/

USE publications;

/******************************************************************************
ORDER BY
******************************************************************************/
-- https://www.w3schools.com/sql/sql_orderby.asp

/* 1. Select the title and ytd_sales from the table titles. Order them by the
year to date sales. */

SELECT title, ytd_sales
FROM titles
ORDER BY ytd_sales;

-- 2. Repeat the same query, but this time sort the titles in descending order

SELECT title AS name_of_the_book, ytd_sales
FROM titles
ORDER BY ytd_sales DESC;

/******************************************************************************
LIMIT

https://www.w3schools.com/mysql/mysql_limit.asp
******************************************************************************/

-- 3. Select the top 5 titles with the most ytd_sales from the table titles

SELECT title, ytd_sales
FROM titles
ORDER BY ytd_sales DESC
LIMIT 5;

/******************************************************************************
MIN and MAX

https://www.w3schools.com/sql/sql_min_max.asp
******************************************************************************/

-- 4. What's the maximum amount of books ever sold in a single order?

SELECT MAX(qty)
FROM sales;

-- 5. What's the price of the cheapest book?

SELECT ROUND(MIN(price),2)
FROM titles;

/******************************************************************************
COUNT, AVG, and SUM

https://www.w3schools.com/sql/sql_count_avg_sum.asp

******************************************************************************/

 -- 6. How many rows are there in the table authors?

SELECT COUNT(*) AS total_authors
FROM authors;

 -- 7. What's the total amount of year-to-date sales?

SELECT SUM(ytd_sales)
FROM titles;

 -- 8. What's the average price of books?

SELECT ROUND(AVG(price),2)
FROM titles;

/* 9. In a single query, select the count, average and sum of quantity in the
table sales */

SELECT COUNT(qty), ROUND(AVG(qty),2), SUM(qty)
FROM sales;