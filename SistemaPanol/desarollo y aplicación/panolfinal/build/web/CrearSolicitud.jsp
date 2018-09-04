<%-- 
    Document   : CrearSolicitud
    Created on : 19-jun-2016, 16:21:31
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="BO.BOproducto"%>
<%@page import="Entidad.Producto"%>
<%@page import="Entidad.Sede"%>
<%@page import="DAL.DALProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloSolicitud.css"> 
        <script src="JQuery/jquery-1.12.3.min.js" type="text/javascript"></script>
        <script src="JavaScript/jsSolicitud.js" type="text/javascript"></script>

        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));

                DAO.SedeDAO miSede = new DAO.SedeDAO();
                BO.BOproducto miProd = new BOproducto();
        %>    

        <title>Solicitud de Producto</title>          
    </head>
    <%@include file="MenuVista.jsp" %>
    <body onload="obtenerFecha()">
    <center>
        <div id="divPrincipal">
            <form name="frmSolicitud" method="GET" action="ServletSolicitudCre" onsubmit="return guardarRegistro()">
                <div id="encabezado">  
                    <h1 id="titulo">Solicitud de Productos</h1>            
                    <table id="tablaSolicitud">
                        <tr>
                            <td class="etiqueta">Fecha</td>
                            <td><input type="text" id="txtFecha" name="txtFecha" disabled=""></td>
                        </tr>
                        <tr>
                            <td class="etiqueta">Comentario</td>
                            <td colspan="6"><input type="text" id="txtComentario" name="txtComentario" maxlength="46"></td>
                        </tr>                
                        <tr>
                            <td class="etiqueta">Sede</td>
                            <td><select class="cbox" id="cbxSede" name="cbxSede">
                                    <option>Seleccione</option>
                                    <%for (Sede e : miSede.getAll()) {%>
                                    <option value="<%=e.getIdSede()%>"><%=e.getNomsede()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr> 
                        <tr>
                            <td colspan="2" style="text-align: center;"><input style="margin-top: 10px; width: 150px; height: 30px;" type="button" id="btnGraba" name="btnGraba" value="Ingreso Detalle" onclick="disable()"></input>
                                <input style="margin-top: 10px; width: 150px; height: 30px;" type="button" id="btnModificar" name="btnModificar" value="Modificar" onclick="limpiaDetalle()"></input>
                        </tr>
                    </table>
                </div>
                <br>
                <h2 style="color: black;">Detalle de Solicitud</h2>              
                <table id="TablaDetalle" border="1">
                    <tr>
                        <th rowspan="2">Producto</th>
                        <th rowspan="2">Codigo</th>
                        <th colspan="2">Stock</th>
                    <tr>
                        <th>Actual</th>
                        <th>Pedido</th>
                    <tr>
                    </tr> 
                    <tr>
                        <td><select class="cboxProd" id="cbxProd" name="cbxProd">
                                <option>Seleccione</option>
                                <%for (Producto p : miProd.listaProductoFiltro()) {%>
                                <option value="<%=p.getCodproducto()%>"><%=p.getNomproducto()%></option>
                                <%}%>
                            </select>
                        </td> 
                        <td>
                            <input style="text-align: center" type="text" id="txxProd" name="txtProd" value=""></input>
                        </td>
                        <td>
                            <input class="cantidad" type="text" value="" id="txtActual" name="txtActual"></input>
                        </td>                          
                        <td>
                            <input class="cantidad" type="text" value="" id="txtSolicitado" name="txtSolicitado" maxlength="4"></input>
                        </td>                        

                    </tr>
                </table>                     
                    <input style="margin-top: 5px;" type="submit" class="boton" id="btnRegistrar" name="btnRegistrar" value="Registrar Solicitud" onclick="this.guardarRegistro()"></input>
                    <br><br>
                <strong style="font-size: 18px;">(*) El Stock actual es referencial, pueden existir solicitudes pendientes por Procesar.</strong><br>
                <strong style="font-size: 18px;">Recuerde revisar el estado de su solicitud <a href="MisSolicitudes.jsp">Aquí</a></strong>
        </div>  
    </form>  
</div>          
</center>
<%}%>
</body>

</html>
