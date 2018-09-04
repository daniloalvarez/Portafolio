<%-- 
    Document   : Inicio
    Created on : 03-05-2016, 22:09:54
    Author     : Danilo
--%>

<%@page import="Entidad.Tipousuario"%>
<%@page import="Entidad.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">         
        <link rel="stylesheet" type="text/css" href="Styless/EstiloLogin.css">         
        
        <title>Sistema Pañol DUOC</title>        
        <% if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {   
                int idPerfil = Integer.parseInt(String.valueOf(session.getAttribute("tipo")));
                String perfil = "";
                DAO.TipousuarioDAO tipo = new DAO.TipousuarioDAO();
                
                for(Tipousuario t: tipo.getAll()){
                    if(t.getIdTipousuario() == idPerfil){
                        perfil = t.getNomtipousuario();
                    }
                }            
            
                int rutVar = 0;
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                    rutVar = Integer.parseInt(String.valueOf(session.getAttribute("miListaSesion")));
                %>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body onload="obtenerFecha()">              
    <center>          
        <br>
    </center>
    <center> 
        <br>
        <br>
        <div style="margin: 30px;">
            <h1 style="text-align: center;">Bienvenido</h1>  
            
        <%for (Usuario us: boUsuario.getAll()){   
           if(us.getRutusuario() == rutVar){ %>
             <h2><%=us.getNomusuario()+" "+us.getPaternousuario()+" "+us.getMaternousuario()%></h2>
             <h2 style="color: #08088A;">Perfil de Acceso: <%=perfil%></h2>  
        <%}}%>
        <img src="Imagenes/DuocUC2.png"/>
        <div>
    </center> 
</body>
<%}%>
</html>
