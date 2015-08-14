<%-- 
    Document   : hacer_pregunta
    Created on : 13/08/2015, 08:53:06 PM
    Author     : ivan-hdz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        
        <!-- Dependencias de summernote -->
        <script src="../js/code.jquery.com_jquery-1.9.1.min.js" type="text/javascript"></script>
        <link href="../js/netdna.bootstrapcdn.com_bootstrap_3.0.1_css_bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/netdna.bootstrapcdn.com_bootstrap_3.0.1_js_bootstrap.min.js" type="text/javascript"></script>
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
        <!--Summernote-->
       <script src="../js/dist-editor/summernote.min.js" type="text/javascript"></script>
       <link href="../js/dist-editor/summernote.css" rel="stylesheet" type="text/css"/>
       <!--Estilos propios-->
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../js/editor.js" type="text/javascript"></script>
        <script>
            function enviar(f){
                var code = document.getElementById("code");
                code.value = $('#summernote').code();
                
                f.submit();
            }
        </script>
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
        <article>
            <h1 class="text-center page-header">
                Pregunta sobre algo que te inquiete...
            </h1>
            <p id="p_preg_alg">
                Pregunte a la comunidad...
            </p>
        </article>
        <div class="container" id="preg_algo_container">
            <form class="form-group" action="../servlets/generarHTML" method="POST" onsubmit="enviar(this)">
                <input type="hidden" name="section" value="preguntas">
                <label class="subtitle">
                    Titulo de la pregunta:
                </label>
                <input type="text" name="title" class="form-control">
                <label class="subtitle">
                    Descripcion de la pregunta:
                </label>  
                <div id="summernote">               
                </div><input type="hidden" name="code" id="code">
                <br>
                <p>
                    <!--input type="file"  class="btn btn-default" -->
                    <input type="submit" value="Enviar pregunta" class="btn btn-primary btn-lg" role="button" style="float:right">
                </p>
            </form>
        </div>
        </section>
    </body>
</html>
