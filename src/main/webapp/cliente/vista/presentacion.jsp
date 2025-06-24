<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sabores Peruanos - Un Viaje Culinario</title>
    <link href="../css/presentacion.css" rel="stylesheet" type="text/css"/>

</head>
<body>
        <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
    <div class="container">
        <header>
            <h1>Restaurante</h1>
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

        <div class="hero">
            <h2>Descubre la Magia de la Cocina Peruana</h2>
            <p>Un viaje culinario a través de los sabores auténticos y la rica tradición del Perú.</p>
        </div>

        <div class="about-us">
            <h3>Sobre Nosotros</h3>
            <p>
                En Sabores Peruanos, nos apasiona compartir la diversidad y la exquisitez de la cocina peruana.
                Desde los Andes hasta la costa, nuestros platos reflejan la rica historia y la vibrante cultura del Perú.
                Utilizamos ingredientes frescos y auténticos para crear experiencias gastronómicas inolvidables.
            </p>
        </div>
<div class="mapa">
                <h4>Ubicacion</h4>

            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.789488783909!2d-77.0038847242782!3d-12.06341788816384!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c83a5ca1a1e5%3A0x3c58dd44c79c89a6!2sSan%20Juan%20de%20Lurigancho!5e0!3m2!1ses-419!2spe!4v1716136868747!5m2!1ses-419!2spe" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>

        <div class="featured-dishes">
            <h3>Nuestros Platos Estrella</h3>
            <div class="dish-grid">
                </div>
        </div>  
        <div class="featured-dishes">
            <h3>Nuestros Platos Estrella</h3>
            <div class="dish-grid">
                <div class="dish-card">
                    <img src="${pageContext.request.contextPath}/cliente/vista/img/ceviche.png" alt="Ceviche" style="height: 200px; object-fit: cover;">
                    <div class="dish-card-content">
                        <h4>Ceviche</h4>
                        <p>Pescado fresco marinado en jugo de limón, ají, cebolla roja y cilantro.</p>
                    </div>
                </div>
                <div class="dish-card">
                    <img src="${pageContext.request.contextPath}/cliente/vista/img/lomo_saltado.png" alt="Lomo Saltado" style="height: 200px; object-fit: cover;">
                    <div class="dish-card-content">
                        <h4>Lomo Saltado</h4>
                        <p>Tiras de carne salteadas con cebolla, tomate, ají amarillo y salsa de soya, servido con arroz y papas fritas.</p>
                    </div>
                </div>
                <div class="dish-card">
                    <img src="${pageContext.request.contextPath}/cliente/vista/img/aji_de_gallina.png" alt="Aji de Gallina" style="height: 200px; object-fit: cover;">
                    <div class="dish-card-content">
                        <h4>Ají de Gallina</h4>
                        <p>Gallina deshilachada en una cremosa salsa de ají amarillo, nueces y queso, servido con arroz.</p>
                    </div>
                </div>
                <div class="dish-card">
                    <img src="${pageContext.request.contextPath}/cliente/vista/img/causa_vegetariana.png    " alt="Causa Rellena" style="height: 200px; object-fit: cover;">
                    <div class="dish-card-content">
                        <h4>Causa Rellena</h4>
                        <p>Puré de papa amarilla sazonado con ají amarillo, relleno de pollo, atún o mariscos.</p>
                    </div>
                </div>
                                      <div class="dish-card">
                    <img src="${pageContext.request.contextPath}/cliente/vista/img/pizza.png    " alt="Pizza" style="height: 200px; object-fit: cover;">
                    <div class="dish-card-content">
                        <h4>Pizza</h4>
                        <p>Pizza clásica con salsa de tomate, mozzarella y albahaca.</p>
                    </div>
                </div>
                   <div class="dish-card">
                    <img src="${pageContext.request.contextPath}/cliente/vista/img/pachamanca.png    " alt="Pizza" style="height: 200px; object-fit: cover;">
                    <div class="dish-card-content">
                        <h4>Pizza</h4>
                        <p>Carnes (res, cerdo, pollo, cordero) y tubérculos cocidos bajo tierra con hierbas aromáticas y piedras calientes.</p>
                    </div>
                </div>
                    
                    
            </div>
        </div>

                
                    
        <footer>
            <p>&copy; 2024 Sabores Peruanos. Todos los derechos reservados.</p>
        </footer>
    </div>
</body>
</html>