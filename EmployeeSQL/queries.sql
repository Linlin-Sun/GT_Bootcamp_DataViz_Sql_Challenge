-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees e left outer join salaries s on e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees where extract(year from hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name 
from dept_manager dm, departments dept, employees emp
where dm.dept_no = dept.dept_no and dm.manager_emp_no = emp.emp_no

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select d.dept_name, emp.emp_no, emp.last_name, emp.first_name
from employees emp left outer join dept_emp de on emp.emp_no = de.emp_no
left outer join departments d on de.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
select first_name, last_name, sex 
from employees 
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from dept_emp de, departments d, employees e 
where d.dept_name = 'Sales' and d.dept_no = de.dept_no and e.emp_no = de.emp_no;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from dept_emp de, departments d, employees e 
where d.dept_name in ('Sales', 'Development') and d.dept_no = de.dept_no and e.emp_no = de.emp_no;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) 
from employees group by last_name 
order by count(*) desc;