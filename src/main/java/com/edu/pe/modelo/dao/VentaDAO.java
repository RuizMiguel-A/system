package com.edu.pe.modelo.dao;

import com.edu.pe.config.Conexion;
import com.edu.pe.modelo.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class VentaDAO {

    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    // Listar todas las ventas
    public ArrayList<Venta> listarVenta() {
        ArrayList<Venta> lista = new ArrayList<>();
        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM venta";
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta obj = new Venta();
                obj.setIdVenta(rs.getInt("id_venta"));
                obj.setFechaVenta(rs.getDate("fecha_venta"));
                obj.setMontoTotal(rs.getDouble("monto_total"));
                lista.add(obj);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (ps != null)
                    ps.close();
                if (cn != null)
                    cn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return lista;
    }

    // Registrar una nueva venta
    public int registrarVenta(Venta obj) {
        int result = 0;
        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO venta (fecha_venta, monto_total) VALUES (?,?)";
            ps = cn.prepareStatement(sql);
            ps.setDate(1, obj.getFechaVenta());
            ps.setDouble(2, obj.getMontoTotal());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null)
                    ps.close();
                if (cn != null)
                    cn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    // Editar una venta
    public int editarVenta(Venta obj) {
        int result = 0;
        try {
            cn = Conexion.getConnection();
            String sql = "UPDATE venta SET fecha_venta=?, monto_total=? WHERE id_venta=?";
            ps = cn.prepareStatement(sql);
            ps.setDate(1, obj.getFechaVenta());
            ps.setDouble(2, obj.getMontoTotal());
            ps.setInt(3, obj.getIdVenta());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null)
                    ps.close();
                if (cn != null)
                    cn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    // Eliminar una venta
    public int eliminarVenta(int id) {
        int result = 0;
        try {
            cn = Conexion.getConnection();
            String sql = "DELETE FROM venta WHERE id_venta = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null)
                    ps.close();
                if (cn != null)
                    cn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    // Buscar venta por ID
    public Venta buscarVentaPorId(int id) {
        Venta obj = null;
        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM venta WHERE id_venta = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                obj = new Venta();
                obj.setIdVenta(rs.getInt("id_venta"));
                obj.setFechaVenta(rs.getDate("fecha_venta"));
                obj.setMontoTotal(rs.getDouble("monto_total"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (ps != null)
                    ps.close();
                if (cn != null)
                    cn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return obj;
    }
}