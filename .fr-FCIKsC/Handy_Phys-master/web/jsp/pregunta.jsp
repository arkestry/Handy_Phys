<%-- 
    Document   : pregunta
    Created on : 30/06/2015, 09:56:40 PM
    Author     : ivan
--%>

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
    </body>
</html>
