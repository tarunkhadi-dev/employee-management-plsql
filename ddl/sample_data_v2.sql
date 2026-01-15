-- Project : Employee Management System
-- Version : v2 (Departments + Relations)
-- File    : sample_data_v2.sql
-- Purpose : Insert department sample data

-- Insert departments
INSERT INTO departments (dept_name) VALUES ('HR');
INSERT INTO departments (dept_name) VALUES ('Engineering');
INSERT INTO departments (dept_name) VALUES ('Sales');

-- Assign departments to existing employees
UPDATE employees SET dept_id = 2 WHERE emp_id = 1;

COMMIT;
