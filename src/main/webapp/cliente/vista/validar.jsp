<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String usuarioIngresado = request.getParameter("usuario");
    String contrasenaIngresada = request.getParameter("contrasena");

    // **¡Importante!** En una aplicación real, NO hardcodees las credenciales.
    // Deberías obtenerlas de una base de datos o un sistema de autenticación seguro.
    String usuarioValido = "admin";
    String contrasenaValida = "1234";

    if (usuarioIngresado != null && contrasenaIngresada != null &&
        usuarioIngresado.equals(usuarioValido) && contrasenaIngresada.equals(contrasenaValida)) {
        // Inicio de sesión exitoso
        session.setAttribute("usuarioLogueado", usuarioIngresado);
        response.sendRedirect("bienvenido.jsp");
    } else {
        // Credenciales inválidas
        response.sendRedirect("login.jsp?error=1"); // Redirige de vuelta con un parámetro de error
    }
%>