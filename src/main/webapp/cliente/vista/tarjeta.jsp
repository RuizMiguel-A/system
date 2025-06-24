<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formulario de Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <style>
        .form-group label {
            font-weight: bold;
        }
        .card {
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-body {
            padding: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            width: 100%;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-control {
            border-radius: 5px;
        }
        .form-text {
            color: #6c757d;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h4>Datos de la Venta</h4>
                    </div>
                    <div class="card-body">
                        <form action="VentaControlador?accion=guardarVenta" method="post">
                            <div class="form-group">
                                <label for="fecha_venta">Fecha de Venta:</label>
                                <input type="date" class="form-control" id="fecha_venta" name="fecha_venta" required>
                            </div>
                            <div class="form-group">
                                <label for="monto_total">Monto Total:</label>
                                <div class="input-group">
                                    <span class="input-group-text">S/</span>
                                    <input type="number" class="form-control" id="monto_total" name="monto_total" min="0" step="0.01" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="numero_tarjeta">Número de Tarjeta:</label>
                                <input type="text" class="form-control" id="numero_tarjeta" name="numero_tarjeta" placeholder="XXXX-XXXX-XXXX-XXXX" pattern="\d{4}-\d{4}-\d{4}-\d{4}" required>
                                <small class="form-text text-muted">Ingrese un número de tarjeta válido (ej: 1234-5678-9012-3456)</small>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fecha_expiracion">Fecha de Expiración:</label>
                                        <input type="text" class="form-control" id="fecha_expiracion" name="fecha_expiracion" placeholder="MM/AA" pattern="(0[1-9]|1[0-2])\/[0-9]{2}" required>
                                         <small class="form-text text-muted">Ingrese la fecha de expiración (ej: 02/25)</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cvv">CVV:</label>
                                        <input type="text" class="form-control" id="cvv" name="cvv" placeholder="XXX" pattern="\d{3,4}" required>
                                        <small class="form-text text-muted">Ingrese el código de seguridad de su tarjeta</small>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-credit-card"></i> Procesar Pago
                            </button>
                        </form>
                         <div style="margin-top: 20px;">
                            <a href="ClienteControlador?accion=listar" class="btn btn-secondary">
                                <i class="fa fa-arrow-left"></i> Volver a la Lista de Clientes
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
