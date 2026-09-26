CREATE TABLE positions
(
    position_id   BIGSERIAL PRIMARY KEY,
    position_name TEXT NOT NULL UNIQUE
);


CREATE TABLE departments
(
    department_id   BIGSERIAL PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE
);

CREATE TABLE employees
(
    employee_id         BIGSERIAL PRIMARY KEY,
    last_name           TEXT         NOT NULL,
    first_name          TEXT         NOT NULL,
    middle_name         TEXT,
    birth_date          DATE         NOT NULL,
    email               VARCHAR(254) NOT NULL UNIQUE,
    phone               VARCHAR(50),
    current_position_id BIGINT       NOT NULL
        REFERENCES positions (position_id)
);


CREATE TABLE employee_departments
(
    employee_id   BIGINT NOT NULL
        REFERENCES employees (employee_id) ON DELETE CASCADE,

    department_id BIGINT NOT NULL
        REFERENCES departments (department_id) ON DELETE CASCADE,

    assigned_from DATE   NOT NULL DEFAULT CURRENT_DATE,

    PRIMARY KEY (employee_id, department_id)
);


CREATE TABLE document_types
(
    document_type_id BIGSERIAL PRIMARY KEY,
    type_name        TEXT NOT NULL UNIQUE
);


CREATE TABLE employee_documents
(
    document_id       BIGSERIAL PRIMARY KEY,

    employee_id       BIGINT NOT NULL
        REFERENCES employees (employee_id) ON DELETE CASCADE,

    document_type_id  BIGINT NOT NULL
        REFERENCES document_types (document_type_id),

    document_number   TEXT   NOT NULL,
    issued_on         DATE   NOT NULL,
    issuing_authority TEXT   NOT NULL,

    UNIQUE (document_type_id, document_number)
);


CREATE INDEX idx_employee_documents_issued_on
    ON employee_documents (issued_on);

CREATE INDEX idx_employee_documents_employee_id
    ON employee_documents (employee_id);

CREATE INDEX idx_employee_departments_department
    ON employee_departments (department_id);

CREATE INDEX idx_employees_last_name
    ON employees (last_name);

