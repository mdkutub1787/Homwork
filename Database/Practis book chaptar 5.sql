--Ans --1



SELECT  last_name || ' earns '
|| TO_CHAR(salary, 'fm$99,999.00')
|| ' monthly but wants '
|| TO_CHAR(salary * 3, 'fm$99,999.00')
|| '.' "Dream Salaries"
FROM employees;


--Ans 2--

SELECT last_name, hire_date,
TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),'MONDAY'),
'fmDay, "the" Ddspth "of" Month, YYYY') REVIEW
FROM employees;




















