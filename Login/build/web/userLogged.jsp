   <%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="ExamplePackage.UserBean"
   %>

   <html>

      <head>
         <meta http-equiv="Content-Type" 
            content="text/html; charset=windows-1256">
         <title>   User Logged Successfully   </title>
      </head>
	
      <body>

         <center>
            <% UserBean currentUser = (UserBean (session.getAttribute("currentSessionUser"));%>
			
            Welcome <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>
         </center>

      </body>
	
   </html>