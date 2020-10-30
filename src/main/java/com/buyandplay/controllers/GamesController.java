
package com.buyandplay.controllers;

import com.buyandplay.model.Videojuego;
import com.buyandplay.services.IJuegosService;
import com.buyandplay.util.utileria;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
    public String guardar(RedirectAttributes attributes,Videojuego juego,BindingResult result,
                        @RequestParam("archivoImagen") MultipartFile multipart,HttpServletRequest request){
        
        if(result.hasErrors()){
            for(ObjectError error: result.getAllErrors()){
                System.out.println("Error: " + error.getDefaultMessage());
            }
            return "/juegos/formJuegos";
        }
        if(!multipart.isEmpty()){
            String portada = utileria.guardarImagen(multipart, request);
            //System.out.println("Nombre de la imagen: " + portada);
            juego.setPortada(portada);
        }
        juegosservice.guardarJuego(juego);
        attributes.addFlashAttribute("mensaje", "Se registró correctamente");
        return "redirect:/games/indice";
    }
}
