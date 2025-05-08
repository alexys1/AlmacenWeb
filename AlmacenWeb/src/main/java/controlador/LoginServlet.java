package controlador;

import dao.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modelo.Usuario;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String recordarme = request.getParameter("recordarme");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario user = dao.validar(username, password);

        if (user != null) {
            // Usuario válido → guardar en sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user.getUsername());

            // Si marcó "Recordarme", guardar cookies
            if ("on".equals(recordarme)) {
                Cookie userCookie = new Cookie("username", username);
                Cookie passCookie = new Cookie("password", password);

                userCookie.setMaxAge(60 * 60 * 24 * 7); // 7 días
                passCookie.setMaxAge(60 * 60 * 24 * 7);

                response.addCookie(userCookie);
                response.addCookie(passCookie);
            } else {
                // Si no, eliminar cookies
                Cookie userCookie = new Cookie("username", "");
                Cookie passCookie = new Cookie("password", "");
                userCookie.setMaxAge(0);
                passCookie.setMaxAge(0);
                response.addCookie(userCookie);
                response.addCookie(passCookie);
            }

            response.sendRedirect("menu");

        } else {
            // Usuario no válido → enviar error
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
