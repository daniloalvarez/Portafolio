/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import DAO.UsuarioDAO;
import Entidad.Usuario;
import static java.lang.System.out;
import java.util.List;


/**
 *
 * @author Danilo
 */

public class DALUsuario  {

    private Usuario usuario;
    private List<Usuario> listaUsuario;
    private final UsuarioDAO usuaDAO;
    

    public DALUsuario()
    {
        usuario = new Usuario();
        usuaDAO = new UsuarioDAO();
    }
    
    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Usuario> getListaUsuario() {
        return listaUsuario;
    }

    public void setListaUsuario(List<Usuario> listaUsuario) {
        this.listaUsuario = listaUsuario;
    }
    
    
   
    public boolean insert()
    {
        try {
            usuaDAO.insert(usuario);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage()+ "Error de Coneccion");
            return false;
        }
    }
    
    public boolean getAll()
    {
        try {
            listaUsuario = usuaDAO.getAll();
            return true;
        } catch (Exception e) {
             out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean getById()
    {
        try {
       
            usuario = usuaDAO.getById(usuario.getRutusuario());
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean update()
    {
        try {
            usuaDAO.update(usuario);
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
            usuaDAO.delete(usuario);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
}
