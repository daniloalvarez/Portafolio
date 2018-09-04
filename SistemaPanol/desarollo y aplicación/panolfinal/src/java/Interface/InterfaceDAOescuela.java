/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;

import Entidad.Escuela;

import java.util.List;

/**
 *
 * @author Danilo
 */
public interface InterfaceDAOescuela {
 
        public boolean insert(Escuela escuela) throws Exception;
    public List<Escuela> getAll() throws Exception;
    public Escuela getById(Integer id) throws Exception;
    public boolean delete(Escuela escuela) throws Exception;
    public boolean update(Escuela escuela) throws Exception;
}


