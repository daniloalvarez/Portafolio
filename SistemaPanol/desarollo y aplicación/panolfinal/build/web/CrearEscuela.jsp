<%-- 
    Document   : CrearEscuela
    Created on : 20-jun-2016, 13:31:45
    Author     : CARLOS.A.ROJASZ
--%>

<%@page import="DAO.EscuelaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <%
            DAO.EscuelaDAO miEscuela = new EscuelaDAO();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Crear Carrera</title>

    </head>

    <%@include file="MenuVista.jsp" %>
    <body>
        <form action="ServletEscuelaInsert" method="post" onsubmit="return formulario(this)">
            <center>   
                <h3 align="center">Nueva Escuela</h3>
                <table border="1" align="center">
                    <tbody>
                        <tr>
                            <td>Nombre Escuela :</td>
                            <td><input type="text" name="txtNombreEscuela" ></td>
                        </tr>

                        <tr>
                            <td></td>
                            <th><input style="background-color: #FF9000" type="submit" value="Crear Escuela" onclick="validar()"></th>
                        </tr>
                    </tbody>
                </table>
            </center>   
        </form>
    </body>





</html>
