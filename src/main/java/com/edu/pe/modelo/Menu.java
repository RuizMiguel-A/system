package com.edu.pe.modelo;

public class Menu {
    private int idMenu;
    private String nombrePlato;
    private String descripcion;
    private double precio;
    private String categoria;
    private int cantidad; // ¡Nuevo atributo para la cantidad!

    public Menu() {
    }

    public Menu(int idMenu, String nombrePlato, String descripcion, double precio, String categoria) {
        this.idMenu = idMenu;
        this.nombrePlato = nombrePlato;
        this.descripcion = descripcion;
        this.precio = precio;
        this.categoria = categoria;
        this.cantidad = 0; // Inicializar cantidad por defecto a 0 o 1 según tu lógica inicial
    }

    // Constructor adicional que incluye la cantidad, útil para crear objetos Menu directamente con cantidad
    public Menu(int idMenu, String nombrePlato, String descripcion, double precio, String categoria, int cantidad) {
        this.idMenu = idMenu;
        this.nombrePlato = nombrePlato;
        this.descripcion = descripcion;
        this.precio = precio;
        this.categoria = categoria;
        this.cantidad = cantidad;
    }

    // Getters y Setters
    public int getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    public String getNombrePlato() {
        return nombrePlato;
    }

    public void setNombrePlato(String nombrePlato) {
        this.nombrePlato = nombrePlato;
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

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    // ¡Nuevo Getter para la cantidad!
    public int getCantidad() {
        return cantidad;
    }

    // ¡Nuevo Setter para la cantidad!
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}