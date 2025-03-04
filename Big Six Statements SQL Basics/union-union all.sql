#UNIONS are used to combine rows of data together- JOINS combine columns next to each other from tables with a common ID column
#ideally UNIONS are used to put together the same data type, although is possible to do otherwise 
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT occupation, salary
FROM employee_salary;

#data combined together but not side by side in different columns, but one on top of the other in the same columns
#not ideal but it's possible to do 
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;

#union is shorthand for Union Distinct so it gets rid off duplicates 
SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

#use UNION ALL to show all values
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

#The Parks department is trying to cut their budget and wants to identify older employees 
#they can push out or high paid employees who they can reduce pay or push out
SELECT first_name, last_name, 'Old male worker'
FROM employee_demographics
WHERE age > 50;

SELECT first_name, last_name, 'Old female worker' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Old Man'
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Highly Paid Employee'
FROM employee_salary
WHERE salary >= 70000
ORDER BY first_name;
