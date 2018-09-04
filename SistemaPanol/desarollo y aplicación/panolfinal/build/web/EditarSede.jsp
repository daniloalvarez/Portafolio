<%-- 
    Document   : EditarSede
    Created on : 20-jun-2016, 11:27:46
    Author     : CARLOS.A.ROJASZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Editar Sede</title>

    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <jsp:useBean id="dalSede" scope="request" class="DAL.DALSede" />
        <form action="ServletSedeUpdate" method="post" onsubmit="return formularioE(this)" >
            <h3 align="center">Actualizar Sede</h3>
            <table border="1" align="center">

                <tbody>

                    <tr>
                        <td>ID :</td>
                        <td><input type="text" name="txtIdSede" size="2" maxlength="1" readonly="readonly" value="${dalSede.sede.idSede}"></td>
                    </tr>
                    <tr>
                        <td>Nombre  :</td>
                        <td><input type="text" name="txtNombreSede" value="${dalSede.sede.nomsede}"></td>
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
