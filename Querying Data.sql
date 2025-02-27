USE Employee;
-- DISTINCT --
SELECT DISTINCT Salary
FROM Employees;

-- Alias --
SELECT age AS Employee_age FROM Employees;
SELECT salary Employee_salary FROM Employees;

-- WHERE Clause --
SELECT employee_id, employee_name, salary, (salary * 1.1) AS net_salary
FROM employees;

SELECT employee_id, employee_name, salary, hire_date FROM employees
WHERE salary > '50000' AND hire_date < '2016-01-01';

SELECT employee_id, employee_name, designation FROM employees
WHERE designation IN('Data Analyst', 'Data Scientist');

-- Other Operators --
SELECT*FROM employees;
UPDATE employees SET designation = 'data scientist'
WHERE designation IS NULL;
SELECT*FROM employees;

SELECT*FROM employees 
WHERE designation IN('data scientist');

SELECT*FROM employees
WHERE department_id IN(1, 3, 4, 9, 12);

SELECT*FROM employees
WHERE salary NOT BETWEEN'50000' AND '80000';

SELECT*FROM Employees
WHERE employee_name LIKE'A%' OR
employee_name LIKE'e%' OR 
employee_name LIKE'i%' OR
employee_name LIKE'o%' OR 
employee_name LIKE'u%';

SELECT*FROM employees 
WHERE employee_name LIKE'_SH%';

-- SORTING AND GROUPING DATA --
-- ORDER BY -- 
SELECT*FROM employees WHERE hire_date > '2019-01-01'
ORDER BY hire_date ASC;

SELECT*FROM employees 
ORDER BY department_id ASC, salary DESC;

-- LIMIT --
SELECT*FROM employees ORDER BY salary DESC
LIMIT 10;

SELECT*FROM employees WHERE YEAR(hire_date) = '2018'
ORDER BY hire_date ASC LIMIT 5;

-- AGGREGATE Function --
SELECT*FROM departments;

SELECT SUM(salary) AS Total_Salary FROM employees WHERE department_id = '2';

SELECT MIN(age) AS Min_age FROM employees;

-- GROUP BY --
SELECT*FROM employees;
 
SELECT location_id, MAX(Salary) AS Max_salary
FROM employees
GROUP BY Location_id;

SELECT designation, AVG(salary) AS Avg_salary
FROM employees
WHERE designation LIKE'%Analyst%'
GROUP BY Designation;

-- HAVING Clause --
SELECT department_id, COUNT(*) AS department_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) < 3;

SELECT Location_id, AVG(age) AS Avg_age
FROM employees
WHERE gender = 'f'
GROUP BY Location_id
HAVING AVG(age) < 30;
