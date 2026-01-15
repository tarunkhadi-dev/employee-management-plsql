-- Version : v3
-- Purpose : Audit employee insert, update, delete

CREATE OR REPLACE TRIGGER employee_audit_trg
AFTER INSERT OR UPDATE OR DELETE ON employees
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO employee_audit
      (emp_id, action_type, new_salary)
    VALUES
      (:NEW.emp_id, 'INSERT', :NEW.salary);

  ELSIF UPDATING THEN
    INSERT INTO employee_audit
      (emp_id, action_type, old_salary, new_salary)
    VALUES
      (:OLD.emp_id, 'UPDATE', :OLD.salary, :NEW.salary);

  ELSIF DELETING THEN
    INSERT INTO employee_audit
      (emp_id, action_type, old_salary)
    VALUES
      (:OLD.emp_id, 'DELETE', :OLD.salary);
  END IF;
END;
/
