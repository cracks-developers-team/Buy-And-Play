
package com.buyandplay.util;

import java.util.LinkedList;
import java.util.List;

public class utileria {
    
    public static List<String> generarCategorias(){
        List<String> categorias = new LinkedList<>();
        categorias.add("Accion");
        categorias.add("Aventuras");
        categorias.add("Carreras");
        categorias.add("Deporte");
        return categorias;
    }
}
