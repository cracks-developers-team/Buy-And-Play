package com.buyandplay.services;

import com.buyandplay.model.Usuario;


public interface IUsuariosServices {
  
    void guardar(Usuario usuario);
    
    Usuario buscarPorUsername(String username);
}
