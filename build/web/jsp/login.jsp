
        <% 
            
            if(session.getAttribute("tipo").equals("Anonimo")){
                String pass = (String)request.getParameter("pass");
                String email = (String)request.getParameter("email");
                out.println();
                if(pass.equals("Profesor")){
                    session.setAttribute("email", email);
                    session.setAttribute("tipo", "Profesor"); 
                    
                 }else{
                    if(pass.equals("Alumno")){
                        session.setAttribute("tipo", "Alumno"); 
                        session.setAttribute("email", email);
                    }else{
                        if(pass.equals("Admin")){
                            session.setAttribute("tipo", "Admin");
                            session.setAttribute("email", email);
                        }
                    }
                }
                
            }
        %>
<script>
window.top.window.location.reload();
</script>