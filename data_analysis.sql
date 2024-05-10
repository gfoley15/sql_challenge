##List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no

##List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986
ORDER BY EXTRACT(MONTH FROM e.hire_date)

##List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager AS m
JOIN employees AS e
ON m.emp_no = e.emp_no
JOIN departments AS d
ON m.dept_no = d.dept_no

##List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, n.dept_name
FROM dept_emp AS d
JOIN employees AS e
ON d.emp_no = e.emp_no
JOIN departments AS n
ON n.dept_no = d.dept_no
ORDER BY n.dept_no

##List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%' OR e.last_name LIKE 'b%' 

##List each employee in the Sales department, including their employee number, last name, and first name.
SELECT n.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees AS e
JOIN dept_emp AS d
ON e.emp_no = d.emp_no
JOIN departments AS n
ON n.dept_no = d.dept_no
WHERE n.dept_name = 'Sales' OR n.dept_no = 'd007'
ORDER BY e.emp_no

##List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT n.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees AS e
JOIN dept_emp AS d
ON e.emp_no = d.emp_no
JOIN departments AS n
ON n.dept_no = d.dept_no
WHERE n.dept_name = 'Sales' OR n.dept_name = 'Development' OR n.dept_no = 'd007' OR n.dept_no = 'd005'
ORDER BY e.emp_no

##List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, count(e.last_name) AS "last_name_frequency_count"
FROM employees AS e
GROUP BY e.last_name
ORDER BY last_name_frequency_count desc