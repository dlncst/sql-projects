#LIMIT and ALIASING
#Limit is just going to specify the number of rows in the output
SELECT * FROM parks_and_recreation.employee_demographics LIMIT 3;

SELECT * FROM parks_and_recreation.employee_demographics ORDER BY first_name LIMIT 3;

#there is an additional paramater in limit to specify the starting place

SELECT * FROM parks_and_recreation.employee_demographics ORDER BY first_name;

SELECT * FROM parks_and_recreation.employee_demographics ORDER BY first_name LIMIT 3,2;

#previous line start at position 3 and take 2 rows after that, this isn't used much but exists
#select the third oldest person by doing this:
SELECT * FROM parks_and_recreation.employee_demographics ORDER BY age desc;

SELECT * FROM parks_and_recreation.employee_demographics ORDER BY age desc LIMIT 2,1;

#ALIASING is just a way to change the name of the column (for the most part) in the output but not the actual table, it can also be used in joins which is more advanced
SELECT gender, AVG(age) FROM parks_and_recreation.employee_demographics GROUP BY gender;

#use the keyword AS to specify we are using an Alias
SELECT gender, AVG(age) AS Avg_age FROM parks_and_recreation.employee_demographics GROUP BY gender;

SELECT gender, AVG(age) Avg_age FROM parks_and_recreation.employee_demographics GROUP BY gender;