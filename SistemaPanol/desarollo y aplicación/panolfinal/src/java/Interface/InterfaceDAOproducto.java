/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;

import Entidad.Producto;
import java.util.List;

/**
 *
 * @author Danilo
 */
public interface InterfaceDAOproducto {
   
       public boolean insert(Producto producto) throws Exception;
    public List<Producto> getAll() throws Exception;
    public Producto getById(String id) throws Exception;
    public boolean delete(Producto producto) throws Exception;
    public boolean update(Producto producto) throws Exception;
}


