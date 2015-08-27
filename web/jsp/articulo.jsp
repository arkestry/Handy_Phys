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

<!DOCTYPE html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/code.jquery.com_jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="../css/bootstrap/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <script src="../js/muestra.js"></script>
       
        <%
            int idArticulo;
            String userName = request.getParameter("nickname");
            idArticulo = Integer.parseInt(request.getParameter("idArticulo").toString());
            String fecha = request.getParameter("fecha");
            String titulo = request.getParameter("titulo");
            String nombreArchivo = request.getParameter("nombreArchivo");
            String url = classes.getHTML.obtenerURL(idArticulo);
            String cont = String.valueOf(request.getParameter("tipoCont"));
            String tags = request.getParameter("tags");
            String correo = request.getParameter("correo");
            userBean user = (userBean)session.getAttribute("userData");
           
        %>
        <title><%=titulo %></title>
        <script>
            function really(formulario){
                if(confirm("En verdad quiere borrar el articulo: <%= titulo %>") === true){
                     formulario.submit();
                }else{
                    return false;
                    
                }
            }
            function validarComm(formu){
                if(confirm("Esta seguro de que desea eliminar este comentario?") === true){
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
        <div class="container">
        <br><br>
        <section  style="padding-left: 3em; height: 2em; padding-top: 1em; display: block;">
            <center>
            <h1 style="display: block; ">
            <%=titulo %> <a href="profile.jsp?correo=<%=correo %>"><small> <%= userName%></small></a>
            </h1> 
            </center>
        <%
            if(request.getParameter("idUsuario").equals(String.valueOf(user.getIdUsuario()))){
        %>
        <section style="display: inline; float: left; position: absolute; top: 5em; left: 1em">
        <form class="form-group" style="float: left; display: table; padding-left: 2em; padding-top: 2em" action="editor.jsp" method="GET">
                <button  class="btn btn-sm btn-warning form-inline" type="submit"><span class="glyphicon glyphicon-edit"></span></button>
                <input type="hidden" value="<%=nombreArchivo%>" name="nombreArchivo">
                <input type="hidden" value="<%=titulo%>" name="titulo">
                <input type="hidden" value="<%= idArticulo %>" name="idArticulo">
                <input type="hidden" value="<%= cont %>" name="tipoCont">
        </form>
        <form onsubmit="return really(this)" class="form-group" style="float: left; display: table; padding-top: 2em" action="../servlets/borrarHTML" method="POST">
            <button   class="btn btn-sm btn-danger form-inline" type="submit"><span class="glyphicon glyphicon-trash"></span></button>
            <input type="hidden" value="<%=idArticulo%>" name="idArticulo">
            <input type="hidden" value="<%=titulo%>" name="titulo">
            <input type="hidden" value="<%= cont %>" name="tipoCont">
        </form>
        </section>
        <% } %>
        </section>
        <br>
   
        <section style="position: relative; top: 5em; left: 0.1em; width: 95%">
            <section class="container" style="display: block; width: 100%; height: 100%; padding: 1px">
                <jsp:include flush="true" page="<%=url%>"></jsp:include>
            </section>
                    <p><label>TAGS: <%=tags%></label></p>
            <p><small class="text-center">Fecha<small><%=fecha%></small></small></p>
            <% if(!session.getAttribute("tipo").equals("Anonimo")){ %>
            <form action="../servlets/valorar" method="POST">
                <input type="hidden" value="<%= idArticulo %>" name="idArticulo">
                <input type="hidden" value="1" name="tipoCont">
                <input id="valor" type="hidden" name="valor">
                <section style="position: relative; display: inline; top: -1em" id="stars">
                    <label class="text-uppercase text-warning" for="stars">Valorar
                        <span name="s1" id="s1" class="glyphicon glyphicon-star-empty"></span>
                        <span name="s2" id="s2" class="glyphicon glyphicon-star-empty"></span>
                        <span name="s3" id="s3" class="glyphicon glyphicon-star-empty"></span>
                        <span name="s4" id="s4" class="glyphicon glyphicon-star-empty"></span>
                        <span name="s5" id="s5" class="glyphicon glyphicon-star-empty"></span></label>
                </section>
            </form>
            <form  class="form-group " style="display: inline; width: 40%; float: left "  action="../servlets/addComment" method="post">
            <label for="com">
                Escriba su comentario amable lector de esta bonita p·gina°gina que sin usted no podr√≠a existir ;)
            </label>
            <textarea class="form-control" id="com" name="com"></textarea>
            <input type="hidden" name="idArt" value="<%=idArticulo%>" />
            <input type="hidden" name="idUsuario" value="<%= user.getIdUsuario() %>" />
            <input type="hidden" name="tipo" value="1">
            <input  type="submit" class="btn btn-info" value="Ingresar">
            </form> 
            <%}%>
            <br>
            <section class="container" style="width: 97%; float: left; margin-left: .1em; ">
            <% 
             Connection con = sql.conectar();
            PreparedStatement ps = con.prepareStatement("call getComs(?)");
            ps.setInt(1, idArticulo);
            ResultSet rs= ps.executeQuery();
            String eliminar = "";
            
            while(rs.next()){ %>
            <form action="../servlets/delComment" method="POST" onsubmit="return validarComm(this)">
                <input type="hidden" value="<%= rs.getString("idCom") %>" name="idComm">
                <input type="hidden" name="tipo" value="1">
            <%
            if(rs.getString("id").equals(String.valueOf(user.getIdUsuario()))){
                eliminar = "<button style='float: right; position: relative; bottom: 5px' type='submit' class='btn btn-sm btn-danger'><span class='glyphicon glyphicon-trash'></span></button>";
            }else{
                 eliminar = "";
            }
            out.println("<div class='panel panel-default'> <div class='panel-heading'><span class='glyphicon glyphicon-user' aria-hidden='true'></span>"
                    + rs.getString("usr")+eliminar+"</div><div class='panel-body'><h4 class='text-primary'>"+rs.getString("cuerpo")+"</h4></div><div class='panel-footer'>"
                    + "<h6 class='text-muted'>"+rs.getString("horaFecha")+"</h6></div></div>" );
            %>
            </form>
                <%
            }
        %>
        
            </section>
        </section>
        </div>
        </section>
    </body>
</html>
