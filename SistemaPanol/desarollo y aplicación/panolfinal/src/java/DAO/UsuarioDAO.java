/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import Entidad.Usuario;
import java.util.List;
import Conexion.NewHibernateUtil;
import Interface.InterfaceDAOusuario;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;


/**
 *
 * @author Danilo
 */
public class UsuarioDAO implements InterfaceDAOusuario {

     private Session session;
    
    @Override
    public boolean insert(Usuario usuario) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.save(usuario);
        tran.commit();
        session.close();
        return true;  
    }

    @Override
    public List<Usuario> getAll() throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery("From Usuario order by 1 ASC");
        List<Usuario> listaUsuario = (List<Usuario>)query.list();
        tran.commit();
        session.close();
        return listaUsuario;
      
    }
   

    @Override
    public Usuario getById(int id) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Usuario usuario = (Usuario)session.get(Usuario.class, id);
        tran.commit();
        session.close();
        return usuario;
    }

    @Override
    public boolean delete(Usuario usuario) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.delete(usuario);
        tran.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Usuario usuario) throws Exception {
        session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        session.update(usuario);
        tran.commit();
        session.close();
        return true;
    }
    
}
