<%-- 
    Document   : reporte
    Created on : 27/08/2015, 01:01:45 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection con = sql.conectar();
    PreparedStatement ps = con.prepareStatement("call verReporte(?)");
    ps.setInt(1, Integer.parseInt(request.getParameter("id")));
    ResultSet rs = ps.executeQuery();
    String titulo="", cuerpo="", fecha="", usuario="" ,grave="";
    int id=0, idUsuario = 0, gravedad=0;
    while(rs.next()){
        id = rs.getInt(1);
        titulo = rs.getString(2);
        cuerpo = rs.getString(3);
        idUsuario = rs.getInt(4);
        gravedad = rs.getInt(5);
        fecha = rs.getString(6);
    }
    PreparedStatement ps2 = con.prepareStatement("call getUsername(?)");
    ps2.setInt(1, idUsuario);
    ResultSet rs2 = ps2.executeQuery();
    while(rs2.next()){
        usuario = rs2.getString(1);
    }
    switch(gravedad){
        case 1:
        {
            grave = "<h1 style='color: darkgreen'>Gravedad baja</h1>";
            break;
        }
        case 2:
        {
            grave = "<h1 style='color: darkorange'>Gravedad media</h1>";
            break;
        }
        case 3:
        {
            grave = "<h1 style='color: darkred'>Gravedad alta</h1>";
            break;
        }
    }
        
%>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/code.jquery.com_jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="../css/bootstrap/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <script src="../js/muestra.js"></script>
       <title>Reporte</title>
    </head>
    <body>
       <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
            <h1><%=titulo%><small> para: <%= usuario %></small></h1>
            <%= grave %>
            <p>
            <h2>Cuerpo:</h2>
            <h3><%= cuerpo %></h3>
            </p>
            
            <h4 style="color: whitesmoke">Fecha: <small><%=fecha%></small></h4>
        </section>
    </body>
</html>
