<%-- 
    Document   : admin_SPS
    Created on : 11/06/2015, 04:17:23 PM
    Author     : ivan
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="classes.sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
SPS = Second Per Second
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
    </head>
    <body>
        <%!  Connection con=null; %>
        <% response.setIntHeader("Refresh", 5);
    sql c = new sql();
   Connection con = c.conectar();
   PreparedStatement ps=con.prepareStatement("select * from getweblog");
   ResultSet rs=ps.executeQuery();
    %>
        <h1>REGISTRO DE ACTIVIDAD<small> Segundo a Segundo</small></h1>
        <section>
            <section style="width: 3%; float: left; display: table-cell; padding: 1em">
                <button class="btn btn-success"><span class="glyphicon glyphicon-play"></span></button><br><br>
            <button class="btn btn-danger"><span class="glyphicon glyphicon-stop"></span></button>
            </section>
            <section style="width: 94%; float: left; display: table-cell">
            <table class="tablaAdmin">
                <tr>
                    <th>Acción</th>
                    <th>Descripción</th>
                    <th>Fecha-Hora</th>
                </tr>
                <%
                   
   while (rs.next()){
       out.println("<tr><td class='"+rs.getString("ta").toLowerCase()+"'>"+rs.getString("ta")+"</td>"
               + "<td>'"+rs.getString("desc")+"'</td><td>"+rs.getString("ht")+"</td></tr>");
   }
   try{
      con.close();
   }catch(Exception e){
       e.printStackTrace();
   }
   %>
            </table>
        </section>
        </section>
    </body>
</html>