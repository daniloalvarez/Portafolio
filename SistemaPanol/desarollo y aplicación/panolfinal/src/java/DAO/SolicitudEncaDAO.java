
package DAO;


import Entidad.Encasoli;
import Conexion.NewHibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @Miguel Pasten 04-06-2016
 */
public class SolicitudEncaDAO {
  private Session sesion;
       
    //Metodo para agregar un registro a la base de datos por HQL
    public boolean Agregar(Encasoli c) throws Exception {
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
    public boolean Eliminar(Encasoli c) throws Exception {
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
    public boolean actualizar(int num, String estado) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {
            Encasoli enca = (Encasoli) sesion.createCriteria(Encasoli.class)
                    .add(Restrictions.eq("numsolicitud", num))
                    .uniqueResult(); 
            enca.setEstado(estado);
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
    public Encasoli buscar(int id) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {

            Encasoli b = (Encasoli) sesion.createCriteria(Encasoli.class)
                    .add(Restrictions.eq("numsolicitud", id))
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
    public List<Encasoli> lista() throws Exception { 
         sesion = NewHibernateUtil.getSessionFactory().openSession(); 
         sesion.beginTransaction();
         Query query = sesion.createQuery("from Encasoli order by 1 ASC");
         List<Encasoli> listaEncaSolicitud = (List<Encasoli>)query.list();
         sesion.getTransaction().commit();
         sesion.close();
         return listaEncaSolicitud;        
    }          
}
