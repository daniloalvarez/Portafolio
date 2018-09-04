/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import DAO.CarreraDAO;
import Entidad.Carrera;
import static java.lang.System.out;
import java.util.List;


/**
 *
 * @author Danilo
 */

public class DALCarrera {

 
    private Carrera carrera;
    private List<Carrera> listaCarrera;
    private final CarreraDAO carrDAO;
    

    public DALCarrera()
    {
        carrera = new Carrera();
        carrDAO = new CarreraDAO();
    }
    
    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }

    public List<Carrera> getListaCarrera() {
        return listaCarrera;
    }

    public void setListaCarrera(List<Carrera> listaCarrera) {
        this.listaCarrera = listaCarrera;
    }

    public boolean insert()
    {
        try {
            carrDAO.insert(carrera);
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
            listaCarrera = carrDAO.getAll();
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean getById()
    {
        try {
            carrera = carrDAO.getById(carrera.getIdCarrera());
                    return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean update()
    {
        try {
            carrDAO.update(carrera);
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
            carrDAO.delete(carrera);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
}


