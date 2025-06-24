package com.edu.pe.modelo.dao;

import com.edu.pe.config.Conexion; // Importa la clase para la conexión a la base de datos.
import com.edu.pe.modelo.Cliente; // Importa la clase Cliente (entidad).
import java.sql.Connection; // Importa la interfaz para la conexión a la base de datos.
import java.sql.PreparedStatement; // Importa la clase para ejecutar consultas preparadas.
import java.sql.ResultSet; // Importa la clase para almacenar los resultados de las consultas.
import java.util.ArrayList; // Importa la clase para crear listas dinámicas.

public class ClienteDAO {
    private Connection cn = null; // Objeto para la conexión a la base de datos. Inicializado a null.
    private PreparedStatement ps = null; // Objeto para la consulta preparada. Inicializado a null.
    private ResultSet rs = null; // Objeto para el resultado de la consulta. Inicializado a null.

    // Listar todos los clientes
    public ArrayList<Cliente> listarTodos() {
        ArrayList<Cliente> lista = new ArrayList<>(); // Crea una lista para almacenar los clientes.
        try {
            cn = Conexion.getConnection(); // Obtiene una conexión a la base de datos.
            String sql = "SELECT * FROM cliente"; // Define la consulta SQL para seleccionar todos los clientes.
            ps = cn.prepareStatement(sql); // Prepara la consulta SQL.
            rs = ps.executeQuery(); // Ejecuta la consulta y obtiene el resultado.
            while (rs.next()) { // Itera sobre cada fila del resultado.
                Cliente obj = new Cliente(); // Crea un nuevo objeto Cliente.
                obj.setIdCliente(rs.getInt("id_cliente")); // Obtiene y establece el ID del cliente.
                obj.setNombre(rs.getString("nombre")); // Obtiene y establece el nombre del cliente.
                obj.setApellido(rs.getString("apellido")); // Obtiene y establece el apellido del cliente.
                obj.setCorreo(rs.getString("correo")); // Obtiene y establece el correo del cliente.
                obj.setTelefono(rs.getString("telefono")); // Obtiene y establece el teléfono del cliente.
                lista.add(obj); // Agrega el objeto Cliente a la lista.
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // Imprime cualquier error que ocurra.
        } finally {
            try {
                if (rs != null) rs.close(); // Cierra el ResultSet si está abierto.
                if (ps != null) ps.close(); // Cierra el PreparedStatement si está abierto.
                if (cn != null) cn.close(); // Cierra la Connection si está abierta.
            } catch (Exception ex) {
                ex.printStackTrace(); // Imprime cualquier error al cerrar la conexión.
            }
        }
        return lista; // Retorna la lista de todos los clientes.
    }

    // Registrar un nuevo cliente
    public int registrar(Cliente obj) {
        int result = 0; // Variable para almacenar el resultado de la operación (0: fallo, >0: éxito).
        try {
            cn = Conexion.getConnection(); // Obtiene una conexión a la base de datos.
            String sql = "INSERT INTO cliente (nombre, apellido, correo, telefono) VALUES (?,?,?,?)"; // Define la consulta SQL para insertar un nuevo cliente.
            ps = cn.prepareStatement(sql); // Prepara la consulta SQL con marcadores de posición.
            ps.setString(1, obj.getNombre()); // Establece el valor del primer marcador con el nombre del cliente.
            ps.setString(2, obj.getApellido()); // Establece el valor del segundo marcador con el apellido del cliente.
            ps.setString(3, obj.getCorreo()); // Establece el valor del tercer marcador con el correo del cliente.
            ps.setString(4, obj.getTelefono()); // Establece el valor del cuarto marcador con el teléfono del cliente.
            result = ps.executeUpdate(); // Ejecuta la consulta de inserción y obtiene el número de filas afectadas.
        } catch (Exception ex) {
            ex.printStackTrace(); // Imprime cualquier error que ocurra.
        } finally {
            try {
                if (ps != null) ps.close(); // Cierra el PreparedStatement si está abierto.
                if (cn != null) cn.close(); // Cierra la Connection si está abierta.
            } catch (Exception ex) {
                ex.printStackTrace(); // Imprime cualquier error al cerrar la conexión.
            }
        }
        return result; // Retorna el resultado de la operación de registro.
    }

    // Editar un cliente
    public int editar(Cliente obj) {
        int result = 0; // Variable para almacenar el resultado de la operación.
        try {
            cn = Conexion.getConnection(); // Obtiene una conexión a la base de datos.
            String sql = "UPDATE cliente SET nombre=?, apellido=?, correo=?, telefono=? WHERE id_cliente=?"; // Define la consulta SQL para actualizar un cliente.
            ps = cn.prepareStatement(sql); // Prepara la consulta SQL.
            ps.setString(1, obj.getNombre()); // Establece el nuevo nombre.
            ps.setString(2, obj.getApellido()); // Establece el nuevo apellido.
            ps.setString(3, obj.getCorreo()); // Establece el nuevo correo.
            ps.setString(4, obj.getTelefono()); // Establece el nuevo teléfono.
            ps.setInt(5, obj.getIdCliente()); // Establece la condición WHERE con el ID del cliente a editar.
            result = ps.executeUpdate(); // Ejecuta la consulta de actualización.
        } catch (Exception ex) {
            ex.printStackTrace(); // Imprime cualquier error.
        } finally {
            try {
                if (ps != null) ps.close(); // Cierra el PreparedStatement.
                if (cn != null) cn.close(); // Cierra la Connection.
            } catch (Exception ex) {
                ex.printStackTrace(); // Imprime cualquier error al cerrar la conexión.
            }
        }
        return result; // Retorna el resultado de la operación de edición.
    }

    // Eliminar un cliente
    public int eliminar(int id) {
        int result = 0; // Variable para almacenar el resultado de la eliminación.
        try {
            cn = Conexion.getConnection(); // Obtiene la conexión.
            String sql = "DELETE FROM cliente WHERE id_cliente = ?"; // Define la consulta para eliminar por ID.
            ps = cn.prepareStatement(sql); // Prepara la consulta.
            ps.setInt(1, id); // Establece el ID del cliente a eliminar.
            result = ps.executeUpdate(); // Ejecuta la eliminación.
        } catch (Exception ex) {
            ex.printStackTrace(); // Imprime errores.
        } finally {
            try {
                if (ps != null) ps.close(); // Cierra el PreparedStatement.
                if (cn != null) cn.close(); // Cierra la Connection.
            } catch (Exception ex) {
                ex.printStackTrace(); // Imprime errores al cerrar.
            }
        }
        return result; // Retorna el resultado de la eliminación.
    }

    // Buscar cliente por ID
    public Cliente buscarPorId(int id) {
        Cliente obj = null; // Inicializa el objeto Cliente a null.
        try {
            cn = Conexion.getConnection(); // Obtiene la conexión.
            String sql = "SELECT * FROM cliente WHERE id_cliente = ?"; // Consulta para seleccionar por ID.
            ps = cn.prepareStatement(sql); // Prepara la consulta.
            ps.setInt(1, id); // Establece el ID a buscar.
            rs = ps.executeQuery(); // Ejecuta la consulta y obtiene el resultado.
            if (rs.next()) { // Si se encuentra un cliente con ese ID.
                obj = new Cliente(); // Crea un nuevo objeto Cliente.
                obj.setIdCliente(rs.getInt("id_cliente")); // Establece el ID.
                obj.setNombre(rs.getString("nombre")); // Establece el nombre.
                obj.setApellido(rs.getString("apellido")); // Establece el apellido.
                obj.setCorreo(rs.getString("correo")); // Establece el correo.
                obj.setTelefono(rs.getString("telefono")); // Establece el teléfono.
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // Imprime errores.
        } finally {
            try {
                if (rs != null) rs.close(); // Cierra el ResultSet.
                if (ps != null) ps.close(); // Cierra el PreparedStatement.
                if (cn != null) cn.close(); // Cierra la Connection.
            } catch (Exception ex) {
                ex.printStackTrace(); // Imprime errores al cerrar.
            }
        }
        return obj; // Retorna el objeto Cliente encontrado (o null si no se encuentra).
    }
}