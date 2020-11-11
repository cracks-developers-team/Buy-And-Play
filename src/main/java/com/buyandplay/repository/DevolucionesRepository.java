package com.buyandplay.repository;

import com.buyandplay.model.SolicitudDev;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DevolucionesRepository extends JpaRepository<SolicitudDev, Integer>{
    
    List<SolicitudDev> findByEstatus(String estatus);
}
