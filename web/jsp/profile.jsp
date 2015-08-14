<%-- 
    Document   : profile
    Created on : 10/08/2015, 01:53:19 PM
    Author     : ivan-hdz
--%>
<%@page import="beans.userBean"%>
<%
    userBean usuario = (userBean)session.getAttribute("userData");
    String urlImage = "../images/profileImages/"+usuario.getProfilePict();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <center><section id="cabezaP" >
            <center><label id="userPic"><img style="width: 120px; height: 120px" src="<%= urlImage %>" alt="<%= usuario.getProfilePict() %>"></label></center>
            <h1 id="usuario"><%=usuario.getUserName() %> <small>Mi Perfil</small></h1>
            </section></center>
        <section id="datosP">
            <h3>Nombre completo: </h3><p id="nombre"><%=usuario.getFullName() %></p>
            <h3>Grupo: </h3><p id="grupo"><%=usuario.getGrupo() %></p>
            <h3>Correo electronico:</h3><p id="email"><%=usuario.getEmail() %></p>
            <h3>Institucion educativa </h3><p id="instituto"><%=usuario.getInstitucion() %></p>
            <%if(session.getAttribute("tipo").equals("Profesor")){ %>
            <h3>Unidad academica: </h3><p id="unidadAc"><%=usuario.getUnidadAcademica() %></p>
            <%}%>
            <button class="btn btn-danger" onclick="window.location.href = '../pages/nuevoReporte.html'">Reportar usuario <span class="glyphicon glyphicon-alert"></span></button>
        </section>
        
        <br>
        <br>
        
        </section>
    </body>
</html>

