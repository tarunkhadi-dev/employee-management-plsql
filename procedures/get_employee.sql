-- Return a single employee using SYS_REFCURSOR

CREATE OR REPLACE PROCEDURE get_employee(
  p_emp_id  IN NUMBER,
  p_result  OUT SYS_REFCURSOR
)
IS
BEGIN
  OPEN p_result FOR
    SELECT emp_id, name, dob, salary, hire_date
    FROM employees
    WHERE emp_id = p_emp_id;
END get_employee;
/
