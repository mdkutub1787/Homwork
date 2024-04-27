--HOME WORK FOR EID UL FITR-
Solution 2-1: Retrieving Data Using t Solution 2-1: Retrieving Data Using the SQL SELECT Statement

--4.b To view the data contained contained in the DEPARTMENTS table:
--Ans---
SELECT *
FROM departments;

--5.b The HR department wants department wants a query to query to display the display the last name, job name,
--job ID, hire ID, hire date, an date, and
--employee ID for each employee, with the employee ID appearing first. Provide an alias
--STARTDATE for the HIRE_DATE column. Save your SQL statement to a file named
--lab_02_5b.sql so that you can dispatch this file to the HR department. Test your
--query in the lab_02_5b.sql file to  file to ensure that it runs correctly. ensure that it runs correctly.
--Ans--
SELECT employee_id, last_name, job_id, hire_date StartDate
FROM employees;

--6. The HR department wants department wants a query to query to display display 
--all unique job nique job IDs from the from the EMPLOYEES table.

--Ans--
SELECT DISTINCT job_id
FROM employees;

--7. The HR department wa department wants more descriptiv descriptive column headings headings
--for its for its report on employees. employees.
--Copy the statement from lab_02_5b.sql to a new SQL Worksheet. Name the columns
--Emp #, Employee, Job, and Hire Date, respectively. Then run the query again.

--Ans --
SELECT employee_id "Emp #",last_name"Employee",job_id "Job", hire_date "Hire Date"
FROM employees;

--8. The HR department has department has requested a requested a report of 
--all employees and employees and their job their job IDs. Display IDs. Display the
--last name concatenated with the job ID (separated by a comma and space) and name the
--column Employee and Title.

--Ans---
SELECT last_name || ', ' || job_id AS "Employee and Title"
FROM employees;

--9. To familiari familiarize yourself yourself with the data in the EMPLOYEES table, create a query to display all
--the data from that table. Separate each column output by a comma. Name the column
--THE_OUTPUT.

--Ans--
SELECT employee_id ||',' || first_name || ',' || last_name
|| ',' || email || ',' || phone_number || ','|| job_id
|| ',' || manager_id || ',' || hire_date || ','
|| salary || ',' || commission_pct || ',' ||
department_id
THE_OUTPUT
FROM employees;


Practice 3-1: Restricting and Sorting Data

--1. Because of bu Because of budget issues, the HR dget issues, the HR department needs 
--a department needs a report that displays report that displays the last name the last name
--and salary of employees who earn more than $12,000. Save your SQL statement as a file
--named lab_03_01.sql. Run your query.

SELECT first_name,salary
from employees
where salary > 12000;

--2. Open a new SQL Worksheet. Create heet. Create a report that report that 
--display displays the last name ast name and department department
--number for employee number 176. Run the query.

--Ans--
select last_name,department_id
  FROM employees
  where employee_id=176;
  
  
--  4. Create a Create a report to report to display the display the last name, job name,
--  job ID, and ID, and hire date hire date for employees for employees with the with the last
--names of Matos and Taylor. Order the query in ascending order by hire date.

--Ans----
select last_name,job_id,hire_date
 FROM employees
  where last_name in('Matos', 'Taylor')
  order by 3 ;
  
--5. Display the Display the last name last name and department ID epartment ID of all 
--employees i employees in departments n departments 20 or 50 in
--ascending alphabe ascending alphabetical order tical order by last_name.

--Ans--
SELECT  last_name, department_id 
FROM employees
WHERE department_id  IN (20, 50)
ORDER BY last_name ASC;

--6.display the last name and salary of employees who earn
--between $5,000 and $12,000, and are in department 20 or 50. Label the columns
--Employee and Monthly Salary.

--Ans--
SELECT  last_name "Employee", salary  "Monthly Salary"
FROM employees
WHERE salary BETWEEN  5000 AND 12000
 AND department_id IN (20, 50);

--7. The HR department needs department needs a report displays the last  name 
--and hire date of all employees who were hired in 2006

--Ans--
select last_name,hire_date
from employees
where hire_date >= '1-jan-2006' and hire_date <'1-jan-2007';

--8. Create  a report to display the  last name  job title  of all employees  who do not have a manager.

--Ans--
select last_name,job_id
from employees
where manager_id is null;
     
--9.Create a report  to display the  last name, salary,and ommission of all employees who employees who earn
--commissions. Sort the data in descending order of salary and commissions.
--Use the column’s numeric position in the ORDER BY clause.

--Ans--
select last_name,salary,commission_pct
from employees
where commission_pct is not null
order by 2 desc ,3 desc;

--10. Members of the  HR department want to h department want to have more ave more flexibility with the queries that you are
--writing. They would like a report that displays the last name and salary of employees who
--earn more than an amount that the user specifies after a prompt. (You can use the query
--created in Task 1 and modify it.) Save this query to a file named lab_03_10.sql.

--Ans---
SELECT  last_name, salary
FROM employees
WHERE salary > &sal_amt; 

--12. Display the last names of all employees where the third letter of  the name is “a.”

--Ans--
SELECT  last_name
FROM employees
WHERE last_name like '__a%'; 

--13. Display the last names of all employees who have both an “a” and an “e” in their last name.

--Ans--
SELECT  last_name
FROM employees
WHERE last_name like '%a%' and 
 last_name like'%e%'; 
 
-- 14. Display the last name, job, and salary  for all employees  whose job is that of a sales
--representative or a stock clerk, and whose salary is not equal to $2,500, $3,500, or $7,000.

--Ans--
SELECT  last_name,  job_id, salary
FROM employees
where job_id IN ('SA_REP', 'ST_CLERK') 
 AND salary NOT IN (2500, 3500, 7000); 
 
-- 15. display the last name, salary, and commission for all
--employees whose commission is 20%. 

--Ans--
SELECT  last_name, salary,commission_pct
FROM employees
where commission_pct= 0.20;

Solution 4-1: Using Single-Row Functions 

1. Write a query to display the system date. Label the column Date.
--Ans--
select  sysdate "Date"
from dual;

--2. The HR department needs  a report to display the employee number,last name,salary, andsalary increased by 15.5% 
--(expressed as a whole number) for each employee. Label the column New Salary.
--Ans--
SELECT employee_id,last_name, salary,round(salary*0.155+salary)"New Salary",
round(salary*0.155) increased
from employees;

--5.a.  Write a query displays the last name  (with the first letter in uppercase  and all  the
--other letters in lowercase) and the length of the last name for all employees whose
--name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort
--the results by the employees’ last names.

--Ans--
select initcap(last_name) "Name",
LENGTH(last_name)"LENGTH"
  FROM employees
  where last_name like 'J%'
 or last_name like 'A%'
   or last_name like 'M%';

6.
--Ans--
SELECT last_name, ROUND(MONTHS_BETWEEN(
SYSDATE, hire_date)) MONTHS_WORKED
FROM employees
ORDER BY months_worked;

--7.  Create a query to display the last name  and salary  for all employees. Format the salary
--to be 15 characters long, left-padded with the $ symbol. Label the column SALARY
--Ans--
SELECT last_name,
LPAD(salary, 15, '$') SALARY
FROM employees;

--8.Create a  query that displays employees’ last displays employees’ last names, and names, and indicates the indicates the amounts o amounts of their f their
--salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the data in
--descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES. 
--Ans--
SELECT last_name,
rpad(' ', salary/1000, '*')
EMPLOYEES_AND_THEIR_SALARIES
FROM employees ORDER BY salary DESC;

--9.  Create a query to display t uery to display the last name and the number  of weeks em of weeks employed for all ployed for all
--employees in department 90. Label the number of weeks column as TENURE. Truncate
--the number of weeks value to 0 decimal places. Show the records in descending order
--of the employee’s tenure.

--Ans--
SELECT last_name, trunc((SYSDATE-hire_date)/7) AS TENURE
FROM employees
WHERE department_id department_id = 90
ORDER BY TENURE DESC;

Solution 5-1: Using Conversion Functions  and Condit nd Conditional Expressions

--1Create a report  that produce the following  for each employee
--<employee last name> earns <salary> monthly but wants <3 times salary.>. Label
--the column Dream Salaries.

--Ans--
SELECT last_name  || ' earns '
|| TO_CHAR(salary, 'fm$99,999.00')
|| ' monthly but wants '
|| TO_CHAR(salary * 3, 'fm$99,999.00')
|| '.' "Dream Salaries"
FROM employees;

--2. Display each employee’s ployee’s last name, hire date, and salary, which is the first
--Monday after six months of service. Label the column REVIEW. Format the dates to appear
--in a format that is similar to “Monday, the Thirty-First of July, 2000.”

--Ans--
SELECT last_name, hire_date,
TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),'MONDAY'),
'fmDay, "the" Ddspth "of" Month, YYYY') REVIEW
FROM employees;

--3.  Create a query displays employees’  last names and names and commission amounts. If commission amounts. If an
--employee does not earn commission, show “No Commission.” Label the column COMM.

--Ans--
SELECT last_name,
NVL(TO_CHAR(commission_pct), 'No Commission') COMM
FROM employees;

Solution 6-1: Reporting Aggregated Data by Using Group Functions

--4 &5 .Find the highest, lowest, s highest, lowest, sum, and average  salary of all employees.  Label the columns
--Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest
--whole number.

--Ans--
SELECT job_id, ROUND(MAX(salary)) "Maximum",
ROUND(MIN(salary)) "Minimum",
ROUND(SUM(salary)) "Sum",
ROUND(AVG(salary)) "Average"
FROM employees
GROUP BY job_id;;

--6. Write a o query to display  the number  of people with the with the same job.

--Ans--
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

--7. Determine the number of managers anagers  without listing them. L them. Label the column Number of
--Managers

--Ans---
SELECT COUNT(DISTINCT manager_id) "Number of Managers"
FROM employees;

--8. Find the difference between  the highest  and lowest salaries. Label the column
--DIFFERENCE.

--Ans--
SELECT  MAX(salary)-  MIN(salary)  DIFFERENCE
FROM employees;

--9. Create a  report to display  the manager number and the salary  of the lowest-paid lo
--employee for that manager. Exclude anyone whose manager is not known. Exclude
--any groups where the minimum salary is $6,000 or less. Sort the output in descending
--order of salary.

--Ans--
SELECT  manager_id, MIN(salary)
FROM employees
WHERE manager_id  IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary)  > 6000
ORDER BY MIN(salary) DESC;

--10. Create a query that displays the total number of  employees and, the number  of
--employees hired in 2005, 2006, 2007, and 2008. Create appropriate column headings.

--Ans--
SELECT COUNT(*) total,
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2005,1,0))"2005",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2006,1,0))"2006",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2007,1,0))"2007",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2008,1,0))"2008"
FROM employees;

--11.Create a matrix query to display the job, the salar the job,job based on  the department
--number, and the total salary for number, for departments 20, 50, 80, and 90, givin rtments 20, 50, 80, and 90, giving each
--column an appropriate heading.

--Ans--
SELECT job_id "Job",
SUM(DECODE(department_id , 20, salary)) "Dept 20",
SUM(DECODE(department_id , 50, salary)) "Dept 50",
SUM(DECODE(department_id , 80, salary)) "Dept 80",
SUM(DECODE(department_id , 90, salary)) "Dept 90",
SUM(salary) "Total"
FROM employees
GROUP BY job_id;
