/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entities.Sheetmusic;
import entities.User;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.EJBMusic;

/**
 *
 * @author User
 */
public class UpdateSheet extends HttpServlet {

     @EJB EJBMusic ejb;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if Sheet was edited or needs editing
        if ((request.getParameter("save")) != null) {
            
            // Get Sheet data from editing form
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String artist = request.getParameter("artist");
            boolean printed = request.getParameter("printed") != null;
            String instrument = request.getParameter("instrument");
            String genre = request.getParameter("genre");
            String difficulty = request.getParameter("difficulty");
            User owner = (User) request.getSession().getAttribute("user");
            Sheetmusic sheet = new Sheetmusic(id, title, artist, instrument, genre, difficulty, printed, owner);
            
            // Update Sheet in database
            ejb.updateSheet(sheet);
            
            // Give User feedback
            request.setAttribute("status", "Sheet successfully edited");
            request.getRequestDispatcher("/feedback.jsp").forward(request, response);
            
        } else {
            
            // Get Sheet to edit
            int sheetToEditId = Integer.valueOf(request.getParameter("edit"));
            Sheetmusic sheet = ejb.selectSheetByID(sheetToEditId);

            // Present with Sheet editing screen
            request.setAttribute("sheet", sheet);
            request.getRequestDispatcher("/editSheet.jsp").forward(request, response);
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
