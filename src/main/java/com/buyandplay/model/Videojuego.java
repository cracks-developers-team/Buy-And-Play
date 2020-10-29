
package com.buyandplay.model;

public class Videojuego {
    
    private int id;
    private String titulo;
    private String descripcion;
    private String categoria;
    private int lanzamiento;
    private int idconsola = 1;
    private double precio;
    private int stock = 10;
    private double calificacion;
    private int unidadesVendidas = 10;
    private String portada;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getLanzamiento() {
        return lanzamiento;
    }

    public void setLanzamiento(int lanzamiento) {
        this.lanzamiento = lanzamiento;
    }

    public int getIdconsola() {
        return idconsola;
    }

    public void setIdconsola(int idconsola) {
        this.idconsola = idconsola;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(double calificacion) {
        this.calificacion = calificacion;
    }

    public int getUnidadesVendidas() {
        return unidadesVendidas;
    }

    public void setUnidadesVendidas(int unidadesVendidas) {
        this.unidadesVendidas = unidadesVendidas;
    }

    public String getPortada() {
        return portada;
    }

    public void setPortada(String portada) {
        this.portada = portada;
    }

    @Override
    public String toString() {
        return "Videojuego{" + "id=" + id + ", titulo=" + titulo + ", descripcion=" + descripcion + ", categoria=" + categoria + ", lanzamiento=" + lanzamiento + ", idconsola=" + idconsola + ", precio=" + precio + ", stock=" + stock + ", calidicacion=" + calificacion + ", unidadesVendidas=" + unidadesVendidas + ", portada=" + portada + '}';
    }

    
    
    
    
    
}
