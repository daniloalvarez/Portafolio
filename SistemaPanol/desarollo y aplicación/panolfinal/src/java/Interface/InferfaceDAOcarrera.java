/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;

import Entidad.Carrera;
import java.util.List;

/**
 *
 * @author Danilo
 */
public interface InferfaceDAOcarrera {
    
    public boolean insert(Carrera carrera) throws Exception;
    public List<Carrera> getAll() throws Exception;
    public Carrera getById(int id) throws Exception;
    public boolean delete(Carrera carrera) throws Exception;
    public boolean update(Carrera carrera) throws Exception;
}

