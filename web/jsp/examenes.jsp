<%-- 
    Document   : examenes
    Created on : 28/07/2015, 03:03:00 PM
    Author     : ivan-hdz
--%>

<%@page import="beans.userBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    userBean usuario = (userBean)session.getAttribute("userData");
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
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
            <%
                if(!session.getAttribute("tipo").equals("Anonimo")){ %>
            <button id="btnPaSubir" class="btn btn-block btn-primary">Subir un examen</button>
            <section id="subirExamen" style="display: none">
                <form class="subirExamen form-inline" method="POST" action="../servlets/generarHTML" enctype="multipart/form-data">
                    <section class="col-md-12">
                        <label class="col-md-1"  for="titulo">TITULO: </label>
                        <section class="col-md-10">
                            <input class="form-control" type="text" size="180" name="title" style="border-radius: 5px; color: #141414">
                        </section>
                    </section>
                    <input style="display: inline; margin-left: 5em; margin-right: 5em" type="file" name="file">

                    <input  type="submit" class="btn btn-lg btn-success" value="Subir">
                </form>
            </section>
            <%}%>
            <h1 class="text-center">Examenes</h1>
            <section class="examenesContent container">
            <table class="table table-striped table-responsive">
                <tr>
                    <th>Titulo del examen</th>
                    <th>Autor</th>
                    <th>Fecha de publicacion</th>
                    <th>Valoracion</th>
                    <th>Acciones</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(8) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                    <td>
                        <a href="../examenes/<%=rs.getString(7)%>"><button style="position: relative; top: 0.5em" class="btn btn-info" type="button">Descargar</button></a>
                        <% if(usuario.getIdUsuario() == rs.getInt(2) || session.getAttribute("tipo").equals("Administrador")){ %>
                        <form onsubmit="return really(this)" action="../servlets/borrarHTML">
                            <input type="hidden" value="<%= rs.getInt(1) %>" name="idArticulo">
                            <input type="hidden" value="3" name="tipoCont">
                            <input type="submit" class="btn btn-danger" style="display: inline; float: right; position: relative; top: -1.85em" value="Eliminar Examen">
                        </form>
                        <% }%>
                        <form action="../servlets/valorar" method="POST">
                            <input type="hidden" value="<%= rs.getInt(1) %>" name="idArticulo">
                            <input type="hidden" value="3" name="tipoCont">
                            <input id="valor" type="hidden" name="valor">
                            <section style="position: relative; display: inline; top: 1em" id="stars">
                                <label class="text-uppercase text-warning" for="stars">Valorar
                                    <span name="s1" id="s1" class="glyphicon glyphicon-star-empty"></span>
                                    <span name="s2" id="s2" class="glyphicon glyphicon-star-empty"></span>
                                    <span name="s3" id="s3" class="glyphicon glyphicon-star-empty"></span>
                                    <span name="s4" id="s4" class="glyphicon glyphicon-star-empty"></span>
                                    <span name="s5" id="s5" class="glyphicon glyphicon-star-empty"></span></label>
                            </section>
                        </form>
                        
                        
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </section>
        </section>
    </body>
</html>
