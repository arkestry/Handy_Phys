<%-- 
    Document   : admin_SPS
    Created on : 11/06/2015, 04:17:23 PM
    Author     : ivan
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
SPS = Second Per Second
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
    </head>
    <%! Date tiempo = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("E dd.MM.yyyy 'a las' hh:mm:ss a");
    %>
    <body>
        <h1>REGISTRO DE ACTIVIDAD<small> Segundo a Segundo</small></h1>
        <section>
            <section style="width: 3%; float: left; display: table-cell; padding: 1em">
                <button class="btn btn-success"><span class="glyphicon glyphicon-play"></span></button><br><br>
            <button class="btn btn-danger"><span class="glyphicon glyphicon-stop"></span></button>
            </section>
            <section style="width: 94%; float: left; display: table-cell">
            <table class="tablaAdmin">
                <tr>
                    <th>Acción</th>
                    <th>Descripción</th>
                    <th>Fecha-Hora</th>
                </tr>
                <tr>
                    <td class="comentario">Comentario</td>
                    <td>"Esta pagina me gusta mucho"</td>
                    <td><%= ft.format(tiempo) %></td>
                </tr>
                <tr>
                    <td class="problema">Problema</td>
                    <td>"Esto es un problema"</td>
                    <td><%= ft.format(tiempo) %></td>
                </tr>
                <tr>
                    <td class="aporte">Aporte</td>
                    <td>"Aporte algo :D"</td>
                    <td><%= ft.format(tiempo) %></td>
                </tr>
                <tr>
                    <td class="pregunta">Pregunta</td>
                    <td>"Estoy muy confundido :S"</td>
                    <td><%= ft.format(tiempo) %></td>
                </tr>
                <tr>
                    <td class="respuesta">Respuesta</td>
                    <td>"Lo se todo ;)"</td>
                    <td><%= ft.format(tiempo) %></td>
                </tr>
                <tr>
                    <td class="teoria">Teoria</td>
                    <td>"..."</td>
                    <td><%= ft.format(tiempo) %></td>
                </tr>
            </table>
        </section>
        </section>
    </body>
</html>

