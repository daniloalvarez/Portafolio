/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import Entidad.Usuario;
import static java.lang.System.out;
import java.util.List;

/**
 *
 * @author Miguel Pasten
 */
public class BOusuario {
    //Listar todas los datos del encabezado de Solicitud
    public List<Usuario> listadoUsuario() throws Exception {
        try 
        { 
            DAO.UsuarioDAO usuarioDAO = new DAO.UsuarioDAO();
            return usuarioDAO.getAll();
            
        } catch (Exception e) 
        {
            out.println("Error en BO del listado de Usuario");
            throw e;
        }                      
    } 
}
