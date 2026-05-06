-- Select all columns from Employee table
SELECT * FROM Employee;
-- Select name and salary
SELECT name, salary FROM Employee;
-- Select employees older than 30
SELECT * FROM Employee WHERE age > 30;
--Select the names of all departments
SELECT department FROM Employee;
--Select employees who work in the IT department
SELECT Employee.name FROM Employee
JOIN Department ON Employee.department_id = Department.department_id
WHERE Department.name = 'IT';
-- Select employees whose names start with 'J'
SELECT * FROM Employee WHERE name LIKE 'J%';
-- Select employees whose names end with 'e'
SELECT * FROM Employee WHERE name LIKE '%e';
-- Select employees whose names contain 'a'
SELECT * FROM Employee WHERE name LIKE '%a%';
-- Select employees whose names are exactly 9 characters long
SELECT * FROM Employee WHERE name LIKE '_________';
-- Select employees whose names have 'o' as second character
SELECT * FROM Employee WHERE name LIKE '_o%';
-- Select employees hired in the year 2020
SELECT * FROM Employee WHERE YEAR(hire_date) = 2020;
-- Select employees hired in January of any year
SELECT * FROM Employee WHERE MONTH(hire_date) = 1;
-- Select employees hired before 2019
SELECT * FROM Employee WHERE YEAR(hire_date) < 2019;
-- Select employees hired on or after March 1, 2021
SELECT * FROM Employee WHERE hire_date >= '2021-03-01';
-- Select employees hired in the last 2 years
SELECT * FROM Employee WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
-- Select the total salary of all employees
SELECT SUM(salary) FROM Employee;
-- Select the average salary of all employees
SELECT AVG(salary) FROM Employee;
-- Select the minimum salary in Employee table
SELECT MIN(salary) FROM Employee;
-- Select the number of employees in each department
SELECT department, COUNT(*) FROM Employee GROUP BY department;
-- Select the average salary for each department
SELECT department, AVG(salary) FROM Employee GROUP BY department;
-- Select the total salary for each department
SELECT department, SUM(salary) FROM Employee GROUP BY department;
-- Select the average age of employees in each department
SELECT department, AVG(age) FROM Employee GROUP BY department;
-- Select the number of employees hired in each year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) FROM Employee GROUP BY YEAR(hire_date);
-- Select the highest salary in each department
SELECT department, MAX(salary) FROM Employee GROUP BY department;
-- select the Department with highest average salary
SELECT department_id,
AVG(salary) AS average_salary FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC LIMIT 1;
-- select Departments with more than 2 employees
SELECT department_id, COUNT(*) AS employee_count
FROM Employee GROUP BY department_id
HAVING COUNT(*) > 2;
-- select Departments with average salary > 55000
SELECT department_id, AVG(salary) AS average_salary
FROM Employee GROUP BY department_id
HAVING AVG(salary) > 55000;
-- select Years with more than 1 employee hired
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;
-- select Departments with total salary expense less than 100000
SELECT department_id, SUM(salary) AS total_salary
FROM Employee GROUP BY department_id
HAVING SUM(salary) < 100000;
-- select Departments with maximum salary above 75000
SELECT department_id, MAX(salary) AS max_salary
FROM Employee GROUP BY department_id
HAVING MAX(salary) > 75000;