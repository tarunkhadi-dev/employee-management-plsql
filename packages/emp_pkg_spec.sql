-- Project : Employee Management System
-- Version : v5 (Advanced Validation & Exception Handling)
-- File    : emp_pkg_spec.sql
-- Purpose : Public interface for employee operations with custom exceptions

CREATE OR REPLACE PACKAGE emp_pkg AS

  PROCEDURE add_employee (
    p_name    IN employees.name%TYPE,
    p_salary  IN employees.salary%TYPE,
    p_dept_id IN employees.dept_id%TYPE
  );

  PROCEDURE update_employee (
    p_emp_id  IN employees.emp_id%TYPE,
    p_salary  IN employees.salary%TYPE
  );

  PROCEDURE delete_employee (
    p_emp_id IN employees.emp_id%TYPE
  );

  PROCEDURE get_employee (
    p_emp_id IN employees.emp_id%TYPE,
    p_cursor OUT SYS_REFCURSOR
  );

  -- Custom Exceptions
  e_employee_not_found EXCEPTION;
  e_invalid_department EXCEPTION;
  e_invalid_salary     EXCEPTION;

END emp_pkg;
/