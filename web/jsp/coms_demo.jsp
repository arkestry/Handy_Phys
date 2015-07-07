<%-- 
    Document   : coms_demo
    Created on : Jul 1, 2015, 5:57:01 PM
    Author     : me
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*,classes.sql;" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <script src="../css/bootstrap/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/coms.js"></script>
        <script src="../js/muestra.js"></script>
    </head>
    <body >
        
        <div class="container">
            <div >
                <h1 class="tituloArt" id="title">VECTORES<small>por:elBuenMaestro</small></h1> 
            </div>
            <br>
            <br>
            <hr>
                <div>
                    <h3>En física</h3><h4> un vector (también llamado vector euclidiano o vector geométrico) es una magnitud física definida por un punto del espacio donde se mide dicha magnitud, además de un módulo (o longitud), su dirección (u orientación) y su sentido (que distingue el origen del extremo).1 2 3

En Matemáticas se define un vector como un elemento de un espacio vectorial. Esta noción es más abstracta y para muchos espacios vectoriales no es posible representar sus vectores mediante el módulo, la longitud y la orientación. En particular los espacios de dimensión infinita sin producto escalar no son representables de ese modo. Los vectores en un espacio euclídeo se pueden representar geométricamente como segmentos de recta dirigidos («flechas») en el plano \R^2 o en el espacio \R^3.

Algunos ejemplos de magnitudes físicas que son magnitudes vectoriales: la velocidad con que se desplaza un móvil, ya que no queda definida tan sólo por su módulo (lo que marca el velocímetro, en el caso de un automóvil), sino que se requiere indicar la dirección y el sentido (hacia donde se dirige); la fuerza que actúa sobre un objeto, ya que su efecto depende, además de su intensidad o módulo, de la dirección en la que actúa; también, el desplazamiento de un objeto.
                    </h4>
<img src="../assets/vector.svg">
<h4>
    Definición[editar]

Componentes de un vector.
Se llama vector de dimensión n , a una tupla de n , números reales (que se llaman componentes del vector). El conjunto de todos los vectores de dimensión n , se representa como R (formado mediante el producto cartesiano).

Así, un vector v perteneciente a un espacio R se representa como:
</h4>
<img src="../assets/vector2.svg">
            </div>
            <form class="form-group" action="coms_demo_addCom.jsp" method="post">
            <label for="com">
                Escriba su comentario amable lector de esta bonita página que sin usted no podría existir ;)
            </label>
            <textarea class="form-control" id="com" name="com">
                
            </textarea>
            <input  type="submit" class="btn btn-info" value="Ingresar">
            </form>
            <br>
            <br>
            <br>
            <% 
             Connection con = sql.conectar();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM coms");
            ResultSet rs= ps.executeQuery();
            
            while(rs.next()){
            out.println("<div class='panel panel-default'> <div class='panel-heading'><span class='glyphicon glyphicon-user' aria-hidden='true'></span>"
                    + rs.getInt("idUsuario")+"</div><div class='panel-body'><h4 class='text-primary'>"+rs.getString("cuerpo")+"</h4></div><div class='panel-footer'>"
                    + "<h6 class='text-muted'>"+rs.getString("horaFecha")+"</h6></div></div>" );
            }
        %>
        </div>
    </body>
</html>
