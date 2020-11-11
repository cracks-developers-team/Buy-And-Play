package com.buyandplay.controllers;

import com.buyandplay.model.Usuario;
import com.buyandplay.services.IUsuariosServices;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/users")
public class UsuariosController {
    
    @Autowired
    private IUsuariosServices usuariosService;
    
    @RequestMapping("/signin")
    public String registrar(@ModelAttribute Usuario usuario, Model modelo){
        modelo.addAttribute("usuario", usuario);
        return "registro/formRegistroUsers";
    }
    
    @PostMapping("/save")
    public String guarda(@ModelAttribute Usuario usuario,BindingResult result,RedirectAttributes redirect){
        if(result.hasErrors()){
            for(ObjectError error: result.getAllErrors()){
                System.out.println("Error:" + error.getDefaultMessage());
                return "registro/formRegistroUsers";
            }
        }
        System.out.println(usuario.toString());
        usuariosService.guardar(usuario);
        redirect.addFlashAttribute("mensaje", "Se registro correctamente");
        return "redirect:/users/signin";
    }
    
    @InitBinder
    public void initFecha(WebDataBinder binder) {
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(formato, false));
    }
}
