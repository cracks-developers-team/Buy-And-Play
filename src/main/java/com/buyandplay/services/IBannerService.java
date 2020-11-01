package com.buyandplay.services;

import com.buyandplay.model.Banner;
import java.util.List;

public interface IBannerService {
    
    void insertar (Banner banner);
    
    List<Banner> buscarTodos();
}
