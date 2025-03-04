#Having vs Where, used to filter rows of data
#Where is going to filters rows based off columns of data
#Having is going to filter rows based off aggregated columns when grouped

SELECT gender, AVG(age) FROM parks_and_recreation.employee_demographics GROUP BY gender;

#WHERE example that does not work
SELECT gender, AVG(age) FROM parks_and_recreation.employee_demographics WHERE AVG(age) > 40 GROUP BY gender;

#WHERE correct use
SELECT gender, AVG(age) FROM parks_and_recreation.employee_demographics GROUP BY gender HAVING AVG(age) > 40;

SELECT gender, AVG(age) as AVG_age FROM parks_and_recreation.employee_demographics GROUP BY gender HAVING AVG_age > 40;