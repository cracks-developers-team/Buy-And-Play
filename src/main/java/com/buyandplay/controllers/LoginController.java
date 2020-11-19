package com.buyandplay.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class LoginController {
    
    @RequestMapping("/Logout")
    public String logout(HttpServletRequest request,Authentication authentication){
        
        System.out.println("usuarios: " + authentication.getName());
        
        SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();    
        
        logoutHandler.logout(request, null, null);
        
        return "redirect:/formLogin";
        
    }
    
}
