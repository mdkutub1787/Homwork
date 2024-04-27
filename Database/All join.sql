








































SELECT e.employee_id, l.city, d.department_name
from employees e
join departments d
USING (department_id)
join locations l
using(location_id);
=l.location_id
join countries c
on c.country_id=l.country_id
join regions r
on r.region_id=c.region_id
join job_history h
on e.employee_id=h.employee_id
join jobs j
on j.job_id=e.job_id;




