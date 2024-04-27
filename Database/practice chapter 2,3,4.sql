select  last_name,salary
from employees
where salary in(12000,17000);

select  last_name,salary,commission_pct
from employees
where salary BETWEEN 12000 and 17000;


select  last_name,salary,commission_pct
from employees
where commission_pct is null;

select  last_name,salary,manager_id
from employees
where manager_id is null;

select  last_name,department_id,salary
from employees
where department_id BETWEEN 80 and 90;

select  last_name,department_id,salary
from employees
where department_id = 80;

select last_name,salary, commission_pct
from employees
where last_name ='King';

select last_name,salary,hire_date, commission_pct
from employees
where hire_date='17-Oct-2003';


select first_name,last_name, salary
from employees
where last_name like 'K%';


select first_name,last_name, salary
from employees
where last_name like '_a%';

select first_name,job_id, salary
from employees
where job_id like 'SA%';

select hire_date,job_id, salary
from employees
where hire_date like '06%';

select hire_date,job_id, salary
from employees
where job_id like 'SA%'
and hire_date like '03%';

select  last_name,salary,commission_pct
from employees
where salary BETWEEN 12000 and 17000
and last_name like '_a%';

select  last_name,salary,commission_pct
from employees
where salary BETWEEN 12000 and 17000
or last_name like '_a%';

select  last_name,salary,commission_pct
from employees
where salary not in 10000;

select hire_date,job_id, salary
from employees
where job_id not in ('AD_VP','IT_PROG','ST_CLERK');

select last_name,salary,department_id
from employees
where department_id = 80
or department_id=90
and salary > 1000 ;


select last_name,job_id,department_id,salary,hire_date
from employees
ORDER BY  salary desc;

select last_name,job_id,department_id,salary,hire_date
from employees
ORDER BY  3 ;

select last_name,job_id,department_id,salary,hire_date
from employees
ORDER BY department_id, salary desc;


select last_name,salary,job_id
from employees
where lower(last_name)='king';

SELECT employee_id, CONCAT(first_name, last_name) NAME,
LENGTH (last_name), INSTR(last_name, 'a') "Contains 'a'?"
FROM employees
WHERE SUBSTR(last_name, -1, 1) = 'n';



SELECT employee_id as "Even Numbers", last_name
FROM employees 
WHERE MOD(employee_id,2) = 0;


SELECT last_name, hire_date
FROM employees
WHERE hire_date < '01-FEB-2008';

select * FROM employees;

