SET SERVEROUTPUT ON

PROMPT ===== v2 TEST START =====

-- Verify departments
SELECT * FROM departments;

-- Verify employee + department relation
SELECT e.emp_id,
       e.name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

PROMPT ===== v2 TEST END =====
