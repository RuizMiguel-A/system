package com.edu.pe.controlador;

import com.edu.pe.modelo.Menu;
import com.edu.pe.modelo.dao.MenuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; // Importar HttpSession
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator; // Para remover de forma segura
import java.util.List;

public class MenuControlador extends HttpServlet {

    private MenuDAO menuDAO = new MenuDAO();
    // Renombrado para mayor claridad, aunque el archivo JSP se llama carrito.jsp
    private final String PAGINA_CARRITO = "cliente/vista/carrito.jsp";
    private final String PAGINA_MENU_FORM = "cliente/vista/menu.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar"; // Acción por defecto
        }
        switch (accion) {
            case "listar": // Para listar los platos disponibles en menu.jsp
                listar(request, response);
                break;
            case "nuevo": // Para mostrar el formulario de nuevo plato (administración)
                nuevo(request, response);
                break;
            case "editar": // Para editar un plato (administración)
                editar(request, response);
                break;
            case "eliminar": // Para eliminar un plato (administración)
                eliminar(request, response);
                break;
            case "guardar": // Usado para "agregar al carrito" desde menu.jsp
                // Este es el método que se ejecuta cuando el formulario de menu.jsp se envía con accion="guardar"
                agregarAlCarrito(request, response);
                break;
            case "verCarrito": // Acción para ver el carrito
                verCarrito(request, response);
                break;
            case "quitarDelCarrito": // Acción para quitar elementos del carrito
                quitarDelCarrito(request, response);
                break;
            default:
                listar(request, response);
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // En este contexto, 'listar' significa mostrar el formulario para seleccionar platos, que es 'menu.jsp'
        // No necesitamos cargar una lista de menus desde la BD aquí, ya que los detalles están en JS.
        request.getRequestDispatcher(PAGINA_MENU_FORM).forward(request, response);
    }

    // Estos métodos (nuevo, editar, eliminar) son para la administración del menú,
    // si tuvieras una sección para gestionar los platos.
    private void nuevo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("menu", new Menu());
        request.getRequestDispatcher(PAGINA_MENU_FORM).forward(request, response);
    }

    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Menu menu = menuDAO.buscarPlatoPorId(id); // Asumiendo que MenuDAO tiene este método
        request.setAttribute("menu", menu);
        request.getRequestDispatcher(PAGINA_MENU_FORM).forward(request, response);
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int resultado = menuDAO.eliminarPlato(id); // Asumiendo que MenuDAO tiene este método
        if (resultado > 0) {
            request.getSession().setAttribute("success", "Plato eliminado correctamente.");
        } else {
            request.getSession().setAttribute("error", "Error al eliminar el plato.");
        }
        response.sendRedirect("MenuControlador?accion=listar");
    }

    // *** Lógica para el Carrito ***

    private void agregarAlCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Obtener el carrito de la sesión. Si no existe, crear uno nuevo.
        List<Menu> carrito = (List<Menu>) session.getAttribute("carritoItems");
        if (carrito == null) {
            carrito = new ArrayList<>();
        }

        // Obtener los detalles del plato y la cantidad del formulario (menu.jsp)
        try {
            int idPlato = Integer.parseInt(request.getParameter("idMenu"));
            String nombrePlato = request.getParameter("nombrePlato");
            double precioPlato = Double.parseDouble(request.getParameter("precio"));
            String descripcionPlato = request.getParameter("descripcion");
            String categoriaPlato = request.getParameter("categoria");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            // Validar que la cantidad sea al menos 1
            if (cantidad < 1) {
                request.getSession().setAttribute("error", "La cantidad debe ser al menos 1.");
                response.sendRedirect(PAGINA_MENU_FORM); // Vuelve al formulario de menú
                return;
            }

            // Comprobar si el plato ya está en el carrito para actualizar la cantidad
            boolean encontrado = false;
            for (Menu item : carrito) {
                if (item.getIdMenu() == idPlato) {
                    item.setCantidad(item.getCantidad() + cantidad); // Sumar la nueva cantidad
                    encontrado = true;
                    break;
                }
            }

            if (!encontrado) {
                // Si no se encontró, crear un nuevo objeto Menu con los detalles y la cantidad
                Menu platoParaAgregar = new Menu();
                platoParaAgregar.setIdMenu(idPlato);
                platoParaAgregar.setNombrePlato(nombrePlato);
                platoParaAgregar.setPrecio(precioPlato);
                platoParaAgregar.setDescripcion(descripcionPlato);
                platoParaAgregar.setCategoria(categoriaPlato);
                platoParaAgregar.setCantidad(cantidad);
                carrito.add(platoParaAgregar); // Añadirlo como nuevo ítem
            }

            // Actualizar el carrito en la sesión
            session.setAttribute("carritoItems", carrito);
            request.getSession().setAttribute("success", "Plato(s) agregado(s) al carrito.");

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Error en los datos del plato o cantidad. Asegúrese de seleccionar un plato.");
            System.err.println("Error de formato numérico al agregar al carrito: " + e.getMessage());
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Ocurrió un error al agregar el plato al carrito.");
            System.err.println("Error general al agregar al carrito: " + e.getMessage());
            e.printStackTrace();
        }

        // Redirigir al usuario directamente al carrito después de agregar
        response.sendRedirect("MenuControlador?accion=verCarrito");
    }

    private void verCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // La página de carrito.jsp ya obtendrá los ítems de la sesión.
        request.getRequestDispatcher(PAGINA_CARRITO).forward(request, response);
    }

    private void quitarDelCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Menu> carrito = (List<Menu>) session.getAttribute("carritoItems");

        if (carrito != null) {
            try {
                int idMenuToRemove = Integer.parseInt(request.getParameter("idMenu"));

                Iterator<Menu> iterator = carrito.iterator();
                while (iterator.hasNext()) {
                    Menu item = iterator.next();
                    if (item.getIdMenu() == idMenuToRemove) {
                        iterator.remove(); // Quitar el ítem completamente
                        request.getSession().setAttribute("success", "Plato quitado del carrito.");
                        break; // Salir del bucle una vez que se quita el primer matching item
                    }
                }
            } catch (NumberFormatException e) {
                request.getSession().setAttribute("error", "Error al procesar el ID del plato a quitar.");
                System.err.println("Error de formato numérico al quitar del carrito: " + e.getMessage());
            } catch (Exception e) {
                request.getSession().setAttribute("error", "Ocurrió un error al quitar el plato del carrito.");
                System.err.println("Error general al quitar del carrito: " + e.getMessage());
                e.printStackTrace();
            }
            session.setAttribute("carritoItems", carrito); // Asegurarse de actualizar la sesión
        }
        response.sendRedirect("MenuControlador?accion=verCarrito"); // Redirige de vuelta al carrito
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}