/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import DAO.LoginDAO;
import Entidad.Login;
import java.io.Serializable;
import static java.lang.System.out;
import java.util.List;


/**
 *
 * @author Danilo
 */

public class DALLogin implements Serializable {

    private Login login;
    private List<Login> listaLogin;
    private final LoginDAO loginDAO;
    

    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }

    public List<Login> getListaLogin() {
        return listaLogin;
    }

    public void setListaLogin(List<Login> listaLogin) {
        this.listaLogin = listaLogin;
    }
    
    
   
    public DALLogin()
    {
        login = new Login();
        loginDAO = new LoginDAO();
    }
    
    public boolean insert()
    {
        try {
            loginDAO.insert(login);
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
            listaLogin = loginDAO.getAll();
            return true;
        } catch (Exception e) {
             out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean getById()
    {
        try {
       
            login = loginDAO.getById(login.getRutusuario());
            return true;
            
        } catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean update()
    {
        try {
            loginDAO.update(login);
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
            loginDAO.delete(login);
            return true;
        } catch (Exception e) 
        {
            out.println(e.getMessage());
            return false;
        }
    }
}
