/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import DAO.EscuelaDAO;
import Entidad.Escuela;
import static java.lang.System.out;
import java.util.List;



/**
 *
 * @author Danilo
 */

public class DALEscuela  {
    
    private Escuela escuela;
    private List<Escuela> listaEscuela;
    private final EscuelaDAO escuDAO;
    

    public DALEscuela()
    {
        escuela = new Escuela();
        escuDAO = new EscuelaDAO();
    }
    
    public Escuela getEscuela() {
        return escuela;
    }

    public void setEscuela(Escuela escuela) {
        this.escuela = escuela;
    }

    public List<Escuela> getListaEscuela() {
        return listaEscuela;
    }

    public void setListaEscuela(List<Escuela> listaEscuela) {
        this.listaEscuela = listaEscuela;
    }

    public boolean insert()
    {
        try {
            escuDAO.insert(escuela);
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
            listaEscuela = escuDAO.getAll();
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean getById()
    {
        try {
            escuela = escuDAO.getById(escuela.getIdEscuela());
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean update()
    {
        try {
            escuDAO.update(escuela);
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
            escuDAO.delete(escuela);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
}


