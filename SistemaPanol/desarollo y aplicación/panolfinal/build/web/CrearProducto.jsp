<%-- 
    Document   : CrearProducto
    Created on : 31-05-2016, 20:39:44
    Author     : Danilo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="BO.BOstock"%>
<%@page import="Entidad.Categoria"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="DAO.SedeDAO"%>
<%@page import="Entidad.Sede"%>
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

                DAO.SedeDAO miSede = new SedeDAO();
                DAO.CategoriaDAO miCategoria = new CategoriaDAO();
                BO.BOstock miStock = new BOstock();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Creacion de Producto</title>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body>
        <form action="ServletProductoInsert" method="post" onsubmit="return formulario(this)">
            <center>   
                <h3 align="center">Producto</h3>
                <table border="1" align="center">
                    <tbody>  
                        <tr>
                            <td>Categoria</td>
                            <td><select class="cbox" name="txtidCategoria" >
                                    <option valor="">Seleccione</option>
                                    <%for (Categoria e : miCategoria.getAll()) {%>
                                    <option value="<%=e.getIdCategoria()%>"><%=e.getDescripcion()%></option>
                                    <%}%>
                                </select></td> 
                        </tr>                                
                        <tr>
                            <td>Codigo</td>
                            <td><input type="text" name="txtCodProducto" ></td>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="txtNombre" ></td>
                        </tr>
                        <tr>
                            <td>Imagen</td>
                            <td><input type="file" name="txtImagen"></td>
                        </tr>
                        <tr>
                            <td>Precio</td>
                            <td><input type="text" name="txtPrecio" ></td>
                        </tr>
                        <tr>
                            <td>Estado</td>
                            <td><input type="radio" name="rbtEstado" value="V" checked="checked"> Activo
                                <input type="radio" name="rbtEstado" value="F"> Inactivo
                            </td>
                        </tr>
                        <tr>
                            <td>comentario</td>
                            <td><input type="text" name="txtComentario" ></td>
                        </tr>
                        <tr>
                            <td>Sede :</td>
                            <td><select class="cbox" name="txtSede">
                                    <option valor="">Seleccione</option>
                                    <%for (Sede e : miSede.getAll()) {%>
                                    <option value="<%=e.getIdSede()%>"><%=e.getNomsede()%></option>
                                    <%}%>
                                </select></td>
                        </tr>
                        <tr>
                            <td></td>
                            <th><input style="background-color: #FF9000" type="submit" value="Crear Producto" onclick="validar()"></th>
                        </tr>
                    </tbody>                           
            </center>   
        </form>
        <%}%>                 
    </body>
</html>
