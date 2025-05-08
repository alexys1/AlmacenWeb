<%
    session.invalidate(); // Cierra la sesión
    response.sendRedirect("login.jsp"); // Vuelve al login
%>
