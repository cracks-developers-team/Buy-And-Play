package com.buyandplay.services;

import com.buyandplay.model.Videojuego;
import com.buyandplay.repository.VideojuegoRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JuegosServiceJPA implements IJuegosService{
    
    @Autowired
    private VideojuegoRepository juegoRepo;

    @Override
    public List<Videojuego> buscarTodos() {
        return juegoRepo.findAll();
    }

    @Override
    public Videojuego buscarPorId(int juegoId) {
        Optional<Videojuego> juego = juegoRepo.findById(juegoId);
        return juego.get();
    }

    @Override
    public void guardarJuego(Videojuego juego) {
        juegoRepo.save(juego);
    }
    
}
