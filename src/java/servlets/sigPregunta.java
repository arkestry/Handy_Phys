/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Simulador;
import classes.serializar;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ivan-hdz
 */
public class sigPregunta extends HttpServlet {

    private ServletConfig config;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void init(ServletConfig config) throws ServletException{
        this.config = config;
        super.init(this.config);
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Simulador sim = (Simulador) serializar.getObject(new FileInputStream(config.getServletContext().getRealPath("/simuladores/")+"/"+request.getParameter("url")));
            int num = Integer.parseInt(request.getParameter("cual"));
            if(request.getParameter("tipo").equals("preg")){
                String[] preguntas = sim.getPreguntas();
                out.println(preguntas[num]);
            }else{
                if(request.getParameter("tipo").equals("resp")){
                    String[][] resTodas = sim.getRespuestas();
                    String[] resP = new String[4];
                    for(int i = 0; i < 4; i++){
                        resP[i] = resTodas[num][i];
                    }
                    out.println("<label><label id='respA'></label><input type='radio' class='radio radio-inline' name='resp' value='a'>"+resP[0]+"</label><label><label id='respB'></label><input type='radio' class='radio radio-inline' name='resp' value='b'>"+resP[1]+"</label><label><label id='respC'></label><input type='radio' class='radio radio-inline' name='resp' value='c'>"+resP[2]+"</label><label><label id='respD'></label><input type='radio' class='radio radio-inline' name='resp' value='d'>"+resP[3]+"</label>");
                }
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(sigPregunta.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(sigPregunta.class.getName()).log(Level.SEVERE, null, ex);
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
