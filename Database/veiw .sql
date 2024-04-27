CREATE VIEW Show_View
AS SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80;

select * FROM Show_View;

CREATE VIEW ShowView_100_days
AS 
select DISTINCT (job_id)
from employees
where current_date - hire_date > 100
GROUP BY job_id
having count(employee_id)>3;

select * from ShowView_100_days;


CREATE OR REPLACE VIEW empvu80
(id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' ' 
|| last_name, salary, department_id
FROM employees
WHERE department_id = 80;