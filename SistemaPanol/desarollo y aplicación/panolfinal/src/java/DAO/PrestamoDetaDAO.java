/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.NewHibernateUtil;
import Entidad.Detapres;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Miguel Pasten
 */
public class PrestamoDetaDAO {
private Session sesion;
       
    //Metodo para agregar un registro a la base de datos por HQL
    public boolean Agregar(Detapres pre) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.save(pre);
            sesion.getTransaction().commit();
            sesion.close();
            return true;
        } catch (Exception e){
            sesion.getTransaction().rollback();
            sesion.close();
            System.err.println(e.getMessage());
            throw e;
        }
    }
    
    // Metodo para eliminacion de registro HQL
    public boolean Eliminar(Detapres pre) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.delete(pre);
            sesion.getTransaction().commit();
            sesion.close();
            return true;
        } catch (Exception e){
            sesion.getTransaction().rollback();
            sesion.close();
            System.err.println(e.getMessage());
            throw e;
        }
    }
     
    // Actualizar registro en la base de datos HQL
    public boolean actualizar (Detapres pre) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.getTransaction();
        try {
            sesion.update(pre);
            sesion.getTransaction().commit();
            sesion.close();          
            return true;            
        } catch (Exception e){
            sesion.getTransaction().rollback();
            sesion.close();
            System.err.println(e.getMessage());
            throw e;
        }
    }
         
    // Buscar un registro en la base de datos HQL
    public Detapres buscar(int id) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {

            Detapres b = (Detapres) sesion.createCriteria(Detapres.class)
                    .add(Restrictions.eq("idsolicitud", id))
                    .uniqueResult();
            
            sesion.getTransaction().commit();            
            sesion.close();                      
            return b;               
          } catch (Exception e) {
              sesion.getTransaction().rollback();
              sesion.close();
              System.err.println(e.getMessage());
              throw e;
            }
    }  
          
    // Listar todos los registros de la base de datos consulta HQL
    public List<Detapres> lista() throws Exception { 
         sesion = NewHibernateUtil.getSessionFactory().openSession(); 
         sesion.beginTransaction();
         Query query = sesion.createQuery("from Detapres order by 1 ASC");
         List<Detapres> listaDetaSolicitud = (List<Detapres>)query.list();
         sesion.getTransaction().commit();
         sesion.close();
         return listaDetaSolicitud;        
    }          
}

