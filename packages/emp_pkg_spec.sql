-- Project : Employee Management System
-- Version : v4 (Packages & Modularization)
-- File    : emp_pkg_spec.sql
-- Purpose : Public interface for employee operations

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

END emp_pkg;
/
