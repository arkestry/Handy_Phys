/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import classes.sql;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alumno
 */
public class actualizarHTML extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ServletConfig config;
    @Override
    public void init(ServletConfig config) throws ServletException{
        this.config = config;
        super.init(this.config);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url, code ;
        url = request.getParameter("url");
        code = request.getParameter("code");
        ArrayList<String> palabrotas = new ArrayList();
        Connection con = sql.conectar();
        boolean malasPalabras = false;
        String redirect = "";
        try (PrintWriter out = response.getWriter()) {
            PreparedStatement ps0 = con.prepareStatement("select * from verBlacklist"); //validar codigo con blacklist
            ResultSet rs = ps0.executeQuery();
            while(rs.next()){
                if(code.contains(rs.getString(2)) && (rs.getBoolean(3) == true)){
                    malasPalabras = true;
                }
            }
            if(malasPalabras == false){
                
                actualizarHTML(url, code);
                if(request.getParameter("tipoCont").equals("1")){
                    response.sendRedirect("../jsp/todo_articulos.jsp");
                }else{
                    if(request.getParameter("tipoCont").equals("2")){
                        response.sendRedirect("../jsp/todo_preguntas.jsp");
                    }
                }
            }else{
                if(malasPalabras == true){
                    out.println("<script> alert('Has introducido una palabra que esta bloqueada, favor de cambiarla'); </script>");
                    
                }
            }
            
             
        }
    }
protected String actualizarHTML(String url, String code) throws IOException{
       
        File file = new File(url);
        FileWriter fw;
        fw = new FileWriter(file, false);
        fw.write(code);
        fw.close();
        return url;
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
            Logger.getLogger(actualizarHTML.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(actualizarHTML.class.getName()).log(Level.SEVERE, null, ex);
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
