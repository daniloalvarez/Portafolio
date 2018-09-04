/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entidad.Detasoli;
import Entidad.Encasoli;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Miguel Pasten 26-05-2016
 */
@WebServlet(name = "ServletSolicitudCre", urlPatterns = {"/ServletSolicitudCre"})
public class ServletSolicitudCre extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            try {
                DAO.SolicitudEncaDAO encaDAO = new DAO.SolicitudEncaDAO();
                Encasoli enca = new Encasoli();

                // Formateador de fecha
                SimpleDateFormat fmtFecha = new SimpleDateFormat("dd/MM/yyyy");

                // Inicializa variable de fecha.
                Date fecha = new Date();

                // Se establece la variable de sesion.
                HttpSession sesion = request.getSession();

                // Se traspasa lo obtenido en sesion para capturar el rut logueado
                int rut = 0;
                rut = Integer.parseInt(String.valueOf(sesion.getAttribute("miListaSesion")));

                // Obtiene los datos del registro seleccionado
                String es = "";

                // El valor por default del estado inicialmente es activo "P" Pendiente
                    es = "P";

                // Obtiene lo ingresado en el comentario luego de estar habilitado.
                String comentario = "";
                comentario = request.getParameter("txtComentario");
 
                if(comentario == null){
                    comentario = "";
                }

                // Asignar correlativo para la solicitud a partir de la cantidad de registros totales.
                int numeroEnca = 0;
                numeroEnca = encaDAO.lista().size() + 1;
                // Se enviar registros obtenidos a los SETTERS del encaSolicitud.
                enca.setFechasolicitud(fecha); 
                enca.setUsuarioRutusuario(rut);
                enca.setEstado(es);
                enca.setComentario(comentario);    
                enca.setNumsolicitud(numeroEnca);                

// Para grabar el detalle se debe primero grabar su encabezado.
                if (encaDAO.Agregar(enca) == true) {
                    response.setContentType("text/html");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Registro creado exitosamente!');");
                    out.println("</script>");
                    response.sendRedirect("CrearSolicitud.jsp");
                } else {
                    response.setContentType("text/html");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('[ERROR] Solicitud no a sido registrada');");
                    out.println("</script>");
                    response.sendRedirect("CrearSolicitud.jsp");
                }

// BLOQUE QUE SE UTILIZARA PARA LA INSERCION DEL DETALLE DE LA SOLICITUD DE PRODUCTOS.
// recorrer el detalle
                int linea = 1;
                    DAO.SolicitudDetaDAO detaDAO = new DAO.SolicitudDetaDAO();
                    // Clase que se le enviaran los registros
                    Detasoli deta = new Detasoli();

                    // Variable que se utilizara para saber la cantidad de registros que existen en el detalle
                    int numDetalle = 0;
                    numDetalle = detaDAO.lista().size() + 1;                    
                    
                    // numero de solicitud se envia al setter del detalle de solicitud.
                    deta.setEncasoliNumsolicitud(numeroEnca);

                    //Obtencion del codigo del producto
                    String codigoProd = "";
                    codigoProd = request.getParameter("cbxProd");

                    //Obtencion del codigo de la Sede.
                    int codigoSede = 0;
                    codigoSede = Integer.parseInt(request.getParameter("cbxSede"));

                    // Obtiene la cantidad del producto solicitado.
                    int cantidad = 0;
                    if (request.getParameter("txtSolicitado") == null || request.getParameter("txtSolicitado").equals("")) {
                        cantidad = 0;
                    } else {
                        cantidad = Integer.parseInt(request.getParameter("txtSolicitado"));
                    }

                    // Valida cada uno de los campos para poder insertarlo y que esten completos
                    if ((("") != codigoProd) && (codigoSede != 0) && (cantidad > 0)) {
                        // Se envian los valores del detalle a la solicitud Setters
                        deta.setIdsolicitud(numDetalle);
                        deta.setEncasoliNumsolicitud(numeroEnca);
                        deta.setLinea(linea);
                        deta.setProductoCodproducto(codigoProd);
                        deta.setCantsolicitada(cantidad);                        
                        deta.setProductoSedeIdSede(codigoSede);

                        // Pasar el objeto "deta" a la persistencia de hibernate "Agregar".
                        detaDAO.Agregar(deta);
                    }
                
            } catch (Exception e) {
                System.out.println("error graba solicitud " + e.getMessage());
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
