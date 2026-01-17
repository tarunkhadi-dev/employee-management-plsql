SET SERVEROUTPUT ON

PROMPT ===== v4 PACKAGE TEST START =====

DECLARE
  v_cur    SYS_REFCURSOR;
  v_emp    employees%ROWTYPE;
  v_emp_id employees.emp_id%TYPE;
BEGIN
  -- Insert employee and capture generated ID
  INSERT INTO employees (name, salary, dept_id)
  VALUES ('Pkg Emp', 40000, 1)
  RETURNING emp_id INTO v_emp_id;

  DBMS_OUTPUT.PUT_LINE('Inserted emp_id = ' || v_emp_id);

  -- Fetch employee using package
  emp_pkg.get_employee(v_emp_id, v_cur);
  FETCH v_cur INTO v_emp;
  CLOSE v_cur;

  DBMS_OUTPUT.PUT_LINE(
    'Employee: ' || v_emp.name || ' | Salary: ' || v_emp.salary
  );

  -- Update salary
  emp_pkg.update_employee(v_emp_id, 45000);

  -- Delete employee
  emp_pkg.delete_employee(v_emp_id);
END;
/
PROMPT ===== v4 PACKAGE TEST END =====
