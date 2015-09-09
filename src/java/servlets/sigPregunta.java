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
                            out.println("<html>");
                            out.println("<head>");
                            out.println("<link href='../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css' rel='stylesheet' type='text/css'/>");
                            out.println("<script src=\"../js/jquery-1.11.3.min.js\"></script>");
                            out.println("<link rel=\"stylesheet\" href=\"../css/estilo_menu.css\">");
                            out.println("</head>");
                            out.println("<body>");
                            out.println("<section class='bg bgtest'></section>");
                            out.println("<style>body{background-color: #141414}</style>");
                            out.println("<center><h1 style='color: #ecf0f1'>RESULTADOS</h1></center>");
                            out.println("<section class='container' style='margin: 4em'>");
                            String calificame[] = sim.getCorrectas();
                            int pregC = 0, pregI = 0;
                            ArrayList<String> pregC_array = new ArrayList(), pregI_array = new ArrayList();
                            for(int i = 0; i<calificame.length; i++){
                                System.out.println(calificame[i]);
                                System.out.println(request.getParameter("ansFinal"+(i+1)));
                                if(calificame[i].equals(request.getParameter("ansFinal"+(i+1)))){
                                    pregC_array.add(sim.getPreguntas()[i]);
                                    pregC += 1;
                                }else{
                                    pregI_array.add(sim.getPreguntas()[i]);
                                    pregI += 1;
                                }
                            }
                            out.println("<h2>Numero de preguntas contestadas correctamente: "+pregC+"</h2>");
                            out.println("<h2>Numero de preguntas contestadas incorrectamente: "+pregI+"</h2>");
                            out.println("<h2>Preguntas contestadas correctamente:</h2>");
                            for(int i = 0; i<pregC_array.size(); i++){
                                out.println("<h3>"+pregC_array.get(i)+"</h3>");
                            }
                            out.println("<h2>Preguntas contestadas incorrectamente:</h2>");
                            for(int i = 0; i<pregI_array.size(); i++){
                                out.println("<h3>"+pregI_array.get(i)+"</h3>");
                            }
                            out.println("<button onclick=\"window.location.href = '../jsp/todo_simulExam.jsp';\" class='btn btn-success'>Terminar Simulador</button>");
                            out.println("</section>");
                            out.println("</body>");
                            out.println("</html>");
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
