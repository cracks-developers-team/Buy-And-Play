package com.buyandplay.services;

import com.buyandplay.model.Videojuego;
import java.util.LinkedList;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class JuegosServiceImpl implements IJuegosService{
    
    List<Videojuego> lista;
    
    public JuegosServiceImpl(){
        lista = new LinkedList<>();
        
        try{
            Videojuego juego1 = new Videojuego();
            juego1.setId(1);
            juego1.setTitulo("Battlefield 1");
            juego1.setCategoria("Accion");
            juego1.setPrecio(800.99);
            juego1.setPortada("portada1.jpg");
            
            
            Videojuego juego2 = new Videojuego();
            juego2.setId(2);
            juego2.setTitulo("God of war");
            juego2.setCategoria("Guerra");
            juego2.setPrecio(1200);
            juego2.setPortada("portada2.jpeg");
            
            Videojuego juego3 = new Videojuego();
            juego3.setId(3);
            juego3.setTitulo("Destiny");
            juego3.setCategoria("Fantasia");
            juego3.setPrecio(1100);
            juego3.setPortada("portada3.jpg");
            
            Videojuego juego4 = new Videojuego();
            juego4.setId(4);
            juego4.setTitulo("Nier Automata");
            juego4.setCategoria("Fantasia");
            juego4.setPrecio(800);
            juego4.setPortada("portada4.jpg");
            
            lista.add(juego1);
            lista.add(juego2);
            lista.add(juego3);
            lista.add(juego4);            
            
        }catch(Exception e){
            System.out.println("Error:" + e.getMessage());
        }
    }
    
    public List<Videojuego> buscarTodos(){
        return lista;
    }
}