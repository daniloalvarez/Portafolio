/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;

import java.util.List;
import Entidad.Tipousuario;

/**
 *
 * @author Danilo
 */
public interface InterfaceDAOtipoUsuario {
    
    public boolean insert(Tipousuario tipoUsuario) throws Exception;
    public List<Tipousuario> getAll() throws Exception;
    public Tipousuario getById(Integer id) throws Exception;
    public boolean delete(Tipousuario tipoUsuario) throws Exception;
    public boolean update(Tipousuario tipoUsuario) throws Exception;
}
