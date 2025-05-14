package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String host = System.getenv("DB_HOST");
            String port = System.getenv("DB_PORT");
            String db = System.getenv("DB_NAME");
            String user = System.getenv("DB_USER");
            String password = System.getenv("DB_PASSWORD");

            String url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            return DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            System.out.println("❌ Error de conexión a la base de datos:");
            e.printStackTrace(); // IMPORTANTE: muestra el error exacto en Render
            return null;
        }
    }
}
