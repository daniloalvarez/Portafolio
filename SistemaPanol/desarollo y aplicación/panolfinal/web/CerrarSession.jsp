<%-- 
    Document   : CerrarSession
    Created on : 20-jun-2016, 4:14:57
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Sesion Cerrada</title>
        <%session.invalidate();
            session = request.getSession(false);
        %>
    </head>
    <body>
    <center>
        <div style="margin-top: 150px;">  
            <h1>Se a cerrado la Sesion Correctamente!!</h1>
            <br>
            <a href="index.html" style="font-size: 23px;">Iniciar Sesion</a>
        </div>
    </center>
</body>
</html>
