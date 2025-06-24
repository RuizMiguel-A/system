package com.edu.pe.controlador;

import com.edu.pe.modelo.Usuario; // Suponiendo que tienes una clase Usuario
import com.edu.pe.modelo.dao.UsuarioDAO; // Suponiendo que tienes un DAO para Usuarios
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UsuarioControlador")
public class UsuarioControlador extends HttpServlet {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "login":
                    procesarLogin(request, response);
                    break;
                case "logout":
                    procesarLogout(request, response);
                    break;
                // Otras acciones relacionadas con el usuario
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Manejo de acciones GET relacionadas con el usuario si es necesario
    }

    private void procesarLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        Usuario usuarioAutenticado = usuarioDAO.autenticar(usuario, password); // Implementa tu método de autenticación

        if (usuarioAutenticado != null) {
            HttpSession session = request.getSession();
            session.setAttribute("nombreUsuario", usuarioAutenticado.getNombre());
            session.setAttribute("apellidosUsuario", usuarioAutenticado.getApellidos());
            session.setAttribute("emailUsuario", usuarioAutenticado.getEmail());

            response.sendRedirect(request.getContextPath() + "/principal.jsp"); // Redirige a tu página principal
        } else {
            request.setAttribute("errorLogin", "Usuario o contraseña incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response); // Reenvía a la página de login con error
        }
    }

    private void procesarLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // No crea una nueva sesión si no existe
        if (session != null) {
            session.invalidate(); // Invalida la sesión actual
        }
        response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirige a la página de login
    }
}