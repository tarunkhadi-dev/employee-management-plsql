-- Version : v3
-- Purpose : Prevent invalid salary values

CREATE OR REPLACE TRIGGER employee_salary_validation_trg
BEFORE INSERT OR UPDATE ON employees
FOR EACH ROW
BEGIN
  IF :NEW.salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative');
  END IF;
END;
/
