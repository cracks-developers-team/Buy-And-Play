package com.buyandplay.services;

import com.buyandplay.model.Videojuego;
import java.util.LinkedList;
import java.util.List;
import org.springframework.stereotype.Service;

//@Service
public class JuegosServiceImpl implements IJuegosService {

    private List<Videojuego> lista = null;

    public JuegosServiceImpl() {

        try {
            lista = new LinkedList<>();
            
            Videojuego juego1 = new Videojuego();
            juego1.setId(1);
            juego1.setTitulo("Battlefield 1");
            //juego1.setId_categoria(1);
            juego1.setPrecio(800.99);
            juego1.setPortada("portada1.jpg");
            juego1.setLanzamiento(2015);
            juego1.setStock(0);

            Videojuego juego2 = new Videojuego();
            juego2.setId(2);
            juego2.setTitulo("God of war");
            //juego2.setId_categoria(1);
            juego2.setPrecio(1200);
            juego2.setPortada("portada2.jpeg");
            juego2.setLanzamiento(2018);

            Videojuego juego3 = new Videojuego();
            juego3.setId(3);
            juego3.setTitulo("Destiny");
            //juego3.setId_categoria(1);
            juego3.setPrecio(1100);
            juego3.setPortada("portada3.jpg");
            juego3.setLanzamiento(2020);

            Videojuego juego4 = new Videojuego();
            juego4.setId(4);
            juego4.setTitulo("Nier Automata");
            //juego4.setId_categoria(1);
            juego4.setPrecio(800);
            juego4.setPortada("portada4.jpg");
            juego4.setLanzamiento(2019);

            lista.add(juego1);
            lista.add(juego2);
            lista.add(juego3);
            lista.add(juego4);

        } catch (Exception e) {
            System.out.println("Error:" + e.getMessage());
        }
    }

    public List<Videojuego> buscarTodos() {
        return lista;
    }

    @Override
    public Videojuego buscarPorId(int juegoId){
        for (Videojuego juego : lista) {
            if (juego.getId() == juegoId) {
                return juego;
            }
        }
        return null;
    }

    @Override
    public void guardarJuego(Videojuego juego) {
        lista.add(juego);
        System.out.println("Lista de juegos:" + lista);
    }
}
