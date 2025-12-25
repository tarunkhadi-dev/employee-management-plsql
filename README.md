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

