-- Basic insert procedure (no validation yet)

CREATE OR REPLACE PROCEDURE add_employee(
  p_name      IN VARCHAR2,
  p_dob       IN DATE,
  p_salary    IN NUMBER
)
IS
BEGIN
  INSERT INTO employees(name, dob, salary, hire_date)
  VALUES (p_name, p_dob, p_salary, SYSDATE);

  COMMIT;
END add_employee;
/
