<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%-- Define el tipo de contenido y codificación de caracteres --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- Importa la biblioteca JSTL Core para usar etiquetas como <c:if>, etc. --%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link href="cliente/css/nuevo.css" rel="stylesheet" type="text/css"/>
    <%-- Título de la página: cambia según si es nuevo cliente o edición --%>
    <title>${cliente.idCliente == 0 ? "Nuevo " : "Editar Cliente"}</title>
</head>

<body>
            <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo2.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
<div class="container mt-3"> <%-- Contenedor con margen superior --%>
    <div class="card"> <%-- Tarjeta de Bootstrap para agrupar contenido --%>
        <div class="card-body">
            <h2 class="card-title text-center">Restaurante</h2> <%-- Título centrado --%>

            <%-- Menú de navegación con pestañas --%>
            <%-- Navegación con pestañas --%>
            <ul class="nav nav-tabs justify-content-center">
                <li class="nav-item"><a class="nav-link active" href="ClienteControlador?accion=nuevo">Registro</a></li>
                <li class="nav-item"><a class="nav-link" href="ReservaControlador?accion=nuevaReserva">Reserva</a></li> <%-- Pestaña activa --%>
                <li class="nav-item"><a class="nav-link " href="MenuControlador?accion=nuevo">Menú</a></li>
                <li class="nav-item"><a class="nav-link" href="VentaControlador?accion=nuevaVenta">Pago</a></li>
            </ul>

            <hr/>

            <%-- Formulario que envía datos al controlador ClienteControlador --%>
            <form action="ClienteControlador" method="post">
                <div class="form-row">
                    <%-- Campo: Nombre del cliente --%>
                    <div class="form-group">
                        <label>Nombre:</label>
                        <input value="${cliente.nombre}" name="nombre" type="text" class="form-control" maxlength="30" required>
                    </div>

                    <%-- Campo: Apellido del cliente --%>
                    <div class="form-group">
                        <label>Apellido:</label>
                        <input value="${cliente.apellido}" name="apellido" type="text" class="form-control" maxlength="30" required>
                    </div>
                </div>

                <%-- Campo: Correo electrónico del cliente --%>
                <div class="mb-3">
                    <label>Correo:</label>
                    <input value="${cliente.correo}" name="correo" type="email" class="form-control" maxlength="50" required>
                </div>

                <%-- Campo: Teléfono de 9 dígitos (con validación por patrón) --%>
                <div class="mb-3">
                    <label>Teléfono (9 dígitos):</label>
                    <input value="${cliente.telefono}" name="telefono" type="text" class="form-control" maxlength="9" pattern="[0-9]{9}" title="Ingrese un número de teléfono de 9 dígitos" required>
                </div>

                <div class="mb-3">
                    <%-- Campo oculto: ID del cliente (para edición) --%>
                    <input type="hidden" name="id" value="${cliente.idCliente}">

                    <%-- Campo oculto: acción que indica que se va a guardar --%>
                    <input type="hidden" name="accion" value="guardar">

                    <%-- Botón: volver a la lista de clientes --%>
                    <a href="cliente/vista/presentacion.jsp#" class="btn btn-dark btn-sm">
                        <i class="fa fa-arrow-left"></i> Volver al inicio
                    </a>

                    <%-- Botón: guardar cliente --%>
<form action="ReservaControlador?accion=nuevaReserva" method="post">
    <button class="btn btn-primary btn-sm">
        <i class="fa fa-save"></i> Guardar
    </button>                   
                                    
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
