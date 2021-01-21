

select emp_no, first_name, last_name, birth_date 
from employees

select from_date, to_date 
from dept_emp

select title 
from titles

SELECT DISTINCT ON (emp_no)
					emp_no
FROM employees
ORDER BY emp_no;



SELECT employees.emp_no,
	employees.first_name,
		employees.last_name,
dept_emp.from_date,
	dept_emp.to_date 
INTO mentorship_eligibility
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31';

select * from mentorship_eligibility 

drop table mentorship_eligibility