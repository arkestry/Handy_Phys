
        <% 
           
            String user = (String)request.getParameter("loginUser");
            String pass = (String)request.getParameter("loginPass");
            if(pass.equals("Profesor")){
                session.setAttribute("tipo", "Profesor"); %>
                <script>
                    window.top.window.location.reload();
                </script>
                <% 
            }else{
                if(pass.equals("Alumno")){
                    session.setAttribute("tipo", "Alumno"); %>
                    <script>
                        window.top.window.location.reload();
                    </script>
               <% }else{ %>
                    <script>
                        window.top.window.location.reload();
                    </script>
               <% }
            }
        %>
        