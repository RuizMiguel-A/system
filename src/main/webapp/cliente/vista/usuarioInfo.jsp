<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String nombre = (String) session.getAttribute("nombreUsuario");
    String apellidos = (String) session.getAttribute("apellidosUsuario");
    String email = (String) session.getAttribute("emailUsuario");

    if (nombre != null && apellidos != null && email != null) {
%>
    <div style="position: absolute; top: 10px; right: 10px; background-color: #f8f9fa; border: 1px solid #dee2e6; padding: 10px; border-radius: 5px; font-size: 0.9em;">
        <strong>Usuario:</strong> <%= nombre %> <%= apellidos %><br>
        <strong>Email:</strong> <%= email %>
        <form action="<%= request.getContextPath() %>/UsuarioControlador" method="post" style="margin-top: 5px;">
            <input type="hidden" name="accion" value="logout">
            <input type="submit" value="Cerrar Sesión" style="font-size: 0.8em; padding: 5px;">
        </form>
    </div>
<%
    } else {
%>
    <div style="position: absolute; top: 10px; right: 10px;">
        <a href="<%= request.getContextPath() %>/login.jsp">Iniciar sesión</a>
    </div>
<%
    }
%>