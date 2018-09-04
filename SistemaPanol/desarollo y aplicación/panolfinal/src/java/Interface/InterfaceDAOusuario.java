/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;


import Entidad.Usuario;
import java.util.List;
/**
 *
 * @author Danilo
 */
public interface InterfaceDAOusuario {
   
     
    public boolean insert(Usuario usuario) throws Exception;
    public List<Usuario> getAll() throws Exception;
    public Usuario getById(int id) throws Exception;
    public boolean delete(Usuario usuario) throws Exception;
    public boolean update(Usuario usuario) throws Exception;   
}
