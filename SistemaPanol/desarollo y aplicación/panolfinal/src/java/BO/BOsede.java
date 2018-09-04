/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import Entidad.Sede;
import static java.lang.System.out;
import java.util.List;

/**
 *
 * @author Miguel Pasten
 */
public class BOsede {
    //Listar todas los datos del encabezado de Solicitud
    public List<Sede> listadoSede() throws Exception {
        try 
        { 
            DAO.SedeDAO sedeDAO = new DAO.SedeDAO();
            return sedeDAO.getAll();
            
        } catch (Exception e) 
        {
            out.println("Error en BO del listado de Sede");
            throw e;
        }                      
    }     
}
