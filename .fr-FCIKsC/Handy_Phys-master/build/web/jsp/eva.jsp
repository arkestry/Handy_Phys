<%-- 
    Document   : eva
    Created on : 29/06/2015, 07:39:34 PM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="./js/jquery-1.11.3.min.js"></script>
         <script src="../js/muestra.js"></script>  
         <link rel="stylesheet" href="../css/estilo_menu.css">
    </head>
    <body>
        <%
           Integer aciertos=(Integer)session.getAttribute("sAciertos");
           Integer errores=(Integer)session.getAttribute("sErrores");
           session.setAttribute("asnwer",request.getParameter("respuesta"));
           String respuesta=(String)session.getAttribute("asnwer");
           if(respuesta.equals("correcta")){
               aciertos=aciertos+1;
               session.setAttribute("sAciertos",aciertos);
           }
           else{
               errores=errores+1;
               session.setAttribute("sErrores",errores);
           }

           if(session.getAttribute("sErrores")==null){
               session.setAttribute("sErrores",0);
           } 
        %>
        <jsp:forward page="../pages/simuladorEjemp2.jsp"></jsp:forward>
    </body>
</html>
