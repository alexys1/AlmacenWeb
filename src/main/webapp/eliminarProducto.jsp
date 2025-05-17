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
            <form action="eliminar-producto" method="get" class="form-busqueda" id="form-busqueda">
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
    <option value="9" <%= "9".equals(String.valueOf(request.getAttribute("categoriaSeleccionada"))) ? "selected" : "" %>>Toallas higienicas</option>
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

