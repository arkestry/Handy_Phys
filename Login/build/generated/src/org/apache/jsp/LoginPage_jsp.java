package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=windows-1256");
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
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("      <meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1256\">\n");
      out.write("\t\t<title>Login Page</title>\n");
      out.write("\t</head>\n");
      out.write("\n");
      out.write("\t<body>\n");
      out.write("\t\t<form action=\"LoginServlet\">\n");
      out.write("\n");
      out.write("\t\t\tPlease enter your username \t\t\n");
      out.write("\t\t\t<input type=\"text\" name=\"un\"/><br>\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t\tPlease enter your password\n");
      out.write("\t\t\t<input type=\"password\" name=\"pw\"/>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<input type=\"submit\" value=\"submit\">\t\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t</form>\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- En este caso la base de datos es: \n");
      out.write("create database login;\n");
      out.write("use login;\n");
      out.write("create table user (FirstName varchar(30), LastName varchar (30), username varchar (30),  password varchar (20));\n");
      out.write("\n");
      out.write("Solo hay que cambiar de acuerdo a la base de datos de zigma\n");
      out.write("-->\n");
      out.write("\n");
      out.write("<!--\n");
      out.write("Estuve checando esta informaci?n para hacer mejor el login\n");
      out.write("Explicacion de las clases\n");
      out.write("\n");
      out.write("La clase UserBean se utiliza para guardar los datos necesarios en la aplicacion (en forma de variables). \n");
      out.write("Estos datos son una representaci?n de los datos existentes en la base de datos\n");
      out.write("\n");
      out.write("La clase UserDAO son objetos responsables de la manipulaci?n de las interacciones con el origen de datos,\n");
      out.write("a través de la aplicaci?n el mecanismo da acceso requerido para trabajar con la fuente de datos.\n");
      out.write("\n");
      out.write("Esto sirve para Lectura de los datos de los datos (datos introducidos por el usuario) y comprobar su coherencia con el PP - \n");
      out.write("use Getters para obtener valores de las variables del Bean.\n");
      out.write("Recuperando datos de la DB y guardarlo en el Bean - utilize metodos Setter para establecer valores. \n");
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
