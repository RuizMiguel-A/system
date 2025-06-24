package com.edu.pe.modelo;

public class Usuario {
    private int idUsuario;
    private String usuario;
    private String password;
    private String nombre;
    private String apellidos;
    private String email;
    // Otros atributos que puedas necesitar

    public Usuario() {
    }

    public Usuario(int idUsuario, String usuario, String password, String nombre, String apellidos, String email) {
        this.idUsuario = idUsuario;
        this.usuario = usuario;
        this.password = password;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
    }

    // Getters y setters para todos los atributos

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Usuario{" +
               "idUsuario=" + idUsuario +
               ", usuario='" + usuario + '\'' +
               ", nombre='" + nombre + '\'' +
               ", apellidos='" + apellidos + '\'' +
               ", email='" + email + '\'' +
               '}';
    }
}