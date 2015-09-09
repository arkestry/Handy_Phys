<%-- 
    Document   : verSimulador
    Created on : 6/08/2015, 10:15:33 PM
    Author     : ivan-hdz
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="classes.serializar"%>
<%@page import="beans.Simulador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = request.getParameter("archivo");
    int num = Integer.parseInt(request.getParameter("num"));
    String titulo = request.getParameter("titulo");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simulador</title>
         <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>  
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script>

var num = <%=num%>;
var cuantos = 0;
var check;
function checar(){
    $('input[name=resp]').click(function(){
        check['preg'+num] = this.value;
    });
}
$(document).ready(function(){
    $('#n').click(function(){
        if(num>cuantos){
            sendAnsw();
        }
    });
});
function sig(){
    var preg = $.ajax({
       url: "../servlets/sigPregunta",
       data: {cual: num, url: '<%=url%>', tipo: 'preg'},
       method: 'POST',
       async: false
    });
    preg.done(function(res){
        $('#preg').html(res);
    });
    var resp = $.ajax({
        url: "../servlets/sigPregunta",
        data: {cual: num, url: '<%=url%>', tipo: 'resp'},
        method: 'POST',
        async: false
    });
    resp.done(function(res){
        $('#resp').html(res);
    });
    num++;
}
function sendAnsw(){
    var semiFin = $.ajax({
       url: "../servlets/sigPregunta",
       method: 'POST',
       async: false,
       data: {url: '<%=url%>', tipo: 'semiFin', index: cuantos},
       beforeSend: function(){alert("Cargando Resultados...");}
    });
    semiFin.done(function(back){
        $('#cuerpo').html(back);
    });
    for(var i = 0; i < cuantos; i++){
        $('#ansFinal'+(i+1)).val(check['preg'+(i+1)]);
        console.log($('#ansFinal'+(i+1)).val());
    }
    $('#url').val('<%=url%>');
    $('#formu').submit();
}
function start(){
    sig();
    cuantos = parseInt($("span[id='cuantas']").attr('value'));
    check = [];
    for(var i = 0; i < cuantos; i++){
        check['preg'+(i+1)] = '';
    }
    console.log('Test inicializado');
}
//Para modificar los estilos de la pantalla de resultados ir a sigPreguntas.java
        </script>
    </head>
    <body onload="start()" id="cuerpo">
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
            <section class="bg bgtest"></section>
            <h1 class="text-center text-danger"><%=titulo %> </h1>
            <section class="container">
                <p id="preg" class="h3"></p>
                <label>Respuestas: </label>
                <p onchange="checar()" id="resp" class="h4"></p> <!--PARA MODIFICAR LOS ESTILOS DE LAS RESPUESTAS VER LA CALSE JAVA DE SIGPREGUNTA -->
            </section>
            <section class="container">
            <button class="btn btn-danger" onclick="window.location.href = 'todo_simulExam.jsp'" type="button">Cancelar</button>
            <button id="n" onclick="sig()" style="float: right" class="btn btn-success">Siguiente Pregunta</button>
        </section>
        </section>
    </body>
</html>
