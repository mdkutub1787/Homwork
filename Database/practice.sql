select last_name,salary
from employees
where last_name = 'King';

select employee_id,first_name,manager_id,salary
from employees
where manager_id in(100,120,150,200);

select first_name,last_name,salary
from employees
where last_name like '__a_t%';

select last_name,hire_date
from employees
where hire_date like '%05';

select last_name,job_id
from employees
where job_id like '%SA%';








