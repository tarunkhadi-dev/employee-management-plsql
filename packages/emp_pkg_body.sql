-- Project : Employee Management System
-- Version : v4 (Packages & Modularization)
-- File    : emp_pkg_body.sql
-- Purpose : Implementation of employee package

CREATE OR REPLACE PACKAGE BODY emp_pkg AS

  PROCEDURE add_employee (
    p_name    IN employees.name%TYPE,
    p_salary  IN employees.salary%TYPE,
    p_dept_id IN employees.dept_id%TYPE
  ) IS
  BEGIN
    INSERT INTO employees (name, salary, dept_id)
    VALUES (p_name, p_salary, p_dept_id);
  END add_employee;

  PROCEDURE update_employee (
    p_emp_id  IN employees.emp_id%TYPE,
    p_salary  IN employees.salary%TYPE
  ) IS
  BEGIN
    UPDATE employees
    SET salary = p_salary
    WHERE emp_id = p_emp_id;
  END update_employee;

  PROCEDURE delete_employee (
    p_emp_id IN employees.emp_id%TYPE
  ) IS
  BEGIN
    DELETE FROM employees WHERE emp_id = p_emp_id;
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
