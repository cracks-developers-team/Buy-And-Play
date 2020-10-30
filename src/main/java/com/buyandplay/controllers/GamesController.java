
package com.buyandplay.controllers;

import com.buyandplay.model.Videojuego;
import com.buyandplay.services.IJuegosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    
    @RequestMapping("/create")
    public String formJuegos(){
        return "/juegos/formJuegos";
    }
    
    @PostMapping("/save")
    public String guardar(RedirectAttributes attributes,Videojuego juego,BindingResult result){
        
        if(result.hasErrors()){
            for(ObjectError error: result.getAllErrors()){
                System.out.println("Error: " + error.getDefaultMessage());
            }
            return "/juegos/formJuegos";
        }
        juegosservice.guardarJuego(juego);
        attributes.addFlashAttribute("mensaje", "Se registró correctamente");
        return "redirect:/games/indice";
    }
}
