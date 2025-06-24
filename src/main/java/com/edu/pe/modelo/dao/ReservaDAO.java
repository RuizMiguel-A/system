package com.edu.pe.modelo.dao;

import com.edu.pe.config.Conexion;
import com.edu.pe.modelo.Reserva;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAO {

    public List<Reserva> listarReserva() throws SQLException {
        List<Reserva> lista = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT * FROM reserva";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Reserva reserva = new Reserva();
                reserva.setIdReserva(rs.getInt("id_reserva"));
                reserva.setFecha(rs.getString("fecha"));
                reserva.setHora(rs.getString("hora"));
                reserva.setCantidadPersonas(rs.getInt("cantidad_personas"));
                reserva.setUbicacion(rs.getString("ubicacion"));
                reserva.setIdCliente(rs.getInt("id_cliente"));
                reserva.setNumeroMesa(rs.getInt("numero_mesa")); // Changed
                lista.add(reserva);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos(conn, ps, rs);
        }
        return lista;
    }

    public int registrarReserva(Reserva reserva) throws SQLException {
        int filasAfectadas = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.getConnection();
            String sql = "INSERT INTO reserva (fecha, hora, cantidad_personas, ubicacion, id_cliente, numero_mesa) VALUES (?, ?, ?, ?, ?, ?)"; // Changed
            ps = conn.prepareStatement(sql);
            ps.setString(1, reserva.getFecha());
            ps.setString(2, reserva.getHora());
            ps.setInt(3, reserva.getCantidadPersonas());
            ps.setString(4, reserva.getUbicacion());
            ps.setInt(5, reserva.getIdCliente());
            ps.setInt(6, reserva.getNumeroMesa()); // Changed

            filasAfectadas = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos(conn, ps, null);
        }
        return filasAfectadas;
    }

    public int editarReserva(Reserva reserva) throws SQLException {
        int filasAfectadas = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.getConnection();
            String sql = "UPDATE reserva SET fecha = ?, hora = ?, cantidad_personas = ?, ubicacion = ?, id_cliente = ?, numero_mesa = ? WHERE id_reserva = ?"; // Changed
            ps = conn.prepareStatement(sql);
            ps.setString(1, reserva.getFecha());
            ps.setString(2, reserva.getHora());
            ps.setInt(3, reserva.getCantidadPersonas());
            ps.setString(4, reserva.getUbicacion());
            ps.setInt(5, reserva.getIdCliente());
            ps.setInt(6, reserva.getNumeroMesa()); // Changed
            ps.setInt(7, reserva.getIdReserva());

            filasAfectadas = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos(conn, ps, null);
        }
        return filasAfectadas;
    }

    public int eliminarReserva(int id) throws SQLException {
        int filasAfectadas = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.getConnection();
            String sql = "DELETE FROM reserva WHERE id_reserva = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            filasAfectadas = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos(conn, ps, null);
        }
        return filasAfectadas;
    }

    public Reserva buscarReservaPorId(int id) throws SQLException {
        Reserva reserva = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT * FROM reserva WHERE id_reserva = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                reserva = new Reserva();
                reserva.setIdReserva(rs.getInt("id_reserva"));
                reserva.setFecha(rs.getString("fecha"));
                reserva.setHora(rs.getString("hora"));
                reserva.setCantidadPersonas(rs.getInt("cantidad_personas"));
                reserva.setUbicacion(rs.getString("ubicacion"));
                reserva.setIdCliente(rs.getInt("id_cliente"));
                reserva.setNumeroMesa(rs.getInt("numero_mesa")); // Changed
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos(conn, ps, rs);
        }
        return reserva;
    }

    private void cerrarRecursos(Connection conn, PreparedStatement ps, ResultSet rs) throws SQLException {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
}