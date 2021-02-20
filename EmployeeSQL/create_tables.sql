drop table dept_manager;
drop table dept_emp;
drop table salaries;
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

create table employees (
	emp_no		int,
	title_id	varchar(10),
	birth_date	date,
	first_name	varchar(50),
	last_name	varchar(50),
	sex			varchar(1),
	hire_date	date,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

create table dept_manager (
	dept_no	varchar(10),
	manager_emp_no int,
	PRIMARY KEY (dept_no, manager_emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (manager_emp_no) REFERENCES employees(emp_no)
);

create table dept_emp (
	emp_no		int,
	dept_no	varchar(10),
	CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no),
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

create table salaries (
	emp_no		int,
	salary		int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);
