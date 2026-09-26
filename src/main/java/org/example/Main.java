package org.example;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {

    private static final Logger logger =
            Logger.getLogger(Main.class.getName());

    private static final String SQL = """
        SELECT e.last_name || ' ' || e.first_name AS employee,
               p.position_name AS position,
               e.email
        FROM employees e
        JOIN positions p ON p.position_id = e.current_position_id
        ORDER BY e.last_name, e.first_name;
        """;

    public static void main(String[] args) {
        String host = env("DB_HOST", "localhost");
        String port = env("DB_PORT", "5432");
        String db   = env("DB_NAME", "company");
        String user = env("DB_USER", "postgres");
        String pass = env("DB_PASSWORD", "postgres");

        String url = "jdbc:postgresql://" + host + ":" + port + "/" + db;

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement stmt = conn.prepareStatement(SQL);
             ResultSet rs = stmt.executeQuery()) {

            logger.info("Подключение к базе данных установлено");

            boolean hasRows = false;

            System.out.printf("%-30s | %-25s | %s%n",
                    "Сотрудник", "Должность", "Email");
            System.out.println("-".repeat(80));

            while (rs.next()) {
                hasRows = true;

                System.out.println(formatEmployee(
                        rs.getString("employee"),
                        rs.getString("position"),
                        rs.getString("email")
                        )
                );
            }

            if (!hasRows) {
                System.out.println("Нету строчек.");
            }

        } catch (SQLException e) {
            logger.log(
                    Level.SEVERE,
                    "Ошибка подключения или выполнения SQL",
                    e
            );

            System.exit(1);
        }
    }

    public static String formatEmployee(
            String employee,
            String position,
            String email
    ) {
        return String.format(
                "%-30s | %-25s | %s",
                employee,
                position,
                email
        );
    }

    private static String env(String name, String defaultValue) {
        String value = System.getenv(name);
        return value != null ? value : defaultValue;
    }
}