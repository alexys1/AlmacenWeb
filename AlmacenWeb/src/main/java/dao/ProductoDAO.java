package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import modelo.Producto;
import dao.Conexion;

public class ProductoDAO {

    // Listar todos los productos
    public List<Producto> listarTodos() {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT * FROM productos";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecioCompra(rs.getDouble("precio_compra"));
                p.setPrecioMayor(rs.getDouble("precio_mayor"));
                p.setPrecioUnidad(rs.getDouble("precio_unidad"));
                p.setCategoriaId(rs.getInt("categoria_id"));
                productos.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productos;
    }

    // Agregar un producto nuevo
    public void agregar(Producto producto) {
        String sql = "INSERT INTO productos (nombre, precio_compra, precio_mayor, precio_unidad, categoria_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, producto.getNombre());
            ps.setDouble(2, producto.getPrecioCompra());
            ps.setDouble(3, producto.getPrecioMayor());
            ps.setDouble(4, producto.getPrecioUnidad());
            ps.setInt(5, producto.getCategoriaId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Buscar productos por nombre
    public List<Producto> buscarPorNombre(String nombre) {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT * FROM productos WHERE nombre LIKE ?";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + nombre + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecioCompra(rs.getDouble("precio_compra"));
                p.setPrecioMayor(rs.getDouble("precio_mayor"));
                p.setPrecioUnidad(rs.getDouble("precio_unidad"));
                p.setCategoriaId(rs.getInt("categoria_id"));
                productos.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productos;
    }

   public List<Producto> buscarPorNombreYCategoria(String nombre, int categoriaId) {
    List<Producto> productos = new ArrayList<>();
    String sql = "SELECT * FROM productos WHERE nombre LIKE ?" +
                 (categoriaId != -1 ? " AND categoria_id = ?" : "");

    try (Connection conn = Conexion.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, "%" + nombre + "%");

        if (categoriaId != -1) {
            ps.setInt(2, categoriaId);
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Producto p = new Producto();
            p.setId(rs.getInt("id"));
            p.setNombre(rs.getString("nombre"));
            p.setPrecioCompra(rs.getDouble("precio_compra"));
            p.setPrecioMayor(rs.getDouble("precio_mayor"));
            p.setPrecioUnidad(rs.getDouble("precio_unidad"));
            p.setCategoriaId(rs.getInt("categoria_id"));
            productos.add(p);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return productos;
}
public void eliminar(int id) {
    String sql = "DELETE FROM productos WHERE id = ?";

    try (Connection conn = Conexion.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, id);
        ps.executeUpdate();

    } catch (SQLException e) {
        e.printStackTrace();
    }
}
public void actualizar(Producto producto) {
    String sql = "UPDATE productos SET nombre = ?, precio_compra = ?, precio_mayor = ?, precio_unidad = ?, categoria_id = ? WHERE id = ?";

    try (Connection conn = Conexion.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, producto.getNombre());
        ps.setDouble(2, producto.getPrecioCompra());
        ps.setDouble(3, producto.getPrecioMayor());
        ps.setDouble(4, producto.getPrecioUnidad());
        ps.setInt(5, producto.getCategoriaId());
        ps.setInt(6, producto.getId());

        ps.executeUpdate();

    } catch (SQLException e) {
        e.printStackTrace();
    }
}


}
