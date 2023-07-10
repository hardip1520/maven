package org.example;

import java.time.LocalTime;

public class Main {
    public static void main(String[] args) {
        String studentName = "Hardip"; // Replace with the actual student name

        LocalTime currentTime = LocalTime.now();
        String greeting = getGreeting(currentTime);

        System.out.println(greeting + ", " + studentName + ", Welcome to COMP367");
    }

    private static String getGreeting(LocalTime currentTime) {
        if (currentTime.isBefore(LocalTime.NOON)) {
            return "Good morning";
        } else {
            return "Good afternoon";
        }
    }
}
