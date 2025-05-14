<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Producto" %>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lista de Productos</title>
    <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/buscar-productos.css">
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
        <a href="listaProductos.jsp"></a>
        <!-- Logo -->
        <img src="img/logo_almacen.PNG" id="logo" alt="AYS Software Logo">

        <!-- Menú de enlaces -->
        <div class="navbar-links">
            <a href="menu" class="<%= request.getRequestURI().contains("menu") || request.getRequestURI().contains("listaProductos.jsp") ? "active" : "" %>">🔍 Buscar</a>
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
    <div class="buscar-productos-wrapper">

        <h1>Lista de Productos</h1>

        <!-- FORMULARIO DE BÚSQUEDA -->
        <form id="form-busqueda" action="buscar-producto" method="get" class="form-busqueda">
    <input type="text" name="nombre" placeholder="Buscar por nombre..."
           value="<%= request.getAttribute("busqueda") != null ? request.getAttribute("busqueda") : "" %>">

    <select name="categoriaId" id="categoriaIdSelect">
        <option value="">-- Todas las categorías --</option>
        <option value="1" <%= "1".equals(request.getAttribute("categoriaSeleccionada")) ? "selected" : "" %>>Sin categoría</option>
        <option value="2" <%= "2".equals(request.getAttribute("categoriaSeleccionada")) ? "selected" : "" %>>Categoría 1</option>
        <option value="3" <%= "3".equals(request.getAttribute("categoriaSeleccionada")) ? "selected" : "" %>>Categoría 2</option>
    </select>

    <button type="submit">Buscar</button>
    <button type="button" onclick="window.location.href='buscar-producto'" class="btn-reset">🔄 Ver Todo</button>

</form>


        <!-- RESULTADOS DE BÚSQUEDA -->
        <%
            String termino = (String) request.getAttribute("busqueda");
            if (termino != null && !termino.isEmpty()) {
        %>
            <p>🔎 Resultados para: <strong><%= termino %></strong></p>
        <%
            }
        %>

        <!-- TABLA DE PRODUCTOS -->
        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio Compra</th>
                <th>Precio Mayor</th>
                <th>Precio Unidad</th>
            </tr>
            <%
                List<Producto> productos = (List<Producto>) request.getAttribute("productos");
                if (productos != null && !productos.isEmpty()) {
                    for (Producto p : productos) {
            %>
            <tr>
                <td ><%= p.getId() %></td>
                <td><%= p.getNombre() %></td>
                <td><%= p.getPrecioCompra() %></td>
                <td><%= p.getPrecioMayor() %></td>
                <td><%= p.getPrecioUnidad() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">No hay productos para mostrar.</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
     </div>
    <!-- PIE DE PÁGINA -->
    <footer>© 2025 - Sistema de Almacén</footer>
    </div>
    <script src="js.general.js" type="text/javascript"></script>
</body>
</html>



