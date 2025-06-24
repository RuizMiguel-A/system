<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="cliente/css/listar.css" rel="stylesheet" type="text/css"/>
    <style>

    </style>
</head>
<body>
                <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
<div class="container">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title">Listado de Clientes</h2>
            <hr/>
            <div class="toolbar">
                <div class="toolbar-buttons">
                    <a href="ReservaControlador?accion=listarReserva" class="btn btn-success">
                        <i class="fas fa-calendar-alt"></i> Gestionar Reservas
                    </a>
                    <a href="${pageContext.request.contextPath}/VentaControlador?accion=listarVenta" class="btn btn-primary">
                        <i class="fas fa-cash-register"></i> Gestionar Ventas
                    </a>
                </div>
                <div class="search-form">
                    <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Buscar clientes...">
                    <button class="btn btn-primary" onclick="filterTable()">
                        <i class="fas fa-search"></i> Buscar
                    </button>
                </div>
            </div>

            <jsp:include page="../../components/Mensaje.jsp"/>

            <table class="table table-bordered table-striped" id="clientTable">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Correo</th>
                    <th>Teléfono</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${clientes}" var="cliente">
                    <tr>
                        <td>${cliente.idCliente}</td>
                        <td>${cliente.nombre}</td>
                        <td>${cliente.apellido}</td>
                        <td>${cliente.correo}</td>
                        <td>${cliente.telefono}</td>
                        <td class="table-actions">
                            <a href="ClienteControlador?accion=editar&id=${cliente.idCliente}" class="btn btn-info btn-sm" title="Editar">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a href="ClienteControlador?accion=eliminar&id=${cliente.idCliente}"
                               onclick="return confirm('¿Está seguro que desea eliminar a ${cliente.nombre} ${cliente.apellido}?')"
                               class="btn btn-danger btn-sm" title="Eliminar">
                                <i class="fa fa-trash"></i>
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
        var input, filter, table, tr, td, i, j;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("clientTable");
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