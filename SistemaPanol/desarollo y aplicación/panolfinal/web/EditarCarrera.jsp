<%-- 
    Document   : EditarCarrera
    Created on : 20-jun-2016, 13:17:30
    Author     : CARLOS.A.ROJASZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@page import="DAO.CarreraDAO"%>
    <%@page import="DAO.EscuelaDAO"%>
    <%@page import="Entidad.Escuela"%>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Editar Sede</title>

    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <jsp:useBean id="dalCarrera" scope="request" class="DAL.DALCarrera" />
        <form action="ServletCarreraUpdate" method="post" onsubmit="return formularioE(this)" >
            <h3 align="center">Actualizar Carrera</h3>
            <table border="1" align="center">

                <tbody>

                    <tr>
                        <td>ID :</td>
                        <td><input type="text" name="txtIdCarrera" size="2" maxlength="1" readonly="readonly" value="${dalCarrera.carrera.idCarrera}"></td>
                    </tr>
                    <tr>
                        <td>Nombre  :</td>
                        <td><input type="text" name="txtNombreCarrera" value="${dalCarrera.carrera.nomcarrera}"></td>
                    </tr>


                    <tr>
                        <td></td>
                        <th><input type="submit" value="Actualizar Sede" onclick="validar()"></th>
                    </tr>
                </tbody>
            </table>

        </form>
    </center>
</body>







</html>
