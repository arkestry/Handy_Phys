<%-- 
    Document   : mis_preguntas
    Created on : 7/08/2015, 11:38:53 PM
    Author     : ivan-hdz
--%>

<%@page import="beans.userBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Mis Preguntas</title>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
    </head>
    <%
        int idUser = ((userBean)session.getAttribute("userData")).getIdUsuario();
        Connection con = sql.conectar();
        PreparedStatement ps = con.prepareStatement("select * from mostrararticulos where idTipoCont=2 and idUsuario = ?");
        ps.setInt(1, idUser);
        ResultSet rs = ps.executeQuery();
        
        PreparedStatement ps1 = con.prepareStatement("call misComentarios(?)");
    %>
    <body id="mis_preguntas">
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
            <section class="bg bgMisPreg"></section>
            <section id="quest_panel">
                <div class="container-fluid">
                    <h2 class="text-center">
                        Mis Preguntas <a href="hacer_pregunta.jsp"><button class="btn boton"><span class="glyphicon glyphicon-cloud-upload"></span></button></a>
                    </h2>
                </div>
                <section id="pregunta">
                    <% while(rs.next()){ 
                        ps1.setInt(1, rs.getInt(1));
                        ResultSet rs1 = ps1.executeQuery();

                    %>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <form action="pregunta.jsp" method="GET">
                            <input type="hidden" name="idUsuario" value="<%= rs.getObject("idUsuario")%>">
                            <input type="hidden" name="nickname" value="<%= (String)rs.getObject("nickname")%>">
                            <input type="hidden" name="titulo" value="<%=(String)rs.getObject("Titulo") %>">
                            <input type="hidden" name="fecha" value="<%=(String)rs.getObject("fecha")%>">
                            <input type="hidden" name="idArticulo" value="<%= rs.getObject("idArticulo") %>">
                            <input type="hidden" name="nombreArchivo" value="<%= rs.getString("url") %>">
                            <input type="hidden" name="tipoCont" value="2">   
                            <button type="submit" class=" h3" style="background: none; border: none; color: #141414"><%=rs.getString(3) %></button>

                             </form>
                        </div>
                        <div class="panel-body">
                            <%while(rs1.next()){%>
                            <form action="pregunta.jsp" method="GET">
                            <input type="hidden" name="idUsuario" value="<%= rs.getObject("idUsuario")%>">
                            <input type="hidden" name="nickname" value="<%= (String)rs.getObject("nickname")%>">
                            <input type="hidden" name="titulo" value="<%=(String)rs.getObject("Titulo") %>">
                            <input type="hidden" name="fecha" value="<%=(String)rs.getObject("fecha")%>">
                            <input type="hidden" name="idArticulo" value="<%= rs.getObject("idArticulo") %>">
                            <input type="hidden" name="nombreArchivo" value="<%= rs.getString("url") %>">
                            <input type="hidden" name="tipoCont" value="2">   
                            <button type="submit" style="background: none; border: none; color: #141414">Respuestas</button><span class="badge"><%=rs1.getString(7) %></span>
                            </form>
                            <%}%>
                        </div>
                        <div class="panel-footer">
                            <h5 id="quest_date">
                                <%= rs.getString(4) %>
                            </h5>
                        </div>
                    </div>
                    <% 
                    }%>
                </section>
            </section>
        </section>
    </body>
</html>





