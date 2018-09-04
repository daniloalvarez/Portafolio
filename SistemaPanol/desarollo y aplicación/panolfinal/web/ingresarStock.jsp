<%-- 
    Document   : ingresarStock
    Created on : 12-jun-2016, 1:41:34
    Author     : Miguel Pasten
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.Stock"%>
<%@page import="Entidad.Producto"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="DAO.SedeDAO"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidad.Sede"%>
<%@page import="BO.BOproducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso de Stock</title>
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <script src="JQuery/jquery-1.12.3.min.js" type="text/javascript"></script> 
        <script type="text/javascript" src="JavaScript/JSValidacion.js"></script>
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));

                //DAO y BO
                DAO.SedeDAO miSede = new SedeDAO();
                BO.BOproducto pBO = new BO.BOproducto();
                BO.BOstock miStock = new BO.BOstock();
        %>        

    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <form id="form1" action="StockUpd" method="POST">  
            <h1>Ingreso de Stock</h1>  
            <label for="listaProd">Producto:</label>
            <div class="cbox" id="opcionProductos">                                            
                <select name="cbxProducto" id="cbxProducto">
                    <option>Seleccione</option>
                    <%for (Producto e : pBO.listaProductoFiltro()) {%>
                    <option id="producto" value="<%=e.getCodproducto()%>"><%=e.getNomproducto()%></option>
                    <%}%>                                    
                </select> 

                <br><br>
                <select name="cbxSede" id="cbxSede">
                    <option>Seleccione</option>
                    <%for (Sede sd : miSede.getAll()) {%>
                    <option ID="opcSede" value="<%=sd.getIdSede()%>"><%=sd.getNomsede()%></option>
                    <%}%>                                    
                </select>  
                <br><br>
            </div>      

            <br> 
            <table id="listadeSede" border="0">
                <tr>
                    <th colspan="3">STOCK</th>
                    <th rowspan="2">ACCION</th>
                </tr>
                <tr>
                    <th>Mínimo</th>
                    <th>Máximo</th>
                    <th>Disponible</th> 
                </tr>
                <td><input class="valor" id="minimo" name="minimo" type="text" value="0" maxlength="7" onchange="validaMinimo(this.value)"></input></td>
                <td><input class="valor" id="maximo" name="maximo"type="text" value="0" maxlength="7" onchange="validaMaximo(this.value)"></input></td>
                <td><input class="valor" id="disponible" name="disponible"type="text" value="0" maxlength="7" onchange="validaDisponible(this.value)"></input></td>
                <td><input id="botonListar" type="submit" value="Actualizar"></input></td>
                </tr>
            </table> 
            <br><br>
            <td><a href="ListaProducto.jsp" style="font-size: 20px;">Listado de Productos</a></td>
        </form>
    </center>
    <%}%>             
</body>
</html>
