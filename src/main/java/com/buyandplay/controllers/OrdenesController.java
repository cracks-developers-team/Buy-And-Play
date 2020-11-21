package com.buyandplay.controllers;

import com.buyandplay.model.Orden;
import com.buyandplay.model.Usuario;
import com.buyandplay.model.Videojuego;
import com.buyandplay.services.IJuegosService;
import com.buyandplay.services.IOrdenService;
import com.buyandplay.services.IUsuariosServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/orders")
public class OrdenesController {
    
    @Autowired
    private IOrdenService ordenService;
    
    private Orden orden = null;
    
    @Autowired
    private IUsuariosServices usuariosService;
    
    @Autowired
    private IJuegosService juegosService; 
    
    
    @GetMapping("/pedir")
    public String realizarPedido(@RequestParam("idjuego") int idJuego,Model modelo,Authentication authentication){
        
        Videojuego juego = juegosService.buscarPorId(idJuego);
        setJuegoUsuario(juego,usuariosService.buscarPorUsername(authentication.getName()));
        System.out.println("orden: " + orden);
        modelo.addAttribute("juego", juego);
        
        return "ordenes/formPedido";
    }
    
    @GetMapping("/confirm")
    public String confirmarPedido(@RequestParam("direccion") String direccion,@RequestParam("tipo_pago") String tipo_pago){
        
        System.out.println("Direccion: " + direccion + "\nPago: " + tipo_pago);
        setDireccionTipo(direccion, tipo_pago);
        System.out.println("Orden: " + orden);
        ordenService.guardar(orden);
        return "redirect:/";
    }
    
    public OrdenesController() {
        orden = new Orden();
    }
    
    private void setJuegoUsuario(Videojuego juego,Usuario usuario){
        
        orden.setUsu_id(usuario);
        
        orden.setProd_id(juego);
    }
    
    private void setDireccionTipo(String dirrecion, String tipo){
        orden.setDireccion_entrega(dirrecion);
        orden.setTipo_pago(tipo);
    }
}
