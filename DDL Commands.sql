CREATE DATABASE Employee;
USE Employee;

CREATE TABLE Departments (
department_id INT,
department_name VARCHAR(100)
);

CREATE TABLE Location (
location_id INT,
location VARCHAR(30)
);

CREATE TABLE Employees (
employee_id INT,
employee_name VARCHAR(50),
gender ENUM("M", "F"),
age INT,
hire_date DATE,
designation VARCHAR(100),
department_id INT,
location_id INT,
salary DECIMAL(10,2)
);

-- ALTER TABLE - ADD
ALTER TABLE Employees
Add COLUMN email VARCHAR(30);

-- ALTER TABLE - MODIFY
ALTER TABLE Employees
MODIFY COLUMN designation VARCHAR(200);

-- ALTER TABLE - DROP
ALTER TABLE Employees
DROP COLUMN age;

-- ALTER TABLE - RENAME 
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining DATE;

RENAME TABLE departments TO departments_info;

RENAME TABLE location TO locations;

TRUNCATE TABLE Employees;

DROP TABLE Employees;

DROP DATABASE emloyee;
















