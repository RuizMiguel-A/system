<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Panel Épico</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
                background-image: url('cliente/vista/img/fondo_restaurante.png');

            background: linear-gradient(135deg, #343a40, #007bff); /* Fondo oscuro degradado */
            color: #fff; /* Texto blanco */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .epic-panel {
            background-color: rgba(0, 0, 0, 0.7); /* Panel semi-transparente oscuro */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); /* Sombra intensa */
            padding: 40px;
            text-align: center;
        }

        .epic-title {
            font-size: 3rem;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8); /* Sombra de texto épica */
        }

        .epic-button {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            color: #fff;
            font-size: 1.1rem;
            cursor: pointer;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .epic-button:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
        }

        .epic-button i {
            margin-right: 10px;
        }

        .epic-button-cliente {
            background-color: #28a745; /* Verde éxito */
        }

        .epic-button-reserva {
            background-color: #007bff; /* Azul primario */
        }

        .epic-button-menu {
            background-color: #ffc107; /* Amarillo alerta */
            color: #333;
        }

        .epic-button-venta {
            background-color: #dc3545; /* Rojo peligro */
        }
    </style>
</head>
<body>
    <div class="epic-panel">
        <h1 class="epic-title">¡Desbloquea el Poder del Restaurante!</h1>
        <a href="${pageContext.request.contextPath}/ClienteControlador?accion=listar" class="epic-button epic-button-cliente">
            <i class="fa fa-users"></i> Gestionar Clientes
        </a>
        <a href="${pageContext.request.contextPath}/ReservaControlador?accion=listarReserva" class="epic-button epic-button-reserva">
            <i class="fa fa-calendar-alt"></i> Administrar Reservas
        </a>
        <a href="${pageContext.request.contextPath}/MenuControlador?accion=listar" class="epic-button epic-button-menu">
            <i class="fa fa-utensils"></i> Controlar Menú
        </a>
        <a href="${pageContext.request.contextPath}/VentaControlador?accion=listarVentas" class="epic-button epic-button-venta">
            <i class="fa fa-chart-line"></i> Ver Ventas
        </a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>