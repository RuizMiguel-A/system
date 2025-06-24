<%--
    Document   : platos
    Created on : 16 may 2025, 12:25:54
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nuestro Menú</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/platos.css" rel="stylesheet" type="text/css"/>
</head>
<body>
            <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
        <div class="container">
        <header>
            <h1>Platos disponibles</h1>
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
                <img src="${pageContext.request.contextPath}/cliente/vista/img/ceviche.png" alt="Ceviche">
                <div class="dish-card-content">
                    <h4>Ceviche</h4>
                    <p>Pescado fresco marinado en jugo de limón, ají, cebolla roja y cilantro.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/lomo_saltado.png" alt="Lomo Saltado">
                <div class="dish-card-content">
                    <h4>Lomo Saltado</h4>
                    <p>Tiras de carne salteadas con cebolla, tomate, ají amarillo y salsa de soya, servido con arroz y papas fritas.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/aji_de_gallina.png" alt="Aji de Gallina">
                <div class="dish-card-content">
                    <h4>Ají de Gallina</h4>
                    <p>Gallina deshilachada en una salsa cremosa a base de ají amarillo, leche, pan y nueces, servido con arroz y papas.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/causa_vegetariana.png" alt="Causa Vegetariana">
                <div class="dish-card-content">
                    <h4>Causa Vegetariana</h4>
                    <p>Puré de papas en capas con verduras, aguacate y mayonesa.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/pizza.png" alt="Pizza Margarita">
                <div class="dish-card-content">
                    <h4>Pizza Margarita</h4>
                    <p>Pizza clásica con salsa de tomate, mozzarella y albahaca.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/pachamanca.png" alt="Pachamanca">
                <div class="dish-card-content">
                    <h4>Pachamanca</h4>
                    <p>Carnes (res, cerdo, pollo, cordero) y tubérculos cocidos bajo tierra con hierbas aromáticas y piedras calientes.</p>
                </div>
            </div>
             <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/seco_de_cordero.png" alt="Seco de Cordero">
                <div class="dish-card-content">
                    <h4>Seco de Cordero</h4>
                    <p>Guiso de cordero tierno cocinado a fuego lento con culantro, arvejas y zanahorias, acompañado de arroz blanco y frijoles.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/arroz_con_pollo.png" alt="Arroz con Pollo">
                <div class="dish-card-content">
                    <h4>Arroz con Pollo</h4>
                    <p>Arroz verde cocido con pollo, arvejas, zanahorias y culantro.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/carapulcra.png" alt="Carapulcra">
                <div class="dish-card-content">
                    <h4>Carapulcra</h4>
                    <p>Guiso de papa seca, carne de cerdo, pollo, ají panca y especias.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/arroz_con_mariscos.png" alt="Arroz con Mariscos">
                <div class="dish-card-content">
                    <h4>Arroz con Mariscos</h4>
                    <p>Arroz cocido con una variedad de mariscos como camarones, calamares, conchas y mejillones.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/parihuela.png" alt="Parihuela">
                <div class="dish-card-content">
                    <h4>Parihuela</h4>
                    <p>Sopa concentrada y sabrosa a base de pescado, mariscos, tomate, cebolla y ajíes.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/jalea_mixta.png" alt="Jalea Mixta">
                <div class="dish-card-content">
                    <h4>Jalea Mixta</h4>
                    <p>Variedad de mariscos y pescado apanados y fritos, servidos con salsa tártara y zarza criolla.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/sudado_pescado.png" alt="Sudado de Pescado">
                <div class="dish-card-content">
                    <h4>Sudado de Pescado</h4>
                    <p>Filete de pescado cocido al vapor con tomate, cebolla, ají amarillo y hierbas aromáticas.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/trucha_frita.png" alt="Trucha Frita">
                <div class="dish-card-content">
                    <h4>Trucha Frita</h4>
                    <p>Trucha fresca frita, sazonada con sal y pimienta, servida con papas doradas y ensalada.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/olluquito.png" alt="Olluquito con Charqui">
                <div class="dish-card-content">
                    <h4>Olluquito con Charqui</h4>
                    <p>Guiso de ollucos con charqui (carne seca).</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/sopa_de_quinua.png" alt="Sopa de Quinua">
                <div class="dish-card-content">
                    <h4>Sopa de Quinua</h4>
                    <p>Sopa nutritiva a base de quinua, verduras y caldo.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/humitas.png" alt="Humitas">
                <div class="dish-card-content">
                    <h4>Humitas</h4>
                    <p>Pastel de maíz tierno molido, relleno de queso y envuelto en hojas de choclo.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/saltado_verduras.png" alt="Saltado de Verduras">
                <div class="dish-card-content">
                    <h4>Saltado de Verduras</h4>
                    <p>Verduras salteadas con salsa de soya, servido con arroz.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/risotto.png" alt="Risotto de Hongos">
                <div class="dish-card-content">
                    <h4>Risotto de Hongos</h4>
                    <p>Arroz cremoso con hongos frescos.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/tacu_tacu.png" alt="Tacu Tacu Vegetariano">
                <div class="dish-card-content">
                    <h4>Tacu Tacu Vegetariano</h4>
                    <p>Mezcla de arroz y frijoles refritos, servido con huevo y plátano.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/brochetas.png" alt="Brochetas de Tofu">
                <div class="dish-card-content">
                    <h4>Brochetas de Tofu</h4>
                    <p>Tofu con verduras, asado a la parrilla.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/pasta.png" alt="Pasta Alfredo">
                <div class="dish-card-content">
                    <h4>Pasta Alfredo</h4>
                    <p>Pasta con salsa de mantequilla, crema y queso parmesano.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/hamburguesa.png" alt="Hamburguesa Clásica">
                <div class="dish-card-content">
                    <h4>Hamburguesa Clásica</h4>
                    <p>Hamburguesa de carne con toppings clásicos.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/sushi.png" alt="Sushi Variado">
                <div class="dish-card-content">
                    <h4>Sushi Variado</h4>
                    <p>Selección de rollos de sushi variados.</p>
                </div>
            </div>
            <div class="dish-card">
                <img src="${pageContext.request.contextPath}/cliente/vista/img/tacos.png" alt="Tacos al Pastor">
                <div class="dish-card-content">
                    <h4>Tacos al Pastor</h4>
                    <p>Tacos de cerdo con cebolla, cilantro y salsa.</p>
                </div>
            </div>
        </div>
        <div class="back-button">
            <a href="${pageContext.request.contextPath}/cliente/vista/platos.jsp#" class="btn btn-secondary">Volver al Inicio</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>