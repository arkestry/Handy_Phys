<%-- 
    Document   : login
    Created on : 13/08/2015, 08:53:58 PM
    Author     : ivan-hdz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Iniciar Sesión</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js" type="text/javascript"></script>
        <link href="../css/estilo_menu.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <section class="bg bglogin"></section>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
        <section>
            <form class="form-horizontal formularioLogin bordeR bGreen" role="form" action="../servlets/login" method="POST">
                <h1 class="text-uppercase text-center">Iniciar Sesion</h1>
                <section class="form-group col-xs-12">
                    <label for="email" class="text-right control-label col-xs-4">Usuario: </label>
                    <section class="col-xs-5">
                        <input name="email" placeholder="Email" id="email" class="form-control" type="email"/>
                    </section>
                </section>
                <section class="form-group col-xs-12">
                    <label for="pass" class="text-right control-label col-xs-4">Contraseña: </label>
                    <section class="col-xs-5">
                        <input type="password" id="pass" class="form-control" placeholder="Contraseña" name="pass">
                    </section>
                </section>
                <section class="text-center">
                    <input type="submit"  value="Iniciar Sesion" class=" btn btn-success" id="loginSubmit">
                    <input type="button"  value="Registrarse" onclick="window.location.href = 'registrate.jsp'" class="btn btn-warning" id="regist">
                    <br>
                    <br>
                </section>
            </form>
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




