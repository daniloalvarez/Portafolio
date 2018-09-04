<%-- 
    Document   : CrearLogin
    Created on : 22-05-2016, 20:03:02
    Author     : Usuario
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.Usuario"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="DAO.TipousuarioDAO"%>
<%@page import="Entidad.Tipousuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));

                DAO.UsuarioDAO miUsuario = new UsuarioDAO();
                DAO.TipousuarioDAO miTipousuario = new TipousuarioDAO();
        %>
        <%@include file="MenuVista.jsp" %>
    <body>
        <jsp:useBean id="dalTipousuario" scope="request" class="DAL.DALTipousuario" />
        <form action="ServletLoginInsert" method="post" onsubmit="return formulario(this)">
            <center>   
                <h3 align="center">Creacion de Login</h3>
                <table border="1" align="center">
                    <tbody>

                        <tr>
                            <td>Rut :</td>
                            <td><select id="txtRut" name="txtRut">
                                    <option>Seleccione</option>
                                    <%for (Usuario e : miUsuario.getAll()) {%>
                                    <option Value="<%=e.getRutusuario()%>"><%=e.getRutusuario()%></option>
                                    <%}%>
                                </select></td> 
                        </tr>
                        <tr>
                            <td>Password :</td>
                            <td><input type="password" id="txtPassword" name="txtPassword"></td>
                        </tr>
                        <tr>
                            <td> Repita Password :</td>
                            <td><input type="password" id="txtPassword1" name="txtPassword1"></td>

                        <tr>
                            <td>Tipo Usuario :</td>
                            <td><select id="txtidTipoUsuario" name="txtidTipoUsuario">
                                    <option>Seleccione</option>
                                    <%for (Tipousuario e : miTipousuario.getAll()) {%>
                                    <option Value="<%=e.getIdTipousuario()%>"><%=e.getNomtipousuario()%></option>
                                    <%}%>
                                </select></td> 
                        </tr>
                        <tr>
                            <td></td>
                            <th><input style="background-color: #FF9000" type="submit" value="Crear Usuario" onclick="validar()"></th>
                        </tr>
                    </tbody>
                </table>
            </center>   
        </form>
        <%}%>                     
    </body>
</html>
