<%-- 
    Document   : CrearCategoria
    Created on : 04-06-2016, 17:38:08
    Author     : Usuario
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));
        %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Crear Usuario</title>
        <script>function formulario(f) {
                if (f.txtDescripcion.value === '') {
                    alert('El nombre esta vacio');
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body>
        <form action="ServletCategoriaInsert" method="post" onsubmit="return formulario(this)">
            <center>   
                <h3 align="center">Nueva Categoria</h3>
                <table border="1" align="center">
                    <tbody>
                        <tr>
                            <td>Descripcion :</td>
                            <td><input type="text" name="txtDescripcion" ></td>
                        </tr>
                        <tr>
                            <td></td>
                            <th><input style="background-color: #FF9000" type="submit" value="Crear Categoria" onclick="validar()"></th>
                        </tr>
                    </tbody>
                </table>
            </center>   
        </form>
        <%}%> 
    </body>
</html>
