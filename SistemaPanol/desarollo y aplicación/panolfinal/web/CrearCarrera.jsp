<%-- 
    Document   : CrearCarrera
    Created on : 20-jun-2016, 11:55:01
    Author     : CARLOS.A.ROJASZ
--%>

<%@page import="DAO.CarreraDAO"%>
<%@page import="DAO.EscuelaDAO"%>
<%@page import="Entidad.Escuela"%>
<<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            DAO.EscuelaDAO miEscuela = new EscuelaDAO();
            DAO.CarreraDAO miCarrera = new CarreraDAO();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Crear Carrera</title>

    </head>

    <%@include file="MenuVista.jsp" %>
    <body>
        <form action="ServletCarreraInsert" method="post" onsubmit="return formulario(this)">
            <center>   
                <h3 align="center">Nueva Carrera</h3>
                <table border="1" align="center">
                    <tbody>
                        <tr>
                            <td>Nombre Carrera :</td>
                            <td><input type="text" name="txtNombreCarrera" ></td>
                        </tr>
                        <tr>
                            <td>Escuela :</td>
                            <td><select class="cbox" name="txtEscuela">
                                    <option>Seleccione</option>
                                    <%for (Escuela e : miEscuela.getAll()) {%>
                                    <option value="<%=e.getIdEscuela()%>"><%=e.getNomescuela()%></option>
                                    <%}%>
                                </select></td>
                        </tr>
                        <tr>
                            <td></td>
                            <th><input style="background-color: #FF9000" type="submit" value="Crear Carrera" onclick="validar()"></th>
                        </tr>
                    </tbody>
                </table>
            </center>   
        </form>
    </body>
</html>
