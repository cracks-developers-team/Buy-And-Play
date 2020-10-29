
package com.buyandplay.controllers;

import com.buyandplay.model.Videojuego;
import com.buyandplay.services.IJuegosService;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    
    @Autowired
    private IJuegosService juegoservice;
    
    @RequestMapping("/")
    public String mostrarPrincipal(Model modelo){
        List<Videojuego> lista = juegoservice.buscarTodos();
        modelo.addAttribute("videojuegos",lista);
        System.out.println("Lista de juegos: " + lista);
        return "principal";
    }
    
}
