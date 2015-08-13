/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.userBean;
import classes.sql;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ivan-hdz
 */
public class Avisos extends HttpServlet {
    private int alta = 1;
    private int media = 2;
    private int baja = 3;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        try(PrintWriter out = response.getWriter();){
            /* TODO output your page here. You may use following sample code. */
            userBean usuario = (userBean)request.getSession().getAttribute("userData");
            String existe = "";
            Connection con = sql.conectar();
            PreparedStatement ps2 = con.prepareStatement("call get_IDGrupo(?)");
            ps2.setString(1, request.getParameter("grupoAv"));
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()){
                existe = rs2.getString(1);
            }
            if(!existe.equals("error")){
                PreparedStatement ps = con.prepareStatement("call insertar_Aviso(?,?,?,?,?)");
                ps.setInt(1, usuario.getIdUsuario());
                ps.setInt(2, Integer.parseInt(request.getParameter("prioridadAv")));
                ps.setInt(3, Integer.parseInt(existe));
                ps.setString(4, request.getParameter("tituloAv"));
                ps.setString(5, request.getParameter("cuerpoAv"));
                ps.executeUpdate();
                out.println(request.getParameter("plantilla"));
            }else{
               
                out.println("<h3>Favor de verificar la existencia del grupo. Si no existe el grupo, usted puede crear uno: <a id='liga'>AQUI </a></h3>");
                out.println("<script>$('#liga').click(function(){window.open('pages/addGrupo.html','width=180', 'height = 180','location=no','scrollbar=no','menubar=no','resizable=no','toolbar=no');});</script>");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Avisos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Avisos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
