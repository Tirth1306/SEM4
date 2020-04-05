-- Write a query to find the salary of employees whose salary is greater than the salary of
-- employee whose id is 100.
SELECT employee_id, salary FROM employees
WHERE salary > (	SELECT salary FROM employees	WHERE	employee_id = 100);


-- Write a query to find the employees who all are earning the highest salary.
SELECT employee_id, salary FROM employees
WHERE salary = (SELECT max(salary) FROM employees);

-- Write a query to find the departments in which the least salary is greater than the
-- highest salary in the department of id 60.
SELECT department_id FROM employees
GROUP BY department_id
HAVING MIN(salary) > ( SELECT MAX(salary) FROM employees WHERE department_id = 60);

-- Write a query to find the employees whose salary is equal to the salary of at least
-- one employee in department of id 90.
SELECT * from employees
WHERE salary IN (
    SELECT salary FROM employees WHERE department_id = 90 )
    AND department_id <> 90;

-- Write a query to find the employees whose salary is greater than at least one
-- employee in department of id 60. (Use ANY)
SELECT * from employees
WHERE salary > ANY (
    SELECT salary FROM employees WHERE department_id = 60 );

-- Write a query to find the employees whose salary is less than the salary of all
-- employees in department of id 30. (Use ALL)
SELECT * from employees
WHERE salary > ALL (
    SELECT salary FROM employees WHERE department_id = 30 );

-- Write a query to find the employees whose manager and department should match
-- with the employee of id 110 or 30.
select * from employees
where manager_id in (select manager_id from employees where department_id in (110,30))
    and department_id in (110,30);


-- Write a query to find the highest earning employee in each department. (Use inline
-- view)


SELECT * FROM employees E1
  WHERE NOT EXISTS (
  SELECT E2.salary FROM employees E2
  WHERE E2.salary > E1.salary and E2.department_id = E1.department_id
);


--  Write a query to list the department names which have at least one employee.
SELECT DISTINCT department_id FROM employees;
-- or --
SELECT DISTINCT E1.department_id FROM employees E1
WHERE EXISTS (
	SELECT E2.employee_id FROM employees E2
	WHERE E2.department_id = E1.department_id
);


-- Write a query to find the departments which do not have employees at all.
SELECT DISTINCT E1.department_id FROM employees E1
WHERE NOT EXISTS (
	SELECT E2.employee_id FROM employees E2
	WHERE E2.department_id = E1.department_id
);

-- Display third highest salary of all employees.
SELECT * FROM employees E1
WHERE (
	SELECT COUNT(DISTINCT E2.salary) FROM employees E2
	WHERE E2.salary > E1.salary
) = 2;
