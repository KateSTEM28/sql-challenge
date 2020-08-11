--DATA ENGINEERING
--tables:  titles,employees, salaries, deparments, dept_manager, dept_emp
DROP TABLE titles
DROP TABLE employees
DROP TABLE salaries
DROP TABLE departments
DROP TABLE dept_manager
DROP TABLE dept_emp

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY NOT NULL,
    title VARCHAR   NOT NULL)   
	
CREATE TABLE employees (
    emp_no INT  PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR, 
    birth_date date   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
    FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY NOT NULL,
    dept_name VARCHAR   NOT NULL
);

CREATE TABLE dept_manager(
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);




