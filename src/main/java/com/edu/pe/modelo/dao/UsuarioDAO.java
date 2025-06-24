package com.edu.pe.modelo.dao;

import com.edu.pe.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {

    private final String SELECT_USUARIO_POR_CREDenciales = "SELECT id_usuario, usuario, password, nombre, apellidos, email FROM usuarios WHERE usuario = ? AND password = ?";
    // Asegúrate de que los nombres de las columnas coincidan con tu base de datos

    public Usuario autenticar(String usuario, String password) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Usuario user = null;

        try {
       
            preparedStatement = connection.prepareStatement(SELECT_USUARIO_POR_CREDenciales);
            preparedStatement.setString(1, usuario);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = new Usuario();
                user.setIdUsuario(resultSet.getInt("id_usuario"));
                user.setUsuario(resultSet.getString("usuario"));
                user.setPassword(resultSet.getString("password"));
                user.setNombre(resultSet.getString("nombre"));
                user.setApellidos(resultSet.getString("apellidos"));
                user.setEmail(resultSet.getString("email"));
            }

        } catch (SQLException e) {
            System.err.println("Error al autenticar usuario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
        return user;
    }

    // Puedes agregar otros métodos para buscar usuarios por ID, etc.
}