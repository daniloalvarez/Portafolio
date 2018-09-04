/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.NewHibernateUtil;
import Entidad.Encapres;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Miguel Pasten
 */
public class PrestamoEncaDAO {
  private Session sesion;
       
    //Metodo para agregar un registro a la base de datos por HQL
    public boolean Agregar(Encapres en) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.save(en);
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
    public boolean Eliminar(Encapres en) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.delete(en);
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
    public boolean actualizar(int num) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {
            Encapres enca = (Encapres) sesion.createCriteria(Encapres.class)
                    .add(Restrictions.eq("idPrestamo", num))
                    .uniqueResult(); 
        //    enca.setEstado(estado);
            sesion.update(enca);
            sesion.getTransaction().commit();
            sesion.close();

            return true;

        } catch (Exception e) {
            sesion.getTransaction().rollback();
            sesion.close();
            System.err.println(e.getMessage());
            throw e;
        }
    }
         
    // Buscar un registro en la base de datos HQL
    public Encapres buscar(int id) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {

            Encapres b = (Encapres) sesion.createCriteria(Encapres.class)
                    .add(Restrictions.eq("idPrestamo", id))
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
    public List<Encapres> lista() throws Exception { 
         sesion = NewHibernateUtil.getSessionFactory().openSession(); 
         sesion.beginTransaction();
         Query query = sesion.createQuery("from Encapres order by 1 ASC");
         List<Encapres> listaEncaSolicitud = (List<Encapres>)query.list();
         sesion.getTransaction().commit();
         sesion.close();
         return listaEncaSolicitud;        
    }          
}
