/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
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
    @Override
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("email");
        String title = request.getParameter("title");
        String code = request.getParameter("code");
        String section = request.getParameter("section");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String path = crearHTML(email, title, code, section);
            out.println(path);
        }
    }
    protected String crearHTML(String email, String title, String code,String section) throws IOException{
        String finalDir = "";
        Date tiempo = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("-MM-dd-yyyy-hh:mm:ss-a");
        File dir;
        String artDir = "articulos/";
        String pregDir = "preguntas/";
        File file = null;
        FileWriter fw;
        String fileName;
        if(section.equalsIgnoreCase("articulos")){
            dir = new File(artDir);
            dir.mkdirs();
            fileName = (email+"-"+title+(ft.format(tiempo))+".html");
            file = new File(artDir+fileName);
            file.createNewFile();
        }else{
            if(section.equalsIgnoreCase("preguntas")){
                dir = new File(pregDir);
                dir.mkdirs();
                fileName = (email+"-"+title+(ft.format(tiempo))+".html");
                file = new File(pregDir+fileName);
                file.createNewFile();
            }
        }
        fw = new FileWriter(file, true);
        fw.write(code);
        fw.close();
        return finalDir = file.getAbsolutePath();
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
