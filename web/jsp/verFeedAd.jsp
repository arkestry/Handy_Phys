<%-- 
    Document   : verFeedAd
    Created on : 08-jul-2015, 22:09:14
    Author     : Luis Enrique
--%>

<%@page import="java.sql.ResultSet"%>
 <%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html lang="es">
 
<head>
<title>Feedback detalle</title>
<meta charset="utf-8" />
<link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../css/bootstrap/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
         <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
</head>
<body>
    <div>  
        <h1><center>Reporte de feedback detallado</center></h1>
        <hr>
          <%
             Connection con = sql.conectar();
             ResultSet rs; 
             ResultSet rs2;
             String userName=request.getParameter("username");
             int idFeed;
             int idUser;
             String contenido;
             idFeed=Integer.parseInt(request.getParameter("idFeed"));
             PreparedStatement ps=con.prepareStatement("call getFeedContenido(?)");
             ps.setInt(1, idFeed);
             rs=ps.executeQuery();
             while(rs.next()){
                idUser=Integer.parseInt(rs.getString("idUsuario"));
                contenido=rs.getString("contenidoFB");
                PreparedStatement ps2=con.prepareStatement("call getUsername(?);");
                ps2.setInt(1,idUser);
                rs2=ps2.executeQuery();
                while(rs2.next()){
                userName=rs2.getString("nickname");
        %>
        <h2><label><%=userName%></label></h2>
        <p class="feedLetra"><%=contenido%></p>
    </div>
    
    <%  }
             }
             %>
             <button onclick="window.location.href = 'admin_feedback.jsp'" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span> Volver</button>
   
</body>
</html>