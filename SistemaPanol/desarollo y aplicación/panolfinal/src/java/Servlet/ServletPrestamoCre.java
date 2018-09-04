/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import BO.BOprestamoDeta;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;

/**
 *
 * @author Miguel pasten
 */
@WebServlet(name = "ServletPrestamoCre", urlPatterns = {"/ServletPrestamoCre"})
public class ServletPrestamoCre extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
           try{
            /* TODO output your page here. You may use following sample code. */
            int numSolicitud = Integer.parseInt(request.getParameter("num"));
            String codProd = request.getParameter("cp");
            int codSede = Integer.parseInt(request.getParameter("cs"));
            int saldo = Integer.parseInt(request.getParameter("saldo"));
            
            BO.BOprestamoEnca pDetaBO = new BO.BOprestamoEnca();
            
    /*        int numPrestamo = pDetaBO.listadoEncaPrestamo().size() + 1; // numero de prestamo
            Date ahora = new Date();
            SimpleDateFormat fmt = new SimpleDateFormat("YYYY-MM-dd");
            
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(ahora);
            calendar.add(Calendar.DAY_OF_YEAR, 5);
            
            Date fechaInicio = ahora;
            Date fechaFin = calendar.getTime();*/
        
            int aprobador = Integer.parseInt((String) request.getAttribute("miListaSesion"));
            out.println("Usuario sesion : "+aprobador);
            
           } catch(Exception e){
               e.getMessage();
           }
            
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
