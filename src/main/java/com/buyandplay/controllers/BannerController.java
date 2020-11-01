package com.buyandplay.controllers;

import com.buyandplay.model.Banner;
import com.buyandplay.services.IBannerService;
import com.buyandplay.util.utileria;
import java.util.List;
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
@RequestMapping("/banners")
public class BannerController {
    
    @Autowired
    private IBannerService bannerservice; 
    
    List<Banner> lista;
    
    @GetMapping("/index")
    public String listaBanners(Model modelo){
        lista = bannerservice.buscarTodos();
        modelo.addAttribute("banners", lista);
        return "banners/listBanner";
    }
    
    @RequestMapping("/create")
    public String crearBanner(){
        return "/banners/formBanners";
    }
    
    @PostMapping("/save")
    public String guardarBanner(Banner banner,BindingResult result,
            @RequestParam("archivoImagen") MultipartFile multipart,HttpServletRequest request, RedirectAttributes attributes){
        
        if(result.hasErrors()){
            for(ObjectError error: result.getAllErrors()){
                System.out.println("Error:" + error.getDefaultMessage());
            }
            return "banners/formBanners";
        }
        if(!multipart.isEmpty()){
            String nombreBanner = utileria.guardarImagen(multipart, request);
            banner.setArchivo(nombreBanner);
        }
        bannerservice.insertar(banner);
        attributes.addFlashAttribute("mensaje", "Se registró correctamente");
     
        return "redirect:/banners/index";
    }
    
}
