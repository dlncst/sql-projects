# stored procedures work in a similar way to measures in power BI which are dax formulas that are isolated to be used later on for isolated calculations
# syntax
SELECT *
FROM employee_salary
WHERE salary >= 60000;

# add this into a stored procedure.
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 60000;

# refresh and see that it is there
# call the stored procedure:
CALL large_salaries();

#if tried to add another query to this stored procedure it wouldn't work. It's a separate query:
CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;

#best practice is to use a delimiter and a Begin and End to really control what's in the stored procedure
#the delimiter is what separates the queries by default
#when we change this delimiter it now reads in everything as one whole unit or query instead of stopping
#after the first semi colon
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$
DELIMITER ;

# change the delimiter back after we use it to make it default again
# let's refresh to see the SP
# now we can run this stored procedure
CALL large_salaries3();

# create a stored procedure by right clicking on Stored Procedures and creating one:
# it's going to drop the procedure if it already exists.
USE `parks_and_recreation`;
DROP procedure IF EXISTS `large_salaries3`;
# it automatically adds the dilimiter
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$

DELIMITER ;

CALL large_order_totals3();
-- -------------------------------------------------------------------------
## add parameters
USE `parks_and_recreation`;
DROP procedure IF EXISTS `large_salaries4`;
# it automatically adds the dilimiter for us
DELIMITER $$
CREATE PROCEDURE large_salaries4(employee_id_param INT)
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE employee_id = employee_id_param
    ;
END $$
DELIMITER ;

CALL large_salaries4(1);