DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

-- Create table for title data
CREATE TABLE titles (
	title_id varchar(5) not null,
	title varchar(255),
	PRIMARY KEY (title_id)
)
;

-- Create table for employee data
CREATE TABLE employees (
	emp_no integer not null,
	emp_title varchar(5) not null,
	birth_date date not null,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	sex varchar(1) not null,
	hire_date date not null,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles (title_id)
)
;

-- Create table for department data
CREATE TABLE departments (
	dept_no varchar(4) not null,
	dept_name varchar(255) not null,
	PRIMARY KEY (dept_no)
)
;

-- Create table for salary data
CREATE TABLE salaries (
	emp_no integer not null,
	salary integer not null,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
)
;

-- Create table for dept_emp data
CREATE TABLE dept_emp (
	emp_no integer not null,
	dept_no varchar(4) not null,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
)
;

-- Create table for dept_manager data
CREATE TABLE dept_manager (
	dept_no varchar(4) not null,
	emp_no integer not null,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
)
;