<%--
  Document   : mesas
  Created on : 16 may 2025, 12:25:54
  Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nuestras Mesas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/mesas.css" rel="stylesheet" type="text/css"/>
</head>
<body>
        <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo3.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
    <div class="container">
        <header>
            <h1>Nuestras Mesas</h1>
            <nav>
                <ul>
   
<li><a href="${pageContext.request.contextPath}/cliente/vista/presentacion.jsp">Inicio</a></li>
                    <li><a href="#">Nosotros</a></li>
  
<li><a href="${pageContext.request.contextPath}/cliente/vista/platos.jsp">Platos</a></li>
<li><a href="${pageContext.request.contextPath}/cliente/vista/mesas.jsp">Mesas</a></li>
<li><a href="${pageContext.request.contextPath}/ClienteControlador?accion=nuevo">Reservas</a></li>
    
                </ul>
            </nav>
        </header>
<div class="menu-container">
    <div class="dish-grid">
        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_exterior.png" alt="Rincón Íntimo">
            <div class="dish-card-content">
                <h4>Rincón Íntimo</h4>
                <p><strong>Descripción:</strong> Mesa acogedora para dos personas, ideal para una velada romántica.</p>
                <p><strong>Ubicación:</strong> Salón principal, junto a la chimenea.</p>
                <p><strong>Número de Mesa:</strong> 101</p>
            </div>
        </div>

        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_familiar_grande.png" alt="Familiar Grande">
            <div class="dish-card-content">
                <h4>Familiar Grande</h4>
                <p><strong>Descripción:</strong> Amplia mesa para familias o grupos de hasta 8 personas.</p>
                <p><strong>Ubicación:</strong> Salón principal, zona central.</p>
                <p><strong>Número de Mesa:</strong> 102</p>
            </div>
        </div>

        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_jardin.png" alt="Vista al Jardín">
            <div class="dish-card-content">
                <h4>Vista al Jardín</h4>
                <p><strong>Descripción:</strong> Mesa con vista a nuestro hermoso jardín interior, ideal para disfrutar de la luz natural.</p>
                <p><strong>Ubicación:</strong> Salón lateral, junto al ventanal.</p>
                <p><strong>Número de Mesa:</strong> 103</p>
            </div>
        </div>

        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_terraza_pequena.png" alt="Terraza Romántica">
            <div class="dish-card-content">
                <h4>Terraza Romántica</h4>
                <p><strong>Descripción:</strong> Mesa para dos en nuestra terraza, perfecta para una cena al aire libre.</p>
                <p><strong>Ubicación:</strong> Terraza exterior, esquina tranquila.</p>
                <p><strong>Número de Mesa:</strong> 104</p>
            </div>
        </div>

        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_central_pequena.png" alt="Central Animada">
            <div class="dish-card-content">
                <h4>Central Animada</h4>
                <p><strong>Descripción:</strong> Mesa en el corazón del restaurante, ideal para quienes disfrutan del ambiente vibrante.</p>
                <p><strong>Ubicación:</strong> Salón principal, centro.</p>
                <p><strong>Número de Mesa:</strong> 105</p>
            </div>
        </div>

        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_esquina_sofa.png" alt="Rincón de Lectura">
            <div class="dish-card-content">
                <h4>Rincón de Lectura</h4>
                <p><strong>Descripción:</strong> Cómoda mesa con sofá en una esquina tranquila, ideal para relajarse.</p>
                <p><strong>Ubicación:</strong> Salón lateral, junto a la biblioteca.</p>
                <p><strong>Número de Mesa:</strong> 106</p>
            </div>
        </div>

        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_barra.png" alt="Barra Casual">
            <div class="dish-card-content">
                <h4>Barra Casual</h4>
                <p><strong>Descripción:</strong> Mesas altas con taburetes, perfectas para un encuentro informal o un aperitivo.</p>
                <p><strong>Ubicación:</strong> Zona de la barra.</p>
                <p><strong>Número de Mesa:</strong> 107</p>
            </div>
        </div>

        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_redonda.png" alt="Familiar Redonda">
            <div class="dish-card-content">
                <h4>Familiar Redonda</h4>
                <p><strong>Descripción:</strong> Mesa redonda para 4-6 personas, fomenta la conversación y el compartir.</p>
                <p><strong>Ubicación:</strong> Salón principal, zona central.</p>
                <p><strong>Número de Mesa:</strong> 108</p>
            </div>
        </div>

        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_terraza_cubierta.png" alt="Terraza Cubierta">
            <div class="dish-card-content">
                <h4>Terraza Cubierta</h4>
                <p><strong>Descripción:</strong> Mesa en nuestra terraza cubierta, ideal para disfrutar del exterior en cualquier clima.</p>
                <p><strong>Ubicación:</strong> Terraza exterior, zona techada.</p>
                <p><strong>Número de Mesa:</strong> 109</p>
            </div>
        </div>

        <div class="dish-card">
            <img src="${pageContext.request.contextPath}/cliente/vista/img/mesa_esquina_pequena.png" alt="Esquina Privada Dos">
            <div class="dish-card-content">
                <h4>Esquina Privada Dos</h4>
                <p><strong>Descripción:</strong> Mesa discreta para dos en una esquina tranquila del salón.</p>
                <p><strong>Ubicación:</strong> Salón lateral, esquina sureste.</p>
                <p><strong>Número de Mesa:</strong> 110</p>
            </div>
        </div>
    </div>
</div>
<div class="back-button">
    <a href="${pageContext.request.contextPath}/cliente/vista/platos.jsp#" class="btn btn-secondary">Volver al Inicio</a>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>