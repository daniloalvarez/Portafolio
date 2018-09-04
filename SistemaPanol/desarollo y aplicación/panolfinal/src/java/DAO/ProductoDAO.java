/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.NewHibernateUtil;
import Interface.InterfaceDAOproducto;
import Entidad.Producto;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


/**
 *
 * @author Danilo
 */

public class ProductoDAO implements InterfaceDAOproducto {
   
     private Session session;
    
    @Override
    public boolean insert(Producto producto) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.save(producto);
        tran.commit();
        session.close();
        return true;  
    }

    @Override
    public List<Producto> getAll() throws Exception {
       session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery("from Producto order by 3 ASC");
        List<Producto> listaProducto = (List<Producto>)query.list();
        tran.commit();
        session.close();
        return listaProducto;
    }

    @Override
    public Producto getById(String id) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Producto producto = (Producto)session.get(Producto.class, id);
        tran.commit();
        session.close();
        return producto;
    }

    @Override
    public boolean delete(Producto producto) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.delete(producto);
        tran.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Producto producto) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.update(producto);
        tran.commit();
        session.close();
        return true;
    }
   
  
    // Buscar un registro en la base de datos HQL
    public boolean buscar(String codigo) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {

            Producto p = (Producto) session.createCriteria(Producto.class)
                    .add(Restrictions.eq("codproducto", codigo))
                    .uniqueResult();
            
            session.getTransaction().commit();            
            session.close();                      
            return true;  
             
          } catch (Exception e) {
              session.getTransaction().rollback();
              session.close();
              System.err.println(e.getMessage());
              throw e;
            }
    }     
    
    
}
