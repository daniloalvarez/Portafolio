<%-- 
    Document   : EditarProducto
    Created on : 31-05-2016, 20:40:03
    Author     : Danilo
--%>
<%@page import="DAO.SedeDAO"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="Entidad.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.Sede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        DAO.SedeDAO misede = new SedeDAO();
        DAO.CategoriaDAO micategoria = new CategoriaDAO();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="JavaScript/jsEditar.js"></script>
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Editar Producto</title>
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));
                DAL.DALSede miSede = new DAL.DALSede();%>
    </head>

    <%@include file="MenuVista.jsp" %>
    <body>
        <jsp:useBean id="dalProducto" scope="request" class="DAL.DALProducto" />
        <form action="ServletProductoUpdate" method="post" onsubmit="return formulario(this)">
            <center>   
                <h3 align="center">Editar Producto</h3>
                <table border="1" align="center">
                    <tbody>

                        <tr>
                            <td>Codigo :</td>
                            <td><input type="text" name="txtCodProducto" value="${dalProducto.producto.codproducto}" ></td>
                        </tr>
                        <tr>
                            <td>Nombre  :</td>
                            <td><input type="text" name="txtNombre" value="${dalProducto.producto.nomproducto}"  ></td>
                        </tr>
                        <tr>
                            <td>Imagen  :</td>
                            <td><input type="file" name="txtImagen" value="${dalProducto.producto.imagen}" ></td>
                        </tr>
                        <tr>
                            <td>Precio  :</td>
                            <td><input type="text" name="txtPrecio" value="${dalProducto.producto.precio}"  ></td>
                        </tr>
                        <tr>
                            <td>Bloqueo :</td>
                            <td><select name="rbtEstado" id="rbtEstado" >
                                    <%if (dalProducto.getProducto().getEstado() == 'A') { %>
                                    <option selected="TRUE" value="A">ACTIVO</option>
                                    <option value="B">BOQUEADO</option>
                                    <%} else {%>
                                    <option selected="true" Value="B">BOQUEADO</option>
                                    <option value="A">ACTIVO</option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <td>comentario  :</td>
                            <td><input type="text" name="txtComentario" value="${dalProducto.producto.comentario}" ></td>
                        </tr>
                        <tr>
                            <td>Categoria :</td>
                            <td><select name="txtIdCategoria">
                                    <%for (Categoria e : micategoria.getAll()) {%>
                                    <% if (e.getIdCategoria() == dalProducto.getProducto().getIdCategoria()) {%>
                                    <option selected="true" value="<%=e.getIdCategoria()%>"><%=e.getDescripcion()%></option>
                                    <%} else {%>
                                    <option value="<%=e.getIdCategoria()%>"><%=e.getDescripcion()%></option>
                                    <%}
                            }%>
                                </select></td>
                        </tr>

                        <tr>
                            <td>Sede :</td>
                            <td><select name="txtSede">
                                    <%for (Sede e : misede.getAll()) {%>
                                    <% if (e.getIdSede() == dalProducto.getProducto().getIdSede()) {%>
                                    <option selected="true" value="<%=e.getIdSede()%>"><%=e.getNomsede()%></option>
                                    <%}%>
                                    <option value="<%=e.getIdSede()%>"><%=e.getNomsede()%></option>
                                    <%}%>
                                </select></td>
                        </tr>
                        <tr>
                            <td></td>
                            <th><input style="background-color: #FF9000" type="submit" value="Actualizar Producto" onclick="validar()"></th>
                        </tr>
                    </tbody> 
                </table>
            </center>   
        </form>
        <%}%>
    </body>
</html>
