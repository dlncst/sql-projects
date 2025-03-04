#GROUP BY
SELECT * FROM parks_and_recreation.employee_demographics;

SELECT gender FROM parks_and_recreation.employee_demographics GROUP BY gender;

SELECT gender FROM parks_and_recreation.employee_demographics GROUP BY gender;

SELECT first_name FROM parks_and_recreation.employee_demographics GROUP BY gender ;

SELECT gender, AVG(age) FROM parks_and_recreation.employee_demographics GROUP BY gender;

SELECT occupation FROM parks_and_recreation.employee_salary GROUP BY occupation;

SELECT occupation, salary FROM parks_and_recreation.employee_salary GROUP BY occupation, salary;

SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age) FROM parks_and_recreation.employee_demographics GROUP BY gender;

#ORDER BY 
SELECT * FROM customers ORDER BY first_name;

SELECT * FROM parks_and_recreation.employee_demographics;

#order by it goes a to z by default (ascending order)
SELECT * FROM parks_and_recreation.employee_demographics ORDER BY first_name;

#manually change the order using desc
SELECT * FROM parks_and_recreation.employee_demographics ORDER BY first_name DESC;

SELECT * FROM parks_and_recreation.employee_demographics ORDER BY gender, age;

SELECT * FROM parks_and_recreation.employee_demographics ORDER BY gender DESC, age DESC;

SELECT * FROM parks_and_recreation.employee_demographics ORDER BY 5 DESC, 4 DESC;