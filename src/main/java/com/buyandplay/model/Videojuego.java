
package com.buyandplay.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "productos")
public class Videojuego {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String titulo;
    private String desarrollador;
    private String descripcion;
    
    @OneToOne
    @JoinColumn(name = "id_categoria")
    private Categoria categoria;
    
    private int lanzamiento;
    private int id_consola = 1;
    private String portada = "portada1.jpg";
    private double precio;
    private int stock = 10;
    private double calificacion;
    private int uni_vendidas;
    private String url;

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

    public String getDesarrollador() {
        return desarrollador;
    }

    public void setDesarrollador(String desarrollador) {
        this.desarrollador = desarrollador;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    

    public int getLanzamiento() {
        return lanzamiento;
    }

    public void setLanzamiento(int lanzamiento) {
        this.lanzamiento = lanzamiento;
    }

    public int getId_consola() {
        return id_consola;
    }

    public void setId_consola(int id_consola) {
        this.id_consola = id_consola;
    }

    public String getPortada() {
        return portada;
    }

    public void setPortada(String portada) {
        this.portada = portada;
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

    public int getUni_vendidas() {
        return uni_vendidas;
    }

    public void setUni_vendidas(int uni_vendidas) {
        this.uni_vendidas = uni_vendidas;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Videojuego{" + "id=" + id + ", titulo=" + titulo + ", desarrollador=" + desarrollador + ", descripcion=" + descripcion + ", categoria=" + categoria + ", lanzamiento=" + lanzamiento + ", id_consola=" + id_consola + ", portada=" + portada + ", precio=" + precio + ", stock=" + stock + ", calificacion=" + calificacion + ", uni_vendidas=" + uni_vendidas + ", url=" + url + '}';
    }

    

    
}
