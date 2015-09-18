<%-- 
    Document   : admin_reporte
    Created on : 13/08/2015, 08:51:39 PM
    Author     : ivan-hdz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection con = sql.conectar();
    PreparedStatement ps = con.prepareStatement("call getReporteTODO()");
    ResultSet rs = ps.executeQuery();
    String[] gravedad={"","rp-gravedad-alta","rp-gravedad-media","rp-gravedad-baja"};
    %>
<html>
    <head>
        <title>Reporte Usuarios</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=RobotoCondensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>  
        <script src="../js/ajax_call.js"></script>  
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <style>
            html,body{
                height:100%;
                background-color: #FFFFFF;
            }
        </style>
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
            </section>
            <div style="width: 100%;height: 28px;"></div>
            <section class="container container-adm">
                    <div class="row row-adm">
                        <div class="col-xs-3 xs-3 no-float">
                        <div class="list-group lista repo-back">
                        <%
                        String correo = "";
                        while(rs.next()){ 
                            String cuerpo=rs.getString("cuerpo");
                            String titulo=rs.getString("titulo_reporte");
                            int idr=rs.getInt("id");
                            int id_gr=rs.getInt("id_gravedad");
                           correo = rs.getString("idDatos");
                        
                        
                        %>
                        <a class="list-group-item rep-button <%=""+gravedad[id_gr]%>" id="<%=idr%>">
                                <h4 class="list-group-item-heading"><%=titulo%></h4>
                                <p class="list-group-item-text"><%=cuerpo%></p>
                                <%=gravedad[id_gr]%>
                            </a>
                        
                        <% } %>
                    </div>
                    </div>
                    <div class="col-xs-9 xs-9 no-float repo-back">         
                        <h1 class="text-center title-admn-head">Reportes de Usuarios</h1>
                         <hr style="color:#141414">             
                         <div class="panel panel-primary repo-panel">
                             <div class="panel-heading fdb-head-panel" id="bodyrepo">
                                <h3 class="text-left fdb-head-panel" id="repo-title">Seleccione un reporte a revisar</h3>   
                                <label>Usuario Reportado: </label>
                                <a href="profile.jsp?correo=<%= correo %>"><h4 class="text-left" id="usr"></h4></a>
                             </div>
                             <div class="panel-body">
                                <p  class="text-fdb-body" id="repo-body"></p>
                             </div>
                             <div class="panel-footer time-fdb-body" id="fecha">
                                 
                             </div>
                                </div>  
                    </div>
        </section>
    </body>
</html>
