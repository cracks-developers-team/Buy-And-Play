package com.buyandplay.repository;

import com.buyandplay.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuariosRepository extends JpaRepository<Usuario, Usuario>{
    
    Usuario findByUsername(String username);
    
}
