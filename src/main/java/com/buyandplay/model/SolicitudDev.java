package com.buyandplay.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "solicitudDev")
public class SolicitudDev {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int sol_id;
    
    private String sol_desc;
    
    private String sol_evidencia;
    
    private String estatus = "Pendiente";
    
    private int idOrden;

    public int getSol_id() {
        return sol_id;
    }

    public void setSol_id(int sol_id) {
        this.sol_id = sol_id;
    }

    public String getSol_desc() {
        return sol_desc;
    }

    public void setSol_desc(String sol_desc) {
        this.sol_desc = sol_desc;
    }

    public String getSol_evidencia() {
        return sol_evidencia;
    }

    public void setSol_evidencia(String sol_evidencia) {
        this.sol_evidencia = sol_evidencia;
    }

    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    @Override
    public String toString() {
        return "SolicitudDev{" + "sol_id=" + sol_id + ", sol_desc=" + sol_desc + ", sol_evidencia=" + sol_evidencia + ", estatus=" + estatus + ", idOrden=" + idOrden + '}';
    }

    

    
    
    
}
