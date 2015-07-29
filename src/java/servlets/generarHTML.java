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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
       
        request.setCharacterEncoding("UTF-8"); //Con esto se arregla el problema de los acentos
        response.setContentType("text/html; charset=utf-8"); // "" ""
        
        HttpSession session = request.getSession();
        userBean usuario = (userBean)session.getAttribute("userData");
        String email = usuario.getEmail();
        String title = "";
        String[] datos;
        String code = "";
        try{
            title = request.getParameter("title");
            code = request.getParameter("code");
        }catch(Exception e){}
        
        String redirect = "";
        boolean malasPalabras = false;
        try (PrintWriter out = response.getWriter()) {
            
            PreparedStatement ps0 = con.prepareStatement("select * from verBlacklist"); //validar codigo con blacklist
            ResultSet rs = ps0.executeQuery();
            while(rs.next()){
                if(code.contains(rs.getString(2)) && (rs.getBoolean(3) == true)){
                    malasPalabras = true;
                }
            }
            if(malasPalabras == false){
                String path = "";
                String section = request.getParameter("section");
                if(section == null){
                    section = "examenes";
                }
                System.out.println(section);
                if(section.equalsIgnoreCase("articulos") || section.equalsIgnoreCase("preguntas")){
                    path = crearHTML(email, title, code, section);
                    
                }else{
                    if(section.equalsIgnoreCase("examenes")){
                        datos = subirExamen(request);
                        title = datos[0];
                        path = datos[1];
                    }
                }
                PreparedStatement ps = con.prepareStatement(sqlST);
                ps.setString(1,email); //correo
                if(section.equalsIgnoreCase("articulos")){ //tipo de contenido
                    ps.setInt(2,1); 
                    redirect = "../jsp/todo_articulos.jsp";
                }else{
                    if(section.equalsIgnoreCase("preguntas")){
                        ps.setInt(2,2);
                        redirect = "../jsp/todo_preguntas.jsp";
                    }else{
                        if(section.equalsIgnoreCase("examenes")){
                            ps.setInt(2,3);
                            redirect = "../jsp/examenes.jsp";
                        }
                    }
                }
                ps.setInt(3,0); //valoracion
                ps.setString(4, title); //titulo
                ps.setString(5, ft.format(tiempo.getTime())); //fecha
                ps.setString(6, path); //url
                ps.executeUpdate();
                response.sendRedirect(redirect);
            }else{
                if(malasPalabras == true){
                    out.println("<script> alert('Has introducido una palabra que esta bloqueada, favor de cambiarla'); </script>");
                    
                }
            }
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
    
    protected String[] subirExamen(HttpServletRequest request) throws FileUploadException, Exception{
        String datos[] = new String[2];
        String examDir = config.getServletContext().getRealPath("/examenes/")+"/";
        File dir = new File(examDir);
        dir.mkdirs();
        
        DiskFileItemFactory fabrica = new DiskFileItemFactory();
        fabrica.setSizeThreshold(1024);
        fabrica.setRepository(dir);
        
        ServletFileUpload upload = new ServletFileUpload(fabrica);
        List<FileItem> partes = upload.parseRequest(request);
        
        
        for(FileItem item : partes)
        {
            if(item.isFormField()){
                datos[0] = item.getString();
                System.out.println(item.getString());
            }else{
                System.out.println("Subiendo");
                File archivo = new File(examDir, item.getName());
                item.write(archivo);
                datos[1] = item.getName();
               
            }
        }
        return datos;
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
