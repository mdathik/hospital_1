package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static Connection conn;

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL Driver

            // Replace with Railway Database Details
            String jdbcUrl = "jdbc:mysql://mysql.railway.internal.railway.app:3306/railway?useSSL=false&allowPublicKeyRetrieval=true";
            String dbUser = "root";
            String dbPass = "UvwGBUCZkCywMkpbsWtfBRPQNegfGRbT";

            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}
