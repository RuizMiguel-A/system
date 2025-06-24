<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

    <meta charset="UTF-8">
    <title>${plato.idMenu == 0 ? "Nuevo Plato" : "Editar Plato"}</title>

    <link href="cliente/css/menu.css" rel="stylesheet" type="text/css"/>

</head>
<body>
            <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo5.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
<div class="container mt-3">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title text-center">Menú del Restaurante</h2>
            <%-- Navegación con pestañas --%>
            <ul class="nav nav-tabs justify-content-center">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ClienteControlador?accion=nuevo">Registro</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ReservaControlador?accion=nuevaReserva">Reserva</a></li>
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/MenuControlador?accion=listar">Menú</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/MenuControlador?accion=verCarrito"><i class="fas fa-shopping-cart"></i> Carrito</a></li>
            </ul>

            <c:if test="${not empty success}">
                <div class="alert alert-success mt-3">${success}</div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/MenuControlador" method="post">
                <input type="hidden" name="accion" value="guardar"> <%-- Esta acción ahora agregará al carrito --%>
                <input type="hidden" name="idMenu" id="id_plato">
                <div class="row">
                    <div class="col-md-6">
                        <div class="dish-selection">
                            <h3>Selecciona un Plato</h3>
                            <div class="mb-3">
                                <label for="menu_seleccionado" class="form-label">Menú:</label>

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
                    <select class="form-control" id="nombre_plato" name="nombrePlato" onchange="mostrarDetallesPlato()" required>
                        <option value="">Seleccione un Plato</option>
                    </select>
                </div>
               <div class="mb-3">
                   <label for="cantidad" class="form-label">Cantidad:</label>
                   <input type="number" class="form-control" id="cantidad" name="cantidad" value="1" min="1" required>
               </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="dish-details">
                            <h3>Detalles del Plato Seleccionado</h3>
                            <img id="imagen-plato" src="cliente/vista/img/descarga.png" alt="Plato" class="img-fluid mb-3">
                            <h4 id="titulo-plato"></h4>
                            <div class="mb-3">
                                <label for="descripcion" class="form-label">Descripción:</label>
                                <textarea id="descripcion" name="descripcion" class="form-control" rows="3" readonly></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="precio" class="form-label">Precio:</label>
                                <input type="text" id="precio" name="precio" class="form-control" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="categoria" class="form-label">Categoría:</label>
                                <input type="text" id="categoria" name="categoria" class="form-control" readonly>
                            </div>
                            
                        </div>
                    </div>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-cart-plus"></i> Agregar al Carrito</button>
                    <a href="${pageContext.request.contextPath}/cliente/vista/presentacion.jsp" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Volver al Inicio</a>
                </div>
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
},
andinos: {
    "Pachamanca": {
        id: 21,
        descripcion: "Carne de res, cerdo, pollo y cuy cocidos bajo tierra con papas, habas y humitas.",
        precio: 40.00,
        categoria: "Platos Andinos",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/pachamanca.png"
    },
    "Trucha Frita": {
        id: 22,
        descripcion: "Trucha fresca frita acompañada de papas doradas y ensalada criolla.",
        precio: 33.00,
        categoria: "Platos Andinos",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/trucha_frita.png"
    },
    "Chupe de Quinua": {
        id: 23,
        descripcion: "Sopa espesa de quinua con verduras, queso y leche.",
        precio: 25.00,
        categoria: "Platos Andinos",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/chupe_quinua.png"
    },
    "Olluquito con Charqui": {
        id: 24,
        descripcion: "Plato tradicional de olluco con carne seca de alpaca o res.",
        precio: 27.50,
        categoria: "Platos Andinos",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/olluquito_charqui.png"
    }
},
vegetarianos: {
    "Saltado de Verduras": {
        id: 41,
        descripcion: "Verduras salteadas con salsa de soya, servido con arroz.",
        precio: 19.90,
        categoria: "Plato Fuerte",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/saltado_verduras.png"
    },
    "Risotto de Hongos": {
        id: 42,
        descripcion: "Arroz cremoso con hongos frescos.",
        precio: 27.00,
        categoria: "Plato Fuerte",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/risotto.png"
    },
    "Causa Vegetariana": {
        id: 43,
        descripcion: "Puré de papas en capas con verduras, aguacate y mayonesa.",
        precio: 21.50,
        categoria: "Entrada",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/causa_vegetariana.png"
    },
    "Tacu Tacu Vegetariano": {
        id: 44,
        descripcion: "Mezcla de arroz y frijoles refritos, servido con huevo y plátano.",
        precio: 20.50,
        categoria: "Plato Fuerte",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/tacu_tacu.png"
    },
    "Brochetas de Tofu": {
        id: 45,
        descripcion: "Tofu con verduras, asado a la parrilla.",
        precio: 24.50,
        categoria: "Plato Fuerte",
        imagen: "${pageContext.request.contextPath}/cliente/vista/img/brochetas.png"
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
        document.getElementById("cantidad").value = "1"; // Resetear cantidad a 1
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
        document.getElementById('cantidad').value = '1'; // Asegurar que la cantidad inicial sea 1
        actualizarPlatos(); // Asegura que los platos se carguen correctamente al inicio
    });
</script>
</body>
</html>