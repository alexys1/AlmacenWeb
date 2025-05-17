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
    <option value="1" <%= "1".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Sin Categoría</option>
    <option value="2" <%= "2".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Papel</option>
    <option value="3" <%= "3".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Pañales</option>
    <option value="4" <%= "4".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Jabones</option>
    <option value="5" <%= "5".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Pasta dental</option>
    <option value="6" <%= "6".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Cepillos</option>
    <option value="7" <%= "7".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Champu</option>
    <option value="8" <%= "8".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Desodorante</option>
    <option value="9" <%= "9".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Toallas higiénicas</option>
    <option value="10" <%= "10".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Detergente</option>
    <option value="11" <%= "11".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Lejia</option>
    <option value="12" <%= "12".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Limpia todo</option>
    <option value="13" <%= "13".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Lavavajilla</option>
    <option value="14" <%= "14".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Enjuague</option>
    <option value="15" <%= "15".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Quitagrasa</option>
    <option value="16" <%= "16".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Quitamanchas</option>
    <option value="17" <%= "17".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Spray Sapolio</option>
    <option value="18" <%= "18".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Menestras</option>
    <option value="19" <%= "19".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Fideos</option>
    <option value="20" <%= "20".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Harina</option>
    <option value="21" <%= "21".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Leche</option>
    <option value="22" <%= "22".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Yogurt</option>
    <option value="23" <%= "23".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Mantequilla</option>
    <option value="24" <%= "24".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Atunes</option>
    <option value="25" <%= "25".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Condimentos</option>
    <option value="26" <%= "26".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Gelatinas</option>
    <option value="27" <%= "27".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Cafes y otros</option>
    <option value="28" <%= "28".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Mayonesa y otros</option>
    <option value="29" <%= "29".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Gaseosa</option>
    <option value="30" <%= "30".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Alimento perro y otros</option>
    <option value="31" <%= "31".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Platos y otros</option>
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
        <table class="tabla-productos">
    <thead>
    <tr>
        <th class="col-id">ID</th>
        <th>Nombre</th>
        <th>Precio Compra</th>
        <th>Precio Mayor</th>
        <th>Precio Unidad</th>
    </tr>
</thead>
<tbody>
    <%
        List<Producto> productos = (List<Producto>) request.getAttribute("productos");
        if (productos != null && !productos.isEmpty()) {
            for (Producto p : productos) {
    %>
    <tr>
        <td class="col-id" data-label="ID"><%= p.getId() %></td>
        <td data-label="Nombre"><%= p.getNombre() %></td>
        <td data-label="Precio Compra"><%= p.getPrecioCompra() %></td>
        <td data-label="Precio Mayor"><%= p.getPrecioMayor() %></td>
        <td data-label="Precio Unidad"><%= p.getPrecioUnidad() %></td>
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
</tbody>

</table>

    </div>
     </div>
    <!-- PIE DE PÁGINA -->
    <footer>© 2025 - Sistema de Almacén</footer>
    </div>
    <script src="js.general.js" type="text/javascript"></script>
</body>
</html>

