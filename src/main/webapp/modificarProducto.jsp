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
                 <option value="2">Papel</option>
    <option value="3">Pañales</option>
    <option value="4">Jabones</option>
    <option value="5">Pasta dental</option>
    <option value="6">Cepillos</option>
    <option value="7">Champu</option>
    <option value="8">Desodorante</option>
    <option value="9">Toallas higiénicas</option>
    <option value="10">Detergente</option>
    <option value="11">Lejia</option>
    <option value="12">Limpia todo</option>
    <option value="13">Lavavajilla</option>
    <option value="14">Enjuague</option>
    <option value="15">Quitagrasa</option>
    <option value="16">Quitamanchas</option>
    <option value="17">Spray Sapolio</option>
    <option value="18">Menestras</option>
    <option value="19">Fideos</option>
    <option value="20">Harina</option>
    <option value="21">Leche</option>
    <option value="22">Yogurt</option>
    <option value="23">Mantequilla</option>
    <option value="24">Atunes</option>
    <option value="25">Condimentos</option>
    <option value="26">Gelatinas</option>
    <option value="27">Cafes y otros</option>
    <option value="28">Mayonesa y otros</option>
    <option value="29">Gaseosa</option>
    <option value="30">Alimento perro y otros</option>
    <option value="31">Platos y otros</option>
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
        <textarea name="nombre" class="input-tabla input-nombre" required><%= p.getNombre() %></textarea>
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
    <option value="2" <%= p.getCategoriaId() == 2 ? "selected" : "" %>>Papel</option>
    <option value="3" <%= p.getCategoriaId() == 3 ? "selected" : "" %>>Pañales</option>
    <option value="4" <%= p.getCategoriaId() == 4 ? "selected" : "" %>>Jabones</option>
    <option value="5" <%= p.getCategoriaId() == 5 ? "selected" : "" %>>Pasta dental</option>
    <option value="6" <%= p.getCategoriaId() == 6 ? "selected" : "" %>>Cepillos</option>
    <option value="7" <%= p.getCategoriaId() == 7 ? "selected" : "" %>>Champu</option>
    <option value="8" <%= p.getCategoriaId() == 8 ? "selected" : "" %>>Desodorante</option>
    <option value="9" <%= p.getCategoriaId() == 9 ? "selected" : "" %>>Toallas higienicas</option>
    <option value="10" <%= p.getCategoriaId() == 10 ? "selected" : "" %>>Detergente</option>
    <option value="11" <%= p.getCategoriaId() == 11 ? "selected" : "" %>>Lejia</option>
    <option value="12" <%= p.getCategoriaId() == 12 ? "selected" : "" %>>Limpia todo</option>
    <option value="13" <%= p.getCategoriaId() == 13 ? "selected" : "" %>>Lavavajilla</option>
    <option value="14" <%= p.getCategoriaId() == 14 ? "selected" : "" %>>Enjuague</option>
    <option value="15" <%= p.getCategoriaId() == 15 ? "selected" : "" %>>Quitagrasa</option>
    <option value="16" <%= p.getCategoriaId() == 16 ? "selected" : "" %>>Quitamanchas</option>
    <option value="17" <%= p.getCategoriaId() == 17 ? "selected" : "" %>>Spray Sapolio</option>
    <option value="18" <%= p.getCategoriaId() == 18 ? "selected" : "" %>>Menestras</option>
    <option value="19" <%= p.getCategoriaId() == 19 ? "selected" : "" %>>Fideos</option>
    <option value="20" <%= p.getCategoriaId() == 20 ? "selected" : "" %>>Harina</option>
    <option value="21" <%= p.getCategoriaId() == 21 ? "selected" : "" %>>Leche</option>
    <option value="22" <%= p.getCategoriaId() == 22 ? "selected" : "" %>>Yogurt</option>
    <option value="23" <%= p.getCategoriaId() == 23 ? "selected" : "" %>>Mantequilla</option>
    <option value="24" <%= p.getCategoriaId() == 24 ? "selected" : "" %>>Atunes</option>
    <option value="25" <%= p.getCategoriaId() == 25 ? "selected" : "" %>>Condimentos</option>
    <option value="26" <%= p.getCategoriaId() == 26 ? "selected" : "" %>>Gelatinas</option>
    <option value="27" <%= p.getCategoriaId() == 27 ? "selected" : "" %>>Cafes y otros</option>
    <option value="28" <%= p.getCategoriaId() == 28 ? "selected" : "" %>>Mayonesa y otros</option>
    <option value="29" <%= p.getCategoriaId() == 29 ? "selected" : "" %>>Gaseosa</option>
    <option value="30" <%= p.getCategoriaId() == 30 ? "selected" : "" %>>Alimento perro y otros</option>
    <option value="31" <%= p.getCategoriaId() == 31 ? "selected" : "" %>>Platos y otros</option>
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
