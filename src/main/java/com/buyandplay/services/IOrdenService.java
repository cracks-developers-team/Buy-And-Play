package com.buyandplay.services;

import com.buyandplay.model.Orden;
import com.buyandplay.repository.OrdenRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

public interface IOrdenService {
    
    void guardar(Orden orden);
    
    List<Orden> buscarOrdenes(int usuid);
    
    Orden buscarPorId(int idorden);
    
}
