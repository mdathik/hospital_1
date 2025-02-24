package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static Connection conn;

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get database credentials from environment variables
            String dbUrl = System.getenv("DB_URL");  // Render MySQL URL
            String dbUser = System.getenv("DB_USER"); // MySQL username
            String dbPass = System.getenv("DB_PASS"); // MySQL password

            // If environment variables are not set, use default (for local testing)
            if (dbUrl == null) dbUrl = "jdbc:mysql://localhost:3306/hospital_2?useSSL=false&allowPublicKeyRetrieval=true";
            if (dbUser == null) dbUser = "root";
            if (dbPass == null) dbPass = "7860";

            // Establish database connection
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }

}
