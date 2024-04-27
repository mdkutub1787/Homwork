
--7. The HR department needs department needs a report on port on job grades and grades and salaries. To salaries. To familiariz familiarize yourself with yourself with
--the JOB_GRADES table, first show the  table, first show the structure of the structure of the JOB_GRADES table. Then create a
--query that displays the name, job, department name, salary, and grade for all employees.
--Ans--
DESC JOB_GRADES

SELECT e.last_name, d.department_name,
e.salary, j.grade
FROM employees e JOIN  departments d
ON e.department_id = d.department_id
JOIN job_grades j
on e.salary BETWEEN  j.lowest_sal  AND j.highest_sal; 

--9. The HR department needs department needs to find to find the names a names and hire dates hire dates of all employees who employees who were
--hired before their managers, along with their managers’ names and hire dates. Save the
--script to a f script to a file named ile named lab_07_09.sql.
--Ans--
select last_name,hire_date
  FROM employees
  where hire_date>(select hire_date from employees where last_name='Davies');
  
  
  
--9. The HR department needs department needs to find to find the names a names and hire dates hire dates of all employees who employees who were
--hired before their managers, along with their managers’ names and hire dates. Save the
--script to a f script to a file named ile named lab_07_09.sql.

select e.last_name,e.hire_date,m.last_name,m.hire_date
from employees e join employees m 
on e.manager_id=m.employee_id
where e.hire_date < m.hire_date;



Solution 8-1: Using Subqueries to Solve Queries

--2.  Create a report displays the employee   last name, and salary of all employees 
--who earn more than the average salary. Sort the results in ascending order by salary.

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary)
FROM employees)
ORDER BY 3;

--3. Write a Write a query that query that displays the displays the employee employee number an number and last name of all employees who employees who work
--in a department with any employee whose last name contains the letter “u.” Save your SQL
--statement as lab_08_03.sql. Run your query. 

SELECT employee_id, last_name
FROM employees
WHERE  department_id IN (SELECT department_id 
FROM employees
WHERE last_name  like '%u%'); 

--4. The HR department needs department needs a report that report that displays the displays the last name, department number, department number, and
-- job ID of all  job ID of all employees employees whose d whose department loc epartment location ID is 17 ation ID is 1700.

SELECT last_name, department_id, job_id
FROM employees
WHERE  department_id IN (SELECT  department_id
FROM departments
WHERE  location_id = 1700);



--5. Create a Create a report for report for HR that displays hat displays the last the last name and salary and salary of every employee ery employee who reports to King.

SELECT last_name, salary
FROM employees
WHERE  manager_id =(SELECT  employee_id
FROM employees
WHERE  last_name = 'King');   next edite

--6. Create a report HR that HR that displays  the department number,  last name, and job ID for every 
--employee in the Executive department.

SELECT department_id, last_name, job_id
FROM employees
WHERE  department_id IN  (SELECT  department_id
FROM departments
WHERE  department_name ='Executive');

--7.Create a report   displays  list of all employees  salary is more than  of
--any employee from department 60.

SELECT last_name 
FROM employees
WHERE salary > ANY (SELECT salary
FROM employees
WHERE department_id=60);


--8. Modify the query in lab_08_03.sql to display the employee number, last name, and
--salary of all employees who earn more than the average salary and who work in a
--department with any employee whose last name contains the letter “u.” Save
--lab_08_03.sql to lab_08_08.sql again. Run the statement in lab_08_08.sql.

SELECT employee_id, last_name, salary
FROM employees
WHERE  department_id IN (SELECT  department_id
FROM employees
WHERE last_name  like '%u%')
 AND salary > (select AVG(salary) 
FROM employees);

