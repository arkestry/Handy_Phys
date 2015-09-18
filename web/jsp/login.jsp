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
                <div class="wrapper">
                    <div class="mainrow">
                        <div class="col no-float text-center">
                            <img src="../assets/icons/zigma.svg" alt="unavailable" class="image" />
                            <form action="../servlets/login" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="login-font label-font">email</label>
                                    <input type="email" class="form-control form-trans login-font login-input-font" id="email" name="email" placeholder="Email">
                                    <label for="exampleInputEmail1" class="login-font label-font">contraseña</label>
                                    <input type="password" id="pass" name="pass" class="form-control form-trans login-font login-input-font" placeholder="Contraseña">
                                </div>
                                <p>
                                    <button type="button" id="loginSubmit" name="button" class="btn btn-lg btn-trans form-trans">Login</button>
                                </p>
                            </form>
                            <p>
                                <a href="../jsp/registrate.jsp">¿Aún no te has registrado?</a>
                            </p>
                        </div>
                    </div>
                </div>
            <footer>
                <hr size="5px" width="90%" align="center" color="black"/>
                <a href="http://getbootstrap.com/" target="body">Powered by Bootstrap</a>
                <a href="#">Contenido del sitio 2015© &nbsp;&nbsp; Ibex® de México   --  Desarrollado por IBEX </a>
                <a href="#">Politicas de uso</a>
            </footer>
        </section>
    </body>
</html>




