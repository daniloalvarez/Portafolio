/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;


import DAO.TipousuarioDAO;
import Entidad.Tipousuario;
import static java.lang.System.out;
import java.util.List;



/**
 *
 * @author Danilo
 */

public class DALTipousuario {
    
  
    private Tipousuario tipousuario;
    private List<Tipousuario> listaTipo;
    private final TipousuarioDAO tipoDAO;
    

    public DALTipousuario()
    {
        tipousuario = new Tipousuario();
        tipoDAO = new TipousuarioDAO();
    }
    
    public Tipousuario getTipousuario() {
        return tipousuario;
    }

    public void setEscuela(Tipousuario tipousuario) {
        this.tipousuario = tipousuario;
    }

    public List<Tipousuario> getListaEscuela() {
        return listaTipo;
    }

    public void setListaTipousuario(List<Tipousuario> listaTipo) {
        this.listaTipo = listaTipo;
    }

    public boolean insert()
    {
        try {
            tipoDAO.insert(tipousuario);
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
            listaTipo = tipoDAO.getAll();
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean getById()
    {
        try {
            tipousuario = tipoDAO.getById(tipousuario.getIdTipousuario());
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean update()
    {
        try {
            tipoDAO.update(tipousuario);
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
            tipoDAO.delete(tipousuario);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
}


