USE Employee;
/* 
   Subqueries
*/

Desc Employees;
Desc Location;
Desc Departments;

-- Single-Row Subqueries --

SELECT * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT * FROM employees 
WHERE salary = (SELECT MAX(salary) FROM employees);

SELECT * FROM employees 
WHERE department_id = (SELECT department_id FROM employees WHERE Employee_name = 'Arjun Kumar');

-- Multi-Row Subqueries --

SELECT * FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE department_name LIKE '%Development%');

/*
	Stored Procedure
*/
-- Stored Procedure with IN Parameter: 

DELIMITER //
CREATE PROCEDURE GetEmployeesByDepartmentName(IN dept_name VARCHAR(100))
BEGIN
    SELECT * FROM employees 
    WHERE department_id IN (SELECT department_id FROM departments WHERE department_name = dept_name);
END //
DELIMITER ;

-- Function call:
CALL GetEmployeesByDepartmentName('IT');
CALL GetEmployeesByDepartmentName('Human Resources');

-- Stored Procedure with OUT Parameter --

DELIMITER $$
CREATE PROCEDURE FindEmployeeBirthYearByID(
    IN emp_id INT,
    OUT birth_year INT
)
BEGIN
    SELECT (YEAR(CURDATE()) - age) INTO birth_year
    FROM employees
    WHERE employee_id = emp_id;
END $$
DELIMITER ;

-- Fuction call
CALL FindEmployeeBirthYearByID(5004, @birth_year);
SELECT @birth_year;

CALL FindEmployeeBirthYearByID(5018, @birth_year);
SELECT @birth_year;


/* USING INOUT FUNCTION
DELIMITER $$
CREATE PROCEDURE FindEmployeeBirthYearByID(
    INOUT emp_id INT, 
    INOUT birth_year INT
)
BEGIN
    SELECT (YEAR(CURDATE()) - age) INTO birth_year
    FROM employees
    WHERE employee_id = emp_id;
END $$
DELIMITER ;
 
 -- FUNTION CALL OF THE INOUT FUNCIOTN
 SET @emp_id = 5004;
SET @birth_year = 0;
CALL FindEmployeeBirthYearByID(@emp_id, @birth_year);
SELECT @emp_id AS employee_id, @birth_year AS birth_year;

SET @emp_id = 5018;
CALL FindEmployeeBirthYearByID(@emp_id, @birth_year);
SELECT @emp_id AS employee_id, @birth_year AS birth_year;

SET @emp_id = 5029;
CALL FindEmployeeBirthYearByID(@emp_id, @birth_year);
SELECT @emp_id AS employee_id, @birth_year AS birth_year;
*/
