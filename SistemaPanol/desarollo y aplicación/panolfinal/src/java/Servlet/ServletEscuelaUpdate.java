/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAL.DALEscuela;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CARLOS.A.ROJASZ
 */
public class ServletEscuelaUpdate extends HttpServlet {

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
             
        if(request.getMethod().equals("GET"))
        {
            DALEscuela dalEscuela = new DALEscuela() ;
            
            dalEscuela.getEscuela().setIdEscuela(Integer.parseInt(request.getParameter("id")));
            dalEscuela.getById();
            
            request.setAttribute("dalEscuela", dalEscuela);
            request.getRequestDispatcher("EditarEscuela.jsp").forward(request, response);
        }
        
        if(request.getMethod().equals("POST"))
        {
           DALEscuela dalEscuela = new DALEscuela() ;
           
           dalEscuela.getEscuela().setIdEscuela(Integer.parseInt(request.getParameter("txtIdEscuela")));
           dalEscuela.getEscuela().setNomescuela(request.getParameter("txtNombreEscuela"));
            
            boolean retorno = dalEscuela.update();
            request.getRequestDispatcher("ServletEscuelaRead").forward(request, response);
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
