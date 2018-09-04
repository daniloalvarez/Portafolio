/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.NewHibernateUtil;
import Interface.InterfaceDAOtipoUsuario;
import Entidad.Tipousuario;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 *
 * @author Danilo
 */

public class TipousuarioDAO implements InterfaceDAOtipoUsuario {

     
     private Session session;
    
    @Override
    public boolean insert( Tipousuario tipoUsuario) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.save(tipoUsuario);
        tran.commit();
        session.close();
        return true;  
    }

    @Override
    public List<Tipousuario> getAll() throws Exception {
       session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery("From Tipousuario order by 2 ASC");
        List<Tipousuario> listatipoUsuario = (List<Tipousuario>)query.list();
        tran.commit();
        session.close();
        return listatipoUsuario;
    }

    @Override
    public Tipousuario getById(Integer id) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Tipousuario tipoUsuario = (Tipousuario)session.get(Tipousuario.class, id);
        tran.commit();
        session.close();
        return tipoUsuario;
    }

    @Override
    public boolean delete(Tipousuario tipoUsuario) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.delete(tipoUsuario);
        tran.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Tipousuario tipoUsuario) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.update(tipoUsuario);
        tran.commit();
        session.close();
        return true;
    }
   
    
}
