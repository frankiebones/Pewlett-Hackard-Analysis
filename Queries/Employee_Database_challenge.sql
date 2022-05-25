-- SELECT emp_no, first_name, and last_name columns from the Employees table
-- title, from_date, and to_date columns from the Titles table.
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date >= '1952-01-01' AND e.birth_date <= '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT (title) AS count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965
SELECT DISTINCT ON (e.emp_no) e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01' AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;