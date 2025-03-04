# triggers are blocks of code that executes automatically when an event takes place in a table
# for example we have these 2 tables, invoice and payments - when a client makes a payment it needs to update the invoice field "total paid"
# to reflect that the client has indeed paid their invoice

SELECT * FROM employee_salary;

SELECT * FROM employee_demographics;
 
USE parks_and_recreation;

#syntaxis 
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW    
BEGIN
    INSERT INTO employee_demographics (employee_id, first_name, last_name) 
    VALUES (NEW.employee_id,NEW.first_name,NEW.last_name);
END $$
DELIMITER ;

    # we can also do BEFORE, but for this example we have to do after
    # now this means this trigger gets activated for each row that is inserted. Some sql databses like MSSQL have batch triggers or table level triggers that
    # only trigger once, but MySQL doesn't have this functionality unfortunately
    # now we can write our block of code that we want to run when this is triggered
# we want to update our client invoices table
# and set the total paid = total_paid (if they had already made some payments) + NEW.amount_paid
# NEW says only from the new rows that were inserted. There is also OLD which is rows that were deleted or updated, but for us we want NEW

# insert a payment into the payments table and see if it updates in the Invoice table

#add the values that we want to insert - let's pay off this invoice 3 in full
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Daniel', 'Mendez', 'Data Scientist', 100000, NULL);
-- now it was updated in the payments table and the trigger was triggered and update the corresponding values in the invoice table

DELETE FROM employee_salary
WHERE employee_id = 13;

# Events or also called Jobs are tasks or blocks of code that get executed according to a schedule.  
# for example import/export data, cheduling reports to be exported to files and so many other things at a specified data/time
# this really helps with automation in MySQL

# let's say Parks and Rec has a policy that anyone over the age of 60 is immediately retired with lifetime pay
# so the employee is deleted from the demographics table

SELECT * 
FROM parks_and_recreation.employee_demographics;

SHOW EVENTS;

# can drop or alter these events like this:
DROP EVENT IF EXISTS delete_retirees;
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO BEGIN
	DELETE
	FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$

# if we run it again you can see Jerry is now fired -- or I mean retired
SELECT * 
FROM parks_and_recreation.employee_demographics;

SHOW VARIABLES LIKE 'event%';

# deactivate safe updates so events can auto delete rows 