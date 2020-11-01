package com.buyandplay.controllers;

import com.buyandplay.model.Banner;
import com.buyandplay.services.IBannerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String guardarBanner(){
        return "redirect:/banners/index";
    }
    
}
