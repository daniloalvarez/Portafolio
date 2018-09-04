/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.NewHibernateUtil;
import Interface.InterfaceDAOcategoria;
import Entidad.Categoria;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Danilo
 */

public class CategoriaDAO implements InterfaceDAOcategoria {

     private Session session;
    
    @Override
    public boolean insert(Categoria categoria) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.save(categoria);
        tran.commit();
        session.close();
        return true;  
    }

    @Override
    public List<Categoria> getAll() throws Exception {
       session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery("From Categoria order by 1 ASC");
        List<Categoria> listaCategoria = (List<Categoria>)query.list();
        tran.commit();
        session.close();
        return listaCategoria;
    }

    @Override
    public Categoria getById(int id) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Categoria categoria = (Categoria)session.get(Categoria.class, id);
        tran.commit();
        session.close();
        return categoria;
    }

    @Override
    public boolean delete(Categoria categoria) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.delete(categoria);
        tran.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Categoria categoria) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.update(categoria);
        tran.commit();
        session.close();
        return true;
    }
   
    
}
