--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date >= '1986-01-01'
	  AND e.hire_date <= '1986-12-31';
--ORDER BY e.hire_date ASC;

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT dman.dept_no, depts.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager dman
JOIN departments depts
ON dman.dept_no = depts.dept_no
JOIN employees e
ON dman.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee 
--number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, depts.dept_name
FROM employees e
JOIN dept_emp demp
ON demp.emp_no = e.emp_no
JOIN departments depts
ON demp.dept_no = depts.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
	  AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, 
--last name, and first name.
SELECT dept_emp.emp_no, e.last_name, e.first_name
FROM dept_emp
JOIN employees e
ON dept_emp.emp_no = e.emp_no
JOIN departments depts
ON depts.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, e.last_name, e.first_name, depts.dept_name
FROM dept_emp
JOIN employees e
ON dept_emp.emp_no = e.emp_no
JOIN departments depts
ON depts.dept_name = 'Sales'
   OR depts.dept_name = 'Development';
	
--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT e.last_name,
COUNT(e.last_name) AS "frequency"
FROM employees e
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC;
