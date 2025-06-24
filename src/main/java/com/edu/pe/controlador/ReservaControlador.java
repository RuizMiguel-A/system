package com.edu.pe.controlador;

import com.edu.pe.modelo.Reserva;
import com.edu.pe.modelo.dao.ReservaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReservaControlador extends HttpServlet {

    private ReservaDAO reservaDAO = new ReservaDAO();
    private final String paginaReserva_List = "cliente/vista/reservalist.jsp";
    private final String paginaReserva_Form = "cliente/vista/reserva.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listarReserva";
        }
        switch (accion) {
            case "listarReserva":
                listarReserva(request, response);
                break;
            case "nuevaReserva":
                nuevaReserva(request, response);
                break;
            case "editarReserva":
                editarReserva(request, response);
                break;
            case "eliminarReserva":
                eliminarReserva(request, response);
                break;
            case "guardarReserva":
                guardarReserva(request, response);
                break;
            case "mostrarBaucher":  // Nuevo caso para mostrar el baucher
                mostrarBaucher(request, response);
                break;
            default:
                listarReserva(request, response);
        }
    }

    private void listarReserva(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        List<Reserva> reservaList = reservaDAO.listarReserva();
        request.setAttribute("reservas", reservaList);
        request.getRequestDispatcher(paginaReserva_List).forward(request, response);
    }

    private void nuevaReserva(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("reserva", new Reserva());
        request.getRequestDispatcher(paginaReserva_Form).forward(request, response);
    }

    private void editarReserva(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Reserva reserva = reservaDAO.buscarReservaPorId(id);
        if (reserva != null) {
            request.setAttribute("reserva", reserva);
            request.getRequestDispatcher(paginaReserva_Form).forward(request, response);
        } else {
            request.getSession().setAttribute("error", "No se encontró la reserva con ID " + id);
            System.err.println("Error: No se encontró la reserva con ID " + id);
            response.sendRedirect("ReservaControlador?accion=listarReserva");
        }
    }

    private void eliminarReserva(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        int resultado = reservaDAO.eliminarReserva(id);
        if (resultado > 0) {
            request.getSession().setAttribute("success", "Reserva eliminada correctamente.");
        } else {
            request.getSession().setAttribute("error", "No se pudo eliminar la reserva.");
        }
        response.sendRedirect("ReservaControlador?accion=listarReserva");
    }

    private void guardarReserva(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Reserva reserva = new Reserva();
        String idStr = request.getParameter("id_reserva");
        if (idStr != null && !idStr.isEmpty()) {
            reserva.setIdReserva(Integer.parseInt(idStr));
        }

        reserva.setFecha(request.getParameter("fecha"));
        reserva.setHora(request.getParameter("hora"));
        try {
            reserva.setCantidadPersonas(Integer.parseInt(request.getParameter("cantidad_personas")));
            reserva.setIdCliente(Integer.parseInt(request.getParameter("id_cliente")));
            reserva.setNumeroMesa(Integer.parseInt(request.getParameter("numero_mesa")));  // Changed
        } catch (NumberFormatException e) {
            System.err.println("Error al convertir a número: " + e.getMessage());
            e.printStackTrace();
            return;
        }
        reserva.setUbicacion(request.getParameter("ubicacion"));

        try {
            int resultado;
            if (reserva.getIdReserva() == 0) {
                resultado = reservaDAO.registrarReserva(reserva);
            } else {
                resultado = reservaDAO.editarReserva(reserva);
            }

            if (resultado > 0) {
                request.getSession().setAttribute("success", "Datos de la reserva guardados.");
                //  En lugar de redirigir a listarReserva, muestra el baucher:
                response.sendRedirect("MenuControlador?accion=nuevo" );
            } else {
                request.getSession().setAttribute("error", "No se pudieron guardar los datos de la reserva.");
                request.setAttribute("reserva", reserva);
                request.getRequestDispatcher(paginaReserva_Form).forward(request, response);
            }
        } catch (ServletException | IOException e) {
            System.err.println("Error al procesar la solicitud: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void mostrarBaucher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int idReserva = Integer.parseInt(request.getParameter("id"));  // Obtiene el ID de la reserva desde la solicitud
        Reserva reserva = reservaDAO.buscarReservaPorId(idReserva);  // Busca la reserva en la base de datos

        if (reserva != null) {
            request.setAttribute("reserva", reserva);  // Coloca el objeto Reserva en la solicitud
            request.getRequestDispatcher("cliente/vista/baucherDePago.jsp").forward(request, response);  // Envía la solicitud al JSP
        } else {
            request.getSession().setAttribute("error", "No se encontró la reserva.");
            response.sendRedirect("ReservaControlador?accion=nuevaReserva");  // O a una página de error
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReservaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReservaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}