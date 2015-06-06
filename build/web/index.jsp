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
    <%
        
        if(session.isNew()){
            session.setAttribute("tipo", "Anonimo");
            
        }
    %>
    <body>
        <img id="muestrame" class="zigma" src="assets/icons/zigma.png" alt="zigma">
    	<div id="hmenu" class="navbar navbar-inverse col-xs-12">
            <% if(!session.getAttribute("tipo").equals("Anonimo")){             
            %>
            <ul id="menuNo">
            <li><span class="glyphicon glyphicon-alert btn-lg" style="color: #ECF0F1; top: .2em; "></span>
                 <% if(session.getAttribute("tipo").equals("Alumno")){%>
                <ul class="cajaNo list-unstyled">
                    <section style="margin: 1em;">
                    <li><label>Avisos</label></li>
                    <li class="altaPrioridad"><label>Titulo Aviso: </label><section>Aviso con alta prioridad</section></li>
                    <li class="mediaPrioridad"><label>Titulo Aviso: </label><section>Aviso con media prioridad</section></li>
                    <li class="bajaPrioridad"><label>Titulo Aviso: </label><section>Aviso con baja prioridad</section></li>
                    </section>
               </ul>
                <% }
                    if(session.getAttribute("tipo").equals("Profesor")){ %>
               <ul class="cajaNo list-unstyled">
                    <li><label>Crear aviso</label></li>
                    <li> 
                        <section style="padding: 5px">

                            <form>
                                Titulo Aviso: <input style="color: #141414" type="text" size="30" name="tituloNo">
                                <section style="margin: 2px;">Aviso: <br>
                                    <textarea maxlength="100" style="color: #141414"></textarea>
                                </section>
                                <section>
                                    <select style="color: black">
                                    <option>Prioridad alta</option>
                                    <option>Prioridad media</option>
                                    <option>Prioridad baja</option>
                                </select>
                                </section><br>
                                <input class="btn boton btn-block" type="submit" value="ENVIAR">
                            </form>
                        </section></li>   
                        
               </ul> <%}
                %>     
                 <label><%=session.getAttribute("email") %></label></li>   
            </ul> <% } %>
        
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
    
        <nav>
            <ul class="menu" id="Principal">
            <li><a href="pages/home.html" target="iframe">Página Principal</a></li>
            <% 
                if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
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
            <%
            
            if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
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
                    <% if(session.isNew() || session.getAttribute("tipo").equals("Anonimo")){ %>
                    <li><a href="pages/login.html" target="iframe">Iniciar Sesion</a></li>
                    <li><a href="pages/registrate.html" target="iframe">Registrarse</a></li>
                    <%}%>
                    <%
                    if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){%>
                    <form action="jsp/logout.jsp" method="POST"><li><input type="submit" style="position: absolute; opacity: 0; left: 0.1em; height: 1.3em; width: 100%">Cerrar sesion</li></form>
                    <%}%>
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

<!--MD5
/rdY/rS0VqFyWK56rFDf/rSiDRd6Dq61WTdfDTycr161eaDfDTTyWK5WAq61WTd56TTyWK5TDq61WTD/6F6yDYaf/rSi/r/Y/rSiAldr/rSiqyaRDR/8/rSiuq61WTM5RLarAl//6aAyWK5ar261WT05/rSiqTGUAq61WTDa/rSi/rS1rRRa6lDqAqoU6161W261eq61WTx5/rSi6FyTr161WTRrAl//RT=yWK5ArlSyWFTyWTTyWK7yWK7yWK7yWK7yWK7yWK7yWK7yWK5eAR85/rSirTGADROyWK5rD6/56lD/A6jyWTTyWYyAAR/qAq61WTRdr6aeR6RW/rSiq2jyWTTyWYySDR/eA6oTDROyWK5/RLae/rSir1jyWTaUR6RuDRWyWK70dX61WTDa/rSir6a8r161WTDarX61WYSiWr6yWK55/rSirTar/rSiW16ZArTjqaSyWK7yWTT9Vq6ZDA44
-->