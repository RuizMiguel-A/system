<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Baucher de Pago</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .baucher {
            width: 500px;
            margin: auto;
            background: white;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #444;
        }
        .info {
            margin-bottom: 10px;
        }
        .label {
            font-weight: bold;
            width: 150px;
            display: inline-block;
        }
        .value {
            margin-left: 10px;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.8em;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="baucher">
        <h2>Baucher de Pago</h2>
        <hr>

        <div class="info">
            <span class="label">ID Reserva:</span>
            <span class="value">${reserva.idReserva}</span>
        </div>

        <div class="info">
            <span class="label">Fecha:</span>
            <span class="value">${reserva.fecha}</span>
        </div>

        <div class="info">
            <span class="label">Hora:</span>
            <span class="value">${reserva.hora}</span>
        </div>

        <div class="info">
            <span class="label">Cantidad de Personas:</span>
            <span class="value">${reserva.cantidadPersonas}</span>
        </div>

        <div class="info">
            <span class="label">Ubicación:</span>
            <span class="value">${reserva.ubicacion}</span>
        </div>

        <div class="info">
            <span class="label">ID Cliente:</span>
            <span class="value">${reserva.idCliente}</span>
        </div>

        <div class="info">
            <span class="label">Número de Mesa:</span>
            <span class="value">${reserva.numeroMesa}</span>
        </div>

        <hr>
        <div class="footer">
            Gracias por su reserva.
        </div>
    </div>
</body>
</html>