package com.edu.pe.modelo.dao;

import com.edu.pe.config.Conexion;
import com.edu.pe.modelo.Menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {

    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<Menu> listarMenu() {  // Cambiado el nombre del método a listarMenu
        List<Menu> lista = new ArrayList<>();
        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM menu";
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Menu plato = new Menu();
                plato.setIdMenu(rs.getInt("id_menu"));
                plato.setNombrePlato(rs.getString("nombre_plato"));
                plato.setDescripcion(rs.getString("descripcion"));
                plato.setPrecio(rs.getDouble("precio"));
                plato.setCategoria(rs.getString("categoria"));
                lista.add(plato);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }
        return lista;
    }
    public void resetMenu() {
        try {
            cn = Conexion.getConnection();
            String sql = "DELETE FROM menu"; // Elimina todos los registros de la tabla menu
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Opcionalmente, puedes lanzar una excepción personalizada o loguear el error
        } finally {
            cerrarConexiones();
        }
    }

    public int registrar(Menu plato) {
        int resultado = 0;
        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO menu (nombre_plato, descripcion, precio, categoria) VALUES (?, ?, ?, ?)";
            ps = cn.prepareStatement(sql);
            ps.setString(1, plato.getNombrePlato());
            ps.setString(2, plato.getDescripcion());
            ps.setDouble(3, plato.getPrecio());
            ps.setString(4, plato.getCategoria());
            resultado = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }
        return resultado;
    }

    public Menu buscarPlatoPorId(int id) {
        Menu plato = null;
        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM menu WHERE id_menu = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                plato = new Menu();
                plato.setIdMenu(rs.getInt("id_menu"));
                plato.setNombrePlato(rs.getString("nombre_plato"));
                plato.setDescripcion(rs.getString("descripcion"));
                plato.setPrecio(rs.getDouble("precio"));
                plato.setCategoria(rs.getString("categoria"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }
        return plato;
    }

    public int editar(Menu plato) {
        int resultado = 0;
        try {
            cn = Conexion.getConnection();
            String sql = "UPDATE menu SET nombre_plato=?, descripcion=?, precio=?, categoria=? WHERE id_menu=?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, plato.getNombrePlato());
            ps.setString(2, plato.getDescripcion());
            ps.setDouble(3, plato.getPrecio());
            ps.setString(4, plato.getCategoria());
            ps.setInt(5, plato.getIdMenu());
            resultado = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }
        return resultado;
    }

    public int eliminarPlato(int id) {
        int resultado = 0;
        try {
            cn = Conexion.getConnection();
            String sql = "DELETE FROM menu WHERE id_menu=?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            resultado = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }
        return resultado;
    }

    private void cerrarConexiones() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}