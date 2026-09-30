INSERT INTO positions (position_name) VALUES
    ('Backend Developer'),
    ('Frontend Developer'),
    ('QA Engineer'),
    ('Project Manager'),
    ('System Administrator');

INSERT INTO departments (department_name)
VALUES ('Разработка'),
       ('Тестирование'),
       ('IT-инфраструктура'),
       ('Управление проектами');


INSERT INTO document_types (type_name)
VALUES ('Паспорт'),
       ('Вид на жительство'),
       ('Водительское удостоверение');

INSERT INTO employees (last_name,
                       first_name,
                       middle_name,
                       birth_date,
                       email,
                       phone,
                       current_position_id)
SELECT 'Иванов',
       'Иван',
       'Иванович',
       '1990-03-15',
       'ivan.ivanov@example.com',
       '+79991234567',
       position_id
FROM positions
WHERE position_name = 'Backend Developer';


INSERT INTO employees (last_name,
                       first_name,
                       middle_name,
                       birth_date,
                       email,
                       phone,
                       current_position_id)
SELECT 'Петрова',
       'Анна',
       'Сергеевна',
       '1994-07-22',
       'anna.petrova@mail.com',
       '+79992345678',
       position_id
FROM positions
WHERE position_name = 'Project Manager';


INSERT INTO employees (last_name,
                       first_name,
                       middle_name,
                       birth_date,
                       email,
                       phone,
                       current_position_id)
SELECT 'Сидоров',
       'Пётр',
       'Алексеевич',
       '1988-11-03',
       'petr.sidorov@gmail.com',
       '+79993456789',
       position_id
FROM positions
WHERE position_name = 'QA Engineer';


INSERT INTO employees (last_name,
                       first_name,
                       middle_name,
                       birth_date,
                       email,
                       phone,
                       current_position_id)
SELECT 'Кузнецова',
       'Мария',
       'Игоревна',
       '1996-01-18',
       'maria.kuznetsova@outlook.com',
       '+79994567890',
       position_id
FROM positions
WHERE position_name = 'Frontend Developer';


INSERT INTO employees (last_name,
                       first_name,
                       middle_name,
                       birth_date,
                       email,
                       phone,
                       current_position_id)
SELECT 'Васильев',
       'Дмитрий',
       'Олегович',
       '1985-09-27',
       'dmitry.vasiliev@gmail.com',
       '+79995678901',
       position_id
FROM positions
WHERE position_name = 'System Administrator';

INSERT INTO employee_departments (employee_id,
                                  department_id,
                                  assigned_from)
SELECT e.employee_id,
       d.department_id,
       '2024-01-15'
FROM employees e
         JOIN departments d
              ON d.department_name = 'Разработка'
WHERE e.email = 'ivan.ivanov@example.com';


INSERT INTO employee_departments (employee_id,
                                  department_id,
                                  assigned_from)
SELECT e.employee_id,
       d.department_id,
       '2023-09-01'
FROM employees e
         JOIN departments d
              ON d.department_name = 'Управление проектами'
WHERE e.email = 'anna.petrova@mail.com';


INSERT INTO employee_departments (employee_id,
                                  department_id,
                                  assigned_from)
SELECT e.employee_id,
       d.department_id,
       '2024-02-10'
FROM employees e
         JOIN departments d
              ON d.department_name = 'Тестирование'
WHERE e.email = 'petr.sidorov@gmail.com';


INSERT INTO employee_departments (employee_id,
                                  department_id,
                                  assigned_from)
SELECT e.employee_id,
       d.department_id,
       '2024-03-01'
FROM employees e
         JOIN departments d
              ON d.department_name = 'Разработка'
WHERE e.email = 'maria.kuznetsova@outlook.com';


INSERT INTO employee_departments (employee_id,
                                  department_id,
                                  assigned_from)
SELECT e.employee_id,
       d.department_id,
       '2022-06-20'
FROM employees e
         JOIN departments d
              ON d.department_name = 'IT-инфраструктура'
WHERE e.email = 'dmitry.vasiliev@gmail.com';

INSERT INTO employee_documents (employee_id,
                                document_type_id,
                                document_number,
                                issued_on,
                                issuing_authority)
SELECT e.employee_id,
       dt.document_type_id,
       '4500 123456',
       '2015-04-12',
       'УФМС России'
FROM employees e
         JOIN document_types dt
              ON dt.type_name = 'Паспорт'
WHERE e.email = 'ivan.ivanov@example.com';


INSERT INTO employee_documents (employee_id,
                                document_type_id,
                                document_number,
                                issued_on,
                                issuing_authority)
SELECT e.employee_id,
       dt.document_type_id,
       '4501 234567',
       '2016-08-20',
       'УФМС России'
FROM employees e
         JOIN document_types dt
              ON dt.type_name = 'Паспорт'
WHERE e.email = 'anna.petrova@mail.com';


INSERT INTO employee_documents (employee_id,
                                document_type_id,
                                document_number,
                                issued_on,
                                issuing_authority)
SELECT e.employee_id,
       dt.document_type_id,
       '4502 345678',
       '2014-12-05',
       'УФМС России'
FROM employees e
         JOIN document_types dt
              ON dt.type_name = 'Паспорт'
WHERE e.email = 'petr.sidorov@gmail.com';


INSERT INTO employee_documents (employee_id,
                                document_type_id,
                                document_number,
                                issued_on,
                                issuing_authority)
SELECT e.employee_id,
       dt.document_type_id,
       '4503 456789',
       '2017-06-14',
       'УФМС России'
FROM employees e
         JOIN document_types dt
              ON dt.type_name = 'Паспорт'
WHERE e.email = 'maria.kuznetsova@outlook.com';


INSERT INTO employee_documents (employee_id,
                                document_type_id,
                                document_number,
                                issued_on,
                                issuing_authority)
SELECT e.employee_id,
       dt.document_type_id,
       '4504 567890',
       '2013-10-30',
       'УФМС России'
FROM employees e
         JOIN document_types dt
              ON dt.type_name = 'Паспорт'
WHERE e.email = 'dmitry.vasiliev@gmail.com';