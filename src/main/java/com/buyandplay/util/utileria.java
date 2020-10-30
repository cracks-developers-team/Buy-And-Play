
package com.buyandplay.util;

import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

public class utileria {
    
    public static List<String> generarCategorias(){
        List<String> categorias = new LinkedList<>();
        categorias.add("Accion");
        categorias.add("Aventuras");
        categorias.add("Carreras");
        categorias.add("Deporte");
        return categorias;
    }
    
    public static String guardarImagen(MultipartFile multipart, HttpServletRequest request){
        String nombreImagen = multipart.getOriginalFilename();
        
        nombreImagen = nombreImagen.replace(" ", "-");
        
        String ruta = request.getServletContext().getRealPath("/resources/images/");
        
        try {
            File imagen = new File( ruta + nombreImagen);
            
            multipart.transferTo(imagen);
            return nombreImagen;
        } catch (IOException e) {
            System.out.println("Error al guardar imagen: " + e.getMessage());
            return null;
        }
    }
}
