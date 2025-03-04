# Subqueries are queries within queries, same principle of nested functions python/javascript 
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

#Now let's say we wanted to look at employees who actually work in the Parks and Rec Department, we could join tables together or we could use a subquery
SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id
				FROM employee_salary
                WHERE dept_id = 1);
                
#erroneous query because subquery accepts only one column for this example
SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id, salary
				FROM employee_salary
                WHERE dept_id = 1);

#looking at the salaries and compare them to the average salary
SELECT first_name, salary, AVG(salary)
FROM employee_salary;
#this is not going to work, we are using columns with an aggregate function so we need to use group by

# we don't exactly get what we want
SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;

#it's giving us the average PER GROUP which we don't want
#here's a good use for a subquery
SELECT first_name, 
salary, 
(SELECT AVG(salary) 
	FROM employee_salary)
FROM employee_salary;

#we can also use it in the FROM Statement
#when we use it here it's almost like we are creating a small table we are querying off of
SELECT *
FROM (SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender) ;
#this doesn't work because we get an error saying we have to name it

SELECT gender, AVG(Min_age)
FROM (SELECT gender, MIN(age) Min_age, MAX(age) Max_age, COUNT(age) Count_age ,AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender) AS Agg_Table
GROUP BY gender;