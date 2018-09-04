<%-- 
    Document   : CrearSede
    Created on : 20-jun-2016, 12:28:33
    Author     : CARLOS.A.ROJASZ
--%>

<%@page import="DAO.SedeDAO"%>
<%@page import="Entidad.Sede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            DAO.SedeDAO miSede = new SedeDAO();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Crear de Sede</title>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body>
        <form action="ServletSedeInsert" method="post" onsubmit="return formulario(this)">
            <center>   
                <h3 align="center">Sede</h3>
                <table border="1" align="center">
                    <tbody>  

                        <tr>
                            <td>Nombre Sede</td>
                            <td><input type="text" name="txtNombreSede" ></td>
                        </tr>

                        <tr>
                            <td></td>
                            <th><input style="background-color: #FF9000" type="submit" value="Crear Sede" onclick="validar()"></th>
                        </tr>
                    </tbody>

            </center>   
        </form>
    </body>
</html>
