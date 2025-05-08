<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="modelo.Producto" %>
<%@ page import="java.util.List" %>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eliminar Producto</title>
    <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/eliminar-productos.css">
</head>
<body>
<div class="layout-wrapper">
    <div class="main-content">
        <!-- MENÚ SUPERIOR -->
        <div class="navbar">
            <div class="navbar-content">
                <!-- Botón hamburguesa (visible en móviles) -->
                <button class="hamburger" aria-label="Menú">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>

                <!-- Logo -->
                <img src="img/logo_almacen.PNG" id="logo" alt="AYS Software Logo">

                <!-- Menú de enlaces -->
                <div class="navbar-links">
                    <a href="menu" class="<%= request.getRequestURI().contains("menu")|| request.getRequestURI().contains("listaProductos.jsp") ? "active" : "" %>">🔍 Buscar</a>
                    <a href="buscar-editar-producto" class="<%= request.getRequestURI().contains("modificar") ? "active" : "" %>">✏️ Modificar</a>
                    <a href="agregar-producto" class="<%= request.getRequestURI().contains("agregar") ? "active" : "" %>">➕ Agregar</a>
                    <a href="eliminar-producto" class="<%= request.getRequestURI().contains("eliminar") ? "active" : "" %>">🗑️ Eliminar</a>
                </div>

                <!-- Login -->
                <div class="navbar-login">
                    <div class="dropdown">
                        <a href="#" class="user-icon">👤</a>
                        <div class="dropdown-content">
                            <p><strong><%= session.getAttribute("usuario") %></strong></p>
                            <a href="logout.jsp">Cerrar sesión</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- CONTENIDO PRINCIPAL -->
        <div class="eliminar-productos-wrapper">
            <h1>Eliminar Producto</h1>

            <!-- FORMULARIO DE BÚSQUEDA -->
            <form action="eliminar-producto" method="get" class="form-busqueda">
                <input type="text" name="nombre" placeholder="Buscar por nombre...">
                <select name="categoriaId">
                    <option value="">-- Todas las categorías --</option>
                    <option value="1">Sin Categoría</option>
                    <option value="2">Categoría 1</option>
                    <option value="3">Categoría 2</option>
                </select>
                <button type="submit">Buscar</button>
                <button type="button" class="btn-reset" onclick="window.location.href='eliminar-producto'">🔄 Ver Todo</button>
            </form>

            <!-- TABLA DE RESULTADOS (Siempre visible) -->
            <table class="tabla-productos">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Precio Compra</th>
                    <th>Precio Mayor</th>
                    <th>Precio Unidad</th>
                    <th>Acción</th>
                </tr>
                <%
                    List<Producto> productos = (List<Producto>) request.getAttribute("productos");
                    if (productos != null && !productos.isEmpty()) {
                        for (Producto p : productos) {
                %>
                <tr>
                    <td><%= p.getId() %></td>
                    <td><%= p.getNombre() %></td>
                    <td><%= p.getPrecioCompra() %></td>
                    <td><%= p.getPrecioMayor() %></td>
                    <td><%= p.getPrecioUnidad() %></td>
                    <td>
                        <a href="eliminar-producto?id=<%= p.getId() %>" class="btn-eliminar" onclick="return confirm('¿Seguro que deseas eliminar este producto?')">❌ Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    } else if (request.getAttribute("productos") != null) {
                %>
                <tr>
                    <td colspan="6" class="mensaje-vacio">No se encontraron productos.</td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>
    <footer>© 2025 - Sistema de Almacén</footer>
</div>
<script src="js.general.js" type="text/javascript"></script>
</body>
</html>

