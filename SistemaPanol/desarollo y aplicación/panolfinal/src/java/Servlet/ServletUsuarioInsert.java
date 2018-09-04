/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;


import DAL.DALUsuario;
import DAO.UsuarioDAO;
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
 * @author Danilo
 */

@WebServlet(name = "ServletUsuarioInsert", urlPatterns = {"/ServletUsuarioInsert"})
public class ServletUsuarioInsert extends HttpServlet {
    
    
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
            request.getRequestDispatcher("CrearUsuario.jsp").forward(request, response);
            
        }

        if(request.getMethod().equals("POST"))
        {
            DALUsuario dalUsuario = new DALUsuario();

             int ID = 0;

             DAO.UsuarioDAO MiDao = new UsuarioDAO();
             
             for(Usuario l : MiDao.getAll())
             {
               ID = l.getLoginIdLogin();
             }
               int id= ID +2;
             
             
            dalUsuario.getUsuario().setRutusuario(Integer.parseInt(request.getParameter("txtRut")));
            dalUsuario.getUsuario().setDvusuario(request.getParameter("txtDv"));
            dalUsuario.getUsuario().setNomusuario(request.getParameter("txtNombre"));
            dalUsuario.getUsuario().setMaternousuario(request.getParameter("txtApellidoM"));
            dalUsuario.getUsuario().setPaternousuario(request.getParameter("txtApellidoP"));
            dalUsuario.getUsuario().setMailusuario(request.getParameter("txtEmail"));
            dalUsuario.getUsuario().setFono(Integer.parseInt(request.getParameter("txtFono")));
            dalUsuario.getUsuario().setSedeIdSede(Integer.parseInt(request.getParameter("txtSede")));
            dalUsuario.getUsuario().setCarreraIdCarrera(Integer.parseInt(request.getParameter("txtidCarrera")));
            dalUsuario.getUsuario().setBloqueousuario('F');
            dalUsuario.getUsuario().setMotivobloqueo("Sin Comentario");
            dalUsuario.getUsuario().setLoginIdLogin(id);
              
          
            boolean retorno = dalUsuario.insert();
            request.getRequestDispatcher("ServletUsuarioRead").forward(request, response);
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
          Logger.getLogger(ServletUsuarioInsert.class.getName()).log(Level.SEVERE, null, ex);
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
          Logger.getLogger(ServletUsuarioInsert.class.getName()).log(Level.SEVERE, null, ex);
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
