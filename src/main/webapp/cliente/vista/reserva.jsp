<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nueva Reserva en Restaurante</title>
    <link href="cliente/css/reserva.css" rel="stylesheet" type="text/css"/>
</head>
<body>
            <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
    <div class="container mt-3 main-container"> <%-- Contenedor con margen superior y clase para animación --%>
        <div class="card"> <%-- Tarjeta de Bootstrap para agrupar contenido --%>
            <div class="card-body">
                <h2 class="card-title text-center">Restaurante</h2> <%-- Título centrado --%>

                <%-- Menú de navegación con pestañas --%>
                <ul class="nav nav-tabs justify-content-center">
                    <li class="nav-item"><a class="nav-link" href="ClienteControlador?accion=nuevo">Registro</a></li>
                    <li class="nav-item"><a class="nav-link active" href="ReservaControlador?accion=nuevaReserva">Reserva</a></li> <%-- Pestaña activa --%>
                    <li class="nav-item"><a class="nav-link" href="MenuControlador?accion=nuevo">Menú</a></li>
                    <li class="nav-item"><a class="nav-link" href="VentaControlador?accion=nuevaVenta">Pago</a></li>
                </ul>

                <form action="ReservaControlador" method="post">
                    <input type="hidden" name="accion" value="guardarReserva">

                    <div class="form-row">
                        <div class="form-group">
                            <label for="fecha">Fecha:</label>
                            <input type="date" id="fecha" name="fecha" min="2025-05-26" max="2026-01-01" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="hora">Hora:</label>
                            <input type="time" id="hora" name="hora" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="cantidad_personas">Cantidad de Personas:</label>
                            <input type="number" id="cantidad_personas" name="cantidad_personas" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="ubicacion">Ubicación:</label>
                            <input type="text" id="ubicacion" name="ubicacion" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="id_cliente">ID Cliente:</label>
                            <input type="number" id="id_cliente" name="id_cliente" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="numero_mesa">Número de Mesa:</label>
                            <input type="number" id="numero_mesa" name="numero_mesa" class="form-control" required>
                        </div>
                    </div>
                                                            <a href="ClienteControlador?accion=nuevo" class="btn btn-dark btn-sm mt-3">
                        <i class="fa fa-arrow-left"></i> Volver Atrás
                    </a>

                    <input type="submit" value="Guardar Reserva" class="btn btn-primary">

                </form>
            </div>
        </div>
    </div>
</body>
</html>