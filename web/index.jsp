<%-- 
    Document   : index
    Created on : 23/05/2015, 09:17:59 PM
    Author     : ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Menu Principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/estilo_menu.css">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/fonts.css">
        <link rel="stylesheet" href="css/EsilosSocial.css">
        <script src="./js/jquery-1.11.3.min.js"></script>
         <script src="js/muestra.js"></script>
        
    </head>
    <body>
        <% 
            if(session.isNew()){
            session.setAttribute("tipo", "Anonimo");
            }
        %>
        <img class="zigma" src="assets/icons/zigma.png" alt="zigma">
    	<div id="hmenu" class="navbar navbar-inverse col-xs-12">
             <ul id="menuNo">
                 <li><span class="glyphicon glyphicon-alert btn-lg" style="color: #141414; top: .2em; "></span>
                     <ul class="cajaNo list-unstyled">
                         <li><a style="cursor: default; background-color: #1E824C; ">AVISOS</a></li>
                         <li class="altaPrioridad">Titulo Notificacion: <section>Notificacion</section></li>
                         <li class="mediaPrioridad">Titulo Notificacion: <section>Notificacion</section></li>
                         <li class="bajaPrioridad">Titulo Notificacion: <section>Notificacion</section></li>
                    </ul>
                     <ul class="cajaNo list-unstyled" style="right: 45em">
                         <li><a style="cursor: default; background-color: #1E824C; ">CREAR AVISO</a></li>
                         <li class="bajaPrioridad"> 
                             <section style="padding: 5px">
                                 <form>
                                     Titulo Aviso: <input type="text" size="30" name="tituloNo">
                                     <section style="margin: 2px;">Aviso: <br>
                                        <textarea maxlength="100"></textarea>
                                     </section>
                                     <section>
                                     <select>
                                         <option>Alta</option>
                                         <option>Media</option>
                                         <option>Baja</option>
                                     </select>
                                     </section><br>
                                     <input type="submit" value="enviar">
                                 </form>
                             </section></li>                       
                    </ul>
                 </li>
                    
             </ul>
        <section class="">
        	<form class="form-inline text-right">
                    <section class="form-group">
                    <section>
                        <input id="buscar" type="text" class="form-control"  placeholder="Buscar">
                        <button id="btn_buscar" class="btn boton"><span class="glyphicon glyphicon-search"></span></button>
                    </section>
                </section>
            </form>
        </section>
        </div>
        <div id="muestrame"></div>
        <nav>
            <ul class="menu" id="Principal">
            <li><a href="pages/home.html" target="iframe">Página Principal</a></li>
            <% if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
            <li><a href="pages/profile.html" target="iframe">Mi Perfíl</a></li>
            <li><a onClick="mostrar(pYrS)" href="#">Mis Preguntas y Respuestas</a></li>
            <section id="pYrS" name="onMenu">
                <ul class="list-unstyled text-right text-uppercase list-group-item-text menu2">
                    <li><a class="sublist" href="pages/mis_preguntas.html" target="iframe">Mis Preguntas</a></li>
                    <li><a class="sublist" href="pages/mis_respuestas.html" target="iframe">Mis Respuestas</a></li>
                </ul>
            </section>
            <%}%>
            <li onClick="mostrar(contentS)"><a href="#">Contenido</a></li>
            <section id="contentS" name="onMenu">
                <ul class="list-unstyled text-uppercase text-right list-group-item-text">
                    <li><a class="sublist" href="pages/todo_articulos.html" target="iframe">Teoria</a></li>
                    <li><a class="sublist" href="pages/todo_problemas.html" target="iframe">Problemas</a></li>
                    <li><a class="sublist" href="pages/todo_preguntas.html" target="iframe">Preguntas</a></li>
                    <li>Examenes</li>
                    <li><a class="sublist" href="pages/simulExamen.html" target="iframe">Simulador Examen</a></li>
                </ul>
            </section>
            <% if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
            <li onclick="mostrar(feedS)"><a href="#">Feedback</a></li>
            <section id="feedS" name="onMenu">
                <form class="form">
                    <section class="text-center col-xs-12 form-group">
                        <textarea class="form-control " rows="3" placeholder="Escribe una sugerencia"></textarea>
                    </section>
                    <br>
                    <section class="form-group col-xs-12">
                            <button class="col-xs-12 btn boton"><span class="glyphicon glyphicon-check"></span> </button>
                    </section>
                </form>
            </section>
            <li><a href="pages/ConfigurarCuenta.html" target="iframe">Configuración de Cuenta</a></li><%} %>
            <li onclick="mostrar(credencialesS)"><a href="#">Credenciales</a></li>
             <section id="credencialesS" name="onMenu">
                <ul class="list-unstyled text-uppercase text-right list-group-item-text menu2">
                    <li><a href="pages/login.html" target="iframe">Iniciar Sesion</a></li>
                    <li><a href="pages/registrate.html" target="iframe">Registrarse</a></li>
                </ul>
            </section>
        </ul>
        </nav>
        <iframe id="iframe" name="iframe" src="pages/home.html">
        </iframe>
        <div class="social">
        <ul>
            <li><a href="http://www.facebook.com" class="icon-facebook2"></a></li>
            <li><a href="http://www.twitter.com" class="icon-twitter2"></a></li>
            <li><a href="http://plus.google.com" class="icon-google-plus2"></a></li>
             <li><a href="http://https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=12&ct=1430950593&rver=6.4.6456.0&wp=MBI_SSL_SHARED&wreply=https:%2F%2Fblu175.mail.live.com%2Fdefault.aspx%3Frru%3Dinbox&lc=3082&id=64855&mkt=es-es&cbcxt=mai" class="icon-mail"></a></li>
            
        </ul>
        </div> 
    </body>
</html>