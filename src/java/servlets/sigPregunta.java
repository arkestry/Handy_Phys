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
        response.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            Simulador sim = (Simulador) serializar.getObject(new FileInputStream(config.getServletContext().getRealPath("/simuladores/")+"/"+request.getParameter("url")));
            
            if(request.getParameter("tipo").equals("preg")){
                int num = Integer.parseInt(request.getParameter("cual"));
                String[] preguntas = sim.getPreguntas();
                if(num< preguntas.length){
                    out.println("<span id='cuantas' value='"+sim.getPreguntas().length+"' ></span>");
                    out.println(preguntas[num]);
                    System.out.println("Archivo abierto");
                    System.out.println("Preguntas enviadas");
                }
            }else{
                if(request.getParameter("tipo").equals("resp")){
                    int num = Integer.parseInt(request.getParameter("cual"));
                    String[] preguntas = sim.getPreguntas();
                    if(num< preguntas.length){
                        String[][] resTodas = sim.getRespuestas();
                        String[] resP = new String[4];
                        for(int i = 0; i < 4; i++){
                            resP[i] = resTodas[num][i];
                        }
                        out.println("<label><label id='respA'></label><input required type='radio' class='radio radio-inline' name='resp' value='a'> A) "+resP[0]+"</label><label><label id='respB'></label><input required type='radio' class='radio radio-inline' name='resp' value='b'> B) "+resP[1]+"</label><label><label id='respC'></label><input required type='radio' class='radio radio-inline' name='resp' value='c'> C) "+resP[2]+"</label><label><label id='respD'></label><input required type='radio' class='radio radio-inline' name='resp' value='d'> D) "+resP[3]+"</label>");
                        System.out.println("Respuestas enviadas");
                    }
                }else{
                    if(request.getParameter("tipo").equals("semiFin")){
                        int cuantos = Integer.parseInt(request.getParameter("index"));
                        out.println("<form method='POST' id='formu' action='../servlets/sigPregunta' >");
                        for(int i = 0; i < cuantos; i++){
                            out.println("<input type='hidden' name='ansFinal"+(i+1)+"' id='ansFinal"+(i+1)+"'/>");
                        }
                        out.println("<input type='hidden' name='tipo' value='fin'>");
                        out.println("<input type='hidden' name='url' id='url'>");
                        out.println("</form>");
                    }else{
                        if(request.getParameter("tipo").equals("fin")){ //Estilo de la pagina de resultados
                            System.out.println("Pasa por aqui");
                            out.println("<h1 style='color: #ecf0f1'>RESULTADOS</h1>");
                            String calificame[] = sim.getCorrectas();
                            for(int i = 0; i<calificame.length; i++){
                                System.out.println(calificame[i]);
                                System.out.println(request.getParameter("ansFinal"+(i+1)));
                                if(calificame[i].equals(request.getParameter("ansFinal"+(i+1)))){
                                    out.println("<center><h2 style='color: #3498db'>"+sim.getPreguntas()[i]+"</h2></center>");
                                }else{
                                     out.println("<center><h2 style='color: #e74c3c'>"+sim.getPreguntas()[i]+"</h2></center>");
                                
                                }
                            }
                        }
                    }
                }
            }   
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    private void responder(){
        
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
