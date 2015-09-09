<%-- 
    Document   : todo_simulExam
    Created on : 4/08/2015, 07:44:00 PM
    Author     : ivan-hdz
--%>

<%@page import="beans.userBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Simulador de Examen</title>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>  
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script>
        function really(formu){
                if(confirm('En verdad desea eliminar este examen?') === true){
                    formu.submit();
                    return true;
                }else{
                    return false;
                }
        }
        </script>
    </head>
    <%
        Connection con = sql.conectar();
        PreparedStatement ps = con.prepareStatement("select * from ver_Simulador");
        ResultSet rs = ps.executeQuery();
    %>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
            <section class="bg bgsimul"></section>
        <h1 class="text-uppercase text-center">SIMULADOR DEL EXAMEN 
        <% if(session.getAttribute("tipo").equals("Profesor")){ %>
        <a href="nuevo_examen.jsp"><button class="btn boton btn-sm"><span class="glyphicon glyphicon-cloud-upload"></span></button></a>
        <%}%>
        </h1>
        
        
        <section style="width: 93%; height: 100%; margin: 3em">
            <table class="table table-condensed table-responsive" style="border: none">
                <tr style="border: solid 1px white ;background-color: #141414; color: whitesmoke; color: #141414; opacity: .8">
                    <th style="color: whitesmoke">Titulo</th>
                    <th style="color: whitesmoke">Descripcion</th>
                    <th style="color: whitesmoke">Parcial</th>
                    <th style="color: whitesmoke">Unidad Academica</th>
                    <th style="color: whitesmoke">Fecha</th>
                    <th style="color: whitesmoke">Autor</th>
                    <th style="color: whitesmoke">Acciones</th>
                </tr>
                <% while(rs.next()){ %>
                <tr>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                    <td><%= rs.getString(6) %></td>
                    <td><%= rs.getString(7) %></td>
                    <td>
                        <% if(((userBean)session.getAttribute("userData")).getUserName().equals(rs.getString(7)) || session.getAttribute("tipo").equals("Administrdor")){%>
                        <form onsubmit="return really(this)" action="../servlets/borrarHTML" method="POST">
                            <input type="hidden" value="<%= rs.getInt(1) %>" name="idArticulo">
                            <input type="hidden" value="4" name="tipoCont">
                            <input type="submit" class="btn btn-danger btn-sm" style="display: inline; float: right; position: relative;" value="Eliminar">
                        </form>
                       <%}%>
                        <form action="verSimulador.jsp" method="GET">
                            <input name="archivo" type="hidden" value="<%= rs.getString(9)%>">
                            <input name="idSimulador" type="hidden" value="<%= rs.getString(1)%>">
                            <input type="submit" value="Realizar" class="btn btn-success btn-sm">
                            <input name="num" value="0" type="hidden" >
                            <input name="titulo" type="hidden" value="<%= rs.getString(2) %>">
                        </form>
                        
                    </td>
                </tr>
                <% } %>
            </table>
        </section>
         
        </section>
    </body>
</html>
