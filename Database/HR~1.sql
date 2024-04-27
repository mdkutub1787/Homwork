Practice 9-1: Using Set Operators

--1.Ans --
SELECT department_id
FROM departments
MINUS
SELECT department_id 
   FROM employees 
   where job_id = 'ST_CLERK';
   
-- 2.Ans--  
   SELECT COUNTRY_ID,COUNTRY_NAME
  FROM COUNTRIES
  where COUNTRY_NAME ='Germany';
   
   
--3.Ans--
SELECT employee_id,job_id,department_id
from employees
where department_id in (50, 80);

--4.Ans--
select employee_id 
  FROM employees 
  WHERE job_id ='SA_REP';
  

  