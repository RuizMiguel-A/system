<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gracias por su Compra</title>
    <link href="../css/gracias.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo6.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
    <div class="video-overlay"></div>
    <div class="gracias-container">
        <h1 class="gracias-title">¡Gracias por su Compra!</h1>
        <p class="gracias-message">Su pedido ha sido procesado con éxito. Por favor, indíquele al empleado de entrada sus datos personales para que pueda pasar. ¡Esperamos que disfrute de su comida!</p>
        <a href="${pageContext.request.contextPath}/cliente/vista/presentacion.jsp#" class="volver-link">Volver al Inicio</a>
    </div>
</body>
</html>