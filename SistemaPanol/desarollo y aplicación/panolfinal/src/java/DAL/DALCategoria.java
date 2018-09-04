/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;


import DAO.CategoriaDAO;
import Entidad.Categoria;
import static java.lang.System.out;
import java.util.List;



/**
 *
 * @author Danilo
 */

public class DALCategoria  {

    private Categoria categoria;
    private List<Categoria> listaCategoria;
    private final CategoriaDAO cateDAO;
    

    public DALCategoria()
    {
        categoria = new Categoria();
        cateDAO = new CategoriaDAO();
    }
    
    public Categoria getCategoria() {
        return categoria;
    }

    public void setBodega(Categoria categoria) {
        this.categoria = categoria;
    }

    public List<Categoria> getListaCategoria() {
        return listaCategoria;
    }

    public void setListaCategoria(List<Categoria> listaCategoria) {
        this.listaCategoria = listaCategoria;
    }

    public boolean insert()
    {
        try {
            cateDAO.insert(categoria);
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
            listaCategoria = cateDAO.getAll();
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean getById()
    {
        try {
            categoria = cateDAO.getById(categoria.getIdCategoria());
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean update()
    {
        try {
            cateDAO.update(categoria);
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
            cateDAO.delete(categoria);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
}


