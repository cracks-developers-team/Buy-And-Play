package com.buyandplay.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ordenes")
public class Orden {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    //@ManyToOne
    //@JoinColumn(name = "usu_id")
    @Column(name = "usu_id")
    private int usuid;
    
    //@OneToOne
    //@JoinColumn(name = "prod_id")
    @Column(name = "prod_id")
    private int prodid;
    
    private int cantidad = 1;
    
    private String direccion_entrega;
    
    private String tipo_pago;
    
    private Date fecha_pago = new Date();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuid() {
        return usuid;
    }

    public void setUsuid(int usuid) {
        this.usuid = usuid;
    }

    public int getProdid() {
        return prodid;
    }

    public void setProdid(int prodid) {
        this.prodid = prodid;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getDireccion_entrega() {
        return direccion_entrega;
    }

    public void setDireccion_entrega(String direccion_entrega) {
        this.direccion_entrega = direccion_entrega;
    }

    public String getTipo_pago() {
        return tipo_pago;
    }

    public void setTipo_pago(String tipo_pago) {
        this.tipo_pago = tipo_pago;
    }

    public Date getFecha_pago() {
        return fecha_pago;
    }

    public void setFecha_pago(Date fecha_pago) {
        this.fecha_pago = fecha_pago;
    }

    @Override
    public String toString() {
        return "Orden{" + "id=" + id + ", usu_id=" + usuid + ", prod_id=" + prodid + ", cantidad=" + cantidad + ", direccion_entrega=" + direccion_entrega + ", tipo_pago=" + tipo_pago + ", fecha_pago=" + fecha_pago + '}';
    }
    
    
    
}
