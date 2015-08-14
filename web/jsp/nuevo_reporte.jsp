<%-- 
    Document   : nuevo_reporte
    Created on : 13/08/2015, 08:57:11 PM
    Author     : ivan-hdz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Elaborar reporte</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
   <h1 class="text-right">AREA DE REPORTES</h1>
    <form class="formularioNuevoRepor">
        <section class="reporte">
            <section>
                <label for="user">Usuario a reportar: </label><input type="text" size="50" placeholder="nombre de usuario o correo">
            <label>Seleccione la gravedad de la accion del usuario xxxxxxx:</label>

                    <select style="color: #141414" name="gravedad">
                        <option>Seleccione alguno</option>
                        <option>Baja</option>
                        <option>Media</option>
                        <option>Alta</option>
                    </select>    
            </section>
            <br><br>
            <section>
                <label for="tituloRep">Titulo del reporte: </label><input type="text" size="50" name="tituloRep" id="tituloRep">
                <label> Seleccione la razon por la que reportas al usuario xxxxxxx:</label>

                    <select style="color: #141414" name="descripcion">
                         <option>Seleccione alguno</option>
                        <option>Suplantación de identidad</option>
                        <option>Aportaciones fuera de importancia</option>
                        <option>Información privada</option>
                        <option>No se apega a las politicas del sitio</option>
                    </select>      
            </section>
            <br> <br>
            <center>
          <section>
               <label for="tituloRep">Breve descripción del reporte: </label><br>
               <textarea maxlength="240" placeholder="Descripcion del reporte"></textarea>
          </section>
                <br><br>
            <input type="submit" value="Enviar reporte"  style="background-color: #006541;" class="btn btn-lg boton">
            </center>
        </section>
    </form>
            <footer>
             <hr size="5px" width="90%" align="center" color="black"/>
          <a href="http://getbootstrap.com/" target="body">Powered by Bootstrap</a>
            <a href="#">Contenido del sitio 2015© &nbsp;&nbsp; Ibex® de México   --  Desarrollado por IBEX </a>
           <a href="#">Politicas de uso</a>
        </footer>
        </section>
    </body>
</html> 
