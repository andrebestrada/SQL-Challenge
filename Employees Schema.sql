-- Employees Schema

DROP TABLE employees;
DROP TABLE titles;
DROP TABLE dept_emp;
DROP TABLE salaries;
DROP TABLE department;
DROP TABLE dept_manager;
	
CREATE TABLE  employees (
    emp_no INT   NOT NULL,
    title_id varchar(10)   NOT NULL,
    birth_date varchar(30)   NOT NULL,
    first_name varchar(30)   NOT NULL,
    last_name varchar(30)   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date varchar(30)   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE department (
    Dept_no varchar(30)   NOT NULL,
    Dept_name varchar(30)   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        Dept_no
     )
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar(30)   NOT NULL
);

CREATE TABLE dept_manager (
    dept_no varchar(30)   NOT NULL,
    emp_no int   NOT NULL
);


CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary money   NOT NULL
);

CREATE TABLE titles (
    title_id varchar(10)   NOT NULL,
    title varchar(30)  NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (title_id)
);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (Dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (Dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

