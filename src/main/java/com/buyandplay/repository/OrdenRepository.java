package com.buyandplay.repository;

import com.buyandplay.model.Orden;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrdenRepository extends JpaRepository<Orden, Integer>{
    
    List<Orden> findByUsuid(int usuid);
    
    /*@Query("select o from ordenes o where o.usu_id = ?1")
    List<Orden> buscarPorUsuid(int usuid);*/
}
