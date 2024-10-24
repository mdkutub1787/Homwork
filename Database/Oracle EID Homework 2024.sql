-- Practice 3-1: Restricting and Sorting Data 

-- Task: 1
select last_name, salary 
from employees 
where salary > 12000;

-- Task: 2
select last_name, department_id 
from employees 
where employee_id = 176;

-- Task: 3
select last_name, salary 
from employees 
where salary not between 5000 and 12000;

-- Task: 4
select last_name, job_id, hire_date 
from employees 
where last_name in ('Matos', 'Taylor')
order by hire_date;

-- Task: 5
select last_name, department_id 
from employees 
where department_id in (20, 50) 
order by last_name;

-- Task: 6
select last_name "Employee", salary "Monthly Salary"
from employees 
where salary between 5000 and 12000 
AND department_id in (20, 50);

-- Task: 7
select last_name, hire_date 
from employees 
where to_char(hire_date, 'yyyy') = 2006;

-- Task: 8
select last_name, job_id 
from employees 
where manager_id is null;

-- Task: 9
select last_name, salary, commission_pct 
from hr.employees 
where commission_pct is not null 
order by 2 desc, 3 desc;

-- Task: 12
select last_name 
from hr.employees 
where last_name like '__a%';

-- Task: 13
select last_name 
from hr.employees 
where last_name like '%a%'
and last_name like '%e%';

-- Task: 14
select last_name, job_id, salary 
from employees 
where job_id in('SA_REP','ST_CLERK') 
and salary not in(2500, 3500, 7000);

-- Task: 15
select last_name "Employee", salary "Monthly Salary", commission_pct 
from employees 
where commission_pct = (20/100);





--  Practice 4-1: Using Single-Row Functions to Customize Output

-- Task: 1
select sysdate "Date"
from dual;

-- Task: 2
select last_name, employee_id, salary, round(salary +( salary * (15.5 / 100))) "New Salary"
from employees;

-- Task: 3
select last_name, employee_id, salary, round(salary + (salary * (15.5 / 100))) "New Salary", round(salary + (salary * (15.5 / 100)))-salary "Increase"
from hr.employees;

-- Task: 5a
select last_name, length(last_name) "Length"
from employees
where last_name like 'J%'
and last_name like 'A%'
and last_name like 'M%'
order by last_name;

-- Task: 6
select last_name, round(months_between(sysdate, hire_date)) "MONTHS_WORKED"
from employees;

-- Task: 7
select last_name, lpad(salary, 15, '$') "SALARY"
from employees;

-- Task: 8
select last_name, rpad(' ',salary / 1000,'*') "EMPLOYEES_AND_THEIR_SALARIES"
from employees
order by salary desc;

-- Task: 9
select last_name, trunc((sysdate - hire_date) / 7) "TENURE"
from employees
where department_id=90
order by TENURE desc;
	
	
	
	
-- Practice 5-1: Using Conversion Functions and Conditional

-- Task: 1
select  last_name || ' earns ' 
        || to_char(salary, 'fm$99,999.00') 
        || ' monthly but wants ' 
        || to_char(salary * 3, 'fm$99,999.00') 
        || '.' "Dream Salaries" 
from    employees; 

-- Task: 2
select last_name, hire_date, 
to_char(next_day(add_months(hire_date, 6),'Monday'), 
'fmDay, "the" Ddspth "of" Month, YYYY') "Review"
from    employees; 

-- Task: 3
select last_name, 
nvl(to_char(commission_pct), 'No Commission') "COMM"
from   employees; 

-- Task: 4
select job_id, case job_id 
               when 'ST_CLERK' then 'E' 
               when 'SA_REP'   then 'D' 
               when 'IT_PROG'  then 'C' 
               when 'ST_MAN'   then 'B' 
               when 'AD_PRES'  then 'A' 
               else '0'  end  "Grade" 
from employees;  

-- Task: 5
select job_id, case               
               when job_id = 'ST_CLERK' then 'E' 
               when job_id = 'SA_REP'   then 'D' 
               when job_id = 'IT_PROG'  then 'C' 
               when job_id = 'ST_MAN'   then 'B' 
               when job_id = 'AD_PRES'  then 'A' 
               else '0'  end  "Grade"
from employees; 

-- Task: 6
select job_id, decode (job_id, 
                   'ST_CLERK',  'E', 
                   'SA_REP',    'D', 
                   'IT_PROG',   'C', 
                   'ST_MAN',    'B', 
                   'AD_PRES',   'A', 
                   '0') "Grade"  
from employees;