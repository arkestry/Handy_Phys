/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

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
 * @author me
 */
public class getReporte extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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
        processRequest(request, response);
        int id=Integer.parseInt(request.getParameter("param1"));
        String statement="select reportes.id,reportes.titulo_reporte,reportes.cuerpo,\n" +
"    datos.nickname,reportes.id_gravedad,reportes.fecha from reportes  inner join usuarios \n" +
"    on usuarios.idUsuario=reportes.usuario_reportado inner join datos on usuarios.idDatos=datos.correo where reportes.id=?";
        String resp="";
        try {
            Connection con=sql.conectar();
            PreparedStatement ps=con.prepareStatement(statement);
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                resp=rs.getInt("id")+",";
                resp+=rs.getInt("id_gravedad")+",";
                resp+=rs.getString("titulo_reporte")+",";
                resp+=rs.getString("cuerpo")+",";
                resp+=rs.getString("fecha")+",";
                resp+=rs.getString("nickname");
            }
        } catch (SQLException ex) {
            Logger.getLogger(getReporte.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        PrintWriter out=response.getWriter();
        out.print(resp);
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
        processRequest(request, response);
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
