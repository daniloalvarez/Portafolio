/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;

import Entidad.Login;
import java.util.List;

/**
 *
 * @author Danilo
 */
public interface InterfaceDAOLogin {
     
    public boolean insert(Login login) throws Exception;
    public List<Login> getAll() throws Exception;
    public Login getById(Integer id) throws Exception;
    public boolean delete(Login login) throws Exception;
    public boolean update(Login login) throws Exception;
    
}
