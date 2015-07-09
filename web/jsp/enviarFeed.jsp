<%-- 
    Document   : enviarFeed
    Created on : 08-jul-2015, 22:07:14
    Author     : Luis Enrique
--%>

 <%@page import="classes.sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
            Connection con = sql.conectar();
            String feed= request.getParameter("feed");
            String correo=(String)session.getAttribute("email");
            PreparedStatement ps = con.prepareStatement("call newFeed(?,?);");
            ps.setString(1, feed);
            ps.setString(2, correo);
           
            ps.executeQuery();
            System.out.println("enviado");
%>
<jsp:forward page="../pages/home.html"></jsp:forward>