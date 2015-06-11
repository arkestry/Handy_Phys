package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Menu Principal</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link href=\"css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/estilo_menu.css\">\n");
      out.write("        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/fonts.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/EsilosSocial.css\">\n");
      out.write("        <script src=\"./js/jquery-1.11.3.min.js\"></script>\n");
      out.write("         <script src=\"js/muestra.js\"></script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    ");

       
        if(session.isNew()){
            session.setAttribute("tipo", "Anonimo");
        }
        if(session.getAttribute("tipo").equals("Admin")){
            
      out.write("\n");
      out.write("            <style>\n");
      out.write("                nav{\n");
      out.write("                    background-color: #ECF0F1;\n");
      out.write("                    color: #141414;\n");
      out.write("                }\n");
      out.write("                #hmenu{\n");
      out.write("                    background-color: #ECF0F1;\n");
      out.write("                    color: #141414;\n");
      out.write("                }\n");
      out.write("                label{\n");
      out.write("                    color: #141414;\n");
      out.write("                }\n");
      out.write("                .menu a{\n");
      out.write("                    color: #141414;\n");
      out.write("                }\n");
      out.write("                section ul{\n");
      out.write("                    background-color: #3A539B;\n");
      out.write("                }\n");
      out.write("                .menu li:hover{\n");
      out.write("                    box-shadow: 0 0  #AD1A1A inset;  \n");
      out.write("                }\n");
      out.write("            </style>\n");
      out.write("    ");

        }
    
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <img id=\"muestrame\" class=\"zigma\" src=\"assets/icons/zigma.png\" alt=\"zigma\">\n");
      out.write("    \t<div id=\"hmenu\" class=\"navbar navbar-inverse col-xs-12\">\n");
      out.write("            <ul class=\"list-unstyled text-uppercase log list-inline  list-group-item-text\">\n");
      out.write("                <button class=\"btn btn-link\">\n");
      out.write("                    <span  \n");
      out.write("                    ");
 if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){
      out.write("\n");
      out.write("                    class=\"glyphicon glyphicon-log-out\"></span>\n");
      out.write("                    ");
}else{
      out.write("\n");
      out.write("                        class=\"glyphicon glyphicon-log-in\"></span>\n");
      out.write("                    ");
}
      out.write(" \n");
      out.write("                </button>\n");
      out.write("                <ul class=\"keys  list-group-item  list-unstyled\">\n");
      out.write("                    \n");
      out.write("                    ");
 if(session.isNew() || session.getAttribute("tipo").equals("Anonimo")){ 
      out.write("\n");
      out.write("                    <li><a class=\"sublist\" href=\"pages/login.html\" target=\"iframe\">Iniciar Sesion</a></li>\n");
      out.write("                    <li><a class=\"sublist\" href=\"pages/registrate.html\" target=\"iframe\">Registrarse</a></li>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                    ");

                    if(session.getAttribute("tipo").equals("Admin") || session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){
      out.write("\n");
      out.write("                    <form action=\"jsp/logout.jsp\" method=\"POST\"><li style=\"color: #ECF0F1\"><input type=\"submit\" style=\"position: absolute; opacity: 0; left: 0.1em; height: 1.3em; width: 100%\">Cerrar sesion</li></form>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                    \n");
      out.write("                </ul>\n");
      out.write("            </ul>\n");
      out.write("            ");
 if(!session.getAttribute("tipo").equals("Anonimo")){             
            
      out.write("\n");
      out.write("            <ul id=\"menuNo\">\n");
      out.write("            <li><span class=\"glyphicon glyphicon-alert btn-lg\" style=\"color: #ECF0F1; top: .2em; \"></span>\n");
      out.write("                 ");
 if(session.getAttribute("tipo").equals("Alumno")){
      out.write("\n");
      out.write("                <ul class=\"cajaNo list-unstyled\">\n");
      out.write("                    <section style=\"margin: 1em;\">\n");
      out.write("                    <li><label>Avisos</label></li>\n");
      out.write("                    <li class=\"altaPrioridad\"><label>Titulo Aviso: </label><section>Aviso con alta prioridad</section></li>\n");
      out.write("                    <li class=\"mediaPrioridad\"><label>Titulo Aviso: </label><section>Aviso con media prioridad</section></li>\n");
      out.write("                    <li class=\"bajaPrioridad\"><label>Titulo Aviso: </label><section>Aviso con baja prioridad</section></li>\n");
      out.write("                    </section>\n");
      out.write("               </ul>\n");
      out.write("                ");
 }
                    if(session.getAttribute("tipo").equals("Profesor")){ 
      out.write("\n");
      out.write("               <ul class=\"cajaNo list-unstyled\">\n");
      out.write("                    <li><label>Crear aviso</label></li>\n");
      out.write("                    <li> \n");
      out.write("                        <section style=\"padding: 5px\">\n");
      out.write("\n");
      out.write("                            <form>\n");
      out.write("                                Titulo Aviso: <input style=\"color: #141414\" type=\"text\" size=\"30\" name=\"tituloNo\">\n");
      out.write("                                <section style=\"margin: 2px;\">Aviso: <br>\n");
      out.write("                                    <textarea maxlength=\"100\" style=\"color: #141414\"></textarea>\n");
      out.write("                                </section>\n");
      out.write("                                <section>\n");
      out.write("                                    <select style=\"color: black\">\n");
      out.write("                                    <option>Prioridad alta</option>\n");
      out.write("                                    <option>Prioridad media</option>\n");
      out.write("                                    <option>Prioridad baja</option>\n");
      out.write("                                </select>\n");
      out.write("                                </section><br>\n");
      out.write("                                <input class=\"btn boton btn-block\" type=\"submit\" value=\"ENVIAR\">\n");
      out.write("                            </form>\n");
      out.write("                        </section></li>   \n");
      out.write("                        \n");
      out.write("               </ul> ");
}
                
      out.write("     \n");
      out.write("                 <label>");
      out.print(session.getAttribute("email") );
      out.write("</label></li>   \n");
      out.write("            </ul> ");
 } 
      out.write("\n");
      out.write("        \n");
      out.write("        <section class=\"\">\n");
      out.write("        \t<form class=\"form-inline text-right\">\n");
      out.write("                    <section class=\"form-group\">\n");
      out.write("                    <section>\n");
      out.write("                        <input id=\"buscar\" type=\"text\" class=\"form-control\"  placeholder=\"Buscar\">\n");
      out.write("                        <button id=\"btn_buscar\" class=\"btn boton\"><span class=\"glyphicon glyphicon-search\"></span></button>\n");
      out.write("                    </section>\n");
      out.write("                </section>\n");
      out.write("            </form>\n");
      out.write("        </section>\n");
      out.write("        </div>\n");
      out.write("    \n");
      out.write("            <nav>\n");
      out.write("                <ul class=\"menu\" id=\"Principal\">\n");
      out.write("            <li><a href=\"pages/home.html\" target=\"iframe\">Página Principal</a></li>\n");
      out.write("            ");
 
                if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ 
      out.write("\n");
      out.write("            <li><a href=\"pages/profile.html\" target=\"iframe\">Mi Perfíl</a></li>\n");
      out.write("            ");
 
                if(session.getAttribute("tipo").equals("Alumno")){ 
      out.write("\n");
      out.write("            <li><a onClick=\"mostrar(pYrS)\" href=\"#\">Mis Preguntas y Respuestas</a></li>\n");
      out.write("            <section id=\"pYrS\" name=\"onMenu\">\n");
      out.write("                <ul class=\"list-unstyled text-right text-uppercase list-group-item-text menu2\">\n");
      out.write("                    <li><a class=\"sublist\" href=\"pages/mis_preguntas.html\" target=\"iframe\">Mis Preguntas</a></li>\n");
      out.write("                    <li><a class=\"sublist\" href=\"pages/mis_respuestas.html\" target=\"iframe\">Mis Respuestas</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </section>\n");
      out.write("            ");
}
                }
      out.write("\n");
      out.write("            <li onClick=\"mostrar(contentS)\"><a href=\"#\">Contenido</a></li>\n");
      out.write("            <section id=\"contentS\" name=\"onMenu\">\n");
      out.write("                <ul class=\"list-unstyled text-uppercase text-right list-group-item-text\">\n");
      out.write("                    <li><a class=\"sublist\" href=\"pages/todo_articulos.html\" target=\"iframe\">Teoria</a></li>\n");
      out.write("                    <li><a class=\"sublist\" href=\"pages/todo_problemas.html\" target=\"iframe\">Problemas</a></li>\n");
      out.write("                    <li><a class=\"sublist\" href=\"pages/todo_preguntas.html\" target=\"iframe\">Preguntas</a></li>\n");
      out.write("                    <li>Examenes</li>\n");
      out.write("                    <li><a class=\"sublist\" href=\"pages/simulExamen.html\" target=\"iframe\">Simulador Examen</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </section>\n");
      out.write("            ");

            
            if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ 
      out.write("\n");
      out.write("            <li onclick=\"mostrar(feedS)\"><a href=\"#\">Feedback</a></li>\n");
      out.write("            <section id=\"feedS\" name=\"onMenu\">\n");
      out.write("                <form class=\"form\">\n");
      out.write("                    <section class=\"text-center col-xs-12 form-group\">\n");
      out.write("                        <textarea class=\"form-control \" rows=\"3\" placeholder=\"Escribe una sugerencia\"></textarea>\n");
      out.write("                    </section>\n");
      out.write("                    <br>\n");
      out.write("                    <section class=\"form-group col-xs-12\">\n");
      out.write("                            <button class=\"col-xs-12 btn boton\"><span class=\"glyphicon glyphicon-check\"></span> </button>\n");
      out.write("                    </section>\n");
      out.write("                </form>\n");
      out.write("            </section>\n");
      out.write("            <li><a href=\"pages/ConfigurarCuenta.html\" target=\"iframe\">Configuración de Cuenta</a></li>");
} 
      out.write("\n");
      out.write("        </ul>\n");
      out.write("        </nav>\n");
      out.write("        <iframe id=\"iframe\" name=\"iframe\" src=\"pages/home.html\">\n");
      out.write("        </iframe>\n");
      out.write("        <div class=\"social\">\n");
      out.write("        <ul>\n");
      out.write("            <li><a href=\"http://www.facebook.com\" class=\"icon-facebook2\"></a></li>\n");
      out.write("            <li><a href=\"http://www.twitter.com\" class=\"icon-twitter2\"></a></li>\n");
      out.write("            <li><a href=\"http://plus.google.com\" class=\"icon-google-plus2\"></a></li>\n");
      out.write("             <li><a href=\"http://https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=12&ct=1430950593&rver=6.4.6456.0&wp=MBI_SSL_SHARED&wreply=https:%2F%2Fblu175.mail.live.com%2Fdefault.aspx%3Frru%3Dinbox&lc=3082&id=64855&mkt=es-es&cbcxt=mai\" class=\"icon-mail\"></a></li>\n");
      out.write("            \n");
      out.write("        </ul>\n");
      out.write("        </div> \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!--MD5\n");
      out.write("/rdY/rS0VqFyWK56rFDf/rSiDRd6Dq61WTdfDTycr161eaDfDTTyWK5WAq61WTd56TTyWK5TDq61WTD/6F6yDYaf/rSi/r/Y/rSiAldr/rSiqyaRDR/8/rSiuq61WTM5RLarAl//6aAyWK5ar261WT05/rSiqTGUAq61WTDa/rSi/rS1rRRa6lDqAqoU6161W261eq61WTx5/rSi6FyTr161WTRrAl//RT=yWK5ArlSyWFTyWTTyWK7yWK7yWK7yWK7yWK7yWK7yWK7yWK5eAR85/rSirTGADROyWK5rD6/56lD/A6jyWTTyWYyAAR/qAq61WTRdr6aeR6RW/rSiq2jyWTTyWYySDR/eA6oTDROyWK5/RLae/rSir1jyWTaUR6RuDRWyWK70dX61WTDa/rSir6a8r161WTDarX61WYSiWr6yWK55/rSirTar/rSiW16ZArTjqaSyWK7yWTT9Vq6ZDA44\n");
      out.write("-->");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
