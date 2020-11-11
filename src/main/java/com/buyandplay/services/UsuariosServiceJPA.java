
package com.buyandplay.services;

import com.buyandplay.model.Usuario;
import com.buyandplay.repository.UsuariosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuariosServiceJPA implements IUsuariosServices{
    
    @Autowired
    private UsuariosRepository usuariosRepo;

    @Override
    public void guardar(Usuario usuario) {
        usuariosRepo.save(usuario);
    }
    
}
