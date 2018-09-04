/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;

import Entidad.Categoria;
import java.util.List;

/**
 *
 * @author Danilo
 */
public interface InterfaceDAOcategoria {
    
    public boolean insert(Categoria categoria) throws Exception;
    public List<Categoria> getAll() throws Exception;
    public Categoria getById(int id) throws Exception;
    public boolean delete(Categoria categoria) throws Exception;
    public boolean update(Categoria categoria) throws Exception;
}
