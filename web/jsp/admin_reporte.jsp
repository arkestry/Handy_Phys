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
    PreparedStatement ps = con.prepareStatement("select * from ver_reportes");
    ResultSet rs = ps.executeQuery();
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
         <link rel="stylesheet" href="../css/estilo_menu.css">
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
            <h1 class="text-uppercase text-center">REPORTE DE USUARIOS</h1>
            <h5 style="background-color: darkred">ALTA GRAVEDAD: 3</h5>
            <h5 style="background-color: darkorange">MEDIA GRAVEDAD: 2</h5>
            <h5 style="background-color: darkgreen">BAJA GRAVEDAD: 1</h5>
            <br><br>
            
            <section>
                <table class="tablaAdmin" style="border-left: 7px solid #22A7F0">
                    <tr>
                        <th>Titulo del reporte</th>
                        <th>Gravedad</th>
                        <th>Usuario Reportado</th>
                        <th>Fecha</th>
                        <th>Acciones</th>
                    </tr>
                <%while(rs.next()){ %>
                    <tr>
                    
                        <td><%=rs.getString(2) %></td>
                        <td><%=rs.getString(5) %></td>
                        <td><%=rs.getString(4) %></td>
                        <td><%=rs.getString(6) %></td>
                        <td>
                            <form method="GET" action="reporte.jsp">
                                <input type="hidden" name="id" value="<%= rs.getInt(1) %>">
                                <input value="VER" type="submit" class="btn btn-success">
                            </form>
                            
                        </td>
                    </tr>
                <% }%>
                </table>
            </section>
             
        </section>
    </body>
</html>
