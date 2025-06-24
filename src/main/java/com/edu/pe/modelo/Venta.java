package com.edu.pe.modelo;

import java.sql.Date;

public class Venta {
    private int idVenta;
    private Date fechaVenta;
    private double montoTotal;
    private String numeroTarjeta;
    private String fechaExpiracion;
    private String cvv;

    // Constructors
    public Venta() {
    }

    public Venta(Date fechaVenta, double montoTotal, String numeroTarjeta, String fechaExpiracion, String cvv) {
        this.fechaVenta = fechaVenta;
        this.montoTotal = montoTotal;
        this.numeroTarjeta = numeroTarjeta;
        this.fechaExpiracion = fechaExpiracion;
        this.cvv = cvv;
    }

    // Getters and Setters
    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(double montoTotal) {
        this.montoTotal = montoTotal;
    }

    public String getNumeroTarjeta() {
        return numeroTarjeta;
    }

    public void setNumeroTarjeta(String numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    public String getFechaExpiracion() {
        return fechaExpiracion;
    }

    public void setFechaExpiracion(String fechaExpiracion) {
        this.fechaExpiracion = fechaExpiracion;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }
}   