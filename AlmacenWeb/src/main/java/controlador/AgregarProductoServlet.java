package controlador;

import dao.ProductoDAO;
import modelo.Producto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/agregar-producto")
public class AgregarProductoServlet extends HttpServlet {

    // ✅ GET → mostrar el formulario
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.getRequestDispatcher("agregarProducto.jsp").forward(request, response);
    }

    // ✅ POST → guardar el producto y mostrar la lista
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Recoger datos del formulario
        String nombre = request.getParameter("nombre");
        double precioCompra = Double.parseDouble(request.getParameter("precioCompra"));
        double precioMayor = Double.parseDouble(request.getParameter("precioMayor"));
        double precioUnidad = Double.parseDouble(request.getParameter("precioUnidad"));
        String cat = request.getParameter("categoriaId");
int categoriaId = (cat != null && !cat.isEmpty()) ? Integer.parseInt(cat) : -1;


        // Crear y guardar producto
        Producto producto = new Producto(0, nombre, precioCompra, precioMayor, precioUnidad, categoriaId);
        ProductoDAO dao = new ProductoDAO();
        dao.agregar(producto);

        // Cargar lista actualizada
        List<Producto> productos = dao.listarTodos();
        request.setAttribute("productos", productos);

        // Mostrar lista actualizada
        request.getRequestDispatcher("listaProductos.jsp").forward(request, response);
    }
}
