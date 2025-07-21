USE sql_practice

CREATE TABLE employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert records for three departments
INSERT INTO employees (name, department, salary) VALUES 
('John Doe', 'Engineering', 63000),
('Jane Smith', 'Engineering', 55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);

--  2nd Highest Salary (Simple Subquery)

SELECT MAX(salary) AS '2nd Highest Salary'
FROM employees
WHERE salary < (
    SELECT MAX(salary) FROM employees
);

-- Insert a New Employee

INSERT INTO employees (name, department, salary)
VALUES ('Megha', 'IT', 63000);

-- 2nd Highest Salary using Subquery with DENSE_RANK

SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS ranks
    FROM employees
) AS rn
WHERE ranks = 2;

--  Nth Highest Salary (e.g., 2nd) using CTE

WITH salary_rank AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM employees
)
SELECT salary
FROM salary_rank
WHERE rank = 2;

--  2nd Highest Salary in Each Department using CTE
WITH salary_rank AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
    FROM employees
)
SELECT *
FROM salary_rank
WHERE rank = 2;