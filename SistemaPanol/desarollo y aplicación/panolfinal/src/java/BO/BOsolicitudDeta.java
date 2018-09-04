/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import DAO.SolicitudDetaDAO;
import Entidad.Detasoli;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Miguel Pasten - 12/06/2016
 */
public class BOsolicitudDeta {
    
    //Listar el detalle de la solicitud buscada.
    public List<Detasoli> listaDetalle() throws Exception {         
        try 
        { 
            DAO.SolicitudDetaDAO detaDAO = new SolicitudDetaDAO();
            return detaDAO.lista();
            
        } catch (Exception e) 
        {
            out.println("Error en BO de detalle solicitud");
            throw e;
        }                      
    }    
}
