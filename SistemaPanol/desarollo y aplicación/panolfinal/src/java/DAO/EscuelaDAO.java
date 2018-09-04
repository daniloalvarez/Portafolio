/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.NewHibernateUtil;
import Interface.InterfaceDAOescuela;
import Entidad.Escuela;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 *
 * @author Danilo
 */

public class EscuelaDAO implements InterfaceDAOescuela {

   
     private Session session;
    
    @Override
    public boolean insert(Escuela escuela) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.save(escuela);
        tran.commit();
        session.close();
        return true;  
    }

    @Override
    public List<Escuela> getAll() throws Exception {
       session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery("From Escuela");
        List<Escuela> listaEscuela = (List<Escuela>)query.list();
        tran.commit();
        session.close();
        return listaEscuela;
    }

    @Override
    public Escuela getById(Integer id) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Escuela escuela = (Escuela)session.get(Escuela.class, id);
        tran.commit();
        session.close();
        return escuela;
    }

    @Override
    public boolean delete(Escuela escuela) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.delete(escuela);
        tran.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Escuela escuela) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.update(escuela);
        tran.commit();
        session.close();
        return true;
    }
    
}
