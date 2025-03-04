#Case Statements allow you to add logic to a Select Statement, works similar to 'if' 'else' statements in other programming languages
SELECT * 
FROM employee_demographics;

SELECT first_name, 
last_name, 
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age >= 30 THEN 'Adult'
END
FROM employee_demographics;

SELECT first_name, 
last_name, 
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Adult'
    WHEN age >= 50 THEN "Old"
END AS age_bracket
FROM employee_demographics;

#working with numbers, salary bonuses and increases 
SELECT * 
FROM employee_salary;

-- if employee make less than 45k then they get a 5% raise - very generous
-- if they make more than 45k they get a 7% raise
-- they get a bonus of 10% if they work for the Finance Department

SELECT first_name, last_name, salary,
CASE
	WHEN salary >= 45000 THEN salary + (salary * 0.05)
    WHEN salary <= 45000 THEN salary + (salary * 0.07)
END AS new_expected_salary
FROM employee_salary;

#calculation for Bonuses, make a new column
SELECT first_name, last_name, salary,
CASE
	WHEN salary >= 45000 THEN salary + (salary * 0.05)
    WHEN salary <= 45000 THEN salary + (salary * 0.07)
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary;
#ben is the only one who get's a bonus