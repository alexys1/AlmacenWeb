<%
    session.invalidate(); // Cierra la sesi�n
    response.sendRedirect("login.jsp"); // Vuelve al login
%>
