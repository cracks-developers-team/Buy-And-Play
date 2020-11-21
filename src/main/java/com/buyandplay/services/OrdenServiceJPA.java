package com.buyandplay.services;

import com.buyandplay.model.Orden;
import com.buyandplay.repository.OrdenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdenServiceJPA implements IOrdenService{
    
    @Autowired
    private OrdenRepository ordenRepo;

    @Override
    public void guardar(Orden orden) {
        ordenRepo.save(orden);
    }
    
}
