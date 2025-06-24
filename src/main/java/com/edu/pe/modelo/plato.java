package com.edu.pe.modelo;

public class plato {
    private int id_plato;
    private String nombre;
    private String descripcion;
    private double precio;
    private int id_menu;

    public int getIdPlato() {
        return id_plato;
    }

    public void setIdPlato(int id_plato) {
        this.id_plato = id_plato;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getIdMenu() {
        return id_menu;
    }

    public void setIdMenu(int id_menu) {
        this.id_menu = id_menu;
    }
}