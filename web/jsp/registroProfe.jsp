

<!DOCTYPE html>
<html>
    <head>
        <title>Registro Profesor</title>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/muestra.js" type="text/javascript"></script>
        <script src="../js/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
            <section class="bg bgregist"></section>
            <div class="wrapper-form text-center">
                <div class="mainrow">
                    <div class="col no-float">
                        <h1>Registro de Profesor</h1>
                        
                        <form action="../servlets/login" method="POST" class="form-horizontal">
                            <div class="form-group">
                                <label for="nombre" class="col-xs-4 login-font form-input-font" >Nombre Completo</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control form-trans login-font" id="nombre" placeholder="Nombre Completo">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="nickname" class="col-xs-4 login-font form-input-font">Nombre de Usuario</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control form-trans login-font" id="nickname" placeholder="Nombre de Usuario">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-xs-4 login-font form-input-font">Correo Electrónico</label>
                                <div class="col-xs-8">
                                    <input type="email" class="form-control form-trans login-font" id="email" placeholder="Correo Electrónico">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pass" class="col-xs-4 login-font form-input-font">Contraseña</label>
                                <div class="col-xs-8">
                                    <input type="password" class="form-control form-trans login-font" id="pass" placeholder="Contraseña">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="passConfirm" class="col-xs-4 login-font form-input-font">Repetir Contraseña</label>
                                <div class="col-xs-8">
                                    <input type="password" class="form-control form-trans login-font" id="passConfirm" placeholder="Repetir Contraseña">
                                </div>
                            </div>
                            <section class="form-group">
                                <label for="unidadA" class="col-xs-4 login-font form-input-font">Unidad Academica: </label>
                                <div class="col-xs-8">
                                    <select name="unidadA" class="form-control form-trans login-font" id="unidadA">
                                        <option>Seleccione unidad de aprendizaje</option>
                                        <option value="1">Fisica</option>
                                    </select>
                                </div>
                            </section>
                            <div class="form-group">
                                <div class="col-xs-10 col-xs-offset-1">    
                                <input id="registrar" class="btn btn-lg btn-block btn-trans form-trans" type="submit" value="Registrarse"/>
                                    <input id="cancelar" class="btn btn-lg btn-block btn-danger-trans form-trans" type="reset" value="Cancelar"/>
                                </div>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
            <footer>
                <hr size="5px" width="90%" align="center" color="black"/>
                <a href="http://getbootstrap.com/" target="body">Powered by Bootstrap</a>
                <a href="#">Contenido del sitio 2015© &nbsp;&nbsp; Ibex® de México   --  Desarrollado por IBEX </a>
                <a href="#">Politicas de uso</a>
            </footer>
    </body>
</html>
