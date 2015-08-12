/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.userBean;
import classes.Upload;
import classes.sql;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ivan-hdz
 */
public class updatePhoto extends HttpServlet {

    private ServletConfig config;
    protected Date tiempo = new Date();
    protected SimpleDateFormat ft = new SimpleDateFormat("dd'-de-'MM'-del-'yyyy'-'hh'-'mm'-'ss-a");
  
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param config
     * @throws ServletException if a servlet-specific error occurs
     */
    @Override
    public void init(ServletConfig config) throws ServletException{
        this.config = config;
        super.init(this.config);
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            userBean usuario = (userBean)session.getAttribute("userData");
            String path = "/images/profileImages";
            String url = Upload.uploadImage(request, config, path);
            System.out.println("paso por aqui");
            Connection con = sql.conectar();
            PreparedStatement ps = con.prepareStatement("call updatePhoto(?,?);");
            ps.setString(1, usuario.getEmail());
            ps.setString(2, url);
            ps.executeUpdate();
            usuario.setProfilePict(url);
            session.setAttribute("userData",usuario);
            out.println(".."+path+"/"+url);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    private String uploadImage(HttpServletRequest request) throws FileUploadException, Exception{
        String url = "";
        String imgDir = config.getServletContext().getRealPath("/images/")+"/";
        File dir = new File(imgDir);
        dir.mkdirs();
        
        DiskFileItemFactory fabrica = new DiskFileItemFactory();
        fabrica.setSizeThreshold(1024);
        fabrica.setRepository(dir);
        
        ServletFileUpload upload = new ServletFileUpload(fabrica);
        List<FileItem> partes = upload.parseRequest(request);
        
        
        for(FileItem item : partes)
        {
            System.out.println("Subiendo");
            File archivo = new File(imgDir, item.getName());
            item.write(archivo);
            url = item.getName();
        }
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
        } catch (Exception ex) {
            Logger.getLogger(updatePhoto.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(updatePhoto.class.getName()).log(Level.SEVERE, null, ex);
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
