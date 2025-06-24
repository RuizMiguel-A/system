<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Reservas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="cliente/css/reservalist.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
                <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
    <div class="container">
        <h1>Lista de Reservas</h1>

        <c:if test="${not empty mensaje}">
            <div class="alert ${tipoMensaje}">${mensaje}</div>
        </c:if>

        <div class="toolbar">
            <div class="toolbar-buttons">
                <a href="ClienteControlador?accion=listar" class="btn btn-success">
                    <i class="fas fa-users"></i> Lista Clientes
                </a>
                <a href="${pageContext.request.contextPath}/VentaControlador?accion=listarVenta" class="btn btn-primary">
                    <i class="fas fa-cash-register"></i> Lista Ventas
                </a>
            </div>
            <div class="search-container">
                <i class="fas fa-search search-icon"></i>
                <input type="text" id="searchInput" class="search-input" placeholder="Buscar reservas...">
            </div>
        </div>

        <table class="table table-striped table-bordered" id="reservasTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Cantidad</th>
                    <th>Ubicación</th>
                    <th>Cliente ID</th>
                    <th>Mesa</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${reservas}" var="reserva">
                    <tr>
                        <td>${reserva.idReserva}</td>
                        <td>${reserva.fecha}</td>
                        <td>${reserva.hora}</td>
                        <td>${reserva.cantidadPersonas}</td>
                        <td>${reserva.ubicacion}</td>
                        <td>${reserva.idCliente}</td>
                        <td>${reserva.numeroMesa}</td>
                        <td class="table-actions">
                            <a href="ReservaControlador?accion=editarReserva&id=${reserva.idReserva}" class="btn btn-info btn-sm" title="Editar">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="ReservaControlador?accion=eliminarReserva&id=${reserva.idReserva}" class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Está seguro que desea eliminar esta reserva?')">
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="back-button">
             <a href="cliente/vista/bienvenido.jsp" class="btn btn-dark">
                 <i class="fa fa-arrow-left"></i> Volver al Dashboard
             </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            const table = document.getElementById('reservasTable');
            const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

            searchInput.addEventListener('keyup', function() {
                const searchTerm = searchInput.value.toLowerCase();

                for (let i = 0; i < rows.length; i++) {
                    const rowData = rows[i].textContent.toLowerCase();
                    if (rowData.includes(searchTerm)) {
                        rows[i].style.display = '';
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
            });
        });
    </script>
</body>
</html>