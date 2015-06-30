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
    </head>
    <body>
        <%
           int aciertos=0;
           int errores=0;
           session.setAttribute("asnwer",request.getParameter("respuesta"));
           String respuesta=(String)session.getAttribute("asnwer");
           out.print("respuesta="+respuesta);
           if(respuesta.equals("correcta")){
               aciertos=aciertos+1;
               session.setAttribute("sAciertos",aciertos);
           }
           else{
               errores=errores+1;
               session.setAttribute("sErrores",errores);
           }
           out.println("tus aciertos"+session.getAttribute("sAciertos"));
           out.println("tus aciertos"+session.getAttribute("sErrores"));
        %>
    </body>
</html>
