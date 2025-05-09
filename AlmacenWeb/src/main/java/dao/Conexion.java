package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = System.getenv("shuttle.proxy.rlwy.net:50400/railway");       // jdbc:mysql://shuttle.proxy.rlwy.net:50400/railway
            String user = System.getenv("root");     // root
            String password = System.getenv("ibVatInrgYnmvYscbZtkxPsNKJKBXpxn"); // tu contraseña real

            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}

