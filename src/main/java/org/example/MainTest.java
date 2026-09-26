package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class MainTest {

    @Test
    void formatEmployeeWorksCorrectly() {
        String result = Main.formatEmployee(
                "Ivan Petrov",
                "Developer",
                "ivan@gmail.com"
        );

        assertEquals(
                "Ivan Petrov                    | Developer                 | ivan@gmail.com",
                result
        );
    }

    @Test
    void formatEmployeeKeepsEmail() {
        String result = Main.formatEmployee(
                "Anna Ivanova",
                "Manager",
                "anna@mail.com"
        );

        assertEquals(
                String.format(
                        "%-30s | %-25s | %s",
                        "Anna Ivanova",
                        "Manager",
                        "anna@mail.com"
                ),
                result
        );
    }
}