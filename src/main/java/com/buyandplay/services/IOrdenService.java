package com.buyandplay.services;

import com.buyandplay.model.Orden;
import com.buyandplay.repository.OrdenRepository;
import org.springframework.beans.factory.annotation.Autowired;

public interface IOrdenService {
    
    void guardar(Orden orden);
    
}
