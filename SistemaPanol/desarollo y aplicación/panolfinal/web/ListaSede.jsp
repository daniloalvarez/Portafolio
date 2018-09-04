<%-- 
    Document   : ListarSede
    Created on : 20-jun-2016, 9:18:58
    Author     : CARLOS.A.ROJASZ
--%>

<%@page import="Entidad.Sede"%>
<%@page import="DAO.SedeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">      
        <link rel="stylesheet" type="text/css" href="Styless/EstiloListar.css">         
        <%
            DAO.SedeDAO miSede = new SedeDAO();

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sede</title>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <h1>Lista Sede</h1>
        <a class="ingreso" href="CrearSede.jsp">Ingresar Nueva Sede</a>
        <table class="tablaLista" border="1">
            <thead>
            <th>ID</th>
            <th>Nombre Sede</th>
            <th>Editar</th>
            </thead>
            <tbody>
                <%for (Sede item : miSede.getAll()) {%>
                <tr>
                    <td class="tdCentro"><%=item.getIdSede()%></td>
                    <td class="tdIzq"><%=item.getNomsede()%></td>

                    <td class="tdCentro"><input id="<%=item.getIdSede()%>" type="button" onclick="editarSede(this.id);" value="Editar"></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </center>
</body>
<script>
    function editarSede(id)
    {
        window.location.href = "ServletSedeUpdate?id=" + id;
    }
</script>

</html>
