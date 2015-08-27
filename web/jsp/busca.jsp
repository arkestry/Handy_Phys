

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Buscando...</title>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/code.jquery.com_jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="../css/bootstrap/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <script src="../js/muestra.js"></script>
         <%
            Connection con = sql.conectar();
            PreparedStatement ps = con.prepareStatement("call buscar_articulo(?)");
            ps.setString(1, request.getParameter("palabraClave"));
            ResultSet rs = ps.executeQuery();
            PreparedStatement ps1 = con.prepareStatement("call misComentarios(?)");
        %>
        
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
       <!--encabezado-->
        <div class="page-header">
            <h1 class="text-center todo_tit">
                Resultados para <small><%=request.getParameter("palabraClave") %></small>
           
            </h1>
            
        </div>
        
           <div class="todo">
            <!--pregunta1-->
            <%while(rs.next()){ 
                ps1.setInt(1, rs.getInt(1));
                ResultSet rs1 = ps1.executeQuery();
            %>
            
               <div class="panel panel-default">
                <div class="panel-heading slim_panHead">
                    <h3>
                        <form action="pregunta.jsp" method="GET" style="display: inline">
                            <button type="submit" style="background: none; border: none"><%=(String)rs.getObject("Titulo") %></button>
                            <input type="hidden" name="idUsuario" value="<%= rs.getObject("idUsuario")%>">
                            <input type="hidden" name="nickname" value="<%= (String)rs.getObject("nickname")%>">
                            <input type="hidden" name="titulo" value="<%=(String)rs.getObject("Titulo") %>">
                            <input type="hidden" name="fecha" value="<%=(String)rs.getObject("fecha")%>">
                            <input type="hidden" name="idArticulo" value="<%= rs.getObject("idArticulo") %>">
                            <input type="hidden" name="nombreArchivo" value="<%= rs.getString("url") %>">
                            <input type="hidden" name="tipoCont" value="2">  
                            <input type="hidden" name="correo" value="<%= rs.getString("correo") %>">  
                            <input type="hidden" name="tags" value="<%= rs.getString("tags") %>">
                        </form>
                      
                        <!--los labels cambiaran según sea el caso, estan todos solo de forma representativa--> 
                        <span class="label label-info"> Pregunta reciente </span>&nbsp;
                        <!--span class="label label-success"> Pregunta ya contestada

                        </span-->&nbsp;
                        <span class="label label-warning"> Pregunta en espera de ser contestada
                        </span>
                    </h3>
                        <h5 id="quest_date">
                        <div class="panel-body">
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

                        <%while(rs1.next()){%>
                        <form action="pregunta.jsp" method="POST">
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
                        &nbsp;

                        <b><%=(String)rs.getObject("fecha")%></b>
                    </h5>
                </div>
             </div>
            <%}%>
             
        </div>
        <footer>
            <hr size="5px" width="90%" align="center" color="black"/>
            <a href="http://getbootstrap.com/" target="body">Powered by Bootstrap</a>
            <a href="#">Contenido del sitio 2015© &nbsp;&nbsp; Ibex® de México   --  Desarrollado por IBEX </a>
           <a href="#">Politicas de uso</a>
        </footer>
        </section>
    </body>
</html>
