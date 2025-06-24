<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tu Carrito de Compras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Estilos generales */
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            overflow: hidden; /* Evita scroll si el video es más grande */
        }
        #background-video {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -1;
            background-size: cover;
        }
        .container {
            margin-top: 30px;
            width: 90%;
            max-width: 900px;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .cart-items {
            list-style: none;
            padding: 0;
            margin-bottom: 20px;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px dashed #ccc;
        }
        .cart-item:last-child {
            border-bottom: none;
        }
        .item-details {
            flex-grow: 1;
            text-align: left;
            margin-right: 10px;
        }
        .item-details h5 {
            margin: 0 0 5px 0;
            color: #555;
        }
        .item-details p {
            margin: 0;
            color: #777;
            font-size: 0.9em;
        }
        .item-price {
            font-weight: bold;
            color: #007bff;
            white-space: nowrap; /* Evita que el precio se rompa */
        }
        .total-section {
            padding-top: 15px;
            border-top: 2px solid #eee;
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
            text-align: right;
        }
        .btn-checkout {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .btn-checkout:hover {
            background-color: #218838;
        }
        .empty-cart {
            margin-top: 30px;
            color: #777;
            font-size: 1.1em;
        }
        .empty-cart i {
            color: #ccc;
        }
        .empty-cart a {
            color: #007bff;
            text-decoration: none;
        }
        .empty-cart a:hover {
            text-decoration: underline;
        }
        .btn-action {
            padding: 5px 10px;
            margin-left: 5px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-remove {
            background-color: #dc3545;
            color: white;
            border: none;
        }
        .btn-remove:hover {
            background-color: #c82333;
        }
        .btn-continue-shopping {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 10px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .btn-continue-shopping:hover {
            background-color: #0056b3;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 15px 0;
            border-bottom: 1px dashed #ccc;
        }
        .item-details {
            flex: 1;
        }
    </style>
</head>
<body>
    <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>

    <div class="container">
        <div class="card">
            <h2>Tu Carrito de Compras</h2>

            <c:if test="${not empty carritoItems}">
                <ul class="cart-items">
                    <c:forEach items="${carritoItems}" var="item">
                        <li class="cart-item">
                            <div class="item-details">
                                <h5 class="fw-bold text-primary">${item.nombrePlato}</h5>
                                <p class="text-muted">${item.descripcion}</p>
                                <p class="text-muted">Cantidad: ${item.cantidad}</p>
                            </div>
                            <div class="d-flex align-items-center">
                                <span class="item-price me-3 fs-5">S/ 
                                    <fmt:formatNumber value="${item.precio * item.cantidad}" pattern="0.00"/>
                                </span>
                                <form action="${pageContext.request.contextPath}/MenuControlador" method="post">
                                    <input type="hidden" name="accion" value="quitarDelCarrito">
                                    <input type="hidden" name="idMenu" value="${item.idMenu}">
                                    <%-- Es crucial pasar la cantidad para identificar el ítem exacto a remover si hubiera duplicados con distintas cantidades --%>
                                    <input type="hidden" name="cantidad" value="${item.cantidad}">
                                    <button type="submit" class="btn btn-sm btn-danger" title="Quitar del carrito">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </form>
                            </div>
                        </li>
                    </c:forEach>
                </ul>

                <div class="total-section">
                    <strong>Total:</strong> S/ <span id="total-platos">0.00</span>
                </div>

                <a href="${pageContext.request.contextPath}/MenuControlador?accion=listar" class="btn-continue-shopping"><i class="fas fa-shopping-basket"></i> Seguir Comprando</a>
                
                <form action="${pageContext.request.contextPath}/VentaControlador" method="post" class="mt-3">
                    <input type="hidden" name="accion" value="nuevaVenta">
                    <input type="hidden" name="total" id="total-hidden"> <%-- Este input guardará el total calculado por JavaScript --%>
                    <button type="submit" class="btn-checkout">
                        <i class="fa fa-credit-card"></i> Ir a Pagar
                    </button>
                </form>

            </c:if>
            <c:if test="${empty carritoItems}">
                <div class="empty-cart">
                    <i class="fa fa-shopping-cart fa-3x mb-2"></i>
                    <p>Tu carrito está vacío. <a href="${pageContext.request.contextPath}/MenuControlador?accion=listar">Ver el menú</a></p>
                </div>
            </c:if>
        </div>
    </div>

<script>
    function calcularTotal() {
        let total = 0;
        // Selecciona todos los elementos con la clase 'item-price'
        const precios = document.querySelectorAll('.cart-item .item-price');
        precios.forEach(precioCelda => {
            // Elimina el prefijo "S/ " y reemplaza la coma por punto para el parseFloat
            const precioTexto = precioCelda.textContent.replace('S/ ', '').replace(',', '.');
            total += parseFloat(precioTexto);
        });
        // Actualiza el span visible con el total formateado
        document.getElementById('total-platos').textContent = total.toFixed(2);

        // Actualiza el input hidden en el formulario de pago
        const inputHidden = document.getElementById('total-hidden');
        if (inputHidden) {
            inputHidden.value = total.toFixed(2);
        }
    }

    // Llama a calcularTotal cuando la página termina de cargar
    window.onload = function() {
        calcularTotal();
        // La lógica para el botón 'Ir a Pagar' se manejó directamente con el submit del formulario.
        // No es necesario el listener adicional si el input hidden se actualiza.
    };
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>