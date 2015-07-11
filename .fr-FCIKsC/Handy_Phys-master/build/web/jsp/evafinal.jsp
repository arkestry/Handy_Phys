<%-- 
    Document   : eva4
    Created on : 6/07/2015, 05:12:01 PM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="./js/jquery-1.11.3.min.js"></script>
         <script src="../js/muestra.js"></script>  
         <link rel="stylesheet" href="../css/estilo_menu.css">
    </head>
    <body>
        <h1>Tus resultados</h1>
        <br>
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
           aciertos=Integer.parseInt(session.getAttribute("sAciertos").toString());
           errores=Integer.parseInt(session.getAttribute("sErrores").toString());
           out.print("<label>Aciertos: </label>"+aciertos);
           out.print("<br><br>");
           out.print("<label>Errores: </label>"+errores);
           out.print("<br><br>");
           if(aciertos==4){
               out.print("<label>Perfecto</label>");
           }
           else{
               if(aciertos==3){
                   out.println("<label>Bien hecho</label>");
                   out.print("<br><br>");
               }
               else{
                   if(aciertos==2){
                        out.println("<label>Puedes mejorar ¡Esfuerzate!</label>");
                        out.print("<br><br>");
                   }
                   else{
                       if(aciertos==1){
                            out.println("<label>Necesitas estudiar ¡Esfuerzate!</label>");
                            out.print("<br><br>");
                       }
                       else{
                           if(aciertos==0){
                               out.println("<label>¡Tache todo esta mal! ¡Esfuerzate!</label>");
                               out.print("<br><br>");
                           }
                           else{
                               if(aciertos>5||aciertos<0){
                                   out.println("<label>Los hacks. Asi no se puede amigo</label>");
                                   out.print("<br><br>");
                               }
                           }
                       }
                   }
               }
           }
           session.setAttribute("sAciertos",0);
            session.setAttribute("sErrores",0);
           %>
           <a href="../pages/simulExamen.html"><input type="button" value="Terminar Examen" class="btn-warning center-block"></a>
           

    </body>
</html>
