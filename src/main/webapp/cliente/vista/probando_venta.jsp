<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulario de Pago</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="cliente/css/venta.css" rel="stylesheet" type="text/css"/>
    
    
</head>
<body>
            <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
<%
    // Obtener la fecha actual
    Date fechaActual = new Date();
    // Definir el formato deseado
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
    // Formatear la fecha a String
    String fechaVenta = formatoFecha.format(fechaActual);
%>
<div class="container mt-4">
    <div class="card">
        <h2 class="card-title text-center">Restaurante</h2>

        <%-- Navegación con pestañas --%>
        <ul class="nav nav-tabs justify-content-center">
            <li class="nav-item"><a class="nav-link" href="ClienteControlador?accion=nuevo">Registro</a></li>
            <li class="nav-item"><a class="nav-link" href="ReservaControlador?accion=nuevaReserva">Reserva</a></li>
            <li class="nav-item"><a class="nav-link " href="MenuControlador?accion=nuevo">Menú</a></li>
            <li class="nav-item"><a class="nav-link active" href="VentaControlador?accion=nuevaVenta">Pago</a></li>
        </ul>
        <div class="card-body">


            <h3>Detalles de Pago</h3>
            <hr>
            <form action="VentaControlador?accion=guardarVenta" method="post">

                <div class="form-group mb-3">
                    <label for="fecha_venta">Fecha de Venta:</label>
                    <input type="date" class="form-control" id="fecha_venta" name="fecha_venta"
                           value="<%= fechaVenta %>" readonly required>
                </div>

                <div class="form-group mb-3">
                    <label for="monto_total">Monto Total:</label>
                    <div class="input-group">
                        <span class="input-group-text">S/</span>
                        <input type="number" class="form-control" id="monto_total" name="monto_total" min="0" step="0.01"
                               value="${param.total != null ? param.total : '0.00'}" required>
                    </div>
                </div>

                <div class="form-group mb-3">
                    <label for="numero_tarjeta">Número de Tarjeta:</label>
                    <input type="text" class="form-control" id="numero_tarjeta" name="numero_tarjeta"
                           placeholder="XXXX-XXXX-XXXX-XXXX"
                           pattern="\d{4}-\d{4}-\d{4}-\d{4}" required>
                    <small class="form-text text-muted">Ingrese un número de tarjeta válido (ej: 1234-5678-9012-3456)</small>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group mb-3">
                            <label for="fecha_expiracion">Fecha de Expiración:</label>
                            <input type="text" class="form-control" id="fecha_expiracion" name="fecha_expiracion"
                                   placeholder="MM/AA" pattern="(0[1-9]|1[0-2])\/[0-9]{2}" required>
                            <small class="form-text text-muted">Ej: 02/25</small>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group mb-3">
                            <label for="cvv">CVV:</label>
                            <input type="text" class="form-control" id="cvv" name="cvv"
                                   placeholder="XXX" pattern="\d{3,4}" required>
                            <small class="form-text text-muted">Código de seguridad de su tarjeta</small>
                        </div>
                    </div>
                </div>

                <div class="navigation-buttons">
                    <a href="MenuControlador?accion=nuevo" class="btn btn-dark"><i class="fa fa-arrow-left"></i> Volver al Menú</a>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Guardar Pago</button>

                </div>

            </form>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>