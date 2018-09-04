/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entidad.Encasoli;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "ServletSolicitudUpdate", urlPatterns = {"/ServletSolicitudUpdate"})
public class ServletSolicitudUpdate extends HttpServlet {

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
            // Se captura la informacion de la solicitud rechadaza.
            int numero = 0;
            numero = Integer.parseInt(request.getParameter("num"));
            
            String estado = "";
            estado = "R";  // Estado Rechazado
            
            BO.BOsolicitudEnca boEnca = new BO.BOsolicitudEnca();
            DAO.SolicitudEncaDAO sDAO = new DAO.SolicitudEncaDAO();
            
            for(Encasoli e: boEnca.listadoEncaSolicitud()){
                if(numero == e.getNumsolicitud()){
                    sDAO.actualizar(numero,estado); // Actualizacion de la solicitud
                }
            }
            request.getSession().setAttribute("solicitud", numero);
            request.getRequestDispatcher("ListaSolicitudDeta.jsp").forward(request, response);      
            
            
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
