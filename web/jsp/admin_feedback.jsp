<%-- 
    Document   : admin_feedback
    Created on : 08-jul-2015, 22:08:23
    Author     : Luis Enrique
--%>


<%@page import="java.sql.ResultSet"%>
 <%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
 
<html lang="es">
 
<head>
<title>Reporte feedback</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/estilo_menu.css">
<script src="./js/jquery-1.11.3.min.js"></script>
<script src="../js/muestra.js" type="text/javascript"></script>
</head>
<body>
    <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
    </section>
    <section class="integrarCont">
    <h1><center>Reportes de Feedback</center></h1>
    <hr>
      <%
             Connection con = sql.conectar();
             ResultSet rs;
             ResultSet rs2;    
             int idUser;
             int idFeed;
             String fecha;
             String userName;
             PreparedStatement ps=con.prepareStatement("call getAllFeed();");
             rs=ps.executeQuery();
             while(rs.next()){
                 idFeed=Integer.parseInt(rs.getString("idFeedback"));
                fecha=rs.getString("fecha");
                idUser=Integer.parseInt(rs.getString("idUsuario"));
                PreparedStatement ps2=con.prepareStatement("call getUsername(?);");
                ps2.setInt(1, idUser);
                rs2=ps2.executeQuery();
                while(rs2.next()){
                userName=rs2.getString("nickname");
        %>
        <form action="verFeedAd.jsp" method="GET">
                <ul class=" list-unstyled">
                    <li class="cajitaFeed">
                        <label name="username"> <%=userName%></label>     
                            <label name="fecha"><%=fecha%></label>       
                            <input name="idFeed" value="<%=idFeed%>" type ="hidden">
                            <button class="btn btn-success" >Leer Feedback</button>
                        </li>
                  </ul>
        </form>
            <%}
        }%>
    </section>
</body>
</html>