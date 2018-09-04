/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAL.DALUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Danilo
 */
@WebServlet(name = "ServletUsuarioUpdate", urlPatterns = {"/ServletUsuarioUpdate"})
public class ServletUsuarioUpdate extends HttpServlet {

    
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
            throws ServletException, IOException {
       
        response.setContentType("text/html;charset=UTF-8");
           
          DALUsuario dalUsuario = new DALUsuario() ;
          
        if(request.getMethod().equals("GET"))
        {
            dalUsuario = new DALUsuario();
            dalUsuario.getUsuario().setRutusuario(Integer.parseInt(request.getParameter("id")));
            dalUsuario.getById();
            
            request.setAttribute("dalUsuario", dalUsuario);
            request.getRequestDispatcher("EditarUsuario.jsp").forward(request, response);
        }
        
        if(request.getMethod().equals("POST"))
        {
            String bloqueo = request.getParameter("txtBloqueo");
            char valor;
            
            if("F".equals(bloqueo))
            {
                valor = 'F';
            }else{
                valor = 'V';  
            }
            
            dalUsuario.getUsuario().setRutusuario(Integer.parseInt(request.getParameter("txtRut")));       
            dalUsuario.getUsuario().setCarreraIdCarrera(Integer.parseInt(request.getParameter("txtCarrera")));
            dalUsuario.getUsuario().setDvusuario(request.getParameter("txtDv"));
            dalUsuario.getUsuario().setFono(Integer.parseInt(request.getParameter("txtFono")));
            dalUsuario.getUsuario().setMailusuario(request.getParameter("txtCorreo"));
            dalUsuario.getUsuario().setMaternousuario(request.getParameter("txtApellidoM"));
            dalUsuario.getUsuario().setNomusuario(request.getParameter("txtNombre"));
            dalUsuario.getUsuario().setSedeIdSede(Integer.parseInt(request.getParameter("txtSede")));
            dalUsuario.getUsuario().setPaternousuario(request.getParameter("txtApellidoP"));
            dalUsuario.getUsuario().setLoginIdLogin(Integer.parseInt(request.getParameter("txtIdLogin")));
            dalUsuario.getUsuario().setBloqueousuario(valor);
            dalUsuario.getUsuario().setMotivobloqueo(request.getParameter("txtMotivo"));
            
            boolean retorno = dalUsuario.update();
            
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
        processRequest(request, response);
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
        processRequest(request, response);
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
