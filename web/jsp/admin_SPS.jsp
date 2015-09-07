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

<!DOCTYPE html>
<!--
SPS = Second Per Second
-->
<html>
    <head>
        <title>Segundo a Segundo</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
    </head>
    <body>
        <%!  Connection con=null; %>
        <% 
    sql c = new sql();
   Connection con = c.conectar();
   PreparedStatement ps=con.prepareStatement("select * from getweblog");
   ResultSet rs=ps.executeQuery();
    %>
        
            <table class="tablaAdmin">
                <tr>
                    <th><h3>Acción</h3></th>
                    <th><h3>Descripción</h3></th>
                    <th><h3>Fecha-Hora</h3></th>
                </tr>
                <%
                   
   while (rs.next()){
       out.println("<tr><td class='"+rs.getString("ta").toLowerCase()+"'>"+rs.getString("ta")+"</td>"
               + "<td>"+rs.getString("desc")+"</td><td>"+rs.getString("ht")+"</td></tr>");
   }
   try{
      con.close();
   }catch(Exception e){
       e.printStackTrace();
   }
   %>
            </table>
       
    </body>
</html>