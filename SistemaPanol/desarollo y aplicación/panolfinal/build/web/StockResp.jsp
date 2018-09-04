<%-- 
    Document   : StockResp
    Created on : 19-jun-2016, 22:41:29
    Author     : Miguel Pasten
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloSolicitud.css">
        <title>Registro creado</title>
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));
        %>         
    </head>
    <%@include file="MenuVista.jsp" %>
    <body>
    <center>
        <h1 style="color: yellow; text-shadow: 3px 3px black; font-size: 30px">Registro creado exitosamente!!</h1>
        <br><br>
        <!-- menu -->
        <div>
            <a href="ingresarStock.jsp" style="font-size: 20px; color: white">Volver a ingreso de Stock</a><br>
            <a href="ListaProducto.jsp" style="font-size: 20px; color: white">Listado de Productos</a><br>
            <a href="CrearProducto.jsp" style="font-size: 20px; color: white">Agregar producto Nuevo</a>
        </div>
        <!-- fin menu -->   
    </center>
    <%}%>
</body>
</html>
