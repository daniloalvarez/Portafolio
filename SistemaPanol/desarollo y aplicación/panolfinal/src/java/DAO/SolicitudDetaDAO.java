/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.NewHibernateUtil;
import Entidad.Detasoli;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Miguel Pasten 26-06-2016
 */
public class SolicitudDetaDAO {
private Session sesion;
       
    //Metodo para agregar un registro a la base de datos por HQL
    public boolean Agregar(Detasoli c) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.save(c);
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
    public boolean Eliminar(Detasoli c) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.delete(c);
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
    public boolean actualizar (Detasoli c) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.getTransaction();
        try {
            sesion.update(c);
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
    public Detasoli buscar(int id) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {

            Detasoli b = (Detasoli) sesion.createCriteria(Detasoli.class)
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
    public List<Detasoli> lista() throws Exception { 
         sesion = NewHibernateUtil.getSessionFactory().openSession(); 
         sesion.beginTransaction();
         Query query = sesion.createQuery("from Detasoli order by 1 ASC");
         List<Detasoli> listaDetaSolicitud = (List<Detasoli>)query.list();
         sesion.getTransaction().commit();
         sesion.close();
         return listaDetaSolicitud;        
    }          
}
