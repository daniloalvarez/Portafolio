/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import DAO.SedeDAO;
import Entidad.Sede;
import static java.lang.System.out;
import java.util.List;


/**
 *
 * @author Danilo
 */

public class DALSede  {

    private Sede sede;
    private List<Sede> listaSede;
    private final SedeDAO SedDAO;
    

    public Sede getSede() {
        return sede;
    }

    public void setSede(Sede sede) {
        this.sede = sede;
    }

    public List<Sede> getListaSede() {
        return listaSede;
    }

    public void setListaSede(List<Sede> listaSede) {
        this.listaSede = listaSede;
    }

  
    public DALSede()
    {
        sede = new Sede();
        SedDAO = new SedeDAO();
    }
    
    public boolean insert()
    {
        try {
            SedDAO.insert(sede);
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
            listaSede = SedDAO.getAll();
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean getById()
    {
        try {
            sede = SedDAO.getById(sede.getIdSede());
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean update()
    {
        try {
            SedDAO.update(sede);
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
            SedDAO.delete(sede);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public List<Sede> listadoSede() throws Exception {
        try 
        { 
            DAO.SedeDAO sedeDAO = new DAO.SedeDAO();
            return sedeDAO.getAll();
            
        } catch (Exception e) 
        {
            out.println("Error en BO de Sede");
            throw e;
        }                      
    }     
    
    
}

