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
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ivan
 */
public class login extends HttpServlet {

    Connection con = null;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param config servlet config
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        con = sql.conectar();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            userBean usuario = new userBean();
            usuario.setEmail(request.getParameter("email"));
           
            usuario.setPassword(request.getParameter("pass"));

            usuario.setAutenticated(validate(usuario));
            System.out.println(usuario.isAutenticated()+" autenticado");
            if(usuario.isAutenticated()){
              
                usuario = getUserData(usuario);
                System.out.println(usuario.getGrupo()+" grupo");
                session.setAttribute("tipo", usuario.getUserType());
                session.setAttribute("nickname", usuario.getUserName());
                session.setAttribute("email", usuario.getEmail());
                session.setAttribute("userData", usuario);
                out.println("<script> window.top.window.location.reload();alert('Sesion iniciada con éxito');</script>");
            }else{
                if(!usuario.isAutenticated()){
                    
                    session.setAttribute("tipo", "Anonimo");
                    usuario.setEmail(null);
                    usuario.setPassword(null);
                    usuario.setAutenticated(false);
                    response.sendError(401,"Usuario o contraseña incorrecta");
                }
            }
        }
    }
    protected userBean getUserData(userBean usuario){
        try{
            
            PreparedStatement ps = con.prepareStatement("call getDatosUser(?)");
            ps.setString(1, usuario.getEmail());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                usuario.setEmail(rs.getString(1));
                usuario.setUserName(rs.getString(2));
                usuario.setUserType(rs.getString(3));
                usuario.setInstitucion(rs.getString(4));
            }
            
            if(usuario.getUserType().equals("Alumno")){
               PreparedStatement ps1 = con.prepareStatement("call getGrupo(?)");
               ps1.setString(1, usuario.getEmail());
               ResultSet rs1 = ps1.executeQuery();
               while(rs1.next()){
                   usuario.setGrupo(rs1.getString(1));
               }
                
            }
        }catch(Exception e){
            e.printStackTrace();
           
        }
        return usuario;
    }
    protected boolean validate(userBean usuario){
        boolean valid = false;
        try{ 
        int validInt = 0;
        PreparedStatement ps = con.prepareStatement("call loginCheck(?,?)");
        ps.setString(1, usuario.getEmail());
        ps.setString(2, usuario.getPassword());
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            validInt = rs.getInt(1);
        }
        if(validInt == 0){
            valid = false;
        }else{
            if(validInt == 1){
                valid = true;
            }
        }
        }catch(Exception e){
            e.printStackTrace();
        }
         return valid; 
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
