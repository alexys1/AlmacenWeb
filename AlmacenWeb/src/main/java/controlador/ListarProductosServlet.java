package controlador;

import dao.ProductoDAO;
import modelo.Producto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/menu") // esta será la ruta principal
public class ListarProductosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener todos los productos desde la base de datos
        ProductoDAO dao = new ProductoDAO();
        List<Producto> lista = dao.listarTodos();

        // Enviar la lista al JSP
        request.setAttribute("productos", lista);

        // Redirigir a la vista principal
        request.getRequestDispatcher("listaProductos.jsp").forward(request, response);
    }
}



