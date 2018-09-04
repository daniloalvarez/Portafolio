<%-- 
    Document   : ListaProducto
    Created on : 31-05-2016, 20:39:19
    Author     : Danilo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="Entidad.Categoria"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="Entidad.Producto"%>
<%@page import="DAO.SedeDAO"%>
<%@page import="DAL.DALSede"%>
<%@page import="Entidad.Sede"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloListar.css">      
        <script type="text/javascript" src="JavaScript/jsEditar.js"></script>
        <script src="JQuery/jquery-1.12.3.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="JQuery/jquery-latest.js"></script> 
        <script type="text/javascript" src="JQuery/jquery.tablesorter.js"></script>
        <title>Lista de Producto </title> 
        
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));

                // Formateador de fecha
                SimpleDateFormat fmtFecha = new SimpleDateFormat("dd/MM/yyyy");
                // Separador de valores miles
                DecimalFormat fmtMonto = new DecimalFormat("###,###.##");

                DAO.ProductoDAO miProducto = new ProductoDAO();
                DAO.SedeDAO miSede = new SedeDAO();
                DAO.CategoriaDAO micategoria = new CategoriaDAO();
        %>

        <script>
            /*Ordena las columnas de las tablas ascendete o descendente */
            $(document).ready(function ()
            {
                $("#stockTabla").tablesorter({sortList: [[0, 0], [1, 0]]});
            }
            );
        </script>   
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <jsp:useBean id="dalProducto" scope="request" class="DAL.DALProducto" />
        <h1>Lista de Productos</h1>
        <a class="ingreso" href="CrearProducto.jsp">Ingresar Nuevo Producto</a>

        <% DALSede BOSede = new DALSede(); %>      

        <table border="1" class="tablaLista">
                <tr>
                    <th>Categoria</th>
                    <th>Codigo</th>
                    <th>Descripcion </th>
                    <th>Fecha Ingreso</th>
                    <th>Precio</th>
                    <th>Estado</th>
                    <th>Modificar</th>
                    <th>Stock</th>
                </tr>  
                <%for (Producto e : miProducto.getAll()) {%>
                <tr>    
                    <%for (Categoria c : micategoria.getAll()) {%>
                    <%if (c.getIdCategoria() == e.getIdCategoria()) {%>
                    <td class="tdCentro"><%=c.getDescripcion()%></td>
                    <%}}%>
                    <td class="tdCentro"><%=e.getCodproducto()%></td>
                    <td class="tdIzq" id="nomProducto"><%=e.getNomproducto()%></td>
                    <td class="tdCentro"><%=fmtFecha.format(e.getFechaingreso())%></td>
                    <td class="tdCentro"style="text-align: right;"><%=fmtMonto.format(e.getPrecio())%></td>

                    <% String estadoProd = "";

                        if (e.getEstado().equals('V')) {
                            estadoProd = "ACTIVO";
                        } else {
                            estadoProd = "INACTIVO";
                        }
                    %>  

                    <td class="tdCentro"><%= estadoProd%></td>
                    <td class="tdCentro"><input class="boton" id="<%=e.getCodproducto()%>" type="button" onclick="editarProducto(this.id);" value="Editar"></td>
                    <td class=""tdCentro><a href="ServletStock?cod=<%=e.getCodproducto()%>">Consultar</a></td>
                </tr>
                <%}%>
        </table>
    </center>
   <%}%>         
</body>
</html>
