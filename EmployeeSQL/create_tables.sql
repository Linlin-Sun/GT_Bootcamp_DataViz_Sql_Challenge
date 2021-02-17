drop table dept_managers;
drop table employees;
drop table titles;
drop table departments;

create table departments (
	dept_no	varchar(10),
	dept_name varchar(30),
	PRIMARY KEY (dept_no)
);

create table titles (
	title_id	varchar(10),
	title		varchar(30),
	PRIMARY KEY (title_id)
);

create table dept_managers (
	dept_no	varchar(10),
	manager_emp_no int,
	PRIMARY KEY (dept_no, manager_emp_no)
);

create table employees (
	emp_no		int,
	title_id	varchar(10) REFERENCES TITLES(title_id),
	birth_date	date,
	first_name	varchar(50),
	last_name	varchar(50),
	sex			varchar(1),
	hire_date	date,
	dept_no	varchar(10) REFERENCES DEPARTMENTS(dept_no),
	salary		real,
	PRIMARY KEY (emp_no)
);

select * from dept_managers;
select * from titles;
select * from departments;
select count(*) from employees;