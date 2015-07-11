/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.userBean;
import classes.sql;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class generarHTML extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected ServletConfig config;
    protected Connection con = sql.conectar();
    protected String sqlST = "call insertarArticulo(?,?,?,?,?,?)";
    protected Date tiempo = new Date();
    protected SimpleDateFormat ft = new SimpleDateFormat("dd'-de-'MM'-del-'yyyy'-'hh'-'mm'-'ss-a");
  
    public void init(ServletConfig config) throws ServletException{
        this.config = config;
        super.init(this.config);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        userBean usuario = (userBean)session.getAttribute("userData");
        String email = usuario.getEmail();
        String title = request.getParameter("title");
        String code = request.getParameter("code");
        String section = request.getParameter("section");
        //title = title.replaceAll(" ", "-");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String path = crearHTML(email, title, code, section);
            PreparedStatement ps = con.prepareStatement(sqlST);
          
            ps.setString(1,email); //correo
            if(section.equalsIgnoreCase("articulos")){ //tipo de contenido
                ps.setInt(2,1); 
            }else{
                if(section.equalsIgnoreCase("preguntas"))
                ps.setInt(2,2);
            }
            ps.setInt(3,5); //valoracion
            ps.setString(4, title); //titulo
            ps.setString(5, ft.format(tiempo.getTime())); //fecha
            ps.setString(6, path); //url
            ps.executeUpdate();
            out.print("<h1 style='color:white'>APORTE REALIZADO CORRECTAMENTE</h1>");
            
           
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    protected String crearHTML(String email, String title, String code,String section) throws IOException{
        String finalDir = "";
        title = title.replaceAll(" ", "_");
        File dir;
        String artDir = config.getServletContext().getRealPath("/articulos/");
        artDir = artDir+"/";
        String pregDir = config.getServletContext().getRealPath("/preguntas/");
        pregDir = pregDir+"/";
        File file = null;
        FileWriter fw;
        String fileName = "";
        if(section.equalsIgnoreCase("articulos")){
            dir = new File(artDir);
            dir.mkdirs();
            fileName = (email+"-"+title+"-"+(ft.format(tiempo))+".html");
            file = new File(artDir,fileName);
            System.out.println(file.getAbsolutePath());
            file.createNewFile();
        }else{
            if(section.equalsIgnoreCase("preguntas")){
                dir = new File(pregDir);
                dir.mkdirs();
                fileName = (email+"-"+title+"-"+(ft.format(tiempo))+".html");
                file = new File(pregDir,fileName);
                file.createNewFile();
            }
        }
        fw = new FileWriter(file, false);
        fw.write(code);
        fw.close();
        return finalDir = fileName;
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
