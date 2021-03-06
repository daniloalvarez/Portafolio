/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAL.DALCarrera;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CARLOS.A.ROJASZ
 */
public class ServletCarreraUpdate extends HttpServlet {

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
        
        try {
            /* TODO output your page here. You may use following sample code. */
           
             
          
        if(request.getMethod().equals("GET"))
        {
            DALCarrera dalCarrera = new DALCarrera() ;
            
            dalCarrera.getCarrera().setIdCarrera(Integer.parseInt(request.getParameter("id")));
            dalCarrera.getById();
            
            request.setAttribute("dalCarrera", dalCarrera);
            request.getRequestDispatcher("EditarCarrera.jsp").forward(request, response);
        }
        
        if(request.getMethod().equals("POST"))
        {
           DALCarrera dalCarrera = new DALCarrera() ;
           
           dalCarrera.getCarrera().setIdCarrera(Integer.parseInt(request.getParameter("txtIdCarrera")));
           dalCarrera.getCarrera().setNomcarrera(request.getParameter("txtNombreCarrera"));
           
            
            boolean retorno = dalCarrera.update();
            request.getRequestDispatcher("ServletCarreraRead").forward(request, response);
        }
        }catch(Exception e)
        {
            out.print(e.getMessage()+"Error");
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
