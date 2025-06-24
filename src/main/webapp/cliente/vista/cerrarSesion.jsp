<%@ page contentType="text/html; charset=UTF-8" %>
<%
    session.invalidate(); // Invalida la sesión actual
    response.sendRedirect("login.jsp"); // Redirige de vuelta a la página de inicio de sesión
%>