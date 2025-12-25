
-- Update only basic fields

CREATE OR REPLACE PROCEDURE update_employee(
  p_emp_id    IN NUMBER,
  p_name      IN VARCHAR2,
  p_dob       IN DATE,
  p_salary    IN NUMBER
)
IS
BEGIN
  UPDATE employees
  SET
    name   = p_name,
    dob    = p_dob,
    salary = p_salary
  WHERE emp_id = p_emp_id;

  COMMIT;
END update_employee;
/
