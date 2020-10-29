
package com.buyandplay.controllers;

import com.buyandplay.services.IJuegosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/games")
public class GamesController {
    
    @Autowired
    IJuegosService juegosservice;
    
    @RequestMapping("/indice")
    public String listarJuegos(Model modelo){
        modelo.addAttribute("juegos", juegosservice.buscarTodos());
        return "/juegos/listaJuegos";
    }
    
}
