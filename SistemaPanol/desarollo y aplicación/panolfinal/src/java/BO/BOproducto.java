/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import Entidad.Producto;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Miguel Pasten - 12/06/2016
 */
public class BOproducto {
    //Listar todas los datos del encabezado de Solicitud
    public List<Producto> listaProductoFiltro() throws Exception {
        
        ArrayList listaNueva = new ArrayList();
        
        try 
        { 
            DAO.ProductoDAO prodDAO = new DAO.ProductoDAO();
            
            for(Producto p : prodDAO.getAll()){
                if(p.getEstado().equals('V')){
                    listaNueva.add(p);
                }
            }
            return listaNueva;
            
        } catch (Exception e) 
        {
            out.println("Error en BO Filtro de Producto Stock");
            throw e;
        }                      
    }   
    
    //Listar todas los datos de Productos sin filtro de su estado
    public List<Producto> listaProducto() throws Exception {
             
        try 
        { 
            DAO.ProductoDAO prodDAO = new DAO.ProductoDAO();
            return prodDAO.getAll();
            
        } catch (Exception e) 
        {
            out.println("Error en BO Lista Productos");
            throw e;
        }                      
    }         
}
