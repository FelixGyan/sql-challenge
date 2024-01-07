
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE  title (
	title_id VARCHAR(5),
	title VARCHAR(100) NOT NULL,
	PRIMARY KEY(title_id)
);

CREATE TABLE employees(
	emp_no INT GENERATED ALWAYS AS IDENTITY,
	emp_title VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL, 
	sex VARCHAR(1) NOT NULL, 
	hire_date DATE,
	PRIMARY KEY(emp_no),
	CONSTRAINT employee_fk
		FOREIGN KEY (emp_title)
			REFERENCES title(title_id)
);


CREATE TABLE salaries(
	emp_no INT,
	salary MONEY NOT NULL,
	PRIMARY KEY(emp_no),
	CONSTRAINT salaries_fk
		FOREIGN KEY (emp_no)
			REFERENCES employees(emp_no)
);


CREATE TABLE departments(
	dept_no VARCHAR(4),
	dept_name VARCHAR(255) NOT NULL,
	PRIMARY KEY(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT,
	PRIMARY KEY(dept_no, emp_no),
 	CONSTRAINT dept_manager_fk
		FOREIGN KEY (dept_no)
 			REFERENCES departments(dept_no),
 		FOREIGN KEY (emp_no)
 			REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	PRIMARY KEY(dept_no, emp_no),
 	CONSTRAINT dept_emp_fk
		FOREIGN KEY (dept_no)
 			REFERENCES departments(dept_no),
 		FOREIGN KEY (emp_no)
 			REFERENCES employees(emp_no)
);

