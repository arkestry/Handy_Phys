<%-- 
    Document   : articulo
    Created on : 27/06/2015, 10:50:26 PM
    Author     : ivan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <head>
        <meta charset="UTF-8">
        <title>Articulo</title>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../css/bootstrap/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <script src="./js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
        <%
            String userName = request.getParameter("nickname");
            int idArticulo = Integer.parseInt(request.getParameter("idArticulo").toString());
            String fecha = request.getParameter("fecha");
            String titulo = request.getParameter("titulo");
            
            String url = classes.getHTML.obtenerURL(idArticulo);
        %>
        
    </head>
    <body>
        
        <section>
            <h1 class="tituloArt" id="title"><%=titulo %><small><%= userName%></small></h1> 
        <iframe class="iframeA" src="<%=url%>"></iframe>
        </section>
        <iframe id="frameComentario" name="frameComentario"></iframe>
        <section style="position: relative; top: 5em; left: 2em; width: 100%">
            <form  class="form-group " style="display: inline; width: 40%; float: left "  action="../servlets/addComment" method="post">
            <label for="com">
                Escriba su comentario amable lector de esta bonita pÃ¡gina que sin usted no podrÃ­a existir ;)
            </label>
            <textarea class="form-control" id="com" name="com"></textarea>
            <input  type="submit" class="btn btn-info" value="Ingresar">
            </form>
            <br>
            <section style="width: 50%; float: left; margin-left: 5em">
            <% 
             Connection con = sql.conectar();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM coms");
            ResultSet rs= ps.executeQuery();
            
            while(rs.next()){
            out.println("<div class='panel panel-default'> <div class='panel-heading'><span class='glyphicon glyphicon-user' aria-hidden='true'></span>"
                    + rs.getInt("idUsuario")+"</div><div class='panel-body'><h4 class='text-primary'>"+rs.getString("cuerpo")+"</h4></div><div class='panel-footer'>"
                    + "<h6 class='text-muted'>"+rs.getString("horaFecha")+"</h6></div></div>" );
            }
        %>
            </section>
        </section>
    </body>
</html>
