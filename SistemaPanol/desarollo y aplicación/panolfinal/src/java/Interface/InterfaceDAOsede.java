/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;


import Entidad.Sede;
import java.util.List;

/**
 *
 * @author Danilo
 */

public interface InterfaceDAOsede {
   
     
    public boolean insert(Sede sede) throws Exception;
    public List<Sede> getAll() throws Exception;
    public Sede getById(int id) throws Exception;
    public boolean delete(Sede sede) throws Exception;
    public boolean update(Sede sede) throws Exception;
}
