<%@ page contentType="text/html; charset=UTF-8" %>
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
    <title>Agregar Producto</title>
    
    <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/agregar-productos.css">
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
    <div class="agregar-productos-wrapper">
        <h1>Agregar Nuevo Producto</h1>

        <form action="agregar-producto" method="post">
            <label>Nombre:</label>
            <input type="text" name="nombre" required>

            <label>Precio Compra:</label>
            <input type="number" step="0.01" name="precioCompra" required>

            <label>Precio Mayor:</label>
            <input type="number" step="0.01" name="precioMayor" required>

            <label>Precio Unidad:</label>
            <input type="number" step="0.01" name="precioUnidad" required>

            <label>Categoría:</label>
            <select name="categoriaId" required>
                <option value="">-- Seleccionar categoría --</option>
                <option value="1">Sin Categoría</option>
                <option value="2">Categoría 1</option>
                <option value="3">Categoría 2</option>
                <!-- Agrega más si deseas -->
            </select>

            <button type="submit">Guardar Producto</button>
        </form>
    </div>
     </div>
    <!-- PIE DE PÁGINA -->
    <footer>© 2025 - Sistema de Almacén</footer>
</div>
    <script src="js.general.js" type="text/javascript"></script>
</body>
</html>
