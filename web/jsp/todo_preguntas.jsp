<%-- 
    Document   : todo_preguntas
    Created on : 30/06/2015, 09:10:57 PM
    Author     : ivan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>TODO Preguntas</title>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="./js/jquery-1.11.3.min.js"></script>
        <script src="../css/bootstrap/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
         <%
            Connection con = sql.conectar();
            PreparedStatement ps = con.prepareStatement("select * from mostrararticulos where idTipoCont=2");
            ResultSet rs = ps.executeQuery();
           
        %>
        
    </head>
    <body>
       <!--encabezado-->
        <div class="page-header">
            <h1 class="text-center todo_tit">
                Preguntas
                <% if(!session.getAttribute("tipo").equals("Anonimo")) {%>
                    <a href="../pages/hacer_pregunta.html"><span class="glyphicon glyphicon-upload"></span></a>
                <% } %>
            </h1>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                            Filtrar Por...
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Fecha de Publicacion</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mas Visitado</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mas Comentado</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mejor Calificado</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
           <div class="todo">
            <!--pregunta1-->
            <%while(rs.next()){ %>
            <form action="pregunta.jsp" method="POST">
               <div class="panel panel-default">
                <div class="panel-heading slim_panHead">
                    <h3>
                        <button type="submit" style="background: none; border: none"><%=(String)rs.getObject("Titulo") %></button>
                        <input type="hidden" name="idUsuario" value="<%= rs.getObject("idUsuario")%>">
                        <input type="hidden" name="nickname" value="<%= (String)rs.getObject("nickname")%>">
                        <input type="hidden" name="titulo" value="<%=(String)rs.getObject("Titulo") %>">
                        <input type="hidden" name="fecha" value="<%=(String)rs.getObject("fecha")%>">
                        <input type="hidden" name="idArticulo" value="<%= rs.getObject("idArticulo") %>">
                        <input type="hidden" name="nombreArchivo" value="<%= rs.getString("url") %>">
                        <input type="hidden" name="tipoCont" value="2">               

                        <a></a>&nbsp;
                        <!--los labels cambiaran según sea el caso, estan todos solo de forma representativa--> 
                        <span class="label label-info"> Pregunta reciente

                        </span>&nbsp;
                        <!--span class="label label-success"> Pregunta ya contestada

                        </span-->&nbsp;
                        <span class="label label-warning"> Pregunta en espera de ser contestada

                        </span>
                    </h3>
                </div>
                
                <div class="panel-footer">
                    <h5 id="quest_date">
                        <a class="mostrarlink">
                            Respuestas
                        </a>
                        <span class="badge">
                            43
                        </span>
                        &nbsp;

                        <b><%=(String)rs.getObject("fecha")%></b>
                    </h5>
                </div>
            </div>
            </form>
            <%}%>
             
        </div>
        <footer>
            <hr size="5px" width="90%" align="center" color="black"/>
            <a href="http://getbootstrap.com/" target="body">Powered by Bootstrap</a>
            <a href="#">Contenido del sitio 2015© &nbsp;&nbsp; Ibex® de México   --  Desarrollado por IBEX </a>
           <a href="#">Politicas de uso</a>
        </footer>
    </body>
</html>









































<!--
/rdY/rS0VqFyWK56rFDf/rSiDRd6Dq61WTdfDTycr161eaDfDTTyWK5WAq61WTd56TTyWK5TDq61WTD/6F6yDYaf/rSi/r/Y/rSiAldr/rSiqyaRDR/8/rSiuq61WTM5RLarAl//6aAyWK5ar261WT05/rSiqTGUAq61WTDa/rSi/rS1rRRa6lDqAqoU6161W261eq61WTx5/rSi6FyTr161WTRrAl//RT=yWK5ArlSyWFTyWTTyWK7yWK7yWK7yWK7yWK7yWK7yWK7yWK5eAR85/rSirTGADROyWK5rD6/56lD/A6jyWTTyWYyAAR/qAq61WTRdr6aeR6RW/rSiq2jyWTTyWYySDR/eA6oTDROyWK5/RLae/rSir1jyWTaUR6RuDRWyWK70dX61WTDa/rSir6a8r161WTDarX61WYSiWr6yWK55/rSirTar/rSiW16ZArTjqaSyWK7yWTT9Vq6ZDA44
-->