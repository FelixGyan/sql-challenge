--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, last_name, first_name, sex, salary 
FROM employees 
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no;


--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


-- 3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
WITH A AS (SELECT dept_no, employees.emp_no, last_name, first_name FROM employees INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no)
SELECT A.dept_no, dept_name, A.emp_no, last_name, first_name 
FROM department INNER JOIN A ON department.dept_no = A.dept_no;

-- 4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
WITH A AS (SELECT dept_no, employees.emp_no, last_name, first_name FROM employees INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no)
SELECT A.dept_no, A.emp_no,last_name, first_name, dept_name  
FROM department INNER JOIN A ON department.dept_no = A.dept_no;

-- 5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM employees WHERE LOWER(first_name)=LOWER('Hercules') AND LOWER(last_name) LIKE 'b%' ;

-- 6.List each employee in the Sales department, including their employee number, last name, and first name.
WITH A AS (SELECT dept_no, employees.emp_no, last_name, first_name FROM employees INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no)
SELECT  A.emp_no,last_name, first_name
FROM department INNER JOIN A ON department.dept_no = A.dept_no
WHERE A.dept_no = (SELECT dept_no FROM department WHERE dept_name='Sales');

-- 7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
WITH A AS (SELECT dept_no, employees.emp_no, last_name, first_name FROM employees INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no)
SELECT  A.emp_no,last_name, first_name
FROM department INNER JOIN A ON department.dept_no = A.dept_no
WHERE A.dept_no in (SELECT dept_no FROM department WHERE dept_name='Sales' OR dept_name='Development');

-- 8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(last_name) AS last_name_freqency FROM employees 
GROUP BY last_name
ORDER BY last_name DESC;

