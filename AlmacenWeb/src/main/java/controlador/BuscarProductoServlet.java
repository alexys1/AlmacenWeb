package controlador;

import dao.ProductoDAO;
import modelo.Producto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/buscar-producto")
public class BuscarProductoServlet extends HttpServlet {

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String nombre = request.getParameter("nombre");
    String categoriaIdStr = request.getParameter("categoriaId");

    ProductoDAO dao = new ProductoDAO();
    List<Producto> productos;

    // Si NO hay filtros → mostrar todo
    if ((nombre == null || nombre.isEmpty()) && (categoriaIdStr == null || categoriaIdStr.isEmpty())) {
        productos = dao.listarTodos();
    } else {
        int categoriaId = (categoriaIdStr != null && !categoriaIdStr.isEmpty())
                ? Integer.parseInt(categoriaIdStr)
                : -1;

        productos = dao.buscarPorNombreYCategoria(nombre, categoriaId);
    }

    request.setAttribute("productos", productos);
    request.setAttribute("busqueda", nombre); // Para mantener el input
    request.setAttribute("categoriaSeleccionada", categoriaIdStr); // Para que el select recuerde la categoría

    request.getRequestDispatcher("listaProductos.jsp").forward(request, response);
}

}
