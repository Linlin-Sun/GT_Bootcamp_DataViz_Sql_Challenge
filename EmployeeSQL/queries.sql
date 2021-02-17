-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp_no, last_name, first_name, sex, salary from employees;

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees
where extract(year from hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name 
from dept_managers dm, departments dept, employees emp
where dm.dept_no = dept.dept_no and dm.manager_emp_no = emp.emp_no

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
from employees emp, departments dept
where emp.dept_no = dept.dept_no order by dept.dept_name;
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
select first_name, last_name, sex from employees where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
from employees emp, departments dept
where emp.dept_no = dept.dept_no order by dept.dept_name;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
from employees emp, departments dept
where emp.dept_no = dept.dept_no and dept.dept_name = 'Sales';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) from employees
group by last_name
order by count(*) desc;