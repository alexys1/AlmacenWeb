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
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Modificar Producto</title>
    <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/modificar-productos.css">
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

    <!-- CONTENIDO -->
    <div class="modificar-productos-wrapper">
        <h1>Modificar Producto</h1>

        <!-- FORMULARIO DE BÚSQUEDA -->
        <form action="buscar-editar-producto" method="get" class="form-busqueda">
            <input type="text" name="nombre" id="busqueda-modificar-nombre" placeholder="Buscar por nombre...">
<select name="categoriaId" id="busqueda-modificar-categoria">

                <option value="">-- Todas las categorías --</option>
                <option value="1">Sin Categoría</option>
                <option value="2">Categoría 1</option>
                <option value="3">Categoría 2</option>
            </select>
            <button type="submit">Buscar</button>
            <button type="button" onclick="window.location.href='buscar-editar-producto'" class="btn-reset">🔄 Ver Todo</button>


        </form>

        <!-- TABLA DE RESULTADOS -->
        <%
            List<Producto> productos = (List<Producto>) request.getAttribute("productos");
            if (productos != null && !productos.isEmpty()) {
        %>
       <table class="tabla-productos">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio Compra</th>
            <th>Precio Mayor</th>
            <th>Precio Unidad</th>
            <th>Categoría</th>
            <th>Acción</th>
        </tr>
    </thead>
    <tbody>
    <%
        for (Producto p : productos) {
    %>
    <form action="buscar-editar-producto" method="post">
<tr>
    <td data-label="ID">
        <input type="hidden" name="id" value="<%= p.getId() %>"><%= p.getId() %>
    </td>
    <td data-label="Nombre">
        <input type="text" name="nombre" value="<%= p.getNombre() %>" class="input-tabla" required>
    </td>
    <td data-label="Precio Compra">
        <input type="number" name="precioCompra" value="<%= p.getPrecioCompra() %>" step="0.01" class="input-tabla" required>
    </td>
    <td data-label="Precio Mayor">
        <input type="number" name="precioMayor" value="<%= p.getPrecioMayor() %>" step="0.01" class="input-tabla" required>
    </td>
    <td data-label="Precio Unidad">
        <input type="number" name="precioUnidad" value="<%= p.getPrecioUnidad() %>" step="0.01" class="input-tabla" required>
    </td>
    <td data-label="Categoría">
        <select name="categoriaId" class="input-tabla">
            <option value="1" <%= p.getCategoriaId() == 1 ? "selected" : "" %>>Sin Categoría</option>
            <option value="2" <%= p.getCategoriaId() == 2 ? "selected" : "" %>>Categoría 1</option>
            <option value="3" <%= p.getCategoriaId() == 3 ? "selected" : "" %>>Categoría 2</option>
        </select>
    </td>
    <td class="accion-btn" data-label="Acción">
        <button type="submit" class="btn-editar">💾 Guardar</button>
    </td>
</tr>

</form>

    <%
        }
    %>
    </tbody>
</table>

        <%
            } else if (request.getAttribute("productos") != null) {
        %>
        <table class="tabla-productos">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio Compra</th>
            <th>Precio Mayor</th>
            <th>Precio Unidad</th>
            <th>Categoría</th>
            <th>Acción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="7" class="mensaje-vacio">No se encontraron productos.</td>
        </tr>
    </tbody>
</table>


        <%
            }
        %>
    </div>
     </div>
    <!-- PIE DE PÁGINA -->
    <footer>© 2025 - Sistema de Almacén</footer>
</div>
    <script src="js.general.js" type="text/javascript"></script>
</body>
</html>
