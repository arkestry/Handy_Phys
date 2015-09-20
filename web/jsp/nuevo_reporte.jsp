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
   <form class="formularioNuevoRepor form-horizontal" action="../servlets/reportes">
        <section class="reporte">
            <section class="col-lg-12">
                <section class="col-lg-6">
                    <label for="tituloRep">Titulo del reporte: </label><input name="titulo_rep" type="text" required="" class="form-control" size="50" name="tituloRep" id="tituloRep">
                </section>
                <section class="col-lg-6">
                    <label for="user">Correo del usuario a reportar: </label><input name="correo" type="text" required="" class="form-control" size="50">
                </section>
            </section>
            <br><br><br><br>
            <section>
                <section class="col-lg-12" >
                    <label>Seleccione la gravedad de la accion del usuario xxxxxxx:</label>
                    <select name="gravedad" class="form-control" style="color: #141414" name="gravedad">
                        <option>Seleccione alguno</option>
                        <option value="1">Baja</option>
                        <option value="2">Media</option>
                        <option value="3">Alta</option>
                    </select>
                </section>
                
            </section>
            <br> <br>
            <center>
                <section class="col-lg-12 container">
                    
                    <label for="tituloRep">Breve descripción del reporte: </label><br>
               
                    <section class=" col-lg-5" style="padding: 15px; position: relative; right: -35em">
                   <center> <textarea rows="7" name="cuerpo" class=" form-control" placeholder="Descripcion del reporte"></textarea>
               
                   </center></section>
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
