--Data Analysis
--List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
join salaries s on s.emp_no=e.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.
select last_name, first_name, hire_date
from employees 
--WHERE extract(year from hire_date) = 1986
where date_part('year', hire_date)=1986

--List the manager of each department with the following information: 
	--department number, department name, the manager's employee number, last name, first name.
select d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from departments d
join dept_manager dm on d.dept_no=dm.dept_no
join employees e on dm.emp_no=e.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments d on d.dept_no=de.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees 
where first_name='Hercules'AND last_name LIKE ('B%')

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select de.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
join dept_emp de on de.dept_no=d.dept_no
join employees e on e.emp_no=de.emp_no
where d.dept_name='Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
join dept_emp de on de.dept_no=d.dept_no
join employees e on e.emp_no=de.emp_no
where d.dept_name IN ('Sales','Development')

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
  SELECT last_name, COUNT(last_name) AS Frequency
  FROM employees
  GROUP BY last_name
  ORDER BY COUNT(last_name) DESC

 