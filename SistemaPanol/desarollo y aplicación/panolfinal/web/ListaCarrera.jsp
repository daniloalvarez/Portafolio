<%-- 
    Document   : ListaCarrera
    Created on : 20-jun-2016, 12:37:44
    Author     : CARLOS.A.ROJASZ
--%>

<%@page import="Entidad.Carrera"%>
<%@page import="DAO.CarreraDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloListar.css">         
        <% 
             DAO.CarreraDAO miCarrera= new CarreraDAO();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Carreras</title>
    </head>
    <%@include file="MenuVista.jsp"%>
    <body> 
        <center>
        <h1>Lista Carrera</h1>
        <a class="ingreso" href="CrearCarrera.jsp"> Ingresar Nueva Carrera</a>
        <table class="tablaLista" border="1">
            <thead>
                <th>ID</th>
                <th>Nombre</th>
                <th>Editar</th>                
            </thead>
            <tbody>
                <%for(Carrera item : miCarrera.getAll()){%>
                    <tr>
                        <td class="tdCentro"><%=item.getIdCarrera()%></td>
                        <td class="tdIzq"><%=item.getNomcarrera()%></td>
                       
                        <td class="tdCentro"><input id="<%=item.getIdCarrera()%>" type="button" onclick="editarCarrera(this.id);" value="Editar"></td>
                    </tr>
             <% } %>
            </tbody>
        </table>
     </center>
    </body>
    <script>
        function editarCarrera(id)
        {
            window.location.href="ServletCarreraUpdate?id="+id;
        }
    </script>
    
    
</html>
