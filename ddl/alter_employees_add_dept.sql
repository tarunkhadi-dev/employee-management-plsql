-- Project : Employee Management System
-- Version : v2 (Departments + Relations)
-- File    : alter_employees_add_dept.sql
-- Purpose : Add department reference to employees

ALTER TABLE employees
ADD dept_id NUMBER;
