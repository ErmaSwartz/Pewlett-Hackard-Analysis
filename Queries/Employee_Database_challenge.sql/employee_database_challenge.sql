
-- retrieve the emp_no first name and last name 
SELECT emp_no, first_name, last_name 
FROM employees 

-- retrieve title, from dat and to date from titles 
SELECT title, from_date, to_date 
FROM titles 

-- create new table 
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;


SELECT employees.emp_no,
	employees.first_name,
	employees.last_name, 
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles  
FROM employees 
LEFT JOIN titles 
on employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;

select * from retirement_titles
DROP TABLE retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
					emp_no,
					first_name,
					last_name, 
					title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC,
title DESC;

select * from unique_titles
DROP TABLE unique_titles

-- write a query to retireve the number of employees by their most recent job
-- who are about to reitre 

SELECT COUNT (title),
			title 
INTO Retiring_titles
FROM unique_titles 
GROUP BY title 
ORDER BY count DESC;


select * from retiring_titles
drop table retiring_titles


