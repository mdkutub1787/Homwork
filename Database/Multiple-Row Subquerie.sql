SELECT employee_id, last_name
FROM employees
WHERE salary in
(SELECT MIN(salary)
FROM employees
GROUP BY department_id);


SELECT last_name, salary, department_id
FROM employees
WHERE salary IN (SELECT MIN(salary)
FROM employees
GROUP BY department_id);


SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY
(SELECT salary
FROM employees
WHERE job_id = 'IT_PROG')


SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL
(SELECT salary
FROM employees
WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';




SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL
(SELECT salary
FROM employees
WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';
