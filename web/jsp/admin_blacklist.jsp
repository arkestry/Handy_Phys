<%-- 
    Document   : admin_blacklist
    Created on : 27/07/2015, 10:07:25 AM
    Author     : ivan-hdz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = sql.conectar();
    PreparedStatement ps = con.prepareStatement("select * from verBlacklist");
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Blacklist</title>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
        <script>
            function reallyAll(formulario){
                if(confirm("En verdad quiere eliminar todas las palabras?")===true){
                    formulario.submit();
                    return true;
                }else{
                    return false;
                }
            }
            function reallyCombo(formulario){
                var combo = document.getElementById("combo1");
                for(var i = 0; i < combo.options.length; i++){
                    if(combo.options[i].selected){
                        if(combo.options[i].value === "del"){
                            if(confirm("Seguro que desea eliminar esa palabra?") === true){
                                formulario.submit();
                                return true;
                            }else{
                                return false;
                            }
                        }
                    }
                }
                
            }
        </script>
    </head>
    <body class="body_blacklist">
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
            <div class="page-header">   
                <h1 class="text-center todo_tit">BLACK LIST</h1>
            </div>  
            <section class="todo">
                <h3 class="todo_tit">
                    Introduzca las palabras que desea eliminar
                </h3>
                <table class="table table-responsive table-bordered">
                    <tr class="table_titles">
                        <th>Numero</th>
                        <th>Palabra / Simbolo</th>
                        <th>Estado</th>
                        <th>Accion</th>
                    </tr>
                    <% while(rs.next()){ %>
                    <form method="POST" action="../servlets/accionesBlacklist" onsubmit="return reallyCombo(this)">
                        <input type="hidden" name="cual" value="existe">
                        <input name="id" type="hidden" value="<%= rs.getString(1) %>">
                        <tr class="table_text">
                            <td><%= rs.getString(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <%if(rs.getBoolean(3) == true){ %>
                            <td><%= "Activada" %></td>
                            <% }
                            else
                            {
                            if(rs.getBoolean(3) == false){ %>
                            <td> <%= "Desactivado" %></td>  
                            <% }
                            }%>
                            <td>
                                <select onchange="this.form.submit();"  id="combo1" name="accion" class="form-control">
                                    <option>Seleccione una opción</option>
                                    <option value="true">Activar</option>
                                    <option value="false">Desactivar</option>
                                    <option value="del">Eliminar</option>
                                </select>
                            </td>
                        </tr>
                    </form>
                    <% } %>
                </table> 

                <button id="btnAdd" style="float: left; margin-left: 10px" type="button" value="Agregar" class="btn btn-primary">Agregar</button>
                <form id="formuAdd" method="POST" action="../servlets/accionesBlacklist" style="float: left; padding: 2px; display: none">
                    <input name="cual" value="nuevo" type="hidden">
                    <input name="palabra" type="text" style="color: #141414 ;border-radius: 5px; border: 1px #1E824C dotted" maxlength="50" size="50">
                    <button type="submit" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus-sign"></span></button>
                </form>
                <br><br>
                <form action="../servlets/accionesBlacklist" method="POST" onsubmit="return reallyAll(this)">
                    <input type="hidden" value="borrar" name="cual" type="hidden">
                    <button type="submit"  style="float: right" class="btn btn-danger" > Eliminar Todo </button>
                </form>
            </section>

            <footer>
            <hr size="5px" width="90%" align="center" color="black"/>
            <a href="http://getbootstrap.com/" target="body">Powered by Bootstrap</a>
            <a href="#">Contenido del sitio 2015© &nbsp;&nbsp; Ibex® de México   --  Desarrollado por IBEX </a>
            <a href="#">Politicas de uso</a>
        </footer>
        </section>
    </body>
</html>