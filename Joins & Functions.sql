USE Employee;

-- INNER JOIN
SELECT e.employee_name, e.designation, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- LEFT JOIN
SELECT d.department_name, COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- RIGHT JOIN
SELECT l.Location_ID, e.employee_name
FROM location l
RIGHT JOIN employees e ON l.location_id = e.location_id;

-- Built-in Numeric Functions:

SELECT ROUND(AVG(age)) AS average_age FROM employees;
 
SELECT *, CEIL(SQRT(salary)) AS bonus FROM employees;

-- Built-in String Functions

SELECT SUBSTRING(location, 1, 3) AS short_location FROM location;

SELECT CONCAT(employee_name, ' - ', designation) AS name_with_designation FROM employees;

-- Built-in Date Time Functions

SELECT YEAR(hire_date) AS hire_year FROM employees;

SELECT employee_name, DATEDIFF(CURDATE(), hire_date) AS days_worked FROM employees;

SELECT DATE_FORMAT(hire_date, '%d-%m-%Y') AS formatted_hire_date FROM Employees;

SELECT employee_name, DATE_ADD(hire_date, INTERVAL 3 MONTH) AS employment_confirmation_date FROM employees;

-- User-defined Functions:

DELIMITER $$
CREATE FUNCTION get_employee_count_by_location(location VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*) INTO emp_count 
    FROM employees e
    WHERE l.location = location;
    RETURN emp_count;
END $$
DELIMITER ;

SELECT get_employee_count_by_location('Bangalore') AS Bangalore_Count;
SELECT get_employee_count_by_location('Hyderabad') AS Hyderabad_Count;
