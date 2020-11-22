package com.buyandplay.controllers;

import com.buyandplay.model.Orden;
import com.buyandplay.model.Usuario;
import com.buyandplay.model.Videojuego;
import com.buyandplay.services.IJuegosService;
import com.buyandplay.services.IOrdenService;
import com.buyandplay.services.IUsuariosServices;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
        setJuegoUsuario(juego.getId(),usuariosService.buscarPorUsername(authentication.getName()).getId());
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
    
    @RequestMapping("/mispedidos")
    public String misPedidos(Authentication authentication, Model modelo){
        Usuario user = usuariosService.buscarPorUsername(authentication.getName());
        List<Orden> ordenes = ordenService.buscarOrdenes(user.getId());
        List<Videojuego> juegos = juegosService.buscarTodos();
        List<Videojuego> juegosPedido = new LinkedList<>();
        for(Orden o: ordenes){
            for(Videojuego j: juegos){
                if(o.getProdid() == j.getId()){
                    juegosPedido.add(j);
                }
            }
        }
        modelo.addAttribute("juegos",juegosPedido);
        modelo.addAttribute("ordenes" , ordenes);
        return "ordenes/misPedidosLista";
    }
    
    
    @RequestMapping("/detalle/{id}")
    public String detallePedido(@PathVariable("id") int ordenid, Model modelo,Authentication authentication){
        
        Usuario usuario = usuariosService.buscarPorUsername(authentication.getName());
        Orden orden = ordenService.buscarPorId(ordenid);
        List<Videojuego> juegos = juegosService.buscarTodos();
        Videojuego juego = null;
        for(Videojuego j: juegos){
            if(j.getId() == orden.getProdid()){
                juego = j;
            }
        }
        
        modelo.addAttribute("usuario", usuario);
        modelo.addAttribute("juego", juego);
        modelo.addAttribute("orden", orden);
        
        return "ordenes/detalles";
    }
    
    public OrdenesController() {
        orden = new Orden();
    }
    
    private void setJuegoUsuario(int juego,int usuario){
        
        orden.setUsuid(usuario);
        
        orden.setProdid(juego);
    }
    
    private void setDireccionTipo(String dirrecion, String tipo){
        orden.setDireccion_entrega(dirrecion);
        orden.setTipo_pago(tipo);
    }
}
