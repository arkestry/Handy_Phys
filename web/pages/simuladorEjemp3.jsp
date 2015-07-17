<%-- 
    Document   : simuladorEjemp3
    Created on : 6/07/2015, 04:50:16 PM
    Author     : Chris
--%>

<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="./js/jquery-1.11.3.min.js"></script>
         <script src="../js/muestra.js"></script>  
         <link rel="stylesheet" href="../css/estilo_menu.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Examen ejemplo</h1>
        <form role="form" action="../jsp/eva3.jsp" method="post" >
            <p>Pregunta 3 prueba</p>
            <br>
            <label>Respuestas</label>
            <br>
            <input type="radio" name="respuesta" value="incorrecta">
            <label>a)Respuesta 1</label>
            <br>
            <input type="radio" name="respuesta" value="incorrecta">
            <label>b)Respuesta 2</label>
            <br>
            <input type="radio" name="respuesta" value="correcta">
            <label>c)Respuesta 3</label>
            <br>
            <input type="radio" name="respuesta" value="incorrecta">
            <label>d)Respuesta 4</label>
            <br>
            <input class="btn btn-success" type="submit" value="Enviar respuesta">
        </form>
    </body>
</html>
