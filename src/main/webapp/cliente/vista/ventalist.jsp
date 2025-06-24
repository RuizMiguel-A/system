<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="cliente/css/ventalist.css" rel="stylesheet" type="text/css"/>
    
</head>
<body>
                <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>

<div class="container">
    <div class="card">
        <div class="card-body">
            <div class="header">
                <h1 class="card-title">Lista de Ventas</h1>
                <a href="${pageContext.request.contextPath}/cliente/vista/cerrarSesion.jsp" class="logout-button">
                    <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                </a>
            </div>
            <hr>
            <div class="toolbar">
                <div class="toolbar-buttons">
                    <a href="ReservaControlador" class="btn btn-info">
                        <i class="far fa-calendar-alt"></i> Lista Reservas
                    </a>
                    <a href="ClienteControlador?accion=listar" class="btn btn-success">
                        <i class="fas fa-users"></i> Lista Clientes
                    </a>
                </div>
                <div class="search-form">
                    <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Buscar ventas...">
                    <button class="btn btn-primary" onclick="filterTable()">
                        <i class="fas fa-search"></i> Buscar
                    </button>
                </div>
            </div>
            <table class="table table-striped table-bordered" id="salesTable">
                <thead class="table-dark">
                <tr>
                    <th>ID VENTA</th>
                    <th>Fecha Venta</th>
                    <th>Monto Total</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ventas}" var="venta">
                    <tr>
                        <td>${venta.idVenta}</td>
                        <td>${venta.fechaVenta}</td>
                        <td>${venta.montoTotal}</td>
                        <td class="table-actions">
                            <a href="VentaControlador?accion=editarVenta&id=${venta.idVenta}" class="btn btn-info btn-sm" title="Editar">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="VentaControlador?accion=eliminarVenta&id=${venta.idVenta}"
                               onclick="return confirm('¿Está seguro que desea eliminar la venta ${venta.idVenta}?')"
                               class="btn btn-danger btn-sm" title="Eliminar">
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
    </div>
</div>

<script>
    function filterTable() {
        // Obtiene el valor del input de búsqueda y lo convierte a mayúsculas para una búsqueda no sensible a mayúsculas.
        var input, filter, table, tr, td, i;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("salesTable");
        tr = table.getElementsByTagName("tr");

        // Itera sobre todas las filas de la tabla, comenzando desde la segunda fila (índice 1) para evitar la fila de encabezado.
        for (i = 1; i < tr.length; i++) {
            var shouldShow = false; // Variable para determinar si la fila debe mostrarse.
            // Itera sobre todas las celdas (columnas) de la fila actual.
            for (j = 0; j < tr[i].cells.length - 1; j++) { // Excluimos la última columna (acciones).
                td = tr[i].cells[j];
                if (td) {
                    // Comprueba si el contenido de la celda (convertido a mayúsculas) contiene el texto de búsqueda.
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        shouldShow = true; // Si se encuentra una coincidencia en alguna celda, la fila debe mostrarse.
                        break; // No es necesario seguir buscando en otras celdas de esta fila.
                    }
                }
            }
            // Establece la propiedad 'display' de la fila según si se encontró o no una coincidencia.
            if (shouldShow) {
                tr[i].style.display = ""; // Muestra la fila si hay coincidencia.
            } else {
                tr[i].style.display = "none"; // Oculta la fila si no hay coincidencia.
            }
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>