<%-- 
    Document   : EditarEscuela
    Created on : 20-jun-2016, 13:53:03
    Author     : CARLOS.A.ROJASZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Editar Escuela</title>

    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <jsp:useBean id="dalEscuela" scope="request" class="DAL.DALEscuela" />
        <form action="ServletCategoriaUpdate" method="post" onsubmit="return formularioE(this)" >
            <h3 align="center">Actualizar Escuela</h3>
            <table border="1" align="center">

                <tbody>

                    <tr>
                        <td>ID :</td>
                        <td><input type="text" name="txtId" size="2" maxlength="1" readonly="readonly" value="${dalEscuela.escuela.idEscuela}"></td>
                    </tr>
                    <tr>
                        <td>Descripcion  :</td>
                        <td><input type="text" name="txtDescripcion" value="${dalEscuela.escuela.nomescuela}"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <th><input type="submit" value="Actualizar Categoria" onclick="validar()"></th>
                    </tr>
                </tbody>
            </table>

        </form>
    </center>
</body>
</html>
