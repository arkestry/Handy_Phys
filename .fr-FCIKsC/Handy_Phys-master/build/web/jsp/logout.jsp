<%
    if(!session.isNew()){
        session = request.getSession();
        session.invalidate();
    }
%>
<script>
   
    window.location.replace("../index.jsp");   
     window.location.href = "../index.jsp";
</script>