/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.NewHibernateUtil;
import Interface.InferfaceDAOcarrera;
import Entidad.Carrera;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
/**
 *
 * @author Danilo
 */

public class CarreraDAO implements InferfaceDAOcarrera {

    
     private Session session;
    
    @Override
    public boolean insert(Carrera carrera) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.save(carrera);
        tran.commit();
        session.close();
        return true;  
    }

    @Override
    public List<Carrera> getAll() throws Exception {
       session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery("From Carrera");
        List<Carrera> listaCarrera = (List<Carrera>)query.list();
        tran.commit();
        session.close();
        return listaCarrera;
    }

    @Override
    public Carrera getById(int id) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Carrera carrera = (Carrera)session.get(Carrera.class, id);
        tran.commit();
        session.close();
        return carrera;
    }

    @Override
    public boolean delete(Carrera carrera) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.delete(carrera);
        tran.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Carrera carrera) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.update(carrera);
        tran.commit();
        session.close();
        return true;
    }
   
}
