<%-- 
    Document   : simuladorEjem
    Created on : 29/06/2015, 07:39:58 PM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
         <script src="../js/muestra.js"></script>  
         <link rel="stylesheet" href="../css/estilo_menu.css">
    </head>
    <body>
        <h1>Examen ejemplo</h1>
        <form role="form" action="../jsp/eva.jsp" method="post" >
            <p>Pregunta prueba</p>
            <br>
            <label>Respuestas</label>
            <br>
            <input type="radio" name="respuesta" value="correcta">
            <label>a)Respuesta 1</label>
            <br>
            <input type="radio" name="respuesta" value="incorrecta">
            <label>b)Respuesta 2</label>
            <br>
            <input type="radio" name="respuesta" value="incorrecta">
            <label>c)Respuesta 3</label>
            <br>
            <input type="radio" name="respuesta" value="incorrecta">
            <label>d)Respuesta 4</label>
            <br>
            <input class="btn btn-success" type="submit" value="Enviar respuesta" >
        </form>
    </body>
</html>
