/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import DAO.PrestamoDetaDAO;
import Entidad.Detapres;
import static java.lang.System.out;
import java.util.List;

/**
 *
 * @author Miguel Pasten - 12/06/2016
 */
public class BOprestamoDeta {
    
    //Listar el detalle de la solicitud buscada.
    public List<Detapres> listaDetallePrestamo() throws Exception {         
        try 
        { 
            DAO.PrestamoDetaDAO detaPresDAO = new PrestamoDetaDAO();
            return detaPresDAO.lista();
            
        } catch (Exception e) 
        {
            out.println("Error en BO de detalle de Prestamo");
            throw e;
        }                      
    }    
}
