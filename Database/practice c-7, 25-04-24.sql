select e.last_name,e.salary,j.grade
from employees e join job_grades j
on e.salary
between j.lowest_sal and j.highest_sal;

select e.last_name,e.employee_id,m.last_name,m.employee_id
from employees e join employees m
on e.employee_id=m.manager_id;

select e.last_name,e.employee_id,m.last_name,m.employee_id
from employees e left join employees m
on e.employee_id=m.manager_id
order by 2;


select e.last_name,e.job_id,e.department_id,d.department_name,l.city
from employees e join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
where l.city = 'Toronto';


select last_name,job_id
from employees
where job_id=(select job_id
        from employees
        where employee_id=141);

select last_name,job_id
from employees
where job_id like 'ST_CLERK';            

--select last_name,job_id,salary
--from employees
--where job_id=(select job_id
--from employees
--where last_name='Taylor')
--AND salary >(select salary
--from employees
--where last_name='Taylor');

select last_name,job_id,salary
from employees
where salary =(select min(salary)
from employees);


