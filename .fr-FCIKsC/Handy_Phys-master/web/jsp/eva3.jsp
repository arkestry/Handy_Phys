<%-- 
    Document   : eva3
    Created on : 6/07/2015, 05:10:17 PM
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
           %>
           <jsp:forward page="../pages/simulEjemp4.jsp"></jsp:forward>
    </body>
</html>
