USE EMPLOYEE;

-- Before Insert trigger --

DELIMITER //
CREATE TRIGGER before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary IS NULL THEN
        SET NEW.salary = (SELECT AVG(salary) FROM employees);
    END IF;
END;
//
DELIMITER ;

INSERT INTO employees (Employee_name, department_id , Hire_date) VALUES ('Jackline', '6', '2024-02-01');
SELECT * FROM employees WHERE Employee_name = 'Jackline';
 -- It throws error, Since the Employee ID doeesn't have a Default value.

ALTER TABLE employees MODIFY Employee_ID INT AUTO_INCREMENT; 
-- Altered the table in order to make Employee_ID to have a default values

INSERT INTO employees (Employee_name, department_id , Hire_date) VALUES ('Jackline', '6', '2024-02-01');
SELECT * FROM employees WHERE Employee_name = 'Jackline'

-- After Trigger --

DELIMITER //
CREATE TRIGGER after_delete_employee
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    IF YEAR(OLD.Hire_date) = (SELECT MAX(YEAR(Hire_date)) FROM employees) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete employees who joined in the most recent year';
    END IF;
END; //
DELIMITER ;

DELETE FROM employees WHERE Employee_name = 'Jackline'; 