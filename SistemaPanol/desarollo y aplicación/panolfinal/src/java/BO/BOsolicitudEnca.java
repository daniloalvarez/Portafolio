/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import Entidad.Encasoli;
import static java.lang.System.out;
import java.util.List;

/**
 *
 * @Miguel Pasten 04-06-2016
 */
public class BOsolicitudEnca {
    
    //Listar todas los datos del encabezado de Solicitud
    public List<Encasoli> listadoEncaSolicitud() throws Exception {
        try 
        { 
            DAO.SolicitudEncaDAO encaSolDAO = new DAO.SolicitudEncaDAO();
            return encaSolDAO.lista();
            
        } catch (Exception e) 
        {
            out.println("Error en BO de Encabezado de Solicitud");
            throw e;
        }                      
    }  
}