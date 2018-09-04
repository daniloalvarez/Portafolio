<%-- 
    Document   : ListaEscuela
    Created on : 20-jun-2016, 13:45:29
    Author     : CARLOS.A.ROJASZ
--%>

<%@page import="Entidad.Escuela"%>
<%@page import="DAO.EscuelaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">       
        <link rel="stylesheet" type="text/css" href="Styless/EstiloListar.css"> 
        <%
            DAO.EscuelaDAO miEscuela = new EscuelaDAO();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema Pañol</title>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <h1>Lista Escuela</h1>
        <a class="ingreso" href="CrearEscuela.jsp">Ingresar Nueva Escuela</a>
        <table class="tablaLista" border="1">
            <thead>
            <th>ID</th>
            <th>Nombre</th>
            <th>Editar</th>
            </thead>
            <tbody>
                <%for (Escuela item : miEscuela.getAll()) {%>
                <tr>
                    <td class="tdCentro"><%=item.getIdEscuela()%></td>
                    <td class="tdIzq"><%=item.getNomescuela()%></td>

                    <td class="tdCentro"><input id="<%=item.getIdEscuela()%>" type="button" onclick="editarEscuela(this.id);" value="Editar"></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </center>
</body>
<script>
    function editarEscuela(id)
    {
        window.location.href = "ServletEscuelaUpdate?id=" + id;
    }
</script>


</html>
