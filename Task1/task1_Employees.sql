CREATE DATABASE CompanyDB;

USE CompanyDB;
CREATE SCHEMA Sales;

CREATE SEQUENCE Sales.EmployeeSeq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE Sales.employees (
    employee_id INT DEFAULT NEXT VALUE FOR Sales.EmployeeSeq PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2)
);

ALTER TABLE Sales.employees
ADD hire_date DATE;

--for validating
SELECT * FROM Sales.employees;

SELECT first_name, last_name FROM Sales.employees;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Sales.employees;

SELECT AVG(salary) AS average_salary FROM Sales.employees;

SELECT * FROM Sales.employees WHERE salary > 50000;

SELECT * FROM Sales.employees
WHERE YEAR(hire_date) = 2020;

SELECT * FROM Sales.employees WHERE last_name LIKE 'S%';

SELECT TOP 10 * FROM Sales.employees ORDER BY salary DESC;

SELECT * FROM Sales.employees WHERE salary BETWEEN 40000 AND 60000;

SELECT * FROM Sales.employees WHERE first_name LIKE '%man%' OR last_name LIKE '%man%';

SELECT * FROM Sales.employees WHERE hire_date IS NULL;

SELECT * FROM Sales.employees WHERE salary IN (40000, 45000, 50000);

SELECT * FROM Sales.employees
WHERE hire_date BETWEEN '2020-01-01' AND '2021-01-01';

SELECT * FROM Sales.employees ORDER BY salary DESC;

SELECT TOP 5 * FROM Sales.employees ORDER BY last_name ASC;

SELECT * FROM Sales.employees
WHERE salary > 55000 AND YEAR(hire_date) = 2020;

SELECT * FROM Sales.employees
WHERE first_name IN ('John', 'Jane');

SELECT * FROM Sales.employees
WHERE salary <= 55000 AND hire_date > '2022-01-01';

SELECT * FROM Sales.employees
WHERE salary > (SELECT AVG(salary) FROM Sales.employees);

SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY salary DESC) AS RowNum
    FROM Sales.employees
) AS Ranked
WHERE RowNum BETWEEN 3 AND 7;

SELECT * FROM Sales.employees
WHERE hire_date > '2021-01-01'
ORDER BY last_name ASC, first_name ASC;

SELECT * FROM Sales.employees
WHERE salary > 50000 AND last_name NOT LIKE 'A%';

SELECT * FROM Sales.employees WHERE salary IS NOT NULL;

SELECT * FROM Sales.employees
WHERE (first_name LIKE '%e%' OR first_name LIKE '%i%' OR last_name LIKE '%e%' OR last_name LIKE '%i%')
  AND salary > 45000;


