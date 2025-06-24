<%@ page import="java.sql.*, java.util.*" %>
 <%@ page import="com.edu.pe.config.Conexion" %>
 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!DOCTYPE html>
 <html>
 <head>
     <meta charset="UTF-8">
     <title>Resumen de la Base de Datos</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
     <style>
         body {
             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
             background-color: #f8f9fa;
         }

         .container {
             margin-top: 20px;
         }

         .table-container {
             background-color: white;
             padding: 20px;
             margin-bottom: 20px;
             border-radius: 8px;
             box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
         }

         h1 {
             text-align: center;
             color: #007bff;
             margin-bottom: 30px;
         }

         h2 {
             color: #007bff;
             margin-top: 25px;
             border-bottom: 2px solid #007bff;
             padding-bottom: 5px;
         }

         table {
             width: 100%;
             border-collapse: collapse;
             margin-top: 10px;
         }

         th, td {
             padding: 12px 15px;
             text-align: left;
             border-bottom: 1px solid #dee2e6;
         }

         th {
             background-color: #007bff;
             color: white;
         }

         tr:hover {
             background-color: #f5f5f5;
         }
     </style>
 </head>
 <body>

 <div class="container">
     <h1>Resumen de la Base de Datos</h1>

     <%
         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;

         try {
             conn = Conexion.getConnection();
             stmt = conn.createStatement();
     %>

     <div class="table-container">
         <h2>Clientes</h2>
         <%
             rs = stmt.executeQuery("SELECT * FROM cliente");
             ResultSetMetaData metaData = rs.getMetaData();
             int columnCount = metaData.getColumnCount();
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
             rs = stmt.executeQuery("SELECT * FROM menu");
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
         <h2>Reservas</h2>
         <%
             rs = stmt.executeQuery("SELECT * FROM reserva");
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
             rs = stmt.executeQuery("SELECT * FROM venta");
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
             out.println("Error al acceder a la base de datos: " + e.getMessage());
             e.printStackTrace();
         } finally {
             try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
             try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
             try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
         }
     %>

 </div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 </body>
 </html>