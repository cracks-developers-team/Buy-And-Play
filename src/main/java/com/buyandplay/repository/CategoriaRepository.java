package com.buyandplay.repository;

import com.buyandplay.model.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoriaRepository extends JpaRepository<Categoria, Integer>{
    
}
