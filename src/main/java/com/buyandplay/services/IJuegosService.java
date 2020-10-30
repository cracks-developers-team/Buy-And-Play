
package com.buyandplay.services;

import com.buyandplay.model.Videojuego;
import java.util.List;

public interface IJuegosService {
    List<Videojuego> buscarTodos();
    
    Videojuego buscarPorId(int juegoId);
    
    void guardarJuego(Videojuego juego);
}
