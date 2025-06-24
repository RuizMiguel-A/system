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
        <h2 class="card-title text-center">Formulario de Pago</h2>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/VentaControlador" method="post">
                <input type="hidden" name="accion" value="guardar">
<div class="mb-3">
    <label class="form-label">Fecha de Venta:</label>
    <input type="text" class="form-control" value="<%= fechaVenta %>" readonly>
</div>

<%-- Asegúrate de que ${totalVenta} contenga el total ya calculado con las cantidades del carrito --%>
<input type="hidden" name="monto_total" value="${totalVenta}">
                <div class="mb-3">
<label for="total">Total a Pagar:</label>
<input type="text" class="form-control" id="total" name="total"
        value="S/ ${totalVenta}" readonly>

                    <small class="form-text text-muted">Monto total de su carrito.</small>
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
                                    placeholder="XXX" pattern="[0-9]{3,4}" required>
                            <small class="form-text text-muted">Código de seguridad de su tarjeta</small>
                        </div>
                    </div>
                </div>

                <div class="navigation-buttons">
                    <a href="${pageContext.request.contextPath}/MenuControlador?accion=verCarrito" class="btn btn-dark"><i class="fa fa-arrow-left"></i> Volver al Carrito</a>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Guardar Pago</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>