<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.edu.pe.config.Conexion" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // Lógica para verificar la sesión del usuario
    String usuario = (String) session.getAttribute("usuarioLogueado");
    if (usuario == null) {
        response.sendRedirect("login.jsp"); // Redirige a la página de login si no hay sesión
        return; // Detiene la ejecución posterior del JSP
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel de Control y Resumen de Datos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="../css/bienvenido.css" rel="stylesheet" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.mp4" type="video/mp4">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.webm" type="video/webm">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.ogv" type="video/ogg">
        Tu navegador no soporta la reproducción de videos.
    </video>

    <div class="dashboard-container">
        <div class="welcome-message">
            <h2>¡Bienvenido, <%= usuario %>!</h2>
            <p>Accede a las diferentes secciones del sistema.</p>
        </div>

        <div class="card-grid">
            <a href="${pageContext.request.contextPath}/ClienteControlador?accion=listar" class="card cliente-card card-link">
                <i class="fas fa-users card-icon"></i>
                <h3 class="card-title">Clientes</h3>
                Gestionar información de clientes
            </a>

            <a href="${pageContext.request.contextPath}/ReservaControlador?accion=listarReserva" class="card reserva-card card-link">
                <i class="fas fa-calendar-check card-icon"></i>
                <h3 class="card-title">Reservas</h3>
                Administrar las reservas del restaurante
            </a>

            <a href="${pageContext.request.contextPath}/cliente/vista/menulist.jsp" class="card menu-card card-link">
                <i class="fas fa-utensils card-icon"></i>
                <h3 class="card-title">Menú</h3>
                Controlar los platos y precios del menú
            </a>

            <a href="${pageContext.request.contextPath}/VentaControlador?accion=listarVentas" class="card venta-card card-link">
                <i class="fas fa-chart-line card-icon"></i>
                <h3 class="card-title">Ventas</h3>
                Visualizar y analizar las ventas
            </a>
        </div>

        <a href="cerrarSesion.jsp" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
        </a>
    </div>

    <hr style="width: 80%; border: 0; height: 1px; background-image: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.75), rgba(255, 255, 255, 0)); margin: 30px auto;">

    <div class="summary-tables-container">
        <h1>Resumen de la Base de Datos</h1>

        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                conn = Conexion.getConnection(); // Obtiene la conexión a la base de datos
                stmt = conn.createStatement(); // Crea un objeto Statement para ejecutar consultas
        %>

        <div class="table-container">
            <h2>Clientes</h2>
            <%
                rs = stmt.executeQuery("SELECT * FROM cliente"); // Ejecuta la consulta para la tabla 'cliente'
                ResultSetMetaData metaData = rs.getMetaData(); // Obtiene metadatos del ResultSet
                int columnCount = metaData.getColumnCount(); // Obtiene el número de columnas
            %>
            <table>
                <thead>
                    <tr>
                        <% for (int i = 1; i <= columnCount; i++) { %>
                            <th><%= metaData.getColumnName(i) %></th> <% } %>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                        <tr>
                            <% for (int i = 1; i <= columnCount; i++) { %>
                                <td><%= rs.getString(i) %></td> <% } %>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="table-container">
            <h2>Reservas</h2>
            <%
                rs = stmt.executeQuery("SELECT * FROM reserva"); // Ejecuta la consulta para la tabla 'reserva'
                metaData = rs.getMetaData();
                columnCount = metaData.getColumnCount();
            %>
            <table>
                <thead>
                    <tr>
                        <% for (int i = 1; i <= columnCount; i++) { %>
                            <th><%= metaData.getColumnName(i) %></th>
                        <% } %>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                        <tr>
                            <% for (int i = 1; i <= columnCount; i++) { %>
                                <td><%= rs.getString(i) %></td>
                            <% } %>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="table-container">
            <h2>Ventas</h2>
            <%
                rs = stmt.executeQuery("SELECT * FROM venta"); // Ejecuta la consulta para la tabla 'venta'
                metaData = rs.getMetaData();
                columnCount = metaData.getColumnCount();
            %>
            <table>
                <thead>
                    <tr>
                        <% for (int i = 1; i <= columnCount; i++) { %>
                            <th><%= metaData.getColumnName(i) %></th>
                        <% } %>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                        <tr>
                            <% for (int i = 1; i <= columnCount; i++) { %>
                                <td><%= rs.getString(i) %></td>
                            <% } %>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="table-container">
            <h2>Menú</h2>
            <%
                rs = stmt.executeQuery("SELECT * FROM menu"); // Consulta la tabla 'menu'
                metaData = rs.getMetaData();
                columnCount = metaData.getColumnCount();
            %>
            <table>
                <thead>
                    <tr>
                        <% for (int i = 1; i <= columnCount; i++) { %>
                            <th><%= metaData.getColumnName(i) %></th>
                        <% } %>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                        <tr>
                            <% for (int i = 1; i <= columnCount; i++) { %>
                                <td><%= rs.getString(i) %></td>
                            <% } %>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <%
            } catch (SQLException e) {
                // Manejo de errores de SQL
                out.println("<div class='error-message'>Error al acceder a la base de datos: " + e.getMessage() + "</div>");
                e.printStackTrace();
            } finally {
                // Asegura que los recursos de la base de datos se cierren siempre
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>