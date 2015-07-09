/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author S-S
 */
public class ReceiveImageData extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        
        //Redirect to /index.jsp
        response.sendRedirect(request.getContextPath() + "/index.jsp");
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

        //Get all values with name = c
        String values[] = request.getParameterValues("c");

        //Set writer
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (values != null) {

            String rawCoordinates = "";

            //Print each value for name = c
            //Assemble simulated rawStrings string
            out.println("Coordinates:");
            for (String value : values) {
                out.println("<br/> " + value);
                rawCoordinates += value;
            }
            
            out.println("<br/>");
            out.println("Raw Coordinates XD: <br/>" + rawCoordinates);
            
            //Print coordinates splitted from rawCoordinates
            out.println("<br/>Splitted coordinates: <br>");
            for (String retval : rawCoordinates.split(Pattern.quote("."))) {
                out.println("<br/>" + retval);
            }

            //Creates a LinkedList
            LinkedList<String> list = new LinkedList<String>();

            //Create a session
            request.getSession().invalidate();
            HttpSession session = request.getSession(true);
            
            //Add splitted coordinates to list
            for (String pair : rawCoordinates.split(Pattern.quote("."))) {
                list.addLast(pair);
            }
            
            //Add lsit to session
            session.setAttribute("coordinates", list);

        } else {
            out.println("Values is null :(");
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
    }
// </editor-fold>

}
