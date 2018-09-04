<%-- 
    Document   : CrearUsuario
    Created on : 01-05-2016, 21:28:40
    Author     : Danilo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="Entidad.Carrera"%>
<%@page import="Entidad.Sede"%>
<%@page import="DAO.SedeDAO"%>
<%@page import="DAO.TipousuarioDAO"%>
<%@page import="DAO.CarreraDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%ResultSet resultset = null;%>
<!DOCTYPE html>
<html>
    <head>
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));

                DAO.UsuarioDAO miUsuario = new UsuarioDAO();
                DAO.CarreraDAO miCarrera = new CarreraDAO();
                DAO.SedeDAO miSede = new SedeDAO();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Crear Usuario</title>
        <script>function formulario(f) {
                if (f.txtRut.value === '') {
                    alert('El Rut esta vacío');
                    return false;
                }
                if (f.txtDv.value === '') {
                    alert('El Dv esta vacío');
                    return false;
                }
                if (f.txtNombre.value === '') {
                    alert('El nombre esta vacio');
                    return false;
                }
                if (f.txtApellidoP.value === '')
                {
                    alert('El apellido paterno esta vacio');
                    return false;
                }
                if (f.txtApellidoM.value === '')
                {
                    alert('El apellido materno esta vacio');
                    return false;
                }
                valor = document.getElementById("txtFono").value;
                if (!(/^\d{9}$/.test(valor))) {
                    alert('Ingrese un telefono de valido de 9 numeros');
                    return false;
                }

                indice = document.getElementById("txtidCarrera").selectedIndex;
                if (indice === null || indice === 0)
                {
                    alert('Seleccione un una carrera');
                    return false;
                }

                indice = document.getElementById("txtSede").selectedIndex;
                if (indice === null || indice === 0)
                {
                    alert('Seleccione una sede');
                    return false;
                }

                indice = document.getElementById("txtTipousuario").selectedIndex;
                if (indice === null || indice === 0)
                {
                    alert('Seleccione un un tipo de usuario');
                    return false;
                }
                if (f.txtEmail.value === '')
                {
                    alert('El correo no puede estar vacio');
                    return false;
                }


                return true;
            }
        </script>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body>
        <jsp:useBean id="dalUsuario" scope="request" class="DAL.DALUsuario" />
        <form action="ServletUsuarioInsert" method="post" onsubmit="return formulario(this)">
            <center>   
                <h3 align="center">Usuario</h3>
                <table border="1" align="center">
                    <tbody>

                        <tr>
                            <td>Rut :</td>
                            <td><input type="text" name="txtRut" > - <input type="text" name="txtDv" size="2" maxlength="1"></td>
                        </tr>
                        <tr>
                            <td>Nombre :</td>
                            <td><input type="text" name="txtNombre" ></td>
                        </tr>
                        <tr>
                            <td>Apellido Paterno:</td>
                            <td><input type="text" name="txtApellidoP" ></td>
                        </tr>
                        <tr>
                            <td>Apellido Materno:</td>
                            <td><input type="text" name="txtApellidoM" ></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="txtEmail" ></td>
                        </tr>
                        <tr>
                            <td>Telefono:</td>
                            <td><input type="text" name="txtFono" ></td>
                        </tr>
                        <tr>
                            <td>Carrera :</td>
                            <td><select name="txtidCarrera" >
                                    <option>Seleccione</option>
                                    <%for (Carrera e : miCarrera.getAll()) {%>
                                    <option value="<%=e.getIdCarrera()%>"><%=e.getNomcarrera()%></option>
                                    <%}%>
                                </select></td> 
                        </tr>
                        <tr>
                            <td>Sede :</td>
                            <td><select name="txtSede">
                                    <option>Seleccione</option>
                                    <%for (Sede e : miSede.getAll()) {%>
                                    <option value="<%=e.getIdSede()%>"><%=e.getNomsede()%></option>
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
