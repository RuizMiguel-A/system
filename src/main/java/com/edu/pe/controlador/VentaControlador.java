package com.edu.pe.controlador;

import com.edu.pe.modelo.Venta;
import com.edu.pe.modelo.Menu; // Necesario para acceder a los ítems del carrito
import com.edu.pe.modelo.dao.VentaDAO; // Asume que tienes un VentaDAO para persistir la venta
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date; // Para la fecha de la venta
import java.util.ArrayList; // Para la lista de ítems del carrito
import java.util.List;

public class VentaControlador extends HttpServlet {

    private final VentaDAO ventaDAO = new VentaDAO();
    private final String PAGINA_VENTA_LIST = "cliente/vista/ventalist.jsp"; // Para listar ventas (si aplica)
    private final String PAGINA_VENTA_FORM = "cliente/vista/venta.jsp"; // El formulario de pago

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listarVentas"; // Acción por defecto
        }

        switch (accion) {
            case "listarVentas":
                listarVentas(request, response);
                break;
            case "nuevaVenta": // Llega desde carrito.jsp para mostrar el formulario de pago
                nuevaVenta(request, response);
                break;
            case "editarVenta": // Funcionalidad de administración (si existe)
                editarVenta(request, response);
                break;
            case "eliminarVenta": // Funcionalidad de administración (si existe)
                eliminarVenta(request, response);
                break;
            case "guardar": // Procesa el pago y guarda la venta
                guardarVenta(request, response);
                break;
            default:
                listarVentas(request, response);
        }
    }

    private void listarVentas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Venta> listaVentas = ventaDAO.listarVenta(); // Asume que tienes este método en VentaDAO
        request.setAttribute("ventas", listaVentas);
        request.getRequestDispatcher(PAGINA_VENTA_LIST).forward(request, response);
    }

    private void nuevaVenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Menu> carrito = (List<Menu>) session.getAttribute("carritoItems");

        if (carrito == null || carrito.isEmpty()) {
            // Si el carrito está vacío, redirige de vuelta al menú o al carrito con un mensaje
            request.getSession().setAttribute("error", "Su carrito está vacío. Agregue productos para continuar.");
            response.sendRedirect(request.getContextPath() + "/MenuControlador?accion=listar");
            return;
        }

        // El total ya viene calculado desde carrito.jsp a través de un input hidden.
        // Lo obtenemos de los parámetros de la solicitud.
        String totalParam = request.getParameter("total");
        double montoTotalCalculado = 0.0;

        if (totalParam != null && !totalParam.isEmpty()) {
            try {
                montoTotalCalculado = Double.parseDouble(totalParam);
            } catch (NumberFormatException e) {
                System.err.println("Error de formato numérico al obtener el total de la venta: " + e.getMessage());
                // En caso de error, recalculamos desde el carrito como fallback
                montoTotalCalculado = calcularTotalDesdeCarrito(carrito);
            }
        } else {
            // Si el parámetro 'total' no llegó, recalculamos para mayor seguridad
            montoTotalCalculado = calcularTotalDesdeCarrito(carrito);
        }

        request.setAttribute("totalVenta", String.format("%.2f", montoTotalCalculado));
        request.getRequestDispatcher(PAGINA_VENTA_FORM).forward(request, response);
    }
    
    // Método auxiliar para calcular el total desde el carrito (útil como fallback)
    private double calcularTotalDesdeCarrito(List<Menu> carrito) {
        double monto = 0.0;
        if (carrito != null) {
            for (Menu item : carrito) {
                monto += (item.getPrecio() * item.getCantidad()); // Multiplica precio por cantidad
            }
        }
        return monto;
    }


    private void editarVenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Venta venta = ventaDAO.buscarVentaPorId(id); // Asume que tienes este método
        request.setAttribute("venta", venta);
        request.getRequestDispatcher(PAGINA_VENTA_FORM).forward(request, response);
    }

    private void eliminarVenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int resultado = ventaDAO.eliminarVenta(id); // Asume que tienes este método
        if (resultado > 0) {
            request.getSession().setAttribute("success", "Venta eliminada correctamente.");
        } else {
            request.getSession().setAttribute("error", "Error al eliminar la venta.");
        }
        response.sendRedirect(request.getContextPath() + "/VentaControlador?accion=listarVentas"); // Redirige a la lista de ventas
    }

    private void guardarVenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Menu> carrito = (List<Menu>) session.getAttribute("carritoItems");

        if (carrito == null || carrito.isEmpty()) {
            request.getSession().setAttribute("error", "No hay productos en el carrito para realizar la venta.");
            response.sendRedirect(request.getContextPath() + "/MenuControlador?accion=listar"); // Redirige al menú
            return;
        }

        Venta venta = new Venta();
        venta.setFechaVenta(new Date(System.currentTimeMillis()));

        // Obtener el monto total del formulario (ya viene calculado desde carrito.jsp)
        double montoTotal = 0.0;
        try {
            // Se asume que 'monto_total' ya es el total calculado con las cantidades
            montoTotal = Double.parseDouble(request.getParameter("monto_total"));
        } catch (NumberFormatException e) {
            System.err.println("Error de formato numérico al obtener monto_total en guardarVenta: " + e.getMessage());
            // Fallback: Si hay un error, recalcular directamente del carrito
            montoTotal = calcularTotalDesdeCarrito(carrito);
        }
        venta.setMontoTotal(montoTotal);

        // Datos de tarjeta (solo para demostración, NO almacenar en producción sin encriptación/tokenización)
        venta.setNumeroTarjeta(request.getParameter("numero_tarjeta"));
        venta.setFechaExpiracion(request.getParameter("fecha_expiracion"));
        venta.setCvv(request.getParameter("cvv"));

        // Aquí podrías agregar la lógica para guardar los detalles de la venta (ítems comprados)
        // en una tabla de detalle de ventas, utilizando la lista 'carrito'.
        // Por ejemplo: ventaDAO.registrarDetalleVenta(venta.getIdVenta(), carrito);

        // Guardar la venta principal en la base de datos
        int resultado = ventaDAO.registrarVenta(venta); // Asume que este método registra la venta principal

        if (resultado > 0) {
            session.setAttribute("success", "Venta realizada con éxito. ¡Gracias por su compra!");
            session.removeAttribute("carritoItems"); // ¡Vaciar carrito después de una venta exitosa!
            response.sendRedirect(request.getContextPath() + "/cliente/vista/gracias.jsp"); // Página de confirmación
        } else {
            request.setAttribute("error", "Error al registrar la venta. Por favor, intente de nuevo.");
            request.setAttribute("venta", venta); // Vuelve a pasar la venta para repoblar el formulario si hay error
            // También deberías volver a calcular y pasar el totalVenta si no se va a redirigir
            request.setAttribute("totalVenta", String.format("%.2f", montoTotal));
            request.getRequestDispatcher(PAGINA_VENTA_FORM).forward(request, response);
        }
    }
}   