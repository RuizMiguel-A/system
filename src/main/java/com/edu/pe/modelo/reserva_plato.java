package com.edu.pe.modelo;

public class reserva_plato {
    private int id_reserva;
    private int id_plato;
    private int cantidad;
    private String comentario;

    public int getIdReserva() {
        return id_reserva;
    }

    public void setIdReserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }

    public int getIdPlato() {
        return id_plato;
    }

    public void setIdPlato(int id_plato) {
        this.id_plato = id_plato;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}