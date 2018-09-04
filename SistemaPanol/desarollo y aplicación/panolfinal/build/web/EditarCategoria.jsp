<%-- 
    Document   : EditarCategoria
    Created on : 04-06-2016, 17:38:49
    Author     : Usuario
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Crear Usuario</title>
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));
        %>        
        <script>function formulario(f) {

                if (f.txtId.value === '') {
                    alert('El Dv esta vacío');
                    return false;
                }
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
    <center>
        <jsp:useBean id="dalCategoria" scope="request" class="DAL.DALCategoria" />
        <form action="ServletCategoriaUpdate" method="post" onsubmit="return formularioE(this)" >
            <h3 align="center">Actualizar Categoria</h3>
            <table border="1" align="center">

                <tbody>

                    <tr>
                        <td>ID :</td>
                        <td><input type="text" name="txtId" size="2" maxlength="1" readonly="readonly" value="${dalCategoria.categoria.idCategoria}"></td>
                    </tr>
                    <tr>
                        <td>Descripcion  :</td>
                        <td><input type="text" name="txtDescripcion" value="${dalCategoria.categoria.descripcion}"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <th><input type="submit" value="Actualizar Categoria" onclick="validar()"></th>
                    </tr>
                </tbody>
            </table>

        </form>
    </center>
    <%}%>             
</body>
</html>
