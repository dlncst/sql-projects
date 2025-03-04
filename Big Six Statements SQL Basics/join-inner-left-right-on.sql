#joins allow to combine 2 tables together (or more) if they have a common column
#doesn't mean they need the same column name, but the data in it are the same and can be used to join the tables together
#there are several joins: inner joins, outer joins, and self joins
SELECT * FROM parks_and_recreation.employee_demographics;

SELECT * FROM parks_and_recreation.employee_salary;

#inner joins return rows that are the same in both columns
#since we have the same columns we need to specify which table they're coming from
#employee_demographics and employee_salary share the employee_id column as keys so they can be joined 
SELECT * FROM parks_and_recreation.employee_demographics JOIN parks_and_recreation.employee_salary 
ON parks_and_recreation.employee_demographics.employee_id = parks_and_recreation.employee_salary.employee_id;

#Ron Swanson isn't in the results because he doesn't have an employee id in the demographics table 

#ALIASING changes the name of the column in the output without modifying the tables 
SELECT * FROM parks_and_recreation.employee_demographics dem INNER JOIN parks_and_recreation.employee_salary sal ON dem.employee_id = sal.employee_id;

#OUTER JOINS have a left and a right join, left join will take everything from the left table even if there is no match in the join, but will only return matches from the right table
#the exact opposite is true for a right join
SELECT * FROM parks_and_recreation.employee_salary sal LEFT JOIN parks_and_recreation.employee_demographics dem ON dem.employee_id = sal.employee_id;

#since there is not match on the right table it's just all Nulls
#if we just switch this to a right join it basically just looks like an inner join
#that's because we are taking everything from the demographics table and only matches from the left or salary table. Since they have all the matches

SELECT *
FROM employee_salary sal
RIGHT JOIN employee_demographics dem
	ON dem.employee_id = sal.employee_id;

#self join is where you tie a table to itself
SELECT *
FROM employee_salary;

#using the secret santa example to self join the same table to randomly assign a secret santa
SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id = emp2.employee_id;

SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1  = emp2.employee_id;
    
SELECT emp1.employee_id as emp_santa, emp1.first_name as santa_first_name, emp1.last_name as santa_last_name, emp2.employee_id, emp2.first_name, emp2.last_name
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1  = emp2.employee_id;

#joining multiple tables
SELECT * 
FROM parks_and_recreation.parks_departments;

SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
JOIN parks_departments dept
	ON dept.department_id = sal.dept_id;

#since it's an inner join it got rid of andy because he wasn't a part of any department
#if we do a left join we would still include him because we are taking everything from the left table which is the salary table in this instance
SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
LEFT JOIN parks_departments dept
	ON dept.department_id = sal.dept_id;