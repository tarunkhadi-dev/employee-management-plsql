-- Project : Employee Management System
-- Version : v2 (Departments + Relations)
-- File    : constraints.sql
-- Purpose : Add foreign key constraints

ALTER TABLE employees
ADD CONSTRAINT fk_emp_department
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id);
