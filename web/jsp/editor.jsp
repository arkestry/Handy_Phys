<%-- 
    Document   : editar_articulo
    Created on : 8/07/2015, 09:02:24 PM
    Author     : ivan
--%>

<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
         BufferedReader br = null;
        String titulo, nombreArchivo,url, code, tipoCont;
        url = "";
        code = "";
        String line = "";
        tipoCont = request.getParameter("tipoCont");
        titulo = request.getParameter("titulo");
     
        nombreArchivo = request.getParameter("nombreArchivo");
     
        if(tipoCont.equals("1")){
            url = config.getServletContext().getRealPath("/articulos/")+"/"+nombreArchivo;
        }else{
            if(tipoCont.equals("2")){
                url = config.getServletContext().getRealPath("/preguntas/")+"/"+nombreArchivo;
            }
        }
        try{
            FileInputStream inputFile = new FileInputStream(url);
            br = new BufferedReader(new InputStreamReader(inputFile));
            
            while((line = br.readLine()) != null){
                if(line == null){
                    break;
                }else{
                    code = code+line;
                }
            }
            
        }catch(IOException e){
           e.printStackTrace();
        }finally{
            br.close();
        }
        
    %>
<!doctype html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta charset="UTF-8">
        <!-- Dependencias de summernote -->
        <script src="../js/code.jquery.com_jquery-1.9.1.min.js" type="text/javascript"></script>
        <link href="../js/netdna.bootstrapcdn.com_bootstrap_3.0.1_css_bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/netdna.bootstrapcdn.com_bootstrap_3.0.1_js_bootstrap.min.js" type="text/javascript"></script>
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
        <!--Summernote-->
       <script src="../js/summernote-es-ES.js" type="text/javascript"></script>
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
            $(document).ready(function(){
               $('#summernote').code('<%=code%>');
            });
      </script>
     
    </head>
    
    <body >
        <article>
             <h1 class="text-center page-header">
                Editar: <small><%= titulo %></small>
            </h1>
            
        </article>
        <div class="container">
            <form method="POST"  action="../servlets/actualizarHTML" class="form-group" onsubmit="enviar(this)">
                <input type="hidden" name="url" value="<%=url%>">
                <input type="hidden" name="tipoCont" value="<%= tipoCont%>">
               
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
            
    </body>
</html>