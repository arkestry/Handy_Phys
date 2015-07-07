<%-- 
    Document   : coms_demo_addCom
    Created on : Jul 1, 2015, 7:19:34 PM
    Author     : me
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,classes.sql;" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/coms.js"></script>
    </head>
    <body>
        <% 
            String comment=request.getParameter("com");
             Connection con = sql.conectar();
            PreparedStatement ps = con.prepareStatement("CALL addComment(?,?,?)");
            ps.setInt(1,0);
            ps.setInt(2,0);
            ps.setString(3,comment);
            ps.executeQuery();
        %>
        <script> window.location.href = "todo_articulos.jsp"</script>
        <!--a href="../jsp/coms_demo.jsp" class="btn btn-default">Push</a-->
    </body>
</html>
