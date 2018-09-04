<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.Carrera"%>
<%@page import="DAO.CarreraDAO"%>
<%@page import="DAO.SedeDAO"%>
<%@page import="Entidad.Sede"%>
<%@page import="Entidad.Usuario"%>
<%@page import="DAO.UsuarioDAO"%>
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
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css"> 
        <link rel="stylesheet" type="text/css" href="Styless/EstiloListar.css">         
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));

                DAO.UsuarioDAO miUsuario = new UsuarioDAO();
                DAO.SedeDAO miSede = new SedeDAO();
                DAO.CarreraDAO miCarrera = new CarreraDAO();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <jsp:useBean id="dalUsuario" scope="request" class="DAL.DALUsuario" />
        <h1>Lista Usuario</h1>
        <a class="ingreso" href="CrearUsuario.jsp">Ingresar Nuevo Usuario</a>
        <table class="tablaLista" border="1">
            <thead>
            <th>Rut</th>
            <th>Nombres</th>
            <th>Paterno</th>
            <th>Materno</th>
            <th>Email</th>
            <th>Sede</th>
            <th>Estado Bloqueo</th>
            <th>Motivo Bloqueo</th>
            <th>Carrera</th>
            <th>Editar</th>
            </thead>
            <tbody>
                <%for (Usuario item : miUsuario.getAll()) {%>
                <tr>
                    <td class="tdCentro"><%=item.getRutusuario()%></td>
                    <td class="tdIzq"><%=item.getNomusuario()%></td>
                    <td class="tdIzq"><%=item.getPaternousuario()%></td>
                    <td class="tdIzq"><%=item.getMaternousuario()%></td>
                    <td class="tdCentro"><%=item.getMailusuario()%></td>

                    <%for (Sede s : miSede.getAll()) {%>
                    <%if (s.getIdSede() == item.getSedeIdSede()) {%>
                    <td class="tdIzq"><%= s.getNomsede()%></td><%}
                        }%>
                    <%if (item.getBloqueousuario().equals('A')) { %>  
                    <td class="tdCentro"> ACTIVO </td>
                    <%} else {%>
                    <td class="tdCentro"> BLOQUEADO </td>
                    <%}%>
                    <td class="tdIzq"><%=item.getMotivobloqueo()%></td>

                    <%for (Carrera c : miCarrera.getAll()) {%>
                    <%if (c.getIdCarrera() == item.getCarreraIdCarrera()) {%>
                    <td class="tdIzq"><%=c.getNomcarrera()%></td><%}
                        }%>
                        <td class="tdCentro"><input id="<%=item.getRutusuario()%>" type="button" onclick="editarUsuario(this.id);" value="Editar"></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </center>
</body>
<script>
    function editarUsuario(id)
    {
        window.location.href = "ServletUsuarioUpdate?id=" + id;
    }
</script>
<%}%>  
</html>
