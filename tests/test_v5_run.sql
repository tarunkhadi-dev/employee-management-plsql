SET SERVEROUTPUT ON

PROMPT ===== v5 VALIDATION TEST START =====

BEGIN
  -- Invalid department
  emp_pkg.add_employee('Bad Dept', 30000, 999);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

BEGIN
  -- Invalid salary
  emp_pkg.add_employee('Bad Salary', -100, 1);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

BEGIN
  -- Update non-existing employee
  emp_pkg.update_employee(9999, 40000);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

PROMPT ===== v5 VALIDATION TEST END =====
