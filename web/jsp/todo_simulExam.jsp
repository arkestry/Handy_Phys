<%-- 
    Document   : todo_simulExam
    Created on : 4/08/2015, 07:44:00 PM
    Author     : ivan-hdz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Simulador de Examen</title>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
         <script src="../js/muestra.js"></script>  
         <link rel="stylesheet" href="../css/estilo_menu.css">
    </head>
    <body>
        <h1 class="text-uppercase text-center">SIMULADOR DEL EXAMEN <a href="nuevoExamen.html"><button class="btn boton btn-sm"><span class="glyphicon glyphicon-cloud-upload"></span></button></a></h1>
        <section class="col-md-12">
            <section style="position: relative; top: -1em" class="col-md-1">
                <label class="h3">Filtro: </label>
            </section>
            <section class="col-md-2">
                <select style="color: #141414;" class="form-control">
                     <option>Todos</option>
                     <option value="fisica1">Fisica 1</option>
                     <option value="fisica2">Fisica 2</option>
                     <option value="fisica3">Fisica 3</option>
                     <option value="fisica4">Fisica 4</option>
                 </select>
            </section>
        </section>
        
        <section style="width: 93%; height: 100%; margin: 3em">
            <table class="table table-striped table-responsive">
                <tr style="background-color: #F18B06">
                    <th>Titulo</th>
                    <th>Descripcion</th>
                    <th>Parcial</th>
                    <th>Unidad Academica</th>
                    <th>Fecha</th>
                    <th>Autor</th>
                    <th>Valoracion</th>
                </tr>
                <tr>
                    <td><a href="simuladorEjem.jsp">Examen Chido</a></td>
                    <td>Este examen me ayudo a reprobar</td>
                    <td>1</td>
                    <td>Fisica 1</td>
                    <td>5 estrellas</td>
                </tr>
            </table>
        </section>
         <footer>
             <hr size="5px" width="90%" align="center" color="black"/>
             <a href="http://getbootstrap.com/" target="body">Powered by Bootstrap</a>
            <a href="#">Contenido del sitio 2015© &nbsp;&nbsp; Ibex® de México   --  Desarrollado por IBEX </a>
           <a href="#">Politicas de uso</a>
        </footer>
    </body>
</html>
