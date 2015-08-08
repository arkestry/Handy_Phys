<%-- 
    Document   : todo_articulos
    Created on : 29/06/2015, 04:02:10 PM
    Author     : ivan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.sql"%>

<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Untitled Document</title>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../css/bootstrap/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
        <%
            Connection con = sql.conectar();
            PreparedStatement ps = con.prepareStatement("select * from mostrararticulos where idTipoCont=1");
            ResultSet rs = ps.executeQuery();
           
        %>
        
    </head>
    <body>
        <section class="bg bgart"></section>
        <article>
            <div class="page-header">
                <h1 class="text-center todo_tit">
                    Articulos
                    <% if(!session.getAttribute("tipo").equals("Anonimo")) {%>
                    <a href="../pages/nuevo_articulos.html"><span class="glyphicon glyphicon-upload"></span></a>
                    <% } %>
                </h1>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="dropdown">
                        <button class="btn btn-default" type="button" id="dropdownMenu1">
                            Filtrar Por...
                            <span class="caret"></span>
                        </button>
                        <section id="filtroArt" style="display: none">
                            <ul class="list-unstyled list-group-item text-uppercase">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Fecha de Publicacion</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mas Visitado</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mas Comentado</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mejor Calificado</a></li>
                        </ul>
                        </section>
                    </div>
                </div>
            </div>
        </article>
        <div class="todo">
            <div class="row">
                <%while(rs.next()){ %>
                <form action="articulo.jsp" method="POST">
                <div class="col-sm-6 col-md-4" >
                    <div class="thumbnail">
                        <div class="caption">
                            <h3><%=(String)rs.getObject("Titulo") %></h3>
                            <input type="hidden" name="idUsuario" value="<%= rs.getObject("idUsuario")%>">
                            <input type="hidden" name="nickname" value="<%= (String)rs.getObject("nickname")%>">
                            <input type="hidden" name="titulo" value="<%=(String)rs.getObject("Titulo") %>">
                            <input type="hidden" name="fecha" value="<%=(String)rs.getObject("fecha")%>">
                            <input type="hidden" name="idArticulo" value="<%= rs.getObject("idArticulo") %>">
                            <input type="hidden" name="nombreArchivo" value="<%= rs.getString("url") %>">
                            <input type="hidden" name="tipoCont" value="1">
                                   
                            <p>
                                <% switch(Integer.parseInt(rs.getObject("valoracion").toString())){
                                    case 1:{%>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>  
                                    <% break;
                                    }
                                    case 2:{%>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>  
                                    <% break;
                                    }
                                    case 3:{%>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>  
                                    <% break;
                                    }
                                    case 4:{%>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>  
                                    <% break;
                                    }
                                    case 5:{%>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>  
                                    <% break;
                                    }
                                }%>
                                
                            </p>
                            <small><%=(String)rs.getObject("fecha")%></small>
                            <p><input type="submit"  class="btn btn-primary" style="position: relative; float: right" role="button" value="Leer más"></p>
                        </div>
                    </div>
                </div></form>
                <%}%>
            </div>
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