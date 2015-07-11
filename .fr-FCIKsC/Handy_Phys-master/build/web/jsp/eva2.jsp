<%-- 
    Document   : eva2
    Created on : 5/07/2015, 10:37:09 AM
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
            int aciertos=Integer.parseInt(session.getAttribute("sAciertos").toString());
           int errores=Integer.parseInt(session.getAttribute("sErrores").toString());
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
           <jsp:forward page="../pages/simuladorEjemp3.jsp"></jsp:forward>
    </body>
</html>
