<%-- 
    Document   : EditarUsuario
    Created on : 28-05-2016, 15:24:40
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
        <title>Actualizar Usuario</title>
        <script>function formularioE(f) {

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

                if (f.txtCarrera.value === '')
                {
                    alert('Seleccione un una carrera');
                    return false;
                }

                if (f.txtSede.value === '')
                {
                    alert('Seleccione una sede');
                    return false;
                }

                if (f.txtBloqueo.value === '')
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
    <center>
        <jsp:useBean id="dalUsuario" scope="request" class="DAL.DALUsuario" />
        <form action="ServletUsuarioUpdate" method="post" onsubmit="return formularioE(this)" >
            <h3 align="center">Actualizar Usuario</h3>
            <table border="1" align="center">

                <tbody>

                    <tr>
                        <td>RUT :</td>
                        <td><input type="text" id="txtRut" name="txtRut" readonly="readonly"  value="${dalUsuario.usuario.rutusuario}"></td>
                    </tr>
                    <tr>
                        <td>Dv  :</td>
                        <td><input type="text" id="txtDv" name="txtDv" readonly="readonly" size="2" maxlength="1"  value="${dalUsuario.usuario.dvusuario}"></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" id="txtNombre" name="txtNombre" value="${dalUsuario.usuario.nomusuario}"></td>
                    </tr>
                    <tr>
                        <td>Apellido Paterno</td>
                        <td><input type="text" id="txtApellidoP" name="txtApellidoP" value="${dalUsuario.usuario.paternousuario}"></td>
                    </tr>
                    <tr>
                        <td>Apellido Materno</td>
                        <td><input type="text" id="txtApellidoM" name="txtApellidoM" value="${dalUsuario.usuario.maternousuario}"></td>
                    </tr>
                    <tr>
                        <td>Telefono</td>
                        <td><input type="text" id="txtFono" name="txtFono" value="${dalUsuario.usuario.fono}"></td>
                    </tr>
                    <tr>
                        <td>Correo</td>
                        <td><input type="text" id="txtCorreo" name="txtCorreo" readonly="readonly" value="${dalUsuario.usuario.mailusuario}"></td>
                    </tr>
                    <tr>
                         <td>Sede :</td>
                        <td><select name="txtSede">
                        <%for(Sede e : miSede.getAll()){%>
                        <% if(e.getIdSede()== dalUsuario.getUsuario().getSedeIdSede()) {  %>
                        <option selected="true" value="<%=e.getIdSede()%>"><%=e.getNomsede()%></option>
                        <%}%>
                        <option value="<%=e.getIdSede()%>"><%=e.getNomsede()%></option>
                        <%}%>
                        </select></td>
                    </tr>
                    <tr>
                         <td>Carrera :</td>
                        <td><select name="txtCarrera">
                        <%for(Carrera c: miCarrera.getAll()){%>
                        <% if(c.getIdCarrera()== dalUsuario.getUsuario().getCarreraIdCarrera()) {  %>
                        <option selected="true" value="<%=c.getIdCarrera()%>"><%=c.getNomcarrera()%></option>
                        <%}%>
                        <option value="<%=c.getIdCarrera()%>"><%=c.getNomcarrera()%></option>
                        <%}%>
                        </select></td>
                    </tr>
                    <tr>
                        <td>Id Login  :</td>
                        <td><input type="text" id="txtIdLogin" readonly="readonly" name="txtIdLogin" value="${dalUsuario.usuario.loginIdLogin}"></td>
                    </tr>
                    <tr>
                        <td>Motivo de Bloqueo :</td>
                        <td><input type="text" id="txtMotivo"  name="txtMotivo" value="${dalUsuario.usuario.motivobloqueo}"></td>
                    </tr>
                      <tr>
                        <td>Bloqueo :</td>
                        <td><select name="txtBloqueo" id="txtBloqueo" >
                                <%if(dalUsuario.getUsuario().getBloqueousuario()=='A'){ %>
                                <option selected="TRUE" value="A">ACTIVO</option>
                                <option value="B">BOQUEADO</option>
                                  <%}else{%>
                                  <option selected="true" Value="B">BOQUEADO</option>
                                  <option value="A">ACTIVO</option>
                                  <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <th><input type="submit" value="Actualizar Usuario" onclick="validar()"></th>
                    </tr>
                </tbody>
            </table>

        </form>
    </center>
    <%}%>
</body>
</html>


