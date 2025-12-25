-- =====================================================
-- Project : Employee Management System
-- Version : v1 (Basic CRUD)
-- File    : test_v1_run.sql
-- Purpose : Test all v1 procedures and cursor output
-- =====================================================

SET SERVEROUTPUT ON
SET VERIFY OFF

PROMPT ================================
PROMPT Running v1 Test Script
PROMPT ================================

-- -----------------------------------------------------
-- 1?? ADD EMPLOYEE
-- -----------------------------------------------------
BEGIN
  add_employee(
    p_name   => 'Test User',
    p_dob    => DATE '1995-05-10',
    p_salary => 35000
  );

  DBMS_OUTPUT.PUT_LINE('? Employee added successfully');
END;
/
-- -----------------------------------------------------
-- 2?? UPDATE EMPLOYEE
-- -----------------------------------------------------
BEGIN
  update_employee(
    p_emp_id => 1,
    p_name   => 'Test User Updated',
    p_dob    => DATE '1995-05-10',
    p_salary => 42000
  );

  DBMS_OUTPUT.PUT_LINE('? Employee updated successfully');
END;
/
-- -----------------------------------------------------
-- 3?? GET EMPLOYEE (PROPER CURSOR FETCH & DISPLAY)
-- -----------------------------------------------------
DECLARE
  rc        SYS_REFCURSOR;
  v_emp_id  employees.emp_id%TYPE;
  v_name    employees.name%TYPE;
  v_dob     employees.dob%TYPE;
  v_salary  employees.salary%TYPE;
  v_hire    employees.hire_date%TYPE;
BEGIN
  get_employee(1, rc);

  LOOP
    FETCH rc INTO v_emp_id, v_name, v_dob, v_salary, v_hire;
    EXIT WHEN rc%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('-------------------------------');
    DBMS_OUTPUT.PUT_LINE('EMP ID     : ' || v_emp_id);
    DBMS_OUTPUT.PUT_LINE('NAME       : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('DOB        : ' || TO_CHAR(v_dob, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('SALARY     : ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('HIRE DATE  : ' || TO_CHAR(v_hire, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('-------------------------------');
  END LOOP;

  CLOSE rc;
END;
/
-- -----------------------------------------------------
-- 4?? DELETE EMPLOYEE
-- -----------------------------------------------------
BEGIN
  delete_employee(1);
  DBMS_OUTPUT.PUT_LINE('? Employee deleted successfully');
END;
/
-- -----------------------------------------------------
-- 5?? VERIFY DELETE
-- -----------------------------------------------------
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM employees WHERE emp_id = 1;

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('? Delete verification passed (record not found)');
  ELSE
    DBMS_OUTPUT.PUT_LINE('? Delete verification failed');
  END IF;
END;
/
PROMPT ================================
PROMPT v1 Test Completed Successfully
PROMPT ================================
