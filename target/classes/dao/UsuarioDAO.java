package dao;

import modelo.Usuario;
import java.sql.*;

public class UsuarioDAO {

    public Usuario validar(String username, String password) {
        String sql = "SELECT * FROM usuarios WHERE username = ? AND password = ?";

        Connection conn = Conexion.getConnection();
        if (conn == null) {
            System.out.println("❌ No se pudo conectar a la base de datos en validar()");
            return null;
        }

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Usuario user = new Usuario();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                conn.close();
                return user;
            }

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
