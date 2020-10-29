package com.buyandplay.controllers;

import com.buyandplay.model.Videojuego;
import com.buyandplay.services.IJuegosService;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private IJuegosService juegoservice;

    @RequestMapping("/")
    public String mostrarPrincipal(Model modelo) {
        List<Videojuego> lista = juegoservice.buscarTodos();
        modelo.addAttribute("videojuegos", lista);
        System.out.println("Lista de juegos: " + lista);
        return "principal";
    }

    @GetMapping("/detalle")
    public String mostrarDetalles(@RequestParam("idJuego") int idJuego, Model modelo) {

        System.out.println("El ide del juego es: " + idJuego);
        try {            
        modelo.addAttribute("juego",juegoservice.buscarPorId(idJuego));

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return "viewDetalle";
    }

}
