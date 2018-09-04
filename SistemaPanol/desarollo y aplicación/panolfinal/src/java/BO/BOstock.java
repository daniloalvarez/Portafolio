/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import Entidad.Stock;
import static java.lang.System.out;
import java.util.List;

/**
 *
 * @author Miguel Pasten 11-06-2016
 */
public class BOstock {
    //Listar todas los datos del encabezado de Solicitud
    public List<Stock> listadoStock() throws Exception {
        try 
        { 
            DAO.StockDAO stockDAO = new DAO.StockDAO();
            return stockDAO.lista();
            
        } catch (Exception e) 
        {
            out.println("Error en BO de Stock");
            throw e;
        }                      
    }
    
  
    
    
    
    
}