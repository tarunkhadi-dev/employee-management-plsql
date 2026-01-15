SET SERVEROUTPUT ON

PROMPT ===== v3 TEST START =====

-- Insert employee
INSERT INTO employees (name, salary, dept_id)
VALUES ('Test Emp', 30000, 1);

-- Update salary
UPDATE employees
SET salary = 35000
WHERE name = 'Test Emp';

-- Attempt invalid salary
BEGIN
  UPDATE employees
  SET salary = -5000
  WHERE name = 'Test Emp';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

-- Delete employee
DELETE FROM employees WHERE name = 'Test Emp';

-- View audit
SELECT * FROM employee_audit;

PROMPT ===== v3 TEST END =====
