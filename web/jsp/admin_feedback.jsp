    
    
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
    
<!DOCTYPE html>
    
<html lang="es">
    
    <head>
        <title>Reporte feedback</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" media="screen" title="no title" charset="utf-8">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js" type="text/javascript"></script>
        <script src="../js/ajax_call.js" type="text/javascript"></script>
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
        <div style=" height: 28px"></div>
        <div class="container container-adm">
            <div class="row row-adm">
                <div class="col-xs-3 xs-3 no-float">
                    <div class="list-group lista">
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
                                    <button type="button" class="list-group-item fdb " value="<%=idFeed%>"><%=userName%>|<%=fecha%></button>
                                    <%}
        }%>
                    </div>
                </div>
                <div class="col-xs-9 xs-9 no-float">
                    
                    <h1 class="text-center title-admn-head">Feedback</h1>
                    <hr style="color:#141414">
                    <div class="panel panel-primary repo-panel">
                        <div class="panel-heading fdb-head-panel">
                            <h2 class="panel-title title-fdb-head" id="usr">Reporte a revisar</h2>
                        </div>
                        <div class="panel-body">
                            <p id="repo-title" class="text-fdb-body"></p>
                        </div>
                        <div class="panel-footer time-fdb-body" id="fecha">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>      
    </body>
</html>