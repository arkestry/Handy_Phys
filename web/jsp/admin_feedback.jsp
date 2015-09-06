    
    
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
    
<!DOCTYPE html>
    
    <html lang="es">
    
    <head>
        <title>Reporte feedback</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js" type="text/javascript"></script>
        <script src="../js/ajax_call.js" type="text/javascript"></script>
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
            </section>
            <section class="integrarCont">
                <h1><center>Reportes de Feedback</center></h1>
                <hr>
                <div class="container">
                    <div class="contenedorfeeds">
                        <table class="wrap_feed">
                            <tr>
                                <td class="avisos">
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
                                    <button type="button" class="list-group-item fdb" value="<%=idFeed%>"><%=userName%>|<%=fecha%>|</button>
                                    <%}
        }%>
                                </div>
                            </td>
                            <td class="medio">
                            </td>
                            <td class="cuerpo">
                                <div class="bodyfeed">

                                </div>
                                <button id="button-ajax"></button>
                            </td>
                        </tr>
                </table>
            </div>
        </section>
    </body>
</html>