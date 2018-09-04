/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.NewHibernateUtil;
import Entidad.Login;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Danilo
 */

public class LoginDAO implements Interface.InterfaceDAOLogin {
    
 private Session session;
    
    @Override
    public boolean insert(Login login) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.save(login);
        tran.commit();
        session.close();
        return true;  
    }

    @Override
    public List<Login> getAll() throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery("From Login");
        List<Login> listaLogin = (List<Login>)query.list();
        tran.commit();
        session.close();
        return listaLogin;
      
    }
   

    @Override
    public Login getById(Integer id) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Login login = (Login)session.get(Login.class, id);
        tran.commit();
        session.close();
        return login;
    }

    @Override
    public boolean delete(Login login) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.delete(login);
        tran.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Login login) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.update(login);
        tran.commit();
        session.close();
        return true;
    }
    
}
