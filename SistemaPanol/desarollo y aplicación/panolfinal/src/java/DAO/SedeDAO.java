/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;



import java.util.List;
import Conexion.NewHibernateUtil;
import Interface.InterfaceDAOsede;
import Entidad.Sede;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;


/**
 *
 * @author Danilo
 */
public class SedeDAO implements InterfaceDAOsede {

     private Session session;
    
    @Override
    public boolean insert(Sede sede) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.save(sede);
        tran.commit();
        session.close();
        return true;  
    }

    @Override
    public List<Sede> getAll() throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery("from Sede order by 2 ASC");
        List<Sede> listaSede = (List<Sede>)query.list();
        tran.commit();
        session.close();
        return listaSede;
    }

    @Override
    public Sede getById(int id) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Sede sede = (Sede)session.get(Sede.class, id);
        tran.commit();
        session.close();
        return sede;
    }

    @Override
    public boolean delete(Sede sede) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.delete(sede);
        tran.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Sede sede) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.update(sede);
        tran.commit();
        session.close();
        return true;
    }
    
}
