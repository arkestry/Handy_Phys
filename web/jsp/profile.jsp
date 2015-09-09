<%-- 
    Document   : profile
    Created on : 10/08/2015, 01:53:19 PM
    Author     : ivan-hdz
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.userBean"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String correo = request.getParameter("correo");
    Connection con = sql.conectar();
    PreparedStatement ps = con.prepareStatement("call getDatosUser(?)");
    ps.setString(1, correo);
    ResultSet rs = ps.executeQuery();
    String userName="", fullName="", group="", instit="", unidad="", tipo="", image="";
    while(rs.next()){
        userName=rs.getString(2);
        tipo=rs.getString(3);
        instit = rs.getString(4);
        fullName =rs.getString(6);
        unidad=rs.getString(7);
        image=rs.getString(8);
    }
    PreparedStatement ps2 = con.prepareStatement("call getGrupo(?)");
    ps2.setString(1, correo);
    ResultSet rs2 = ps2.executeQuery();
    while(rs2.next()){
        group = rs2.getString(1);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mi Perfil</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
       <link rel="stylesheet" href="../css/estilo_menu.css">
       <script src="../js/muestra.js" type="text/javascript"></script>
        
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont text-center">
            <section class="bg bgprofile"></section>
            <center><section id="cabezaP" >
            <center><label id="userPic"><img style="width: 120px; height: 120px" src="../images/profileImages/<%= image %>" alt="Imagen de perfil"></label></center>
            <h1 id="usuario"><%=userName%> <small>Mi Perfil</small></h1>
            </section></center>
        <section id="datosP">
            <h3>Nombre completo: </h3><p id="nombre"><%=fullName%></p>
           <%if(session.getAttribute("tipo").equals("Alumno")){ %>
            <h3>Grupo: </h3><p id="grupo"><%=group%></p>
            <%}%>
            <h3>Correo electronico:</h3><p id="email"><%=correo%></p>
            <h3>Institucion educativa </h3><p id="instituto"><%=instit%></p>
            <%if(session.getAttribute("tipo").equals("Profesor")){ %>
            <h3>Unidad academica: </h3><p id="unidadAc"><%=unidad %></p>
            <%}%>
            <button class="btn btn-danger" onclick="window.location.href = 'nuevo_reporte.jsp'">Reportar usuario <span class="glyphicon glyphicon-alert"></span></button>
        </section>
        
        <br>
        <br>
        
        </section>
    </body>
</html>

