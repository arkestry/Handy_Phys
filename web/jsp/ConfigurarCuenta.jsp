<%-- 
    Document   : ConfigurarCuenta
    Created on : 10/08/2015, 07:09:31 PM
    Author     : ivan-hdz
--%>

<%@page import="beans.userBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    userBean usuario = (userBean)session.getAttribute("userData");
    String urlImage = "../images/profileImages/"+usuario.getProfilePict();
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Configurar cuenta</title>
        <script src="../js/jquery-1.11.3.min.js"></script>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
       <link rel="stylesheet" href="../css/estilo_menu.css">
       <script src="../js/muestra.js" type="text/javascript"></script>
        <script>
            var mathcPass = false;
            function isSame(){
                if($('#newPass').val() === $('#confNewPass').val()){
                    $('#confNewPass').css('border','3px solid #4cae4c');
                    mathcPass = true;
                }else{
                    $('#confNewPass').css('border','3px solid #96281B');
                }
            }
            function validame(f){
                if(mathcPass === true || ($('#newPass').val() === "" && $('#confNewPass').val() === "")){
                    f.submit();
                    return true;
                }else{
                    alert("Las contraseñas no coinciden");
                    $('#confNewPass').focus();
                    return false;
                }
            }
$(document).ready(function (e) {
    $('#form').on('submit',(function(e) {
        e.preventDefault();
        var data = new FormData();
        $.each($('#file')[0].files, function(i, file) {
                data.append('file-'+i, file);
        });
        console.log(data);
        $.ajax({
            type:'POST',
            url: $(this).attr('action'),
            data: data,
            cache:false,
            contentType: false,
            processData: false,
            success:function(data){
                $('#ProfileImage').attr('src', data);
                console.log("success");
                console.log(data);
            },
            error: function(data){
                console.log("error");
                console.log(data);
            }
        });
    }));

    $("#file").on("change", function() {
        $("#form").submit();
    });
});
        </script>
    </head>
    <body class="text-center">
        <section class="integrarMenu">
         <img id="muestrame" class="zigma" src="../assets/icons/zigma.png" alt="zigma">
        <div id="hmenu" class="navbar navbar-inverse col-xs-12">
            <button class="btn mostrarLink btn-link" style="background-color: #141414; position: relative;border-radius: 10px; top: .8em; right: 52.7em">
                    <span  
                    <% if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){%>
                    class="glyphicon glyphicon-log-out"></span>
                    <%}else{%>
                        class="glyphicon glyphicon-log-in"></span>
                    <%}%> 
            </button>
            <ul style="position: absolute; top: 3.5em; " class="list-unstyled text-uppercase log list-inline  list-group-item-text">
                
                <ul class="keys mostrarSeccion list-group-item  list-unstyled" >
                    
                    <% if(session.isNew() || session.getAttribute("tipo").equals("Anonimo")){ %>
                    <li><a class="sublist" href="../jsp/login.jsp" target="_top">Iniciar Sesion</a></li>
                    <li><a class="sublist" href="../jsp/registrate.jsp" target="_top">Registrarse</a></li>
                    <%}%>
                    <%
                    if(session.getAttribute("tipo").equals("Administrador") || session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){%>
                    <form action="../jsp/logout.jsp" method="POST"><li style="color: #ECF0F1"><input type="submit" style="position: absolute; opacity: 0; left: 0.1em; height: 1.3em; width: 100%">Cerrar sesion</li></form>
                    <%}%>
                    
                </ul>
            </ul>
            <% if(!session.getAttribute("tipo").equals("Anonimo")){             
            %>
            <ul id="menuNo" >
            <li><span class="glyphicon glyphicon-alert btn-lg" style="color: #ECF0F1; top: .2em; cursor: pointer"></span>
                 <% 
                if(session.getAttribute("tipo").equals("Alumno")){
                %>
                <ul class="cajaNo list-unstyled">
                    <section id="avisos" style="margin: 1em;">
                    
                    </section>
                </ul>
                <script>
                    setInterval(getAvisos, 59000);
                    getAvisos();
                    function getAvisos(){
                        $.ajax({
                            url: "../servlets/getAvisos",
                            type: "POST",
                            success: function(html){
                                $('#avisos').html(html);
                                console.log("success");
                            }
                        });
                    }
                </script>
                <% }
                    if(session.getAttribute("tipo").equals("Profesor")){ %>
                    <ul class="cajaNo list-unstyled" id="enviarAviso">
                    <li><label>Crear aviso</label></li>
                    <li> 
                        <section style="padding: 5px">

                            <section>
                                Titulo Aviso: <input style="color: #141414" type="text" size="30" id="tituloAv" name="tituloAv">
                                <section style="margin: 2px;">Aviso: <br>
                                    <textarea maxlength="100" style="color: #141414" id="cuerpoAv" name="cuerpoAv"></textarea>
                                </section>
                                <section>
                                    <select style="color: black" id="prioridadAv" name="prioridadAv">
                                        <option value="1">Prioridad alta</option>
                                        <option value="2">Prioridad media</option>
                                        <option value="3">Prioridad baja</option>
                                    </select>
                                </section>
                                <section>
                                    <lable for="grupoAv">Grupo al que va dirigido el aviso:<input style="color: #141414" onkeyup="verificaGrupo(this)" type="text" maxlength="10" id="grupoAv"></lable>
                                </section>
                                <br>
                                <input  class="btn boton btn-block" onclick="send()" type="button" value="ENVIAR">
                            </section>
                        </section></li>   
                        
               </ul> <%}
                %>     
                 <label><%=((userBean)session.getAttribute("userData")).getUserName() %></label></li>   
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
            <li><a href="../index.jsp" target="_top">Página Principal</a></li>
            <% 
                if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
            <li><a href="../jsp/profile.jsp?correo=<%=usuario.getEmail() %>" target="_top">Mi Perfíl</a></li>
            <% 
                if(session.getAttribute("tipo").equals("Alumno")){ %>
             <li><a href="../jsp/mis_preguntas.jsp" target="_top">Mis Preguntas</a></li>
            <%}
                }%>
            <li onClick="mostrar(contentS)"><a href="#">Contenido</a></li>
            <section id="contentS" name="onMenu">
                <ul class="list-unstyled text-uppercase text-right list-group-item-text">
                    <li><a class="sublist" href="../jsp/todo_articulos.jsp" target="_top">Teoria</a></li>
                    <li><a class="sublist" href="../jsp/todo_preguntas.jsp" target="_top">Preguntas</a></li>
                    <li><a class="sublist" href="../jsp/examenes.jsp" target="_top">Examenes</a></li>
                    <%
                        if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
                    <li><a class="sublist" href="../jsp/todo_simulExam.jsp" target="_top">Simulador Examen</a></li>
                    <% }%>
                </ul>
            </section>
            <%
            
             if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
            <li onclick="mostrar(feedS)"><a href="#">Feedback</a></li>
            <section id="feedS" name="onMenu">
                <form action="enviarFeed.jsp" class="form" target="_top"  method="post">
                    <section class="text-center col-xs-12 form-group">
                        <textarea class="form-control " rows="3" name="feed" placeholder="Escribe una sugerencia"></textarea>
                    </section>
                    <br>
                    <section class="form-group col-xs-12">
                        <button type="submit" class="col-xs-12 btn boton"><span class="glyphicon glyphicon-check"></span> </button>
                    </section>
                </form>
            </section>
              <li><a href="../jsp/ConfigurarCuenta.jsp" target="_top">Configuración de Cuenta</a></li><%} %>
            <%if(session.getAttribute("tipo").equals("Administrador")){ %>
            <li><a href="../jsp/admin_indexSPS.jsp" target="_top">Registro de Actividad</a></li>
            <li><a href="../jsp/admin_feedback.jsp" target="_top">Feedback</a></li>
            <li><a href="../jsp/admin_reporte.jsp" target="_top">Reportes</a></li>
            <li><a href="../jsp/registroProfe.jsp" target="_top">Registrar profesor</a></li>
            <li><a href="../jsp/admin_blacklist.jsp" target="_top">BlackList</a></li>
          
            <%}%>
        </ul>
        </nav>
           
        </section>
        <section class="integrarCont">
                <section class="bg bgconfig"></section>
                <h1 style="color: #141414" class="text-right text-uppercase" >Configuracion de cuenta</h1>
                <section id="dato sC" style="padding: 2.5em;padding-bottom: 0em; border-bottom: 35px solid teal; border-right: 25px solid teal">

                 <form id="form" action="../servlets/updatePhoto" >
                     <label id="userPic"><img id="ProfileImage" style=" width: 120px; height: 120px" src="<%=urlImage %>" alt="<%= usuario.getProfilePict() %>" width="120px" height="120px"><button type="button" class="btn btn-info" style=" cursor: pointer; background:  #ECF0F1; width: 120px; color: #141414 ;border-top: none">Subir foto <span class=" glyphicon glyphicon-upload"></span></button><input id="file"  style="opacity: .0; width: 120px; position: relative; top: -1.7em; cursor: pointer" type="file"  class="subirFoto"></label>
                 </form>
                 <form method="POST" onsubmit="validame(this)" action="../servlets/cambiarDatos">
                     <section style=" margin-top: 1.8em; width: 80%; position: relative; top: -13em; background-color: #141414; opacity: 0.95" class="container">
                         <h3 class="text-left">Nombre de usuario: <small><input name="nick" type="text" class="form-control" placeholder="<%= usuario.getUserName() %>" value="<%= usuario.getUserName() %>"></small></h3>
                         <h3 class="text-left">Nombre real: <small><input name="name" type="text" class=" form-control" value="<%= usuario.getFullName() %>" placeholder="<%= usuario.getFullName() %>"></small></h3>
                         <h3 class="text-left">Nueva contraseña: <small><input class="form-control" name="newPass" id="newPass" type="password"  placeholder=""></small></h3>
                         <h3 class="text-left">Confirmar contraseña: <small><input class="form-control" name="confNewPass" id="confNewPass" onkeyup="isSame()" type="password" ></small></h3>
                         <h3 class="text-left">Contraseña actual: <small><input class="form-control" name="pass" id="pass" type="password" required placeholder="Por su seguridad para cambiar algun dato necesita introducir su contraseña actual"></small></h3>
                         <input type="submit" id="GuardaC" class="btn btn-success" value="Guardar cambios">
                         <input type="button" onclick="window.location.href = 'profile.jsp?correo=<%=usuario.getEmail() %>'" id="CancelarC" class="btn btn-success" value="Cancelar">
                         <br><small>
                             Para hacer algun cambio de informacion, por su seguridad se requiere su contraseña
                         </small>
                     </section>
                 </form>
                         
             </section>
                
        </section>
    </body>
</html>

