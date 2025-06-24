package com.edu.pe.modelo;

public class mesa {
    private int id_mesa;
    private int numero_mesa;
    private int capacidad;
    private String ubicacion;
    private boolean disponible;

    public int getIdMesa() {
        return id_mesa;
    }

    public void setIdMesa(int id_mesa) {
        this.id_mesa = id_mesa;
    }

    public int getNumeroMesa() {
        return numero_mesa;
    }

    public void setNumeroMesa(int numero_mesa) {
        this.numero_mesa = numero_mesa;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }
}