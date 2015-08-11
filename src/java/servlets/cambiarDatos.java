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
public class cambiarDatos extends HttpServlet {

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
        userBean usuario = (userBean)request.getSession().getAttribute("userData");
        String oldPass = request.getParameter("pass");
        String newPass = request.getParameter("newPass");
        try (PrintWriter out = response.getWriter()) {
            if(oldPass.equals(usuario.getPassword())){
                Connection con = sql.conectar();
                PreparedStatement ps = con.prepareStatement("call cambiarDatos(?,?,?,?)");
                if(newPass == null || newPass.equals("")){
                    ps.setString(1, usuario.getEmail());
                    ps.setString(2, request.getParameter("name"));
                    ps.setString(3, request.getParameter("nick"));
                    ps.setString(4, usuario.getPassword());
                    ps.executeUpdate();
                    response.sendRedirect("../jsp/ConfigurarCuenta.jsp");
                }else{
                    ps.setString(1, usuario.getEmail());
                    ps.setString(2, request.getParameter("name"));
                    ps.setString(3, request.getParameter("nick"));
                    ps.setString(4, newPass);
                    ps.executeUpdate();
                    response.sendRedirect("../jsp/ConfigurarCuenta.jsp");
                }
            }else{
                out.println("<script>window.location.href = '../jsp/ConfigurarCuenta.jsp'; alert('Antigua contraseña incorrecta');</script>");
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
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
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
