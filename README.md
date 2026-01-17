# Employee Management System – PL/SQL

A step-by-step Oracle **PL/SQL backend project** built incrementally from basic CRUD
to an enterprise-level HR management system.

This repository is maintained using **version-wise development (v1 → v7)** to clearly
show learning progress and real-world system evolution.

---

## Version History

| Version | What You Build |
|--------|----------------|
| v1     | Basic CRUD (Employee table + add, update, delete, get) |
| v2     | Departments + Relations |
| v3     | Triggers + Audit + Validation |
| v4     | Packages & Modularization |



---

## v1 – Basic CRUD

### Objective
Create a minimal but clean foundation for the system using **Oracle SQL & PL/SQL**.
This version focuses only on understanding **core CRUD operations** without any
advanced concepts.

### What is implemented
- `employees` table
- Stored procedures:
  - `add_employee`
  - `update_employee`
  - `delete_employee`
  - `get_employee` (using `SYS_REFCURSOR`)
- Basic test script to validate all procedures

### What is intentionally NOT included
To keep v1 simple and focused, the following are **intentionally excluded**:
- Department tables
- Foreign keys
- Triggers
- Audit logging
- Packages
- Validation logic
- Security

These will be introduced gradually in later versions.

### Folder Structure (v1)

---

## v2 – Departments + Relations

### Objective
Extend the basic employee system by introducing departments and creating
a relational structure between employees and departments.

### What is implemented
- `departments` master table
- `dept_id` column added to `employees`
- Foreign key relationship between employees and departments
- Sample department data
- Validation using join-based test queries

### Status
✔️ Completed  
✔️ Tested  
✔️ Locked  

Next version: **v3 – Triggers + Audit + Validation**

---

## v3 – Triggers + Audit + Validation

### Objective
Introduce audit logging, data validation, and controlled updates
using database triggers.

### What is implemented
- `employee_audit` table
- Triggers for INSERT, UPDATE, DELETE auditing
- Salary validation using BEFORE trigger
- Test cases to validate audit and validation logic

### Status
✔️ Completed  
✔️ Tested  
✔️ Locked  

Next version: **v4 – Packages & Modularization**
---

## v4 – Packages & Modularization

### Objective
Refactor standalone procedures into a structured PL/SQL package
to improve encapsulation, maintainability, and API clarity.

### What is implemented
- `emp_pkg` package (specification & body)
- Centralized CRUD logic inside package
- Public API via package specification
- Package-based test script

### Status
✔️ Completed  
✔️ Tested  
✔️ Locked  

Next version: **v5 – Advanced Validation & Exception Handling**





