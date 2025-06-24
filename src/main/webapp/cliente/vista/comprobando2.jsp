<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    
    <meta charset="UTF-8">
    <title>${plato.idMenu == 0 ? "Nuevo Plato" : "Editar Plato"}</title>

    <link href="cliente/css/menu.css" rel="stylesheet" type="text/css"/>
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
    <option value="criollos">Menú Criollo</option>
    <option value="marinos">Menú Marino</option>
    <option value="andinos">Menú Andino</option>
    <option value="vegetarianos">Menú Vegetariano</option>
    <option value="internacionales">Menú Internacional</option>
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
           

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const detallesPlatosPorMenu = {
        criollos: {
            "Lomo Saltado": {
                id: 1, // Asignar un ID único
                descripcion: "Trozos de lomo de res salteados al wok con cebolla, tomate, ají amarillo y papas fritas. Acompañado de arroz.",
                precio: 35.50,
                categoria: "Platos Peruanos",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/lomosaltado.png"
            },
            "Ají de Gallina": {
                id: 2,
                descripcion: "Pechuga de gallina deshilachada en una salsa cremosa de ají amarillo, pan y nueces. Servido con papas, huevo y aceitunas.",
                precio: 28.00,
                categoria: "Platos Peruanos",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/aji_de_gallina.png"
            },
            "Ceviche Clásico": {
                id: 3,
                descripcion: "Trozos de pescado fresco marinados en limón, ají limo, cebolla roja y cilantro. Acompañado de camote y choclo.",
                precio: 42.00,
                categoria: "Platos Peruanos",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/ceviche.png"
            },
            "Causa Rellena": {
                id: 4,
                descripcion: "Puré de papa amarilla sazonado con ají amarillo, relleno de pollo, atún o mariscos.",
                precio: 25.00,
                categoria: "Entradas Peruanas",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/causa_rellena.png"
            },
            "Arroz con Pato": {
                id: 5,
                descripcion: "Arroz verde cocido con cerveza negra y culantro, acompañado de confit de pato.",
                precio: 38.00,
                categoria: "Platos Peruanos",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/arrozconpato.png"
            },
            "Pachamanca": {
                id: 6,
                descripcion: "Carnes (res, cerdo, pollo, cordero) y tubérculos cocidos bajo tierra con hierbas aromáticas y piedras calientes.",
                precio: 60.00,
                categoria: "Platos Peruanos",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/pachamanca.png"
            }
        },
        internacionales: {
            "Pasta Alfredo": {
                id: 7,
                descripcion: "Pasta con salsa de mantequilla, crema y queso parmesano.",
                precio: 22.00,
                categoria: "Platos Internacionales",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/pasta.png"
            },
            "Hamburguesa Clásica": {
                id: 8,
                descripcion: "Hamburguesa de carne con toppings clásicos.",
                precio: 20.00,
                categoria: "Platos Internacionales",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/hamburguesa.png"
            },
            "Sushi Variado": {
                id: 9,
                descripcion: "Selección de rollos de sushi variados.",
                precio: 45.00,
                categoria: "Platos Internacionales",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/sushi.png"
            },
            "Tacos al Pastor": {
                id: 10,
                descripcion: "Tacos de cerdo con cebolla, cilantro y salsa.",
                precio: 18.00,
                categoria: "Platos Internacionales",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/tacos.png"
            },
            "Pizza Pepperoni": {
                id: 11,
                descripcion: "Pizza clásica con salsa de tomate, mozzarella y pepperoni.",
                precio: 30.00,
                categoria: "Platos Internacionales",
                imagen: "${pageContext.request.contextPath}/cliente/vista/img/pizza.png"
            }
        },
marinos: {
    "Ceviche": {
        id: 12,
        descripcion: "Pescado blanco fresco marinado en jugo de limón con cebolla roja, ají limo y cilantro, servido con camote, choclo y cancha serrana.",
        precio: 32.50,
        categoria: "Entrada",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/ceviche.png"
    },
    "Arroz con Mariscos": {
        id: 13,
        descripcion: "Arroz cocido con una variedad de mariscos como camarones, calamares, conchas y mejillones.",
        precio: 35.00,
        categoria: "Plato Fuerte",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/arroz_con_mariscos.png"
    },
    "Parihuela": {
        id: 14,
        descripcion: "Sopa concentrada y sabrosa a base de pescado, mariscos, tomate, cebolla y ajíes.",
        precio: 29.90,
        categoria: "Sopa",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/parihuela.png"
    },
    "Jalea Mixta": {
        id: 15,
        descripcion: "Variedad de mariscos y pescado apanados y fritos, servidos con salsa tártara y zarza criolla.",
        precio: 38.00,
        categoria: "Para Compartir",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/jalea_mixta.png"
    },
    "Sudado de Pescado": {
        id: 16,
        descripcion: "Filete de pescado cocido al vapor con tomate, cebolla, ají amarillo y hierbas aromáticas.",
        precio: 31.25,
        categoria: "Plato Fuerte",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/sudado_pescado.png"
    }
}

    };

    function actualizarPlatos() {
        const menuSeleccionado = document.getElementById("menu_seleccionado").value;
        const nombrePlatoSelect = document.getElementById("nombre_plato");

        // Limpiar opciones anteriores
        nombrePlatoSelect.innerHTML = '<option value="">Seleccione un Plato</option>';

        if (menuSeleccionado && detallesPlatosPorMenu[menuSeleccionado]) {
            const platos = detallesPlatosPorMenu[menuSeleccionado];
            for (const plato in platos) {
                const option = document.createElement("option");
                option.value = plato;
                option.textContent = plato;
                nombrePlatoSelect.appendChild(option);
            }
        }
        // Limpiar los detalles del plato y la imagen cuando se cambia el menú
        document.getElementById("descripcion").value = "";
        document.getElementById("precio").value = "";
        document.getElementById("categoria").value = "";
        document.getElementById("imagen-plato").src = "cliente/vista/img/descarga.png";
        document.getElementById("titulo-plato").textContent = "";
        document.getElementById("id_plato").value = ""; // Limpiar ID
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
            document.getElementById("id_plato").value = detalles.id; // Asignar el ID al campo oculto
        } else {
            imagenPlato.src = "cliente/vista/img/descarga.png";
            document.getElementById("titulo-plato").textContent = "";
            document.getElementById("id_plato").value = ""; // Limpiar ID
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        // Limpia los campos descripción, precio y categoría al cargar la página.
        document.getElementById('descripcion').value = '';
        document.getElementById('precio').value = '';
        document.getElementById('categoria').value = '';
        document.getElementById('id_plato').value = ''; // Limpiar ID al cargar
        actualizarPlatos(); // Asegura que los platos se carguen correctamente al inicio
    });
</script>
</body>
</html>