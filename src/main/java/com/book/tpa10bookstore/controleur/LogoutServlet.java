package com.book.tpa10bookstore.controleur;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && Boolean.TRUE.equals(session.getAttribute("connected"))) {
            session.invalidate(); // Invalidate the existing session

            // Set the logout message in the request attribute
            request.setAttribute("message", "Vous êtes déconnecté(e).");

            // Redirect to the login page with the logout message
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // If no session exists, return a 409 Conflict status
            response.setStatus(HttpServletResponse.SC_CONFLICT);
        }
    }
}
