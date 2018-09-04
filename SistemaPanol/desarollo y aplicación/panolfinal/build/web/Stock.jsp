<%-- 
    Document   : Stock
    Created on : 11-06-2016, 20:39:19
    Author     : Miguel Pasten
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SedeDAO"%>
<%@page import="Entidad.Sede"%>
<%@page import="DAL.DALSede"%>
<%@page import="BO.BOstock"%>
<%@page import="Entidad.Stock"%>
<%@page import="DAO.StockDAO"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="Entidad.Producto"%>
<%@page import="DAL.DALProducto" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css"> 
        <link rel="stylesheet" type="text/css" href="Styless/EstiloListar.css"> 
        <title>Listado de Solicitudes </title> 
        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));
                DAO.SedeDAO miSede = new DAO.SedeDAO();
                BO.BOstock miStock = new BOstock(); %>     
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center id="contenedor">           
        <% String codigo = "";%>
        <% char estado = 'F';%>
        <% codigo = session.getAttribute("miProducto").toString(); %>         

        <%DAO.ProductoDAO miProducto = new ProductoDAO(); %>

        <%for (Producto c : miProducto.getAll()) {%>
        <%if (c.getCodproducto().equals(codigo)) {
                estado = c.getEstado();%>

        <h1><%=c.getNomproducto()%></h1>
        <h2>Codigo: <%=c.getCodproducto()%></h2>
        <%}
            }%>

        <%if (estado == 'V') {%>

        <%int prestamo = 0, saldo = 0; %>

        <table class="tablaLista" border="0">
            <tr>
                <th>Sede</th>
                <th>Stock Minimo</th>
                <th>Stock Maximo</th>
                <th>Prestamos</th>
                <th>Disponible</th>
            </tr>         
            <tr>                  
                <%for (Stock st : miStock.listadoStock()) { %>
                <%if (st.getProductoCodproducto().equals(codigo)) {%>    
                <%for (Sede s : miSede.getAll()) {%>
                <%if (s.getIdSede() == st.getProductoSedeIdSede()) {%>
                <td class="tdIzq"><%=s.getNomsede()%></td>
                <%}
                    }%>
                <td class="tdCentro"><%=st.getMinstock()%></td>
                <td class="tdCentro"><%=st.getMaxstock()%></td>

                <td class="tdCentro"><%=st.getPrestamostock()%></td>
                <td class="tdCentro"><%=st.getSaldostock()%></td>  

                <% prestamo = prestamo + st.getPrestamostock(); %>
                <% saldo = saldo + st.getSaldostock(); %>                   
                <%}%>
            </tr>
            <%}%>
            <tr>
                <td class="pieTotal" colspan="3" style="text-align: Left;">TOTAL GENERAL</td>
                <td class="pieTotal" style="text-align: center;"><%= prestamo%></td>
                <td class="pieTotal" style="text-align: center;"><%= saldo%></td>
            </tr>
        </table>
        <br>
        <a href="ListaProducto.jsp" style="font-size: 20px;">Volver al Listado de Productos</a><br>
        <a href="ingresarStock.jsp" style="font-size: 20px;">Ingreso de Stock</a><br>
        <%} else {%>
        <br><br>
        <h3>Producto Inactivo no tiene Stock</h3>
        <a href="ListaProducto.jsp" style="font-size: 20px;">Volver al Listado de Productos</a>
        <%}%>
    </center>
    <%}%>
</body>
</html>
