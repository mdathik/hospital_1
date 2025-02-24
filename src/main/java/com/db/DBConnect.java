package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static Connection conn;

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL Driver

            // Connect to MySQL on Your PC (Replace with your actual IP)
            String jdbcUrl = "jdbc:mysql://49.204.132.24:3306/hospital_2?useSSL=false&allowPublicKeyRetrieval=true";
            String dbUser = "root";
            String dbPass = "7860";

            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}
