<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    
    <meta charset="UTF-8">
    <title>${plato.idMenu == 0 ? "Nuevo Plato" : "Editar Plato"}</title>

    <link href="../css/menu.css" rel="stylesheet" type="text/css"/>
<style>

    </style>
</head>
<body>
            <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
<div class="container mt-3">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title text-center">Restaurante</h2>
            <%-- Navegación con pestañas --%>
            <ul class="nav nav-tabs justify-content-center">
                <li class="nav-item"><a class="nav-link" href="ClienteControlador?accion=nuevo">Registro</a></li>
                <li class="nav-item"><a class="nav-link" href="ReservaControlador?accion=nuevaReserva">Reserva</a></li> <%-- Pestaña activa --%>
                <li class="nav-item"><a class="nav-link active" href="MenuControlador?accion=nuevo">Menú</a></li>
                <li class="nav-item"><a class="nav-link" href="VentaControlador?accion=nuevaVenta">Pago</a></li>
            </ul>
            <form action="MenuControlador" method="post">
                <input type="hidden" name="id" value="${plato.idMenu}">
                <input type="hidden" name="accion" value="guardar">

                <div class="mb-3">
                    <label for="menu_seleccionado" class="form-label">Seleccione un Menú:</label>
                    <select class="form-control" id="menu_seleccionado" name="menu_seleccionado" onchange="actualizarPlatos()" required>
                        <option value="">Seleccione un Menú</option>
                        <option value="Menu Criollo">Menú Criollo</option>
                        <option value="Menu Marino">Menú Marino</option>
                        <option value="Menu Andino">Menú Andino</option>
                        <option value="Menu Vegetariano">Menú Vegetariano</option>
                        <option value="Menu Internacional">Menú Internacional</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="nombre_plato" class="form-label">Nombre del Plato:</label>
                    <select class="form-control" id="nombre_plato" name="nombre_plato" onchange="mostrarDetallesPlato()" required>
                        <option value="">Seleccione un Plato</option>
                    </select>
                </div>

                <div class="row mb-3 align-items-start">
                    <div class="col-md-5 text-center">
                        <h5 id="titulo-plato" class="mt-3"></h5>
                        <img id="imagen-plato" src="cliente/vista/img/descarga.png" alt="Imagen del Plato" style="max-width: 100%; max-height: 250px;">
                    </div>

                    <div class="col-md-7">
                        <div class="mb-3">
                            <label for="descripcion" class="form-label">Descripción:</label>
                            <textarea class="form-control" id="descripcion" name="descripcion" rows="5" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="precio" class="form-label">Precio:</label>
                            <input type="number" step="0.01" class="form-control" id="precio" name="precio" required >
                        </div>

                        <div class="mb-3">
                            <label for="categoria" class="form-label">Categoría:</label>
                            <input type="text" class="form-control" id="categoria" name="categoria" required >
                        </div>
                    </div>
                </div>

                <a href="ReservaControlador?accion=nuevaReserva" class="btn btn-dark btn-sm mt-3">
                    <i class="fa fa-arrow-left"></i> Volver Atrás
                </a>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-save"></i> Guardar</button>
                <button type="button" class="btn btn-dark btn-sm mt-3" onclick="irANuevaVenta()">
                    Siguiente <i class="fa fa-arrow-right"></i>
                </button>
         



            </form>
        </div>
    </div>
</div>
                    


<script>
    const detallesPlatosPorMenu = {
        "Menu Criollo": {
            "Lomo Saltado": { descripcion: "Trozos de carne de res salteados con cebolla, tomate, ají amarillo y salsa de soya, servido con arroz y papas fritas.", precio: 25.50, categoria: "Plato Fuerte", imagen: "cliente/vista/img/lomo_saltado.png" },
            "Aji de Gallina": { descripcion: "Gallina desmenuzada en una salsa cremosa a base de ají amarillo, leche, pan y nueces, servido con arroz y papas.", precio: 22.00, categoria: "Plato Fuerte", imagen: "cliente/vista/img/aji_de_gallina.png" },
            "Seco de Cordero": { descripcion: "Guiso de cordero tierno cocinado a fuego lento con culantro, arvejas y zanahorias, acompañado de arroz blanco y frijoles.", precio: 28.75, categoria: "Plato Fuerte", imagen: "cliente/vista/img/seco_de_cordero.png" },
            "Arroz con Pollo": { descripcion: "Arroz verde cocido con pollo, arvejas, zanahorias y culantro.", precio: 18.90, categoria: "Plato Fuerte", imagen: "cliente/vista/img/arroz_con_pollo.png" },
            "Carapulcra": { descripcion: "Guiso de papa seca, carne de cerdo, pollo, ají panca y especias.", precio: 24.00, categoria: "Plato Fuerte", imagen: "cliente/vista/img/carapulcra.png" }
        },
        "Menu Marino": {
            "Ceviche": { descripcion: "Pescado blanco fresco marinado en jugo de limón con cebolla roja, ají limo y cilantro, servido con camote, choclo y cancha serrana.", precio: 32.50, categoria: "Entrada", imagen: "cliente/vista/img/ceviche.png" },
            "Arroz con Mariscos": { descripcion: "Arroz cocido con una variedad de mariscos como camarones, calamares, conchas y mejillones.", precio: 35.00, categoria: "Plato Fuerte", imagen: "cliente/vista/img/arroz_con_mariscos.png"},
            "Parihuela": { descripcion: "Sopa concentrada y sabrosa a base de pescado, mariscos, tomate, cebolla y ajíes.", precio: 29.90, categoria: "Sopa", imagen: "cliente/vista/img/parihuela.png" },
            "Jalea Mixta": { descripcion: "Variedad de mariscos y pescado apanados y fritos, servidos con salsa tártara y zarza criolla.", precio: 38.00, categoria: "Para Compartir", imagen: "cliente/vista/img/jalea_mixta.png" },
            "Sudado de Pescado": { descripcion: "Filete de pescado cocido al vapor con tomate, cebolla, ají amarillo y hierbas aromáticas.", precio: 31.25, categoria: "Plato Fuerte", imagen: "cliente/vista/img/sudado_pescado.png" }
        },
        "Menu Andino": {
            "Pachamanca": { descripcion: "Carnes (res, cerdo, pollo, cordero) y tubérculos cocidos bajo tierra con hierbas aromáticas y piedras calientes.", precio: 45.00, categoria: "Plato Fuerte", imagen: "cliente/vista/img/pachamanca.png" },
            "Trucha Frita": { descripcion: "Trucha fresca frita, sazonada con sal y pimienta, servida con papas doradas y ensalada.", precio: 26.50, categoria: "Plato Fuerte", imagen: "cliente/vista/img/trucha_frita.png" },
            "Olluquito con Charqui": { descripcion: "Guiso de ollucos con charqui (carne seca).", precio: 23.80, categoria: "Plato Fuerte", imagen: "cliente/vista/img/olluquito.png" },
            "Sopa de Quinua": { descripcion: "Sopa nutritiva a base de quinua, verduras y caldo.", precio: 15.00, categoria: "Sopa", imagen: "cliente/vista/img/sopa_de_quinua.png" },
            "Humitas": { descripcion: "Pastel de maíz tierno molido, relleno de queso y envuelto en hojas de choclo.", precio: 12.50, categoria: "Entrada", imagen: "cliente/vista/img/humitas.png" }
        },
        "Menu Vegetariano": {
            "Saltado de Verduras": { descripcion: "Verduras salteadas con salsa de soya, servido con arroz.", precio: 19.90, categoria: "Plato Fuerte", imagen: "cliente/vista/img/saltado_verduras.png" },
            "Risotto de Hongos": { descripcion: "Arroz cremoso con hongos frescos.", precio: 27.00, categoria: "Plato Fuerte", imagen: "cliente/vista/img/risotto.png" },
            "Causa Vegetariana": { descripcion: "Puré de papas en capas con verduras, aguacate y mayonesa.", precio: 21.50, categoria: "Entrada", imagen: "cliente/vista/img/causa_vegetariana.png" },
            "Tacu Tacu Vegetariano": { descripcion: "Mezcla de arroz y frijoles refritos, servido con huevo y plátano.", precio: 20.50, categoria: "Plato Fuerte", imagen: "cliente/vista/img/tacu_tacu.png" },
            "Brochetas de Tofu": { descripcion: "Tofu con verduras, asado a la parrilla.", precio: 24.50, categoria: "Plato Fuerte", imagen: "cliente/vista/img/brochetas.png" }
        },
        "Menu Internacional": {
            "Pizza Margarita": { descripcion: "Pizza clásica con salsa de tomate, mozzarella y albahaca.", precio: 30.00, categoria: "Para Compartir", imagen: "cliente/vista/img/pizza.png" },
            "Pasta Alfredo": { descripcion: "Pasta con salsa de mantequilla, crema y queso parmesano.", precio: 28.50, categoria: "Plato Fuerte", imagen: "cliente/vista/img/pasta.png" },
            "Hamburguesa Clásica": { descripcion: "Hamburguesa de carne con toppings clásicos.", precio: 26.90, categoria: "Plato Fuerte", imagen: "cliente/vista/img/hamburguesa.png" },
            "Sushi Variado": { descripcion: "Selección de rollos de sushi variados.", precio: 42.00, categoria: "Para Compartir", imagen: "cliente/vista/img/sushi.png" },
            "Tacos al Pastor": { descripcion: "Tacos de cerdo con cebolla, cilantro y salsa.", precio: 22.75, categoria: "Entrada", imagen: "cliente/vista/img/tacos.png" }
        }
    };

    function actualizarPlatos() {
        const menuSeleccionado = document.getElementById("menu_seleccionado").value;
        const platoSelect = document.getElementById("nombre_plato");
        platoSelect.innerHTML = '<option value="">Seleccione un Plato</option>';

        if (detallesPlatosPorMenu[menuSeleccionado]) {
            Object.keys(detallesPlatosPorMenu[menuSeleccionado]).forEach(plato => {
                const option = document.createElement("option");
                option.value = plato;
                option.text = plato;
                platoSelect.appendChild(option);
            });
        }
  document.getElementById("imagen-plato").src = "cliente/vista/img/descarga.png";
        document.getElementById("descripcion").value = "";
        document.getElementById("precio").value = "";
        document.getElementById("categoria").value = "";
        document.getElementById("imagen-plato").src = "cliente/vista/img/descarga.png";
        document.getElementById("titulo-plato").textContent = "";
    }

    function mostrarDetallesPlato() {
        const menu = document.getElementById("menu_seleccionado").value;
        const plato = document.getElementById("nombre_plato").value;
        const detalles = detallesPlatosPorMenu[menu]?.[plato];
        const imagenPlato = document.getElementById("imagen-plato");

        if (detalles) {
            document.getElementById("descripcion").value = detalles.descripcion;
            document.getElementById("precio").value = detalles.precio;
            document.getElementById("categoria").value = detalles.categoria;
            imagenPlato.src = detalles.imagen;
            document.getElementById("titulo-plato").textContent = plato;
        } else {
            imagenPlato.src = "cliente/vista/img/descarga.png";
            document.getElementById("titulo-plato").textContent = "";
        }
    }

function irANuevaVenta() {
  // Obtiene el precio del campo con ID "precio".
  const precioPlato = document.getElementById("precio").value;
  // Redirige a VentaControlador para nueva venta, pasando el precio.
  window.location.href = "VentaControlador?accion=nuevaVenta&precio=" + precioPlato;
}

document.addEventListener('DOMContentLoaded', () => {
  // Limpia los campos descripción, precio y categoría al cargar la página.
  document.getElementById('descripcion').value = '';
  document.getElementById('precio').value = '';
  document.getElementById('categoria').value = '';
});
</script>
</body>
</html>
