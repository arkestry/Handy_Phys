<%-- 
    Document   : examenes
    Created on : 28/07/2015, 03:03:00 PM
    Author     : ivan-hdz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = sql.conectar();
    PreparedStatement ps = con.prepareStatement("select * from mostrararticulos where idTipoCont = 3;");
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Examenes</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
    </head>
    <body>
        <button id="btnPaSubir" class="btn btn-block btn-primary">Subir un examen</button>
        <section id="subirExamen" style="display: none">
            <form class="subirExamen" method="POST" action="../servlets/generarHTML" enctype="multipart/form-data">
                <label  for="titulo">Titulo</label>
                <input  type="text" size="50" name="title" style="border-radius: 5px; color: #141414">
                <input style="display: inline; margin-left: 5em; margin-right: 5em" type="file" name="file">
                
                <input  type="submit" class="btn btn-lg btn-success" value="Subir">
            </form>
        </section>
        <h1 class="text-center">Examenes</h1>
        <section class="examenesContent container">
            <table class="table table-striped table-responsive">
                <tr>
                    <th>Titulo del examen</th>
                    <th>Autor</th>
                    <th>Fecha de publicacion</th>
                    <th>Valoracion</th>
                    <th>Descargar</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(8) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                    <td><a href="../examenes/<%=rs.getString(7)%>"><button class="btn btn-info" type="button">Descargar</button></a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </section>
    </body>
</html>
