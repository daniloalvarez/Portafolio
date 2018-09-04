<%-- 
    Document   : ListaProducto
    Created on : 31-05-2016, 20:39:19
    Author     : Danilo
--%>

<%@page import="Entidad.Encasoli"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloListar.css">    
        <title>Listado de Solicitudes BB </title>
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));
                // Instancia el BO que arroja los listados
                BO.BOsolicitudEnca lbo = new BO.BOsolicitudEnca();
                
                int rutVar = 0;
                rutVar = Integer.parseInt(String.valueOf(session.getAttribute("miListaSesion")));           
        %>        
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <div class="centro"> 
            <h1>Mis Solicitudes Registradas</h1>
            <a href="CrearSolicitud.jsp" style="font-size: 20px; color: white;">Ingreso de Solicitud</a><br><br>           
            <%         
               // Formateador de fecha
               SimpleDateFormat fmtFecha = new SimpleDateFormat("dd/MM/yyyy");                                  
            %>    
            <table border="1">
                <tr>
                    <th>Solicitud</th>
                    <th>Fecha</th> 
                    <th>Usuario</th>
                    <th>Comentario</th>
                    <th>Estado</th>
                    <th>Revisar</th>
                </tr>  
               <%// Verifica si existen registros para la lista y mostrar mensajes correspondientes                   
               for (Encasoli  e : lbo.listadoEncaSolicitud()) {
                  if(e.getUsuarioRutusuario() == rutVar) { %>                 
                <tr>
                    <td class="tdCentro"><%= e.getNumsolicitud()%></td>
                    <td class="lista"><%= fmtFecha.format(e.getFechasolicitud())%></td>                                          
                    <td class="lista"><%= e.getUsuarioRutusuario()%></td> 
                    <%if (e.getComentario() == null) {%>
                         <td class="lista">Sin Comentarios</td>
                    <%} else {%>
                         <td class="lista"><%= e.getComentario()%></td> 
                    <%}%>
                   <%  String miEstado="";
                       if(e.getEstado().equals("P")) {
                            miEstado = "Pendiente";  
                       } else if(e.getEstado().equals("E")){
                            miEstado = "Parcial";
                       } else if(e.getEstado().equals("A")){
                            miEstado = "Aceptado";
                       } else {
                            miEstado = "Rechazado";    
                   } %>                         
                    <td class="tdCentro"><%=miEstado.toUpperCase()%></td>
                    <td class="tdCentro"><a href="ServletSolicitudListB?codigo=<%=e.getNumsolicitud()%>">Ver Detalle</a></td>                   
                </tr> 
                <% }} %>   
            </table>                
        </div>
    </center>
    <%}%> 
</body>
</html>
