<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.Cookie" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Iniciar Sesión</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<%
    String userCookie = "";
    String passCookie = "";

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("username")) {
                userCookie = c.getValue();
            } else if (c.getName().equals("password")) {
                passCookie = c.getValue();
            }
        }
    }
%>

<div class="login-container">
    <h2>Iniciar Sesión</h2>

    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="login" method="post" autocomplete="on">
        <label for="username">Usuario:</label>
<input type="text" id="username" name="username" placeholder="Usuario" value="<%= userCookie %>" required>


        <label for="password">Contraseña:</label>
<div class="password-wrapper">
    <input type="password" name="password" id="password" placeholder="Contraseña" value="<%= passCookie %>" required>
    <button type="button" class="toggle-password" onclick="togglePassword()">👁</button>
</div>


        <label style="display: flex; align-items: center; gap: 5px; margin: 10px 0;">
            <input type="checkbox" name="recordarme" <%= !userCookie.isEmpty() ? "checked" : "" %> >
            Recordarme
        </label>

        <button type="submit">Ingresar</button>
    </form>
</div>

<script>
    function togglePassword() {
        const input = document.getElementById('password');
        input.type = input.type === 'password' ? 'text' : 'password';
    }
</script>

</body>
</html>


