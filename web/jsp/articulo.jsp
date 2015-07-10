<%-- 
    Document   : articulo
    Created on : 27/06/2015, 10:50:26 PM
    Author     : ivan
--%>

<%@page import="beans.userBean"%>
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
         <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
        <%!int idArticulo;%>
        <%
            String userName = request.getParameter("nickname");
            idArticulo = Integer.parseInt(request.getParameter("idArticulo").toString());
            String fecha = request.getParameter("fecha");
            String titulo = request.getParameter("titulo");
            String nombreArchivo = request.getParameter("nombreArchivo");
            String url = classes.getHTML.obtenerURL(idArticulo);
            String cont = String.valueOf(request.getParameter("tipoCont"));
            System.out.print(cont);
            userBean user = (userBean)session.getAttribute("userData");
            System.out.println(user);
            System.out.println(url);
        %>
        <script>
            function carga(){
                var frame =  document.getElementById("iframe");
             
                frame.contentWindow.location.reload();
            }
            function really(formulario){
                if(confirm("En verdad quiere borrar el articulo <%= titulo %>") === true){
                     formulario.submit();
                }else{
                    return false;
                    
                }
            }
        </script>
    </head>
    <body onload="carga()">
        <div class="container">
        <br><br>
        <section  style="padding-left: 3em; height: 2em; padding-top: 1em; display: block;">
            <center>
            <h1 style="display: block; ">
                <%=titulo %> <small> <%= userName%></small>
            </h1> 
            </center>
        <%
            if(request.getParameter("idUsuario").equals(String.valueOf(user.getIdUsuario()))){
        %>
        <section style="display: inline; float: left; position: absolute; top: .5em; left: 1em">
        <form class="form-group" style="float: left; display: table; padding-left: 2em; padding-top: 2em" action="editor.jsp" method="POST">
                <button  class="btn btn-sm btn-warning form-inline" type="submit"><span class="glyphicon glyphicon-edit"></span></button>
                <input type="hidden" value="<%=nombreArchivo%>" name="nombreArchivo">
                <input type="hidden" value="<%=titulo%>" name="titulo">
                <input type="hidden" value="<%=idArticulo%>" name="idArticulo">
                <input type="hidden" value="<%= cont %>" name="tipoCont">
        </form>
        <form onsubmit="return really(this)" class="form-group" style="float: left; display: table; padding-top: 2em" action="../servlets/borrarHTML" method="POST">
            <button   class="btn btn-sm btn-danger form-inline" type="submit"><span class="glyphicon glyphicon-trash"></span></button>
            <input type="hidden" value="<%=idArticulo%>" name="idArticulo">
            <input type="hidden" value="<%=titulo%>" name="titulo">
        </form>
        </section>
        <% } %>
        </section>
        <br>
   
        <section style="position: relative; top: 5em; left: 0.1em; width: 95%">
        <section style="display: block; width: 100%; height: 100%; padding: 1px">
            <jsp:include flush="true" page="<%=url%>"></jsp:include>
        </section>
            <p><small class="text-center">Fecha<small><%=fecha%></small></small></p>
            <%  if(!session.getAttribute("tipo").equals("Anonimo")){ %>
            <form  class="form-group " style="display: inline; width: 40%; float: left "  action="../servlets/addComment" method="post">
            <label for="com">
                Escriba su comentario amable lector de esta bonita página¡gina que sin usted no podrÃ­a existir ;)
            </label>
            <textarea class="form-control" id="com" name="com"></textarea>
            <input type="hidden" name="idArt" value=<%out.println(idArticulo); %> />
            <input type="hidden" name="idUsuario" value=<%out.println(user.getIdUsuario()); %> />
            <input  type="submit" class="btn btn-info" value="Ingresar">
            </form> 
            <%}%>
            <br>
            <section style="width: 97%; float: left; margin-left: .1em; ">
            <% 
             Connection con = sql.conectar();
            PreparedStatement ps = con.prepareStatement("call getComs(?)");
            ps.setInt(1, idArticulo);
            ResultSet rs= ps.executeQuery();
            
            while(rs.next()){
            out.println("<div class='panel panel-default'> <div class='panel-heading'><span class='glyphicon glyphicon-user' aria-hidden='true'></span>"
                    + rs.getString("usr")+"</div><div class='panel-body'><h4 class='text-primary'>"+rs.getString("cuerpo")+"</h4></div><div class='panel-footer'>"
                    + "<h6 class='text-muted'>"+rs.getString("horaFecha")+"</h6></div></div>" );
            }
        %>
            </section>
        </section>
        </div>
    </body>
</html>
