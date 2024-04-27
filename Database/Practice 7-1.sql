Practice 6-1: Reporting Aggregated Data by Using Group Functions

--4. Find the highest, lowest, sum, and average  salary of all employees. Label the columns
--Maximum, Minimum, Sum, and Average, respectively. Round your results to the
--nearest whole number.

--Ans--
select max(salary) as Maximum,
min(salary) as Minimum,
sum(salary) as Sum,
round(avg(salary))as Average
from employees;

--5.display the minimum, maximum, sum, and
--average salary for each average salary for each job type.

--Ans--
select job_id,
max(salary) as "Maximum",
min(salary) as "Minimum",
sum(salary) as "Sum",
round(avg(salary))as "Average"
from employees
group by job_id;

--6.Write a  query to  display the number  of people with the  same job.

--Ans--
select job_id , count(*)
from employees
group by job_id;

--7.  Determine the number of managers without  listing listing them.  Label the column Number of
--Managers.

--Ans --
select count (distinct(manager_id)) as "Number of  Managers"
from employees;


--8. Find the difference between  highest and lowest salaries. Label the column the column DIFFERENCE.
--Ans--
select max(salary)-min(salary) as "DIFFERENCE"
from employees;

--9. Create a Create a report to report to display the display the manager manager number and the salary o alary of the lowest-paid lowest-paid
--employee for that manager. Exclude anyone whose manager is not known. Exclude
--any groups where the minimum salary is $6,000 or less. Sort the output in descending
--order of salary.

--Ans--
select manager_id,min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary)>6000
order by 2 desc;



Practice 7-1: Displaying Data from Multiple Tables by Using Joins

--1. Write a query for  HR department to produce the addresses of all the  departments.
--Use the LOCATIONS and COUNTRIES tables. Show the location ID, street address, city,
--state or province, and country in the output. Use a NATURAL JOIN to produce the
--results.

--Ans--
select location_id,street_address,city,state_province,country_name
from locations
natural join countries;

--2. The HR department needs  a report of all employees with corresponding departments.  Write
--a query to display the last name, department number, and department name for these
--employees.

--Ans--
select e.last_name,e.department_id,d.department_name
  FROM employees e join departments d
  on e.department_id=d.department_id;
    
-- 3. The HR department needs  report of employees in  Toronto.Display the last name, jo name, job,
--department number, and the department name for all employees who work in Toronto.

--Ans--
select e.last_name,e.job_id,e.department_id,d.department_name
  FROM employees e join departments d
  on e.department_id=d.department_id
  join locations l
  on l.location_id=d.location_id
  where l.city='Toronto';
  
--  4.Create a report to display employees’last names and employee numbers  along with along with their
--managers’ last names and manager numbers. Label the columns Employee, Emp#,
--Manager, and Mgr#, respectively. Save your SQL statement as lab_07_04.sql. Run the
--query.

--Ans--
  