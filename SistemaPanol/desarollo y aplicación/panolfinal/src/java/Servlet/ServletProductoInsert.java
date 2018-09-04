/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAL.DALProducto;
import java.io.IOException;
import static java.lang.System.out;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Usuario
 */
@WebServlet(name = "ServletProductoInsert", urlPatterns = {"/ServletProductoInsert"})
public class ServletProductoInsert extends HttpServlet {

    
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
            request.getRequestDispatcher("CrearProducto.jsp").forward(request, response);
            
        }

        if(request.getMethod().equals("POST"))
        {
            DALProducto dalProducto = new DALProducto();
            
            String estado = request.getParameter("rbtEstado");
            char es;
            
            if("F".equals(estado))
            {
                es ='F';
            }else{
                es ='V';
            }
             Date fecha = Calendar.getInstance().getTime();
             
           dalProducto.getProducto().setCodproducto(request.getParameter("txtCodProducto"));
           dalProducto.getProducto().setComentario(request.getParameter("txtComentario"));
           dalProducto.getProducto().setNomproducto(request.getParameter("txtNombre"));
           dalProducto.getProducto().setPrecio(Integer.parseInt(request.getParameter("txtPrecio")));
           dalProducto.getProducto().setEstado(es);
           dalProducto.getProducto().setIdSede(Integer.parseInt(request.getParameter("txtSede")));
           dalProducto.getProducto().setIdCategoria(Integer.parseInt(request.getParameter("txtidCategoria")));
        // dalProducto.getProducto().setImagen(BLOB.getEmptyBLOB("txtImagen"));
           dalProducto.getProducto().setFechaingreso(fecha);
           dalProducto.getProducto().setCodproducto(request.getParameter("txtCodProducto"));
          
           boolean retorno = dalProducto.insert();
                                              
           request.getRequestDispatcher("ServletProductoRead").forward(request, response);
         ;
        }
     
    }catch (Exception e)
    {
      out.print(e.getMessage()+"Error al Guardar datos");
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
