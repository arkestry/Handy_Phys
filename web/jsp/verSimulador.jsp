<%-- 
    Document   : verSimulador
    Created on : 6/08/2015, 10:15:33 PM
    Author     : ivan-hdz
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="classes.serializar"%>
<%@page import="beans.Simulador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = request.getParameter("archivo");
    int num = Integer.parseInt(request.getParameter("num"));
    String titulo = request.getParameter("titulo");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simulador</title>
         <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>  
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script>
        
            var num = <%=num%>;
            
            function sig(){
                var preg = $.ajax({
                   url: "../servlets/sigPregunta",
                   data: {cual: num, url: '<%=url%>', tipo: 'preg'},
                   method: 'POST'
                });
                preg.done(function(res){
                    $('#preg').html(res);
                });
                var resp = $.ajax({
                    url: "../servlets/sigPregunta",
                    data: {cual: num, url: '<%=url%>', tipo: 'resp'},
                    method: 'POST',
                    beforeSend: function(){alert('Cargando..');}
                });
                resp.done(function(res){
                    $('#resp').html(res);
                });
                num++;
            }
            
       
        </script>
    </head>
    <body onload="sig()">
        <h1 class="text-center text-danger"><%=titulo %> </h1>
        <section class="container">
            <p id="preg" class="h3"></p>
            <label>Respuestas: </label>
            <p id="resp" class="h4"></p> <!--PARA MODIFICAR LOS ESTILOS DE LAS RESPUESTAS VER LA CALSE JAVA DE SIGPREGUNTA -->
        </section>
        <section class="container">
            <button class="btn btn-danger" onclick="window.location.href = 'todo_simulExam.jsp'" type="button">Cancelar</button>
            <button class="btn btn-success" onclick="sig()">Siguiente Pregunta</button>
        </section>
    </body>
</html>
