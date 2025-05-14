package controlador;

import dao.ProductoDAO;
import modelo.Producto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/eliminar-producto")
public class EliminarProductoServlet extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductoDAO dao = new ProductoDAO();
        List<Producto> lista;

        String idStr = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String categoriaIdStr = request.getParameter("categoriaId");

        // Si se solicitó eliminación
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                dao.eliminar(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Si hay filtros de búsqueda
        if ((nombre != null && !nombre.isEmpty()) || (categoriaIdStr != null && !categoriaIdStr.isEmpty())) {
            int categoriaId = (categoriaIdStr != null && !categoriaIdStr.isEmpty())
                    ? Integer.parseInt(categoriaIdStr)
                    : -1;
            lista = dao.buscarPorNombreYCategoria(nombre != null ? nombre : "", categoriaId);
        } else {
            lista = dao.listarTodos();
        }
 request.setAttribute("busqueda", nombre);
        request.setAttribute("categoriaSeleccionada", categoriaIdStr);
        request.setAttribute("productos", lista);
        request.getRequestDispatcher("eliminarProducto.jsp").forward(request, response);
    }
}
