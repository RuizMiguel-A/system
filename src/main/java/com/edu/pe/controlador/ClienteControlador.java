package com.edu.pe.controlador;

import com.edu.pe.modelo.Cliente; // Importa la clase Cliente (entidad).
import com.edu.pe.modelo.dao.ClienteDAO; // Importa la interfaz/clase para acceder a los datos de Cliente.
import jakarta.servlet.ServletException; // Importa la excepción para errores en servlets.
import jakarta.servlet.http.HttpServlet; // Importa la clase base para servlets HTTP.
import jakarta.servlet.http.HttpServletRequest; // Importa la clase para manejar las peticiones HTTP.
import jakarta.servlet.http.HttpServletResponse; // Importa la clase para manejar las respuestas HTTP.
import java.io.IOException; // Importa la excepción para errores de entrada/salida.


public class ClienteControlador extends HttpServlet {
    private ClienteDAO clienteDAO = new ClienteDAO(); // Instancia el objeto para interactuar con la base de datos de clientes.
    private final String paginaListar = "cliente/vista/listar.jsp"; // Define la ruta a la página para listar clientes.
        private final String paginaReservaList = "cliente/vista/reservalist.jsp"; // Define la ruta a la página para listar clientes.

    private final String paginaNuevoEditar = "cliente/vista/nuevo.jsp"; // Define la ruta a la página para crear o editar un cliente.
    private final String paginaReserva = "cliente/vista/reserva.jsp"; // Define la ruta a la página de reserva (aunque no se usa en este código).
    private final String paginaMenu = "cliente/vista/menu.jsp";
    private final String paginaVenta = "cliente/vista/venta.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8"); // Establece el tipo de contenido de la respuesta.
        String accion = request.getParameter("accion"); // Obtiene el parámetro 'accion' de la petición.
        if (accion == null) {
            accion = "listar"; // Si no hay acción, la acción por defecto es listar.
        }
        switch (accion) {
            case "listar":
                listar(request, response); // Llama al método para listar los clientes.
                break;
            case "nuevo":
                nuevo(request, response); // Llama al método para mostrar el formulario de nuevo cliente.
                break;
            case "editar":
                editar(request, response); // Llama al método para mostrar el formulario de edición de cliente.
                break;
            case "eliminar":
                eliminar(request, response); // Llama al método para eliminar un cliente.
                break;
            case "guardar":
                guardar(request, response); // Llama al método para guardar (crear o actualizar) un cliente.
                break;
            default:
                throw new AssertionError(); // Lanza un error si la acción no es reconocida.
        }
    }



    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("clientes", clienteDAO.listarTodos()); // Obtiene todos los clientes y los guarda como atributo.
        request.getRequestDispatcher(paginaListar).forward(request, response); // Redirecciona a la página para mostrar la lista de clientes.
    }

    private void nuevo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("cliente", new Cliente()); // Crea un nuevo objeto Cliente vacío y lo guarda como atributo.
        request.getRequestDispatcher(paginaNuevoEditar).forward(request, response); // Redirecciona a la página para crear un nuevo cliente.
    }

    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Obtiene el ID del cliente a editar.
        Cliente cliente = clienteDAO.buscarPorId(id); // Busca el cliente por su ID.
        if (cliente != null) {
            request.setAttribute("cliente", cliente); // Si el cliente existe, lo guarda como atributo.
            request.getRequestDispatcher(paginaNuevoEditar).forward(request, response); // Redirecciona a la página para editar el cliente.
        } else {
            request.getSession().setAttribute("error", "No se encontró el cliente con ID " + id); // Si no existe, guarda un mensaje de error en la sesión.
            response.sendRedirect("ClienteControlador?accion=listar"); // Redirecciona a la página de listar.
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Obtiene el ID del cliente a eliminar.
        int resultado = clienteDAO.eliminar(id); // Elimina el cliente de la base de datos.
        if (resultado > 0) {
            request.getSession().setAttribute("success", "Cliente con ID " + id + " eliminado!"); // Si la eliminación fue exitosa, guarda un mensaje de éxito.
        } else {
            request.getSession().setAttribute("error", "No se pudo eliminar el cliente."); // Si hubo un error, guarda un mensaje de error.
        }
        response.sendRedirect("ClienteControlador?accion=listar"); // Redirecciona a la página de listar.
    }

    private void guardar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cliente cliente = new Cliente(); // Crea un nuevo objeto Cliente.
        String idStr = request.getParameter("id"); // Obtiene el ID del cliente del formulario (si existe).
        if (idStr != null && !idStr.trim().isEmpty()) {
            cliente.setIdCliente(Integer.parseInt(idStr)); // Si hay un ID, lo establece para la edición.
        } else {
            cliente.setIdCliente(0); // Si no hay ID, se trata de un nuevo cliente.
        }
        cliente.setNombre(request.getParameter("nombre")); // Obtiene y establece el nombre del cliente.
        cliente.setApellido(request.getParameter("apellido")); // Obtiene y establece el apellido del cliente.
        cliente.setCorreo(request.getParameter("correo")); // Obtiene y establece el correo del cliente.
        cliente.setTelefono(request.getParameter("telefono")); // Obtiene y establece el teléfono del cliente.

        int resultado;
        if (cliente.getIdCliente() == 0) {
            resultado = clienteDAO.registrar(cliente); // Si el ID es 0, registra un nuevo cliente.
        } else {
            resultado = clienteDAO.editar(cliente); // Si hay un ID, edita el cliente existente.
        }

        if (resultado > 0) {
            request.getSession().setAttribute("success", "Datos del cliente guardados."); // Si la operación fue exitosa, guarda un mensaje de éxito.
            response.sendRedirect("ReservaControlador?accion=nuevaReserva"); // Redirecciona a la página de listar.
            
        } else {
            request.getSession().setAttribute("error", "No se pudieron guardar los datos del cliente."); // Si hubo un error, guarda un mensaje de error.
            request.setAttribute("cliente", cliente); // Vuelve a enviar el objeto cliente a la página.
            request.getRequestDispatcher(paginaNuevoEditar).forward(request, response); // Redirecciona a la página de nuevo/editar para mostrar el error.
        }
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Procesa las peticiones GET.
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Procesa las peticiones POST.
    }
}