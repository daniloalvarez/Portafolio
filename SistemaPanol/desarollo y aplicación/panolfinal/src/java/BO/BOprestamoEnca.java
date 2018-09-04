/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import Entidad.Encapres;
import static java.lang.System.out;
import java.util.List;

/**
 *
 * @Miguel Pasten 04-06-2016
 */
public class BOprestamoEnca {
    
    //Listar todas los datos del encabezado de Solicitud
    public List<Encapres> listadoEncaPrestamo() throws Exception {
        try 
        { 
            DAO.PrestamoEncaDAO encaPreDAO = new DAO.PrestamoEncaDAO();
            return encaPreDAO.lista();
            
        } catch (Exception e) 
        {
            out.println("Error en BO de Encabezado de Prestamo");
            throw e;
        }                      
    }  
}