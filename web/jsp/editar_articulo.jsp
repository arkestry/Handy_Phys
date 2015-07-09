<%-- 
    Document   : editar_articulo
    Created on : 8/07/2015, 09:02:24 PM
    Author     : ivan
--%>

<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
         BufferedReader br = null;
        String titulo, nombreArchivo,url, code;
        code = "";
        titulo = request.getParameter("titulo");
        nombreArchivo = request.getParameter("nombreArchivo");
        url = config.getServletContext().getRealPath("/articulos/")+"/"+nombreArchivo;
        try{
            br = new BufferedReader(new FileReader(url));
            while(br.readLine() != null){
                code = code+br.readLine();
            }
            
        }catch(IOException e){
           e.printStackTrace();
        }finally{
            br.reset();
        }
        System.out.println(url);
        System.out.println(code);
    %>
<!doctype html>
<html>
<head>
        <meta charset="UTF-8">
        <title>Untitled Document</title>
        <!-- Dependencias de summernote -->
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script> 
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet"> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script> 
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
            function recive(){
                var code = "<%= code %>";
                $('#summernote').code(code);
            }
        </script>
    </head>
    
    <body>
        <article>
             <h1 class="text-center page-header">
                Editar articulo: <small><%= titulo %></small>
            </h1>
            <p id="p_preg_alg" class="text-center">
                Escriba un articulo, con el proposito de contribuir en este entorno virtual
            </p>
        </article>
        <div class="container">
            <form method="POST" action="../servlets/generarHTML" class="form-group" onsubmit="enviar(this)">
                <input type="hidden" name="section" value="articulos">
                <label class="subtitle">
                    Titulo Articulo:
                </label>
                <input type="text" name="title" id="title" class="form-control">
                <label class="subtitle">
                    Cuerpo del Articulo:
                </label>  
                <div id="summernote"></div>
                <input name="code" id="code" type="hidden">
                <p>
                    <label class="subtitle">
                        Tags
                    </label>
                    Separados por Comas
                    <input type="text" class="form-control">
                </p>
                <p>
                   <br>
                    
                   <input type="submit" value="Publicar" class="btn btn-primary btn-lg" role="button" style="float:right">
                     
                    
                </p>
            </form>
        </div>