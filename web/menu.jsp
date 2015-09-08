<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.userBean"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Menu Principal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <script>
           
               function send(){
                   var prioridad = $('#prioridadAv option:selected').val();
                   var cuerpo = $('#enviarAviso').html();
                 
                   
                   $.ajax({
                       url: "servlets/Avisos",
                       type: 'POST',
                       data: {plantilla: cuerpo,tituloAv: $('#tituloAv').val(), cuerpoAv: $('#cuerpoAv').val(), prioridadAv: prioridad, grupoAv: $('#grupoAv').val()},
                       async: true,
                       beforeSend: function(){$('#enviarAviso').html('<h1>Enviando aviso...</h1>');},
                       success: function(html){
                           $('#enviarAviso').html(html);
                           alert("Aviso enviado correctamente");
                        },
                       error: function(err){
                           alert("Ha habido un error al intentar mandar su petición"+err.toString());
                       }
                       
                   });
               };
        function verificaGrupo(texto){
            console.log(texto.value);
            $.ajax({
                url: "servlets/Grupos",
                type: "POST",
                data: {grupo: texto.value, tipo: "revisar"},
                success: function(html){
                    $('#grupoAv').css('border', html);
                }
            });
        }
            
        </script> 
          <%
    userBean usuario = null;    
    try{
        if(session.isNew()){
            session.setAttribute("tipo", "Anonimo");
            usuario = new userBean();
            usuario.setUserName("Anonimo");
            usuario.setFullName("Anonimo");
            usuario.setEmail("Anonimo");
            session.setAttribute("userData", usuario);
        }else{
            usuario = (userBean)session.getAttribute("userData");
        }
        if(session.getAttribute("tipo").equals("Administrador")){
            %>
            <style>
                nav{
                    background-color: #ECF0F1;
                    color: #141414;
                }
                #hmenu{
                    background-color: #ECF0F1;
                    color: #141414;
                }
                label{
                    color: #141414;
                }
                .menu a{
                    color: #141414;
                }
                section ul{
                    background-color: #3A539B;
                }
                .menu li:hover{
                    box-shadow: 0 0  #AD1A1A inset;  
                }
            </style>
    <%
        }
       }catch(Exception e){
           session.invalidate();
           out.println("<script>window.location.reload()</script>");
       }
    %>
    </head>
  
    <body>
        <img id="muestrame" style="position: fixed" class="zigma" src="../assets/icons/zigma.png" alt="zigma">
        <div id="hmenu"  class="navbar navbar-inverse col-xs-12">
            <button class="btn mostrarLink btn-link" style="background-color: #141414; position: relative; top: .8em; right: -5em; border-radius: 50px">
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
                    <li style="color: whitesmoke"><a class="sublist" href="../jsp/login.jsp" >Iniciar Sesion</a></li>
                    <li style="color: whitesmoke"><a class="sublist" href="../jsp/registrate.jsp" >Registrarse</a></li>
                    <%}%>
                    <%
                    if(session.getAttribute("tipo").equals("Administrador") || session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){%>
                    <form action="../jsp/logout.jsp" method="POST"><li style="color: #ECF0F1"><input type="submit" style="position: absolute; opacity: 0; left: 0.1em; height: 1.3em; width: 100%">Cerrar sesion</li></form>
                    <%}%>
                    
                </ul>
            </ul>
            <% if(!session.getAttribute("tipo").equals("Anonimo")){             
            %>
            <ul id="menuNo" s>
            <li><span class="glyphicon glyphicon-alert btn-lg" style="color: #ECF0F1; top: .2em; cursor: pointer"></span>
                 <% 
                if(session.getAttribute("tipo").equals("Alumno")){
                %>
                <ul class="cajaNo list-unstyled">
                    <section id="avisos" style="margin: 1em;">
                        <!--Esto esta al proposito -->
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
            </ul> 
        
        <section class="">
            <form class="form-inline text-right" action="../jsp/busca.jsp" method="GET">
                    <section class="form-group">
                    <section>
                        
                        <input id="buscar" type="text" class="form-control" name="palabraClave"  placeholder="Buscar">
                        <button type="submit" id="btn_buscar" class="btn boton"><span class="glyphicon glyphicon-search"></span></button>
                       
                    </section>
                </section>
            </form>
        </section>
            <% } %>
        </div>
    
            <nav>
                <ul class="menu" id="Principal">
            <li><a href="../index.jsp" >Página Principal</a></li>
            <% 
                if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
            <li><a href="../jsp/profile.jsp?correo=<%=usuario.getEmail() %>" >Mi Perfíl</a></li>
            <% 
                if(session.getAttribute("tipo").equals("Alumno")){ %>
             <li><a href="../jsp/mis_preguntas.jsp" >Mis Preguntas</a></li>
            <%}
                }%>
            <li onClick="mostrar(contentS)"><a href="#">Contenido</a></li>
            <section id="contentS" name="onMenu">
                <ul class="list-unstyled text-uppercase text-right list-group-item-text">
                    <li><a class="sublist" href="../jsp/todo_articulos.jsp" >Teoria</a></li>
                    <li><a class="sublist" href="../jsp/todo_preguntas.jsp" >Preguntas</a></li>
                    <li><a class="sublist" href="../jsp/examenes.jsp" >Examenes</a></li>
                    <%
                        if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
                    <li><a class="sublist" href="../jsp/todo_simulExam.jsp" >Simulador Examen</a></li>
                    <% }%>
                </ul>
            </section>
            <%
            
             if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
            <li onclick="mostrar(feedS)"><a href="#">Feedback</a></li>
            <section id="feedS" name="onMenu">
                <form action="../jsp/enviarFeed.jsp" class="form"   method="post">
                    <section class="text-center col-xs-12 form-group">
                        <textarea class="form-control " rows="3" name="feed" placeholder="Escribe una sugerencia"></textarea>
                    </section>
                    <br>
                    <section class="form-group col-xs-12">
                        <button type="submit" class="col-xs-12 btn boton"><span class="glyphicon glyphicon-check"></span> </button>
                    </section>
                </form>
            </section>
              <li><a href="../jsp/ConfigurarCuenta.jsp" >Configuración de Cuenta</a></li><%} %>
            <%if(session.getAttribute("tipo").equals("Administrador")){ %>
            <li><a href="../jsp/admin_indexSPS.jsp" >Registro de Actividad</a></li>
            <li><a href="../jsp/admin_feedback.jsp" >Feedback</a></li>
            <li><a href="../jsp/admin_reporte.jsp" >Reportes</a></li>
            <li><a href="../jsp/registroProfe.jsp" >Registrar profesor</a></li>
            <li><a href="../jsp/admin_blacklist.jsp" >BlackList</a></li>
          
            <%}%>
        </ul>
        </nav>
        
    </body>
</html>

<!--MD5
/rdY/rS0VqFyWK56rFDf/rSiDRd6Dq61WTdfDTycr161eaDfDTTyWK5WAq61WTd56TTyWK5TDq61WTD/6F6yDYaf/rSi/r/Y/rSiAldr/rSiqyaRDR/8/rSiuq61WTM5RLarAl//6aAyWK5ar261WT05/rSiqTGUAq61WTDa/rSi/rS1rRRa6lDqAqoU6161W261eq61WTx5/rSi6FyTr161WTRrAl//RT=yWK5ArlSyWFTyWTTyWK7yWK7yWK7yWK7yWK7yWK7yWK7yWK5eAR85/rSirTGADROyWK5rD6/56lD/A6jyWTTyWYyAAR/qAq61WTRdr6aeR6RW/rSiq2jyWTTyWYySDR/eA6oTDROyWK5/RLae/rSir1jyWTaUR6RuDRWyWK70dX61WTDa/rSir6a8r161WTDarX61WYSiWr6yWK55/rSirTar/rSiW16ZArTjqaSyWK7yWTT9Vq6ZDA44
-->