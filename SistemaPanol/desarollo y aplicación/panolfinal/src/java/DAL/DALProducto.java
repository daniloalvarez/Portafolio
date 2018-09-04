/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import DAO.ProductoDAO;
import Entidad.Producto;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Danilo
 */

public class DALProducto {

   
    private Producto producto;
    private List<Producto> listaProducto;
    private final ProductoDAO produDAO;
    

    public DALProducto()
    {
        producto = new Producto();
        produDAO = new ProductoDAO();
    }
    
    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public List<Producto> getListaProducto() {
        return listaProducto;
    }

    public void setListaProducto(List<Producto> listaProducto) {
        this.listaProducto = listaProducto;
    }
    
    
   
    public boolean insert()
    {
        try {
            produDAO.insert(producto);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean getAll()
    {
        try {
            listaProducto = produDAO.getAll();
            return true;
        } catch (Exception e) {
             out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean getById()
    {
        try {
       
            producto = produDAO.getById(producto.getCodproducto());
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean update()
    {
        try {
            produDAO.update(producto);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean delete()
    {
        try {
            produDAO.delete(producto);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean buscar(String codProducto)
    {
        try {
            produDAO.buscar(codProducto);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }           
}
 

