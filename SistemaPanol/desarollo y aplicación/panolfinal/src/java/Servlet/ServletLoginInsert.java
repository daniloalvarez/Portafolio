/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAL.DALLogin;
import DAO.LoginDAO;
import DAO.UsuarioDAO;
import Entidad.Login;
import Entidad.Usuario;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */

@WebServlet(name = "ServletLoginInsert", urlPatterns = {"/ServletLoginInsert"})
public class ServletLoginInsert extends HttpServlet {

   
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
       
        response.setContentType("text/html;charset=UTF-8");
        
       
      if(request.getMethod().equals("GET"))
        {
            request.getRequestDispatcher("CrearLogin.jsp").forward(request, response);
        }
        
        if(request.getMethod().equals("POST"))
        {
            int ID = 0;
            
            int rut = Integer.parseInt(request.getParameter("txtRut"));
            
                    
             DALLogin dalLogin = new DALLogin();
             
             DAO.UsuarioDAO MiDao = new UsuarioDAO();
             
             for(Usuario l : MiDao.getAll())
             { 
                 if(l.getRutusuario() == rut)
                 {
                    ID = l.getLoginIdLogin();
                 }
             }
              
             
             
          
            dalLogin.getLogin().setRutusuario(rut);
            dalLogin.getLogin().setClave(request.getParameter("txtPassword"));
            dalLogin.getLogin().setIdLogin(ID);
            dalLogin.getLogin().setIdTipousuario(Integer.parseInt(request.getParameter("txtidTipoUsuario")));

            boolean retorno = dalLogin.insert();
            request.getRequestDispatcher("ListaLogin.jsp").forward(request, response);
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
           processRequest(request, response);
       } catch (Exception ex) {
           Logger.getLogger(ServletLoginInsert.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
           processRequest(request, response);
       } catch (Exception ex) {
           Logger.getLogger(ServletLoginInsert.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
