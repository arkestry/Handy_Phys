
        <% 
            session = request.getSession();
            if(session.getAttribute("tipo").equals("Anonimo")){
                String pass = (String)request.getParameter("loginPass");
                if(pass.equals("Profesor")){
                    session.setAttribute("tipo", "Profesor"); 
                 }
                if(pass.equals("Alumno")){
                    session.setAttribute("tipo", "Alumno"); 
                }
                
            }
        %>
<script>
window.top.window.location.reload();
</script>