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
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
       <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script>
            var mathcPass = false
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
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
                <h1 class="text-right text-uppercase" >Configuracion de cuenta</h1>
             <section id="datosC">

                 <form id="form" action="../servlets/updatePhoto" >
                     <label id="userPic"><img id="ProfileImage" style=" width: 120px; height: 120px" src="<%=urlImage %>" alt="<%= usuario.getProfilePict() %>" width="120px" height="120px"><button type="button" class="btn btn-info" style=" cursor: pointer; background: none; width: 120px; border-top: none">Subir foto <span class=" glyphicon glyphicon-upload"></span></button><input id="file"  style="opacity: .0; width: 120px; position: relative; top: -1.7em; cursor: pointer" type="file"  class="subirFoto"></label>
                 </form>
                 <form method="POST" onsubmit="validame(this)" action="../servlets/cambiarDatos">
                     <section style=" margin-top: 3em;">
                         <h3>Nombre de usuario: <small><input name="nick" type="text" class="form-control" placeholder="<%= usuario.getUserName() %>" value="<%= usuario.getUserName() %>"></small></h3>
                         <h3>Nombre real: <small><input name="name" type="text" class=" form-control" value="<%= usuario.getFullName() %>" placeholder="<%= usuario.getFullName() %>"></small></h3>
                         <h3>Nueva contraseña: <small><input class="form-control" name="newPass" id="newPass" type="password"  placeholder=""></small></h3>
                         <h3>Confirmar contraseña: <small><input class="form-control" name="confNewPass" id="confNewPass" onkeyup="isSame()" type="password" ></small></h3>
                         <h3>Contraseña actual: <small><input class="form-control" name="pass" id="pass" type="password"  placeholder=""></small></h3>
                         <input type="submit" id="GuardaC" class="btn btn-success btn-block" value="Guardar cambios">
                         <input type="button" onclick="window.location.href = 'profile.jsp'" id="CancelarC" class="btn btn-success btn-block" value="Cancelar">
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

