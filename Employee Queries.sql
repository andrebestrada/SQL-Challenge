-- Schema
SET datestyle = "SQL, MDY";
show datestyle

--Data Analysis
--Once you have a complete database, do the following:

--List the following details of each employee: employee number, last name, first name, sex, and salary.
--emp_no,last_name,first_name,sex
select employees.emp_no,last_name,first_name,sex,salary from employees
left join salaries
on employees.emp_no = salaries.emp_no
order by salary desc;

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees 
where to_date(hire_date,'MM/DD/YYYY') between '01/01/1986' and '12/31/1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dep1.dept_no, dep.dept_name, dep1.emp_no, e.last_name, e.first_name from dept_manager as dep1
join department as dep on dep.dept_no = dep1.dept_no
join employees as e on dep1.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, de.dept_name from employees as e
join dept_emp as d on d.emp_no = e.emp_no
join department as de on de.dept_no = d.dept_no;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees
where first_name='Hercules' and last_name like 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, de.dept_name from employees as e
join dept_emp as d on d.emp_no = e.emp_no
join department as de on de.dept_no = d.dept_no
where de.dept_name= 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, de.dept_name from employees as e
join dept_emp as d on d.emp_no = e.emp_no
join department as de on de.dept_no = d.dept_no
where de.dept_name = 'Sales' or de.dept_name = 'Development'



--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) from employees
group by last_name
order by count desc;
