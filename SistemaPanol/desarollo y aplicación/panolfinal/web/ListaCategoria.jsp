<%@page import="DAO.CategoriaDAO"%>
<%@page import="Entidad.Categoria"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ListaUsuario
    Created on : 01-05-2016, 20:27:19
    Author     : Danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>   
        <script type="text/javascript" src="JavaScript/jsEditar.js"></script>
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloListar.css">  
        <%
            DAO.CategoriaDAO miCategoria = new CategoriaDAO();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Categorias</title>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <form name="frmRptCategoria" action="ServletRptCategoria" method="POST">
        <h1>Lista Categoria</h1>
        <a class="ingreso" href="CrearCategoria.jsp">Ingresar Nueva Categoria</a>
        <table class="tablaLista" border="1">
            <thead>
            <th>ID</th>
            <th>Descripcion</th>
            <th>Editar</th>               
            </thead>
            <tbody>
                <%for (Categoria item : miCategoria.getAll()) {%>
                <tr>
                    <td class="tdCentro"><%=item.getIdCategoria()%></td>
                    <td class="tdIzq"><%=item.getDescripcion()%></td>                      
                    <td class="tdCentro"><input id="<%=item.getIdCategoria()%>" type="button" onclick="editarCategoria(this.id);" value="Editar"></td>
                </tr>
                <% }%>
                
<input id="reporte" type="submit" value="Reporte">                
            </tbody>
        </table>
                
    </form>        
    </center>
</body>
</html>
