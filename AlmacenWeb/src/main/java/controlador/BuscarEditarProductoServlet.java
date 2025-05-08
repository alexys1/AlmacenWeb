package controlador;

import dao.ProductoDAO;
import modelo.Producto;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/buscar-editar-producto")
public class BuscarEditarProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String categoriaIdStr = request.getParameter("categoriaId");

        ProductoDAO dao = new ProductoDAO();
        List<Producto> resultados;

        // Si NO hay filtros → mostrar todo
        if ((nombre == null || nombre.isEmpty()) && (categoriaIdStr == null || categoriaIdStr.isEmpty())) {
            resultados = dao.listarTodos();
        } else {
            int categoriaId = (categoriaIdStr != null && !categoriaIdStr.isEmpty())
                    ? Integer.parseInt(categoriaIdStr)
                    : -1;

            resultados = dao.buscarPorNombreYCategoria(nombre, categoriaId);
        }

        request.setAttribute("productos", resultados);
        request.getRequestDispatcher("modificarProducto.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // ✅ Recibir los datos del formulario de edición
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        double precioCompra = Double.parseDouble(request.getParameter("precioCompra"));
        double precioMayor = Double.parseDouble(request.getParameter("precioMayor"));
        double precioUnidad = Double.parseDouble(request.getParameter("precioUnidad"));
        int categoriaId = Integer.parseInt(request.getParameter("categoriaId"));

        // ✅ Crear producto actualizado
        Producto producto = new Producto(id, nombre, precioCompra, precioMayor, precioUnidad, categoriaId);
        ProductoDAO dao = new ProductoDAO();
        dao.actualizar(producto); // Asegúrate de tener este método

        // ✅ Redirigir para volver a cargar la lista
        response.sendRedirect("buscar-editar-producto");
    }
}
