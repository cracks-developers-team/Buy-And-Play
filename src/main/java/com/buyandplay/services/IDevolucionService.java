package com.buyandplay.services;

import com.buyandplay.model.SolicitudDev;
import java.util.List;


public interface IDevolucionService {

    void guardar(SolicitudDev devolucion);
    
    SolicitudDev buscarPorId(int idDevolucion);
    
    List<SolicitudDev> buscarTodas();
    
    List<SolicitudDev> buscarPendientes(String estatus);
}
