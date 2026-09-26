# Test Project for Axeni

Для управления зависимостями и сборки проекта используется Maven.

## СУБД

**PostgreSQL**, база данных `company`.

PostgreSQL запускается в Docker-контейнере с помощью Docker Compose.

При первом запуске автоматически выполняются SQL-скрипты:

* `db/init/01__schema.sql` — создание таблиц и индексов;
* `db/init/02__data.sql` — заполнение базы демонстрационными данными.

## Запуск

Запустить PostgreSQL:

```bash
docker compose up -d
```

После запуска и успешного поднятия бд можно применять Main.java.

Для подключения к PostgreSQL используются параметры:

```text
Host: localhost
Port: 5432
Database: company
User: postgres
Password: postgres
```

## SQL-запрос

Программа получает ФИО сотрудника, его текущую должность и email, соединяя таблицы `employees` и `positions`:

```sql
SELECT e.last_name || ' ' || e.first_name AS employee,
       p.position_name AS position,
       e.email
FROM employees e
JOIN positions p ON p.position_id = e.current_position_id
ORDER BY e.last_name, e.first_name;
```

Результат выводится в консоль в виде таблицы.

## Структура проекта

```text
testTaskProj/
├── docker-compose.yml
├── Dockerfile
├── pom.xml
├── README.md
├── db/
│   └── init/
│       ├── 01__schema.sql
│       └── 02__data.sql
└── src/
    └── main/
        └── java/
            └── Main.java
```

### Назначение файлов

* `Main.java` — Java-приложение, подключение к PostgreSQL и выполнение SQL-запроса.
* `pom.xml` — конфигурация Maven и зависимость PostgreSQL JDBC Driver.
* `Dockerfile` — инструкция для сборки Docker-образа Java-приложения.
* `docker-compose.yml` — конфигурация запуска PostgreSQL и связанных контейнеров.
* `01__schema.sql` — создание структуры базы данных.
* `02__data.sql` — демонстрационные данные.
* `README.md` — инструкция по запуску проекта.
