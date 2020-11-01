
package com.buyandplay.services;

import com.buyandplay.model.Banner;
import java.util.LinkedList;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class BannerServiceImpl implements IBannerService{
    
    private List<Banner> lista = null;

    public BannerServiceImpl() {
        
        try {
            lista = new LinkedList<>();
            
            Banner banner1 = new Banner();
            banner1.setId(1);
            banner1.setTitulo("Banner uno");
            banner1.setArchivo("banner1.jpg");
            banner1.setEstatus("Inactivo");
            
            
            Banner banner2 = new Banner();
            banner2.setId(2);
            banner2.setTitulo("Banner dos");
            banner2.setArchivo("banner2.jpg");
            
            Banner banner3 = new Banner();
            banner3.setId(3);
            banner3.setTitulo("Banner tres");
            banner3.setArchivo("banner3.jpg");
            
            lista.add(banner1);
            lista.add(banner2);
            lista.add(banner3);
        } catch (Exception e) {
            System.out.println("Error en constructor: " + e.getMessage());
        }
    }
    
    

    @Override
    public void insertar(Banner banner) {
        lista.add(banner);
    }

    @Override
    public List<Banner> buscarTodos() {
        return lista;
    }
    
}
