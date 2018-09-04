/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entidad.Sede;
import Entidad.Stock;
import Conexion.NewHibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Miguel Pasten 11-06-2016
 */
public class StockDAO {

    private Session sesion;

    //Metodo para agregar un registro a la base de datos por HQL
    public boolean Agregar(Stock c) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {
            sesion.save(c);
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

    // Metodo para eliminacion de registro HQL
    public boolean Eliminar(Stock c) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {
            sesion.delete(c);
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

    // Actualizar registro en la base de datos HQL
    public boolean actualizar(int id, String producto, int saldoStock, int minStock, int maxStock, int sede) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {
            Stock stock = (Stock) sesion.createCriteria(Stock.class)
                    .add(Restrictions.eq("idStock", id))
                    .uniqueResult();
            stock.setProductoCodproducto(producto); 
            stock.setSaldostock(saldoStock);
            stock.setMinstock(minStock);
            stock.setMaxstock(maxStock);
            stock.setProductoSedeIdSede(sede);            
            sesion.update(stock);
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
    public Stock buscar(String codigo) throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try {

            Stock b = (Stock) sesion.createCriteria(Stock.class)
                    .add(Restrictions.eq("productoCodproducto", codigo))
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
    public List<Stock> lista() throws Exception {
        sesion = NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        Query query = sesion.createQuery("from Stock");
        List<Stock> listaStock = (List<Stock>) query.list();
        sesion.getTransaction().commit();
        sesion.close();
        return listaStock;
    }
}
