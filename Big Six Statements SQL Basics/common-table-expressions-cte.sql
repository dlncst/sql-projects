# Common Table Expressions (CTE) allows to define a subquery block that can be referenced within the main query. 
# It is particularly useful for recursive queries or queries that require referencing a higher level
# very similar to using measure in Power BI or functions inside functions in python

# First, CTEs start using a "With" Keyword then definining the name followed by AS 
# and within the parenthesis the subquery/table 
WITH CTE_Example AS 
(
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary), AVG(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example;

# directly after using it we can query the CTE, however if calling the CTE later on it will not work because the CTE is not saved as a table, rather as a temporary expression 
# the following will not work:
SELECT *
FROM CTE_Example;

# Now we can use the columns within this CTE to do calculations on this data that
# we couldn't have done without it.
WITH CTE_Example AS 
(
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
# notice here the use of back ticks to specify the table names  - without them it doesn't work
SELECT gender, ROUND(AVG(`SUM(salary)`/`COUNT(salary)`),2)
FROM CTE_Example
GROUP BY gender;

# we also have the ability to create multiple CTEs with just one With Expression
WITH CTE_Example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics dem
WHERE birth_date > '1985-01-01'
), -- just have to separate by using a comma
CTE_Example2 AS 
(
SELECT employee_id, salary
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
)

#join these two CTEs together
SELECT *
FROM CTE_Example cte1
LEFT JOIN CTE_Example2 cte2
	ON cte1. employee_id = cte2. employee_id;

# we can actually make tha tables easier to read and understand by renaming the columns in the CTE instead of using tick marks because of the column names
# we can rename them like this
WITH CTE_Example (gender, sum_salary, min_salary, max_salary, count_salary) AS 
(
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)

# notice here the use of back ticks to specify the table names  - without them it doesn't work
SELECT gender, ROUND(AVG(sum_salary/count_salary),2)
FROM CTE_Example
GROUP BY gender;