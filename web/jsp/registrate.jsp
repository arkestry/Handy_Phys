<%-- 
    Document   : registrate
    Created on : 13/08/2015, 08:58:25 PM
    Author     : ivan-hdz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Registrando un nuevo compañero...</title>
        <script src="../js/jquery-1.11.3.min.js"></script>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/muestra.js" type="text/javascript"></script>
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
        <section class="bg bgregist"></section>
        <form method="POST" action="../servlets/regist" class="form-horizontal formularioLogin bordeR bBlue" role="form">
            <input type="hidden" name="institucion" value="1">
            <input type="hidden" name="tipoUsuario" value="3">
            <h1 class="text-uppercase text-center">Registrar</h1>
            <br>
            <section class="form-group col-xs-12"><!--nombre-->
                <label for="nombre" class="text-left control-label col-xs-4">Nombre completo: </label>
                <section class="col-xs-5">
                    <input name="nombre" type="text" class="form-control" id="nombre"/>
                </section>
            </section>
            <section class="form-group col-xs-12"><!--nombre de usuario-->
                <label for="nickname" class="text-left control-label col-xs-4">Nombre de usuario </label>
                <section class="col-xs-5">
                    <input name="nickname" type="text" class="form-control" id="nickname"/>
                </section>
            </section>
            <section class="form-group col-xs-12"><!--CORREO-->
                <label for="email" class="text-left control-label col-xs-4">Correo electronico: </label>
                <section class="col-xs-5">
                    <input name="email" type="email" class="form-control" id="email"/>
                </section>
            </section>
            <section class="form-group col-xs-12"><!--Contraseña-->
                <label for="pass" class="text-left control-label col-xs-4">Contraseña: </label>
                <section class="col-xs-5">
                    <input name="pass" type="password" class="form-control" id="pass"/> 
                </section>
            </section>
            <section class="form-group col-xs-12"><!-- Confirmar Contraseña-->
                <label for="passConfirm" class="text-left control-label col-xs-4">Vuelva a escribir su contraseña: </label>
                <section class="col-xs-5">
                    <input name="passC" type="password" class="form-control" id="passConfirm"/> 
                </section>
            </section>
     
            <section class="form-group col-xs-12"><!--Unidad de aprendizaje-->
                <label for="unidadA" class="text-left control-label col-xs-4">Unidad Academica: </label>
                <select name="unidadA" class="form-control-static col-xs-3" id="unidadA"> 
                    <option>Seleccione unidad de aprendizaje</option>
                    <option value="1">Fisica</option>
                </select>
            </section>
            <section class="form-group col-xs-12"><!--Grupo-->
                <label for="grupo" class="text-left control-label col-xs-4">Grupo: </label>
                <section class="col-xs-1">
                    <input name="grupo" pattern="[A-Za-z0-9]+" maxlength="10" title="Solo caracteres alfanumericos, maximo 10" type="text" class="form-control" id="grupo"/> 
                </section>
            </section>
            <center> 
                <input id="registrar" class="btn btn-success" type="submit" value="Registrarse"/>
                <input id="cancelar" class="btn btn-danger" type="reset" onclick="window.location.href = '../index.jsp'" value="Cancelar"/>
            </center>
            <br>
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


