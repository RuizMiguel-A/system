package com.edu.pe.modelo;

public class Reserva {

    private int idReserva;
    private String fecha;
    private String hora;
    private int cantidadPersonas;
    private String ubicacion;
    private int idCliente;
    private int numeroMesa; // Changed from idMesa

    public Reserva() {
    }

    public Reserva(int idReserva, String fecha, String hora, int cantidadPersonas, String ubicacion, int idCliente, int numeroMesa) {
        this.idReserva = idReserva;
        this.fecha = fecha;
        this.hora = hora;
        this.cantidadPersonas = cantidadPersonas;
        this.ubicacion = ubicacion;
        this.idCliente = idCliente;
        this.numeroMesa = numeroMesa;
    }

    // Getters and Setters

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public int getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(int cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getNumeroMesa() {
        return numeroMesa;
    }

    public void setNumeroMesa(int numeroMesa) {
        this.numeroMesa = numeroMesa;
    }

    @Override
    public String toString() {
        return "Reserva{" +
                "idReserva=" + idReserva +
                ", fecha='" + fecha + '\'' +
                ", hora='" + hora + '\'' +
                ", cantidadPersonas=" + cantidadPersonas +
                ", ubicacion='" + ubicacion + '\'' +
                ", idCliente=" + idCliente +
                ", numeroMesa=" + numeroMesa +
                '}';
    }
}