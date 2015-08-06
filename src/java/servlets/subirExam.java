/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.serializar;
import beans.Simulador;
import beans.userBean;
import classes.sql;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ivan-hdz
 */
public class subirExam extends HttpServlet implements Serializable{

    private ServletConfig config;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param config
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
       public void init(ServletConfig config) throws ServletException{
        this.config = config;
        super.init(this.config);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Connection con = sql.conectar();
            String titulo = request.getParameter("tituloExam");
            String descripcion = request.getParameter("descripcionExam");
            String parcial = request.getParameter("parcial");
            String unidad = request.getParameter("unidad");
            int cuantos = Integer.parseInt(request.getParameter("cuantos"));
            String[] preguntas = new String[cuantos];
            String[][] respuestas = new String[cuantos][4];
            String[] correctas = new String[cuantos];
            Simulador sim = new Simulador();
            //Hasta aqui declaracion de variables
            for(int i = 0; i < cuantos; i++){
                preguntas[i] = request.getParameter("pregunta"+(i+1));
                respuestas[i][0] = request.getParameter("respuesta"+(i+1)+".a");
                respuestas[i][1] = request.getParameter("respuesta"+(i+1)+".b");
                respuestas[i][2] = request.getParameter("respuesta"+(i+1)+".c");
                respuestas[i][3] = request.getParameter("respuesta"+(i+1)+".d");
                correctas[i] = request.getParameter("correcta"+(i+1));
            }
            sim.setPreguntas(preguntas);
            sim.setRespuestas(respuestas);
            sim.setCorrectas(correctas);
            //Hasta aqui guardamos objetos
            FileOutputStream archivo = new FileOutputStream(config.getServletContext().getRealPath("/simuladores/")+"/"+titulo.replaceAll(" ", "_")+".sml");
            serializar.saveObject(archivo, sim);
            //Hasta aqui la serializada
            PreparedStatement ps = con.prepareStatement("call insert_simulador(?,?,?,?,?)");
            ps.setString(1, titulo);
            ps.setString(2, descripcion);
            ps.setInt(3, Integer.parseInt(parcial));
            ps.setInt(4, Integer.parseInt(unidad));
            ps.setInt(5, ((userBean)session.getAttribute("userData")).getIdUsuario());
            ps.executeUpdate();
            response.sendRedirect("../jsp/todo_simulExam.jsp");
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
            Logger.getLogger(subirExam.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(subirExam.class.getName()).log(Level.SEVERE, null, ex);
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
