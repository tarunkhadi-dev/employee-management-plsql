CREATE OR REPLACE PROCEDURE delete_employee(
  p_emp_id   IN NUMBER
)
IS
BEGIN
  DELETE FROM employees
  WHERE emp_id = p_emp_id;

  COMMIT;
END delete_employee;
/
