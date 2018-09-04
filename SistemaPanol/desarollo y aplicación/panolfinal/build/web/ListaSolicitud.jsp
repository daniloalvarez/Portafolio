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
        <title>Listado de Solicitudes </title>
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));
                // Instancia el BO que arroja los listados
                BO.BOsolicitudEnca lbo = new BO.BOsolicitudEnca();
        %>        
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <div class="centro"> 
            <h1>Listado de Solicitudes</h1>
            <%
                // Verifica si existen registros para la lista y mostrar mensajes correspondientes            
                if (lbo.listadoEncaSolicitud().size() < 1) { %>
            <h2 style="color: #335599; text-shadow: 1px 1px white; ">NO EXISTEN SOLICITUDES CREADAS</h2>
            <a href="CrearSolicitud.jsp" style="font-size: 22px; color: white;">Ingreso de Solicitud</a>
            <% } else { %>
            <table border="1">
                <tr>
                    <th>Solicitud</th>
                    <th>Fecha</th> 
                    <th>Usuario</th>
                    <th>Comentario</th>
                    <th>Estado</th>
                    <th>Revisar</th>
                </tr>   

                <%
                    // Formateador de fecha
                    SimpleDateFormat fmtFecha = new SimpleDateFormat("dd/MM/yyyy");

                    for (Encasoli e : lbo.listadoEncaSolicitud()) {
                %>  
                <tr>
                    <td class="tdCentro"><%= e.getNumsolicitud()%></td>
                    <td class="lista"><%= fmtFecha.format(e.getFechasolicitud())%></td>                                          
                    <td class="lista"><%= e.getUsuarioRutusuario()%></td> 
                    <%if (e.getComentario() == null) {%>
                    <td class="lista">Sin Comentarios</td>
                    <%} else {%>
                    <td class="lista"><%= e.getComentario()%></td> 
                    <%}%>
                    <%  String miEstado = "";
                        if (e.getEstado().equals("P")) {
                            miEstado = "Pendiente";
                        } else if (e.getEstado().equals("E")) {
                            miEstado = "Parcial";
                        } else if (e.getEstado().equals("A")) {
                            miEstado = "Aceptado";
                        } else {
                            miEstado = "Rechazado";
                       }%>                         
                    <td class="tdCentro"><%=miEstado.toUpperCase()%></td>                    
                    <td class="tdCentro"><a href="ServletSolicitudList?cod=<%=e.getNumsolicitud()%>">Ver Detalle</a></td>
                </tr>   
                <% } %>                 
            </table>
            <% } %>
        </div>
    </center>
    <%}%> 
</body>
</html>
