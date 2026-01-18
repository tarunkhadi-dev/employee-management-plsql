-- Project : Employee Management System
-- Version : v5 (Advanced Validation & Exception Handling)
-- File    : emp_pkg_body.sql
-- Purpose : Implementation of employee package with validation logic

CREATE OR REPLACE PACKAGE BODY emp_pkg AS

  -- Constants
  c_max_salary CONSTANT NUMBER := 1000000;

  PROCEDURE add_employee (
    p_name    IN employees.name%TYPE,
    p_salary  IN employees.salary%TYPE,
    p_dept_id IN employees.dept_id%TYPE
  ) IS
    v_count NUMBER;
  BEGIN
    -- Salary validation
    IF p_salary <= 0 OR p_salary > c_max_salary THEN
      RAISE e_invalid_salary;
    END IF;

    -- Department validation
    SELECT COUNT(*) INTO v_count
    FROM departments
    WHERE dept_id = p_dept_id;

    IF v_count = 0 THEN
      RAISE e_invalid_department;
    END IF;

    INSERT INTO employees (name, salary, dept_id)
    VALUES (p_name, p_salary, p_dept_id);

  EXCEPTION
    WHEN e_employee_not_found THEN
      RAISE_APPLICATION_ERROR(-20010, 'Employee not found');
    WHEN e_invalid_department THEN
      RAISE_APPLICATION_ERROR(-20011, 'Invalid department');
    WHEN e_invalid_salary THEN
      RAISE_APPLICATION_ERROR(-20012, 'Invalid salary amount');
  END add_employee;

  PROCEDURE update_employee (
    p_emp_id  IN employees.emp_id%TYPE,
    p_salary  IN employees.salary%TYPE
  ) IS
    v_count NUMBER;
  BEGIN
    -- Check employee exists
    SELECT COUNT(*) INTO v_count
    FROM employees
    WHERE emp_id = p_emp_id;

    IF v_count = 0 THEN
      RAISE e_employee_not_found;
    END IF;

    -- Salary validation
    IF p_salary <= 0 OR p_salary > c_max_salary THEN
      RAISE e_invalid_salary;
    END IF;

    UPDATE employees
    SET salary = p_salary
    WHERE emp_id = p_emp_id;

  EXCEPTION
    WHEN e_employee_not_found THEN
      RAISE_APPLICATION_ERROR(-20010, 'Employee not found');
    WHEN e_invalid_department THEN
      RAISE_APPLICATION_ERROR(-20011, 'Invalid department');
    WHEN e_invalid_salary THEN
      RAISE_APPLICATION_ERROR(-20012, 'Invalid salary amount');
  END update_employee;

  PROCEDURE delete_employee (
    p_emp_id IN employees.emp_id%TYPE
  ) IS
    v_count NUMBER;
  BEGIN
    -- Check employee exists
    SELECT COUNT(*) INTO v_count
    FROM employees
    WHERE emp_id = p_emp_id;

    IF v_count = 0 THEN
      RAISE e_employee_not_found;
    END IF;

    DELETE FROM employees WHERE emp_id = p_emp_id;

  EXCEPTION
    WHEN e_employee_not_found THEN
      RAISE_APPLICATION_ERROR(-20010, 'Employee not found');
    WHEN e_invalid_department THEN
      RAISE_APPLICATION_ERROR(-20011, 'Invalid department');
    WHEN e_invalid_salary THEN
      RAISE_APPLICATION_ERROR(-20012, 'Invalid salary amount');
  END delete_employee;

  PROCEDURE get_employee (
    p_emp_id IN employees.emp_id%TYPE,
    p_cursor OUT SYS_REFCURSOR
  ) IS
  BEGIN
    OPEN p_cursor FOR
      SELECT *
      FROM employees
      WHERE emp_id = p_emp_id;
  END get_employee;

END emp_pkg;
/