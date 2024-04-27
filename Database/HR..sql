SELECT e.employee_id, e.last_name, e.department_id, 
d.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);



SELECT first_name, last_name,salary
FROM employees e 
JOIN departments d
ON d.department_id = e.department_id 
JOIN locations l
ON d.location_id = l.location_id
WHERE city='Oxford';
 
 
 
 
 
SELECT JOB_TITLE, department_name,last_name,start_date
FROM employees e

JOIN departments d
on d.department_id=e.department_id

JOIN jobs j
on e.job_id=j.job_id

JOIN job_history h
on e.employee_id=h.employee_id

where to_char(start_date,'YYYY') BETWEEN 2000 and 2005
ORDER BY 4;
 
 
 
 
 
 
 
 
 
 
 