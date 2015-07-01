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
            <input class="btn btn-success" type="submit" value="Enviar respuesta">
        </form>
    </body>
</html>
