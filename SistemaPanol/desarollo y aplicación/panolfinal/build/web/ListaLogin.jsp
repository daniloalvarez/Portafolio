
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TipousuarioDAO"%>
<%@page import="Entidad.Login"%>
<%@page import="DAO.LoginDAO"%>
<%@page import="Entidad.Tipousuario"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Lista Login
    Created on : 01-05-2016, 20:27:19
    Author     : Danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));

                DAO.LoginDAO milogin = new LoginDAO();
                DAO.TipousuarioDAO mitipo = new TipousuarioDAO();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <link href="Styless/EstiloListar.css" rel="stylesheet" type="text/css"/>  
        <title>Listado de Login</title>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <h1>Listado de Login</h1>
        <a class="ingreso" href="CrearLogin.jsp">Ingresar Nuevo Login</a>
        <table class="tablaLista" border="1">
            <thead>
            <th>ID</th>
            <th>Tipo Usuario</th>
            <th>Password</th>
            <th>Editar</th>

            </thead>
            <tbody>
                <%for (Login item : milogin.getAll()) {%>
                <tr>
                    <td class="tdCentro"><%=item.getIdLogin()%></td>

                    <%for (Tipousuario c : mitipo.getAll()) {%>
                    <%if (c.getIdTipousuario() == item.getIdTipousuario()) {%>

                    <td class="tdIzq"><%=c.getNomtipousuario()%></td><%}
                        }%>

                    <td class="tdCentro"><%=item.getClave()%></td>

                    <td class="tdCentro"><input id="<%=item.getIdLogin()%>" type="button" onclick="editarUsuario(this.id);" value="Editar"></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </center>

    <%}%>         
</body>
<script>
    function editarUsuario(id)
    {
        window.location.href = "ServletLoginUpdate?id=" + id;
    }
</script>
</html>
