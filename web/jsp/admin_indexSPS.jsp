<%-- 
    Document   : admin_indexSPS
    Created on : 13/08/2015, 08:48:08 PM
    Author     : ivan-hdz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Registro de Actividad</title>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                
                var timer = null;
                function iniciar(){
                    timer = setInterval(update, 5000); //tiempo por defecto
                }
                function detener(){
                    clearInterval(timer);
                }
                
                $('#seccion').html("<center><img src='../assets/icons/loading.gif'></center>");
                $('img').css({
                    opacity: "0.8",
                    "border-radius": "25em"
                    
                });
                function update(){ //el metodo que ejecuta el ajax
                    var variable = $.ajax({ //le damos todas las propiedades de ajax a una variable
                        url: "../jsp/admin_SPS.jsp", //la pagina del servidor que hara la consulta
                        method: "POST" //el metodo
                        
                    });
                    //el metodo 'done' es como un 'ejecutar pagina'
                    variable.done(function(html2){ //el parametro html2 es el contenido de la pagina HTML que llama el ajax
                        $('#seccion').html(html2); //imprime el contenido en la seccion
                    }); 
                }
                iniciar();
                $('#iniciar').on('click', iniciar);
                $('#parar').on('click', detener);
            });
        </script>
        <style>
           
            
        </style>
    </head>
    
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
        <h1>REGISTRO DE ACTIVIDAD<small> Segundo a Segundo</small></h1>
        <section>
            <section style="width: 3%; float: left; display: table-cell; padding: 1em">
             <button id="iniciar" class="btn btn-success"><span class="glyphicon glyphicon-play"></span></button><br><br>
             <button id="parar" class="btn btn-danger"><span class="glyphicon glyphicon-stop"></span></button>
            </section>
            <section style="width: 94%; float: left; display: table-cell" id="seccion">
            </section>
        </section>
        </section>
    </body>
    
</html>
