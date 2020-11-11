package com.buyandplay.services;

import com.buyandplay.model.SolicitudDev;
import com.buyandplay.repository.DevolucionesRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DevolucionServiceJPA implements IDevolucionService{
    
    @Autowired
    private DevolucionesRepository devolucionesRepo;

    @Override
    public void guardar(SolicitudDev devolucion) {
        devolucionesRepo.save(devolucion);
    }

    @Override
    public SolicitudDev buscarPorId(int idDevolucion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<SolicitudDev> buscarTodas() {
        return devolucionesRepo.findAll();
    }

    @Override
    public List<SolicitudDev> buscarPendientes(String estatus) {
        return devolucionesRepo.findByEstatus(estatus);
    }
    
}
