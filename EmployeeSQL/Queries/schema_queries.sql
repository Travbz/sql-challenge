SELECT * FROM employees;
SELECT * FROM salaries;


--Q1 List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
from employees e
inner join salaries s on 
e.emp_no = s.emp_no;

--Q2 List first name, last name, and hire date for employees who were hired in 1986.
SELECT
first_name,
last_name,
hire_date
FROM employees
WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

--Q3 List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
dm.dept_no,
dm.emp_no,
d.dept_name
into dept_config
from dept_manager dm
inner join departments d on
dm.dept_no = d.dept_no;
	
SELECT 
e.first_name,
e.last_name,
dc.dept_no,
dc.emp_no,
dc.dept_name
from employees e
right join dept_config dc on
e.emp_no = dc.emp_no;

--Q4 . List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	e.first_name,
	e.last_name,
	de.emp_no,
	d.dept_name
into employee_clean_question_4
from dept_emp de
inner join employees e on e.emp_no = de.emp_no
inner join departments d on d.dept_no = de.dept_no;

SELECT * FROM employee_clean_question_4;

--Q5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	e.first_name,
	e.last_name,
	e.sex
FROM employees e
WHERE first_name ='Hercules'
	AND last_name like 'B%'
;


--Q6 List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * FROM employee_clean_question_4
WHERE dept_name = 'Sales';

--Q7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM employee_clean_question_4
WHERE dept_name = 'Sales' or dept_name = 'Development';

--Q8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;