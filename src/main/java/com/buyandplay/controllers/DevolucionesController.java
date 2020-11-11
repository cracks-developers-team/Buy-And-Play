package com.buyandplay.controllers;

import com.buyandplay.model.SolicitudDev;
import com.buyandplay.services.IDevolucionService;
import com.buyandplay.util.utileria;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/refund")
public class DevolucionesController {
    
    @Autowired
    private IDevolucionService devolucionesService;
    
    @RequestMapping("/list")
    public String mostrarLista(Model modelo){
        //modelo.addAttribute("devoluciones", devolucionesService.buscarTodas());
        modelo.addAttribute("devoluciones", devolucionesService.buscarPendientes("Pendiente"));
        return "/devoluciones/listaDevolucion";
    }
    
    @RequestMapping("/solicitud")
    public String solicitar(@ModelAttribute SolicitudDev solicitud,Model modelo){
        modelo.addAttribute("solicitud", solicitud);
        return "/devoluciones/formDevolucion";
        
    }
    
    @PostMapping("/send")
    public String enviarSolicitud(@ModelAttribute SolicitudDev solicitud,RedirectAttributes redirect,
            @RequestParam("archivoImagen") MultipartFile multipart,HttpServletRequest request,BindingResult result){
        if(result.hasErrors()){
            for(ObjectError error: result.getAllErrors()){
                System.out.println("Error: " + error.getDefaultMessage());
            }
        }
        if(!multipart.isEmpty()){
            String evidencia = utileria.guardarImagen(multipart, request);
            solicitud.setSol_evidencia(evidencia);
        }
        
        redirect.addFlashAttribute("mensaje", "Se ha enviado la solicitud, espere la respuesta");
        devolucionesService.guardar(solicitud);
        return "redirect:/refund/solicitud";
        
    }
}
