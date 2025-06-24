<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Orden Actual del Cliente</title> <%-- Título actualizado --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            overflow: hidden; /* Evita scroll si el video es más grande */
        }
        #background-video {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -1;
            background-size: cover;
        }
        .container {
            margin-top: 30px;
            width: 90%;
            max-width: 900px;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        thead {
            background-color: #007bff;
            color: white;
        }
        th, td {
            text-align: center;
            padding: 12px 15px;
            border: 1px solid #dee2e6;
        }
        tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        tbody tr:hover {
            background-color: #e2e6ea;
        }
        .total-section {
            padding-top: 15px;
            border-top: 2px solid #eee;
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
            text-align: right;
            margin-bottom: 20px;
        }
        .empty-cart { /* Renombrado de empty-menu a empty-cart para reflejar su nueva función */
            text-align: center;
            color: #6c757d;
            font-size: 1.2rem;
            margin-top: 40px;
        }
        .btn-action {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .btn-action:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<video autoplay loop muted id="background-video">
    <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.mp4" type="video/mp4">
    Tu navegador no soporta la reproducción de videos.
</video>

<div class="container">
    <div class="card">
        <h2>Orden Actual del Cliente</h2> <%-- Título actualizado --%>

        <%-- Verificar si hay items en el carrito (ahora menulist.jsp muestra el carrito) --%>
        <c:if test="${not empty sessionScope.carritoItems}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Subtotal</th>
                        <th>Descripción</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Inicializar la variable para el total general del carrito --%>
                    <c:set var="totalGeneral" value="0"/>
                    <c:forEach var="item" items="${sessionScope.carritoItems}">
                        <tr>
                            <td>${item.idMenu}</td>
                            <td>${item.nombrePlato}</td>
                            <td>${item.cantidad}</td>
                            <td>S/ <fmt:formatNumber value="${item.precio}" pattern="0.00"/></td>
                            <td>S/ <fmt:formatNumber value="${item.precio * item.cantidad}" pattern="0.00"/></td>
                            <td>${item.descripcion}</td>
                        </tr>
                        <%-- Sumar el subtotal de cada ítem al total general --%>
                        <c:set var="totalGeneral" value="${totalGeneral + (item.precio * item.cantidad)}"/>
                    </c:forEach>
                </tbody>
            </table>

            <div class="total-section">
                <strong>Total de la Orden:</strong> S/ <span id="total-orden"><fmt:formatNumber value="${totalGeneral}" pattern="0.00"/></span>
            </div>

            <%-- Botones de acción, ajustados al nuevo rol de la página --%>
            <div class="d-grid gap-2 d-md-flex justify-content-md-center mt-4">
                <a href="${pageContext.request.contextPath}/MenuControlador?accion=verCarrito" class="btn btn-primary btn-action">
                    <i class="fas fa-shopping-cart"></i> Ver Carrito Detallado
                </a>
                <a href="${pageContext.request.contextPath}/MenuControlador?accion=listar" class="btn btn-secondary btn-action">
                    <i class="fas fa-shopping-basket"></i> Seguir Comprando
                </a>
                <%-- Puedes agregar un botón para "Iniciar Nueva Reserva" que limpie el carrito --%>
                 <a href="${pageContext.request.contextPath}/ReservaControlador?accion=nuevaReserva" class="btn btn-success btn-action">
                    <i class="fas fa-plus"></i> Iniciar Nueva Reserva
                </a>
            </div>

        </c:if>

        <%-- Mensaje si el carrito está vacío --%>
        <c:if test="${empty sessionScope.carritoItems}">
            <div class="empty-cart">
                <i class="fas fa-clipboard-list fa-3x mb-3"></i> <%-- Nuevo icono para "lista vacía" --%>
                <p>No hay platos en la orden actual o ha sido limpiada para una nueva reserva.</p>
                <p><a href="${pageContext.request.contextPath}/MenuControlador?accion=listar">Explorar el Menú</a> para comenzar una nueva orden.</p>
            </div>
        </c:if>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%-- El JavaScript anterior para calcularTotal y el botón Ir a Venta fue eliminado, ya que carrito.jsp ya lo maneja --%>
</body>
</html>