<%-- 
    Document   : admin_reporte
    Created on : 13/08/2015, 08:51:39 PM
    Author     : ivan-hdz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Reporte Usuarios</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=RobotoCondensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
         <script src="../js/muestra.js"></script>  
         <link rel="stylesheet" href="../css/estilo_menu.css">
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
            <h1 class="text-uppercase text-center">REPORTE DE USUARIOS</h1>
            <br><br>
            <label for="filtro">Filtrar por: </label>
            <select id="filtro" style="color: #141414">
                    <option> Gravedad Baja</option>
                    <option> Gravedad Media</option>
                    <option> Gravedad Alta</option>
            </select>
            <br><br>
            <section>
                <table class="tablaAdmin" style="border-left: 7px solid #22A7F0">
                    <tr>
                        <th>Usuario</th>
                        <th>Titulo</th>
                        <th>Razón</th>
                        <th>Descripcion</th>
                        <th>Fecha</th>

                    </tr>
                    <tr>
                        <td>Nombre del usuario</td>
                        <td>Titulo del reporte</td>
                        <td>Razón del porqué del reporte</td>
                        <td>Breve descripción</td>
                        <td>Fecha del reporte</td>
                    </tr>
                </table>
            </section>
             <footer>
             <hr size="5px" width="90%" align="center" color="black"/>
             <a href="http://getbootstrap.com/" target="body">Powered by Bootstrap</a>
            <a href="#">Contenido del sitio 2015© &nbsp;&nbsp; Ibex® de México   --  Desarrollado por IBEX </a>
           <a href="#">Politicas de uso</a>
        </footer>
        </section>
    </body>
</html>
